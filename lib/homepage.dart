import 'package:flutter/material.dart';

class FontData {
  Icon icon;
  String text;
  TextStyle textStyle;

  FontData(this.icon, this.text, this.textStyle);
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  var borderRadius = const BorderRadius.only(
      topRight: Radius.circular(32), bottomRight: Radius.circular(32));

  static const assets = [
    "images/photo1.jpeg",
    "images/photo2.jpeg",
    "images/photo3.jpeg"
  ];

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
          ],
        ),
      ),
    );
  }
}
