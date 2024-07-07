import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart';

class WebScraper {
  final String url;

  WebScraper(this.url);

  Future<String> scrapeImageSource() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      Document document = parser.parse(response.body);
      Element? imgElement = document.querySelector('img'); // Selects the first img element
      if (imgElement != null) {
        return imgElement.attributes['src'] ?? ''; // Return src attribute or empty string
      } else {
        throw Exception('No img element found');
      }
    } else {
      throw Exception('Failed to load website');
    }
  }
}
