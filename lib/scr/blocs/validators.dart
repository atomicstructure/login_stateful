import 'dart:async';

mixin Validators {
  final validateEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink) {
      if (email.isEmpty) {
        sink.addError('Email is required');
      } else if (!email.contains('@')) {
        sink.addError('Email must contain @');
      } else if (!email.contains('.')) {
        sink.addError('Email must contain .');
      } else {
        sink.add(email);
      }
    },
  );

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink) {
      if (password.isEmpty) {
        sink.addError('Password is required');
      } else if (password.length <= 8) {
        sink.addError('Password must be more than 8 characters');
      } else if (!password.contains(RegExp(r'[A-Z]'))) {
        sink.addError('Password must contain at least one uppercase letter');
      } else if (!password.contains(RegExp(r'[0-9]'))) {
        sink.addError('Password must contain at least one number');
      } else if (!password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
        sink.addError('Password must contain at least one special character');
      } else {
        sink.add(password);
      }
    },
  );
}
