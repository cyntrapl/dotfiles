{
  colorschemes.dracula.enable = true;

  plugins = {
    neocord.enable = true;
    nvim-autopairs = {
      enable = true;
      settings.checkTs = true;
    };

    #treesitter
    treesitter = {
      enable = true;
      nixGrammars = true;
      indent = true;
    };
    treesitter-context = {
      enable = true;
      settings = {max_lines = 2;};
    };
    rainbow-delimiters.enable = true;

    lightline.enable = true;

    nvim-tree = {
      enable = true;
      openOnSetupFile = true;
      autoReloadOnWrite = true;
    };

    toggleterm = {
      enable = true;
      settings = {
        direction = "float";
        open_mapping = "[[<C-t>]]";
      };
    };

    which-key.enable = true;

    copilot-chat.enable = true;
    copilot-lua = {
      enable = true;
      suggestion.enabled = false;
      panel.enabled = false;
    };
  };
}
