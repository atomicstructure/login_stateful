import 'dart:async';
import '../blocs/validators.dart';

class Bloc extends Object with Validators {
  final _emailController = StreamController<String>();
  final _passwordController = StreamController<String>();

  Stream<String> get email => _emailController.stream.transform(validateEmail);
  Stream<String> get password =>
      _passwordController.stream.transform(validatePassword);

  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  void dispose() {
    _emailController.close();
    _passwordController.close();
  }
}
