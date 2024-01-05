{ pkgs }:
let
  emacsVersion = pkgs.emacs29-pgtk;
  emacsWith = (pkgs.emacsPackagesFor emacsVersion).emacsWithPackages;
  emacsPackages = epkgs:
    (with epkgs.melpaPackages; [
      which-key
      envrc
      magit
      corfu
      olivetti
      nix-mode
    ]);
in emacsWith emacsPackages
