#!/bin/bash
# OpenCode Environment Configuration
# Source this file to set up proxy and environment variables for OpenCode

# Intel Proxy Configuration
export HTTP_PROXY="http://proxy-dmz.intel.com:912"
export HTTPS_PROXY="http://proxy-dmz.intel.com:912"
export http_proxy="http://proxy-dmz.intel.com:912"
export https_proxy="http://proxy-dmz.intel.com:912"

# No Proxy Settings
export NO_PROXY="localhost,127.0.0.1,.intel.com,intel.com,github.com,intel.github.com"
export no_proxy="localhost,127.0.0.1,.intel.com,intel.com,github.com,intel.github.com"

# Docker Proxy Configuration (for containers)
export DOCKER_BUILD_PROXY="http://proxy-dmz.intel.com:912"

# Python/Pip Proxy
export PIP_PROXY="http://proxy-dmz.intel.com:912"
export PIP_TRUSTED_HOST="proxy-dmz.intel.com"

# Git Configuration
export GIT_SSL_NO_VERIFY=1

# Conda Proxy
export CONDA_PROXY="http://proxy-dmz.intel.com:912"

# Additional Intel Network Settings
export INTEL_PROXY="http://proxy-dmz.intel.com:912"

# Function to verify proxy settings
verify_proxy() {
    echo "Current proxy settings:"
    echo "HTTP_PROXY: $HTTP_PROXY"
    echo "HTTPS_PROXY: $HTTPS_PROXY"
    echo "NO_PROXY: $NO_PROXY"
    echo ""
    echo "Testing proxy connectivity..."
    curl -s --max-time 5 http://www.google.com > /dev/null && echo "HTTP proxy: OK" || echo "HTTP proxy: FAILED"
    curl -s --max-time 5 https://www.google.com > /dev/null && echo "HTTPS proxy: OK" || echo "HTTPS proxy: FAILED"
}

# Uncomment to verify on source
# verify_proxy

echo "OpenCode environment loaded. Proxy configured for Intel network."
