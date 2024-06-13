{
  description = "AARCH64 binutils provided by ARM";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/24.05";
  };

  outputs = {self, nixpkgs}: {
    defaultPackage.x86_64-linux =
      with import nixpkgs { system = "x86_64-linux"; };

      stdenv.mkDerivation rec {
        name = "arm-gnu";
        rev = "28d5199f6db34e5980aae1062e5a6703";

        src = fetchurl {
          url = "https://developer.arm.com/-/media/Files/downloads/gnu/12.2.rel1/binrel/arm-gnu-toolchain-12.2.rel1-x86_64-aarch64-none-elf.tar.xz?rev=${rev}&hash=F6F5604BC1A2BBAAEAC4F6E98D8DC35B";
          sha256 = "sha256-YtZuCte9fyoYPSNu4wGlxzxzfIhseUSqTzlBWqtSja8=";
        };

        nativeBuildInputs = [
          autoPatchelfHook
        ];

        buildInputs = [
          ncurses5
          binutils
          stdenv.cc.cc.lib
          libxcrypt-legacy
        ];
        
        installPhase = ''
        runHook preInstall
        mkdir -p $out/bin
        install -m755 -D ./bin/aarch64-none-elf-c++ $out/bin/aarch64-none-elf-c++
        install -m755 -D ./bin/aarch64-none-elf-strip $out/bin/aarch64-none-elf-strip
        install -m755 -D ./bin/aarch64-none-elf-gprof $out/bin/aarch64-none-elf-gprof
        install -m755 -D ./bin/aarch64-none-elf-elfedit $out/bin/aarch64-none-elf-elfedit
        install -m755 -D ./bin/aarch64-none-elf-gfortran $out/bin/aarch64-none-elf-gfortran
        install -m755 -D ./bin/aarch64-none-elf-addr2line $out/bin/aarch64-none-elf-addr2line
        install -m755 -D ./bin/aarch64-none-elf-readelf $out/bin/aarch64-none-elf-readelf
        install -m755 -D ./bin/aarch64-none-elf-cpp $out/bin/aarch64-none-elf-cpp
        install -m755 -D ./bin/aarch64-none-elf-gdb $out/bin/aarch64-none-elf-gdb
        install -m755 -D ./bin/aarch64-none-elf-g++ $out/bin/aarch64-none-elf-g++
        install -m755 -D ./bin/aarch64-none-elf-lto-dump $out/bin/aarch64-none-elf-lto-dump
        install -m755 -D ./bin/aarch64-none-elf-gcc $out/bin/aarch64-none-elf-gcc
        install -m755 -D ./bin/aarch64-none-elf-gcov-dump $out/bin/aarch64-none-elf-gcov-dump
        install -m755 -D ./bin/aarch64-none-elf-ranlib $out/bin/aarch64-none-elf-ranlib
        install -m755 -D ./bin/aarch64-none-elf-strings $out/bin/aarch64-none-elf-strings
        install -m755 -D ./bin/aarch64-none-elf-as $out/bin/aarch64-none-elf-as
        install -m755 -D ./bin/aarch64-none-elf-gcc-ar $out/bin/aarch64-none-elf-gcc-ar
        install -m755 -D ./bin/aarch64-none-elf-objcopy $out/bin/aarch64-none-elf-objcopy
        install -m755 -D ./bin/aarch64-none-elf-gcov $out/bin/aarch64-none-elf-gcov
        install -m755 -D ./bin/aarch64-none-elf-ld $out/bin/aarch64-none-elf-ld
        install -m755 -D ./bin/aarch64-none-elf-nm $out/bin/aarch64-none-elf-nm
        install -m755 -D ./bin/aarch64-none-elf-size $out/bin/aarch64-none-elf-size
        install -m755 -D ./bin/aarch64-none-elf-c++filt $out/bin/aarch64-none-elf-c++filt
        install -m755 -D ./bin/aarch64-none-elf-gcc-12.2.1 $out/bin/aarch64-none-elf-gcc-12.2.1
        install -m755 -D ./bin/aarch64-none-elf-gcov-tool $out/bin/aarch64-none-elf-gcov-tool
        install -m755 -D ./bin/aarch64-none-elf-objdump $out/bin/aarch64-none-elf-objdump
        install -m755 -D ./bin/aarch64-none-elf-gcc-nm $out/bin/aarch64-none-elf-gcc-nm
        install -m755 -D ./bin/aarch64-none-elf-ld.bfd $out/bin/aarch64-none-elf-ld.bfd
        install -m755 -D ./bin/aarch64-none-elf-ar $out/bin/aarch64-none-elf-ar
        install -m755 -D ./bin/aarch64-none-elf-gcc-ranlib $out/bin/aarch64-none-elf-gcc-ranlib
        runHook postInstall
        '';
      };
  };
}
