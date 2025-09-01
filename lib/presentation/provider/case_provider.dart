import 'package:flutter/cupertino.dart';
import 'package:flutter_application_4/data/models/case_model.dart';
import 'package:flutter_application_4/data/repository/case_repository.dart';

class CaseProvider extends ChangeNotifier {
  final CaseRepository caseRepository;
  List<Case> cases = [];

  CaseProvider(this.caseRepository);

  Future<void> loadCase() async {
    try{
      final result = await caseRepository.fetchData();
      cases = result;
      notifyListeners();
    }catch(e){
      throw Exception("Error: $e");
    }
    
  }
}