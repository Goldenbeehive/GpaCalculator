import 'package:flutter/material.dart';
import 'package:gpacalc/providers/semprovider.dart';
import 'package:provider/provider.dart';

class NameForm extends StatefulWidget {
  
  const NameForm({super.key, required this.updateParent});
  final Function() updateParent; 
  @override
  State<NameForm> createState() => NameFormState();
}

class NameFormState extends State<NameForm> {
  final _formKey = GlobalKey<FormState>();
  String name = "";
  

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 12.0, top: 8.0),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'New Semester',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
                onSaved: (newValue) {
                  name = newValue!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                    labelText: "Semester Name"),
              ),
            ),
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Cancel")),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: ElevatedButton(
                            onPressed: () async {
                              final nav = Navigator.of(context);
                              _formKey.currentState!.save();
                              if (_formKey.currentState!.validate()) {
                                await context.read<SemProv>().addSemester(name);
                                widget.updateParent();
                                nav.pop();
                               
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              foregroundColor: Colors.white,
                            ),
                            child: const Text("Ok")),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                )
              ],
            ),
          ],
        ));
  }
}
