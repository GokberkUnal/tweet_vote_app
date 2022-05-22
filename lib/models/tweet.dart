import 'package:tweet_vote_app/utility/dbHelper.dart';

class Tweet {
  int? id;
  String? tweet;

  int? like;
  int? dislike;
  int? neutral;
  int? isVoted;

  Tweet(
      this.id, this.tweet, this.like, this.dislike, this.neutral, this.isVoted);

  factory Tweet.fromMap(Map<String, dynamic> map) {
    return Tweet(map['id'], map['tweet'], map['like'], map['dislike'],
        map['neutral'], map['isvoted']);
  }

  Map<String, dynamic> toMap() {
    return {
      DataBaseHelper.columnId: id,
      DataBaseHelper.columnTweet: tweet,
      DataBaseHelper.columnLike: like,
      DataBaseHelper.columnDislike: dislike,
      DataBaseHelper.columnNeutral: neutral,
      DataBaseHelper.columnIsVoted: isVoted,
    };
  }
}
