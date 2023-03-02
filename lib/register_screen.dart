import 'package:flutter/material.dart';
import 'package:update_login_screen/login.dart';
import 'package:update_login_screen/share/comp.dart';
import 'package:update_login_screen/animated_list.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreen();
}

class _RegisterScreen extends State<RegisterScreen> {
  bool password = true;
  final formKey = GlobalKey<FormState>();
  initState(){
    super.initState();
    password = true;
  }
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              ClipPath(
                clipper: MyClipper(),
                child: Stack(
                  children: [
                    Container(
                    height: size.height / 3,
                    color: Colors.cyan,
                    child: const Center(
                        child:
                          Text('Register',
                              style: TextStyle(color: Colors.white,fontSize: 50, fontWeight: FontWeight.bold)
                          ,),
                        ),
                    ),
                    Positioned(
                      top : size.height / 20,
                      child: IconButton(onPressed: () {
                        Navigator.pop(context);
                      }, icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),),
                    )
                ],
                ),
              ),

              MyTextFormField(
                  labelText: 'Full Name',
                  prefixIcon: Icons.person,
                  padding: 13.0,
                  keyboardType: TextInputType.text,
                  controller: nameController,
                  validator: (value) {
                    if(value!.isEmpty){
                      return 'please enter your name';
                    }
                    // else if(value.length < 3){
                    //   return 'enter your name';
                    // }
                  },
              ),

              MyTextFormField(
                  labelText: 'Phone Number',
                  prefixIcon: Icons.phone,
                  padding: 13.0,
                  keyboardType: TextInputType.number,
                  controller: phoneController,
                  validator: (value) {
                    if(value!.isEmpty){
                      return 'please enter your phone number';
                    }
                    else if(value.length < 11){
                    return 'phone number must be at least 11 characters';
                    }
                  },
              ),

              MyTextFormField(
                  labelText: 'Email',
                  prefixIcon: Icons.email,
                  padding: 13.0,
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                validator: (value) {
                  if(value!.isEmpty){
                    return 'please enter your email';
                  }
                  else if(emailController.text.contains('@') == false ||
                      emailController.text.contains('.') == false){
                    return 'please enter a valid email';
                  }
                },
              ),

              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: password,
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          password = !password;
                        });
                      },
                      icon: password
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility),
                    ),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  validator: (value) {
                    if(value!.isEmpty){
                      return 'please enter your password';
                    }
                    else if(value.length < 8){
                    return 'password must be at least 8 characters';
                    }
                  },
                ),
              ),



              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: password,
                  controller: confirmPasswordController,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          password = !password;
                        });
                      },
                      icon: password
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility),
                    ),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  validator: (value) {
                    if(value!.isEmpty){
                      return 'please enter your confirm password';
                    }
                    else if(value.length < 8){
                    return 'password must be at least 8 characters';
                    }},
                ),
              ),


              SizedBox(height: 10,),
              ElevatedButton(
                onPressed: () {},
                child: Text('Register'),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.cyan,
                    padding: EdgeInsets.symmetric(horizontal: size.width / 4.6, vertical: 15),
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )
                ),
              ),

              const SizedBox(height: 10,),
              OutlinedButton(
              onPressed: () {
                if(formKey.currentState!.validate()) {
                  debugPrint(nameController.text);
                  debugPrint(phoneController.text);
                  debugPrint(emailController.text);
                  debugPrint(passwordController.text);
                  debugPrint(confirmPasswordController.text);
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const updateLoginScreen();
                  }));
                }
              },
                child: Text('Login', style: TextStyle(color: Colors.cyan),),
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: size.width / 4, vertical: 15),
                    textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
