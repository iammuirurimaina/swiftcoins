import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:swiftcoins/home.dart';
import 'custom_scaffold.dart';

class RepayLoan extends StatefulWidget {
  const RepayLoan({Key? key}) : super(key: key);

  @override
  _RepayLoanState createState() => _RepayLoanState();
}

class _RepayLoanState extends State<RepayLoan> {
  String? selectedOption;
  final TextEditingController amountController = TextEditingController();
  final double currentLoan =
      10000; // This can be fetched from an API or passed as a parameter

  final List<String> options = [
    'Full Amount',
    'Custom Amount',
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Repay Loan',
      userName: 'Samuel',
      body: Column(
        children: [
          _buildLoanForm(),
          Spacer(),
          _buildBottomNavigation(),
        ],
      ),
    );
  }

  Widget _buildLoanForm() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildAccountInfo(),
          SizedBox(height: 20),
          _buildLoanSelector(),
          SizedBox(height: 20),
          _buildAmountInput(),
          SizedBox(height: 20),
          _buildContinueButton(),
        ],
      ),
    );
  }

  Widget _buildAccountInfo() {
    return Center(
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
              'KSh ${currentLoan.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoanSelector() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: 'Select Option',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      value: selectedOption,
      onChanged: (String? newValue) {
        setState(() {
          selectedOption = newValue;
          if (newValue == 'Full Amount') {
            amountController.text = currentLoan.toString();
          } else {
            amountController.text = '';
          }
        });
      },
      items: options.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  Widget _buildAmountInput() {
    return TextField(
      controller: amountController,
      decoration: InputDecoration(
        labelText: 'Enter Amount',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      keyboardType: TextInputType.number,
      enabled: selectedOption != 'Full Amount',
    );
  }

  Widget _buildContinueButton() {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        onPressed: () {
          // Implement loan repayment logic here
          if (selectedOption == 'Full Amount') {
            print('Repaying full amount: $currentLoan');
          } else {
            print('Repaying custom amount: ${amountController.text}');
          }
          Fluttertoast.showToast(
              msg:
                  "Your request has been received\n You will receive a request to enter your MPESA PIN shortly!",
              gravity: ToastGravity.CENTER,
              toastLength: Toast.LENGTH_LONG,
              fontSize: 15,
              backgroundColor: Color.fromARGB(255, 227, 112, 5));
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        },
        child: Text('Pay Loan'),
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: const Color(0xFFE36F04),
          padding: EdgeInsets.symmetric(vertical: 16),
        ),
      ),
    );
  }

  Widget _buildBottomNavigation() {
    return Container(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey.shade300)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem('Home', Icons.home),
          _buildNavItem('Sacco\n360', Icons.group),
          _buildNavItem('Mini\nStatement', Icons.receipt),
        ],
      ),
    );
  }

  Widget _buildNavItem(String label, IconData icon, [bool isSelected = false]) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: isSelected ? Color(0xFFE36F04) : Colors.grey),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              color: isSelected ? Color(0xFFE36F04) : Colors.black,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
