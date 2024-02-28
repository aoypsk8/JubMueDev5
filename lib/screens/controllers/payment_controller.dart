import 'package:get/get.dart';
import 'package:jub_mue_dev_5/utils/api/dio_client.dart';
import 'package:url_launcher/url_launcher.dart';

class PaymentController extends GetxController {
  RxString qrIB = "".obs;

  static const String endPoint =
      "https://payment-gateway.lailaolab.com/v1/api/payment";

  Future<void> generateIBQr(var price) async {
    try {
      var bodyData = {
        "amount": price,
        "description": "Take test from Lailaolab",
      };

      var response = await AppUrl.post(
        "${endPoint}/generate-ib-qr",
        bodyData,
      );
      qrIB.value = response["qrCode"];
    } catch (e) {
      print(e);
    }
  }

  Future<void> generateBcelQr(var price) async {
    try {
      var bodyData = {
        "amount": price,
        "description": "Take test from Lailaolab",
      };

      var response = await AppUrl.post(
        "${endPoint}/generate-bcel-qr",
        bodyData,
      );

      print(response);
      qrIB.value = response["qrCode"];
      try {
        await launchUrl(
          Uri.parse(response['link']),
          mode: LaunchMode.externalApplication,
        );
      } catch (e) {
        print(e);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> generateJDBQr(var price) async {
    try {
      var bodyData = {
        "amount": price,
        "description": "Take test from Lailaolab",
      };

      var response = await AppUrl.post(
        "${endPoint}/generate-jdb-qr",
        bodyData,
      );

      print(response);
      qrIB.value = response["qrCode"];
      await launchUrl(
        Uri.parse(response['appLink']),
        mode: LaunchMode.externalApplication,
      );
    } catch (e) {
      print(e);
    }
  }
}
