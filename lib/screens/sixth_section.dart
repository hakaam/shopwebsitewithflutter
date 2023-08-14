import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopwebsitewithflutter/model/footer.dart';

import '../Widgets/footer_link.dart';
class SixthSection extends StatefulWidget {
  const SixthSection({super.key});

  @override
  State<SixthSection> createState() => _SixthSectionState();
}

class _SixthSectionState extends State<SixthSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Color(0xFFBE133C).withOpacity(0.1),
      child: Row(
          children: [
            Expanded(child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: footer.map<Widget>((footer) => FooterLink(footer: footer,)).toList(),

            )),
              Container(
                margin: EdgeInsets.only(left: 50,right: 80),
                height: 200,
                width: 250,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text('Subscribe Now',style: GoogleFonts.quicksand(
                      fontSize: 18,
                      fontWeight: FontWeight.w700


                    ),),
                    SizedBox(height: 15,),
                    TextField(
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.person_outline_rounded,
                          color: Colors.black,

                        ),
                        hintText: 'Your Email',
                        hintStyle: GoogleFonts.quicksand(
                          color: Colors.black45,
                          fontWeight: FontWeight.w700



                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 20,vertical: 20


                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide: BorderSide(
                            color: Colors.black26,
                            width: 1.5
                            
                            
                          ),

                          
                          
                        ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                            borderSide: BorderSide(
                                color: Colors.black26,
                                width: 1.5


                            ),



                          )


                      ),



                    ),
                    SizedBox(height: 10,),
                    SizedBox(
                      height:50,
                      width: 250,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Color(0xFFBE133C),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100)
                            
                            
                          )
                          
                          
                        ),
                          onPressed: (){},
                          child: Text('Subscribe Now',
                            style: GoogleFonts.quicksand(

                              fontWeight: FontWeight.w600,
                              color: Colors.white

                            ),
                          )),


                    )





                  ],


                ),


              ),


          ],


      ),

      
    );
  }
}
