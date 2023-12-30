import 'package:facebook_responsive_ui/models/user_model.dart';
import 'package:facebook_responsive_ui/widgets/profile_avatar.dart';
import 'package:facebook_responsive_ui/widgets/responsive.dart';
import 'package:flutter/material.dart';

class Rooms extends StatelessWidget {
  final List<User> onlineUsers;

  const Rooms({
    Key? key,
    required this.onlineUsers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    return Card(
      margin: EdgeInsets.symmetric(horizontal: isDesktop ? 5.0 : 0.0),
      elevation: isDesktop ? 1.0 : 0.0,
      shape: isDesktop
          ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))
          : null,
      child: Container(
        height: 60.0,
        color: Colors.white,
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 4.0,
          ),
          scrollDirection: Axis.horizontal,
          itemCount: 1 + onlineUsers.length,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: _CreateRoomButton(),
              );
            }
            final User user = onlineUsers[index - 1];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ProfileAvatar(
                imageUrl: user.imageUrl,
                isActive: true,
              ),
            );
          },
        ),
      ),
    );
  }
}

class _CreateRoomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => print('Create Room'),
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        side: BorderSide(
          width: 3.0,
          color: Colors.blueAccent[100] ?? Colors.transparent,
        ),
        primary: Colors.purple, // لون الأيقونة
        backgroundColor: Colors.white,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.video_call,
            size: 35.0,
            color: Colors.purple,
          ),
          SizedBox(width: 4.0),
          Text('Create\nRoom'),
        ],
      ),
    );
  }
}
