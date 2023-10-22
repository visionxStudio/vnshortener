class EyeTestModel {
  final int answer;
  final String image;
  final List<String> options;
  int? userAnswer;

  EyeTestModel({
    required this.image,
    required this.options,
    required this.answer,
    this.userAnswer,
  });
}

List<EyeTestModel> eyeTestDataList = [
  EyeTestModel(
    image: "https://top20lists.net/wp-content/uploads/2023/09/3.gif",
    options: ["3", "8", "4"],
    answer: 0,
  ),
  EyeTestModel(
    image: "https://top20lists.net/wp-content/uploads/2023/09/5.gif",
    options: ["4", "3", "5"],
    answer: 2,
  ),
  EyeTestModel(
    image: "https://top20lists.net/wp-content/uploads/2023/09/6.gif",
    options: ["9", "6", "8"],
    answer: 1,
  ),
  EyeTestModel(
    image: "https://top20lists.net/wp-content/uploads/2023/09/8.gif",
    options: ["8", "9", "2"],
    answer: 0,
  ),
  EyeTestModel(
    image: "https://top20lists.net/wp-content/uploads/2023/09/12.gif",
    options: ["8", "12", "2"],
    answer: 1,
  ),
  EyeTestModel(
    image: "https://top20lists.net/wp-content/uploads/2023/09/15.gif",
    options: ["7", "12", "15"],
    answer: 2,
  ),
  EyeTestModel(
    image: "https://top20lists.net/wp-content/uploads/2023/09/26.gif",
    options: ["26", "12", "25"],
    answer: 0,
  ),
  EyeTestModel(
    image: "https://top20lists.net/wp-content/uploads/2023/09/29.gif",
    options: ["26", "29", "39"],
    answer: 1,
  ),
  EyeTestModel(
    image: "https://top20lists.net/wp-content/uploads/2023/09/42.gif",
    options: ["42", "45", "39"],
    answer: 0,
  ),
  EyeTestModel(
    image: "https://top20lists.net/wp-content/uploads/2023/09/45.gif",
    options: ["42", "45", "39"],
    answer: 1,
  ),
  EyeTestModel(
    image: "https://top20lists.net/wp-content/uploads/2023/09/73.gif",
    options: ["72", "79", "73"],
    answer: 2,
  ),
];
