import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/text_entry.dart';

class TextViewModel {
  final CollectionReference _collection =
      FirebaseFirestore.instance.collection('texts');

  Stream<List<TextEntry>> getTextsStream() {
    return _collection
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((query) => query.docs
            .map((doc) => TextEntry.fromMap(doc.id, doc.data() as Map<String, dynamic>))
            .toList());
  }

  Future<void> addText(String text) async {
    final entry = TextEntry(
      id: '',
      originalText: text,
      wordCount: _countWords(text),
      charCount: text.length,
      timestamp: DateTime.now(),
    );

    await _collection.add(entry.toMap());
  }

  int _countWords(String text) {
    if (text.trim().isEmpty) return 0;
    return text.trim().split(RegExp(r'\s+')).length;
  }
}
