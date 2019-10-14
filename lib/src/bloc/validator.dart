import 'dart:async';

class Validator {  
  final validateEmail = StreamTransformer<String, String>.fromHandlers(
    handleData:(email, sink) {
    if (email.contains("@")) {
      sink.add(email);
    } else {
      sink.addError("Enter a valid email.");
    }
  });

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length < 6) {
      sink.addError("weak password letters <6");
    } else {
      sink.add(password);
    }
  });

  /// actually we have a better way to have this done by using
  /// Rxdart where library ReactiveX liraries for dart
  /// with methods for multiple Streams or merging two streams for our case
  /// so that situation when the both streams has no errors
}