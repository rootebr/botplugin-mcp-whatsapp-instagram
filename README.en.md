<p align="center">
  <a href="https://botplugin.com.br">
    <img src="assets/banner.svg" alt="BotPlugin MCP: your AI builds your chatbot" width="100%">
  </a>
</p>

<p align="center">
  <a href="#connect"><img src="https://img.shields.io/badge/MCP-Streamable_HTTP-0CAF60?style=flat-square&labelColor=062016" alt="MCP Streamable HTTP"></a>
  <a href="docs/ferramentas.md"><img src="https://img.shields.io/badge/tools-24-0CAF60?style=flat-square&labelColor=062016" alt="24 tools"></a>
  <a href="#security"><img src="https://img.shields.io/badge/access-1_key_per_channel-0CAF60?style=flat-square&labelColor=062016" alt="One key per channel"></a>
  <a href="README.md"><img src="https://img.shields.io/badge/docs-PT--BR_%7C_EN-0CAF60?style=flat-square&labelColor=062016" alt="Docs in Portuguese and English"></a>
</p>

<p align="center">
  <a href="#what-your-ai-can-do"><b>What it does</b></a> ·
  <a href="#connect"><b>Connect</b></a> ·
  <a href="#client-guides"><b>Client guides</b></a> ·
  <a href="#tools"><b>Tools</b></a> ·
  <a href="#security"><b>Security</b></a> ·
  <a href="README.md"><b>Português</b></a>
</p>

<br>

**BotPlugin MCP** connects your favorite AI to your [BotPlugin](https://botplugin.com.br) channel. Instead of dragging blocks around the editor, you **ask** and the AI does it: it builds the conversation flow, creates automations, sets up keywords, triggers and webhooks, and checks today's conversations.

It works with any [Model Context Protocol](https://modelcontextprotocol.io) client. There is nothing to install: the server runs on BotPlugin's cloud, and you only paste the address and your key.

> [!NOTE]
> BotPlugin is a Brazilian platform, so tool names, parameters and the bots themselves are in Portuguese. Your AI understands them just fine, and you can talk to it in any language.

<p align="center">
  <img src="assets/ias.svg" alt="Works with Claude, ChatGPT, Gemini, Grok, Cursor, VS Code and Windsurf" width="100%">
</p>

---

## What your AI can do

<table>
  <tr>
    <td width="50%" valign="top">
      <img src="assets/demo-fluxo.jpg" alt="The AI building a flow with message, menu, question and condition blocks">
      <h3>Build the whole flow</h3>
      <p>Describe the conversation and the AI creates the blocks, wires them together and lays them out in the editor: messages, menus, questions, conditions, media, webhooks and more.</p>
    </td>
    <td width="50%" valign="top">
      <img src="assets/demo-ferramentas.jpg" alt="The AI calling BotPlugin tools one after another">
      <h3>Handle the rest by chat</h3>
      <p>Automations, keywords, entry triggers, webhooks, ads and conversation lookups. Everything that used to take a dozen clicks in the dashboard.</p>
    </td>
  </tr>
</table>

| Area | What you can ask |
|---|---|
| **Flows** | Build a flow from scratch, edit a block, change a menu, validate and restore versions |
| **Automations** | Create, rename, turn on and off |
| **Triggers** | Keywords, first contact, any incoming message, website chat opened, Instagram comments and story replies |
| **Integrations** | Webhooks that fire automations from another system, and automations for click-to-WhatsApp ads |
| **Conversations** | Who is being served right now, in which automation and at which block |
| **Channel** | Channel status, and start, stop or restart the Cloud server |

> [!TIP]
> Every change the AI makes to a flow becomes a **version**. Didn't like it? Ask the AI to restore the previous one.

---

## Connect

<p align="center">
  <img src="assets/passos.svg" alt="Three steps: generate the key, paste it into your AI and ask for anything" width="100%">
</p>

1. **Generate a key.** In the [BotPlugin dashboard](https://app.botplugin.com.br), open the channel, go to **Configurações do canal › Conectar IA** and click **Gerar chave**. Copy it right away: it is shown only once.
2. **Paste it into your AI.** Pick your AI on the same screen; the snippets come with your key already filled in. Or use the guides below.
3. **Ask.** Open a chat and say what you need. See [prompt examples](docs/exemplos.md) (in Portuguese).

| | Value |
|---|---|
| **Server URL** | `https://api.botplugin.com.br/mcp` |
| **Header** | `Authorization: Bearer YOUR_KEY` |

> [!NOTE]
> A key belongs to **one channel**. If you manage several channels, generate one key per channel and register each with a different name (e.g. `botplugin-pizzeria` and `botplugin-store`).

---

## Client guides

| AI | Where | Status |
|---|---|---|
| **Claude** | Claude Code, Claude Desktop | ![Works](https://img.shields.io/badge/Works-dcf5e8?style=flat-square) |
| | claude.ai (web) | ![Beta](https://img.shields.io/badge/Beta-fdf0d5?style=flat-square) |
| **ChatGPT / OpenAI** | Codex (CLI and app), Responses API | ![Works](https://img.shields.io/badge/Works-dcf5e8?style=flat-square) |
| | ChatGPT app | ![Not yet](https://img.shields.io/badge/Not_yet-eef1f0?style=flat-square) |
| **Gemini** | Gemini CLI | ![Works](https://img.shields.io/badge/Works-dcf5e8?style=flat-square) |
| | Gemini app | ![Not yet](https://img.shields.io/badge/Not_yet-eef1f0?style=flat-square) |
| **Grok** | xAI API | ![Works](https://img.shields.io/badge/Works-dcf5e8?style=flat-square) |
| **Cursor** | Editor | ![Works](https://img.shields.io/badge/Works-dcf5e8?style=flat-square) |
| **VS Code** | GitHub Copilot, agent mode | ![Works](https://img.shields.io/badge/Works-dcf5e8?style=flat-square) |
| **Windsurf** | Editor | ![Works](https://img.shields.io/badge/Works-dcf5e8?style=flat-square) |

Replace `YOUR_KEY` with the key from the dashboard. Ready-made files live in [`examples/`](examples).

<details>
<summary><b>Claude Code</b></summary>
<br>

```bash
claude mcp add --transport http botplugin https://api.botplugin.com.br/mcp \
  --header "Authorization: Bearer YOUR_KEY"
```

Then run `/mcp` inside Claude Code to see BotPlugin connected.

</details>

<details>
<summary><b>Claude Desktop</b></summary>
<br>

Under **Settings › Developer › Edit Config**, add to `claude_desktop_config.json` and restart the app. Requires [Node.js](https://nodejs.org).

```json
{
  "mcpServers": {
    "botplugin": {
      "command": "npx",
      "args": [
        "-y",
        "mcp-remote",
        "https://api.botplugin.com.br/mcp",
        "--header",
        "Authorization:${BOTPLUGIN_AUTH}"
      ],
      "env": { "BOTPLUGIN_AUTH": "Bearer YOUR_KEY" }
    }
  }
}
```

</details>

<details>
<summary><b>claude.ai</b> (web) · beta</summary>
<br>

1. Go to **Settings › Connectors › Add custom connector**.
2. Fill in the name (`botplugin`) and the URL `https://api.botplugin.com.br/mcp`.
3. Under **Authentication**, choose **No sign-in**.
4. Under **Request headers**, click **Add header**, pick `Authorization`, paste `Bearer YOUR_KEY` and tick **Required**.

> [!IMPORTANT]
> It must be **No sign-in**. With the sign-in options, claude.ai attempts an OAuth flow BotPlugin does not support yet. Request headers are rolling out gradually and, on Team and Enterprise plans, only admins can add them. If the section is missing, use Claude Code or Claude Desktop.

</details>

<details>
<summary><b>Codex</b> (OpenAI CLI and app)</summary>
<br>

```bash
export BOTPLUGIN_TOKEN="YOUR_KEY"
```

```toml
# ~/.codex/config.toml
[mcp_servers.botplugin]
url = "https://api.botplugin.com.br/mcp"
bearer_token_env_var = "BOTPLUGIN_TOKEN"
```

</details>

<details>
<summary><b>OpenAI Responses API</b></summary>
<br>

```bash
curl https://api.openai.com/v1/responses \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $OPENAI_API_KEY" \
  -d '{
    "model": "gpt-5",
    "input": "List the automations in my channel",
    "tools": [{
      "type": "mcp",
      "server_label": "botplugin",
      "server_url": "https://api.botplugin.com.br/mcp",
      "headers": { "Authorization": "Bearer YOUR_KEY" },
      "require_approval": "never"
    }]
  }'
```

</details>

<details>
<summary><b>Gemini CLI</b></summary>
<br>

```bash
gemini mcp add -s user --transport http \
  --header "Authorization: Bearer YOUR_KEY" \
  botplugin https://api.botplugin.com.br/mcp
```

</details>

<details>
<summary><b>xAI API</b> (Grok)</summary>
<br>

```bash
curl https://api.x.ai/v1/responses \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $XAI_API_KEY" \
  -d '{
    "model": "grok-4.7",
    "input": "List the automations in my channel",
    "tools": [{
      "type": "mcp",
      "server_url": "https://api.botplugin.com.br/mcp",
      "server_label": "botplugin",
      "authorization": "YOUR_KEY"
    }]
  }'
```

</details>

<details>
<summary><b>Cursor</b></summary>
<br>

`~/.cursor/mcp.json` (all projects) or `.cursor/mcp.json` (one project):

```json
{
  "mcpServers": {
    "botplugin": {
      "url": "https://api.botplugin.com.br/mcp",
      "headers": { "Authorization": "Bearer YOUR_KEY" }
    }
  }
}
```

</details>

<details>
<summary><b>VS Code</b> (GitHub Copilot, agent mode)</summary>
<br>

`.vscode/mcp.json`, or run **MCP: Open User Configuration**:

```json
{
  "servers": {
    "botplugin": {
      "type": "http",
      "url": "https://api.botplugin.com.br/mcp",
      "headers": { "Authorization": "Bearer YOUR_KEY" }
    }
  }
}
```

</details>

<details>
<summary><b>Windsurf</b></summary>
<br>

`~/.codeium/windsurf/mcp_config.json`, then refresh in **Manage MCPs**:

```json
{
  "mcpServers": {
    "botplugin": {
      "serverUrl": "https://api.botplugin.com.br/mcp",
      "headers": { "Authorization": "Bearer YOUR_KEY" }
    }
  }
}
```

</details>

---

## Tools

24 tools. The AI picks the right one for each request. Full parameter reference (in Portuguese): [docs/ferramentas.md](docs/ferramentas.md).

| Group | Tools |
|---|---|
| **Channel** | `ver_canal`<sup>read</sup> · `servidor_cloud` |
| **Automations** | `listar_automacoes`<sup>read</sup> · `ver_automacao`<sup>read</sup> · `criar_automacao` · `atualizar_automacao` · `ativar_desativar_automacao` |
| **Triggers** | `listar_ativacoes`<sup>read</sup> · `definir_gatilho_entrada` · `remover_gatilho_entrada` · `salvar_palavra_chave` · `remover_palavra_chave` · `criar_webhook` · `atualizar_webhook` · `remover_webhook` · `definir_automacao_do_anuncio` |
| **Flow** | `listar_tipos_de_bloco`<sup>read</sup> · `ver_fluxo`<sup>read</sup> · `montar_fluxo` · `editar_fluxo` · `validar_fluxo`<sup>read</sup> · `listar_versoes_fluxo`<sup>read</sup> · `restaurar_versao_fluxo` |
| **Conversations** | `listar_atendimentos`<sup>read</sup> |

<sub><sup>read</sup> read-only: the tool never changes the channel.</sub>

Supported blocks: message, menu, condition, switch, questions, delay, wait for reply, HTTP webhook, image, video, audio, document, media from link, contact variables, random/round-robin, day/time, WhatsApp Official buttons and list, single-shot ChatGPT and Gemini, end and notes. Details in [docs/blocos.md](docs/blocos.md).

---

## Security

- **One key per channel.** The AI only sees and changes the channel of the key in use.
- **No secrets exposed.** Passwords, tokens and keys stored in blocks and variables come back to the AI as `[oculto]` (hidden). Editing a block that contains `[oculto]` keeps the stored value.
- **Only the hash is stored.** The key itself is shown once, when it is generated.
- **Revoke anytime** from the same dashboard screen, which shows who created each key and when it was last used.
- **Everything is reversible.** Each flow save becomes a version (the last 10 are kept), and the AI never saves a flow with a new error.
- **Rate limits:** 120 calls per minute per key, plus a temporary block after 20 failures per minute from the same IP.

Found a vulnerability? See [SECURITY.md](SECURITY.md) (report privately).

---

## Roadmap

- [ ] OAuth sign-in, for the ChatGPT app and claude.ai without manual setup
- [ ] AI agents and scheduling through MCP
- [ ] Integration blocks and sub-flows
- [ ] Listing on the official MCP Registry ([`server.json`](server.json))

---

<p align="center">
  <img src="assets/icone.svg" width="44" alt="BotPlugin"><br>
  <b><a href="https://botplugin.com.br">botplugin.com.br</a></b> · <a href="https://instagram.com/botplugin.com.br">@botplugin.com.br</a><br>
  <sub>Docs and examples in this repository are <a href="LICENSE">MIT licensed</a>. The BotPlugin service is subject to the terms on the website.</sub>
</p>
