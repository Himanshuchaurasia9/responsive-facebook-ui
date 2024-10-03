import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/models/models.dart';
import 'package:flutter_facebook_responsive_ui/widgets/responsive.dart';
import 'package:flutter_facebook_responsive_ui/widgets/user_card.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MoreOptionList extends StatelessWidget {
  final User currentUser;
  final List<List> _moreOptionList= const[
    [MdiIcons.shieldAccount, Colors.deepPurple,'Covid-19 sheid'],
    [MdiIcons.shieldAccount, Colors.pinkAccent,'Covid-19 sheid'],
    [MdiIcons.shieldAccount, Colors.yellowAccent,'Covid-19 sheid'],
    [MdiIcons.shieldAccount, Colors.greenAccent,'Covid-19 sheid'],
    [MdiIcons.shieldAccount, Colors.deepPurple,'Covid-19 sheid'],
    [MdiIcons.shieldAccount, Colors.deepPurple,'Covid-19 sheid'],
  ];
  const MoreOptionList({Key key, @required this.currentUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    return Card(
      margin: EdgeInsets.symmetric(vertical:5.0,horizontal: isDesktop ? 5.0: 0.0),
      elevation: isDesktop ? 2.0 : 1.0,
      shape: isDesktop ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)):null,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.0,vertical: 5.0),

        constraints: BoxConstraints(maxWidth: 280),
        child: ListView.builder(
            itemCount: 1+_moreOptionList.length,
            itemBuilder: (BuildContext context, int index){
            if (index == 0){
              return Padding(padding: EdgeInsets.symmetric(vertical: 8.0),
              child: UserCard(user: currentUser),);
            }
            final List option = _moreOptionList[index-1];
            return Padding(padding: EdgeInsets.symmetric(vertical: 3.0),
            child: _Option(icon:option[0],color:option[1],label:option[2]));
        }),
      ),
    );
  }
}


class _Option extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;
  const _Option({Key key,@required this.icon,@required this.color,@required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Row(
        children: [Icon(icon,size: 38.0,color: color,),
        const SizedBox(width: 6.0,),
      Flexible(child: Text(label,style: TextStyle(fontSize: 16.0),overflow: TextOverflow.ellipsis,),
      ),
      ]
    ),
    );
  }
}
