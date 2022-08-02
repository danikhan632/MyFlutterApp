import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  final String prodName;
  final String prodImgURL;
  final double price;
  const ProductCard({
    Key? key, 
    required this.prodName,
  required this.prodImgURL,
  required this.price
  }) : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  String _productName="";
  String _productImgUrl="";
 double _productPrice=0.0;


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(widget.prodName),
          Image.network(widget.prodImgURL),
          Text("${widget.price}")
        ],
      )

    );
  }
}
