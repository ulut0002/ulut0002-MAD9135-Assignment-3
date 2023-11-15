/**
 * 
 *  Serdar Ulutas
 * 
 *  2023-11-15
 * 
 */

import 'package:flutter/material.dart';

class FontData {
  Icon icon;
  String text;
  TextStyle textStyle;

  FontData(this.icon, this.text, this.textStyle);
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  // Static list of local image assets
  static const assets = [
    "images/photo1.jpeg",
    "images/photo2.jpeg",
    "images/photo3.jpeg"
  ];

  // Static list of network image assets
  static const networkAssets = [
    "https://fastly.picsum.photos/id/700/536/354.jpg?hmac=RabYeBoFcyq9_ShFdPlVLbZu-TENTj3HGjjkrx9qfyM",
    "https://fastly.picsum.photos/id/1006/536/354.jpg?hmac=ncYtqoODg4szzI4ei4-8wZ8u255SdZVqYe_IaPMXmIE",
    "https://fastly.picsum.photos/id/971/536/354.jpg?hmac=rLLiyrqSQCDBmhM-xi1ySjhuNp8LScAKezodnVVxUiQ"
  ];

  // Function to build a styled ListItem with optional fontStyle and fontWeight
  // from chatGPT
  Widget _buildListItem(String title, IconData icon, String fontFamily,
      FontStyle? fontStyle, double fontSize,
      {FontWeight? fontWeight}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(icon),
        title: Text(
          title,
          style: TextStyle(
            fontFamily: fontFamily,
            fontStyle: fontStyle,
            fontWeight: fontWeight,
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Images and Assets",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            letterSpacing: 1.05,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            // Horizontal scrolling list of local image assets
            SizedBox(
              height: 200, // Adjust the height as needed
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: assets.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Image(image: AssetImage(assets[index])),
                    ),
                  );
                },
              ),
            ),
            // List of styled ListItems with local fonts
            _buildListItem("BeVietnamPro MediumItalic", Icons.favorite,
                "BeVietnamBro", FontStyle.italic, 20),
            _buildListItem("BeVietnamPro Medium", Icons.access_alarm_outlined,
                "BeVietnamBro", FontStyle.normal, 20),
            _buildListItem(
                "BeVietnamPro Bold", Icons.ac_unit, "BeVietnamBro", null, 20,
                fontWeight: FontWeight.bold),
            _buildListItem("Chalkboard SE", Icons.accessibility_outlined,
                "Chalkboard SE", null, 26),
            _buildListItem(
                "Noteworthy Italic",
                Icons.format_align_center_outlined,
                "Noteworthy",
                FontStyle.italic,
                26),
            _buildListItem("Rockwell Bold", Icons.soap, "Rockwell", null, 26,
                fontWeight: FontWeight.bold),
            // Horizontal scrolling list of network image assets
            SizedBox(
              height: 200, // Adjust the height as needed
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: assets.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Image(image: NetworkImage(networkAssets[index])),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
