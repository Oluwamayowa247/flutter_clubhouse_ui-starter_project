import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_clubhouse_ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clubhouse_ui/data.dart';

class RoomScreen extends StatelessWidget {
  final Room room;
  const RoomScreen({Key? key, required this.room}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            CupertinoIcons.chevron_down,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.doc,
              color: Colors.black,
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.fromLTRB(8, 10, 20, 9),
              child: UserProfileImage(
                imageUrl: currentUser.imageUrl,
                size: 36,
              ),
            ),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${room.club} 🏠'.toUpperCase(),
                        style: Theme.of(context).textTheme.overline!.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 12.0,
                            letterSpacing: 1.0),
                      ),
                      GestureDetector(
                          onTap: () {},
                          child: Icon(CupertinoIcons.ellipsis_circle))
                    ],
                  ),
                  Text(
                    room.name,
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0),
                  )
                ],
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.all(2.0),
              sliver: SliverGrid.count(
                mainAxisSpacing: 20,
                crossAxisCount: 3,
                children: room.speakers
                    .map((e) => RoomUserProfile(
                          imageUrl: e.imageUrl,
                          name: e.givenName,
                          size: 65.0,
                          isNew: Random().nextBool(),
                          isMuted: Random().nextBool(),
                        ))
                    .toList(),
              ),
            ),
            SliverToBoxAdapter(
                child: Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Text(
                'Followed By Speakers',
                style: Theme.of(context).textTheme.subtitle2?.copyWith(
                    color: Colors.grey[400], fontWeight: FontWeight.bold),
              ),
            )),
            SliverPadding(
              padding: EdgeInsets.all(2.0),
              sliver: SliverGrid.count(
                mainAxisSpacing: 20,
                childAspectRatio: 0.7,
                crossAxisCount: 4,
                children: room.followedBySpeakers
                    .map((e) => RoomUserProfile(
                          imageUrl: e.imageUrl,
                          name: e.givenName,
                          size: 65.0,
                          isNew: Random().nextBool(),
                        ))
                    .toList(),
              ),
            ),
            SliverToBoxAdapter(
                child: Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Text(
                'Other Listeners',
                style: Theme.of(context).textTheme.subtitle2?.copyWith(
                    color: Colors.grey[400], fontWeight: FontWeight.bold),
              ),
            )),
            SliverPadding(
              padding: EdgeInsets.all(2.0),
              sliver: SliverGrid.count(
                mainAxisSpacing: 20,
                childAspectRatio: 0.7,
                crossAxisCount: 4,
                children: room.others
                    .map((e) => RoomUserProfile(
                          imageUrl: e.imageUrl,
                          name: e.givenName,
                          size: 65.0,
                          isNew: Random().nextBool(),
                        ))
                    .toList(),
              ),
            ),
            SliverPadding(padding: EdgeInsets.only(bottom: 100))
          ],
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        height: 100,
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 6,
                horizontal: 15,
              ),
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(25)),
              child: Text.rich(TextSpan(
                  children: TextSpan(
                          text: '✌️',
                          style: TextStyle(fontSize: 20, color: Colors.black))
                      .children)),
            )
          ],
        ),
      ),
    );
  }
}
