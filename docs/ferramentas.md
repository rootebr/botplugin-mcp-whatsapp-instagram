<p align="center"><img src="../assets/icone.svg" width="56" alt="BotPlugin"></p>

<h1 align="center">Ferramentas do BotPlugin MCP</h1>

<p align="center">As 24 ferramentas que a sua IA pode usar (mais a <code>listar_canais</code> na chave de todos os canais), com os parâmetros de cada uma.<br><a href="../README.md">Voltar para o início</a></p>

---

O canal depende do tipo de chave usado na conexão:

- **Chave de canal:** todas as ferramentas trabalham no canal da chave, e nenhuma recebe o canal como parâmetro. É o que as tabelas abaixo mostram.
- **Chave de todos os canais:** toda ferramenta recebe também o parâmetro obrigatório `canal`, com o id de um dos canais que a chave alcança (veja [`listar_canais`](#listar_canais-leitura)). Um canal fora da chave é recusado, e cada resposta termina com "Canal: nome (id)".

Ids de automação, palavra-chave, webhook e anúncio vêm das ferramentas de listagem.

<sup>leitura</sup> marca as ferramentas que só consultam.

**Sumário**
[Canal](#canal) · [Automações](#automações) · [Gatilhos e ativações](#gatilhos-e-ativações) · [Webhooks e anúncios](#webhooks-e-anúncios) · [Fluxo](#fluxo) · [Atendimentos](#atendimentos)

---

## Canal

### `listar_canais` <sup>leitura</sup>
Só na chave de todos os canais. Lista os canais que a chave alcança, com id, nome, tipo (WhatsApp, Instagram, Site...), onde o bot roda e o seu papel no canal. O id é o que vai no parâmetro `canal` das outras ferramentas.

Sem parâmetros.

### `ver_canal` <sup>leitura</sup>
Mostra o canal: nome, tipo (WhatsApp, Instagram, Site...), onde o bot roda e se o servidor da Cloud está online.

Sem parâmetros.

### `servidor_cloud`
Liga, desliga ou reinicia o servidor da Cloud que roda o bot do canal (o mesmo botão de energia do painel). Ligar exige plano Cloud com assinatura ativa e leva alguns segundos. Reiniciar gera um QR Code novo no WhatsApp. Desligar faz o bot parar de responder.

| Parâmetro | Tipo | Obrigatório | Descrição |
|---|---|:---:|---|
| `acao` | `ligar` \| `desligar` \| `reiniciar` | ✓ | O que fazer com o servidor |

---

## Automações

### `listar_automacoes` <sup>leitura</sup>
Lista as automações (fluxos) do canal com o que dispara cada uma.

Sem parâmetros.

### `ver_automacao` <sup>leitura</sup>
Mostra uma automação: dados, gatilhos e um resumo dos blocos.

| Parâmetro | Tipo | Obrigatório | Descrição |
|---|---|:---:|---|
| `automacao` | texto | ✓ | Id da automação |

### `criar_automacao`
Cria uma automação em branco, só com o bloco de Início. Depois a IA monta os blocos com `montar_fluxo` e liga um gatilho.

| Parâmetro | Tipo | Obrigatório | Descrição |
|---|---|:---:|---|
| `titulo` | texto | ✓ | Nome da automação |
| `descricao` | texto | | Descrição livre |

### `atualizar_automacao`
Renomeia, troca a descrição ou liga e desliga uma automação. Desligar não remove os gatilhos; o bot só passa a ignorá-la.

| Parâmetro | Tipo | Obrigatório | Descrição |
|---|---|:---:|---|
| `automacao` | texto | ✓ | Id da automação |
| `titulo` | texto | | Novo nome |
| `descricao` | texto | | Nova descrição |
| `ativa` | sim/não | | Liga ou desliga |

### `ativar_desativar_automacao`
Liga ou desliga uma automação. Desligada, o bot a ignora mesmo que um gatilho dispare; os gatilhos continuam configurados.

| Parâmetro | Tipo | Obrigatório | Descrição |
|---|---|:---:|---|
| `automacao` | texto | ✓ | Id da automação |
| `ativa` | sim/não | ✓ | `true` liga, `false` desliga |

---

## Gatilhos e ativações

### `listar_ativacoes` <sup>leitura</sup>
Mostra tudo que dispara automações no canal: entradas (primeiro contato, qualquer mensagem recebida, abertura do chat no site), palavras-chave, webhooks e anúncios.

| Parâmetro | Tipo | Obrigatório | Descrição |
|---|---|:---:|---|
| `automacao` | texto | | Mostra só o que dispara esta automação |

### `definir_gatilho_entrada`
Liga uma automação a uma entrada do canal, ou desliga a entrada com `automacao = null`. Cada entrada aceita uma automação só.

| Parâmetro | Tipo | Obrigatório | Descrição |
|---|---|:---:|---|
| `gatilho` | `primeiro_contato` \| `receber_mensagem` \| `abrir_chat` | ✓ | `abrir_chat` existe só no canal Site |
| `automacao` | texto ou `null` | ✓ | Id da automação, ou `null` para desligar |

### `remover_gatilho_entrada`
Desliga uma entrada do canal. A automação continua existindo.

| Parâmetro | Tipo | Obrigatório | Descrição |
|---|---|:---:|---|
| `gatilho` | `primeiro_contato` \| `receber_mensagem` \| `abrir_chat` | ✓ | Entrada a desligar |

### `salvar_palavra_chave`
Cria ou edita uma palavra-chave que dispara uma automação. Sem `chave`, cria uma nova; com `chave`, edita a existente. Palavra vazia com condição `contains` casa com qualquer mensagem.

| Parâmetro | Tipo | Obrigatório | Descrição |
|---|---|:---:|---|
| `automacao` | texto | ✓ | Id da automação disparada |
| `palavra` | texto | ✓ | Texto que a mensagem deve ter |
| `chave` | texto | | Identificador de uma palavra-chave existente, para editar |
| `condicao` | `equals` \| `contains` | | `equals` (padrão): mensagem exatamente igual. `contains`: contém o texto, sem diferenciar maiúsculas |
| `quando` | `received` \| `sent` \| `both` | | Mensagem do contato (padrão), enviada pelo canal ou as duas |
| `tipo` | `message` \| `comment` \| `story_reply` | | `comment` e `story_reply` só no Instagram |
| `id_post` | texto | | Só para `comment`: publicação do Instagram vigiada |
| `permalink` | texto | | Link da publicação |
| `ativa` | sim/não | | Padrão: sim |

### `remover_palavra_chave`
Apaga uma palavra-chave.

| Parâmetro | Tipo | Obrigatório | Descrição |
|---|---|:---:|---|
| `chave` | texto | ✓ | Identificador vindo de `listar_ativacoes` |

---

## Webhooks e anúncios

### `criar_webhook`
Cria uma URL que, ao receber GET ou POST, dispara a automação para o contato indicado no corpo. Devolve a URL pronta para colar no sistema externo.

| Parâmetro | Tipo | Obrigatório | Descrição |
|---|---|:---:|---|
| `slug` | texto | ✓ | Final da URL: minúsculas, números e hífen, de 3 a 64 caracteres. Único em todo o BotPlugin |
| `titulo` | texto | ✓ | Nome do webhook |
| `campo_contato` | texto | ✓ | Caminho no corpo recebido que traz o telefone, ex.: `phone` ou `customer.phone` |
| `automacao` | texto | | Id da automação disparada |
| `descricao` | texto | | Descrição livre |
| `ativo` | sim/não | | Padrão: sim |

### `atualizar_webhook`
Edita um webhook. O slug não muda. `automacao = null` desliga o webhook da automação.

| Parâmetro | Tipo | Obrigatório | Descrição |
|---|---|:---:|---|
| `webhook` | texto | ✓ | Id do webhook |
| `titulo`, `descricao`, `campo_contato` | texto | | Novos valores |
| `automacao` | texto ou `null` | | Automação disparada |
| `ativo` | sim/não | | Liga ou desliga |

### `remover_webhook`
Apaga um webhook e o histórico de chamadas dele. A URL deixa de funcionar.

| Parâmetro | Tipo | Obrigatório | Descrição |
|---|---|:---:|---|
| `webhook` | texto | ✓ | Id do webhook |

### `definir_automacao_do_anuncio`
Escolhe qual automação roda quando alguém chega por um anúncio click-to-WhatsApp, ou desliga com `automacao = null`. Os anúncios aparecem em `listar_ativacoes` depois da primeira mensagem vinda deles.

| Parâmetro | Tipo | Obrigatório | Descrição |
|---|---|:---:|---|
| `anuncio` | texto | ✓ | Id do anúncio, vindo de `listar_ativacoes` |
| `automacao` | texto ou `null` | ✓ | Id da automação, ou `null` |

---

## Fluxo

A IA nunca lida com detalhes internos do editor. Ela liga os blocos pelo **nome da saída**: `proximo`, `opcao:<id>`, `verdadeiro`, `falso` e assim por diante. Os blocos são posicionados sozinhos no editor.

### `listar_tipos_de_bloco` <sup>leitura</sup>
Catálogo dos blocos que funcionam no canal: o que cada um faz, os campos de `dados`, um exemplo e as saídas. Veja também [blocos.md](blocos.md).

| Parâmetro | Tipo | Obrigatório | Descrição |
|---|---|:---:|---|
| `tipo` | texto | | Um tipo só, para ver o detalhe |

### `ver_fluxo` <sup>leitura</sup>
Mostra o fluxo bloco a bloco: tipo, dados e para onde vai cada saída. Também lista os problemas que fariam o bot parar.

| Parâmetro | Tipo | Obrigatório | Descrição |
|---|---|:---:|---|
| `automacao` | texto | ✓ | Id da automação |

### `montar_fluxo`
Monta o fluxo inteiro de uma vez: blocos com um `ref` e as ligações entre eles. O Início já existe: ligue-o com `{ "de": "inicio", "saida": "proximo", "para": "<ref>" }`. Se o fluxo já tiver blocos, só substitui com `substituir = true`, e a versão anterior fica guardada.

| Parâmetro | Tipo | Obrigatório | Descrição |
|---|---|:---:|---|
| `automacao` | texto | ✓ | Id da automação |
| `blocos` | lista (1 a 150) | ✓ | `{ ref, tipo, dados?, apelido? }` |
| `ligacoes` | lista | | `{ de, para, saida? }` |
| `substituir` | sim/não | | Substitui um fluxo que já tem blocos |
| `permitir_erros` | sim/não | | Grava mesmo com erros, como rascunho |

<details>
<summary>Exemplo</summary>

```json
{
  "automacao": "AUTOMACAO_ID",
  "blocos": [
    { "ref": "oi", "tipo": "text", "dados": { "message": "Olá {{chat_name}}! 🍕" } },
    { "ref": "menu", "tipo": "menu", "dados": {
      "label": "Escolha uma opção:",
      "options": [{ "label": "Cardápio" }, { "label": "Fazer pedido" }],
      "selectedVariable": "opcao_menu"
    } }
  ],
  "ligacoes": [
    { "de": "inicio", "saida": "proximo", "para": "oi" },
    { "de": "oi", "para": "menu" }
  ]
}
```

Os nomes de tipo e os campos de `dados` de cada bloco vêm de `listar_tipos_de_bloco`. A IA consulta o catálogo antes de montar.

</details>

### `editar_fluxo`
Aplica uma lista de operações no fluxo de uma vez e grava como uma versão nova. Se o resultado tiver um erro novo, nada é gravado e os erros voltam para a IA corrigir.

| Parâmetro | Tipo | Obrigatório | Descrição |
|---|---|:---:|---|
| `automacao` | texto | ✓ | Id da automação |
| `operacoes` | lista (1 a 100) | ✓ | Operações, na ordem |
| `permitir_erros` | sim/não | | Grava mesmo com erros, como rascunho |

| Operação | Campos |
|---|---|
| `adicionar` | `tipo`, `dados?`, `apelido?`, `ref?` (para usar nas operações seguintes), `ligar_de?` (`{ bloco, saida? }`) |
| `editar` | `bloco`, `dados?` (mescla com os atuais), `apelido?`, `substituir_dados?` |
| `remover` | `bloco` |
| `ligar` | `de`, `para`, `saida?` (pode faltar se o bloco tem uma saída só) |
| `desligar` | `de`, `saida` |

### `validar_fluxo` <sup>leitura</sup>
Confere o fluxo com as regras do bot: Início ligado, saídas que existem, dados obrigatórios, blocos que não funcionam no canal, blocos inalcançáveis e combinações que travam.

| Parâmetro | Tipo | Obrigatório | Descrição |
|---|---|:---:|---|
| `automacao` | texto | ✓ | Id da automação |

### `listar_versoes_fluxo` <sup>leitura</sup>
Lista as versões guardadas do fluxo (as 10 últimas gravações), com data e quantidade de blocos.

| Parâmetro | Tipo | Obrigatório | Descrição |
|---|---|:---:|---|
| `automacao` | texto | ✓ | Id da automação |

### `restaurar_versao_fluxo`
Volta o fluxo para uma versão anterior. A versão atual continua na lista, então dá para desfazer.

| Parâmetro | Tipo | Obrigatório | Descrição |
|---|---|:---:|---|
| `automacao` | texto | ✓ | Id da automação |
| `versao` | número | ✓ | Versão, vinda de `listar_versoes_fluxo` |

---

## Atendimentos

### `listar_atendimentos` <sup>leitura</sup>
Lista os atendimentos: cada contato com um bot rodando, em que automação e em que bloco está. Por padrão, só os em andamento com automação, mais recentes primeiro.

| Parâmetro | Tipo | Obrigatório | Descrição |
|---|---|:---:|---|
| `status` | `em_andamento` \| `finalizados` \| `todos` | | Padrão: `em_andamento` |
| `automacao` | texto | | Filtra por automação |
| `contato` | texto | | Filtra pelo telefone ou id do contato |
| `desde` | data ISO | | Só atendimentos com atividade a partir dela |
| `limite` | número (1 a 200) | | Padrão: 50 |
| `incluir_variaveis` | sim/não | | Traz as variáveis de cada atendimento |
| `incluir_sem_automacao` | sim/não | | Inclui mensagens que chegaram sem disparar automação |
