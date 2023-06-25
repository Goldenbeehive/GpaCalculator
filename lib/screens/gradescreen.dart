import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gpacalc/components/fadeintext.dart';
import 'package:gpacalc/providers/scaleprovider.dart';
import 'package:gpacalc/providers/semprovider.dart';
import 'package:gpacalc/screens/mainscreen.dart';
import 'package:provider/provider.dart';

class GradeScreen extends StatefulWidget {
    
  const GradeScreen({super.key});

  @override
  State<GradeScreen> createState() => _GradeScreenState();
}

class _GradeScreenState extends State<GradeScreen> {
  bool finished = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: FadeInText(
                delay: Duration.zero,
                child: Align(
                  child: Text(
                    "Welcome to GPA Calculator!",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: FadeInText(
                delay: Duration(milliseconds: 1000),
                child: Align(
                  child: Text(
                    "Please enter your grading system",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ),
            Column(children: [
              gradeInput(context, context.read<ScaleProvider>().getAPlus,
                  context.read<ScaleProvider>().setAPlus, "A+"),
              gradeInput(context, context.read<ScaleProvider>().getA,
                  context.read<ScaleProvider>().setA, "A"),
              gradeInput(context, context.read<ScaleProvider>().getAMinus,
                  context.read<ScaleProvider>().setAMinus, "A-"),
              gradeInput(context, context.read<ScaleProvider>().getBPlus,
                  context.read<ScaleProvider>().setBPlus, "B+"),
              gradeInput(context, context.read<ScaleProvider>().getB,
                  context.read<ScaleProvider>().setB, "B"),
              gradeInput(context, context.read<ScaleProvider>().getBMinus,
                  context.read<ScaleProvider>().setBMinus, "B-"),
              gradeInput(context, context.read<ScaleProvider>().getCPlus,
                  context.read<ScaleProvider>().setCPlus, "C+"),
              gradeInput(context, context.read<ScaleProvider>().getC,
                  context.read<ScaleProvider>().setC, "C"),
              gradeInput(context, context.read<ScaleProvider>().getCMinus,
                  context.read<ScaleProvider>().setCMinus, "C-"),
              gradeInput(context, context.read<ScaleProvider>().getDPlus,
                  context.read<ScaleProvider>().setDPlus, "D+"),
              gradeInput(context, context.read<ScaleProvider>().getD,
                  context.read<ScaleProvider>().setD, "D"),
              gradeInput(context, context.read<ScaleProvider>().getDMinus,
                  context.read<ScaleProvider>().setDMinus, "D-"),
              gradeInput(context, context.read<ScaleProvider>().getF,
                  context.read<ScaleProvider>().setF, "F"),
            ]),
            FadeInText(
              delay: const Duration(milliseconds: 1500),
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: ElevatedButton(
                    onPressed: () async {
                   
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) {
                        return ChangeNotifierProvider(
                          create: (context) => SemProv(),
                          child: const SafeArea(child: MainScreen()),
                        );
                      }), (Route<dynamic> route) => false);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text("Submit")),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget gradeInput(BuildContext context, Future<double> Function() get,
      Function(double x) set, String name) {
        
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: FadeInText(
        delay: const Duration(milliseconds: 1500),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(name),
            FutureBuilder(
                future: get(),
                builder: ((context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center();
                  }
                  return SizedBox(
                    width: 100,
                    child: TextFormField(
                      onChanged: (value) async{
                        
                        if (value == '') {
                          await set(0.0);
                           
                          return;
                        }
                    
                        await set(double.parse(value));
                         
                      },
                      initialValue: snapshot.data!.toStringAsFixed(2),
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^\d{0,2}\.?\d{0,2}'))
                      ],
                      decoration: const InputDecoration(
                        labelText: 'Points',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a label';
                        }
                        return null;
                      },
                    ),
                  );
                })),
          ],
        ),
      ),
    );
  }
}
