{ pkgs ? import <nixpkgs> {}
}:
let commands = pkgs.lib.fix (self: pkgs.lib.mapAttrs pkgs.writeShellScript
{
    start-server = ''
        node server.js
    '';
    default = ''
        nix develop -c -- ${self.start-server}
    '';
});
in pkgs.symlinkJoin rec {
  name = "default";
  passthru.bin = pkgs.lib.mapAttrs pkgs.writeShellScriptBin commands;
  paths = pkgs.lib.attrValues passthru.bin;
}
