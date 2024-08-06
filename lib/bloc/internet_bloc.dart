 

import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 import 'package:own_bloc_execution/bloc/internet_event.dart';
import 'package:own_bloc_execution/bloc/internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  Connectivity _connectivity = Connectivity();
  StreamSubscription? connectivitySubscription;
  InternetBloc() : super(InternetInitialState()) {
  on<InternetLostEvent>((event, emit) => emit(InternetLostState()),);
  on<InternetGainedEvent>((event, emit) => emit(InternetGainedState()),);

 connectivitySubscription = _connectivity.onConnectivityChanged.listen((reslult) {
  if(reslult == ConnectivityResult.mobile || reslult == ConnectivityResult.wifi){
    add(InternetGainedEvent());
  }
  else{
    add(InternetLostEvent());
  }
 });
 
 
  }
  @override
  Future<void> close() {
    connectivitySubscription?.cancel();
    return super.close();
  }
 }

 