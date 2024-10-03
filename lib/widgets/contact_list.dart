import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/widgets/responsive.dart';
import 'package:flutter_facebook_responsive_ui/widgets/user_card.dart';
import '../models/user_model.dart';

class ContactList extends StatelessWidget {
  final List<User> users;
  const ContactList({Key key, @required this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    return Card(
      margin: EdgeInsets.symmetric(vertical:5.0,horizontal: isDesktop ? 5.0: 0.0),
      elevation: isDesktop ? 2.0 : 1.0,
      shape: isDesktop ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)):null,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.0,vertical: 5.0),
        constraints: BoxConstraints(maxWidth: 280.0),
        child: Column(
          children: [
            Row(
          children: [
            Expanded(child: Text('Contact', style: TextStyle(color: Colors.grey[600],fontWeight: FontWeight.w500, fontSize: 18),)),
            Icon(Icons.search,color: Colors.grey[600],),
            Icon(Icons.more_vert,color: Colors.grey[600],),
          ],
      ),Divider(),
            Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  itemCount: users.length,
                  itemBuilder: (BuildContext context, int index){
                    final User user = users[index];
                  return Padding(padding: EdgeInsets.symmetric(vertical: 3.0),
                      child: UserCard(user: user,),
                  );

              }),
            )
        ],
      ),
      ),
    );
  }
}
