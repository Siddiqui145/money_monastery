import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:money_monastery/src/features/home/domain/entities/entities.dart';
import 'package:money_monastery/src/features/home/presentation/widgets/custom_button.dart';
import 'package:money_monastery/src/features/home/presentation/widgets/custom_search_text_field.dart';
import 'package:money_monastery/src/features/home/presentation/widgets/custom_textfield.dart';

@RoutePage()
class QndaScreen extends StatefulWidget {
  const QndaScreen({super.key});

  @override
  State<QndaScreen> createState() => _QndaScreenState();
}

class _QndaScreenState extends State<QndaScreen> {
  final TextEditingController questionController = TextEditingController();
  final TextEditingController searchController = TextEditingController();
  List<QuestionsAnswers> questionList = [];
  List<QuestionsAnswers> filteredList = [];

  @override
  void initState() {
    super.initState();
    fetchQuestionsFromDb();

    searchController.addListener(() {
      filteredQuestions(searchController.text);
    });
  }

  Future<void> fetchQuestionsFromDb() async {
    try {
      final querySnapshot = await FirebaseFirestore.instance.collection('questions').get();
      final data = querySnapshot.docs
          .map((doc) => QuestionsAnswers(
                question: doc['question'],
                answers: List<String>.from(doc['answers'] ?? []),
                comments: [],
                //id: doc.id,
              ))
          .toList();

      setState(() {
        questionList = data;
        filteredList = List.from(questionList);
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Failed to fetch data: $e")));
    }
  }

  Future<void> addQuestionsToDb() async {
    if (questionController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Question can't be Empty!!"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    try {
      await FirebaseFirestore.instance.collection("questions").add({
        "question": questionController.text.trim(),
        "answers": [],
      });

      questionController.clear();
      searchController.clear();
      fetchQuestionsFromDb();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Question added successfully!"),
          backgroundColor: Colors.green,
        ),
      );
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message.toString())));
    }
  }

  void filteredQuestions(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredList = List.from(questionList);
      } else {
        filteredList = questionList.where((q) => q.question.toLowerCase().contains(query.toLowerCase())).toList();
      }
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 35),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: CustomSearchTextField(controller: searchController),
              ),

              // Show "No Results" and Ask for new Question
              if (filteredList.isEmpty)
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      const SizedBox(height: 25),
                      Center(
                        child: Text(
                          "No Results found!!",
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.red),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Center(
                        child: Text(
                          "Do you want to Post this Question for getting suggestions and solutions from people??",
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.green),
                        ),
                      ),
                      const SizedBox(height: 25),
                      CustomTextfield(
                        title: "Type your question here",
                        controller: questionController,
                      ),
                      const SizedBox(height: 25),
                      CustomButton(
                        title: 'Submit',
                        backgroundColor: Colors.green,
                        width: 125,
                        textColor: Colors.white,
                        onPressed: () async {
                          await addQuestionsToDb();
                        },
                      ),
                    ],
                  ),
                )

              // Display questions and answers dynamically from Firestore
              else
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: filteredList.length,
                  itemBuilder: (context, index) {
                    final question = filteredList[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            question.question,
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),

                          // Show answers with "Answer 1 -" formatting
                          ...List.generate(
                            question.answers.length,
                            (i) => Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      style: const TextStyle(color: Colors.black87, fontSize: 14),
                                      children: [
                                        TextSpan(
                                          text: "Answer ${i + 1} - ",
                                          style: const TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                        TextSpan(text: question.answers[i]),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 10),

                                  // Like/Dislike buttons
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: () {},
                                        child: const Icon(Icons.thumb_up, size: 20, color: Colors.green),
                                      ),
                                      const SizedBox(width: 10),
                                      InkWell(
                                        onTap: () {},
                                        child: const Icon(Icons.thumb_down, size: 20, color: Colors.red),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                        ],
                      ),
                    );
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
