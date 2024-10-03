import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/data/data.dart';
import 'package:flutter_facebook_responsive_ui/screens/home_screen.dart';
import 'package:flutter_facebook_responsive_ui/widgets/responsive.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_tab.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({Key key}) : super(key: key);

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens = [
    HomeScreen(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];

  final List<IconData> _icons = [
    Icons.home,
    MdiIcons.accountGroupOutline,
    MdiIcons.plusBoxOutline,
    MdiIcons.bellOutline,
    MdiIcons.menu,
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return DefaultTabController(
      length: _icons.length,
      child: Scaffold(
          appBar: Responsive.isDesktop(context)
              ? PreferredSize(
                  preferredSize: Size(screenSize.width, 100.0),
                  child: CustomAppBar(
                    currentUser: currentUser,
                    icons: _icons,
                    selectedIndex: _selectedIndex,
                    onTap: (index) => setState(() => _selectedIndex = index),
                  ),
                )
              : null,
          body: IndexedStack(
            index: _selectedIndex,
            children: _screens,
          ),
          bottomNavigationBar: !Responsive.isDesktop(context)
              ? Container(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: CustomTabBar(
                    icons: _icons,
                    selectedIndex: _selectedIndex,
                    onTap: (index) => setState(() => _selectedIndex = index),
                  ),
                )
              : const SizedBox.shrink()),
    );
  }
}
