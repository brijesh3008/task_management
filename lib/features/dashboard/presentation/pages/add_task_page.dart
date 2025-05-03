import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management/core/config/app_colors.dart';
import 'package:task_management/core/config/app_string.dart';
import 'package:task_management/features/base/base_bloc/presentation/manager/base_bloc.dart';
import 'package:task_management/features/dashboard/data/models/add_update_params.dart';
import 'package:task_management/features/dashboard/data/models/task_list_page_args.dart';
import 'package:task_management/features/dashboard/presentation/manager/task_list/task_list_bloc.dart';

class AddUpdateTaskPage extends StatefulWidget {
  final UpdateTaskArgs updateTaskArgs;

  const AddUpdateTaskPage({super.key, required this.updateTaskArgs});

  @override
  State<AddUpdateTaskPage> createState() => _AddUpdateTaskPageState();
}

class _AddUpdateTaskPageState extends State<AddUpdateTaskPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  UpdateTaskArgs updateTaskArgs = const UpdateTaskArgs();
  TextEditingController taskDetailsController = TextEditingController();
  TextEditingController taskTitleController = TextEditingController();
  late TaskBloc taskBloc;

  @override
  void initState() {
    taskBloc = BlocProvider.of<TaskBloc>(context);
    updateTaskArgs = widget.updateTaskArgs;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.appBackGroundColor,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios,color: AppColors.white,)),
        title: Text(
          updateTaskArgs.taskId == null
              ? AppString.addGlitchTask
              : AppString.updateGlitchTask
          ,style: const TextStyle(color: Colors.white,),),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<TaskBloc, BaseState>(
              builder: (context, state) {
                if (state is BaseLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                }
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Form(
                      key: _formKey,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(AppString.taskTitle,style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.black,

                              ),),
                              const SizedBox(height: 10),
                              TextFormField(
                                controller: taskTitleController,
                                decoration: const InputDecoration(
                                  labelText: AppString.taskTitle,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.appBackGroundColor),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.appBackGroundColor),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'Please enter task title';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 10),
                              Text(AppString.taskDescription,style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: AppColors.black,

                              ),),
                              const SizedBox(height: 10),
                              TextFormField(
                                controller: taskDetailsController,
                                maxLines: 4,
                                decoration: const InputDecoration(
                                  labelText: AppString.taskDescription,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.appBackGroundColor),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.appBackGroundColor),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'Please enter task description';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                          Positioned(
                            width: MediaQuery.of(context).size.width - 32,
                            bottom: 20,
                            child: GestureDetector(
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  if (updateTaskArgs.taskId == null) {
                                    taskBloc.add(PostTaskDetailsDataEvent(
                                        params: TaskParams(
                                      taskDetails: taskDetailsController.text,
                                      taskName: taskTitleController.text,
                                    )));
                                  } else {
                                    taskBloc.add(PostTaskDetailsDataEvent(
                                        params: TaskParams(
                                      taskDetails: taskDetailsController.text,
                                      taskName: taskTitleController.text,
                                      taskId: updateTaskArgs.taskId,
                                    )));
                                  }
                                }
                              },
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  color: AppColors.appBackGroundColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Text(
                                    updateTaskArgs.taskId == null
                                        ? AppString.addTask
                                        : AppString.updateTask,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
