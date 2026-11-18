import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Statefull widget button")),
        body: Center(
          child: Column(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [Button(), Button(), Button(), Button(), Button()],
          ),
        ),
      ),
    ),
  );
}

class Button extends StatefulWidget {
  const new({super.key});

  @override
  State<StatefulWidget> createState() => _ButtonState();
}

class _ButtonState extends State {
  bool select = false;
  Color color = Colors.blue.shade50;
  String text = 'Not selected';
  Color textColor = Colors.black;
  // Color borderColor = Colors.black;

  void toggle() {
    setState(
      () => select == false
          ? {
              color = Colors.blue.shade500,
              text = 'Selected',
              textColor = Colors.white,
              // borderColor = Colors.white ,
              select = true,
            }
          : {
              color = Colors.blue.shade50,
              text = 'Not selected',
              textColor = Colors.black,
              // borderColor = Colors.black,
              select = false,
            },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: toggle,
      style: ButtonStyle(
        // side: WidgetStatePropertyAll(BorderSide(color:borderColor, width: 4)),
        backgroundColor: WidgetStatePropertyAll(color),
        fixedSize: WidgetStatePropertyAll(Size(400, 100)),
        elevation: WidgetStatePropertyAll(10),
        shadowColor: WidgetStatePropertyAll(
          Colors.black.withValues(alpha: 0.67),
        ),
      ),
      child: Text(text, style: TextStyle(fontSize: 25, color: textColor)),
    );
  }
}
