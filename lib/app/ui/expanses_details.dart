import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ExpansesDetailScreen extends StatefulWidget {
  const ExpansesDetailScreen({super.key});

  @override
  State<ExpansesDetailScreen> createState() => _ExpansesDetailScreenState();
}

class _ExpansesDetailScreenState extends State<ExpansesDetailScreen> {
  List<Employee> employees = <Employee>[];
  late EmployeeDataSource employeeDataSource;
  String? gender; //no radio button will be selected on initial

  @override
  void initState() {
    super.initState();
    employees = getEmployeeData();
    employeeDataSource = EmployeeDataSource(employeeData: employees);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Syncfusion Flutter DataGrid'),
      ),
      body: SfDataGrid(
        allowPullToRefresh: true,
        source: employeeDataSource,
        columnWidthMode: ColumnWidthMode.fill,
        headerGridLinesVisibility: GridLinesVisibility.both,
        gridLinesVisibility: GridLinesVisibility.both,
        columns: <GridColumn>[
          GridColumn(
              columnName: 'date',
              label: Container(
                  padding: const EdgeInsets.all(16.0),
                  alignment: Alignment.center,
                  child: const Text(
                    'Date',
                  ))),
          GridColumn(
              columnName: 'title',
              label: Container(
                  padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: const Text('Title'))),
          GridColumn(
              columnName: 'credit',
              label: Container(
                  padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: const Text(
                    'Credit',
                    overflow: TextOverflow.ellipsis,
                  ))),
          GridColumn(
              columnName: 'debit',
              label: Container(
                  padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: const Text('Debit'))),
          GridColumn(
              columnName: 'balance',
              label: Container(
                  padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: const Text('Balance'))),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addNewTransaction(context: context, gender: gender);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

addNewTransaction({context, gender}) {
  showDialog<void>(
    context: context,
    barrierDismissible: true, // user must tap button!
    builder: (BuildContext context) {
      return StatefulBuilder(builder: (context, setState) {
        return AlertDialog(
          alignment: Alignment.center,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          title: const Text('Add new Transaction'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile(
                        // dense: true,
                        // selected: true,
                        title: const Text("Credit"),
                        value: "credit",
                        groupValue: gender,
                        onChanged: (value) {
                          setState(() {
                            gender = value.toString();
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile(
                        // toggleable: true,
                        title: const Text("Debit"),
                        value: "debit",
                        groupValue: gender,
                        onChanged: (value) {
                          setState(() {
                            gender = value.toString();
                          });
                        },
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2100));
                      },
                      child: const Text("Pick a Date")),
                ),
                const TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: "Amount"),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .01,
                ),
                const TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: "Particular"),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OutlinedButton(
                          onPressed: () {}, child: const Text("Cancel")),
                      ElevatedButton(
                          onPressed: () {}, child: const Text("Save"))
                    ]),
              ],
            ),
          ),
        );
      });
//
    },
  );
}

List<Employee> getEmployeeData() {
  return [
    Employee(10001, 'James', 'Project Lead', 20000, 2141),
    Employee(10002, 'Kathryn', 'Manager', 30000, 10000),
    Employee(10003, 'Lara', 'Developer', 15000, 2000),
    Employee(
      10004,
      'Michael',
      'Designer',
      15000,
      2000,
    ),
    Employee(
      10005,
      'Martin',
      'Developer',
      15000,
      50000,
    ),
    Employee(
      10006,
      'Newberry',
      'Developer',
      15000,
      30000,
    ),
    Employee(10007, 'Balnc', 'Developer', 15000, 1520),
    Employee(10008, 'Perry', 'Developer', 15000, 5100),
    Employee(10009, 'Gable', 'Developer', 15000, 6500),
    Employee(
      10010,
      'Grimes',
      'Developer',
      15000,
      2055,
    ),
    Employee(
      10001,
      'James',
      'Project Lead',
      20000,
      6000,
    ),
    Employee(10002, 'Kathryn', 'Manager', 30000, 4877),
    Employee(10003, 'Lara', 'Developer', 15000, 1400),
    Employee(10004, 'Michael', 'Designer', 15000, 6500),
    Employee(10005, 'Martin', 'Developer', 15000, 5800),
    Employee(
      10006,
      'Newberry',
      'Developer',
      15000,
      4000,
    ),
    Employee(
      10007,
      'Balnc',
      'Developer',
      15000,
      7000,
    ),
    Employee(
      10008,
      'Perry',
      'Developer',
      15000,
      92200,
    ),
    Employee(
      10009,
      'Gable',
      'Developer',
      15000,
      1500,
    ),
    Employee(10010, 'Grimes', 'Developer', 15000, 14500)
  ];
}

/// Custom business object class which contains properties to hold the detailed
/// information about the employee which will be rendered in datagrid.
class Employee {
  /// Creates the employee class with required details.
  Employee(this.id, this.name, this.designation, this.salary, this.balance);

  /// Id of an employee.
  final int id;

  /// Name of an employee.
  final String name;

  /// Designation of an employee.
  final String designation;

  /// Salary of an employee.
  final int salary;

  final int balance;
}

/// An object to set the employee collection data source to the datagrid. This
/// is used to map the employee data to the datagrid widget.
class EmployeeDataSource extends DataGridSource {
  /// Creates the employee data source class with required details.
  EmployeeDataSource({required List<Employee> employeeData}) {
    _employeeData = employeeData
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<int>(columnName: 'id', value: e.id),
              DataGridCell<String>(columnName: 'name', value: e.name),
              DataGridCell<String>(
                  columnName: 'designation', value: e.designation),
              DataGridCell<int>(columnName: 'salary', value: e.salary),
              DataGridCell<int>(columnName: 'balance', value: e.balance),
            ]))
        .toList();
  }

  List<DataGridRow> _employeeData = [];

  @override
  List<DataGridRow> get rows => _employeeData;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
      return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: Text(e.value.toString()),
      );
    }).toList());
  }
}
