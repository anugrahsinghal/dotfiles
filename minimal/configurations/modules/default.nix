{
  pkgs,
  inputs,
  ...
}:
{
  # import sub modules
  imports = [
    ./apps.nix
    ./host-users.nix
    ./nix-core.nix
    ./system.nix
  ];

}
