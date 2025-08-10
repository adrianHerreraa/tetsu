import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AsideSectionsModel {
  final int index;
  final String name;

  AsideSectionsModel({required this.index, required this.name});
}

final asideSectionsProvider =
    ChangeNotifierProvider.autoDispose<_AsideSectionsState>(
      (_) => _AsideSectionsState(),
    );

class _AsideSectionsState with ChangeNotifier {
  final List<AsideSectionsModel> sectionsList = [
    AsideSectionsModel(index: 0, name: 'Dashboard'),
    AsideSectionsModel(index: 1, name: 'Settings'),
  ];

  AsideSectionsModel _sectionSelected = AsideSectionsModel(
    index: 0,
    name: 'Dashboard',
  );

  AsideSectionsModel get getSectionSelected => _sectionSelected;

  bool imAlreadySelected({required int index}) =>
      index == _sectionSelected.index;

  void updateSectionsFilters({required int index}) {
    _sectionSelected = sectionsList.firstWhere((e) => e.index == index);
    notifyListeners();
  }
}
