# This is your nixos configuration.
# For home configuration, see /modules/home/*
{ flake, pkgs, lib, ... }:

let
  inherit (flake) inputs;
  inherit (inputs) self;
in
{

  imports =
    with builtins;
    map
      (fn: ./${fn})
      (filter (fn: fn != "default.nix") (attrNames (readDir ./.)));
  # These users can add Nix caches.
  nix.settings.trusted-users = [ "root" "alex" ];

  services.openssh.enable = true;
}
