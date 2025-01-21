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
