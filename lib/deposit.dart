import 'package:flutter/material.dart';
import 'custom_scaffold.dart';
import 'home.dart';

class Deposit extends StatelessWidget {
  const Deposit({super.key});
  final account = 111111111;
  final balance = 1000;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Deposit',
      userName: 'Samuel',
      body: Column(
        children: [
          _buildAccountInfo(context),
          SizedBox(
            height: 20,
          ),
          _buildDeposit(context),
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

  Widget _buildDeposit(BuildContext context) {
    return Container(
      width: 350,
      height: 70,
      // padding: EdgeInsets.all(16),
      child: TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          labelText: 'Enter Amount',
        ),
      ),
    );
  }
}
