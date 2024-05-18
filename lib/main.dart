import 'package:factory_apps/invintationPage.dart';
import 'package:factory_apps/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0;
  int _factoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 219, 217, 217),
      appBar: AppBar(
        title: Text((_factoryIndex == 0) ? 'Factory 1' : 'Factory 2'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            if (_selectedIndex == 1)
              Padding(
                padding: const EdgeInsets.all(11.0),
                child: Container(
                  height: 0.6 * height,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 238, 236, 236),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 25.0),
                        child: Text(
                          _factoryIndex == 0
                              ? '⚠ABCD1234 IS UNREACHABLE!'
                              : '1549.7kW',
                          style: const TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'PoppinsBold',
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          (_factoryIndex == 0)
                              ? buildGaugeBox(0, '0.0', 'Steam Pressure', 'bar')
                              : buildGaugeBox(
                                  34.19, '34.19', 'Steam Pressure', 'bar'),
                          (_factoryIndex == 0)
                              ? buildGaugeBox(0, '0.0', 'Steam Flow', 'T/H')
                              : buildGaugeBox(
                                  28, '22.82', 'Steam Flow', 'T/H', Colors.red),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          (_factoryIndex == 0)
                              ? buildGaugeBox(0, '0.0', 'Water Level', '%')
                              : buildGaugeBox(52, '55.41', 'Water Level', '%'),
                          (_factoryIndex == 0)
                              ? buildGaugeBox(0, '0.0', 'Power Frequency', 'Hz')
                              : buildGaugeBox(
                                  49, '50.08', 'Power Frequency', 'Hz'),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Timestamp: ${DateTime.now().toString()}',
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      )
                    ],
                  ),
                ),
              )
            else if (_selectedIndex == 0)
              Padding(
                padding: const EdgeInsets.all(11),
                child: Container(
                  height: 0.6 * height,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 238, 236, 236),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3)),
                    ],
                  ),
                  child: Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              (_factoryIndex == 0)
                                  ? listClient('Ben', '+60109219938')
                                  : listClient(null, null),
                              (_factoryIndex == 0)
                                  ? listClient('Testing 1', '+601234567891')
                                  : listClient(null, null),
                              (_factoryIndex == 0)
                                  ? listClient('Hello', '+60123456789')
                                 : listClient(null, null),
                            ],
                          )),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: FloatingActionButton(
                              key: Key("addButton"),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => InvitationPage(
                                            factoryIndex: _factoryIndex)));
                              },
                              child: const Icon(Icons.add),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            if (_selectedIndex == 2)
              Padding(
                padding: EdgeInsets.all(11),
                child: Container(
                  height: 0.6 * height,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 238, 236, 236),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text(
                                'Minimum Treshold',
                                style: TextStyle(
                                    fontSize: 28, fontWeight: FontWeight.w900),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(Icons.info_outline),
                              ),
                              Container(
                                width: 50,
                                height: 50,
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 199, 184, 202),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Stack(
                                  alignment: Alignment.topLeft,
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.edit),
                                      color: Colors.purple,
                                      onPressed: (){},
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Expanded(
                            child: GridView.count(
                              crossAxisCount: 2,
                              children: [
                                Column(
                                  children: [
                                    const Text(
                                      "\nSteam\nPressure",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    Container(
                                      key: Key('SteamPressure'),
                                      height: 50,
                                      width: 150,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            20.0), // Adjust the value to change the oval shape
                                        color: Colors.grey[
                                            200], // Adjust the color as needed
                                      ),
                                      child: TextField(
                                        decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 20.0),
                                          labelText: '29 Bar',
                                          labelStyle: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                        ),
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    const Text(
                                      "\nSteam\nFlow",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    Container(
                                      height: 50,
                                      width: 150,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            20.0), // Adjust the value to change the oval shape
                                        color: Colors.grey[
                                            200], // Adjust the color as needed
                                      ),
                                      child: TextField(
                                        key: Key('SteamFlow'),
                                        decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 20.0),
                                          labelText: '22 T/H',
                                          labelStyle: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                        ),
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    const Text(
                                      "\nWater\nLevel",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    Container(
                                      height: 50,
                                      width: 150,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            20.0), // Adjust the value to change the oval shape
                                        color: Colors.grey[
                                            200], // Adjust the color as needed
                                      ),
                                      child: TextField(
                                        key: Key('waterLevel'),
                                        decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 20.0),
                                          labelText: '53 %',
                                          labelStyle: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                        ),
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    const Text(
                                      "\nPower\nFrequency",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    Container(
                                      height: 50,
                                      width: 150,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            20.0), // Adjust the value to change the oval shape
                                        color: Colors.grey[
                                            200], // Adjust the color as needed
                                      ),
                                      child: TextField(
                                        key: Key('powerFrequency'),
                                        decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 20.0),
                                          labelText: '48 Hz',
                                          labelStyle: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                        ),
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            const SizedBox(height: 30),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      key: Key('factory1'),
                      onTap: () {
                        changeFactoryIndex(0);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          width: 150,
                          height: 120,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                            boxShadow: _factoryIndex == 0
                                ? [
                                    BoxShadow(
                                      color: Colors.blue.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: Offset(0, 3),
                                    ),
                                  ]
                                : [],
                          ),
                          padding: const EdgeInsets.all(10),
                          child: const Column(
                            children: [
                              Icon(Icons.factory, size: 30),
                              SizedBox(height: 5),
                              Text(
                                'Factory 1',
                                style: TextStyle(fontSize: 22),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      key: Key('factory2'),
                      onTap: () {
                        changeFactoryIndex(1);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          width: 150,
                          height: 120,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                            boxShadow: _factoryIndex == 1
                                ? [
                                    BoxShadow(
                                      color: Colors.blue.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: Offset(0, 3),
                                    ),
                                  ]
                                : [],
                          ),
                          padding: const EdgeInsets.all(10),
                          child: const Column(
                            children: [
                              Icon(Icons.factory, size: 30),
                              SizedBox(height: 5),
                              Text(
                                'Factory 2',
                                style: TextStyle(fontSize: 22),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            key: Key("profile"),
            label: '',
            icon: Icon(Icons.person),
          ),
          BottomNavigationBarItem(
            key: Key("home"),
            label: '',
            icon: Icon(Icons.home_outlined),
          ),
          BottomNavigationBarItem(
            key: Key("settings"),
            label: '',
            icon: Icon(Icons.settings),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          print(_selectedIndex);
        },
      ),
    );
  }

  changeFactoryIndex(index) {
    setState(() {
      index == 0 ? _factoryIndex = 0 : _factoryIndex = 1;
    });
  }

  Widget buildGaugeBox(double value, String mainText, String topAnnotation,
          String superScript,
          [Color rangeColor = Colors.green]) =>
      Container(
        width: 160,
        height: 130,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: Center(
          child: Stack(
            children: [
              SfRadialGauge(
                axes: <RadialAxis>[
                  RadialAxis(
                    startAngle: 180,
                    endAngle: 0,
                    interval: 25,
                    minorTicksPerInterval: 0,
                    minimum: 0,
                    maximum: 100,
                    canScaleToFit: true,
                    majorTickStyle: const MajorTickStyle(length: 10),
                    labelFormat: '', // Remove numbers from the scale
                    axisLineStyle: const AxisLineStyle(
                      thickness: 22,
                      // Adjust the thickness here
                    ),
                    pointers: <GaugePointer>[
                      MarkerPointer(
                        value: value,
                        markerOffset: -15,
                        markerHeight: 15,
                        markerWidth: 15,
                        color: const Color.fromARGB(255, 228, 217, 217),
                      ),
                    ],
                    ranges: <GaugeRange>[
                      GaugeRange(
                        startValue: 0,
                        endValue: value,
                        color: rangeColor,
                        startWidth: 20,
                        endWidth: 20,
                      ),
                    ],
                  ),
                ],
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(top: 2.0),
                    child: Text(
                      topAnnotation,
                      style:
                          const TextStyle(fontSize: 17, fontFamily: 'Poppins'),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          mainText,
                          style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'PoppinsBold'),
                        ),
                        Text(
                          superScript,
                          style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'PoppinsBold'),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );

  Widget listClient(String? name, String? phoneNumber) => Visibility(
        visible: name != null || phoneNumber != null,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 100,
            decoration: BoxDecoration(
              color: Color.fromARGB(206, 255, 255, 255),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text(
                            name ?? '',
                            style: TextStyle(fontSize: 24),
                          )),
                      Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 1.0, right: 6),
                            child: Icon(
                              Icons.circle,
                              size: 10,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            phoneNumber ?? '',
                            style: const TextStyle(fontSize: 24),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      );
}
