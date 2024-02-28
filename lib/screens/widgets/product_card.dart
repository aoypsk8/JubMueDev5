import 'package:flutter/material.dart';
import 'package:jub_mue_dev_5/screens/widgets/textFont.dart';

class CardProduct extends StatelessWidget {
  const CardProduct({
    super.key,
    required this.func,
    required this.dataProduct,
  });

  final VoidCallback func;
  final List dataProduct;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: InkWell(
        onTap: func,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image.network(
                    dataProduct[0]['image'],
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFont(
                      text: "${dataProduct[0]['brand']}",
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    TextFont(
                      text: "${dataProduct[0]['name']}",
                      fontSize: 16,
                    ),
                  ],
                ),
              ],
            ),
            TextFont(
              text: "${dataProduct[0]['price']} KIP",
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )
          ],
        ),
      ),
    );
  }
}
