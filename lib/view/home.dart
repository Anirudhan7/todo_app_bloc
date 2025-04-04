import 'package:bloc_api/bloc/todo_bloc.dart';
import 'package:bloc_api/model.dart';
import 'package:bloc_api/view/add_details.dart';
import 'package:bloc_api/view/widget_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  Home({super.key});
  late Future<List<TodoModel>> todolist;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.yellow[200],
        appBar: AppBar(
          title: const Center(child: Text("To Do")),
          elevation: 0,
        ),
        body: BlocConsumer<TodoBloc, TodoState>(
          listener: (context, state) {
            if (state is ResponseState) {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.responseMsg)),
              );
            }
          },
          builder: (context, state) {
            if (state is LoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is SuccessState) {
              return WidgetGridView(state: state);
            } else if (state is ErrorState) {
              return Center(child: Text(state.errorMsg));
            } else {
              return const Text('');
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => AddDetails()),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
