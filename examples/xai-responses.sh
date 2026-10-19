# API da xAI (Grok). Troque o modelo pelo que você usa.
curl https://api.x.ai/v1/responses \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $XAI_API_KEY" \
  -d '{
    "model": "grok-4.7",
    "input": "Liste as automações do meu canal",
    "tools": [{
      "type": "mcp",
      "server_url": "https://api.botplugin.com.br/mcp",
      "server_label": "botplugin",
      "authorization": "SUA_CHAVE"
    }]
  }'
