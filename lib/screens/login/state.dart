import 'package:fl_country_code_picker/fl_country_code_picker.dart';

class LoginState {
  final countryPicker = FlCountryCodePicker();
  // Rx<CountryCode> code = CountryCode(name: 'Pakistan', code: 'PK', dialCode: '+92').obs;

  CountryCode code = CountryCode(name: 'Pakistan', code: 'PK', dialCode: '+92');
}