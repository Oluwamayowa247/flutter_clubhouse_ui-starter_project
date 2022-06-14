import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clubhouse_ui/data.dart';
// import 'package:flutter_clubhouse_ui/widgets/user_profile_image.dart';
import 'package:flutter_clubhouse_ui/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.search,
              color: Colors.black,
              size: 20.0,
            )),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                CupertinoIcons.envelope_open,
                color: Colors.black,
                size: 20.0,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                CupertinoIcons.calendar,
                color: Colors.black,
                size: 20.0,
              )),
          IconButton(
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.bell,
              color: Colors.black,
              size: 20.0,
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 10.0, 20.0, 10.0),
              child:
                  UserProfileImage(imageUrl: currentUser.imageUrl, size: 36.0),
            ),
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          ListView(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 120),
            children: [
              UpcomingRooms(upcomingRooms: upcomingRoomsList),
              SizedBox(
                height: 13,
              ),
              ...roomsList.map((e) => RoomCard(room: e)),
            ],
          ),
          Positioned(
            right: 0,
            left: 0,
            bottom: 0,
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.topCenter,
                      colors: [
                    Palette.background.withOpacity(0.0),
                    Palette.background.withOpacity(1.0)
                  ])),
            ),
          ),
          Positioned(
            bottom: 60,
            child: Container(
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Text.rich(TextSpan(children: [
                WidgetSpan(
                  child: Icon(
                    CupertinoIcons.add,
                    size: 21.0,
                    color: Colors.white,
                  ),
                ),
                TextSpan(
                    text: ' Start a room',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500)),
              ])),
            ),
          ),
          Positioned(
              bottom: 55,
              right: 70.0,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  IconButton(
                    icon: const Icon(
                      CupertinoIcons.circle_grid_3x3,
                      size: 25,
                    ),
                    onPressed: () {},
                  ),
                  Positioned(
                      bottom: 14.5,
                      left: 4.6,
                      right: -13.5,
                      child: Container(
                        height: 12,
                        width: 12,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green.shade700),
                      ))
                ],
              ))
        ],
      ),
    );
  }
}
