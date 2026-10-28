# Changelog

As mudanças do servidor MCP do BotPlugin, da mais nova para a mais antiga.

## Próxima versão

- Blocos **ChatCenter V2** (`chatCenterNodeV2`) e **WaLeads V2** (`waleadsNodeV2`) no catálogo: dá para criar e editar pelo MCP, com as mesmas validações do bot.
- Transferência de operador nos dois aceita `sendByChannelId`, o canal do workspace que atende o cliente.
- Bloco **Template** do WhatsApp Oficial (`whatsAppTemplateNode`) no catálogo: a IA escolhe o template, preenche os parâmetros e liga as saídas, inclusive as dos botões de resposta rápida. Sem template, o bloco fica pendente e a resposta avisa.
- Ferramenta nova `listar_templates_whatsapp`: os templates da conta do canal, com as chaves de parâmetro e os botões, consultados pelo BotPlugin sem expor o token da Meta.

## 0.2.0 · outubro de 2026

- **Chave de todos os canais:** uma chave só para vários canais, gerada em **seu nome › Conectar IA (todos os canais)**. Vale para todos os canais, inclusive os novos, ou só para os escolhidos, e expira em 30 dias, 90 dias ou 1 ano.
- Nova ferramenta `listar_canais`, só na chave de todos os canais.
- Com essa chave, toda ferramenta recebe o parâmetro `canal`, e cada resposta termina com o nome do canal alterado.
- O acesso ao canal é conferido antes de cada ferramenta: quem sai de um canal perde o acesso a ele pelo MCP na hora.
- A chave de canal continua igual.

## 0.1.0 · outubro de 2026

Primeira versão pública.

- Servidor MCP remoto em `https://api.botplugin.com.br/mcp` (Streamable HTTP), com chave de acesso por canal.
- **Canal:** `ver_canal` e `servidor_cloud`.
- **Automações:** listar, ver, criar, atualizar, ligar e desligar.
- **Gatilhos e ativações:** entradas do canal, palavras-chave (inclusive comentários e respostas a stories no Instagram), webhooks e automações de anúncios.
- **Fluxo:** catálogo de blocos, `montar_fluxo`, `editar_fluxo` em lote, validação, versões e restauração.
- **Atendimentos:** `listar_atendimentos` com filtros por status, automação, contato e data.
- Segredos dos blocos ocultos para a IA e limites de uso por chave.
