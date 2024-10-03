import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/widgets/profile_avatar.dart';

import '../models/user_model.dart';

class UserCard extends StatelessWidget {
  final User user;

  const UserCard({Key key, @required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ProfileAvatar(imageUrl: user.imageUrl,isActive: true),
          SizedBox(width: 6.0,),
          Flexible(
              child: Text(user.name, style: TextStyle(fontSize: 16.0),overflow: TextOverflow.ellipsis,))
        ],
      ),
    );
  }
}
