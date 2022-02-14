import 'dart:convert';
import 'package:http/http.dart';

Future sendNotification({
  required List<String> tokenIdList,
  required String contents,
  required String heading,
}) async {
  return await post(
    Uri.parse('https://onesignal.com/api/v1/notifications'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      "app_id":
          "c5a79fcd-73d4-4ce0-8190-638459f8705a", //kAppId is the App Id that one get from the OneSignal When the application is registered.

      "include_player_ids":
          tokenIdList, //tokenIdList Is the List of All the Token Id to to Whom notification must be sent.

      // android_accent_color reprsent the color of the heading text in the notifiction
      "android_accent_color": "FF9976D2",

      "small_icon": "ic_stat_onesignal_default",

      "headings": {"en": heading},

      "contents": {"en": contents},
    }),
  );
}
