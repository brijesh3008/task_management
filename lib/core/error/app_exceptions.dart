/// [ServerException] is used when server throws an error
class ServerException implements Exception {}

/// [CacheException] is used when Local DB throws an error
class CacheException implements Exception {
  final dynamic message;

  const CacheException([this.message]);

  @override
  String toString() {
    Object? message = this.message;
    if (message == null) {
      return 'Exception';
    }
    return 'Exception: $message';
  }
}

/// [StatusException] throws when API Response status code is not 200
class StatusException implements Exception {
  final dynamic message;

  const StatusException([this.message]);

  @override
  String toString() {
    Object? message = this.message;
    if (message == null) {
      return 'Exception';
    }
    return 'Exception: $message';
  }
}

/// [InvalidApiKeyException] throws when API key is no t valid
class InvalidApiKeyException implements Exception {
  final dynamic message;

  const InvalidApiKeyException([this.message]);

  @override
  String toString() {
    Object? message = this.message;
    if (message == null) {
      return 'Exception';
    }
    return 'Exception: $message';
  }
}

