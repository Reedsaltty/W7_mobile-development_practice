import 'package:flutter/material.dart';

const path = [
  'assets/bird.jpg',
  'assets/bird2.jpg',
  'assets/girl.jpg',
  'assets/insect.jpg',
  'assets/man.jpg',
];
void main() => runApp(
  MaterialApp(debugShowCheckedModeBanner: false, home: ImagePreview()),
);

class ImagePreview extends StatefulWidget {
  const ImagePreview({super.key});
  @override
  State<StatefulWidget> createState() => _ImagePreviewState();
}

class _ImagePreviewState extends State {
  int index = 0;
  void toggleForward() {
    setState(() => index = (index + 1) % path.length);
  }

  void toggleBackward() {
    setState(() => index = (index - 1 + path.length) % path.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Viewer"),
        backgroundColor: Colors.green,
        actions: [
          IconButton(onPressed: toggleBackward, icon: Icon(Icons.chevron_left)),
          IconButton(onPressed: toggleForward, icon: Icon(Icons.chevron_right)),
        ],
      ),
      body: Image.asset(path[index], width: double.infinity,),
    );
  }
}
