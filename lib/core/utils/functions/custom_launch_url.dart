import 'package:url_launcher/url_launcher.dart';

import 'custom)snack_bar.dart';

Future<void> customLaunchUrl(
  context,
  String? url,
) async {
  if (url != null) {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      launchUrl(uri);
    } else {
      customSnackBar(context, 'Cannot launch $url');
    }
  }
}
