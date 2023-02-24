import 'package:flutter/material.dart';
import 'package:provider_state_mgm/res/color_picker.dart';
import 'package:provider_state_mgm/utils/provider_list.dart';
import 'package:provider_state_mgm/utils/routes/route_name.dart';
import 'package:provider_state_mgm/utils/routes/routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers:ProviderList.providerList,child:
    MaterialApp(
      initialRoute: RouteName.loginView,
      onGenerateRoute: Routes.generateRoute,
      debugShowCheckedModeBanner: false,
      title: 'PROVIDER',
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor:  ColorPicker.kUltraBlack,)

      ),
    ),);
  }
}
