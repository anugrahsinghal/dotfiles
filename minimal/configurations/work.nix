{
  pkgs,
  inputs,
  nixpkgs,
  ...
}: {
  imports = [
    ./common.nix
  ];

  # environment.variables = {
  #   NIX_SSL_CERT_FILE = "/Users/alex/.config/private/okta.pem";
  # };
  
}