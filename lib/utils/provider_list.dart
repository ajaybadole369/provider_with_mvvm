import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:provider_state_mgm/view_models/auth_view_model.dart';

class ProviderList {
  static List<SingleChildWidget> providerList = [
    ChangeNotifierProvider(create: (_) => AuthViewModel()),
  ];
}
