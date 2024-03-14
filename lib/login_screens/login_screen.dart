import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
// form handling
  final _formfield = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();

// password visibility toggling
  bool passToggle = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
            child: Form(
              key: _formfield,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/rocket.png',
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 50),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    // better way is to create a validayor class
                    validator: (value) {
                      bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                          .hasMatch(value!);

                      if (value.isEmpty) {
                        return "Enter an email";
                      }

                      if (!emailValid) {
                        return "Enter a valid Email";
                      }
                    },
                    // end of validator here
                    decoration: InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.email),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: passController,
                    obscureText: passToggle,
                    decoration: InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(),
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            passToggle = !passToggle;
                          });
                        },
                        child: Icon(
                          passToggle ? Icons.visibility : Icons.visibility_off,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  ElevatedButton(
                    onPressed: () {
                      if (_formfield.currentState!.validate()) {
                        print("Success");
                        emailController.clear();
                        passController.clear();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 101, 251, 15),
                      foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                    ),
                    child: const Text('Login'),
                  ),
                ],
              ),
            ),
          ),
        ),

        // body: Center(
        //   child: Column(
        //     children: [
        //       Container(
        //         margin: const EdgeInsets.all(20),
        //         child: Image.asset(
        //           'assets/rocket.png',
        //           width: 200,
        //           height: 200,
        //           fit: BoxFit.cover,
        //         )
        //             .animate(
        //               onPlay: (controller) => controller.repeat(),
        //             )
        //             .moveY(
        //               duration: 1000.ms,
        //               begin: 0,
        //               end: -100,
        //             ),
        //       ),
        //       Column(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [
        //           const TextField(
        //             keyboardType: TextInputType.emailAddress,
        //             decoration: InputDecoration(
        //               border: OutlineInputBorder(),
        //               labelText: 'Email',
        //               suffixIcon: Icon(Icons.mail),
        //               suffixIconColor: Color.fromARGB(255, 0, 0, 0),
        //               filled: true,
        //               fillColor: Color.fromARGB(255, 255, 255, 255),
        //             ),
        //           ),
        //           const SizedBox(height: 20),
        //           const TextField(
        //             obscureText: true,
        //             decoration: InputDecoration(
        //               border: OutlineInputBorder(),
        //               labelText: 'Password',
        //               suffixIcon: Icon(Icons.remove_red_eye),
        //               suffixIconColor: Color.fromARGB(255, 0, 0, 0),
        //               filled: true,
        //               fillColor: Color.fromARGB(255, 255, 255, 255),
        //             ),
        //           ),
        //           const SizedBox(height: 20),
        //           ElevatedButton(
        //             onPressed: () {},
        //             style: ElevatedButton.styleFrom(
        //               backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        //               foregroundColor: const Color.fromARGB(255, 255, 255, 255),
        //             ),
        //             child: const Text('Login'),
        //           ),
        //         ],
        //       ),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
