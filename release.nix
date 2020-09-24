let
  project = import ./default.nix {};
  reflex-platform = import ./dep/reflex-platform {};
  wasm-cross = reflex-platform.wasm-cross;
in {
  inherit wasm-cross;
  example-reflex-project-ghc = project.ghc.example-reflex-project;
  example-reflex-project-wasm = project.wasm.example-reflex-project;
  wasm-app = reflex-platform.build-wasm-app-wrapper
    "example-reflex-project" # Name of exe
    project.wasm.example-reflex-project
    {};
}