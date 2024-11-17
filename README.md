# 🌟 PÉROLA - O Assistente Inteligente do CAPES 🌟  
![Legenda](./assets/img/perola.png)

[👉 Experimente o PÉROLA ao vivo clicando aqui!](https://capes-e45a9.web.app/)  

---

## 📸 **Design no Figma**

Este projeto vai além da criação do **PÉROLA**. Nosso objetivo é aprimorar toda a jornada do usuário na plataforma da CAPES, tornando a experiência mais intuitiva, eficiente e acessível.  

Se você está interessado em explorar mais sobre a nossa solução, incluindo as melhorias projetadas para a interface e funcionalidades, confira o design completo no Figma:

[👉 Explore o design no Figma clicando aqui!](https://www.figma.com/design/fQtwR9fbTunRKDD8J6fJlV/CAPES?node-id=79-295&t=C0VdYxh831DBDkJP-1)  

---

## 📖 **Descrição do Projeto**
**PÉROLA** é um bot de inteligência artificial desenvolvido para auxiliar os usuários do **CAPES** na busca por informações científicas, artigos acadêmicos, periódicos e outras fontes relevantes para pesquisa.  

Projetado para oferecer uma interface amigável e acessível, **PÉROLA** utiliza o poder do **Flutter**, **Firebase** e a API de geração de texto do **Gemine (Generative API)** para oferecer uma experiência rápida, precisa e eficiente.  

---

## 🚀 **Tecnologias Utilizadas**
- **Flutter:** Framework utilizado para a construção da interface de usuário.  
- **Firebase:** Utilizado para autenticação, banco de dados em tempo real e hospedagem do projeto.  
- **.env:** Configuração das chaves de API para segurança e simplicidade.  
- **Gemine Generative API:** Responsável por gerar respostas com IA.  

---

## 💻 **Como Rodar o Projeto na Sua Máquina**

### **Pré-requisitos**
Certifique-se de ter as seguintes ferramentas instaladas:
- [Flutter SDK](https://docs.flutter.dev/get-started/install)  
- [Dart SDK](https://dart.dev/get-dart)  
- [Firebase CLI](https://firebase.google.com/docs/cli)  
- Editor de código, como [Visual Studio Code](https://code.visualstudio.com/) ou [Android Studio](https://developer.android.com/studio).  
- Conta no Firebase.  

### **Passo a Passo**

1. **Clone o Repositório**
   ```bash
   git clone https://github.com/GUSTAV0DEDEUS/CAPES
   cd PEROLA-AI
   ```

2. **Instale as Dependências**
   Execute o comando abaixo para instalar todas as dependências do Flutter:  
   ```bash
   flutter pub get
   ```

3. **Configuração do Firebase**
   - Acesse o [Console do Firebase](https://console.firebase.google.com/).
   - Crie um novo projeto e configure o nome do seu app.  
   - Ative os seguintes serviços no Firebase:  
     - **Authentication** (Escolha o método de autenticação necessário, como Google ou Email/Password).  
     - **Firestore Database**.  
     - **Hosting** (para rodar no Web).  

  Segue a versão corrigida da seção **Adicione o Firebase ao seu App Flutter**:

---

### **Adicione o Firebase ao seu App Flutter**

1. **Login na sua conta Firebase**  
   - No terminal, faça login na sua conta Firebase com o comando:  
     ```bash
     firebase login
     ```

2. **Instale o FlutterFire CLI**  
   - Baixe o CLI oficial do Firebase para Flutter com o comando:  
     ```bash
     dart pub global activate flutterfire_cli
     ```

3. **Configure o Firebase no PÉROLA**  
   - Associe o app ao projeto Firebase que você criou:  
     ```bash
     flutterfire configure --project=<seu_projeto_firebase>
     ```
   - Esse comando irá:
     - Configurar automaticamente os arquivos necessários no seu projeto, como `firebase_options.dart`.
     - Registrar os apps (iOS, Android e Web) no projeto do Firebase.

Agora o **PÉROLA** está configurado corretamente para usar o Firebase no Flutter!
---

### **Adicione o ENV ao seu App Flutter**

4. **Configuração do Arquivo `.env`**
   - Crie um arquivo chamado `.env` no diretório raiz do projeto:
     ```bash
     touch .env
     ```
   - Adicione a chave da API generativa do **Gemine** no `.env`:
     ```env
     GENERATIVE_API_KEY=SUA_CHAVE_DE_API_AQUI
     ```

5. **Rodando o Projeto**
   - Para rodar no dispositivo físico/emulador:
     ```bash
     flutter run
     ```
   - Para rodar no navegador (Flutter Web):
     ```bash
     flutter run -d chrome
     ```

6. **Deploy para o Firebase Hosting (opcional)**
   - Faça o build para web:
     ```bash
     flutter build web
     ```
   - Implante no Firebase:
     ```bash
     firebase deploy
     ```

---

## 🛠️ **Funcionalidades Principais**
- 🔎 Busca por artigos, livros e bases de dados disponíveis na CAPES.  
- 💬 Interação com o bot via mensagens.  
- 📂 Etiquetas de filtro para categorizar buscas.  
- ⚡ Respostas geradas dinamicamente pela API Generative da Gemine.  

---

## 📝 **Licença**
Este projeto é de código aberto e está sob a licença [MIT](LICENSE).  

---

💡 **Dúvidas ou Sugestões?** Entre em contato via [gustavodedeusconceicao@gmail.com].
