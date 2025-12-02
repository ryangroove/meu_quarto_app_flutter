import 'package:flutter/material.dart';
import '../viewmodels/text_viewmodel.dart';

class AddTextScreen extends StatefulWidget {
  const AddTextScreen({super.key});

  @override
  State<AddTextScreen> createState() => _AddTextScreenState();
}

class _AddTextScreenState extends State<AddTextScreen> {
  final TextEditingController _controller = TextEditingController();
  final TextViewModel _viewModel = TextViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Adicionar Texto"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              maxLines: 6,
              decoration: const InputDecoration(
                labelText: "Digite seu texto",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                String text = _controller.text.trim();
                if (text.isNotEmpty) {
                  await _viewModel.addText(text);
                  Navigator.pop(context);
                }
              },
              child: const Text("Salvar"),
            ),
          ],
        ),
      ),
    );
  }
}
