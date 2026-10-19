# Segurança

## Como o BotPlugin MCP protege o seu canal

- Cada chave de acesso (`bpmcp_...`) vale para **um canal só**. A IA não alcança outros canais da sua conta.
- O BotPlugin guarda apenas o hash da chave. Ela aparece uma única vez, quando é gerada no painel.
- Senhas, tokens e outros segredos guardados nos blocos e nas variáveis voltam como `[oculto]` para a IA.
- As mensagens de erro não expõem detalhes internos do sistema.
- Cada chave pode fazer até 120 chamadas por minuto, e um IP com 20 falhas em um minuto é bloqueado por um tempo.
- Toda gravação de fluxo vira uma versão que pode ser restaurada.

## Boas práticas

- Gere uma chave para cada lugar onde você usa IA (notebook, editor, servidor). Assim dá para revogar uma sem afetar as outras.
- Nunca publique a chave em repositórios, prints ou issues. Se isso acontecer, revogue no painel em **Configurações do canal › Conectar IA** e gere outra.
- Prefira variáveis de ambiente quando o cliente suportar (por exemplo o Codex e o Claude Desktop).

## Reportar uma vulnerabilidade

Não abra uma issue pública. Use o botão **Report a vulnerability** na aba **Security** deste repositório, que cria um relato privado para a equipe do BotPlugin.

Descreva o que encontrou, como reproduzir e o impacto. Respondemos o quanto antes e avisamos quando a correção estiver no ar.
