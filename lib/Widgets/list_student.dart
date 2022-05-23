import 'package:flutter/material.dart';
import 'package:sq_flite/Models/data_model.dart';
import 'package:sq_flite/db/functions/db_functions.dart';

class ListStudentContext extends StatelessWidget {
  const ListStudentContext({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: studentListNotifier,
      builder:
          (BuildContext ctx, List<StudentModel> studentList, Widget? child) {
        return ListView.separated(
            itemBuilder: (ctx, index) {
              final data = studentList[index];
              return ListTile(
                title: Text('Name ${data.name}'),
                subtitle: Text("Age ${data.age}"),
                trailing: IconButton(
                    onPressed: () {
                      // if (data.id != null) {
                      //   print("data.id not found");

                      // } else{
                      deleteStudent(data.id!);
                      // }
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    )),
              );
            },
            separatorBuilder: (ctx, index) {
              return const Divider();
            },
            itemCount: studentList.length);
      },
    );
  }
}
