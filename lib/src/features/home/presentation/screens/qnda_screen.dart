import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:money_monastery/src/features/home/data/network/router/app_router.gr.dart';
import 'package:money_monastery/src/features/home/domain/entities/entities.dart';
import 'package:money_monastery/src/features/home/presentation/widgets/comments_text_field.dart';
import 'package:money_monastery/src/features/home/presentation/widgets/custom_button.dart';
import 'package:money_monastery/src/features/home/presentation/widgets/custom_search_text_field.dart';

@RoutePage()
class QndaScreen extends StatefulWidget {
  const QndaScreen({super.key});

  @override
  State<QndaScreen> createState() => _QndaScreenState();
}

class _QndaScreenState extends State<QndaScreen> {
  bool isActive = true;
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 80),
      
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      title: 'Search a Question',
                      backgroundColor: isActive ? Colors.white70 : Colors.white24,
                      onPressed: () {
                        setState(() {
                          isActive = true;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: CustomButton(
                      title: 'Post a Question',
                      backgroundColor: isActive ? Colors.white24 : Colors.white70,
                      onPressed: () {
                        context.router.push(const PostQuestionRoute());
                        setState(() {
                          isActive = false;
                        });
                      },
                    ),
                  ),
                ],
              ),
      
              const SizedBox(height: 35),
      
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: CustomSearchTextField(controller: searchController),
              ),
      
              const SizedBox(height: 20),
      
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: questionList.length,
                itemBuilder: (context, index) {
                  final question = questionList[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
      
                        Text(
                          question.question,
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
      
                        ...List.generate(
                          question.answers.length,
                          (i) => Padding(
                            padding: const EdgeInsets.only(
                              top: 15
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
      
                                RichText(
                                  text: TextSpan(
                                    style: TextStyle(color: Colors.black87, fontSize: 14),
                                    children: [
                                      TextSpan(
                                        text: "Answer ${i + 1} - ",
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                      TextSpan(text: question.answers[i]),
                                    ],
                                  ),
                                ),
                          
                                const SizedBox(height: 10),
                          
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () {},
                                      child: Icon(Icons.thumb_up, size: 20, color: Colors.green,)),
                                    const SizedBox(width: 10),
                                    InkWell(
                                      onTap: () {},
                                      child: Icon(Icons.thumb_down, size: 20, color: Colors.red)),
                                  ],
                                ),
                          
                                const SizedBox(height: 10),
                                const Text('Comments'),
                                const SizedBox(height: 10),
                                ...List.generate(
                          question.comments.length,
                          (i) => Padding(
                            padding: const EdgeInsets.only(
                              top: 15
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                            CommentBox(
                            comments: question.comments
                            ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                      ],
                    ),
                          ),
                        )
                      ]
                    )
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