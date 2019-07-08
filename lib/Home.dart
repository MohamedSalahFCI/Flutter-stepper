import 'package:flutter/material.dart';

class MyStepper extends StatefulWidget {
  @override
  _MyStepperState createState() => _MyStepperState();
}

class _MyStepperState extends State<MyStepper> {
  int _currentStep = 0;
  TextEditingController s1 = TextEditingController();
  TextEditingController s2 = TextEditingController();
  TextEditingController s3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("my Stepper"),
      ),
      body: Theme(
        data: ThemeData(accentColor: Colors.red),
        child: Stepper(
          type: StepperType.horizontal,
          steps: _mySteps(),
          currentStep: this._currentStep,
          onStepContinue: () {
            if (_currentStep == 0) {
              if (s1.text.length < 5) {
                //hna hanshta8al bel toast Akiid
                print("Asghar ya negm");
              } else {
                setState(() {
                  this._currentStep = this._currentStep + 1;
                });
              }
            } else if (_currentStep == 1) {
              if (s2.text.length < 6) {
                print("Asghar ya negm 6");
              } else {
                setState(() {
                  this._currentStep = this._currentStep + 1;
                });
              }
            } else if (_currentStep == 2) {
              if (s3.text.length < 7) {
                print("Asghar ya negm 7");
              } else {
                print('finish');
              }
            }
          },
          onStepCancel: () {
            setState(() {
              if (this._currentStep > 0) {
                this._currentStep = this._currentStep - 1;
              } else {
                this._currentStep = 0;
              }
            });
          },
          /*
          onStepContinue: () {
            if (_currentStep == 0) {
              if (s1.text.length < 5) {
                print("Asghar ya negm");
              } else {
                this._currentStep = this._currentStep + 1;
              }
            }
          },
          */
          /*
          //hna ha3mal dh lw 3ayz ashta8al 3alehom 3aady y3ny atna2al benhom bass dh mesh 3ayzo ana 3ayz step by step
          onStepTapped: (step) {
            setState(() {
              this._currentStep = step;
            });
          },
          */
        ),
      ),
    );
  }

  List<Step> _mySteps() {
    List<Step> _steps = [
      Step(
        title: Text("Qr Reading"),
        //subtitle: Text("type 1"),
        content: Column(
          children: <Widget>[
            SizedBox(
              height: 200,
            ),
            TextField(
              controller: s1,
            ),
          ],
        ),
        isActive: _currentStep >= 0,
      ),
      Step(
        title: Text("Step 2"),
        subtitle: Text("type 2"),
        content: TextField(
          controller: s2,
        ),
        isActive: _currentStep >= 1,
      ),
      Step(
        title: Text("Step 3"),
        subtitle: Text("type 3"),
        content: TextField(
          controller: s3,
        ),
        isActive: _currentStep >= 2,
      )
    ];
    return _steps;
  }
}
