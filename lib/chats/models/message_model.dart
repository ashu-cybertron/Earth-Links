import 'user_model.dart';

class Message {
  final User sender;
  final String
      time; //would usually be type dataTime or Firbase TimeStamp in producntion apps
  final String text;
  final bool isLiked;
  final bool unread;
  final String imageUrl;

  Message({
    this.sender,
    this.isLiked,
    this.text,
    this.time,
    this.unread,
    this.imageUrl,
  });
}

// YOU  - current user

final User currentUser =
    User(id: 0, name: 'Current User', imagUrl: 'assets/User_photos/me.png');

// USERS
final User einstein =
    User(id: 1, name: 'Einstein', imagUrl: 'assets/einstein.jpg');
final User issac = User(id: 2, name: 'Issac', imagUrl: 'assets/issac.jpg');

final User stephen =
    User(id: 3, name: 'Stephen', imagUrl: 'assets/stephen.jpg');
final User isro = User(id: 4, name: 'Isro', imagUrl: 'assets/isro.jpg');
final User indianComunity =
    User(id: 5, name: 'Indian Space Soceity', imagUrl: 'assets/iss.jpg');
final User thePlanetarySociety =
    User(id: 7, name: 'The Planetary Society ', imagUrl: 'assets/earth1.png');

// Favaprite Contact
//List<User> favorites = [dad, mom, advait, chahal, joker];

// Example CHATS ON HOME SCREEN
List<Message> chats = [
  Message(
    sender: thePlanetarySociety,
    time: '2:30 PM',
    text: 'This World Ending in 7 years',
    isLiked: false,
    unread: true,
    imageUrl: 'assets/stephen.jpg',
  ),
  Message(
    sender: issac,
    time: '5:30 PM',
    text: 'hey , hows it going are u taking your meds?',
    isLiked: false,
    unread: true,
    imageUrl: 'assets/stephen.jpg',
  ),
  Message(
    sender: einstein,
    time: '6:30 PM',
    text: 'Just working on a theory',
    isLiked: false,
    unread: false,
    imageUrl: 'assets/stephen.jpg',
  ),
  Message(
    sender: isro,
    time: '3:30 PM',
    text: 'child , You want an internship',
    isLiked: false,
    unread: true,
    imageUrl: 'assets/stephen.jpg',
  ),
  Message(
    sender: indianComunity,
    time: '7:30 PM',
    text: 'Today we will be able to see Mars in the evening',
    isLiked: false,
    unread: true,
    imageUrl: 'assets/stephen.jpg',
  ),
  Message(
    sender: stephen,
    time: '2:30 PM',
    text: 'No one told me there will be stairs to heaven',
    isLiked: false,
    unread: false,
    imageUrl: 'assets/stephen.jpg',
  ),
];
