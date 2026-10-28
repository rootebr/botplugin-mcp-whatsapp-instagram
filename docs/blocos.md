<p align="center"><img src="../assets/icone.svg" width="56" alt="BotPlugin"></p>

<h1 align="center">Blocos que a IA sabe usar</h1>

<p align="center">O catálogo que a IA consulta antes de montar ou editar um fluxo.<br><a href="../README.md">Voltar para o início</a></p>

---

A IA vê esta lista pela ferramenta [`listar_tipos_de_bloco`](ferramentas.md#listar_tipos_de_bloco-leitura), já filtrada para o tipo do seu canal, com os campos e um exemplo de cada bloco. Você não precisa saber os nomes: basta descrever o atendimento.

## Conversa

| Bloco | Tipo | O que faz |
|---|---|---|
| **Início** | `start` | Ponto de partida, criado junto com a automação. Existe um só |
| **Mensagem** | `text` | Envia um texto. Aceita variáveis `{{nome}}` e a formatação do WhatsApp (`*negrito*`, `_itálico_`) |
| **Menu** | `menu` | Mostra opções numeradas e espera a escolha. Reconhece o número ou um texto contido na opção |
| **Perguntas** | `form` | Faz perguntas em sequência e guarda cada resposta numa variável |
| **Aguardar resposta** | `waitNode` | Pausa até o contato mandar qualquer mensagem |
| **Tempo** | `time` | Espera um tempo antes de seguir |
| **Fim** | `endnode` | Encerra o atendimento. Pode também parar de responder o contato |

## Decisão

| Bloco | Tipo | O que faz |
|---|---|---|
| **Condição** | `condition` | Testa regras sobre variáveis e segue por verdadeiro ou falso |
| **Switch** | `switchNode` | Testa vários casos em ordem e segue pelo primeiro verdadeiro |
| **Dia / Hora** | `daysCheck` | Confere se agora está dentro dos dias e turnos configurados |
| **Aleatório / Sequencial** | `dynamicRoutingNode` | Divide os contatos entre as saídas, ao acaso ou em rodízio. Bom para teste A/B |

## Mídia

| Bloco | Tipo | O que faz |
|---|---|---|
| **Imagem** | `imageNode` | Envia uma imagem de uma URL pública, com legenda |
| **Vídeo** | `videoNode` | Envia um vídeo de uma URL pública, com legenda |
| **Áudio** | `audioNode` | Envia um áudio de uma URL pública |
| **Documento** | `documentNode` | Envia um arquivo de uma URL pública, com descrição |
| **Mídia por link** | `sendMediaByLink` | Baixa qualquer mídia de um link, que pode vir de uma variável, e envia |

## Dados e integrações

| Bloco | Tipo | O que faz |
|---|---|---|
| **Variável de contato** | `contactVariableNode` | Define variáveis e pode salvá-las no contato para as próximas conversas |
| **Webhook** | `webhook` | Chama uma URL externa e guarda a resposta numa variável |
| **ChatGPT** | `gpt` | Gera um texto com a OpenAI a partir de um prompt (resposta única) |
| **Gemini** | `gemini` | Gera um texto com o Gemini a partir de um prompt (resposta única) |
| **ChatCenter V2** | `chatCenterNodeV2` | Age no ChatCenter: tag, nota, transferir operador, mover ou encerrar card de funil, arquivar e atualizar perfil do contato |
| **WaLeads V2** | `waleadsNodeV2` | Age no WaLeads: tag, nota, transferir operador e mover card de funil |

Na transferência de operador dos dois, `sendByChannelId` diz qual canal do workspace atende o cliente. Só vale com token de workspace e é obrigatório quando o workspace tem mais de um canal e o cliente ainda não tem canal de origem. O token da API sai como `[oculto]` para a IA.

## WhatsApp Oficial

Só funcionam em canais do WhatsApp Oficial (API da Meta).

| Bloco | Tipo | O que faz |
|---|---|---|
| **Botões** | `buttonNode` | Mensagem com até 3 botões de resposta, um botão de link ou um pedido de localização |
| **Lista interativa** | `listInteractiveNode` | Lista de opções nativa do WhatsApp |
| **Template** | `whatsAppTemplateNode` | Envia um template aprovado pela Meta. A IA escolhe o template em `listar_templates_whatsapp` e preenche os parâmetros (aceitam variáveis). Sem template definido, o bloco fica pendente para você escolher no painel |

## Editor

| Bloco | Tipo | O que faz |
|---|---|---|
| **Anotação** | `notes` | Um post-it no editor, só para documentar. Não executa |

---

### Ainda pelo painel

Agentes de IA com conversa contínua, agenda, sub-fluxos e os demais blocos de integração (Asaas, RD Station, n8n, Google...) ainda são configurados direto no editor do painel.
