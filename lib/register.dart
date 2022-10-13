import 'package:flutter/material.dart';
import 'package:waterreminder/app.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

String? name="";


class _RegisterState extends State<Register> {
  @override

  Widget build(BuildContext context) {
    display() {
        return Text('Welcome $name!',style: const TextStyle(
            color: Colors.black,fontSize: 30
        ),);
    }
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/register.png'), fit: BoxFit.cover),
        ),
      child: Scaffold(
    backgroundColor: Colors.transparent,
        appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
          ),
        body: Stack(
            children: [
        Container(
          padding: EdgeInsets.only(left: 35, top: 30),
          child: display()
        ),
              Container(
                padding: EdgeInsets.only(left: 85, top: 200),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade300,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 8),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))
                    ),
                  onPressed: (){},
                  child: Text("Diet Reminder",style: TextStyle(
                    color: Colors.black,
                    fontSize: 20),
                  ),

                )
              ),
              Container(
                padding: EdgeInsets.only(left: 80, top: 280),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade300,
                        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 7),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))
                    ),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => App()));
                    },
                    child: Text("Water Reminder",style: TextStyle(
                        color: Colors.black,
                        fontSize: 20),
                    ),

                  )
              )
            ]
        ),
      ),
    );
  }
}
