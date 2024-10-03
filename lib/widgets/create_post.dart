import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/widgets/profile_avatar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../models/user_model.dart';


class CreatePostContainer extends StatelessWidget {
  final User currentUser;
  const CreatePostContainer({Key key, @required this.currentUser})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
      height: 100.0,
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              ProfileAvatar(imageUrl: currentUser.imageUrl),
             const SizedBox(width: 8.0,),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(hintText: "What\'s on your mind?"),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton.icon(onPressed: (){}, icon: Icon(Icons.videocam,color: Colors.red,),label: Text("Live"),),
              VerticalDivider(width: 8.0,),
              TextButton.icon(onPressed: (){}, icon: Icon(Icons.photo_library,color: Colors.red,),label: Text("Photos"),),
              VerticalDivider(width: 8.0,),
              TextButton.icon(onPressed: (){}, icon: Icon(Icons.video_call,color: Colors.red,),label: Text("Rooms"),),


            ],
          )
        ],
      ),
    );
  }
}
