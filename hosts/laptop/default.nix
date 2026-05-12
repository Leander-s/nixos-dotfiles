# hosts/desktop/default.nix
{ ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/hardware/gpu.nix
  ];

  my.gpu.vendor = "amd";

  system.stateVersion = "25.11";

}
