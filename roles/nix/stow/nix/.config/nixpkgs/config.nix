{
  packageOverrides = pkgs: with pkgs; {
    all = pkgs.buildEnv {
      name = "all";
      paths = [
        emacs
      ];
    };
  };
}
