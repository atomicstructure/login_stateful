import 'package:flutter/material.dart';
import '../scr/blocs/bloc.dart';
import '../scr/blocs/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);

    return Container(
      margin: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          emailField(bloc),
          const SizedBox(height: 20.0), // Add this line
          passwordField(bloc),
          const SizedBox(
            height: 20.0,
          ),
          submitButton(bloc),
        ],
      ),
    );
  }

  Widget emailField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.email,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.changeEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            prefixIcon: const Icon(Icons.email),
            labelText: 'Email',
            hintText: 'Enter your email',
            errorText:
                snapshot.error != null ? snapshot.error.toString() : null,
          ),
        );
      },
    );
  }

  Widget passwordField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.changePassword,
          obscureText: true,
          obscuringCharacter: '*',
          decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            prefixIcon: const Icon(Icons.lock),
            suffixIcon: const Icon(Icons.visibility),
            labelText: 'Password',
            hintText: 'Enter your password',
            errorText:
                snapshot.error != null ? snapshot.error.toString() : null,
          ),
        );
      },
    );
  }

  Widget submitButton(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.submitValid,
      builder: (context, snapshot) {
        return ElevatedButton(
          style: ButtonStyle(
            backgroundColor: const MaterialStatePropertyAll(
              Colors.deepPurple,
            ),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
            ),
          ),
          onPressed: snapshot.hasData ? bloc.submit : null,
          child: const Text(
            'Login',
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }
}
