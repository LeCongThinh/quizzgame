

// ignore_for_file: non_constant_identifier_names

class QuestionObject {
  final String id;
  final String question;
  final List<String> answer;
  final String correct_answer;

  QuestionObject({
    required this.id,
    required this.question,
    required this.answer,
    required this.correct_answer,
  });
  // QuestionObject copyWith({
  //   String? id,
  //   String? question,
  //   List<String>? answer,
  //   String? correct_answer,
  // }) {
  //   return QuestionObject(
  //       id: id ?? this.id,
  //       question: question ?? this.question,
  //       answer: answer ?? this.answer,
  //       correct_answer: correct_answer ?? this.correct_answer);
  // }

  // Map<String, dynamic> toMap() {
  //   return {
  //     'id': id,
  //     'question': question,
  //     'answer': answer,
  //     'correct_answer': correct_answer,
  //   };
  // }

  // factory QuestionObject.fromMap(Map<String, dynamic> map) {
  //   return QuestionObject(
  //     id: map['id'],
  //     question: map['question'],
  //     answer: List<String>.from(map['answer']),
  //     correct_answer: map['correct_answer'],
  //   );
  // }
  // factory QuestionObject.fromQueryDocumentSnapshot(
  //     QueryDocumentSnapshot snapshot) {
  //   final data = snapshot.data as Map<String, dynamic>;
  //   final id = snapshot.id;
  //   data[id] = id;
  //   return QuestionObject.fromMap(data);
  // }
  // String toJson() => jsonEncode(toMap());
  // factory QuestionObject.fromJson(String, source) =>
  //     QuestionObject.fromMap(json.decode(source));

  // @override
  // String toString() {
  //   return 'QuestionObject( id: $id,question: $question,answer: $answer,correct_answer: $correct_answer)';
  // }

  // @override
  // bool operator ==(Object other) {
  //   if (identical(this, other)) return true;
  //   return other is QuestionObject &&
  //       other.id == id &&
  //       other.question == question &&
  //       listsEqual(other.answer, answer) == id &&
  //       other.correct_answer == correct_answer;
  // }

  // @override
  // int get hashCode {
  //   return id.hashCode ^
  //       question.hashCode ^
  //       answer.hashCode ^
  //       correct_answer.hashCode;
  // }
}

List<QuestionObject> qstion = [
  QuestionObject(
      id: '1',
      question: 'Việt Nam có bao nhiêu tỉnh thành',
      answer: ['63', '73', '83', '3'],
      correct_answer: '83'),
  QuestionObject(
      id: '2',
      question: 'Thế giới có bao nhiêu quốc gia',
      answer: ['128', '100', '83', '380'],
      correct_answer: '128'),
  QuestionObject(
      id: '3',
      question: 'Liên minh huyền thoại dựa trên nền tảng nào',
      answer: ['solo', 'pvp', 'person', '3 bill'],
      correct_answer: 'pvp'),
];
