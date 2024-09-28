import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stripe_flutter/widgets/appbar_widget.dart';
import 'package:stripe_flutter/widgets/custom_button_widget.dart';

import 'controllers/payment_controller.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PaymentController controller = Get.put(PaymentController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          AllScreenAppBarWidget.showCardScreenApp(
            context: context,
            text: "Payment Screen",
            backgroundColor: Colors.blue,
            textColor: Colors.white,
            isLightStyle: true,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: controller.amountController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Enter amount \$',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: CustomButtonWidget(
          label: "Pay",
          onPressed: () => controller.makePayment(),
          buttonHeight: 50,
          buttonWidth: double.infinity,
          textColor: Colors.white,
          fontSize: 16,
        ),
      ),
    );
  }
}
