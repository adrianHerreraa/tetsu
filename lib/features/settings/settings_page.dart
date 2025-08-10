import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('email: ${user?.email}', textAlign: TextAlign.center),
          Text(
            'displayName: ${user?.displayName}',
            textAlign: TextAlign.center,
          ),
          Text(
            'emailVerified: ${user?.emailVerified}',
            textAlign: TextAlign.center,
          ),
          Text(
            'isAnonymous: ${user?.isAnonymous}',
            textAlign: TextAlign.center,
          ),
          Text(
            'uid: ${user?.uid}',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
