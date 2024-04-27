import 'package:flutter/material.dart';
import 'package:myauiz/model.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List of objects

  List<Model> _questions = [
    Model(
      answer: "Karachi",
      option: ['Islamabad', 'Sahiwal', 'Karachi', 'Multan'],
      question: "What is the capital of Pakistan",
    ),
    Model(
      answer: "Urdu",
      option: ['Urdu', 'English', 'pashtoo', 'Arabic'],
      question: "What is the national language of Pakistan?",
    ),
    Model(
      answer: "Pkr",
      option: ['Dirham', 'Pkr', 'Dollar', 'Euro'],
      question: "What is the currency used in Pakistan?",
    ),
    Model(
      answer: "11000km",
      option: ['23000km', '11000km', '1000km', '2032km'],
      question:
          "What is the name of the mountain range that is located in the north of Pakistan?",
    ),
    Model(
      answer: "Imran Khan",
      option: [
        'Nawaz Sharif',
        'Asif Ali Zardari',
        'Imran Khan',
        'Muhammad Ali Jinnah',
      ],
      question: "Who is the current Prime Minister of Pakistan?",
    ),
    Model(
      answer: "Narendra Modi",
      option: [
        'Nawaz Sharif',
        'Narendra Modi',
        'Imran Khan',
        'Muhammad Ali Jinnah',
      ],
      question: "Who is the current Prime Minister of India?",
    ),
  ];
  final Map<int, int> _selectedOptions = {};
  int _score = 0;

  void _showScoreDialog() {
    Get.defaultDialog(
      barrierDismissible: true,
      title: "Quiz Result",
      backgroundColor: Colors.white,
      content: Text("Your score: $_score"),
      actions: [
        TextButton(
          onPressed: () {
            setState(() {
              _selectedOptions.clear();
              _score = 0;
            });
            Get.back();
          },
          child: Text("Restart Quiz"),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5),
      appBar: AppBar(
        title: Text("Quiz App "),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            ...List.generate(
              _questions.length,
              (index) {
                print(_questions[index].question);
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 10),
                            Center(
                              child: Text(
                                textAlign: TextAlign.center,
                                "${_questions[index].question}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                ...List.generate(
                                  _questions[index].option.length,
                                  (e) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      onTap: _selectedOptions[index] == null
                                          ? () {
                                              setState(
                                                () {
                                                  _selectedOptions[index] = e;
                                                },
                                              );
                                              if (_questions[index].option[e] ==
                                                  _questions[index].answer) {
                                                print(
                                                    "Correct Answer!:${_score++}");
                                              } else {
                                                print("Incorrect Answer!");
                                              }
                                              if (_selectedOptions.length ==
                                                  _questions.length) {
                                                _showScoreDialog();
                                              }
                                            }
                                          : null,
                                      child: Container(
                                        height: 50,
                                        width: double.infinity,
                                        color: _selectedOptions[index] == e
                                            ? Colors.red
                                            : Colors.amber,
                                        child: Center(
                                          child: Text(
                                            "${_questions[index].option[e]}",
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ).toList(),
          ],
        ),
      ),
    );
  }
}
