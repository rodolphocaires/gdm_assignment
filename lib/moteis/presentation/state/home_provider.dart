import 'package:flutter/material.dart';
import 'package:gdm_assignment/moteis/domain/entity/motel.dart';
import 'package:gdm_assignment/moteis/domain/entity/suite.dart';
import 'package:gdm_assignment/moteis/domain/use_case/get_moteis_use_case.dart';

class HomeProvider with ChangeNotifier {
  final GetMoteisUseCase getMoteisUseCase;

  HomeProvider(this.getMoteisUseCase);

  List<Motel> motelList = [];
  List<Suite> filteredSuites = [];
  bool isFavorite = false;

  Future<void> getMotelList() async {
    motelList = await getMoteisUseCase();
    filteredSuites = motelList.first.suites;
    notifyListeners();
  }

  void toggleFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
