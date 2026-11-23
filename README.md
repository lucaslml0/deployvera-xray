# deployvera-xray

Generic Xray container for DeployVera's free plan (1 app, no card, no idle sleep).

The container listens on `0.0.0.0:$PORT` (the port DeployVera assigns) and serves
VLESS over WebSocket at `$WS_PATH` (default `/xray`). TLS is terminated by
DeployVera's HTTPS endpoint in front of the container.

## Configuration

Set these environment variables in the DeployVera panel — nothing secret is
committed to this repo:

| Variable | Required | Description |
| --- | --- | --- |
| `UUID` | yes | VLESS client UUID (randomly generated) |
| `PORT` | no | Listen port, set by DeployVera (default `8080`) |
| `WS_PATH` | no | WebSocket path (default `/xray`) |

## Client

`vless://<UUID>@<your-app>.deployvera.com:443?encryption=none&security=tls&type=ws&path=/xray`
