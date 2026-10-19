# API da OpenAI (Responses). Troque o modelo pelo que você usa.
curl https://api.openai.com/v1/responses \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $OPENAI_API_KEY" \
  -d '{
    "model": "gpt-5",
    "input": "Liste as automações do meu canal",
    "tools": [{
      "type": "mcp",
      "server_label": "botplugin",
      "server_url": "https://api.botplugin.com.br/mcp",
      "headers": { "Authorization": "Bearer SUA_CHAVE" },
      "require_approval": "never"
    }]
  }'
