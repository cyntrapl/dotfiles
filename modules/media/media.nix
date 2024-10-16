{ inputs, pkgs, lib, ... }:
{
  imports = [
    inputs.lobster.homeManagerModules.default
    inputs.jelly.homeManagerModules.default
  ];

  programs = {
    lobster.enable = true;
    jelly.enable = true;
  };
}
