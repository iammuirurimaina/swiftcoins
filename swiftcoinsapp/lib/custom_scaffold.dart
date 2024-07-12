import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body;
  final String title;
  final String userName;

  CustomScaffold({
    required this.body,
    required this.title,
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color(0xFFE36F04),
        title: Text(title),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_rounded, color: Colors.white),
            onPressed: () {
              // Implement logout functionality
            },
          ),
          IconButton(
            icon: Icon(Icons.logout, color: Colors.white),
            onPressed: () {
              // Implement logout functionality
            },
          ),
        ],
      ),
      drawer: _buildDrawer(context),
      body: Column(
        children: [
          _buildHeader(),
          Expanded(child: body),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16, bottom: 10),
      color: Color(0xFFE36F04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  'Statim Capital',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Text(
            'Hi $userName,',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color(0xFFE36F04),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFFE36F04),
              ),
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
                    userName,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
            _buildDrawerItem(context, 'Home', Icons.home, '/'),
            _buildDrawerItem(context, 'Profile', Icons.person, '/profile'),
            _buildDrawerItem(context, 'Request Loan', Icons.monetization_on,
                '/request_loan'),
            _buildDrawerItem(context, 'Settings', Icons.settings, '/settings'),
            Divider(color: Colors.white54),
            _buildDrawerItem(context, 'Logout', Icons.exit_to_app, '/logout'),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(
      BuildContext context, String title, IconData icon, String route) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(title, style: TextStyle(color: Colors.white)),
      onTap: () {
        Navigator.pop(context); // Close the drawer
        if (route != '/logout') {
          Navigator.pushNamed(context, route);
        } else {
          // Implement logout functionality
        }
      },
    );
  }
}
