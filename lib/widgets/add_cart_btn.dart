import 'package:flutter/material.dart';

class AddCartButton extends StatelessWidget {
  const AddCartButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(width: 165, height: 35),
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: Icon(Icons.shopping_cart),
        label: Text('Add'),
      ),
    );
  }
}
