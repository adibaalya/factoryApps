import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'authenticationPage.dart';

class LoginPage extends StatefulWidget {

  LoginPage({Key? key, }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool? isChecked = false;
  String buttonName = 'Get Activation Code';
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15.0, left: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'images/upm_logo.jpg',
                    width: 150,
                    height: 150,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Welcome!',
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.w800),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 241, 212, 212),
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    )
                  ],
                ),
                width: width * 0.8,
                height: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 20.0),
                                child: Text(
                                  'Enter your mobile number to',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              Text(
                                'activate your account.',
                                style: TextStyle(fontSize: 20),
                              )
                            ],
                          ),
                          Expanded(
                            flex: 1,
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Icon(Icons.info_outline),
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        const SizedBox(width: 20),
                        Image.asset('images/malaysia.png'),
                        const SizedBox(width: 5),
                        const Text('+60'),
                        const SizedBox(
                          width: 10,
                        ),
                        const Expanded(
                            child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: TextField(
                            enabled: true,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'Enter your mobile number'),
                          ),
                        )),
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Checkbox(
                                value: isChecked,
                                onChanged: (value) {
                                  setState(() {
                                    isChecked = value;
                                  });
                                }),
                            const Text('I agree to terms & conditions')
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.purple[800],
                              backgroundColor: Colors.purple[50],
                            ),
                            onPressed: () {
                              setState(
                                () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                           authenticationPage(
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child: Text(buttonName),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 40),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40, bottom: 20),
                    child: Text(
                      'Disclaimer | Privacy Statement',
                      style: TextStyle(
                          color: Colors.blue[300],
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ),
                const Text('Copyright UPM & Kejuruteraan Minyak Sawit'),
                const Text('CCS Sdn. Bhd.')
              ],
            )
          ],
        ),
      ),
    );
  }
}
