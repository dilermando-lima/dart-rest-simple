import 'package:api_backend_dart/model/sentence.dart';

class SentenceRepository {
  static final List<Sentence> _sentenceList = _initList();

  static List<Sentence> _initList() {
    return [
      Sentence(1, 'text one'),
      Sentence(2, 'text two'),
      Sentence(3, 'text tree'),
      Sentence(4, 'text four'),
      Sentence(5, 'text five'),
      Sentence(6, 'text six'),
      Sentence(7, 'text seven'),
      Sentence(8, 'text eight'),
      Sentence(9, 'text nine'),
      Sentence(10, 'text ten'),
      Sentence(11, 'text eleven'),
    ];
  }

  static Sentence add(Sentence sentence) {
    // var sentence = Sentence(_sentenceList.length + 1, text);
    _sentenceList.add(sentence);
    return sentence;
  }

  static Sentence getById(int id) {
    return _sentenceList.where((element) => element.id == id).single;
  }

  static void removeById(int id) {
    _sentenceList.removeWhere((element) => element.id == id);
  }

  static List<Sentence> list({
    required int pageSize,
    required int pageNum,
    String? search,
  }) {
    var list = search == null ? List<Sentence>.from(_sentenceList) : _search(search);

    if (list.isEmpty) return list;

    if ((pageSize - 1) >= list.length) {
      pageSize = list.length;
      pageNum = 1;
    }

    var startIndex = (pageNum - 1) * pageSize;
    var endIndex = startIndex + pageSize;

    return list.getRange(startIndex, endIndex).toList();
  }

  static List<Sentence> _search(String search) {
    return _sentenceList.where((sentence) => sentence.text.toLowerCase().contains(search.toLowerCase())).toList();
  }
}
