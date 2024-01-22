import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar(
    this.url, {
    super.key,
  });

  final String url;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: CircleAvatar(
        backgroundImage: NetworkImage(
          url,
        ),
      ),
    );
  }
}
