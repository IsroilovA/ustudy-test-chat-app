import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

  void sendMessage(String enteredText) {
    final user = FirebaseAuth.instance.currentUser!;

    FirebaseFirestore.instance.collection('chat').add(
      {
        'text': enteredText,
        'createdAt': Timestamp.now(),
        'userId': user.uid,
        'userEmail': user.email!,
      },
    );
  }
}
