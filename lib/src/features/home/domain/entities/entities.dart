class QuestionsAnswers {
  final String question;
  final List<String> answers;
  final List<String> comments;

  QuestionsAnswers({
    required this.question,
    required this.answers,
    required this.comments,
  });
}

List <QuestionsAnswers> get questionList => [
  QuestionsAnswers(
    question: "Q1. What are the key differences between ROE vs. ROCE vs. ROIC?", 
    answers: [
      "📊 ROE (Return on Equity) tells you how well a company is generating profits relative to shareholders' equity. Perfect for understanding how much shareholders are getting back, but beware—high leverage can inflate this ratio, making the company look more profitable than it actually is. \n \n 📈 ROCE (Return on Capital Employed) takes it a step further by looking at how well the company is using both debt and equity to generate profits. It's ideal for capital-intensive industries, but a large cash reserve can skew the results. \n \n ⚙️ ROIC (Return on Invested Capital) is the most operationally focused, measuring how efficiently a company is turning its invested capital (debt + equity) into profits, while excluding non-operating assets. It gives the clearest picture of how well management is driving growth through operations.",
      "The critical point: choosing the right ratio for the right company is essential. For example, a debt-heavy company might show a stellar ROE, but ROIC would reveal a less impressive operational performance. On the other hand, ROCE might be the go-to metric for evaluating a highly leveraged, capital-intensive business. "
    ],
    comments: [
      " Very Helpful",
    ]
    )
];



