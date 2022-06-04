import 'package:flutter/material.dart';
import 'package:bhs__companion__app/views/views_all.dart';
import 'package:url_launcher/url_launcher.dart';

class ResourcesProvider extends ChangeNotifier {
  void openAspen() => openUrl(Uri.parse("https://ma-burlington.myfollett.com/aspen/logon.do"));
  void openNaviance() => openUrl(Uri.parse("https://student.naviance.com/auth/fclookup"));
  void openClassroom() => openUrl(Uri.parse("https://classroom.google.com"));
  void openGmail() => openUrl(Uri.parse("https://mail.google.com"));
  void openBhsWebsite() => openUrl(Uri.parse("https://www.burlingtonpublicschools.org/cms/One.aspx?portalId=70047685&pageId=70217008"));
  void openBhsLibraryWebsite() => openUrl(Uri.parse("https://sites.google.com/bpsk12.org/bhs-library/home"));

  void openUrl(Uri path) async {
    if (!await launchUrl(path, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $path';
    }
  }

  void showAboutView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AboutView(),
      )
    );
  }
}