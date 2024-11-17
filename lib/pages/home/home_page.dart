import 'package:capes_for_you/pages/home/components/info_card.dart';
import 'package:capes_for_you/pages/home/components/reusable_item.dart';
import 'package:capes_for_you/pages/home/components/section.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter UI'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Section(
              title: "Periódicos",
              items: List.generate(
                  2,
                  (index) => ReusableItem(
                      title: "Directory of Open Access Journals (DOAJ)")),
            ),
            Section(
              title: "Livros",
              items: List.generate(
                  2,
                  (index) => ReusableItem(
                      title: "Directory of Open Access Journals (DOAJ)")),
            ),
            Section(
              title: "Bases Coleções",
              items: List.generate(
                  2,
                  (index) => ReusableItem(
                      title: "Directory of Open Access Journals (DOAJ)")),
            ),
            Section(
              title: "Informativos",
              items: [
                InfoCard(
                  date: "20 Out 2024",
                  title: "Premiação reconhece pesquisadores de todo o Brasil",
                  description:
                      "As 15 cientistas selecionadas foram destaques nas áreas de Exatas, Médicas e Humanas...",
                ),
                InfoCard(
                  date: "15 Nov 2024",
                  title:
                      "Cerimônia de premiação para mulheres ocorre na quarta-feira",
                  description:
                      "Solenidade terá início às 14h e será realizada no auditório da CAPES, com transmissão ao vivo...",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
