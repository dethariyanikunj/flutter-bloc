part of 'internet_bloc.dart';

abstract class InternetState {}

class InternetLoadingState extends InternetState {}

class InternetGainedState extends InternetState {}

class InternetLostState extends InternetState {}
