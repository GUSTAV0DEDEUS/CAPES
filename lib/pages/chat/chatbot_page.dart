import 'package:capes_for_you/core/auth/data/auth_repository.dart';
import 'package:capes_for_you/core/providers/chat_provider.dart';
import 'package:capes_for_you/core/styles/app_colors.dart';
import 'package:capes_for_you/pages/chat/components/chat_input.dart';
import 'package:capes_for_you/pages/chat/components/chat_message_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'components/filter_button.dart';
import 'components/search_input.dart';

class ChatbotPage extends StatelessWidget {
  const ChatbotPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: Center(
        child: SizedBox(
          width: 400,
          child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  if (Navigator.of(context).canPop()) {
                    Navigator.of(context).pop();
                  }
                },
                icon: const Icon(Icons.arrow_back, color: Colors.black),
              ),
              title: const Text('Como posso te ajudar?'),
              centerTitle: true,
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/img/person.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            body: Consumer<ChatProvider>(
              builder: (context, chatProvider, _) {
                if (chatProvider.currentChatId == null) {
                  // Tela inicial antes de iniciar o chat
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                              height: MediaQuery.of(context).size.height * 0.1),
                          Text(
                            'Como posso te ajudar?',
                            style: GoogleFonts.roboto(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'Aqui você encontra conteúdo científico diversificado para deixar sua pesquisa ainda melhor.',
                            style: GoogleFonts.roboto(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.black54,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Wrap(
                            alignment: WrapAlignment.start,
                            spacing: 8.0,
                            runSpacing: 8.0,
                            children: [
                              FilterButton(label: 'Nova Etiqueta'),
                              FilterButton(label: 'Periódicos'),
                              FilterButton(label: 'Livros'),
                              FilterButton(label: 'Bases de Dados'),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: ElevatedButton(
                              onPressed: () {
                                final userId = AuthRepository.idUser;
                                if (userId != null) {
                                  chatProvider.startNewChat(userId);
                                }
                              },
                              child: const Text('Iniciar Nova Conversa'),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const SearchInput(),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ],
                  );
                }

                // Interface do chat ativo
                return Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: chatProvider.messages.length,
                        itemBuilder: (context, index) {
                          final message = chatProvider.messages[index];
                          return ChatMessageWidget(message: message);
                        },
                      ),
                    ),
                    if (chatProvider.isLoading)
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(),
                      ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ChatInputWidget(
                        onSend: (message) {
                          chatProvider.sendMessage(message);
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
