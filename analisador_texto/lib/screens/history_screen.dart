import 'package:flutter/material.dart';
import '../viewmodels/text_viewmodel.dart';
import '../widgets/history_item.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = TextViewModel();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Histórico de Textos"),
      ),
      body: StreamBuilder(
        stream: viewModel.getTextsStream(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final texts = snapshot.data!;

          if (texts.isEmpty) {
            return const Center(
              child: Text(
                "Ainda não há textos cadastrados.",
                style: TextStyle(fontSize: 16),
              ),
            );
          }

          return ListView.builder(
            itemCount: texts.length,
            itemBuilder: (context, index) {
              return HistoryItem(item: texts[index]);
            },
          );
        },
      ),
    );
  }
}
