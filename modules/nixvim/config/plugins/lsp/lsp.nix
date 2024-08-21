{
  plugins.lsp = {
    enable = true;
    servers = {
      clangd.enable = true;
      nil-ls.enable = true;
      bashls.enable = true;
      lua-ls.enable = true;
      rust-analyzer = {
        enable = true;
        installCargo = false;
        installRustc = false;
      };
      cssls.enable = true;
      html.enable = true;
      jsonls.enable = true;
      marksman.enable = true;
    };
  };

  plugins = {
    lsp-format.enable = true;
    inc-rename.enable = true;
  };
}
