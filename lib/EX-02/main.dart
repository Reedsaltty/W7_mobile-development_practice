import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Favorite cards", style: TextStyle(color: Colors.white)),
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            FavoriteCard(title: "Title 1", description: "Description 1"),
            FavoriteCard(title: "Title 2", description: "Description 2"),
          ],
        ),
      ),
    ),
  ),
);

class FavoriteCard extends StatefulWidget {
  const FavoriteCard({super.key, required this.title, required this.description});
  final String title;
  final String description;

  @override
  State<FavoriteCard> createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  bool isLiked = false;

  void onToggle() {
    setState(() => isLiked = !isLiked);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(8),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text(widget.title, style: TextStyle(color: Colors.blue, fontWeight: FontWeight(700), fontSize: 20),), Text(widget.description)],
                ),
              ),
              IconButton(
                onPressed: onToggle,
                icon: Icon(
                  isLiked ? Icons.favorite : Icons.favorite_border,
                  color: isLiked ? Colors.red : null,
                ),
              ),
            ],
          ),
        ),

        const Divider()
      ],
    );
  }
}
