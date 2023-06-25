import 'package:flutter/material.dart';
import 'package:gpacalc/database/database.dart';
import 'package:gpacalc/providers/semprovider.dart';
import 'package:gpacalc/providers/subprovider.dart';
import 'package:gpacalc/screens/semscreen.dart';
import 'package:provider/provider.dart';

class SemList extends StatelessWidget {
  const SemList({super.key, required this.list, required this.updateParent});
  final Future<List<Semester>> list;
  final Function() updateParent;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: list,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        var list = snapshot.data;
        if (list!.isEmpty) {
          return const Center(
            child: Text("There are no semesters to show!"),
          );
        }
        return GridView.count(
          crossAxisCount: 2,
          physics: const BouncingScrollPhysics(),
          children: list.map((name) {
            final index = list.indexOf(name);
            return Padding(
              padding: const EdgeInsets.all(6.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  color: Colors.white,
                ),
                child: ElevatedButton(
                  onLongPress: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text(
                              "Do you want to Delete this semester?"),
                          content: const Text("This action cannot be undone."),
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
                            .read<SemProv>()
                            .deleteSemester(list[index].id);
                        updateParent();
                      }
                    });
                  },
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ChangeNotifierProvider(
                            create: (context) => SubjectProvider(),
                            child: SemesterScreen(
                                name: list[index].semesterName!,
                                id: list[index].id,
                                updatePrevScreen: updateParent,)),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      list[index].semesterName!,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 24),
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
