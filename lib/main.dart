import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:tictac/cell.dart';
import 'package:tictac/provider.dart';
import 'package:tictac/theme.dart';
import 'provider.dart';
import 'home_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => MyProvider(),
    child: const Myapp(),
  ));
}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: Provider.of<MyProvider>(context).iconBol
            ? AppTheme.dark
            : AppTheme.light,
        home: const IntroPage());
  }
}

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(
                child: Text("Tic Tac Toe",
                    style: GoogleFonts.tomorrow(
                        fontSize: 40, fontWeight: FontWeight.bold)),
              ),
            ),
            Expanded(
              flex: 3,
              child: Center(
                child: Container(
                  child: AvatarGlow(
                    endRadius: 300,
                    duration: Duration(seconds: 3),
                    glowColor: Colors.black,
                    repeat: true,
                    repeatPauseDuration: Duration(seconds: 1),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(style: BorderStyle.none),
                          shape: BoxShape.circle),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Myscreen()));
                        },
                        child: CircleAvatar(
                          maxRadius: 100,
                          backgroundColor: Colors.white,
                          child: Container(
                            child: Lottie.asset('animations/tictac.json',
                                repeat: true, fit: BoxFit.fill),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
                child: Center(
                    child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Myscreen()));
                ;
              },
              child: Text("Tap To Play",
                  style: GoogleFonts.tomorrow(
                      fontSize: 20, fontWeight: FontWeight.bold)),
            )))
          ],
        ),
      ),
    );
  }
}
