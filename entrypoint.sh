#!/bin/sh
set -eu
PORT="${PORT:-8080}"
WS_PATH="${WS_PATH:-/xray}"
if [ -z "${UUID:-}" ]; then echo "UUID env var is required" >&2; exit 1; fi
mkdir -p /etc/xray
cat > /etc/xray/config.json <<EOF
{
  "inbounds": [
    {
      "port": $PORT,
      "listen": "0.0.0.0",
      "protocol": "vless",
      "settings": {
        "clients": [{ "id": "$UUID" }],
        "decryption": "none"
      },
      "streamSettings": {
        "network": "ws",
        "wsSettings": { "path": "$WS_PATH" }
      }
    }
  ],
  "outbounds": [{ "protocol": "freedom" }]
}
EOF
exec /usr/local/bin/xray run -config /etc/xray/config.json
