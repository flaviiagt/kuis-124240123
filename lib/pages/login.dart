import 'package:flutter/material.dart';
import '../models/data.dart';
import 'package:kuis/pages/root.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isLoggedIn = false;

  void login() {
    String username = usernameController.text;
    String password = passwordController
        .text; //controller adalah untuk mengambil inputan dari user

    if (username == user1.username && password == user1.password) {
      setState(() {
        //setstate untuk merubah state dari widget, misal dari false ke true
        isLoggedIn = true;
      });

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Root(), 
        ), //pushReplacement untuk mengganti halaman login dengan halaman root
      );

      ScaffoldMessenger.of(context).showSnackBar(
        //ScaffoldMessenger untuk menampilkan snackbar
        SnackBar(
          backgroundColor: Colors.green,
          content: Text('Login successful!'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text('Login failed. Invalid username or password'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 180, 40),
        foregroundColor: const Color.fromARGB(255, 243, 220, 255),
        title: Text('Login Page'),
      ),

      body: Center(
        child: Container(
          //container udh punya padding jd bisa disatuin
          width: 400,
          height: 300,
          padding: const EdgeInsets.all(25.0), //kasih padding ke semua sisi, kalo mau beda beda per sisi pake .only
          decoration: BoxDecoration( //tempat mengatur tampilan kotak
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(10), //sudut melengkung
          ),
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, //mengatur posisi sumbu vertikal
            children: [
              Text(
                'LOGIN',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30), //30 adalah spasi dengan text login
              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  hintText: 'Username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
              ),
              SizedBox(height: 15),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: login, 
                style: ElevatedButton.styleFrom(
                  backgroundColor:Color.fromARGB(255, 255, 180, 40),
                  foregroundColor: Color.fromARGB(255, 216, 238, 255),
                  minimumSize: Size(400, 45),
                ),
                child: Text("Login"),
                ),
            ],
          ),
        ),
      ),
    );
  }
}