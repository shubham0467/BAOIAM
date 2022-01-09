import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);
  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  final _formKey = GlobalKey<FormState>();
  var name = " ";
  var mobileNo = " ";
  var email = " ";
  String password = " ";
  final _firestore = FirebaseFirestore.instance;
  final nameController = TextEditingController();
  final numberController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    numberController.dispose();
    super.dispose();
  }

  clearText() {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
  }

  CollectionReference students =
      FirebaseFirestore.instance.collection('Students');
  Future<void> addUser() {
    return students
        .add({
          'Name': name,
          'Mobile No.': mobileNo,
          'email': email,
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("failed to add user:$error"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.blue.shade900, Colors.white]),
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: Center(
                  child: Container(
                      width: 200,
                      height: 150,
                      /*decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(50.0)),*/
                      child: Image.asset('assets/logo_blue.png')),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 40),
                child: const Text(
                  " WELCOME TO BAOIAM",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white70),
                ),
              ),
              Container(
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 30),
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10.0),
                          child: TextFormField(
                            controller: nameController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter Name';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                                errorStyle: TextStyle(color: Colors.red),
                                labelText: 'Name',
                                hintText: 'Enter Name'),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10.0),
                          child: TextFormField(
                            controller: numberController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter Number';
                              }
                              return null;
                            },
                            // onChanged: (data) {
                            //   setState(() {
                            //     mobileNo = int.parse(data);
                            //   });
                            // },
                            decoration: const InputDecoration(
                                labelText: 'Phone Number',
                                hintText: 'Mobile No.'),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10.0),
                          child: TextFormField(
                            controller: emailController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter email';
                              } else if (!value.contains('@')) {
                                return 'Please enter a valid email';
                              }

                              return null;
                            },
                            decoration: const InputDecoration(
                                labelText: 'Email',
                                hintText:
                                    'Enter valid email id as abc@gmail.com'),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10.0),
                          child: TextFormField(
                            obscureText: true,
                            controller: passwordController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter Name';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                                labelText: 'Password',
                                hintText: 'Enter secure password'),
                            onChanged: (value) => setState(() {
                              password = value;
                            }),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),

              // SizedBox(
              //   height: 22,
              // ),
              Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20)),
                child: TextButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        name = nameController.text;
                        mobileNo = numberController.text;
                        email = emailController.text;

                        addUser();
                      });
                    }

                    FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: email, password: password)
                        .then((signedInUser) {
                      _firestore.collection('Students').add({
                        'email': email,
                        'pass': password,
                      }).then((value) {
                        if (signedInUser != null) {
                          Navigator.pop(context);
                        }
                      }).catchError((e) {
                        print(e);
                      });
                    }).catchError((e) {
                      print(e);
                    });
                  },
                  child: const Text(
                    'SIGN UP',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LoginDemo()),
                    );
                  },
                  child: const Text(
                    'Already Registered? Login Here',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
