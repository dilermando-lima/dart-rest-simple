import 'dart:async';

import 'package:api_backend_dart/model/sentence.dart';
import 'package:api_backend_dart/repository/sentence_repository.dart';

class SentenceService {
  Future<Sentence> add(Sentence sentence) async {
    // if (text == null || text.isEmpty) throw Exception("text cannot be empty");
    // await Future.delayed(const Duration(milliseconds: 2000));
    return SentenceRepository.add(sentence);
  }

  Future<void> removeById(int? id) async {
    if (id == null || id == 0) throw Exception("id cannot be null or zero");
    // await Future.delayed(const Duration(milliseconds: 2000));
    SentenceRepository.removeById(id);
  }

  Future<Sentence> getById(int? id) async {
    if (id == null || id <= 0) throw Exception("id cannot be null or less then zero");
    // await Future.delayed(const Duration(milliseconds: 2000));
    return SentenceRepository.getById(id);
  }

  Future<List<Sentence>> list({
    int pageSize = 5,
    int pageNum = 1,
    String? search,
  }) async {
    // await Future.delayed(const Duration(milliseconds: 2000));
    return SentenceRepository.list(
      pageNum: pageNum,
      pageSize: pageSize,
      search: search,
    );
  }
}
