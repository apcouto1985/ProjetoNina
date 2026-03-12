# 🚂 Nina

**Nina** é um aplicativo educacional gratuito, sem anúncios e sem compras, projetado para ajudar crianças neurodivergentes de 4 a 12 anos na identificação de letras e números, apoiando o processo de alfabetização.

A personagem-guia é uma trenzinho simpática chamada Nina, com rosto amigável e orelhas grandes de cocker spaniel inglês, que acompanha a criança em toda a jornada de aprendizado.

---

## 🎯 Objetivo

Criar uma ferramenta de alfabetização que:
- Seja acessível para crianças neurodivergentes (TEA, TDAH, dislexia, entre outros)
- Prenda a atenção da criança tanto quanto apps de vídeo e jogos
- Ofereça feedback positivo e nunca punitivo
- Respeite o ritmo individual de cada criança

## ✨ Funcionalidades

### MVP (v0.1)
- Reconhecimento de letras A-Z com som fonético
- Traçar letras com o dedo (escrita guiada)
- Palavra associada por letra (A = Abelha, B = Bola...)
- Trenzinho Nina como personagem-guia (feminina)
- Sistema de estrelas como recompensa
- Mundo temático: Estação (ambiente simples e acolhedor)
- Painel dos pais com progresso e configurações sensoriais
- Idioma: Português (BR)

### v1.0 (planejado)
- Números 0-20 (identificar, traçar, contar)
- Idiomas: Inglês e Espanhol
- Novos mundos temáticos

### v1.5 (planejado)
- Formação de sílabas e palavras simples
- Álbum de figurinhas colecionáveis
- Mundos adicionais

### v2.0 (planejado)
- Operações matemáticas básicas
- Acessibilidade avançada
- Modo offline completo

## 🧩 Acessibilidade

O app foi projetado com foco em crianças neurodivergentes:
- Interface limpa com um elemento de foco por vez
- Feedback imediato (visual + sonoro) em cada interação
- Erros tratados com encorajamento, nunca punição
- Cores cuidadosamente escolhidas (sem vermelho para erros)
- Opção de reduzir animações e sons no painel dos pais
- Contraste alto e fontes grandes
- Navegação previsível e consistente

## 🌍 Idiomas

| Idioma | Status |
|---|---|
| Português (BR) | 🟢 MVP |
| Inglês (US) | 🟡 Planejado v1.0 |
| Espanhol (LATAM) | 🟡 Planejado v1.0 |

## 🛠️ Tecnologia

| Item | Escolha |
|---|---|
| Framework | Flutter (Dart) |
| Plataformas | Android e iOS |
| Persistência | Hive / Isar |
| Áudio | audioplayers + flutter_tts |
| Animações | Rive + Lottie |
| Estado | Riverpod ou Bloc |

## 📁 Estrutura do Projeto

```
nina/
├── lib/
│   ├── main.dart
│   ├── app/                    # App, rotas, tema
│   ├── features/
│   │   ├── splash/             # Tela inicial
│   │   ├── home/               # Estação central (menu)
│   │   ├── letters/            # Módulo de letras
│   │   ├── numbers/            # Módulo de números
│   │   ├── rewards/            # Recompensas
│   │   └── parent_panel/       # Painel dos pais
│   ├── core/
│   │   ├── audio/              # Sons e TTS
│   │   ├── accessibility/      # Config. sensoriais
│   │   ├── i18n/               # Internacionalização
│   │   └── storage/            # Persistência local
│   └── shared/
│       ├── widgets/            # Componentes reutilizáveis
│       ├── nina_character/     # Animações do trenzinho
│       └── theme/              # Tokens de design
├── assets/
│   ├── images/                 # Ilustrações
│   ├── audio/                  # Sons e músicas
│   └── fonts/                  # Tipografia
└── test/                       # Testes
```

## 🎨 Estilo Visual

- **Estilo:** Cartoon Vibrante
- **Cor primária (Nina):** #DAA520 (dourado)
- **Tipografia:** Nunito (títulos) + Quicksand (corpo)
- **Princípio:** Vibrante e divertido, mas com controle de estímulos para não sobrecarregar

## 👨‍👩‍👧 Público-Alvo

- **Crianças:** 4 a 12 anos, neurodivergentes
- **Pais/Cuidadores:** Painel de acompanhamento e configuração

## 📄 Licença

Este projeto é gratuito e de código aberto.

## 📬 Contato

Repositório: [github.com/apcouto1985/ProjetoNina](https://github.com/apcouto1985/ProjetoNina)
