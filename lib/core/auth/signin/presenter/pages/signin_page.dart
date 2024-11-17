import 'package:capes_for_you/core/auth/signin/presenter/state/auth_sigin_state.dart';
import 'package:capes_for_you/core/components/button_submit.dart';
import 'package:capes_for_you/core/components/text_app.dart';
import 'package:capes_for_you/core/components/text_field_form.dart';
import 'package:capes_for_you/core/styles/app_colors.dart';
import 'package:capes_for_you/core/styles/app_font_size.dart';
import 'package:capes_for_you/core/utils/constant/validators.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _signIn(BuildContext context) async {
    if (_formKey.currentState?.validate() ?? false) {
      final authState = context.read<AuthSiginState>();
      await authState.signIn(_emailController.text, _passwordController.text);
      if (authState.errorMessage != null) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(authState.errorMessage ?? 'Erro desconhecido')),
          );
        }
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Bem-vindo!')),
          );
          Navigator.pushReplacementNamed(context, '/home');
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = context.watch<AuthSiginState>();
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 400,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 66, horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const TextApp(
                  label: 'Entrar',
                  fontSize: AppFontSize.xxxLarge,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black,
                ),
                const SizedBox(height: 10),
                const TextApp(
                  label: 'Por favor, preencha os campos abaixo para entrar.',
                  color: AppColors.gray,
                ),
                const SizedBox(height: 15),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFieldForm(
                        controller: _emailController,
                        labelText: 'Email',
                        hintText: 'exemplo@gmail.com',
                        validator: emailValidator,
                      ),
                      const SizedBox(height: 15),
                      TextFieldForm(
                        controller: _passwordController,
                        labelText: 'Senha',
                        hintText: 'Sua senha',
                        obscureText: true,
                        validator: passwordValidator,
                      ),
                      const SizedBox(height: 15),
                      ButtonSubmitForm(
                        label: 'Entrar',
                        function: () => _signIn(context),
                        isLoading: authState.isLoading,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/signup');
                  },
                  child: const TextApp(
                    label: 'Ainda não tem uma conta? Cadastre-se!',
                    color: AppColors.black,
                    fontSize: AppFontSize.large,
                    alignment: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
