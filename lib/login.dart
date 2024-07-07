import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import './home.dart';



class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Page1> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 1, 19, 22),
      appBar: AppBar(
        title: const Text(
          'Scraper - G.O.A.T',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Align(
      alignment: Alignment.center,
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(16.0),
          children: [
            const Text(
              "Your-Rollno",
              style:TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 214, 112, 29),
              ),
            ),
            Textbox(
              hintText: "Enter your rollno",
              controller: _controller1,
            ),
            
            Container(
              width:double.infinity,
              child:Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [button("Get-Image"),
                          ],
            ),
            ),

          ],
        ),
      ),
      ),
    );
  }

  Container button(String a) {
    
    return Container(
            padding: const EdgeInsets.all(10),
            child: ElevatedButton(
              onPressed: () {
                  String name=_controller1.text;
                  String passcode=_controller2.text;
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Home(data:_controller1.text)));
                  
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                foregroundColor: Colors.black,
              ),
              child:  Text(a),
            ),
          );
  }

/*
 Future<void> getinfo() async {
  try {
    var response = await Dio().get("http://10.0.2.2:1001/example");
    if (response.statusCode == 200) {
      print(response.data); // Print the response data
    } else {
      print('Failed to load data');
    }
  } catch (e) {
    print(e);
  }
}*/

/*
Future<void> postInfo() async {
  try {
    var data={'name':_controller1.text,'password':_controller2.text};
    var response = await Dio().post(
      "http://10.0.2.2:1001/example",
      data: data,
      options: Options(
        headers: {
          'Content-Type': 'application/json', // Ensure the content type is set to JSON
        },
      ),
    );
    if (response.statusCode == 200) { // HTTP 201 Created
      print(response.data); // Print the response data
    } else {
      print('Failed to post data');
    }
  } catch (e) {
    print(e);
  }
}*/

}

class Textbox extends StatelessWidget {
  const Textbox({
    super.key,
    required this.hintText,
    required this.controller,
  });

  final String hintText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      margin: const EdgeInsets.all(10),
      child: TextField(
        controller: controller,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.black),
          prefixIcon: const Icon(Icons.monetization_on),
          prefixIconColor: Colors.amber,
          filled: true,
          fillColor: Colors.white,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
        ),
      ),
    );
  }
}
