import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';
import 'package:flutter_facebook_responsive_ui/widgets/circle_button.dart';
import 'package:flutter_facebook_responsive_ui/widgets/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../data/data.dart';
import '../models/post_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TrackingScrollController _trackingScrollController =TrackingScrollController();
  @override
  void dispose(){
    _trackingScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: _HomeScreenMobile(scrollController :_trackingScrollController),
          desktop: _HomeScreenDesktop(scrollController :_trackingScrollController),
        ),
      ),
    );
  }
}


class _HomeScreenMobile extends StatelessWidget {
  final TrackingScrollController scrollController ;
  const _HomeScreenMobile({Key key, @required this.scrollController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverAppBar(
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          title: Text('Himanshu',style: TextStyle(
            color: Palette.facebookBlue,
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
            letterSpacing: -1.2,
          ),
          ),
          centerTitle: false,
          floating: true,
          actions: [
            CircleButton(icon: Icons.search, iconSize: 30.0, onPressed: (){}),
            CircleButton(icon: MdiIcons.facebookMessenger, iconSize: 30.0, onPressed: (){})
            ,],
        ),
        // SliverToBoxAdapter(
        //   child: CreatePostContainer(currentUser: currentUser,),
        // ),
        SliverPadding(padding: EdgeInsets.fromLTRB(0, 5.0, 0, 5.0)),
        SliverToBoxAdapter(
          child: OnlineUser(onlineUsers:onlineUsers),
        ),
        SliverList(delegate: SliverChildBuilderDelegate((context, index){
          final Post post = posts[index];
          return PostContainer(post:post);
        },
            childCount: posts.length
        )
        ),
      ],
    );
  }
}

class _HomeScreenDesktop extends StatelessWidget {
  final TrackingScrollController scrollController ;

  const _HomeScreenDesktop({Key key, @required this.scrollController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 2,
          child: Align(
              alignment: Alignment.centerRight,
              child: MoreOptionList(currentUser:currentUser)),
        ),
        SizedBox(width: 8.0,),
        Container(
          width: 700.0,
         child: ScrollConfiguration(
           behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
           child: CustomScrollView(
             controller: scrollController,
             physics: BouncingScrollPhysics(),
             slivers: [
               SliverList(delegate: SliverChildBuilderDelegate((context, index){
                 final Post post = posts[index];
                 return PostContainer(post:post);
               },
                   childCount: posts.length
               )
               ),
             ],
           ),
         ),
        ),
        SizedBox(width: 8.0,),
        Flexible(
          flex: 2,
          child: Align(
              alignment: Alignment.centerLeft,
              child: ContactList(users:onlineUsers))
        ),
      ],
    );
  }
}

