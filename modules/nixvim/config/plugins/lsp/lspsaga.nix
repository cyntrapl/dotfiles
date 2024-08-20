{
  plugins.lspsaga = {
    enable = true;

    beacon.enable = true;
    implement = {
      enable = true;
      sign = false;
    };
    lightbulb.enable = false; #bugs out for some reason
    outline = {
      layout = "float";
    };
    symbolInWinbar.enable = true;
  };
}
