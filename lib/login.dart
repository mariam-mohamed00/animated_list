import 'package:flutter/material.dart';
import 'package:update_login_screen/share/comp.dart';
import 'package:update_login_screen/register_screen.dart';
import 'package:update_login_screen/animated_list.dart';

class updateLoginScreen extends StatefulWidget {
  const updateLoginScreen({Key? key}) : super(key: key);

  @override
  State<updateLoginScreen> createState() => _updateLoginScreenState();
}

class _updateLoginScreenState extends State<updateLoginScreen> {
  bool password = true;
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  initState(){
    super.initState();
    password = true;
  }
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
                child: Container(
                  height: size.height / 3,
                  color: Colors.purple,
                  child: const Center(child: Text('Login', style: TextStyle(color: Colors.white,fontSize: 50, fontWeight: FontWeight.bold))),
                ),
              ),
              const SizedBox(height: 80,),
              MyTextFormField(
                  controller: emailController,
                  labelText: 'Email',
                  prefixIcon: Icons.email,
                  padding: 15.0,
                  keyboardType: TextInputType.emailAddress,
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
                  validator: (value){
                    if(value!.isEmpty){
                      return 'please enter your password';
                    }
                    else if(value.length < 8){
                      return 'password must be at least 8 characters';
                    }
                  },
                ),
              ),

              SizedBox(height: size.height * 0.04,),
              ElevatedButton(
                  onPressed: () {
                    if(formKey.currentState!.validate()){
                      debugPrint(emailController.text);
                      debugPrint(passwordController.text);
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return const AnimatedListScreen();
                      }));
                    }
                  },
                  child: Text('Login'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  padding: EdgeInsets.symmetric(horizontal: size.width / 3.5, vertical: 15),
                  textStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )
                ),
              ),

              SizedBox(height: size.height * 0.04,),
              OutlinedButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return const RegisterScreen();
                }));
              }
                  , child: Text('Register', style: TextStyle(color: Colors.purple),),
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
