import 'package:capes_for_you/core/components/text_app.dart';
import 'package:capes_for_you/core/styles/app_colors.dart';
import 'package:flutter/material.dart';

class CYOPage extends StatelessWidget {
  const CYOPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            width: 400,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  const TextApp(
                    label: 'Capes For You',
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                  const SizedBox(height: 30),

                  // Logo da Aplicação
                  Image.asset(
                    'assets/img/logo.png',
                    height: 180,
                  ),
                  const SizedBox(height: 50),

                  _buildActionButton(
                    label: 'Entrar',
                    color: AppColors.blue,
                    textColor: AppColors.white,
                    icon: Icons.login,
                    onPressed: () {
                      Navigator.pushNamed(context, '/signin');
                    },
                  ),
                  const SizedBox(height: 20),
                  _buildActionButton(
                    label: 'Cadastrar',
                    color: AppColors.blue,
                    textColor: AppColors.white,
                    icon: Icons.person_add,
                    onPressed: () {
                      Navigator.pushNamed(context, '/signup');
                    },
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required String label,
    required Color color,
    required Color textColor,
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        minimumSize: const Size(double.infinity, 55),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        elevation: 5,
      ),
      onPressed: onPressed,
      icon: Icon(icon, color: textColor),
      label: Text(
        label,
        style: TextStyle(
          color: textColor,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
