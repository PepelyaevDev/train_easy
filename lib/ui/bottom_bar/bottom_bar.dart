import 'package:flutter/material.dart';
import 'package:train_easy/l10n/generated/app_localizations.dart';
import 'package:train_easy/ui/profile_screen/profile_screen.dart';
import 'package:train_easy/ui/workouts_screen/workouts_screen.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = _BottomBarItem.values.indexOf(_BottomBarItem.workoutsScreen);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _BottomBarItem.values.map((e) => e.page).toList(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _BottomBarItem.values
            .map(
              (e) => BottomNavigationBarItem(
                icon: e.icon,
                label: e.getLabel(context),
              ),
            )
            .toList(),
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}

enum _BottomBarItem {
  workoutsScreen(
    WorkoutsScreen(),
    Icon(Icons.playlist_add_check),
  ),
  profileScreen(
    ProfileScreen(),
    Icon(Icons.manage_accounts),
  );

  const _BottomBarItem(this.page, this.icon);
  final Widget page;
  final Widget icon;

  String getLabel(BuildContext context) {
    return switch (this) {
      _BottomBarItem.workoutsScreen => AppLocalizations.of(context)!.bottomNavWorkouts,
      _BottomBarItem.profileScreen => AppLocalizations.of(context)!.bottomNavProfile,
    };
  }
}
