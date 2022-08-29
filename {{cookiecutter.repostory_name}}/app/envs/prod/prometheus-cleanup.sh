#!/bin/sh
{% if cookiecutter.monitoring == "y" %}
set -eu

if [ "$PROMETHEUS_MULTIPROC_DIR" != "" -a -d "$PROMETHEUS_MULTIPROC_DIR" ]; then
    # Delete prometheus metric files in PROMETHEUS_MULTIPROC_DIR, but not in its subdirectories to not interfere
    # with other processes
    find "$PROMETHEUS_MULTIPROC_DIR" -maxdepth 1 -type f -delete
fi
{% else %}
# No Prometheus clean up required as metrics are disabled.
{% endif %}
