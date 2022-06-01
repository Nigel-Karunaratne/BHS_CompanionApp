import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

class ResorcesProvider extends ChangeNotifier {
  void openAspen() => openUrl(Uri.parse("https://ma-burlington.myfollett.com/aspen/logon.do"));
  void openNaviance() => openUrl(Uri.parse("https://student.naviance.com/auth/fclookup"));
  

  void openUrl(Uri path) async {
    if (!await launchUrl(path)) {
      throw 'Could not launch $path';
    }
  }
}