import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

calling() async{
  const number = '+91 0000 0000 0000';
  bool res = await FlutterPhoneDirectCaller.callNumber(number);
}