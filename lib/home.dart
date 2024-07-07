import 'package:flutter/material.dart';
import './img_retriever.dart';

class Home extends StatefulWidget {

  final String data;
  const Home({Key? key,required this.data}) : super(key: key);

  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Home> {
  late Future<String> _imageSource;

  @override
  void initState() {
    super.initState();
    _imageSource = fetchImageSource(); // Replace with your method to fetch correct URL
  }

  Future<String> fetchImageSource() async {
    try {
      // Replace with your logic to fetch the correct image URL
      String imageUrl = await WebScraper('https://results.kongu.edu/allresoutrg.php?regno='+widget.data+'-ODD_2023-JANUARY_2024').scrapeImageSource();
      return 'https://results.kongu.edu/'+imageUrl;
    } catch (e) {
      print('Error fetching image source: $e');
      return ''; // Handle error case
    }
  }

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double height = 0.8 * screenHeight;
    print(height);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 1, 19, 22),
      appBar: AppBar(
        title:  Text('Scraper['+widget.data+']',style: TextStyle(color: Colors.white),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.red), // Set your color here
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.black,
      ),
      body: Center(
        
        child: FutureBuilder<String>(
          future: _imageSource,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Text('No image found');
            } else {
              // Print or log the image URL here
              print('Image URL: ${snapshot.data}');
              return Container(
                height:height,
                width:double.infinity,
                child: Image.network(
                      snapshot.data!,
                      height: double.infinity,
                      width:double.infinity,
                      errorBuilder: (context, error, stackTrace) {
                      return const Text('Failed to load image');
                      },
                  ),
              );
            }
          },
        ),
      ),
    );
  }
}
