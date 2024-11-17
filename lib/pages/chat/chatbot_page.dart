import 'package:capes_for_you/core/auth/data/auth_repository.dart';
import 'package:capes_for_you/core/providers/chat_provider.dart';
import 'package:capes_for_you/core/styles/app_colors.dart';
import 'package:capes_for_you/pages/chat/components/chat_input.dart';
import 'package:capes_for_you/pages/chat/components/chat_message_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatbotPage extends StatefulWidget {
  const ChatbotPage({Key? key}) : super(key: key);

  @override
  State<ChatbotPage> createState() => _ChatbotPageState();
}

class _ChatbotPageState extends State<ChatbotPage> {
  @override
  void initState() {
    super.initState();

    // Inicia automaticamente uma nova conversa com o bot
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final chatProvider = Provider.of<ChatProvider>(context, listen: false);
      final userId = AuthRepository.idUser;

      if (userId != null && chatProvider.currentChatId == null) {
        chatProvider.startNewChat(userId);
      }
    });
  }

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
