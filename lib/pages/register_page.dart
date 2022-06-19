import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({Key? key,
  required this.showLoginPage,
  }) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneNumberController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmpasswordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  Future signUp() async{
    if(passwordConfirmed()){
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim()
      );

      // Add user Details to the database
      addUserDetials(
        _firstNameController.text.trim(),
        _lastNameController.text.trim(),
        _emailController.text.trim(),
        int.parse(_phoneNumberController.text.trim()),
      );

    }
  }


  Future addUserDetials(String firstName , String lastName ,String email,  int phoneNumber) async {
    await FirebaseFirestore.instance.collection('users').add(
      {
        'first name':firstName,
        'last name':lastName,
        'email':email,
        'phone number':phoneNumber,

      });
  }

  bool passwordConfirmed(){
    if (_passwordController.text.trim()
        == _confirmpasswordController.text.trim()){
      return true;
    }else{
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child:Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  //Hello There test
                  Text(
                      'Hello There!',
                      style:GoogleFonts.bebasNeue(
                        fontSize: 52,
                      )
                  ),
                  //Sized box used to space out text
                  SizedBox(height: 10),
                  Text(
                    'Register below with your details!',
                    style:TextStyle(
                      fontWeight:FontWeight.bold,
                      fontSize:24,
                    ),
                  ),//
                  SizedBox(height: 20),
                  //first Name
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child:TextField(
                      controller:_firstNameController,
                      decoration:InputDecoration(
                        enabledBorder:OutlineInputBorder(
                          borderSide:BorderSide(color:Colors.white),
                          borderRadius:BorderRadius.circular(12),
                        ),
                        focusedBorder:OutlineInputBorder(
                          borderSide:BorderSide(color: Colors.deepPurple),
                          borderRadius:BorderRadius.circular(12),
                        ),
                        hintText:'First Name',
                        fillColor:Colors.grey[200],
                        filled:true,
                      ),
                    ),
                  ),
                  //Sized box used to space out text
                  SizedBox(height: 10),
                  //Last name text field
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child:TextField(
                      controller:_lastNameController,
                      decoration:InputDecoration(
                        enabledBorder:OutlineInputBorder(
                          borderSide:BorderSide(color:Colors.white),
                          borderRadius:BorderRadius.circular(12),
                        ),
                        focusedBorder:OutlineInputBorder(
                          borderSide:BorderSide(color: Colors.deepPurple),
                          borderRadius:BorderRadius.circular(12),
                        ),
                        hintText:'Last Name',
                        fillColor:Colors.grey[200],
                        filled:true,
                      ),
                    ),
                  ),
                  //Sized box used to space out text
                  SizedBox(height: 10),
                  //Phone Number Text Field
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child:TextField(
                      controller:_phoneNumberController,
                      decoration:InputDecoration(
                        enabledBorder:OutlineInputBorder(
                          borderSide:BorderSide(color:Colors.white),
                          borderRadius:BorderRadius.circular(12),
                        ),
                        focusedBorder:OutlineInputBorder(
                          borderSide:BorderSide(color: Colors.deepPurple),
                          borderRadius:BorderRadius.circular(12),
                        ),
                        hintText:'Phone Number',
                        fillColor:Colors.grey[200],
                        filled:true,
                      ),
                    ),
                  ),
                  //Sized box used to space out text
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child:TextField(
                      controller:_emailController,
                      decoration:InputDecoration(
                        enabledBorder:OutlineInputBorder(
                          borderSide:BorderSide(color:Colors.white),
                          borderRadius:BorderRadius.circular(12),
                        ),
                        focusedBorder:OutlineInputBorder(
                          borderSide:BorderSide(color: Colors.deepPurple),
                          borderRadius:BorderRadius.circular(12),
                        ),
                        hintText:'Email',
                        fillColor:Colors.grey[200],
                        filled:true,
                      ),
                    ),
                  ),
                  //Sized box used to space out text
                  SizedBox(height: 10),
                  //PasswordText Field
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child:TextField(
                      //This makes the text hidden  obscureText
                      obscureText: true,
                      controller:_passwordController,
                      decoration:InputDecoration(
                        enabledBorder:OutlineInputBorder(
                          borderSide:BorderSide(color:Colors.white),
                          borderRadius:BorderRadius.circular(12),
                        ),
                        focusedBorder:OutlineInputBorder(
                          borderSide:BorderSide(color: Colors.deepPurple),
                          borderRadius:BorderRadius.circular(12),
                        ),
                        hintText:'Password',
                        fillColor:Colors.grey[200],
                        filled:true,
                      ),
                    ),
                  ),
                  //Sized box used to space out text
                  SizedBox(height: 10),


                  //Confirm Password text field
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child:TextField(
                      //This makes the text hidden  obscureText
                      obscureText: true,
                      controller:_confirmpasswordController,
                      decoration:InputDecoration(
                        enabledBorder:OutlineInputBorder(
                          borderSide:BorderSide(color:Colors.white),
                          borderRadius:BorderRadius.circular(12),
                        ),
                        focusedBorder:OutlineInputBorder(
                          borderSide:BorderSide(color: Colors.deepPurple),
                          borderRadius:BorderRadius.circular(12),
                        ),
                        hintText:'Confirm Password',
                        fillColor:Colors.grey[200],
                        filled:true,
                      ),
                    ),
                  ),
                  //Sized box used to space out text
                  SizedBox(height: 10),
                  //Sign in button
                  Padding(
                    padding:const EdgeInsets.symmetric(horizontal:25.0),
                    child: GestureDetector(
                      onTap: signUp,
                      child:Container(
                        padding:EdgeInsets.all(20),
                        decoration:BoxDecoration(
                          color:Colors.deepPurple,
                          borderRadius:BorderRadius.circular(12),
                        ),
                        child:Center(
                          child:Text(
                            'Sign Up',
                            style:TextStyle(
                              color:Colors.white,
                              fontWeight:FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),//
                      ),
                    ),
                  ),
                  //Sized box used to space out text
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      Text(
                        'I am a member! ',
                        style:TextStyle(
                          fontWeight:FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: widget.showLoginPage,
                        child: Text(
                          "Login now",
                          style:TextStyle(
                            color:Colors.blue,
                            fontWeight:FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  //Register Button
                ],),
            ),
          ),
        )
    );
  }
}
