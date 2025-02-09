FROM alpine:latest

# Install utilities for debugging
RUN apk add --no-cache bash coreutils grep

# Set working directory
WORKDIR /debug

#ENV GITHUB_WORKSPACE=/
RUN apk add tree


# Script to print container invocation details
RUN echo '#!/bin/sh' > /entrypoint.sh && \
    echo 'echo "### Command & Arguments ###"' >> /entrypoint.sh && \
    echo 'echo "Command: $0"' >> /entrypoint.sh && \
    echo 'echo "Arguments: $@"' >> /entrypoint.sh && \
    echo '' >> /entrypoint.sh && \
    echo 'echo "### Environment Variables ###"' >> /entrypoint.sh && \
    echo 'printenv | sort' >> /entrypoint.sh && \
    echo '' >> /entrypoint.sh && \
    echo 'echo "### Mounts ###"' >> /entrypoint.sh && \
    echo 'mount' >> /entrypoint.sh && \
    echo 'echo ""' >> /entrypoint.sh && \
    echo 'echo "### Files ###"' >> /entrypoint.sh && \
    echo 'ls -lah /' >> /entrypoint.sh && \
    echo 'echo ""' >> /entrypoint.sh && \
    echo 'ls -lah' >> /entrypoint.sh && \
    echo 'echo ""' >> /entrypoint.sh && \
    echo 'pwd' >> /entrypoint.sh && \
    echo 'echo ""' >> /entrypoint.sh && \
    echo 'ls -lah ${GITHUB_WORKSPACE}' >> /entrypoint.sh && \
    echo 'ls -lah /github' >> /entrypoint.sh && \
    echo 'echo ""' >> /entrypoint.sh && \
    echo 'tree . -a' >> /entrypoint.sh && \
    echo 'echo ""' >> /entrypoint.sh && \
    echo 'tree /github -a || echo "no /github folder"' >> /entrypoint.sh && \
    chmod +x /entrypoint.sh

# Set entrypoint to print the details
ENTRYPOINT ["/entrypoint.sh"]
CMD []
