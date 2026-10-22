<p align="center"><img src="../assets/icone.svg" width="56" alt="BotPlugin"></p>

<h1 align="center">Exemplos de pedidos</h1>

<p align="center">Copie, troque pelos dados do seu negócio e mande para a sua IA.<br><a href="../README.md">Voltar para o início</a></p>

---

> [!TIP]
> Quanto mais contexto, melhor o resultado. Diga o tipo de negócio, o tom de voz e o que deve acontecer em cada caminho. A IA pergunta o que faltar.

## Para começar

```text
Me mostra como está o meu canal e quais automações existem.
```

```text
Explica em poucas linhas o que o fluxo de boas-vindas faz hoje.
```

```text
Valida todos os fluxos e me diz se algum tem problema que faria o bot parar.
```

## Montar do zero

**Restaurante ou delivery**

```text
Monta um atendimento para a minha pizzaria: dá boas-vindas com o nome do cliente,
mostra um menu com Cardápio, Fazer pedido e Falar com atendente. Em Cardápio,
manda a imagem do cardápio (https://exemplo.com/cardapio.jpg). Em Fazer pedido,
pergunta o sabor, o tamanho e o endereço. Liga no primeiro contato.
```

**Clínica ou consultório**

```text
Cria uma automação de triagem: pergunta o nome, se já é paciente e o motivo da
consulta. Se for urgência, avisa para ligar no (00) 0000-0000. No fim, diz que
a recepção vai responder em breve.
```

**Loja on-line**

```text
Quero um bot que responde "rastreio" com as instruções para rastrear o pedido,
"troca" com a política de trocas e qualquer outra mensagem com um menu dessas
duas opções mais Falar com atendente.
```

**Prestador de serviço**

```text
Fora do horário (segunda a sexta, das 9h às 18h), avisa que respondemos no
próximo dia útil e pergunta o nome e o assunto. Dentro do horário, segue para o
atendimento normal.
```

## Ajustar o que já existe

```text
No fluxo de boas-vindas, troca o texto da primeira mensagem por algo mais
descontraído e acrescenta a opção "Horário de funcionamento" no menu.
```

```text
Depois que o cliente informar o endereço, salva numa variável do contato para
não precisar perguntar de novo na próxima compra.
```

```text
Divide os novos contatos meio a meio entre duas mensagens de boas-vindas
diferentes, para eu testar qual converte mais.
```

```text
Desfaz a última mudança no fluxo de boas-vindas.
```

## Gatilhos e integrações

```text
Cria uma palavra-chave "promo" que dispara uma automação com a promoção da semana.
```

```text
No Instagram, quando alguém comentar "eu quero" no meu último post, manda no
direct a automação de vendas.
```

```text
Cria um webhook para o meu sistema de pedidos avisar o cliente quando o pedido
sair para entrega. O telefone vem no campo customer.phone.
```

```text
Quem chegar pelos anúncios de click-to-WhatsApp deve cair na automação de
vendas, não na de boas-vindas.
```

## Vários canais

Com a [chave de todos os canais](../README.md#tipos-de-chave):

```text
Lista os meus canais e o que dispara as automações de cada um.
```

```text
Copia o menu de boas-vindas da Loja Centro para a Loja Norte e a Loja Sul.
```

```text
Desativa as automações com "teste" no nome em todos os canais.
```

```text
Em quais canais o bot está fora do ar agora?
```

## Acompanhar

```text
Quantos atendimentos tive hoje e em qual bloco cada contato parou?
```

```text
Lista os contatos que ficaram parados no bloco de pagamento nos últimos 3 dias.
```

```text
Reinicia o servidor da Cloud do canal, que preciso ler um QR Code novo.
```
