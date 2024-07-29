import 'package:flutter/material.dart';

class NewMessagesInput extends StatefulWidget {
  const NewMessagesInput({super.key});

  @override
  State<NewMessagesInput> createState() => _NewMessagesInputState();
}

class _NewMessagesInputState extends State<NewMessagesInput> {
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 1, bottom: 35),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _messageController,
              textCapitalization: TextCapitalization.sentences,
              autocorrect: true,
              enableSuggestions: true,
              decoration:
                  const InputDecoration(label: Text('Send a message...')),
            ),
          ),
          IconButton(
              color: Theme.of(context).colorScheme.primary,
              onPressed: () {},
              icon: const Icon(Icons.send))
        ],
      ),
    );
  }
}
