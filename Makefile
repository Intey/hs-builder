IMAGENAME ?= hs-builder

.PHONY: test

test: .image.timestamp
	@docker run -it --rm -v.:/build ${IMAGENAME} /build/Task1Spec.hs -- -f specdoc

.image.timestamp: Dockerfile
	docker build --rm -t ${IMAGENAME} .
	@touch .image.timestamp
