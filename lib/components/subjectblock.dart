import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gpacalc/providers/subprovider.dart';
import 'package:provider/provider.dart';

class SubjectBlock extends StatefulWidget {
  final int id;
  final Function updateParent;
  const SubjectBlock({
    super.key,
    required this.id,
    required this.updateParent,
  });

  @override
  State<SubjectBlock> createState() => _SubjectBlockState();
}

class _SubjectBlockState extends State<SubjectBlock> {
  String? dropDownValue;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: context.read<SubjectProvider>().getSubjectById(widget.id),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        var data = snapshot.data;
        dropDownValue ??= data?.grade;
        return GestureDetector(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
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
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        onChanged: (value) async {
                          await context
                              .read<SubjectProvider>()
                              .updateSubjectName(widget.id, value);
                        },
                        initialValue: data!.name,
                        decoration: const InputDecoration(
                          labelText: 'Subject Name',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a label';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: dropDownValue,
                        items: <String>[
                          'A+',
                          'A',
                          'A-',
                          'B+',
                          'B',
                          'B-',
                          'C+',
                          'C',
                          'C-',
                          'D+',
                          'D',
                          'D-',
                          'F'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) async {
                          await context
                              .read<SubjectProvider>()
                              .updateSubjectGrade(widget.id, newValue!);
                          setState(() {
                            dropDownValue = newValue;
                            widget.updateParent();
                          });
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        initialValue: data.credits.toString(),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        onChanged: (value) async {
                          if (value == '') {
                            await context
                                .read<SubjectProvider>()
                                .updateSubjectCredit(widget.id, 0);
                            widget.updateParent();
                            return;
                          }
                          await context
                              .read<SubjectProvider>()
                              .updateSubjectCredit(widget.id, int.parse(value));
                          widget.updateParent();
                        },
                        decoration: const InputDecoration(
                          labelText: 'Credit Hours',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a numerical label';
                          }
                          if (double.tryParse(value) == null) {
                            return 'Please enter a valid number';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
