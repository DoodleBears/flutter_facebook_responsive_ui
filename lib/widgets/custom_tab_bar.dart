import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';
import 'package:flutter_facebook_responsive_ui/widgets/widgets.dart';

class CustomTabBar extends StatelessWidget {
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;
  final List<String> tabName;
  final bool isBottomIndicator;

  const CustomTabBar({
    Key key,
    @required this.icons,
    @required this.selectedIndex,
    @required this.onTap,
    this.tabName,
    this.isBottomIndicator = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicator: BoxDecoration(
        // when it's Desktop make Indicator on bottom, Mobile make it on Top
        border: isBottomIndicator
            ? Border(
                bottom: BorderSide(
                  color: Palette.facebookBlue,
                  width: 3.0,
                ),
              )
            : Border(
                top: BorderSide(
                  color: Palette.facebookBlue,
                  width: 3.0,
                ),
              ),
      ),
      tabs: icons
          // use asMap() to get the index of icons
          .asMap()
          // mapping the List<IconData> into (i, e) which means index and element
          .map(
            (i, e) => MapEntry(
              i,
              Tab(
                iconMargin: const EdgeInsets.only(bottom: 3.0),
                // add tab name
                // hide tab name when it shows on Desktop(web)
                child: !Responsive.isDesktop(context)
                    ? Text(
                        tabName[i],
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: i == selectedIndex
                              ? Palette.facebookBlue
                              : Colors.black45,
                        ),
                      )
                    : null,
                // set Tab Icon
                icon: Icon(
                  e,
                  // set color to blue when selected
                  color: i == selectedIndex
                      ? Palette.facebookBlue
                      : Colors.black45,
                  size: 30.0,
                ),
              ),
            ),
          )
          // finally take all the value of the map
          .values
          // convert Iterable<Tab> into List
          .toList(),
      onTap: onTap,
    );
  }
}
