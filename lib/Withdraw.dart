import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'custom_scaffold.dart';

const List<String> list = <String>['112233445566', '998877665544'];

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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildAccountInfo(context),
          SizedBox(height: 10),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            DropdownMenu(),
          ]),
          SizedBox(
            height: 10,
          ),
          _buildWithdraw(context),
          SizedBox(
              height: 10), // Optional: Space between withdraw field and button
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
    //return Container(
    //width: double.infinity,
    // height: 60,
    // padding: EdgeInsets.all(16),
    //child:
    return SizedBox(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.6,
        child: TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            labelText: 'Enter Amount in ksh',
          ),
        ),
      ),
    );
    //);
  }

  Widget _buildContinueButton(context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.6,
      height: 60,
      child: ElevatedButton(
        onPressed: () {
          // Implement loan repayment logic here
          Fluttertoast.showToast(
              msg: "You have successfully withdrawn 20,000 from your account",
              gravity: ToastGravity.CENTER,
              toastLength: Toast.LENGTH_LONG,
              fontSize: 15,
              backgroundColor: Color.fromARGB(255, 227, 112, 5));
        },
        child: Text('Withdraw'),
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: const Color(0xFFE36F04),
          padding: EdgeInsets.symmetric(vertical: 16),
        ),
      ),
    );
  }
}

class DropdownMenu extends StatefulWidget {
  const DropdownMenu({super.key});

  @override
  State<DropdownMenu> createState() => _DropdownMenuState();
}

class _DropdownMenuState extends State<DropdownMenu> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: DropdownButton<String>(
        borderRadius: BorderRadius.circular(10),
        value: list.first,
        onChanged: (String? value) {
          // This is called when the user selects an item.
          setState(() {
            dropdownValue = value!;
          });
        },
        items: list.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
