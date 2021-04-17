import 'package:flutter/material.dart';

class PriceLabel extends StatelessWidget {
  const PriceLabel({
    Key key,
    @required this.price,
    this.image,
  }) : super(key: key);

  final price;
  final image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(image),
        Align(
          alignment: Alignment.topRight,
          child: Text(
            ' \$ $price ',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              backgroundColor: Colors.orange,
            ),
          ),
        ),
      ],
    );
  }
}
