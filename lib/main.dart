import 'package:flutter/material.dart';

void main() {
  runApp(demo());
}

class demo extends StatelessWidget {
  const demo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: BMI());
  }

}

class BMI extends StatefulWidget {
  const BMI({super.key});

  @override
  State<BMI> createState() => _BMIState();
}

String bmiResult = '';
double bmiAns = double.nan;

final heightController = TextEditingController();
final weightController = TextEditingController();

class _BMIState extends State<BMI> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFD8D9DA),
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                      margin: EdgeInsets.all(30),
                      child: const Text(
                        'BMI Calculator',
                        style: TextStyle(fontSize: 30),
                      )),
                  Container(
                    margin: const EdgeInsets.all(20),
                    child: TextFormField(
                      controller: heightController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Height(in feet)',
                        labelStyle: TextStyle(
                          color: Colors.black54, //<-- SEE HERE
                        ),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.black54,
                              width: 2), // Border color when focused
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    child: TextFormField(
                      controller: weightController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Weight(in kg)',
                        labelStyle: TextStyle(
                          color: Colors.black54, //<-- SEE HERE
                        ),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.black54,
                              width: 2), // Border color when focused
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      String height = heightController.text;
                      String weight = weightController.text;

                      bmiAns = BmiCalculate(height, weight);

                      setState(() {
                        bmiAns;
                      });

                      heightController.clear();
                      weightController.clear();
                    },
                    child: Text("Calculate"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue[900],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(20),
                    height: 60,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      shape: BoxShape.rectangle,
                      color: bmiAns <= 18.4
                          ? Colors.yellow[600]
                          : bmiAns <= 24.9
                              ? Colors.green[600]
                              : bmiAns <= 39.9
                                  ? Colors.orange[600]
                                  : bmiAns >= 40
                                      ? Colors.red[600]
                                      : Color(0xFFD8D9DA),
                    ),
                    child: Center(
                      child: Text(
                        "${bmiAns.toStringAsFixed(2)}",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.all(20),
                            height: 50,
                            width: 50,
                            // height: ,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              shape: BoxShape.rectangle,
                              color: Colors.yellow[600],
                            ),
                          ),
                          const Text("Under Weight.")
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.all(20),
                            height: 50,
                            width: 50,
                            // height: ,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              shape: BoxShape.rectangle,
                              color: Colors.green[600],
                            ),
                          ),
                          const Text("Normal")
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.all(20),
                            height: 50,
                            width: 50,
                            // height: ,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              shape: BoxShape.rectangle,
                              color: Colors.red[600],
                            ),
                          ),
                          const Text("Overweight")
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.all(20),
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              shape: BoxShape.rectangle,
                              color: Colors.red[600],
                            ),
                          ),
                          const Text("Obesity")
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

double BmiCalculate(String height, String weight) {
  double new_height = double.parse(height) / 100;
  new_height = new_height * 30.48;
  double new_weight = double.parse(weight);

  return new_weight / (new_height * new_height);
}
