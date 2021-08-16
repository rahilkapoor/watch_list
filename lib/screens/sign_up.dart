import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:watch_list/models/google_signin.dart';
import 'package:watch_list/screens/movie_list.dart';


class SignUp extends StatelessWidget {
  const SignUp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting)
                return Center(child: CircularProgressIndicator());
            else if(snapshot.hasError){
                return Center(child: Text("Something Went Wrong!"));
            }
            else if(snapshot.hasData){
                return MovieList();
            }
            else{
                return Center(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.purple,
                            onPrimary: Colors.white,
                            minimumSize: Size(200,50),
                        ),
                        child: Text("Sign In with Google"),
                        onPressed: (){
                            final provider = Provider.of<GoogleSignInProvider>(context, listen:false);
                            provider.googleLogin();
                        },
                    )
                );
            }
        },
    );
  }
}