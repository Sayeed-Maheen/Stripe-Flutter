import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

class PaymentController extends GetxController {
  static const String clientKey = "Your Secret key";

  final amountController = TextEditingController();
  Map<String, dynamic>? paymentIntent;

  @override
  void onClose() {
    amountController.dispose();
    super.onClose();
  }

  Future<Map<String, dynamic>> createPaymentIntent(
      String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card'
      };

      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization': 'Bearer $clientKey',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
      );
      log('Payment Intent Body->>> ${response.body}');
      return jsonDecode(response.body);
    } catch (err) {
      log('Error creating payment intent: $err');
      rethrow;
    }
  }

  String calculateAmount(String amount) {
    final calculatedAmount = (double.parse(amount) * 100).round();
    return calculatedAmount.toString();
  }

  Future<void> makePayment() async {
    if (amountController.text.isEmpty) {
      Get.snackbar('Error', 'Please enter an amount',
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    try {
      paymentIntent = await createPaymentIntent(amountController.text, 'USD');

      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntent!['client_secret'],
          style: ThemeMode.light,
          merchantDisplayName: 'Your Company Name',
        ),
      );

      await displayPaymentSheet();
    } catch (e) {
      log("Error in makePayment: $e");
      Get.snackbar('Error', 'Payment failed: $e',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet();
      Get.snackbar('Success', 'Payment successful',
          snackPosition: SnackPosition.BOTTOM);
      paymentIntent = null;
      amountController.clear();
    } on StripeException catch (e) {
      log('Stripe error: $e');
      Get.snackbar('Error', 'Stripe error: ${e.error.localizedMessage}',
          snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      log('Error in displayPaymentSheet: $e');
      Get.snackbar('Error', 'Payment failed: $e',
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
