import 'package:flutter/material.dart';
import 'package:webview/mywebview.dart';

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  final TextEditingController _controller = TextEditingController();

  void _searchOrNavigate() {
    String query = _controller.text.trim();
    Uri? uri = Uri.tryParse(query);

    bool isUrl = Uri.parse(query).isAbsolute;

    if (isUrl) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MyWebView(url: query),
          ));
    } else {
      String searchUrl = 'https://www.google.com/search?q=$query';
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MyWebView(url: searchUrl),
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WebView"),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: "Enter URL for Search",
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.search)
              ),
            ),
            SizedBox(height: 35,),
            SizedBox(
              width: 150,
              height: 50,
              child: ElevatedButton(
                onPressed: _searchOrNavigate,
                child: Text("Go",
                  style: TextStyle(
                    fontSize: 18
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.tealAccent,
                  foregroundColor: Colors.black87
                ),
              ),
            )
          ],
        ), 
      ),
    );
  }
}
