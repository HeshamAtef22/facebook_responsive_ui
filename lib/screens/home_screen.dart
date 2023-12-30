import 'package:facebook_responsive_ui/config/palette.dart';
import 'package:facebook_responsive_ui/data/data.dart';
import 'package:facebook_responsive_ui/models/post_model.dart';
import 'package:facebook_responsive_ui/widgets/circle_button.dart';
import 'package:facebook_responsive_ui/widgets/contacts_list.dart';
import 'package:facebook_responsive_ui/widgets/create_post_container.dart';
import 'package:facebook_responsive_ui/widgets/more_options_list.dart';
import 'package:facebook_responsive_ui/widgets/post_container.dart';
import 'package:facebook_responsive_ui/widgets/responsive.dart';
import 'package:facebook_responsive_ui/widgets/rooms.dart';
import 'package:facebook_responsive_ui/widgets/stories.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TrackingScrollController _trackingScrollController =
      TrackingScrollController();

  @override
  void dispose() {
    _trackingScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile:
              _HomeScreenMobile(scrollController: _trackingScrollController),
         tablet: _HomeScreenTablet(scrollController : _trackingScrollController),
          desktop:
              _HomeScreenDesktop(scrollController: _trackingScrollController),
        ),
      ),
    );
  }
}

class _HomeScreenMobile extends StatelessWidget {
  final TrackingScrollController? scrollController;

  const _HomeScreenMobile({
    Key? key,
    @required this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverAppBar(
          //brightness: Brightness.light,
          backgroundColor: Colors.white,
          title: const Text(
            'facebook',
            style: TextStyle(
              color: Palette.facebookBlue,
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              letterSpacing: -1.2,
            ),
          ),
          centerTitle: false,
          floating: true,
          actions: [
            CircleButton(
              icon: Icons.search,
              iconSize: 30.0,
              onPressed: () => print('Search'),
            ),
            CircleButton(
              icon: MdiIcons.facebookMessenger,
              iconSize: 30.0,
              onPressed: () => print('Messenger'),
            ),
          ],
        ),
        SliverToBoxAdapter(
          child: CreatePostContainer(currentUser: currentUser),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
          sliver: SliverToBoxAdapter(
            child: Rooms(onlineUsers: onlineUsers),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
          sliver: SliverToBoxAdapter(
            child: Stories(
              currentUser: currentUser,
              stories: stories,
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final Post post = posts[index];
              return PostContainer(post: post);
            },
            childCount: posts.length,
          ),
        ),
      ],
    );
  }
}


class _HomeScreenTablet extends StatelessWidget {
  final TrackingScrollController? scrollController;

  const _HomeScreenTablet({
    Key? key,
    @required this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 1,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: MoreOptionsList(currentUser: currentUser),
            ),
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Container(
            width: 600.0,
            child: CustomScrollView(
              controller: scrollController,
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                  sliver: SliverToBoxAdapter(
                    child: Stories(
                      currentUser: currentUser,
                      stories: stories,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: CreatePostContainer(currentUser: currentUser),
                ),
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
                  sliver: SliverToBoxAdapter(
                    child: Rooms(onlineUsers: onlineUsers),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final Post post = posts[index];
                      return PostContainer(post: post);
                    },
                    childCount: posts.length,
                  ),
                ),
              ],
            ),
          ),
        ),
        //Spacer(),
      ],
    );
  }
}


class _HomeScreenDesktop extends StatelessWidget {
  final TrackingScrollController? scrollController;

  const _HomeScreenDesktop({
    Key? key,
    @required this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 2,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: MoreOptionsList(currentUser: currentUser),
            ),
          ),
        ),
        const Spacer(),
        Container(
          width: 600.0,
          child: CustomScrollView(
            controller: scrollController,
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                sliver: SliverToBoxAdapter(
                  child: Stories(
                    currentUser: currentUser,
                    stories: stories,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: CreatePostContainer(currentUser: currentUser),
              ),
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
                sliver: SliverToBoxAdapter(
                  child: Rooms(onlineUsers: onlineUsers),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final Post post = posts[index];
                    return PostContainer(post: post);
                  },
                  childCount: posts.length,
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        Flexible(
          flex: 2,
          child: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: ContactsList(users: onlineUsers),
            ),
          ),
        ),
      ],
    );
  }
}
