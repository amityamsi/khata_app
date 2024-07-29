import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:khata_app/app/services/hive/transaction.dart';

import '../ui/expanses_details.dart';

class ExpansesProvider extends ChangeNotifier {
  var date = DateFormat('dd/MM/yyyy').format(DateTime.now()).toString();
  double runningBalance = 0.0;

  TextEditingController amountEditingController = TextEditingController();
  TextEditingController titleEditingController = TextEditingController();
  bool isCredit = true;

  updateIsCredit({required bool val}) {
    isCredit = val;
    type = val ? "credit" : "debit";
    notifyListeners();
  }

  List<Employee> employees = <Employee>[];
  late EmployeeDataSource employeeDataSource;
  String? type;

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

  Future<void> addTransaction(Transaction transaction) async {
    final box = Hive.box<Transaction>('transactions');
    box.add(transaction);
    amountEditingController.clear();
    titleEditingController.clear();
    var date = DateFormat('dd/MM/yyyy').format(DateTime.now()).toString();
    notifyListeners();
  }
}
