import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HWG QR Config Generator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'HWG QR Conifg Generator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TextEditingController nameController = TextEditingController(text: "HWK-1");
  TextEditingController passwordController = TextEditingController(text: ""); //only edit this
  TextEditingController emailController = TextEditingController(text: ""); //only edit this
  TextEditingController smtpController = TextEditingController(text: "smtp.gmail.com");
  TextEditingController smtpPortController = TextEditingController(text: "465");
  TextEditingController imapController = TextEditingController(text: "imap.gmail.com");
  TextEditingController imapPortController = TextEditingController(text: "993");

  String createJSON(){
    String json = '{';
    json += '"type": "setup",';
    json += '"name": "${nameController.text}",';
    json += '"email": "${emailController.text}",';
    json += '"password": "${passwordController.text}",';
    json += '"imap": "${imapController.text}",';
    json += '"imapPort": "${imapPortController.text}",';
    json += '"smtp": "${smtpController.text}",';
    json += '"smtpPort": "${smtpPortController.text}"';
    json += '}';
    return json;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Row(
          children: [
            Form(
              child: SizedBox(
                width: 400,
                height: 500,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: nameController,
                        decoration: const InputDecoration(labelText: "Name"),
                      ),
                      TextFormField(
                        controller: emailController,
                        decoration: const InputDecoration(labelText: "Email"),
                      ),
                      TextFormField(
                        controller: passwordController,
                        decoration: const InputDecoration(labelText: "Passwort"),
                      ),
                      TextFormField(
                        controller: smtpController,
                        decoration: const InputDecoration(labelText: "Server SMTP"),
                      ),
                      TextFormField(
                        controller: smtpPortController,
                        decoration: const InputDecoration(labelText: "Port SMTP"),
                      ),
                      TextFormField(
                        controller: imapController,
                        decoration: const InputDecoration(labelText: "Server IMAP"),
                      ),
                      TextFormField(
                        controller: imapPortController,
                        decoration: const InputDecoration(labelText: "Port IMAP"),
                      ),

                    ],
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                QrImage(
                  data: createJSON(),
                  padding: EdgeInsets.all(20),
                  backgroundColor: Colors.white,
                  size: 600,
                  embeddedImage: const AssetImage("assets/hwg_icon.png"),
                )
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {

          });
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
