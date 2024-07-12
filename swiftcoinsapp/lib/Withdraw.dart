import 'package:flutter/material.dart';
import 'custom_scaffold.dart';

class Withdraw extends StatelessWidget {
  const Withdraw({super.key});
  final account = 111111111;
  final balance = 1000;

  @override
  Widget build(BuildContext context) {
    return

        /// `CustomScaffold` is a custom widget that is being used to create a scaffold with a
        /// specific layout for the Withdraw screen. It likely includes features such as a custom app
        /// bar, body content, and possibly other customizations specific to this screen.
        /// Unfortunately, the implementation of `CustomScaffold` is not provided in the code
        /// snippet, so we can't see its exact functionality.
        CustomScaffold(
      title: 'Withdraw',
      userName: 'Samuel',
      body: Column(
        children: [
          _buildAccountInfo(context),
          SizedBox(
            height: 20,
          ),
          _buildWithdraw(context),
          SizedBox(
              height: 20), // Optional: Space between withdraw field and button
          _buildContinueButton(context), // Include the continue button here
        ],
      ),
    );
  }

  Widget _buildAccountInfo(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Account Number',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              Text(
                '112233445566',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Current Loan Balance',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              Text(
                'KSh ${balance.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWithdraw(BuildContext context) {
    return Container(
      width: 350,
      height: 100,
      // padding: EdgeInsets.all(16),
      child: TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          labelText: 'Enter Amount in ksh',
        ),
      ),
    );
  }

  Widget _buildContinueButton(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFE36F04),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            minimumSize: Size(350, 60),
          ),
          onPressed: () {
            // Handle button press (navigate to next screen, etc.)
            // Example: Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => const EnterPin()),
            // );
          },
          child: const Text('CONTINUE', style: TextStyle(fontSize: 18)),
        ),
        SizedBox(
            height: 20), // Optional: Space between button and other content
      ],
    );
  }
}
