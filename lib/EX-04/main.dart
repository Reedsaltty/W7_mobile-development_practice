import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Center(
          child: Container(
            padding: EdgeInsets.all(18),
            alignment: Alignment.center,
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ScoreBar(),
          ),
        ),
      ),
    ),
  ),
);

class ScoreBar extends StatefulWidget {
  const ScoreBar({super.key});

  @override
  State<StatefulWidget> createState() => _ScoreBarState();
}

class _ScoreBarState extends State {
  int shade = 0;
  MaterialColor color = Colors.green;

  void add() {
    setState(() {
      if (shade < 9) shade++;
    });
  }

  void remove() {
    setState(() {
      if (shade > 0) shade--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("My score in flutter"),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(onPressed: add, icon: Icon(Icons.add)),
            IconButton(onPressed: remove, icon: Icon(Icons.remove)),
          ],
        ),
        Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 1),
            borderRadius: BorderRadius.circular(10)
          ),
          child: Stack(
            children: [
              FractionallySizedBox(
                widthFactor: shade / 9,
                heightFactor: 1,
                alignment: Alignment.centerLeft,
                child: Container(
                  decoration: BoxDecoration(color: color[shade * 100],borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
