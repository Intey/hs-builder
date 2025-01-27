# hs-builder

Toolkit for easely test user code against specific test cases

# Usage
Place user source code in any haskell file. Download your project test specs.
Important! specs files should use correct import module, i.e. if user code is in
`UserTask1Source.hs` than spec file should contains `import UserTask1Source`.
Then just run it with image:

```sh
docker run -it --rm -v.:/test hs-builder /test/example/Task1Spec.hs
```

# Makefile

For test purposes. 
Running `make` run the `example/Task1Spec.hs` with `example/UserTask1Source.hs` in docker image
`hs-builder`. If that image not was previously built - it will build that image
first with default resolver

You can customize resolver in Makefile - change the docker build-arg to
something like `RESOLVER=lts-23.5`. Then just remove .image.timestamp (build
optimization file) and run `make`.
If you want check another file - run `make TESTNAME=$FILENAME` 
