import 'package:facebook_responsive_ui/models/user_model.dart';
import 'package:meta/meta.dart';

class Story {
  final User? user;
  final String? imageUrl;
  final bool isViewed;

  const Story({
    @required this.user,
    @required this.imageUrl,
    this.isViewed = false,
  });
}
