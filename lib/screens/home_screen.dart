import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:own_bloc_execution/bloc/internet_bloc.dart';
import 'package:own_bloc_execution/bloc/internet_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<InternetBloc, InternetState>(
          builder: (context, state) {
            if(state is InternetLostState){
              return Text("Internet not connected");
            }
            else if(state is InternetGainedState){ 
              return Text(" Internet Connected");
            }
            else{
              return Text("Loading");
            }
          },
        ),
      ),
    );
  }
}
