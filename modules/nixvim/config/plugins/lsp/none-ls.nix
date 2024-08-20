{
  plugins.none-ls = {
    enable = true;

    sources = {
      code_actions = {
        statix.enable = true;
      };

      diagnostics = {
        fish.enable = true;
        deadnix.enable = true;
        trail_space.enable = true;
        write_good.enable = true;
        codespell.enable = true;
        pylint.enable = true;
        mypy.enable = true;
        statix.enable = true;
        stylelint.enable = true;
        sqlfluff.enable = true;
        dotenv_linter.enable = true;
        markdownlint.enable = true;
      };

      formatting = {
        alejandra.enable = true; # nix
        shfmt.enable = true;
        black.enable = true;
        isort.enable = true;
        prettier.enable = true;
        prettier.disableTsServerFormatter = true;
        typstfmt.enable = true;
      };
    };
  };
}
