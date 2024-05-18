import 'package:factory_apps/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class authenticationPage extends StatefulWidget {
authenticationPage({Key? key, }) : super(key: key);


  @override
  State<authenticationPage> createState() => _authenticationPageState();
}

class _authenticationPageState extends State<authenticationPage> {
  bool? isChecked = false;
  String buttonName = 'Activate';
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
                  color: Colors.white,
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
                width:  width * 0.8,
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
                                  'Enter the activation code you',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              Text(
                                'received via SMS.',
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
                    const Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 16),
                                  child: TextField(
                                    key: Key('otp'),
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'OTP',
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 10.0),
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text("0/6"),
                                  ),
                                ),
                              ],
                              
                            ),
                          ),
                          // Add this line to add some space between the TextField and the "Didn't receive?" text
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Didn't receive?"),
                                Text(
                                  'Tap here',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      decoration: TextDecoration.underline),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0, bottom: 5),
                            child: ElevatedButton(
                              key: Key('activateButton'),
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.purple[800],
                                backgroundColor: Colors.purple[50],
                              ),
                              onPressed: () {
                                setState(
                                  () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => const Homepage()
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Text(buttonName),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Column(
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
