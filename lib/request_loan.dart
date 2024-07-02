import 'package:flutter/material.dart';
import 'custom_scaffold.dart';

class RequestLoan extends StatefulWidget {
  const RequestLoan({Key? key}) : super(key: key);

  @override
  _RequestLoanState createState() => _RequestLoanState();
}

class _RequestLoanState extends State<RequestLoan> {
  String? selectedLoan;
  final TextEditingController amountController = TextEditingController();

  // Hard-coded loan products (to be replaced with API data later)
  final List<String> loanProducts = [
    '4 Days at 2.00 percent',
    '7 Days at 3.50 percent ',
    '21 Days at 10.50 percent',
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Request Loan',
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
              'Loan Limit',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            Text(
              'KSh 13,456,789',
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
        labelText: 'Select Loan',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      value: selectedLoan,
      onChanged: (String? newValue) {
        setState(() {
          selectedLoan = newValue;
        });
      },
      items: loanProducts.map<DropdownMenuItem<String>>((String value) {
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
    );
  }

  Widget _buildContinueButton() {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        onPressed: () {
          // Implement loan request logic here
        },
        child: Text('Continue'),
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
