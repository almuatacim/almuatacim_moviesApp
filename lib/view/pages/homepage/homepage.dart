import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants.dart';
import 'package:flutter_application_1/view/pages/homepage/data/ProviderModel/myCounter.dart';
import 'package:flutter_application_1/view/pages/loginpage/data/model/User.dart';
import 'package:flutter_application_1/view/route/approute.dart';
import 'package:flutter_application_1/widgets/custom_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'data/model/task_model.dart';
import 'data/reposotiry/moviereposotiry.dart';
import 'increment_button.dart';

class HomePage extends StatefulWidget {
  final User user;
  HomePage({super.key, required this.user});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeReposotiry homeReposotiry = HomeReposotiry();
  @override
  void initState() {
    super.initState();
  }

  List<TaskModel> tasks = [
    TaskModel(title: 'Flutter'),
    TaskModel(title: 'API'),
    TaskModel(title: 'PROVIDER'),
    TaskModel(title: 'HTTP', subTitle: "SUB http"),
  ];
  bool selectable = false;
  @override
  Widget build(BuildContext context) {
    print("BuildContext--------------------------------------");
    final title = TextEditingController();
    final subTitle = TextEditingController();
    return ChangeNotifierProvider<MyCounter>(
        create: (context) => MyCounter(),
        child: Scaffold(
            appBar: AppBar(
              actions: [
                Visibility(
                    visible: selectable,
                    child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            tasks.removeWhere(
                                (element) => element.isDone == true);
                            selectable = false;
                          });
                        },
                        child: Icon(Icons.delete)))
              ],
              title: Text("Hi ${widget.user.username}"),
            ),
            floatingActionButton: FloatingActionButton(
                child: const Icon(Icons.add),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          child: Container(
                            width: 50,
                            height: 300,
                            color: Colors.white,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                children: [
                                  TextField(
                                    controller: title,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextField(
                                    controller: subTitle,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      MaterialButton(
                                        onPressed: () {
                                          setState(() {
                                            tasks.add(TaskModel(
                                                title: title.text,
                                                subTitle: subTitle.text));
                                            Navigator.pop(context);
                                          });
                                        },
                                        color: Colors.green,
                                        child: Row(
                                          children: const [
                                            Text(
                                              'ADD',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            Icon(Icons.add)
                                          ],
                                        ),
                                      ),
                                      MaterialButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        color: Colors.green,
                                        child: const Text(
                                          'Cancel',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                }),
            drawer: Drawer(
              child: ListView(
                children: [
                  DrawerHeader(
                    child: Text("Welcom to my app"),
                    decoration: BoxDecoration(color: Colors.blue),
                  ),
                  ListTile(
                    trailing: Icon(Icons.local_activity),
                    title: Text("Activity"),
                    onTap: () => {
                      Navigator.popAndPushNamed(context, AppRoute.activityPage)
                    },
                  ),
                  Divider(),
                  ListTile(
                    trailing: Icon(Icons.logout),
                    title: Text("Log out"),
                    onTap: () => {
                      Navigator.pushNamedAndRemoveUntil(context,
                          AppRoute.loginpage, (Route<dynamic> route) => false)
                    },
                  ),
                ],
              ),
            ),
            body: DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  const TabBar(
                      labelColor: myGreen,
                      unselectedLabelColor: Colors.black,
                      tabs: [
                        Tab(text: "Tasks"),
                        Tab(
                          text: "Counter",
                        )
                      ]),
                  Expanded(
                    child: TabBarView(
                      children: [
                        ListView.builder(
                            itemCount: tasks.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  ListTile(
                                    onLongPress: () {
                                      setState(() {
                                        selectable = !selectable;
                                        tasks[index].isDone =
                                            !tasks[index].isDone;
                                      });
                                    },
                                    title: Text(tasks[index].title),
                                    subtitle: Text(tasks[index].subTitle ?? ''),
                                    trailing: Visibility(
                                      visible: selectable,
                                      child: Checkbox(
                                          value: tasks[index].isDone,
                                          onChanged: (value) {
                                            setState(() {
                                              tasks[index].isDone =
                                                  !tasks[index].isDone;
                                            });
                                          }),
                                    ),
                                  ),
                                ],
                              );
                            }),
                        Center(
                          child: Column(
                            children: [
                              Consumer<MyCounter>(
                                builder: (context, myCounter, child) {
                                  return Text(
                                    myCounter.counter.toString(),
                                    style: TextStyle(fontSize: 38),
                                  );
                                },
                              ),
                              Divider(),
                              incrementButton(),
                              Divider(),
                              incrementButton(
                                inc: false,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }
}
