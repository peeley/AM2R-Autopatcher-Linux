{ pkgs ? import <nixpkgs> {} }:

(pkgs.buildFHSEnv {
    name = "am2r-run";

    multiArch = true;

    multiPkgs = pkgs: with pkgs; [
        (lib.getLib stdenv.cc.cc)
        xorg.libX11
        xorg.libXext
        xorg.libXrandr
        xorg.libXxf86vm
        curl
        libGLU
        libglvnd
        openal
        zlib
        openssl_1_1
      ];

    # runScript = pkgs.writeShellScript "am2r-run" ''
    #   exec -- "$1" "$@"
    # '';
}).env
