FROM haskell:9
ARG RESOLVER=lts-23.0
RUN stack install --install-ghc --resolver ${RESOLVER} hspec

# inject it there, to control RESOLVER in one file
RUN cat > /usr/local/bin/entrypoint.sh <<EOF
#!/usr/bin/env bash
set -e
stack script --resolver ${RESOLVER} --package hspec --silent "\$@"
EOF
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
