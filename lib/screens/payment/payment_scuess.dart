// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:jub_mue_dev_5/screens/widgets/textFont.dart';

class PaymentSuccess extends StatefulWidget {
  var dataResponse;
  PaymentSuccess({super.key, this.dataResponse});

  @override
  State<PaymentSuccess> createState() => _PaymentSuccessState();
}

class _PaymentSuccessState extends State<PaymentSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const TextFont(
            text: "ສຳເລັດ",
            fontSize: 25,
            fontWeight: FontWeight.w400,
          ),
        ),
        body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 400,
            decoration: BoxDecoration(
                color: Color.fromARGB(31, 255, 255, 255),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade400,
                    offset: const Offset(0, 0.5),
                  )
                ]),
            child: Column(
              children: [
                const SizedBox(height: 10),
                Image.network(
                  "https://www.shareicon.net/data/2016/08/20/817720_check_395x512.png",
                  width: 120,
                  height: 120,
                ),
                const SizedBox(height: 20),
                TextFont(
                  text: "ຊຳລະເງີນສຳເລັດ",
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      TextFont(
                        text: "ຈຳນວນເງີນ",
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
                      ),
                      const Spacer(),
                      TextFont(
                        text: "${widget.dataResponse['amount'] ?? ""} KIP",
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      TextFont(
                        text: "ຊື່",
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
                      ),
                      const Spacer(),
                      TextFont(
                        text: "${widget.dataResponse['name'] ?? ""}",
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      TextFont(
                        text: "ລະຫັດໄອດີ :",
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
                      ),
                      const Spacer(),
                      Expanded(
                        child: TextFont(
                          text: "${widget.dataResponse['uuid'] ?? ""}",
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      TextFont(
                        text: "ວັນທີ່ :",
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
                      ),
                      const Text(""),
                      const Spacer(),
                      TextFont(
                        text: "${widget.dataResponse['txtime'] ?? ""}",
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
