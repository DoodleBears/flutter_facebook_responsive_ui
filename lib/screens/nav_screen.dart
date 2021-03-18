import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/data/data.dart';
import 'package:flutter_facebook_responsive_ui/screens/screens.dart';
import 'package:flutter_facebook_responsive_ui/widgets/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class NavScreen extends StatefulWidget {
  NavScreen({Key key}) : super(key: key);

  @override
  _NavScreenState createState() => _NavScreenState();
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
  final List<IconData> _icons = const [
    Icons.home,
    Icons.ondemand_video,
    MdiIcons.accountCircleOutline,
    MdiIcons.accountGroupOutline,
    MdiIcons.bellOutline,
    Icons.menu,
  ];
  final List<String> _tabName = const [
    '首页',
    '视频',
    '个人',
    '群组',
    '提醒',
    '设置',
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
        // indexedStack can save the scroll position while changing tabbar
        // TODO: learn how IndexedStack works?
        body: IndexedStack(
          index: _selectedIndex,
          children: _screens,
        ),
        // Navigation bar using CustomTabBar
        bottomNavigationBar: !Responsive.isDesktop(context)
            ? Container(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: CustomTabBar(
                  icons: _icons,
                  selectedIndex: _selectedIndex,
                  onTap: (index) => setState(() => _selectedIndex = index),
                  tabName: _tabName,
                ),
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
