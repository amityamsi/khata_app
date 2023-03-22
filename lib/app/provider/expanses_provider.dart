import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../ui/expanses_details.dart';

class ExpansesProvider extends ChangeNotifier {
  var date = "Pick a Date";

  List<Employee> employees = <Employee>[];
  late EmployeeDataSource employeeDataSource;
  String? gender;

  ExpansesProvider() {
    employees = getEmployeeData();
    employeeDataSource = EmployeeDataSource(employeeData: employees);
  }

  changeDate({context}) async {
    DateFormat dateFormat = DateFormat("dd/MM/yyyy");
    var pickeDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));

    log(pickeDate.toString());

    date = dateFormat.format(pickeDate!);
    notifyListeners();
  }
}
