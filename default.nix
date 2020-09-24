{ reflex-platform ? import ./dep/reflex-platform {}
} :

reflex-platform.project ({ pkgs, ... }: {
  packages = {
    example-reflex-project = pkgs.lib.cleanSource ./.;
  };

  shells = {
    ghc = ["example-reflex-project"];
    wasm = ["example-reflex-project"];
  };

  # These overrides are a HACK needed because the cabal2nix does not detect
  # the dependencies properly for wasm
  # overrides = (self: super: {
  #   example-reflex-project = if super.reflex-warp == null
  #     then with pkgs.haskell.lib; overrideCabal (enableCabalFlag super.example-reflex-project "wasm32") (drv: {
  #         libraryHaskellDepends = (drv.libraryHaskellDepends or []) ++ [ self.reflex-wasm ];
  #       })
  #     else super.example-reflex-project;
  # });
})