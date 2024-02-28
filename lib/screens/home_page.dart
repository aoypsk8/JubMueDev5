import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jub_mue_dev_5/screens/payment/payment_screent.dart';
import 'package:jub_mue_dev_5/screens/widgets/product_card.dart';
import 'package:jub_mue_dev_5/screens/widgets/textFont.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List product = [
    {
      "brand": "APPLE",
      "name": "iPhone-15 pro max ",
      "price": 1,
      "image":
          "https://www.pngmart.com/files/15/Apple-iPhone-12-Transparent-Images-PNG.png"
    },
    {
      "brand": "APPLE",
      "name": "iPhone-14 pro max",
      "price": 200,
      "image":
          "https://www.pngmart.com/files/15/Apple-iPhone-12-Transparent-Images-PNG.png"
    },
    {
      "brand": "APPLE",
      "name": " iPhone-11 pro max ",
      "price": 300,
      "image":
          "https://www.pngmart.com/files/15/Apple-iPhone-12-Transparent-Images-PNG.png"
    },
    {
      "brand": "APPLE",
      "name": "iPhone-13 pro max",
      "price": 400,
      "image":
          "https://www.pngmart.com/files/15/Apple-iPhone-12-Transparent-Images-PNG.png"
    },
    {
      "brand": "APPLE",
      "name": "iPhone-12 pro max",
      "price": 500,
      "image":
          "https://www.pngmart.com/files/15/Apple-iPhone-12-Transparent-Images-PNG.png"
    },
    {
      "brand": "APPLE",
      "name": "iPhone-12",
      "price": 600,
      "image":
          "https://www.pngmart.com/files/15/Apple-iPhone-12-Transparent-Images-PNG.png"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextFont(
          text: "ຫນ້າຫລັກ",
          fontSize: 25,
          fontWeight: FontWeight.w400,
        ),
      ),
      body: ListView.builder(
        itemCount: product.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 10),
            child: CardProduct(
              dataProduct: [product[index]],
              func: () {
                Get.to(PayMentScreen(
                  dataProduct: [product[index]],
                ));
              },
            ),
          );
        },
      ),
    );
  }
}
