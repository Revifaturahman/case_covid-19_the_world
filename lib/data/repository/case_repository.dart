import 'package:flutter_application_4/data/models/case_model.dart';
import 'package:flutter_application_4/data/service/api_service.dart';

class CaseRepository {
  final ApiService apiService;

  CaseRepository(this.apiService);

  Future<List<Case>> fetchData() async {
    final result = await apiService.getAll();
    return result.map((json) => Case.fromJson(json)).toList();
  }
}