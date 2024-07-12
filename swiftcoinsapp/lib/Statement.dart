import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'custom_scaffold.dart';

const List<String> list = <String>['Withdraw', 'Deposits', 'Loans'];

class Statement extends StatelessWidget {
  const Statement({super.key});
  final account = 111111111;
  final balance = 1000;

  @override
  Widget build(BuildContext context) {
    return

        /// CustomScaffold is a custom widget that is being used to create a scaffold with a
        /// specific layout for the Withdraw screen. It likely includes features such as a custom app
        /// bar, body content, and possibly other customizations specific to this screen.
        /// Unfortunately, the implementation of CustomScaffold is not provided in the code
        /// snippet, so we can't see its exact functionality.
        CustomScaffold(
      title: 'Mini-Statement',
      userName: 'Samuel',
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            DropdownMenu(),
          ]),
          Center(child: DataTableExample()),
        ],
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
    return DropdownButton<String>(
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
    );
  }
}





class DataTableExample extends StatelessWidget {
  const DataTableExample({super.key});

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const <DataColumn>[
        DataColumn(
          label: Expanded(
            child: Text(
              'Date',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Description',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Amount',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
      ],
      rows: const <DataRow>[
        DataRow(
          cells: <DataCell>[
            DataCell(Text('10/06/2024')),
            DataCell(Text('Deposit from Mpesa')),
            DataCell(Text('30,000')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('20/06/2024')),
            DataCell(Text('withdrawal to Mpesa')),
            DataCell(Text('Professor')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('03/07/2024')),
            DataCell(Text('Loan Repayment')),
            DataCell(Text('15,000')),
          ],
        ),
      ],
    );
  }
}