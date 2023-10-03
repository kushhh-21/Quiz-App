class QuizQuestion {
  QuizQuestion(this.question, this.answer);

  final String question;
  final List<String> answer;

  List<String> getShuffledList() {
    final shuffledList = List.of(answer);
    shuffledList.shuffle();
    return shuffledList;
  }
}
