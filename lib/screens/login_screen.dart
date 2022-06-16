

import 'package:flutter/material.dart';
import 'package:shop_app/screens/product_overview_screen.dart';



class LogInScreen extends StatelessWidget {
  const LogInScreen({Key? key}) : super(key: key);

  void answerquestion() {
    print("Detail Submitted");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        //backgroundColor:Colors.blue,
        appBar: AppBar(
          title: const Text(
            "LogIn",
            style: TextStyle(
                fontSize: 40, fontWeight: FontWeight.bold, color: Colors.red),
          ),
          centerTitle: true,
        ),

        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Image.asset(
                  "assets/images/undraw_investor_update_re_qnuu (1).jpg"),

              Container(
                  margin: const EdgeInsets.all(10),
                  child: const SizedBox(
                    height: 60,
                    width: 300,
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Email",
                          hintText: "enter email"),
                    ),
                  )),
              Container(
                margin: const EdgeInsets.all(34),
                child: const SizedBox(
                  height: 60,
                  width: 300,
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "password",
                      hintText: "enter password",
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(20),
                child: SizedBox(
                  width: 200,
                  height: 60,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.indigo),
                    ),
                    onPressed: (){
                  Navigator.of(context).pushNamed(ProductOverviewScreen.routName);
                  },
                    child: const Text(
                      "Submit",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.red),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
