import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutUser extends StatelessWidget {
  const AboutUser({
    super.key,
    required this.name,
    required this.email,
    required this.comeFrom,
  });

  final String name;
  final String email;
  final String comeFrom;

  @override
  Widget build(BuildContext context) {
    Icon from = Icon(Icons.man_2);
    if (comeFrom == 'Facebook') {
      from = const Icon(Icons.facebook ,color: Colors.blue,);
    }
    else if(comeFrom == 'Google'){
      from = const Icon(Icons.g_mobiledata , color: Colors.red,);
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 138, 136, 130),
                  radius: 30,
                  child: Icon(
                    Icons.person,
                    size: 40,
                    color: Colors.deepPurple,
                  ),
                ),
                Text(
                  name,
                  style: GoogleFonts.poppins(fontSize: 19),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  comeFrom,
                  style: GoogleFonts.poppins(fontSize: 12),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                   from,
                  //  const SizedBox(
                  //   height: 5,
                  // ),
            
                ],
              ),
            ),
            Text(
              email,
              style: GoogleFonts.poppins(fontSize: 15),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
