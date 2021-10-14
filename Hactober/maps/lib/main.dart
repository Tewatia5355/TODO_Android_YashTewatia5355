import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Maps',
      theme: ThemeData(
        brightness: Brightness.dark,
        splashColor: Colors.grey,
        primarySwatch: Colors.grey,
      ),
      home: const IntoScreen(),
    );
  }
}

class IntoScreen extends StatelessWidget {
  const IntoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  // color: Colors.green,
                  height: size.height * 0.4,
                  child: Image.asset("assets/logo.gif"),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  child: Text(
                    "Home Park",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: size.height * 0.05,
                        color: Colors.white),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Text(
                    "yahan pe kuch bhi text likha hua hai jisko baad main araam se sort karenge abhi sirf dikhne main acha lag raha hai..",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: size.height * 0.02,
                        color: Colors.grey[400]),
                  ),
                ),
              ],
            ),
            // const SizedBox.expand(),
            Expanded(child: Container()),
            Container(
              color: Colors.black,
              height: size.height * 0.13,
              padding: const EdgeInsets.all(20),
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black,
                      boxShadow: const [
                        BoxShadow(color: Colors.grey, blurRadius: 10),
                      ],
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                          ),
                          child: MaterialButton(
                            color: Colors.white,
                            padding: const EdgeInsets.all(10),
                            height: double.maxFinite,
                            onPressed: () {},
                            child: Text(
                              "Register",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: size.height * 0.021,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20)),
                          child: MaterialButton(
                            padding: const EdgeInsets.all(10),
                            height: double.maxFinite,
                            onPressed: () {
                              Get.to(() => LoginScreen());
                            },
                            child: Text(
                              "SignIn",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: size.height * 0.021,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final _key = GlobalKey<FormState>();

  void login() {}

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomSheet: Container(
        color: Colors.grey[900],
        height: size.height * 0.13,
        width: double.maxFinite,
        padding: const EdgeInsets.all(20),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.black,
              boxShadow: const [
                BoxShadow(color: Colors.grey, blurRadius: 10),
              ],
              borderRadius: BorderRadius.circular(20)),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20),
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
            child: MaterialButton(
              color: Colors.white,
              padding: const EdgeInsets.all(10),
              height: double.maxFinite,
              onPressed: () async {
                (_key.currentState!.validate())
                    ? login()
                    : Timer(const Duration(seconds: 2), () {
                        _key.currentState!.reset();
                      });
              },
              child: Text(
                "Login",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: size.height * 0.021,
                ),
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                alignment: Alignment.bottomLeft,
                height: size.height * 0.07,
                child: IconButton(
                    onPressed: () {
                      Get.off(() => const IntoScreen());
                    },
                    icon: Icon(Icons.navigate_before,
                        color: Colors.grey[500], size: size.height * 0.037)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              child: Text(
                "Lets Sign you in.",
                // textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: size.height * 0.044,
                    color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              child: Text(
                "Welcome Back.\nYou've been missed!",
                // textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: size.height * 0.032,
                    color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                  key: _key,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 10),
                      TextFormField(
                        validator: (text) {
                          if (text == null || text.isEmpty || !text.isEmail) {
                            return 'Enter Valid Email!';
                          }
                          return null;
                        },
                        controller: _email,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                            // label: Text("Email"),
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.grey,
                            ),
                            hintText: "abcd@gmail.com",
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            )
                            // prefixIcon: Icon(Icons.email)
                            ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Enter Password';
                          }
                          return null;
                        },
                        controller: _password,
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        obscuringCharacter: '*',
                        decoration: const InputDecoration(
                            // label: Text("Email"),
                            prefixIcon: Icon(
                              Icons.vpn_key,
                              color: Colors.grey,
                            ),
                            hintText: "**********",
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            )
                            // prefixIcon: Icon(Icons.email)
                            ),
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? _controller;

  final LatLng _center = const LatLng(30.356743, 76.363662);
  Marker? marker;
  Set<Marker> s = {};
  @override
  void initState() {
    marker = Marker(
      markerId: const MarkerId("Home"),
      position: const LatLng(30.356743, 76.363662),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRose),
    );
    // s = {marker!};
    s.add(marker!);
    // _controller!.showMarkerInfoWindow(MarkerId("Home"));
    super.initState();
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Maps Sample App'),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {}),
      body: GoogleMap(
        mapType: MapType.hybrid,
        markers: s,
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 16,
        ),
      ),
    );
  }
}
