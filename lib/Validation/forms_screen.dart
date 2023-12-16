import 'package:flutter/material.dart';
import 'Input_Reusable_widget.dart';
import 'LoginScreen.dart';


class formsscreen extends StatefulWidget {

  @override
  State<formsscreen> createState() => _formsscreenState();

}


class _formsscreenState extends State<formsscreen> {
  bool isHide = true;
  TextEditingController userName = TextEditingController();
  TextEditingController userEmail = TextEditingController();
  TextEditingController userPassword = TextEditingController();

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forms Screen'),
      ),
      body: Form(
        key: formkey,
        child: Column(
          children:  [
            TextWidget_Reusable(
              textController: userName,
              name: "Enter Name",
              hint: 'Papa Jones',
              icon: Icon(Icons.person),
              passHide: false,
              errormsg: "Enter Your Name",
              length: false,
            ),
            TextWidget_Reusable(
              textController: userEmail,
              name: "Enter Email",
              hint: 'Papa_Jones@gmail.com',
              icon: Icon(Icons.email),
              passHide: false,
              errormsg: "Enter Your Email",
              length: false,
            ),
            TextWidget_Reusable(
              textController: userPassword,
              name: "Password",
              hint: '*******',
              length: true,
              icon: const Icon(Icons.password),
              passHide: isHide==true?true:false,
              passIcon: IconButton(onPressed: (){
                setState((){
                  isHide = ! isHide;
                });
              }, icon: isHide==true? Icon(Icons.remove_red_eye_rounded):Icon(Icons.panorama_fish_eye)),
              errormsg: "Enter Your Password",

            ),

            ElevatedButton(onPressed: (){
              if(formkey.currentState!.validate()){

                  debugPrint(userName.text);
                  debugPrint(userEmail.text);
                  debugPrint(userPassword.text);
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content:Text("User EMail: ${userEmail.text}\nUser Password: ${userPassword.text}")));
                  userName.clear();
                  userEmail.clear();
                  userPassword.clear();
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>
                  LoginScreen(),));
              }

            }, child: Text("Registered"))

          ],
        ),
      ),
    );
  }
}

