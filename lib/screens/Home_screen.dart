import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zoom_meeting/Widgets/home_meeting_button.dart';
import 'package:zoom_meeting/utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;

  onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        title: const Text("Meet and Chat"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HomeMeetingButton(
                onPressed: () {},
                text: "New Meeting",
                icon: Icons.videocam,
              ),
              HomeMeetingButton(
                onPressed: () {},
                text: "Join Meeting",
                icon: Icons.add_box_rounded,
              ),
              HomeMeetingButton(
                onPressed: () {},
                text: "Scheduling Meeting",
                icon: Icons.calendar_view_day,
              ),
              HomeMeetingButton(
                onPressed: () {},
                text: "Share Screen",
                icon: Icons.arrow_upward,
              )
            ],
          ),
          const Expanded(
              child: Center(
            child: Text("Create/Join Meeting with just a click!", style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),),
          ))
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: footerColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: onPageChanged,
        currentIndex: _page,
        unselectedFontSize: 14,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.comment_bank), label: "Meet & chat"),
          BottomNavigationBarItem(
              icon: Icon(Icons.lock_clock), label: "Meeting"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: "Contacts"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "Settings"),
          BottomNavigationBarItem(
              icon: Icon(Icons.comment_bank), label: "Meet & chat")
        ],
      ),
    );
  }
}
