Install serena if getting error while starting serena MCP: uv tool install serena-agent

To add custom GPT: https://chatgpt.com/gpts/editor

Add "servers": ["url": "<cloudflared_url>"], as the first line in <cloudflared_url>/openapi.json

Commands to run powershell script
Set-ExecutionPolicy -Scope Process Bypass
.\start-serena-gpt.ps1


Tunnel/expose localhost:8000 using tailscale (cloudflared alternative)
tailscale serve --bg 9121
tailscale funnel --bg 9121

Check status
tailscale funnel status

You should see something like:
# Funnel on:
https://your-machine.your-tailnet.ts.net
|-- proxy http://127.0.0.1:9121

Disable funnel
tailscale funnel --https=443 off
tailscale serve --https=443 off
