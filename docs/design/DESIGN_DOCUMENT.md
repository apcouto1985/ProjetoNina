# Nina — Documento de Design

## 1. Visão Geral

Nina é um app educacional para crianças neurodivergentes de 4 a 12 anos, focado em alfabetização. A personagem-guia é um trenzinho dourado com rosto amigável e orelhas grandes de cocker spaniel inglês.

**Estilo visual:** Cartoon Vibrante
**Princípio central:** Divertido e envolvente, com controle de estímulos para não sobrecarregar.

---

## 2. Paleta de Cores

```
┌─────────────────────────────────────────────────────────┐
│  Token                │  Hex      │  Uso                │
├───────────────────────┼───────────┼─────────────────────┤
│  Primária (Nina)      │  #DAA520  │  Trenzinho, destaques│
│  Fundo principal      │  #FFF8F0  │  Telas, cards       │
│  Fundo secundário     │  #FFFDE7  │  Áreas de atividade │
│  Acerto               │  #66BB6A  │  Feedback positivo  │
│  Tente de novo        │  #FFA726  │  Feedback de erro   │
│  Texto principal      │  #2D3436  │  Títulos, conteúdo  │
│  Texto secundário     │  #636E72  │  Descrições, dicas  │
│  Destaque/CTA         │  #FF7043  │  Botões de ação     │
│  Trilhos              │  #8D6E63  │  Elementos de trilho│
│  Céu                  │  #81D4FA  │  Backgrounds        │
│  Grama                │  #A5D6A7  │  Backgrounds        │
└───────────────────────┴───────────┴─────────────────────┘
```

**Regra:** Nunca usar vermelho (#FF0000 ou similares) para indicar erro. Usar laranja suave (#FFA726) com mensagem encorajadora.

---

## 3. Tipografia

| Uso | Fonte | Peso | Tamanho |
|---|---|---|---|
| Títulos de tela | Nunito | ExtraBold | 28-32sp |
| Subtítulos | Nunito | Bold | 22-24sp |
| Corpo de texto | Quicksand | Medium | 18-20sp |
| Letras para aprender | Nunito | ExtraBold | 80-120sp |
| Botões | Nunito | Bold | 20sp |
| Dicas da Nina | Quicksand | SemiBold | 16-18sp |

Todas as fontes são Google Fonts (gratuitas).

---

## 4. A Personagem Nina

### 4.1 Descrição Visual

```
        ╭──────────╮
       ╱  (◕‿◕)    ╲        ← Rosto amigável, olhos grandes e brilhantes
      │   ╰─────╯    │
  ~~~~│               │~~~~  ← Orelhas grandes de cocker spaniel (caídas, macias)
      │  ┌─────────┐  │
      │  │  NINA   │  │     ← Corpo arredondado, cor dourado (#DAA520)
      │  └─────────┘  │
      ╰───┬──┬──┬──┬──╯
          ○  ○  ○  ○        ← Rodas arredondadas
     ═══════════════════     ← Trilhos
```

### 4.2 Características

- **Corpo:** Arredondado, sem arestas, cor dourado (#DAA520)
- **Rosto:** Olhos grandes e expressivos, sorriso gentil, bochechas rosadas
- **Orelhas:** Grandes e caídas como de um cocker spaniel inglês, macias e expressivas (se animam com as emoções)
- **Chaminé:** Pequena, solta fumaça colorida nas comemorações
- **Rodas:** Arredondadas, giram suavemente durante navegação

### 4.3 Expressões

| Estado | Expressão | Quando |
|---|---|---|
| Feliz | Sorriso grande, orelhas levantadas, olhos brilhando | Acerto, boas-vindas |
| Comemorando | Olhos de estrela, fumaça colorida, apito | Completar atividade |
| Pensativa | Olho levemente fechado, orelha inclinada | Esperando resposta |
| Encorajando | Sorriso suave, aceno com orelha | Após erro |
| Surpresa | Olhos arregalados, orelhas para cima | Descoberta nova |
| Dormindo | Olhos fechados, "zzz" | Tela de pausa |

### 4.4 Vagões

Cada módulo do app é representado por um vagão acoplado à Nina:

| Vagão | Cor | Módulo | Ícone |
|---|---|---|---|
| 1º vagão | #EF5350 (coral) | Letras | Letra "A" |
| 2º vagão | #42A5F5 (azul) | Números | Número "1" |
| 3º vagão | #AB47BC (roxo) | Recompensas | Estrela |

---

## 5. Mundo do MVP: A Estação

Em vez de uma floresta complexa, o MVP usa o cenário de uma **estação de trem**, que é:
- Tematicamente coerente com a personagem (trenzinho)
- Visualmente simples de produzir
- Intuitivo para a metáfora de progresso (estações = etapas)

### 5.1 Elementos Visuais da Estação

```
┌─────────────────────────────────────────────────────────┐
│                    ☁️    ☀️    ☁️                         │
│                                                         │
│   ┌──────────┐                        ┌──────────┐     │
│   │ ESTAÇÃO  │                        │ ESTAÇÃO  │     │
│   │  LETRA A │    🚂 Nina ───□───□    │  LETRA B │     │
│   └──────────┘                        └──────────┘     │
│  ═══════════════════════════════════════════════════    │
│   🌳          🌻        🌳         🌻          🌳     │
└─────────────────────────────────────────────────────────┘
```

### 5.2 Elementos do Cenário

| Elemento | Descrição | Função |
|---|---|---|
| Plataforma | Base da estação, cor de madeira | Área de atividade |
| Placa da estação | Mostra a letra/número atual | Identificação |
| Trilhos | Conectam as estações | Progresso visual |
| Céu | Gradiente azul claro | Background |
| Nuvens | Brancas, arredondadas, se movem lentamente | Decoração suave |
| Árvores/flores | Simples, estilizadas | Decoração lateral |
| Sol | Sorridente | Decoração, reage a acertos |

### 5.3 Progressão

- Cada letra = uma estação
- Nina viaja de estação em estação pelos trilhos
- Estações visitadas ficam iluminadas
- Estações futuras ficam em silhueta (visíveis mas não acessíveis)
- A criança pode revisitar qualquer estação já desbloqueada

---

## 6. Telas do MVP — Wireframes

### 6.1 Tela de Splash (Abertura)

```
┌─────────────────────────────────┐
│                                 │
│                                 │
│                                 │
│          🚂                     │
│         NINA                    │
│                                 │
│    "Vamos aprender juntos!"     │
│                                 │
│         [● ● ●]                 │
│     (loading animado)           │
│                                 │
└─────────────────────────────────┘
```

- Nina entra pela esquerda com animação
- Fundo: céu com nuvens
- Duração: 2-3 segundos
- Transição suave para o Onboarding (primeira vez) ou Home (retorno)

### 6.2 Onboarding (apenas na primeira abertura)

```
┌─────────────────────────────────┐
│                                 │
│  Tela 1/4                       │
│                                 │
│          🚂                     │
│                                 │
│  "Olá! Eu sou a Nina!          │
│   Qual é o seu nome?"           │
│                                 │
│  ┌─────────────────────────┐   │
│  │  [Digite seu nome]      │   │
│  └─────────────────────────┘   │
│                                 │
│       [▶️ Próximo]             │
│                                 │
└─────────────────────────────────┘
```

```
┌─────────────────────────────────┐
│                                 │
│  Tela 2/4                       │
│                                 │
│          🚂                     │
│                                 │
│  "Que legal, João!              │
│   Eu sou um trenzinho e vou     │
│   te ajudar a aprender as       │
│   letras!"                      │
│                                 │
│       [▶️ Próximo]             │
│                                 │
└─────────────────────────────────┘
```

```
┌─────────────────────────────────┐
│                                 │
│  Tela 3/4                       │
│                                 │
│  🚂 "Olha, essa é a letra A!"  │
│                                 │
│  ┌─────────────────────────┐   │
│  │          A              │   │
│  │    (toque para ouvir!)  │   │
│  └─────────────────────────┘   │
│                                 │
│  "Toque na letra para           │
│   ouvir o som dela!"            │
│                                 │
│       [▶️ Próximo]             │
│                                 │
└─────────────────────────────────┘
```

```
┌─────────────────────────────────┐
│                                 │
│  Tela 4/4                       │
│                                 │
│  🚂 "Agora tente desenhar!"    │
│                                 │
│  ┌─────────────────────────┐   │
│  │    · · · · ·            │   │
│  │    (siga os pontinhos)  │   │
│  └─────────────────────────┘   │
│                                 │
│  "Siga os pontinhos com         │
│   o dedo! Assim!"               │
│   (animação demonstrativa)      │
│                                 │
│       [🚀 Vamos começar!]     │
│                                 │
└─────────────────────────────────┘
```

**Fluxo do Onboarding:**
- Tela 1: Nina se apresenta e pergunta o nome da criança
- Tela 2: Nina usa o nome da criança e explica o que vão fazer juntos
- Tela 3: Demonstra como funciona a atividade de conhecer/ouvir uma letra
- Tela 4: Demonstra como funciona o traçar (com animação guiada)
- Só aparece na primeira abertura do app
- O nome é salvo e usado nas falas da Nina ("Muito bem, João!")

### 6.3 Tela Home (Estação Central)

```
┌─────────────────────────────────┐
│  ⭐ 12    [🔇]    [👤 Perfil]  │
│                                 │
│         ESTAÇÃO CENTRAL         │
│                                 │
│    🚂 Nina: "Olá, João!        │
│     Para onde vamos hoje?"      │
│                                 │
│  ┌───────────┐  ┌───────────┐  │
│  │           │  │           │  │
│  │  🔤       │  │  🔢       │  │
│  │  LETRAS   │  │  NÚMEROS  │  │
│  │           │  │  (em breve)│  │
│  └───────────┘  └───────────┘  │
│                                 │
│  ┌───────────┐  ┌───────────┐  │
│  │  ⭐       │  │  ⚙️       │  │
│  │ CONQUISTAS│  │  PAIS     │  │
│  └───────────┘  └───────────┘  │
│                                 │
│  ═══════🚂══════════════════   │
└─────────────────────────────────┘
```

- 4 cards grandes e tocáveis
- Nina aparece no topo com fala personalizada (usa o nome da criança)
- Contador de estrelas no canto superior esquerdo
- Botão de modo silencioso (🔇/🔊) no topo, acessível pela criança
- Botão de perfil/pais no canto superior direito
- Trilhos decorativos na parte inferior
- "Números" aparece com cadeado suave e texto "em breve" (pós-MVP)

### 6.4 Tela do Mapa de Letras (Trilho)

```
┌─────────────────────────────────┐
│  [←]  LETRAS          ⭐ 12    │
│                                 │
│  ☁️           ☁️          ☁️    │
│                                 │
│  🔵A ──── 🔵B ──── 🔵C        │
│            │                    │
│           🔵D ──── 🔵E ──── 🔵F│
│                          │      │
│  🔵G ──── 🔵H ──── 🔵I        │
│  │                              │
│  🔵J ──── ⚫K ──── ⚫L        │
│                                 │
│  ⚫ = bloqueada (silhueta)     │
│  🔵 = desbloqueada             │
│                                 │
│  🚂 Nina: "Estamos na          │
│   letra J! Vamos continuar?"   │
│                                 │
└─────────────────────────────────┘
```

- Scroll vertical
- Estações conectadas por trilhos
- Estações desbloqueadas: coloridas com a letra visível
- Estações bloqueadas: silhueta cinza
- Nina posicionada na estação atual
- Toque em estação desbloqueada = entrar na atividade

### 6.5 Tela de Atividade — Conhecer a Letra

```
┌─────────────────────────────────┐
│  [←]  LETRA A          ⭐ 12   │
│                                 │
│  ┌─────────────────────────┐   │
│  │                         │   │
│  │          A a            │   │
│  │      (grande, animada)  │   │
│  │                         │   │
│  └─────────────────────────┘   │
│                                 │
│      🐝 ABELHA                 │
│   (imagem + palavra)           │
│                                 │
│  🚂 "A! A de Abelha!"         │
│                                 │
│  [🔊 Ouvir]  [✏️ Traçar]      │
│                                 │
│       [▶️ Jogar]               │
│                                 │
└─────────────────────────────────┘
```

- Letra em destaque (maiúscula e minúscula)
- Imagem associada com a palavra
- Nina fala o som fonético
- 3 ações: ouvir de novo, ir para traçar, ir para quiz
- Animação de entrada da letra (cresce, gira, brilha)

### 6.6 Tela de Atividade — Traçar a Letra

```
┌─────────────────────────────────┐
│  [←]  TRAÇAR A          ⭐ 12  │
│                                 │
│  ┌─────────────────────────┐   │
│  │                         │   │
│  │    · · · · ·            │   │
│  │    ·       ·            │   │
│  │    · · · · ·            │   │
│  │    ·       ·    ← guia │   │
│  │    ·       ·  pontilhado│   │
│  │                         │   │
│  └─────────────────────────┘   │
│                                 │
│  🚂 "Siga os pontinhos        │
│   com o dedo!"                  │
│                                 │
│  [🔄 Recomeçar]  [▶️ Próximo] │
│                                 │
└─────────────────────────────────┘
```

- Área de desenho grande (70% da tela)
- Guia pontilhado da letra
- Setas indicando direção do traço
- Dedo da criança "pinta" sobre o pontilhado
- Feedback visual: traço fica colorido conforme acerta
- Nina comemora ao completar
- Botão de recomeçar sempre visível

### 6.7 Tela de Atividade — Quiz (Identificar)

```
┌─────────────────────────────────┐
│  [←]  QUAL É A LETRA?   ⭐ 12  │
│                                 │
│                                 │
│  🚂 "Qual é a letra A?"       │
│                                 │
│                                 │
│  ┌─────────┐    ┌─────────┐   │
│  │         │    │         │   │
│  │    A    │    │    M    │   │
│  │         │    │         │   │
│  └─────────┘    └─────────┘   │
│                                 │
│  ┌─────────┐    ┌─────────┐   │
│  │         │    │         │   │
│  │    R    │    │    G    │   │
│  │         │    │         │   │
│  └─────────┘    └─────────┘   │
│                                 │
│                                 │
└─────────────────────────────────┘
```

- Pergunta clara no topo (visual + áudio)
- 4 opções grandes e tocáveis
- Acerto: card fica verde, confete, Nina comemora, som de acerto
- Erro: card fica laranja suave, Nina diz "Quase! Tente de novo!", a opção errada some suavemente
- Máximo 2 tentativas, depois Nina mostra a resposta certa

### 6.8 Tela de Recompensa (Pós-atividade)

```
┌─────────────────────────────────┐
│                                 │
│         🎉 🎊 🎉               │
│                                 │
│       ⭐ ⭐ ⭐                 │
│     "Você ganhou 3 estrelas!"   │
│                                 │
│  🚂 Nina: "Incrível! Você     │
│   aprendeu a letra A!"         │
│                                 │
│   ┌─────────────────────┐      │
│   │  A  adicionada ao   │      │
│   │  vagão de letras! 🚃│      │
│   └─────────────────────┘      │
│                                 │
│  [🔄 Repetir]  [▶️ Próxima]   │
│                                 │
└─────────────────────────────────┘
```

- Animação de confete
- Estrelas aparecem uma a uma
- Nina comemora com fumaça colorida
- A letra é "carregada" para dentro do vagão (animação)
- Opção de repetir ou avançar

### 6.9 Painel dos Pais

```
┌─────────────────────────────────┐
│  [←]  PAINEL DOS PAIS          │
│                                 │
│  ┌─ DIGITE O PIN ───────────┐  │
│  │  [ _ ] [ _ ] [ _ ] [ _ ] │  │
│  └───────────────────────────┘  │
│                                 │
│  (após autenticação)            │
│                                 │
│  📊 PROGRESSO                   │
│  ├── Letras aprendidas: 10/26  │
│  ├── Estrelas: 24              │
│  └── Tempo hoje: 15 min        │
│                                 │
│  ⏱️ LIMITE DE TEMPO             │
│  ├── Tempo sugerido    [━━●]   │
│  │   (15/30/45/60 min ou sem   │
│  │    limite)                   │
│  └── Mensagem ao atingir:      │
│      Nina sugere parar, mas    │
│      não bloqueia o app        │
│                                 │
│  ⚙️ CONFIGURAÇÕES              │
│  ├── Reduzir animações  [○ ●]  │
│  ├── Volume dos sons    [━━●]  │
│  ├── Música de fundo    [● ○]  │
│  ├── Tamanho da fonte   [━●━]  │
│  ├── Contraste alto     [○ ●]  │
│  └── Alterar PIN        [→]    │
│                                 │
└─────────────────────────────────┘
```

- Protegido por PIN de 4 dígitos (padrão: 0000)
- Progresso visual claro
- Limite de tempo: sugestão, não bloqueio. Ao atingir, Nina diz "Que tal descansar um pouco? Amanhã a gente continua!" mas a criança pode continuar
- Opções de tempo: 15 min, 30 min, 45 min, 60 min, sem limite (padrão: sem limite)
- Configurações sensoriais acessíveis

---

## 7. Fluxo de Navegação

```
Splash
  │
  ▼
Onboarding (primeira vez)
  │
  ▼
Home (Estação Central)
  ├── Letras → Mapa de Letras (Trilho)
  │              ├── Conhecer a Letra
  │              ├── Traçar a Letra
  │              ├── Quiz (Identificar)
  │              └── Recompensa
  │
  ├── Números (bloqueado no MVP)
  │
  ├── Conquistas → Lista de conquistas e estrelas
  │
  └── Painel dos Pais (PIN)
       ├── Progresso
       ├── Limite de tempo
       └── Configurações sensoriais
```

---

## 8. Sistema de Recompensas

### 8.1 Estrelas

| Ação | Estrelas |
|---|---|
| Conhecer uma letra (ouvir + ver) | 1 ⭐ |
| Traçar a letra com sucesso | 1 ⭐ |
| Acertar o quiz de primeira | 1 ⭐ |
| Acertar o quiz na segunda tentativa | 0 ⭐ (mas sem punição) |

**Máximo por letra: 3 estrelas**
**Total possível no MVP: 78 estrelas (26 letras × 3)**

### 8.2 Conquistas (MVP)

| Conquista | Condição | Ícone |
|---|---|---|
| Primeira Viagem | Completar a primeira letra | 🚂 |
| Vogais Completas | Aprender A, E, I, O, U | 🌟 |
| Alfabeto Completo | Completar todas as 26 letras | 🏆 |

Conquistas adicionais planejadas para v1.0: Meia Estrada, Exploradora, Traço Perfeito, entre outras.

---

## 9. Áudio e Sons

### 9.1 Categorias de Áudio

| Categoria | Exemplos | Volume padrão |
|---|---|---|
| Voz da Nina (TTS) | "Olá!", "A de Abelha!", "Muito bem!" | 100% |
| Sons fonéticos | Som de cada letra | 100% |
| Efeitos | Acerto, confete, apito do trem | 80% |
| Música de fundo | Melodia suave e repetitiva | 40% |

### 9.2 Frases da Nina (PT-BR)

**Boas-vindas:**
- "Olá! Eu sou a Nina! Vamos aprender juntos?"
- "Que bom te ver de volta!"

**Durante atividade:**
- "Toque na letra para ouvir o som!"
- "Siga os pontinhos com o dedo!"
- "Qual é a letra [X]?"

**Acerto:**
- "Muito bem! Você acertou!"
- "Incrível! Você é demais!"
- "Uhuuu! Isso mesmo!"

**Erro (encorajamento):**
- "Quase! Tente de novo!"
- "Não foi dessa vez, mas você consegue!"
- "Vamos tentar mais uma vez?"

**Conquista:**
- "Parabéns! Você ganhou uma conquista!"
- "Olha só o que você conseguiu!"

**Limite de tempo (sugestão, não bloqueio):**
- "Que tal descansar um pouco? Amanhã a gente continua!"
- "Você já aprendeu bastante hoje! Vamos parar?"

**Onboarding:**
- "Olá! Eu sou a Nina! Qual é o seu nome?"
- "Que legal, [nome]! Eu vou te ajudar a aprender as letras!"
- "Toque na letra para ouvir o som dela!"
- "Siga os pontinhos com o dedo! Assim!"

---

## 10. Regras de Acessibilidade

### 10.1 Obrigatórias (sempre ativas)

- Máximo de 3 elementos interativos por tela
- Botões com área de toque mínima de 48x48dp
- Contraste mínimo de 4.5:1 para texto
- Feedback visual + sonoro em toda interação
- Nunca usar vermelho para erro
- Nunca usar timer com pressão (sem contagem regressiva)
- Navegação consistente (botão voltar sempre no mesmo lugar)

### 10.2 Configuráveis (painel dos pais)

| Configuração | Padrão | Opções |
|---|---|---|
| Animações | Ativadas | Ativadas / Reduzidas / Desativadas |
| Volume de efeitos | 80% | 0-100% |
| Música de fundo | Ativada (40%) | Ativada / Desativada + volume |
| Tamanho da fonte | Normal | Normal / Grande / Extra grande |
| Contraste | Normal | Normal / Alto |
| Velocidade da fala | Normal | Lenta / Normal / Rápida |
| Limite de tempo | Sem limite | 15 / 30 / 45 / 60 min / Sem limite |

### 10.3 Acessíveis pela criança

| Configuração | Descrição |
|---|---|
| Modo silencioso (🔇) | Botão no topo da Home, desliga todos os sons instantaneamente |

---

## 11. Recursos Gratuitos para o MVP

### Ilustrações
- [OpenGameArt](https://opengameart.org/) — sprites e cenários
- [Kenney.nl](https://kenney.nl/) — assets de jogos gratuitos
- [unDraw](https://undraw.co/) — ilustrações SVG
- Criar a Nina manualmente com formas simples no Flutter (CustomPainter)

### Fontes
- [Google Fonts](https://fonts.google.com/) — Nunito, Quicksand

### Sons
- [Freesound](https://freesound.org/) — efeitos sonoros
- [Pixabay Audio](https://pixabay.com/music/) — músicas de fundo
- Flutter TTS para voz da Nina

### Ícones
- [Material Icons](https://fonts.google.com/icons) — incluídos no Flutter

---

## 12. Métricas de Sucesso do MVP

| Métrica | Meta |
|---|---|
| Criança completa primeira letra | Em menos de 2 minutos |
| Sessão média | 5-10 minutos |
| Taxa de retorno | Criança quer usar novamente no dia seguinte |
| Completar alfabeto | Em 2-4 semanas de uso regular |
| Feedback dos pais | Positivo sobre acessibilidade |
