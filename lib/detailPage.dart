// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:detail_list_view/Yemekler.dart';

class detailPage extends StatefulWidget {
  Yemekler food;
  detailPage({
    required this.food,
  });

  @override
  State<detailPage> createState() => _detailPageState();
}

class _detailPageState extends State<detailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange, //AppBar Renk Değişimi
        title: Text(widget.food.yemek_name), //AppBar Başlık
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, //
          children: [
            Image.asset("image/${widget.food.yemek_image_name}"),
            Text(
              "${widget.food.yemek_price} \u{20BA}",
              style: const TextStyle(fontSize: 20, color: Colors.blue),
            ),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                child: Text("SİPARİŞ VER"),
                onPressed: () {
                  print("${widget.food.yemek_name} sipariş verildi");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
