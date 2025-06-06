{ flake, pkgs, lib, ... }:
let
  inherit (flake) inputs;
  inherit (inputs) self;
in
{
  imports = [
    self.homeModules.default
  ];
  home.username = "alex";
  home.homeDirectory = lib.mkDefault "/${if pkgs.stdenv.isDarwin then "Users" else "home"}/alex";
  home.stateVersion = "25.05";
}
