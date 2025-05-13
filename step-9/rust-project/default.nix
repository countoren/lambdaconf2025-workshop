{ pkgs ? import <nixpkgs> {}
}:
pkgs.rustPlatform.buildRustPackage {
  name = "rust-cli";
  src = ./.;
  # cargoHash = "";
  cargoHash = "sha256-6tKckQvV/WMf+iD9vH1ezRlPzfpaM9WVDUEuU3C78DE=";
}
