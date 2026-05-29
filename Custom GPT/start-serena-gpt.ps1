# Configuration

$ApiKey = "8f3c1d7a4b924e7b9d2c6f1a8e5b0c3d7f9a2b4c6d8e1f3a5b7c9d1e2f4a6b8"
$Port = 8000

Write-Host ""
Write-Host "========================================"
Write-Host " Serena + MCP + mcpo + Cloudflare Setup "
Write-Host "========================================"
Write-Host ""

# Verify uv exists

if (-not (Get-Command uvx -ErrorAction SilentlyContinue)) {
Write-Host "uvx not found."
Write-Host "Install uv first:"
Write-Host "winget install --id=astral-sh.uv -e"
exit 1
}

# Verify cloudflared exists

if (-not (Get-Command cloudflared -ErrorAction SilentlyContinue)) {
Write-Host "cloudflared not found."
Write-Host "Install cloudflared:"
Write-Host "winget install --id Cloudflare.cloudflared"
exit 1
}

Write-Host "Project Path:"
Write-Host $PWD
Write-Host ""

Write-Host "Starting Serena MCP through mcpo..."
Start-Process powershell `
-ArgumentList "-NoExit","-Command","uvx mcpo --port $Port --api-key $ApiKey -- serena start-mcp-server --context chatgpt --project '$PWD'"

Start-Sleep -Seconds 5

Write-Host ""
Write-Host "Starting Cloudflare Tunnel..."
Write-Host ""

cloudflared tunnel --url http://localhost:$Port








# Install serena if getting error while starting serena MCP: uv tool install serena-agent
# To add custom GPT: https://chatgpt.com/gpts/editor
# Add "servers": ["url": "<cloudflared_url>"], as the first line in <cloudflared_url>/openapi.json
