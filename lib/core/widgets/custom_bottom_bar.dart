import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:voting_system_app/features/home/screens/candidate_screen.dart';
import 'package:voting_system_app/features/home/screens/result_screen.dart';
import 'package:voting_system_app/features/home/screens/vote_screen.dart';

import '../../features/home/screens/profile_screen.dart';

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({
    final Key? key,
  }) : super(key: key);

  @override
  _CustomBottomBarState createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  final PersistentTabController _controller = PersistentTabController();
  final bool _hideNavBar = false;

  List<Widget> _buildScreens() => [
        const CandidateScreen(),
        const VoteScreen(),
        const ResultScreen(),
        const ProfileScreen(),
      ];

  List<PersistentBottomNavBarItem> _navBarsItems() => [
        PersistentBottomNavBarItem(
            icon: const Icon(Icons.people_alt_rounded),
            inactiveIcon: const Icon(Icons.people_alt_outlined),
            title: "Кандидаты",
            activeColorPrimary: Colors.blue,
            inactiveColorPrimary: Colors.black),
        PersistentBottomNavBarItem(
            icon: const Icon(Icons.how_to_vote),
            inactiveIcon: const Icon(Icons.how_to_vote_outlined),
            title: "Голосование",
            activeColorPrimary: Colors.blue,
            inactiveColorPrimary: Colors.black),
        PersistentBottomNavBarItem(
            icon: const Icon(Icons.check_circle_outline),
            inactiveIcon: const Icon(Icons.check_circle_outline_outlined),
            title: "result",
            activeColorPrimary: Colors.blue,
            inactiveColorPrimary: Colors.black),
        PersistentBottomNavBarItem(
            icon: const Icon(Icons.person),
            inactiveIcon: const Icon(Icons.person_outline),
            title: "Профиль",
            activeColorPrimary: Colors.blue,
            inactiveColorPrimary: Colors.black),
      ];

  @override
  Widget build(final BuildContext context) => Scaffold(
        body: PersistentTabView(
          context,
          controller: _controller,
          screens: _buildScreens(),
          items: _navBarsItems(),
          resizeToAvoidBottomInset: true,
          navBarHeight: MediaQuery.of(context).viewInsets.bottom > 0
              ? 0.0
              : kBottomNavigationBarHeight,
          bottomScreenMargin: 0,

          hideNavigationBar: _hideNavBar,
          decoration: const NavBarDecoration(colorBehindNavBar: Colors.indigo),
          itemAnimationProperties: const ItemAnimationProperties(
            duration: Duration(milliseconds: 400),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: const ScreenTransitionAnimation(
            animateTabTransition: true,
          ),
          navBarStyle:
              NavBarStyle.style1, // Choose the nav bar style with this property
        ),
      );
}
