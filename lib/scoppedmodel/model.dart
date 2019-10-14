import 'package:scoped_model/scoped_model.dart';

class MainModel extends Model {
  bool _isvalidtoSubmit = false;
  bool _ispasswordSet = false;
  bool _isemailSet = false;

  bool get isvalidSubmission => _isvalidtoSubmit;

  toogleButton() {
    if (_isemailSet && _ispasswordSet) {
      _isvalidtoSubmit = true;
    } else {
      _isvalidtoSubmit = false;
    }
    notifyListeners();
  }

  tooglepassword(bool value) {
    _ispasswordSet = value;
    toogleButton();
  }

  toogleemail(bool value) {
    _isemailSet = value;
    toogleButton();
  }
}
