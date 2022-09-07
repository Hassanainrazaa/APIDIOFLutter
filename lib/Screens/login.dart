import 'package:apihitting/Screens/profle.dart';
import 'package:dio/dio.dart';
import "package:flutter/material.dart";

class LoginUi extends StatefulWidget {
  const LoginUi({Key? key}) : super(key: key);

  @override
  State<LoginUi> createState() => _LoginUiState();
}

class _LoginUiState extends State<LoginUi> {
  bool checkstate = false;
  TextEditingController emailctrl = TextEditingController();
  TextEditingController passwordctrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Image.network(
              "https://i.postimg.cc/N01ys8RP/home.png",
              width: 200,
              //height: 100,
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 45,
              margin: const EdgeInsets.only(left: 10, right: 10),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: TextFormField(
                controller: emailctrl,
                decoration: InputDecoration(
                  hintText: "Email Address",
                  labelText: "Email Address",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  filled: true,
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              height: 45,
              margin: const EdgeInsets.only(left: 10, right: 10),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: TextFormField(
                controller: passwordctrl,
                decoration: InputDecoration(
                  hintText: "Password",
                  labelText: "Password",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  filled: true,
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              width: 120,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: FlatButton(
                  color: Colors.blue,
                  onPressed: () {
                    confirmLogin();
                    _indicator();
                  },
                  child: const Text("Proceed")),
            ),
          ],
        ),
      ),
    ));
  }

  Future confirmLogin() async {
    final dio = Dio();
    const Url = "https://api.staging.zeedlive.com/api/v1/login";

    var formData = FormData.fromMap({
      'email': emailctrl.text.toString(),
      'password': passwordctrl.text.toString()
    });

    try {
      final responce = await dio.post(Url, data: formData);
      print(responce.data.toString());

      if (responce.data['success'] == true) {
        String name = responce.data['user']['name'].toString();
        String email = responce.data['user']['email'].toString();
        String phoneno = responce.data['user']['mobile'].toString();
        String gender = responce.data['user']['gender'].toString();
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProfileUidetails(
                  name_: name,
                  email_: email,
                  mobile_: phoneno,
                  gender_: gender)),
        );

        MaterialPageRoute(
            builder: (context) => ProfileUidetails(
                name_: name, email_: email, mobile_: phoneno, gender_: gender));

        print("Login Successfully");
        print(responce.data['user']['name'].toString());
      } else {
        print("Login Failed");
      }
    } catch (error) {
      print(error);
    }
  }

  Widget _indicator() {
    return Container(
      margin: const EdgeInsets.only(left: 30, right: 30),
      child: const LinearProgressIndicator(
        backgroundColor: Colors.redAccent,
        valueColor: AlwaysStoppedAnimation(Colors.blue),
        minHeight: 5,
      ),
    );
  }
}
