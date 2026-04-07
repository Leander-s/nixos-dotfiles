{ pkgs, ... }:

{
  extraPackages = with pkgs; [
    teams-for-linux
  ];

}
