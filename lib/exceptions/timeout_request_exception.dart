class TimeoutRequestException implements Exception {
  final String message;
  TimeoutRequestException(this.message);

  @override
  String toString() => 'TimeoutRequestException: $message';
}
