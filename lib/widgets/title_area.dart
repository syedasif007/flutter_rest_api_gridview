import 'package:flutter/material.dart';

class TitleArea extends StatelessWidget {
  const TitleArea({
    Key key,
    @required this.name,
  }) : super(key: key);

  final name;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Text(name)),
          SizedBox(width: 5.0),
          Icon(Icons.favorite_border, color: Colors.pink),
        ],
      ),
    );
  }
}
