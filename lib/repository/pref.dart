import 'package:extensionresoft/extensionresoft.dart';

String empty = '';

//
String get emailAddress => SharedPreferencesService.getString('emailAddress') ?? empty;

set emailAddress(String value) => SharedPreferencesService.setString('emailAddress', value);

//
String get verificationEmailAddress => SharedPreferencesService.getString('verificationEmailAddress') ?? empty;

set verificationEmailAddress(String value) => SharedPreferencesService.setString('verificationEmailAddress', value);

//
String get token => SharedPreferencesService.getString('token') ?? empty;

set token(String value) => SharedPreferencesService.setString('token', value);

//
/*String get page => SharedPreferencesService.getString('page') ?? RouteConstants.onboarding;

set page(String value) => SharedPreferencesService.setString('page', value);*/

//
bool get isCodeSent => SharedPreferencesService.getBool('isCodeSent') ?? false;

set isCodeSent(bool value) => SharedPreferencesService.setBool('isCodeSent', value);

//
String get country => SharedPreferencesService.getString('country') ?? empty;

set country(String value) => SharedPreferencesService.setString('country', value);

//
String? get countryCode => SharedPreferencesService.getString('countryCode');

set countryCode(String? value) => SharedPreferencesService.setString('countryCode', value!);

//
String get fullName => SharedPreferencesService.getString('fullName') ?? empty;

set fullName(String value) => SharedPreferencesService.setString('fullName', value);

//
String get userName => SharedPreferencesService.getString('userName') ?? empty;

set userName(String value) => SharedPreferencesService.setString('userName', value);

//
String get device => SharedPreferencesService.getString('device') ?? empty;

set device(String value) => SharedPreferencesService.setString('device', value);

//
String get pin => SharedPreferencesService.getString('pin') ?? empty;

set pin(String value) => SharedPreferencesService.setString('pin', value);

//
bool get isSignedIn => SharedPreferencesService.getBool('isSignedIn') ?? false;

set isSignedIn(bool value) => SharedPreferencesService.setBool('isSignedIn', value);
