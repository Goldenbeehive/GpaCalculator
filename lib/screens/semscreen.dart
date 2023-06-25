import 'package:flutter/material.dart';
import 'package:gpacalc/components/subjectblock.dart';
import 'package:gpacalc/database/database.dart';
import 'package:gpacalc/providers/semprovider.dart';
import 'package:gpacalc/providers/subprovider.dart';
import 'package:provider/provider.dart';

class SemesterScreen extends StatefulWidget {
  final String name;
  final int id;
  final Function updatePrevScreen;
  const SemesterScreen(
      {required this.name,
      super.key,
      required this.id,
      required this.updatePrevScreen});

  @override
  State<SemesterScreen> createState() => _SemesterScreenState();
}

class _SemesterScreenState extends State<SemesterScreen> {
  Future<List<Subject>> list =
      Future.value(List.generate(3, (index) => Subject()));
  Future<double> gpa = Future.value(1.0);
  void update() {
    setState(() {
      list = context.read<SubjectProvider>().getSubjectsFromSem(widget.id);
      gpa = context.read<SemProv>().calcGpa(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    list = context.read<SubjectProvider>().getSubjectsFromSem(widget.id);
    gpa = context.read<SemProv>().calcGpa(widget.id);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await context.read<SubjectProvider>().createSubject(widget.id);
          setState(() {
            list =
                context.read<SubjectProvider>().getSubjectsFromSem(widget.id);
            gpa = context.read<SemProv>().calcGpa(widget.id);
          });
        },
        backgroundColor: Colors.deepOrange,
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                  onPressed: () async {
                    final nav = Navigator.of(context);
                    await widget.updatePrevScreen();
                    nav.pop();
                  },
                  icon: const Icon(Icons.arrow_back_ios_sharp))),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 12.0),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 12.0, left: 12.0),
                  child: Icon(
                    Icons.school,
                    size: 30,
                  ),
                ),
                Text(
                  widget.name.length < 25
                      ? widget.name
                      : "${widget.name.substring(0, 25)}...",
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          FutureBuilder(
            future: gpa,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.data!.isNaN) {
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        color: Colors.deepOrangeAccent),
                    child: const Center(
                        child: Text(
                      '0.00',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                  ),
                );
              }
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  height: 50,
                  width: 100,
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
                    child: Text(
                      snapshot.data!.toStringAsFixed(2),
                      style: const TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          Expanded(
            child: FutureBuilder(
              future: list,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const CircularProgressIndicator();
                }
                var data = snapshot.data!;
                return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onLongPress: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text(
                                    "Do you want to Delete this Subject?"),
                                content:
                                    const Text("This action cannot be undone."),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop(false);
                                    },
                                    child: const Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop(true);
                                    },
                                    child: const Text('Yes'),
                                  ),
                                ],
                              );
                            },
                          ).then((value) async {
                            if (value == true) {
                              await context
                                  .read<SubjectProvider>()
                                  .deleteSubjectById(data[index].id);
                              setState(() {
                                list = context
                                    .read<SubjectProvider>()
                                    .getSubjectsFromSem(widget.id);
                                gpa =
                                    context.read<SemProv>().calcGpa(widget.id);
                              });
                            }
                          });
                        },
                        child: SubjectBlock(
                          id: data[index].id,
                          updateParent: update,
                        ));
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
