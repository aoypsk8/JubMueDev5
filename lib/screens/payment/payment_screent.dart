import 'package:company_info/company_info.dart';
import 'package:company_info/logo_enum.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jub_mue_dev_5/screens/controllers/payment_controller.dart';
import 'package:jub_mue_dev_5/screens/payment/payment_scuess.dart';
import 'package:jub_mue_dev_5/screens/widgets/bank_widget.dart';
import 'package:jub_mue_dev_5/screens/widgets/textFont.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';

class PayMentScreen extends StatefulWidget {
  const PayMentScreen({
    super.key,
    required this.dataProduct,
  });
  final List dataProduct;

  @override
  State<PayMentScreen> createState() => _PayMentScreenState();
}

class _PayMentScreenState extends State<PayMentScreen> {
  final PaymentController _paymentController = Get.put(PaymentController());

  IO.Socket? socket;
  static const String keyDev =
      "\$2b\$10\$bE5wXAjnzkV6O4BaVMq9meFzEEQczh2yPvcR2Hpl9tgMFHIjay6mK";

  static const String urlSocket =
      "https://payment-gateway.lailaolab.com/?key=$keyDev";

  @override
  void initState() {
    super.initState();
    _socketConnect();
  }

  _socketConnect() async {
    socket =
        IO.io(urlSocket, OptionBuilder().setTransports(['websocket']).build());
    socket!.onConnect((_) {
      print('connected');
    });
    socket!.on("join::$keyDev", (data) async {
      print("===>>>${data}");

      if (data != null) {
        Get.to(PaymentSuccess(
          dataResponse: data,
        ));
        socket!.clearListeners();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print(widget.dataProduct);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const TextFont(
          text: "ເລືອກທະນາຄານ",
          fontSize: 25,
          fontWeight: FontWeight.w400,
        ),
      ),
      body: Column(
        children: [
          BankWidget(
            company: const companyInfo(
              logoType: LogoType.bcel,
              showName: true,
              width: 30,
              height: 30,
              nameStyle: TextStyle(color: Colors.white),
            ),
            onTap: () {
              _paymentController.generateBcelQr(widget.dataProduct[0]["price"]);
            },
          ),
          BankWidget(
            company: const companyInfo(
              logoType: LogoType.jdb,
              showName: true,
              width: 30,
              height: 30,
              nameStyle: TextStyle(color: Colors.white),
            ),
            onTap: () {
              _paymentController.generateJDBQr(widget.dataProduct[0]["price"]);
            },
          ),
          BankWidget(
            company: const companyInfo(
              logoType: LogoType.ib,
              showName: true,
              width: 30,
              height: 30,
              nameStyle: TextStyle(color: Colors.white),
            ),
            onTap: () {
              _paymentController.generateIBQr(widget.dataProduct[0]["price"]);
            },
          ),
          const SizedBox(height: 20),
          // ignore: unnecessary_null_comparison
          _paymentController.qrIB != null
              ? Obx(() => QrImageView(
                    data: _paymentController.qrIB.value,
                    version: QrVersions.auto,
                    size: 200.0,
                  ))
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
