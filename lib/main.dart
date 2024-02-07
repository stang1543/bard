import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      home: QuizPage(),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final List<Question> questions = [
    Question(
      question: 'ดอกไม้ชนิดใดเป็นสัญลักษณ์ของวันแม่?',
      answers: [
        '1.ดอกกล้วยไม้',
        '2.ดอกมะลิ',
        '3.ดอกกุหลาบ',
        '4.ดอกทานตะวัน',
      ],
      correctAnswer: 'ดอกมะลิ',
    ),
    // เพิ่มคำถามอีก 9 ข้อ
    Question(
      question: 'ภาษาประจำชาติของประเทศไทยคืออะไร?',
      answers: [
        '1.ภาษาไทย',
        '2.ภาษาอังกฤษ',
        '3.ภาษาจีน',
        '4.ภาษาฝรั่งเศส',
      ],
      correctAnswer: 'ภาษาไทย',
    ),
    // เพิ่มคำถามอีก 8 ข้อ
    Question(
      question: 'ภูเขาที่สูงที่สุดในประเทศไทยคืออะไร?',
      answers: [
        '1.ดอยอินทนนท์',
        '2.ดอยหลวงเชียงดาว',
        '3.ภูหลวง',
        '4.เขาหลวง',
      ],
      correctAnswer: 'ดอยอินทนนท์',
    ),
    // เพิ่มคำถามอีก 7 ข้อ
    Question(
      question: 'ดาวเคราะห์ในระบบสุริยะมีกี่ดวง?',
      answers: [
        '1.7',
        '2.8',
        '3.9',
        '4.10',
      ],
      correctAnswer: '7',
    ),
    // เพิ่มคำถามอีก 6 ข้อ
    Question(
      question: 'สิ่งมีชีวิตที่หายใจด้วยเหงือกคืออะไร?',
      answers: [
        '1.ปลา',
        '2.วาฬ',
        '3.นก',
        '4.ค้างคาว',
      ],
      correctAnswer: 'ปลา',
    ),
    // เพิ่มคำถามอีก 5 ข้อ
    Question(
      question: 'ไดโนเสาร์สูญพันธุ์เมื่อไหร่?',
      answers: [
        '1.65 ล้านปีก่อน',
        '2.100 ล้านปีก่อน',
        '3.500 ล้านปีก่อน',
        '4.1 พันล้านปีก่อน',
      ],
      correctAnswer: '65 ล้านปีก่อน',
    ),
    // เพิ่มคำถามอีก 4 ข้อ
    Question(
      question: 'วัคซีนป้องกันโรคอะไร?',
      answers: [
        '1.โรคหวัด',
        '2.โรคเอดส์',
        '3.โรคมะเร็ง',
        '4.ทั้งหมด',
      ],
      correctAnswer: 'ทั้งหมด',
    ),
    // เพิ่มคำถามอีก 3 ข้อ
    Question(
      question: 'ดาวฤกษ์ที่อยู่ใกล้โลกมากที่สุดคืออะไร?',
      answers: [
        '1.ดาวอังคาร',
        '2.ดาวศุกร์',
        '3.ดาวพฤหัสบดี',
        '4.ดาวเสาร์',
      ],
      correctAnswer: 'ดาวศุกร์',
    ),

    // เพิ่มคำถามอีก 2 ข้อ
    Question(
      question: 'พืชชนิดใดมีใบเลี้ยงคู่?',
      answers: [
        '1.ข้าว',
        '2.ถั่วฝักยาว',
        '3.มะเขือเทศ',
        '4.มะม่วง',
      ],
      correctAnswer: 'มะม่วง',
    ),

 // เพิ่มคำถามอีก 1 ข้อ
    Question(
      question: 'รากของพืชมีหน้าที่อะไร?',
      answers: [
        '1.ดูดซึมน้ำและแร่ธาตุ',
        '2.สังเคราะห์แสง',
        '3.เก็บสะสมอาหาร',
        '4.ทั้งหมด',
      ],
      correctAnswer: 'ทั้งหมด',
    ),
    
  ];

  int currentQuestionIndex = 0;
  int score = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(questions[currentQuestionIndex].question),
            ...questions[currentQuestionIndex].answers.map((answer) {
              return ListTile(
                title: Text(answer),
                onTap: () {
                  if (answer == questions[currentQuestionIndex].correctAnswer) {
                    score++;
                  }
                  setState(() {
                    if (currentQuestionIndex < questions.length - 1) {
                      currentQuestionIndex++;
                    } else {
                      // แสดงผลลัพธ์
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('ผลลัพธ์'),
                          content: Text('คุณได้คะแนน $score จาก ${questions.length} คะแนน'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text('ปิด'),
                            ),
                          ],
                        ),
                      );
                    }
                  });
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}

class Question {
  final String question;
  final List<String> answers;
  final String correctAnswer;

  Question({
    required this.question,
    required this.answers,
    required this.correctAnswer,
  });
}