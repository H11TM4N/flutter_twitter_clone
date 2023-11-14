import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_twitter_clone/common/common.dart';
import 'package:flutter_twitter_clone/data/constants/costants.dart';
import 'package:flutter_twitter_clone/data/constants/ui_constants.dart';
import 'package:flutter_twitter_clone/ui/theme/theme.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _page = 0;
  final appbar = UIConstants.appBar();

  void onPageChange(int index) {
    setState(() {
      _page = index;
    });
  }

  void onCreateTweet() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: _page,
        onTap: onPageChange,
        backgroundColor: Pallete.backgroundColor,
        items: [
          BottomNavigationBarItem(
            icon: svgPicture(
              assetName: _page == 0
                  ? SvgConstants.homeFilledIcon
                  : SvgConstants.homeOutlinedIcon,
              color: Pallete.whiteColor,
              height: 30,
            ),
          ),
          BottomNavigationBarItem(
            icon: svgPicture(
              assetName: SvgConstants.searchIcon,
              color: Pallete.whiteColor,
              height: 30,
            ),
          ),
          BottomNavigationBarItem(
            icon: svgPicture(
              assetName: _page == 2
                  ? SvgConstants.notifFilledIcon
                  : SvgConstants.notifOutlinedIcon,
              color: Pallete.whiteColor,
              height: 30,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onCreateTweet,
        child: const Icon(
          Icons.add,
          color: Pallete.whiteColor,
          size: 28,
        ),
      ),
    );
  }
}
