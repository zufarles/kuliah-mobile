import 'package:flutter/material.dart';
import 'package:flutter_application_1/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void initState(){
    super.initState();
    checkUser();
  }
  void checkUser(){
    final box = GetStorage();
    String? (username !=null){
      print("LOGIN USER${username}");
      Navigator.push(context, MaterialPageRoute(builder: ((context) => HomePage())));
    }
  }

  void login() {
    String UserName = nameController.text;
    String Password = passwordController.text;
    
    if (UserName != 'admin' || Password != 'admin'){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Username atau Password Salah"),
        ),
      ),
    };
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: <Widget>[
          Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: const Text(
                'Silahkan',
                style: TextStyle(
                    color: Color.fromARGB(255, 19, 20, 20),
                    fontWeight: FontWeight.w500,
                    fontSize: 30),
              )),
          Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: const Text(
                'Login',
                style: TextStyle(fontSize: 20),
              )),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'UserName',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: TextField(
              obscureText: true,
              controller: passwordController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              //forgot password screen
            },
            child: const Text(
              'Lupa Password',
            ),
          ),
          Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                child: const Text('Login'),
                onPressed: () {
                  print(nameController.text);
                  print(passwordController.text);
                },
              )),
          Row(
            children: <Widget>[
              const Text('Belum Punya Akun?'),
              TextButton(
                child: const Text(
                  'Masuk',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  //signup screen
                },
              )
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ],
      ),
    );
  }
}
