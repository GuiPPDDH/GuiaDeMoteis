class JsonDecodingException implements Exception {
  final String message;
  JsonDecodingException(this.message);
  @override
  String toString() => 'JsonDecodingException: $message';
}
