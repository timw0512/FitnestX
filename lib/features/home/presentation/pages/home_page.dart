import 'package:fitness/core/services/shared_preferences_service.dart';
import 'package:fitness/features/on_board/presentation/pages/on_boarding.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '/core/localization/app_localization.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  late final SharedPreferencesService sharedPreferencesService;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate('welcome')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.person, size: 100, color: Colors.blue),
            SizedBox(height: 20),
            Text(
              'Home Page',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
                onPressed: () {
                  if (kDebugMode) {
                    print("Hello world");
                  }},
                child:
                Text("On boarding", style: GoogleFonts.poppins(),
                )
            ),
            SizedBox(height: 10),
            Text('This is where user profile information will be displayed.'),
          ],
        ),
      ),
    );
  }
}