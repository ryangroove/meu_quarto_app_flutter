class TextEntry {
  final String id;
  final String originalText;
  final int wordCount;
  final int charCount;
  final DateTime timestamp;

  TextEntry({
    required this.id,
    required this.originalText,
    required this.wordCount,
    required this.charCount,
    required this.timestamp,
  });

  Map<String, dynamic> toMap() {
    return {
      'originalText': originalText,
      'wordCount': wordCount,
      'charCount': charCount,
      'timestamp': timestamp.toIso8601String(),
    };
  }

  factory TextEntry.fromMap(String id, Map<String, dynamic> map) {
    return TextEntry(
      id: id,
      originalText: map['originalText'] ?? '',
      wordCount: map['wordCount'] ?? 0,
      charCount: map['charCount'] ?? 0,
      timestamp: DateTime.parse(map['timestamp']),
    );
  }
}
