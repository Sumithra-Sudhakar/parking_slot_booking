import 'package:flutter/material.dart';
import 'package:parking_slot_booking/search_page.dart';
import 'package:parking_slot_booking/sign_up.dart';
import 'package:provider/provider.dart';
import 'auth_service.dart';
import 'login.dart';
import 'user_model.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return StreamBuilder<User?>(
        stream: authService.user,
        builder: (_, AsyncSnapshot<User?> snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final User? user = snapshot.data;
            return user == null ? Login() : Search();
          } else {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
