# Example Reflex Project

This example demonstrates how to compile a simple Reflex app with `GHC` and `WebGHC` using `reflex-platform`

## Using GHC

By default reflex creates a desktop app using WebKitGTK2

```
nix-build -A ghc.example-reflex-project -o result-ghc
./result-ghc/bin/example-reflex-project
```

## Using WebGHC

Build the project to obtain the WebAssembly executable

```
nix-build -A wasm.example-reflex-project -o result-wasm
```

The `release.nix` has a `wasm-app` target to package the generated WebAssembly executable with the JS files from `webabi`.

In addition to that this also calls `wasm-strip` and `wasm-opt` to reduce the size of the binary.

```
nix-build release.nix -A wasm-app -o result-wasm-app
cd ./result-wasm-app
hserv -p8000
```

Then open http://localhost:8000

