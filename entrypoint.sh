#!/bin/sh
set -e
PORT="${PORT:-8080}"
XRAY_UUID="${XRAY_UUID:-cf623868-f8f1-42a3-8528-74a9baa76a6d}"
WS_PATH="${WS_PATH:-ws}"
WS_PATH="${WS_PATH#/}"
sed -e "s/__PORT__/${PORT}/g" \
    -e "s/__UUID__/${XRAY_UUID}/g" \
    -e "s/__WSPATH__/${WS_PATH}/g" \
    /etc/xray/config.json.template > /etc/xray/config.json
exec xray run -config /etc/xray/config.json
