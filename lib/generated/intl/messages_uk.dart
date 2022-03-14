
import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'uk';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "are_you_sure": MessageLookupByLibrary.simpleMessage("Are you sure?"),
    "back_to_game":
    MessageLookupByLibrary.simpleMessage("back to the game"),
    "completed": MessageLookupByLibrary.simpleMessage(
        "You have completed the puzzle"),
    "dou_you_really": MessageLookupByLibrary.simpleMessage(
        "Do you really want to restart the current puzzle"),
    "great_job": MessageLookupByLibrary.simpleMessage("GREAT JOB!"),
    "movements": MessageLookupByLibrary.simpleMessage("moves"),
    "no": MessageLookupByLibrary.simpleMessage("NO"),
    "ok": MessageLookupByLibrary.simpleMessage("OK"),
    "privacy": MessageLookupByLibrary.simpleMessage(
        "This is a free non-profit game, the game does not collect information of any kind from users or their traffic, it does not need internet."),
    "restart": MessageLookupByLibrary.simpleMessage("Restart"),
    "start": MessageLookupByLibrary.simpleMessage("START"),
    "time": MessageLookupByLibrary.simpleMessage("Time"),
    "yes": MessageLookupByLibrary.simpleMessage("YES")
  };
}
