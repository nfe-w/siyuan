#!/bin/sh
set -e

WORKSPACE_DIR="/siyuan/workspace"

# Parse command line arguments for --workspace option or SIYUAN_WORKSPACE_PATH env variable
# Store other arguments in ARGS for later use
if [[ -n "${SIYUAN_WORKSPACE_PATH}" ]]; then
    WORKSPACE_DIR="${SIYUAN_WORKSPACE_PATH}"
fi
ARGS=""
while [[ "$#" -gt 0 ]]; do
    case $1 in
        --workspace=*) WORKSPACE_DIR="${1#*=}"; shift ;;
        *) ARGS="$ARGS $1"; shift ;;
    esac
done

echo "Starting Siyuan without specifying a user in workspace ${WORKSPACE_DIR}"
exec /opt/siyuan/kernel --workspace="${WORKSPACE_DIR}" ${ARGS}
