// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/material.dart';
import 'package:swiftcoins/account_status.dart';
import 'package:swiftcoins/repay_loan.dart';


import 'home.dart';
import 'login.dart';
import 'request_loan.dart';
import 'deposit.dart';


// TODO: Convert SwiftCoins to stateful widget (104)
class SwiftCoins extends StatelessWidget {
  const SwiftCoins({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SwiftCoins',
      initialRoute: '/login',
      routes: {
        '/login': (BuildContext context) => const LoginPage(),
        // TODO: Change to a Backdrop with a HomePage frontLayer (104)
        '/': (BuildContext context) => HomePage(),
        '/request_loan': (context) => const RequestLoan(),
        '/repay_loan' : (context) => const RepayLoan(),
         '/account_status' : (context) => AccountStatus(),
         '/deposit': (context) => Deposit(),

        // TODO: Make currentCategory field take _currentCategory (104)
        // TODO: Pass _currentCategory for frontLayer (104)
        // TODO: Change backLayer field value to CategoryMenuPage (104)
      },
      // TODO: Customize the theme (103)
      theme: ThemeData.light(useMaterial3: true),
    );
  }
}
