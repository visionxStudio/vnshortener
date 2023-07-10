// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'bloc/connectivity_provider.dart';

class NoConnectivityScreen extends ConsumerStatefulWidget {
  const NoConnectivityScreen({Key? key}) : super(key: key);

  @override
  NoConnectivityScreenState createState() => NoConnectivityScreenState();
}

class NoConnectivityScreenState extends ConsumerState<NoConnectivityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/images/no_connection.png",
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.12,
            left: MediaQuery.of(context).size.width * 0.065,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 5),
                    blurRadius: 25,
                    color: const Color(0xFF59618B).withOpacity(0.17),
                  ),
                ],
              ),
              child: ElevatedButton(
                style: const ButtonStyle().copyWith(
                  backgroundColor: MaterialStateProperty.all(
                    const Color(0xFF6371AA),
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
                onPressed: () {
                  ref.read(connectivityNotifierProvider);
                  const snackBar = SnackBar(
                    content: Text('Retrying...'),
                  );

                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                child: Text(
                  "retry".toUpperCase(),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
