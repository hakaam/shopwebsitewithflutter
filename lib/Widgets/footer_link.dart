import 'package:flutter/material.dart';
import 'package:shopwebsitewithflutter/model/footer.dart';
import 'package:google_fonts/google_fonts.dart';
class FooterLink extends StatelessWidget {
  final Footer footer;
  const FooterLink({super.key, required this.footer});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Text(footer.title,style: GoogleFonts.quicksand(

             fontSize: 20,
             fontWeight: FontWeight.w700
           ),),
           SizedBox(height: 20,),
           Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: footer.parameteres.map<Widget>((params) => Padding(padding: EdgeInsets.symmetric(vertical: 2.0),
               child: Text(params,style: GoogleFonts.quicksand(
                 fontSize: 16,
                 fontWeight: FontWeight.w700,
                 color: Colors.black45

               ),),

             )).toList(),




           )




         ],



    );
  }
}
