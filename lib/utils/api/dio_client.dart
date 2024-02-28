import 'package:dio/dio.dart';
import 'package:jub_mue_dev_5/utils/helper/dialog_helper.dart';

class AppUrl {
  static Dio dio = Dio(BaseOptions(
    connectTimeout: const Duration(milliseconds: 30000),
    receiveTimeout: const Duration(milliseconds: 30000),
  ));

  static const String urlSocket =
      "https://payment-gateway.lailaolab.com/?key=$keyDev";
  static const String keyDev =
      "\$2b\$10\$bE5wXAjnzkV6O4BaVMq9meFzEEQczh2yPvcR2Hpl9tgMFHIjay6mK";

  static Future<dynamic> post(
    String url,
    dynamic body, {
    bool loading = true,
  }) async {
    try {
      if (loading) Loading.show();
      dio.options.headers.addAll({
        'Content-Type': 'application/json',
        "devSecretKey": keyDev,
      });
      var response = await dio.post(url, data: body);
      await Future.delayed(Duration(seconds: 2));
      if (loading) Loading.hide();
      if (response.statusCode == 200) {
        return response.data;
      } else {
        return response.data;
      }
    } catch (e) {
      Loading.hide();
      print("Erro r $e");
    }
  }

  //GET
  static Future<dynamic> get(String url, {bool loading = true}) async {
    try {
      if (loading) Loading.show();

      var response = await dio.get(url);
      if (loading) Loading.hide();
      if (response.statusCode == 200) {
        return response.data;
      } else {
        DialogHelper.showErrorDialog(description: response.statusMessage!);
      }
    } catch (e) {
      Loading.hide();
      print(e);
    }
  }
}
