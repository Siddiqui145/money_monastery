import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:money_monastery/src/features/home/domain/entities/entities.dart';
import 'package:money_monastery/src/features/home/presentation/widgets/comments_text_field.dart';

@RoutePage()
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
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
    ));
  }
}