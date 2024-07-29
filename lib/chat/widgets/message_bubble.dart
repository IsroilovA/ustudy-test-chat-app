import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  // Create a message bubble which is meant to be the first in the sequence.
  const MessageBubble.first({
    super.key,
    required this.message,
    required this.isMe,
    required this.timestamp,
    required this.useremail,
  }) : isFirstInSequence = true;

  // Create a amessage bubble that continues the sequence.
  const MessageBubble.next({
    super.key,
    required this.message,
    required this.isMe,
    required this.timestamp,
  })  : isFirstInSequence = false,
        useremail = null;

  final bool isFirstInSequence;
  final String message;
  final String? useremail;
  final DateTime timestamp;

  // Controls how the MessageBubble will be aligned.
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Row(
      // The side of the chat screen the message should show at.
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment:
              isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            if (isFirstInSequence) Text(useremail!),
            const SizedBox(height: 2),
            Container(
              decoration: BoxDecoration(
                color: isMe
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context)
                        .colorScheme
                        .surfaceContainerHighest
                        .withAlpha(200),
                borderRadius: BorderRadius.only(
                  topLeft: !isMe && isFirstInSequence
                      ? Radius.zero
                      : const Radius.circular(12),
                  topRight: isMe && isFirstInSequence
                      ? Radius.zero
                      : const Radius.circular(12),
                  bottomLeft: const Radius.circular(12),
                  bottomRight: const Radius.circular(12),
                ),
              ),
              constraints: const BoxConstraints(maxWidth: 200),
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 14,
              ),
              child: IntrinsicWidth(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      message,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: isMe
                                ? Theme.of(context).colorScheme.onPrimary
                                : Theme.of(context).colorScheme.onSurface,
                          ),
                      softWrap: true,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '${timestamp.hour} : ${timestamp.minute}',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                color: isMe
                                    ? Theme.of(context).colorScheme.onPrimary
                                    : Theme.of(context).colorScheme.onSurface,
                              ),
                          softWrap: true,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
