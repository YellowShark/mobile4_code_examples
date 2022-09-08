import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

const url = "https://us-central1-example-ed4df.cloudfunctions.net/stripePaymentIntentRequest";

class StripeHelper {
  static Future<void> initPaymentSheet({
    required String email,
    required int amount,
    required void Function() onSuccess,
    required void Function(String error) onError,
  }) async {
    try {
      // 1. create payment intent on the server
      final response = await http.post(
        Uri.parse(
          url,
        ),
        body: {
          'email': email,
          'amount': amount.toString(),
        },
      );

      final jsonResponse = jsonDecode(response.body);
      log(jsonResponse.toString());

      //2. initialize the payment sheet
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: jsonResponse['paymentIntent'],
          merchantDisplayName: 'Flutter Stripe Store Demo',
          customerId: jsonResponse['customer'],
          customerEphemeralKeySecret: jsonResponse['ephemeralKey'],
          style: ThemeMode.light,
        ),
      );

      await Stripe.instance.presentPaymentSheet();

      onSuccess();
    } catch (e) {
      log(e.toString());
      if (e is StripeException) {
        onError('Error from Stripe: ${e.error.localizedMessage}');
      } else {
        onError('Error: $e');
      }
    }
  }
}
