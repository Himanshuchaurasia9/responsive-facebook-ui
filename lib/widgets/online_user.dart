import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/models/models.dart';
import 'package:flutter_facebook_responsive_ui/widgets/profile_avatar.dart';
import 'package:flutter_facebook_responsive_ui/widgets/responsive.dart';
import '../models/user_model.dart';


class OnlineUser extends StatelessWidget {
  final List<User> onlineUsers;
  const OnlineUser({Key key, @required this.onlineUsers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical:5.0),
      elevation: 1.0,
      shape: null,
      child: Container(
        height: 60,
        color: Colors.white,
        child: ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
          scrollDirection: Axis.horizontal,
          itemCount: onlineUsers.length, // Corrected itemCount
          itemBuilder: (BuildContext context, int index) {
            final User user = onlineUsers[index];
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: ProfileAvatar(imageUrl: user.imageUrl, isActive: true),
            );
          },
        ),
      ),
    );
  }
}
