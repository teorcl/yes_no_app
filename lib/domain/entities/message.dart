enum FromWho { me, your }

class Message {
  final String message;
  final String? urlimage;
  final FromWho sender;

  Message({
    required this.message, 
    this.urlimage, 
    required this.sender,
  });
}
