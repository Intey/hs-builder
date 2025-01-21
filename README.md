# hs-builder

Toolkit for easely test user code against specific test cases

# Usage
Place user source code in any haskell file. Download your project test specs.
Important! specs files should use correct import module, i.e. if user code is in
`UserTask1Source.hs` than spec file should contains `import UserTask1Source`.
Then just run it with image:

```sh
docker run -it --rm -v.:/test hs-builder /test/Task1Spec.hs
```

# Makefile

For test purposes. Running `make` just runs the `Task1Spec.hs` with `UserTask1Source.hs` like:
```sh
stack script --resolver lts-23.0 --package hspec --silent Task1Spec.hs
```
you can customize resolver in Makefile - change the docker build-arg to something like `RESOLVER=lts-23.5`.
