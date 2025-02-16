
import 'package:flutter/material.dart';
import 'package:hello_world/screens/Result.dart';

class BMIScreen extends StatefulWidget {
  @override
  _BMIScreenState createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  bool? isMale;
  double height = 150;
  int weight = 60;
  int age = 25;

  double calculateBMI() {
    return weight / ((height / 100) * (height / 100));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI CALCULATOR')),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() => isMale = true);
                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: isMale == true
                            ? Colors.pink.withOpacity(0.7)
                            : Color(0xFF1D1E33),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.male, size: 80, color: Colors.white),
                          Text("MALE",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() => isMale = false);
                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: isMale == false
                            ? Colors.pink.withOpacity(0.7)
                            : Color(0xFF1D1E33),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.female, size: 80, color: Colors.white),
                          Text("FEMALE",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xFF1D1E33),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('HEIGHT',
                      style: TextStyle(fontSize: 18, color: Colors.white54)),
                  Text('${height.toInt()} cm',
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                  Slider(
                    value: height,
                    min: 100,
                    max: 220,
                    activeColor: Colors.pink,
                    inactiveColor: Colors.white24,
                    onChanged: (value) {
                      setState(() => height = value);
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Color(0xFF1D1E33),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('WEIGHT',
                            style:
                                TextStyle(fontSize: 18, color: Colors.white54)),
                        Text('$weight',
                            style: TextStyle(
                                fontSize: 40, fontWeight: FontWeight.bold)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              heroTag: 'weight-',
                              onPressed: () {
                                setState(() => weight--);
                              },
                              child: Icon(Icons.remove),
                              mini: true,
                              backgroundColor: Colors.white24,
                            ),
                            SizedBox(width: 10),
                            FloatingActionButton(
                              heroTag: 'weight+',
                              onPressed: () {
                                setState(() => weight++);
                              },
                              child: Icon(Icons.add),
                              mini: true,
                              backgroundColor: Colors.white24,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Color(0xFF1D1E33),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('AGE',
                            style:
                                TextStyle(fontSize: 18, color: Colors.white54)),
                        Text('$age',
                            style: TextStyle(
                                fontSize: 40, fontWeight: FontWeight.bold)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              heroTag: 'age-',
                              onPressed: () {
                                setState(() => age--);
                              },
                              child: Icon(Icons.remove),
                              mini: true,
                              backgroundColor: Colors.white24,
                            ),
                            SizedBox(width: 10),
                            FloatingActionButton(
                              heroTag: 'age+',
                              onPressed: () {
                                setState(() => age++);
                              },
                              child: Icon(Icons.add),
                              mini: true,
                              backgroundColor: Colors.white24,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              double bmi = calculateBMI();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultScreen(bmi: bmi),
                ),
              );
            },
            child: Container(
              color: Colors.pink,
              width: double.infinity,
              height: 60,
              child: Center(
                child: Text('CALCULATE',
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
