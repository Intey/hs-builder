IMAGENAME ?= hs-builder

.PHONY: test

test: image
	@docker run -it --rm -v.:/build ${IMAGENAME} /build/Task1Spec.hs -- -f specdoc

image: Dockerfile
	@docker build --rm -t ${IMAGENAME} . --build-arg=RESOLVER=lts-23.0
