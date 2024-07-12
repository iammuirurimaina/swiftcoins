import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
//import 'package:swiftcoinsapp/Statement.dart';
// import 'package:swiftcoins/deposit.dart';
// import 'request_loan.dart';
import 'custom_scaffold.dart';
import 'Withdraw.dart';
import 'Statement.dart';
// import 'account_status.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final account = 111111111;
  final balance = 1000;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        title: 'Home',
        userName: 'Samuel',
        body: Column(
          children: [
            buildAccountInfo(context),
            _buildActionButtons(context),
            _buildBottomNavigation(context),
          ],
        ));
  }

  // Widget _buildHeader() {
  //   return Container(
  //     padding: EdgeInsets.only(top: 40, left: 16, right: 16, bottom: 20),
  //     color: Color(0xFFE36F04),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             IconButton(
  //               icon: Icon(Icons.menu, color: Colors.white),
  //               onPressed: () {

  //               },
  //             ),
  //             Text(
  //               'Statim Capital',
  //               style: TextStyle(
  //                 color: Colors.white,
  //                 fontSize: 20,
  //                 fontWeight: FontWeight.bold,
  //               ),
  //             ),
  //             Icon(Icons.logout, color: Colors.white),
  //           ],
  //         ),
  //         SizedBox(height: 20),
  //         Text(
  //           'Hello Samuel',
  //           style: TextStyle(
  //             color: Colors.white,
  //             fontSize: 24,
  //             fontWeight: FontWeight.bold,
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget buildAccountInfo(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        margin: EdgeInsets.all(16),
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
          children: [
            Text(
              'Account Number',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            Text(
              '$account',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Loan Limit',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            Text(
              'KSh $balance',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 3,
        padding: EdgeInsets.all(20),
        children: [
          _buildActionButton(context, 'Request\nLoan', Icons.monetization_on),
          _buildActionButton(context, 'Pay\nLoan', Icons.payment),
          _buildActionButton(context, 'Account\nStatus', Icons.account_balance),
          _buildActionButton(context, 'Deposit', Icons.account_balance_wallet),
          _buildActionButton(context, 'Withdraw', Icons.money),
          _buildActionButton(context, 'Terms &\nConditions', Icons.description),
        ],
      ),
    );
  }

  Widget _buildActionButton(BuildContext context, String label, IconData icon) {
    return GestureDetector(
      onTap: () {
        // if (label == 'Request\nLoan') {
        //   Navigator.push(
        //     context,
        //     MaterialPageRoute(builder: (context) => RequestLoan()),
        //   );
        // }
        // if (label == 'Pay\nLoan') {
        //   Navigator.push(
        //     context,
        //     MaterialPageRoute(builder: (context) => RepayLoan()),
        //   );
        // }
        // if (label == 'Account\nStatus') {
        //   Navigator.push(
        //     context,
        //     MaterialPageRoute(builder: (context) => AccountStatus()),
        //   );
        // }
        if (label == 'Withdraw') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Withdraw()),
          );
        }
        ;
        // Add other navigation or action logic for other buttons here
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: Color(0xFFE36F04)),
          SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Color(0xFFE36F04),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigation(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey.shade300)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(context, 'Home', Icons.home, true, () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          }),
          _buildNavItem(context, 'Sacco\n360', Icons.group, false, () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Statement()),
            );
          }),
          _buildNavItem(context, 'Mini\nStatement', Icons.receipt, false, () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Statement()),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, label, IconData icon,
      bool isSelected, Function onTap) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Padding(
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
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color(0xFFE36F04),
        child: Column(
          children: [
            DrawerHeader(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    child:
                        Icon(Icons.person, size: 40, color: Color(0xFFE36F04)),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Samuel',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
            _buildDrawerItem(context, 'Profile', Icons.person),
            _buildDrawerItem(context, 'Home', Icons.home),
            _buildDrawerItem(context, 'Settings', Icons.settings),
            Spacer(),
            _buildDrawerItem(context, 'Logout', Icons.exit_to_app),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(BuildContext context, String title, IconData icon) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(title, style: TextStyle(color: Colors.white)),
      onTap: () {
        // Handle navigation or action here
        Navigator.pop(context); // Close the drawer
      },
    );
  }
}
