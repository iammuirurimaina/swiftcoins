import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'custom_scaffold.dart';
import 'package:intl/intl.dart';
import 'home.dart';

class AccountStatus extends StatelessWidget {
  final bool isCreditGood =
      true; // This could be determined by some logic or API call
  final double loanLimit = 50000;
  final List<LoanTransaction> transactions = [
    LoanTransaction(
        date: DateTime.now().subtract(Duration(days: 30)),
        amount: 10000,
        isPaid: true),
    LoanTransaction(
        date: DateTime.now().subtract(Duration(days: 60)),
        amount: 15000,
        isPaid: true),
    LoanTransaction(
        date: DateTime.now().subtract(Duration(days: 90)),
        amount: 20000,
        isPaid: false),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Account Status',
      userName: 'Samuel',
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildCreditStatus(),
            SizedBox(height: 20),
            _buildTransactionList(),
            SizedBox(height: 20),
            _buildButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildCreditStatus() {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isCreditGood ? Colors.green : Colors.red,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Credit Status',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              SizedBox(height: 8),
              Text(
                isCreditGood ? 'Good' : 'Bad',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
          Icon(
            isCreditGood ? Icons.thumb_up : Icons.thumb_down,
            size: 50,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionList() {
    return Container(
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Previous Loan Transactions',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: transactions.length,
            separatorBuilder: (context, index) => Divider(height: 1),
            itemBuilder: (context, index) {
              final transaction = transactions[index];
              return ListTile(
                leading: Icon(
                  transaction.isPaid ? Icons.check_circle : Icons.warning,
                  color: transaction.isPaid ? Colors.green : Colors.orange,
                ),
                title: Text('KSh ${transaction.amount.toStringAsFixed(2)}'),
                subtitle:
                    Text(DateFormat('MMM d, yyyy').format(transaction.date)),
                trailing: Text(
                  transaction.isPaid ? 'Paid' : 'Pending',
                  style: TextStyle(
                    color: transaction.isPaid ? Colors.green : Colors.orange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildButton(BuildContext context) {
    return SizedBox(
      width: 250,
      height: 60,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Back to Home'),
            SizedBox(width: 8),
            Icon(Icons.arrow_forward),
          ],
        ),
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: const Color(0xFFE36F04),
          padding: EdgeInsets.symmetric(vertical: 16),
        ),
      ),
    );
  }
}

class LoanTransaction {
  final DateTime date;
  final double amount;
  final bool isPaid;

  LoanTransaction(
      {required this.date, required this.amount, required this.isPaid});
}
