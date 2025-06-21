{
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    ./common.nix
  ];
  environment.systemPackages = with pkgs; [
    git
  ];
}
