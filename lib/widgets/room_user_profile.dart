import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_clubhouse_ui/widgets/user_profile_image.dart';
import 'package:flutter_clubhouse_ui/widgets/widgets.dart';

class RoomUserProfile extends StatefulWidget {
  final String imageUrl;
  final String name;
  final double size;
  final bool isNew;
  final bool isMuted;
  const RoomUserProfile({
    Key? key,
    required this.imageUrl,
    required this.name,
    this.size = 48,
    this.isNew = false,
    this.isMuted = false,
  }) : super(key: key);

  @override
  State<RoomUserProfile> createState() => _RoomUserProfileState();
}

class _RoomUserProfileState extends State<RoomUserProfile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              padding: EdgeInsets.all(10.0),
              child: UserProfileImage(
                  imageUrl: widget.imageUrl, size: widget.size),
            ),
            if (widget.isNew)
              {
                Positioned(
                    left: 0,
                    bottom: 0,
                    child: Container(
                      padding: EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black26,
                                offset: Offset(0, 2),
                                blurRadius: 6.0)
                          ]),
                      alignment: Alignment.center,
                      child: Text(
                        '🎉',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ))
              }.single,
            if (widget.isMuted)
              {
                Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                        padding: EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0, 2),
                                  blurRadius: 6.0)
                            ]),
                        alignment: Alignment.center,
                        child: Icon(CupertinoIcons.mic_slash_fill)))
              }.single
          ],
        ),
        SizedBox(
          height: 4,
        ),
        Flexible(
            child: Text(
          widget.name,
          overflow: TextOverflow.ellipsis,
        ))
      ],
    );
  }
}
