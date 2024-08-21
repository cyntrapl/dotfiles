{
  colorschemes.dracula.enable = true;
  plugins = {
    neocord.enable = true;
    nvim-autopairs = {
      enable = true;
      settings.checkTs = true;
    };
    lightline.enable = true;
    nvim-tree = {
      enable = true;
      openOnSetupFile = true;
      autoReloadOnWrite = true;
      updateFocusedFile.enable = true;
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
    crates-nvim.enable = true;
    bacon.enable = true;
    rust-tools.enable = true;
    comment.enable = true;
    sleuth.enable = true;
    illuminate = {
      enable = true;
      underCursor = true;
    };
    navic = {
      enable = true;
      highlight = true;
      lsp.autoAttach = true;
    };
    nvim-colorizer.enable = true;
    vim-matchup = {
      enable = true;
      enableSurround = true;
      enableTransmute = true;
      treesitterIntegration.enable = true;
    };
    mini = {
      enable = true;
      modules = {
        ai = { };
        surround = { };
      };
    };
    harpoon.enable = true;
  };
}
