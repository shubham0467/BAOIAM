import 'package:flutter/material.dart';
import 'login_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class account extends StatefulWidget {
  const account({Key? key}) : super(key: key);

  // final String email;

  @override
  State<account> createState() => _accountState();
}

class _accountState extends State<account> {
  final _formkey = GlobalKey<FormState>();
  String name = " ";
  var mobileNo = " ";
  String email = " ";
  var password = " ";

  final namecontroller = TextEditingController();
  final numbercontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  @override
  void dispose() {
    namecontroller.dispose();
    emailcontroller.dispose();
    passwordcontroller.dispose();
    numbercontroller.dispose();
  }

  // void initState() {
  //   super.initState();
  //   email = widget.email;
  //   _collectionReference = FirebaseFirestore.instance.collection(email);
  // }

  // Future<void> createUpdate([DocumentSnapshot? documentSnapshot]) async {
  //   String action = 'create';
  //   if (documentSnapshot != null) {
  //     action = 'update';
  //     _taskController.txt
  //   }
  // }

  Future<void> delete(String taskid) async {}
  CollectionReference students =
      FirebaseFirestore.instance.collection("Student");
  Future<void> addUser() {
    return students
        .add({
          'name': name,
          'Mobile No.': mobileNo,
          'email': email,
          'Password': password
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("failed to add user:$error"));
  }

  @override
  // final _firestore = FirebaseFirestore.instance;
  // late String email;
  // late String password;

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
                margin: const EdgeInsets.only(top: 80),
                child: const Text(
                  " WELCOME TO BAOIAM",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white70),
                ),
              ),
              Padding(
                //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  controller: namecontroller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Name';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      errorStyle: TextStyle(color: Colors.red),
                      labelText: 'Name',
                      hintText: 'Enter Name'),
                  // onChanged: (value) {
                  //   setState(() {
                  //     name = value;
                  //   });
                  //  },
                ),
              ),
              Padding(
                //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  controller: numbercontroller,
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
                  decoration: InputDecoration(
                      labelText: 'Phone Number', hintText: 'Mobile No.'),
                ),
              ),
              Padding(
                //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  controller: emailcontroller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter email';
                    } else if (!value.contains('@')) {
                      return 'Please enter a valid email';
                    }

                    return null;
                  },
                  decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: 'Enter valid email id as abc@gmail.com'),
                  // onChanged: (value) => setState(() {
                  //   email = value;
                  // }),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  obscureText: true,
                  controller: passwordcontroller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Name';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      labelText: 'Password', hintText: 'Enter secure password'),
                  // onChanged: (value) => setState(() {
                  //   password = value;
                  // }),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              GestureDetector(
                onTap: () {
                  //TODO FORGOT PASSWORD SCREEN GOES HERE
                },
                child: const Text(
                  'Forgot Password',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20)),
                child: TextButton(
                  onPressed: () async {
                    if (_formkey.currentState!.validate()) {
                      setState(() {
                        name = namecontroller.text;
                        mobileNo = numbercontroller.text;
                        email = emailcontroller.text;
                        password = passwordcontroller.text;
                        addUser();
                      });
                    }
                    // await FirebaseFirestore.instance.collection('Students').add(
                    //     {'name': name, 'mobileNo': mobileNo}).whenComplete(() {
                    //   //  txt.clear();
                    // });

                    // FirebaseAuth.instance
                    //     .createUserWithEmailAndPassword(
                    //         email: email, password: password)
                    //     .then((signedInUser) {
                    //   _firestore.collection('users').add({
                    //     'email': email,
                    //     'pass': password,
                    //   }).then((value) {
                    //     if (signedInUser != null) {
                    //       Navigator.pop(context);
                    //     }
                    //   }).catchError((e) {
                    //     print(e);
                    //   });
                    // }).catchError((e) {
                    //   print(e);
                    // });
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
