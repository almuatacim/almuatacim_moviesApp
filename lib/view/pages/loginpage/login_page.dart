import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/Resource.dart';
import 'package:flutter_application_1/view/pages/loginpage/cubit/login_cubit.dart';
import 'package:flutter_application_1/view/pages/loginpage/data/model/User.dart';
import 'package:flutter_application_1/view/route/approute.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/constants.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginCubit bloc;
  @override
  void initState() {
    bloc = LoginCubit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login Page 🔐'),
        ),
        backgroundColor: kPrimaryColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 50),
            child: BlocProvider(
              create: (context) => bloc,
              child: Card(
                color: MePrimaryColor,
                margin: EdgeInsets.all(5),
                child: BlocListener<LoginCubit, LoginState>(
                  listener: (context, state) {
                    if (state.status == Status.success) {
                      Navigator.pushNamedAndRemoveUntil(context,
                          AppRoute.homepage, (Route<dynamic> route) => false,
                          arguments: User(
                              username: state.userName.toString(),
                              password: state.password.toString()));
                    } else if (state.status == Status.loading) {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Loding ......"),
                              content: LinearProgressIndicator(),
                            );
                          });
                    }
                    if (state.status == Status.error) {
                      var error = state.resource as Error;
                      Navigator.pop(context);
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              icon: Icon(Icons.error),
                              title: Text(error.message.toString()),
                            );
                          });
                    }
                  },
                  child: BlocBuilder<LoginCubit, LoginState>(
                    builder: (context, state) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.person_pin_rounded,
                            size: 80,
                            color: Colors.white,
                          ),
                          // Image.asset(
                          //   'assets/images/scholar.png',
                          //   height: 150,
                          // ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Hello',
                                  style: TextStyle(
                                      fontSize: 32, color: Colors.white),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 20),
                          SizedBox(
                            child: CustomTextField(
                              hitnText: 'UserName',
                              onChanged: (value) {
                                bloc.onUserNameChange(value);
                              },
                            ),
                            width: 250,
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            child: CustomTextField(
                              hitnText: 'Password',
                              isPass: true,
                              onChanged: (value) {
                                bloc.onPasswordChange(value);
                              },
                            ),
                            width: 250,
                          ),
                          const SizedBox(height: 20),

                          CustomButton(
                            textButton: 'Login',
                            onPressed: () {
                              bloc.loginWithFireBase(
                                  email: state.userName!,
                                  password: state.password!);
                            },
                          ),
                          const SizedBox(height: 10),
                          Divider(
                            color: Colors.white,
                            indent: 50,
                            endIndent: 50,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'dont\t have an account ?',
                                style: TextStyle(color: Colors.white),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, AppRoute.registerpage);
                                },
                                child: Text(
                                  '   Register',
                                  style: TextStyle(color: Color(0xffc7ede6)),
                                ),
                              ),
                              // ActionChip(
                              //   label: Text(
                              //     '   Register',
                              //   ),
                              //   onPressed: () {
                              //     Navigator.pushNamed(
                              //         context, AppRoute.registerpage);
                              //   },
                              // ),
                            ],
                          ),
                          SizedBox(
                            height: 50,
                          )
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
