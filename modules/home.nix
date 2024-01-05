{ config, pkgs, ... }:
let
  customEmacs = import ./emacs.nix { inherit pkgs; };
in
{
  home.username = "develop";
  home.homeDirectory = "/home/develop";
  
  programs.bash = {
    enable = true;
    enableCompletion = true;
    bashrcExtra = ''
      GREEN="\[$(tput setaf 2)\]"
      RESET="\[$(tput sgr0)\]"
      # export PS1="<''${GREEN}\w''${RESET}> "
      export PS1="\u''${GREEN}@''${RESET}\H''${GREEN}\''$''${RESET} "
    '';
    shellAliases = {
      ls = "eza --color=auto --git-ignore -a1";
      lt = "eza --color=auto --git-ignore -a1TL2";
      grep = "grep --color=auto";
    };
  };

  programs.lf = {
    enable = true;
    settings = {
      preview = true;
      hidden = true;
      drawbox = true;
      #icons = true;
      ignorecase = true;
    };
    extraConfig = ''
      set previewer ${pkgs.pistol}/bin/pistol
    '';
  };

  programs.neovim = {
    enable = true;
    extraPackages = with pkgs; [
      wl-clipboard
      #ripdrag
    ];
    plugins = with pkgs.vimPlugins; [
      { plugin = telescope-nvim; }
      (nvim-treesitter.withPlugins
        (plugins: with plugins; [
          tree-sitter-c
          tree-sitter-nix
          tree-sitter-vim
          tree-sitter-lua
          tree-sitter-rust
          tree-sitter-bash
        ]))
    ];
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    defaultEditor = true;
  };

  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    nix-direnv.enable = true;
  };
  
  programs.git = {
    enable = true;
    userName = "Victor Albertsson";
    userEmail = "github.301cs@silomails.com";
  };

  programs.emacs = {
    enable = true;
    package = customEmacs;
  };
  
  services.emacs = {
    enable = true;
    package = customEmacs;
    # defaultEditor = true;
  };

  services.ssh-agent.enable = true;

  home.file = {
    ".config/emacs/early-init.el".source = ../sources/emacs/early-init.el;
    ".config/emacs/init.el".source = ../sources/emacs/init.el;
  };

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    fira-code
    kakoune
    bat
    eza
    # TODO: Can these be moved to a per-project structure?
    binutils
    gcc
  ];

  # === === === #

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.
}
