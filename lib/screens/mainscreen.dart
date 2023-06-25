import 'package:flutter/material.dart';
import 'package:gpacalc/components/semestername.dart';
import 'package:gpacalc/components/semlist.dart';
import 'package:gpacalc/database/database.dart';
import 'package:gpacalc/providers/scaleprovider.dart';
import 'package:gpacalc/providers/semprovider.dart';
import 'package:gpacalc/screens/gradescreen.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Future<List<Semester>> list =
      Future.value(List.generate(3, (index) => Semester()));
  Future<double> cumGpa = Future.value(9.0);
  void update() {
    setState(() {
      list = context.read<SemProv>().getSemesters();
      cumGpa = context.read<SemProv>().calcCumGpa();
    });
  }

  @override
  Widget build(BuildContext context) {
    list = context.read<SemProv>().getSemesters();
    cumGpa = context.read<SemProv>().calcCumGpa();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepOrange,
          child: const Icon(Icons.add),
          onPressed: () {
            showModalBottomSheet(
                useRootNavigator: true,
                context: context,
                builder: (context) {
                  return Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: NameForm(
                        updateParent: update,
                      ));
                });
          }),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: title(),
          ),
          gpaCard(),
          const SizedBox(
            height: 30,
          ),
          const Divider(),
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 12.0, left: 12.0),
                child: Icon(
                  Icons.school,
                  size: 30,
                ),
              ),
              Text(
                "Semesters",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Expanded(
              child: SemList(
            list: list,
            updateParent: update,
          )),
        ],
      ),
    );
  }

  Padding gpaCard() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Container(
        height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            color: Colors.deepOrangeAccent),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Your current GPA is: ",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              FutureBuilder(
                future: cumGpa,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const CircularProgressIndicator();
                  }
                  String gpa = snapshot.data!.toStringAsFixed(2);
                  if (snapshot.data!.isNaN) {
                    return const Text(
                      '0.00',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  }
                  return Text(
                    gpa,
                    style: const TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Row title() {
    return Row(
      children: [
        const Row(
          children: [
            Padding(
              padding: EdgeInsets.all(12.0),
              child: Icon(
                Icons.assessment,
                size: 30,
              ),
            ),
            Text(
              "GPA Calculator",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) {
                  return ChangeNotifierProvider(
                    create: (context) => ScaleProvider(),
                    child: const SafeArea(child: GradeScreen()),
                  );
                }), (Route<dynamic> route) => false);
              },
              icon: const Icon(Icons.settings)),
        ),
      ],
    );
  }
}
