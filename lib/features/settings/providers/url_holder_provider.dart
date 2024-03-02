import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UrlHolderProvider extends ChangeNotifier {
  static final provider = ChangeNotifierProvider((ref) => UrlHolderProvider());

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _url = TextEditingController();

  GlobalKey<FormState> get formKey => _formKey;

  set formKey(GlobalKey<FormState> value) {
    _formKey = value;
    notifyListeners();
  }

  TextEditingController get url => _url;

  set url(TextEditingController value) {
    _url = value;
    notifyListeners();
  }
}
