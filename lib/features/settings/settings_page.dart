import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    /*return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.orange,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                color: Colors.purple,
                height: 600,
                width: 300,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20,),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 200,
                        height: 200,
                        color: Colors.brown,
                        child: Center(
                          child: CachedNetworkImage
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.teal,
                width: 100,
                height: 600,
              ),
            ],
          ),
        ),
      ),
    );*/

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('email: ${user?.email}', textAlign: TextAlign.center,),
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
