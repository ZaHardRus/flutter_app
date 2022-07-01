import 'package:flutter/material.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({Key? key}) : super(key: key);

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login to your account")),
      body: ListView(
        children: [Header()],
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = const TextStyle(fontSize: 16, color: Colors.black);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _AuthForm(),
          SizedBox(height: 25),
          Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
            "Proin sagittis quis nibh a eleifend. Ut purus nunc, lacinia dignissim auctor sit amet, scelerisque vel erat. "
            "Registering new account",
            style: textStyle,
          ),
          SizedBox(
            height: 12,
          ),
          OutlinedButton(onPressed: () {}, child: Text("Registration")),
          SizedBox(height: 25),
          Text(
            "Nullam est dolor, eleifend ut congue ut, "
            "euismod quis elit. Vestibulum eleifend convallis tincidunt. Morbi ut aliquet orci. Aliquam quam orci, egestas quis molestie quis, suscipit nec leo. ",
            style: textStyle,
          ),
          SizedBox(
            height: 12,
          ),
          OutlinedButton(onPressed: () {}, child: Text("Verify email")),
        ],
      ),
    );
  }
}

class _AuthForm extends StatefulWidget {
  const _AuthForm({Key? key}) : super(key: key);

  @override
  State<_AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<_AuthForm> {
  final _usernameFieldController = TextEditingController();
  final _passwordFieldController = TextEditingController();
  String? errorText = null;

  void _authHandler() {
    final username = _usernameFieldController.value.text;
    final password = _passwordFieldController.value.text;
    if (username == '1' && password == '1') {
      errorText = null;
      Navigator.of(context).pushReplacementNamed('/home');
    } else {
      errorText = "Wrong";
    }
    setState(() {});
  }

  void _resetHandler() {
    print("reset");
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = const TextStyle(color: Color(0xFF212529), fontSize: 16);
    final textFieldStyle = const InputDecoration(
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        isCollapsed: true);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (errorText != null)
            Container(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Center(
                  child: Text(
                    "$errorText",
                    style: TextStyle(color: Colors.red, fontSize: 20),
                  ),
                )),
          Text(
            "Username",
            style: textStyle,
          ),
          TextField(
            controller: _usernameFieldController,
            decoration: textFieldStyle,
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            "Password",
            style: textStyle,
          ),
          TextField(
            controller: _passwordFieldController,
            obscureText: true,
            decoration: textFieldStyle,
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            children: [
              ElevatedButton(onPressed: _authHandler, child: Text("Login")),
              SizedBox(
                width: 32,
              ),
              TextButton(
                  onPressed: _resetHandler, child: Text("Reset password"))
            ],
          )
        ],
      ),
    );
  }
}
