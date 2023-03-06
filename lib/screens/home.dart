import 'package:flutter/material.dart';
import 'buttons.dart';
import 'package:math_expressions/math_expressions.dart';

class HomePage extends StatelessWidget {
  static const routeName = "/homePage";
  @override
  Widget build(BuildContext context) {
    Widget _judul() {
      return Container(
        padding: const EdgeInsets.fromLTRB(10, 40, 10, 20),
        child: Text(
          'Anggota Kelompok',
          style: TextStyle(
              color: Colors.tealAccent.shade700,
              fontWeight: FontWeight.w700,
              fontSize: 24),
        ),
      );
    }

    Widget _listAnggota() {
      return ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          _judul(),
          ListTile(
              title: Text(
                'Muhammad Ikhwan Hanif',
                style: TextStyle(fontSize: 19),
              ),
              subtitle: Text(
                '123200096',
                style:
                    TextStyle(color: Colors.tealAccent.shade700, fontSize: 16),
              )),
          ListTile(
              title: Text(
                'Bagas Dewantoro Ibrahim',
                style: TextStyle(fontSize: 19),
              ),
              subtitle: Text(
                '123200107',
                style:
                    TextStyle(color: Colors.tealAccent.shade700, fontSize: 16),
              )),
          ListTile(
              title: Text(
                'Muhammad Nur Ishlaahudin S.',
                style: TextStyle(fontSize: 19),
              ),
              subtitle: Text(
                '123200097',
                style:
                    TextStyle(color: Colors.tealAccent.shade700, fontSize: 16),
              )),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: _listAnggota(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return Calculator();
          }));
        },
        tooltip: 'Penghitungan',
        child: const Icon(Icons.calculate_rounded),
      ),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var userInput = '';
  var answer = '';

// Array of button
  final List<String> buttons = [
    'C',
    '+/-',
    '%',
    'DEL',
    '7',
    '8',
    '9',
    '/',
    '4',
    '5',
    '6',
    'x',
    '1',
    '2',
    '3',
    '-',
    '0',
    '.',
    '=',
    '+',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Calculator"),
      ), //AppBar
      backgroundColor: Colors.white38,
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(20),
                      alignment: Alignment.centerRight,
                      child: Text(
                        userInput,
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      alignment: Alignment.centerRight,
                      child: Text(
                        answer,
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ]),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              child: GridView.builder(
                  itemCount: buttons.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (BuildContext context, int index) {
                    // Clear Button
                    if (index == 0) {
                      return MyButton(
                        buttontapped: () {
                          setState(() {
                            userInput = '';
                            answer = '0';
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.blue[50],
                        textColor: Colors.black,
                      );
                    }

                    // +/- button
                    else if (index == 1) {
                      return MyButton(
                        buttonText: buttons[index],
                        color: Colors.blue[50],
                        textColor: Colors.black,
                      );
                    }
                    // % Button
                    else if (index == 2) {
                      return MyButton(
                        buttontapped: () {
                          setState(() {
                            userInput += buttons[index];
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.blue[50],
                        textColor: Colors.black,
                      );
                    }
                    // Delete Button
                    else if (index == 3) {
                      return MyButton(
                        buttontapped: () {
                          setState(() {
                            userInput =
                                userInput.substring(0, userInput.length - 1);
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.blue[50],
                        textColor: Colors.black,
                      );
                    }
                    // Equal_to Button
                    else if (index == 18) {
                      return MyButton(
                        buttontapped: () {
                          setState(() {
                            equalPressed();
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.orange[700],
                        textColor: Colors.white,
                      );
                    }

                    // other buttons
                    else {
                      return MyButton(
                        buttontapped: () {
                          setState(() {
                            userInput += buttons[index];
                          });
                        },
                        buttonText: buttons[index],
                        color: isOperator(buttons[index])
                            ? Colors.blueAccent
                            : Colors.white,
                        textColor: isOperator(buttons[index])
                            ? Colors.white
                            : Colors.black,
                      );
                    }
                  }), // GridView.builder
            ),
          ),
        ],
      ),
    );
  }

  bool isOperator(String x) {
    if (x == '/' || x == 'x' || x == '-' || x == '+' || x == '=') {
      return true;
    }
    return false;
  }

// function to calculate the input operation
  void equalPressed() {
    String finaluserinput = userInput;
    finaluserinput = userInput.replaceAll('x', '*');

    Parser p = Parser();
    Expression exp = p.parse(finaluserinput);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    answer = eval.toString();
  }
}

// class Calculator extends StatefulWidget {
//   const Calculator({Key? key}) : super(key: key);

//   @override
//   State<Calculator> createState() => _CalculatorState();
// }

// class _CalculatorState extends State<Calculator> {
//   var _input = '';
//   var _inputTampil = '';
//   var _hasilSebelum = '';
//   int _hasil = 0;
//   bool _first = false;
//   bool _second = false;
//   bool _operator = false;
//   bool _inputError = false;
//   final fieldInput = TextEditingController();

//   void resetInput() {
//     fieldInput.clear();
//   }

//   void _operasiHitung() {
//     setState(() {
//       try {
//         setState(() {
//           _inputTampil = _input;
//           _hasilSebelum = _hasil.toString();
//           if (_operator) {
//             _hasil += int.parse(_input);
//           } else {
//             _hasil -= int.parse(_input);
//           }
//           _input = '';
//           _inputError = false;
//           if (_first) _second = true;
//           _first = true;
//         });
//       } on FormatException {
//         setState(() {
//           _inputTampil = 'NULL';
//           _inputError = true;
//         });
//         if (_first) _second = true;
//         SnackBar snackBar = SnackBar(
//           content: Text("Input Tidak Valid!"),
//           backgroundColor: Colors.red,
//         );
//         ScaffoldMessenger.of(context).showSnackBar(snackBar);
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     Widget _numberField1() {
//       return Container(
//         padding: EdgeInsets.fromLTRB(20, 60, 20, 10),
//         child: TextFormField(
//           enabled: true,
//           onChanged: (value) {
//             _input = value;
//           },
//           decoration: InputDecoration(
//             labelText: 'Angka Penjumlah',
//             contentPadding:
//                 const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//             border: UnderlineInputBorder(),
//             enabledBorder: UnderlineInputBorder(
//               borderSide:
//                   BorderSide(color: (_inputError) ? Colors.red : Colors.grey),
//             ),
//           ),
//           controller: fieldInput,
//         ),
//       );
//     }

//     Widget _buttonRow() {
//       return Container(
//           padding: EdgeInsets.only(top: 40),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               ElevatedButton(
//                 onPressed: () {
//                   setState(() {
//                     _operator = true;
//                   });
//                   _operasiHitung();
//                   resetInput();
//                 },
//                 child: Icon(Icons.add),
//                 style: ElevatedButton.styleFrom(
//                   padding: const EdgeInsets.all(20),
//                   primary: Colors.green,
//                 ),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   setState(() {
//                     _operator = false;
//                   });
//                   _operasiHitung();
//                   resetInput();
//                 },
//                 child: Icon(Icons.remove),
//                 style: ElevatedButton.styleFrom(
//                   padding: const EdgeInsets.all(20),
//                   primary: Colors.red,
//                 ),
//               )
//             ],
//           ));
//     }

//     Widget _record(String text) {
//       return Text(
//         '$text',
//         style: TextStyle(
//             fontSize: 16,
//             color: (_inputError) ? Colors.red : Colors.grey.shade700,
//             fontWeight: FontWeight.w600),
//       );
//     }

//     Widget _hasilJumlah() {
//       return Container(
//         padding: const EdgeInsets.fromLTRB(10, 100, 10, 10),
//         child: Column(
//           children: [
//             Padding(
//               padding: EdgeInsets.only(bottom: 10),
//               child: (_hasilSebelum == '' && !_first)
//                   ? _record('0')
//                   : (_first && !_second)
//                       ? _record('$_inputTampil')
//                       : (_operator)
//                           ? _record('$_hasilSebelum + $_inputTampil')
//                           : _record('$_hasilSebelum - $_inputTampil'),
//             ),
//             Text(
//               'Hasil :',
//               style: TextStyle(
//                 fontSize: 18,
//                 color: Colors.grey.shade700,
//               ),
//             ),
//             Text(
//               '$_hasil',
//               style: TextStyle(
//                   color:
//                       (_inputError) ? Colors.red : Colors.tealAccent.shade700,
//                   fontSize: 32),
//             ),
//           ],
//         ),
//       );
//     }

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Halaman Penghitungan'),
//       ),
//       body: Column(
//         children: [
//           _numberField1(),
//           _buttonRow(),
//           _hasilJumlah(),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           resetInput();
//           setState(() {
//             _hasil = 0;
//             _input = '';
//             _inputTampil = '';
//             _inputError = false;
//             _hasilSebelum = '';
//             _first = false;
//             _second = false;
//           });
//         },
//         tooltip: 'Reset',
//         child: const Icon(Icons.delete),
//       ),
//     );
//   }
// }
