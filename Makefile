IMAGENAME ?= hs-builder

TESTNAME ?= Task1Spec.hs
.PHONY: test

test: .image.timestamp
	@docker run -it --rm -v.:/build ${IMAGENAME} /build/${TESTNAME} -- -f simple

# this will prevent trigger dockre build when Dockerfile not changed
# I know, docker build is idempotent, but it is waste a little time
.image.timestamp: Dockerfile
	docker build --rm -t ${IMAGENAME} . --build-arg=RESOLVER=lts-23.0
	@touch .image.timestamp
