import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:khata_app/app/provider/expanses_provider.dart';
import 'package:khata_app/app/services/hive/transaction.dart';
import 'package:provider/provider.dart';

class TransactionTable extends StatelessWidget {
  const TransactionTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpansesProvider>(
      builder:
          (BuildContext ctx, ExpansesProvider expansesProvider, Widget? child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Transaction Table'),
            actions: const [Text("Balance: ")],
          ),
          body: Padding(
            padding: const EdgeInsets.all(2.0),
            child: ValueListenableBuilder(
              valueListenable:
                  Hive.box<Transaction>('transactions').listenable(),
              builder: (context, Box<Transaction> box, _) {
                if (box.values.isEmpty) {
                  return const Center(child: Text('No data available'));
                }
                double runningBalance = 0.0;

                return Row(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: DataTable(
                          dataRowMinHeight: 25.0,
                          dataRowMaxHeight: 28.0,
                          border: const TableBorder(
                              verticalInside: BorderSide(
                                  width: 2,
                                  style: BorderStyle.solid,
                                  color: Color.fromARGB(255, 255, 255, 255))),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                20), // this only make bottom rounded and not top
                            color: const Color.fromARGB(230, 244, 239, 239),
                          ),
                          dividerThickness: 5.0,

                          columnSpacing:
                              MediaQuery.of(context).size.width * .07,
                          // showBottomBorder: true,
                          columns: const [
                            DataColumn(label: Text('Date')),
                            DataColumn(label: Text('Title')),
                            DataColumn(label: Text('Credit')),
                            DataColumn(label: Text('Debit')),
                            DataColumn(label: Text('Balance')),
                          ],
                          rows: box.values.map((transaction) {
                            runningBalance +=
                                transaction.credit - transaction.debit;
                            final isCredit = transaction.credit > 0.0;
                            return DataRow(
                              cells: [
                                DataCell(Text(transaction.date)),
                                DataCell(Text(transaction.particular)),
                                DataCell(Text(transaction.credit.toString())),
                                DataCell(Text(transaction.debit.toString())),
                                DataCell(Text(runningBalance.toString())),
                              ],
                              color: WidgetStateProperty.resolveWith<Color?>(
                                (Set<WidgetState> states) {
                                  return isCredit
                                      ? Colors.green[200]
                                      : Colors.red[200];
                                },
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              addNewTransaction(context: context);
            },
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }

  addNewTransaction({required BuildContext context}) {
    showDialog<void>(
        context: context,
        barrierDismissible: true, // user must tap button!
        builder: (_) {
          return Consumer<ExpansesProvider>(
            builder: (context, provider, child) {
              return AlertDialog(
                alignment: Alignment.center,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                title: const Text(
                  'Add new Transaction',
                  textAlign: TextAlign.center,
                ),
                contentPadding: const EdgeInsets.only(
                  top: 20,
                  left: 20,
                  right: 20,
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: RadioListTile(
                            title: const Text("Credit"),
                            value: "credit",
                            groupValue: provider.type,
                            onChanged: (value) {
                              provider.updateIsCredit(val: true);
                            },
                          ),
                        ),
                        Expanded(
                          child: RadioListTile(
                            title: const Text("Debit"),
                            value: "debit",
                            groupValue: provider.type,
                            onChanged: (value) {
                              provider.updateIsCredit(val: false);
                            },
                          ),
                        )
                      ],
                    ),

                    GestureDetector(
                      onTap: () {
                        provider.changeDate(context: context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 178, 195, 203),
                            borderRadius: BorderRadius.circular(6.0)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(provider.date),
                              const Icon(
                                Icons.calendar_month_sharp,
                                size: 30,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .01,
                    ),
                    // SizedBox(
                    //   width: double.infinity,
                    //   child: ElevatedButton(
                    //       onPressed: () {
                    //         provider.changeDate(context: context);
                    //       },
                    //       child: Text(provider.date)),
                    // ),
                    TextField(
                      controller: provider.amountEditingController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), hintText: "Amount"),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .01,
                    ),
                    TextField(
                      controller: provider.titleEditingController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), hintText: "Title"),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .02,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                  style: ButtonStyle(
                                    // Set different values for style properties
                                    shape: WidgetStateProperty.all<
                                        RoundedRectangleBorder>(
                                      const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(5)),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.all(18.0),
                                    child: Text("Cancel"),
                                  )),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                    // Set different values for style properties
                                    shape: WidgetStateProperty.all<
                                        RoundedRectangleBorder>(
                                      const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(5)),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    final transaction = Transaction(
                                        date: provider.date,
                                        particular: provider
                                            .titleEditingController.text,
                                        credit: provider.isCredit
                                            ? double.parse(provider
                                                .amountEditingController.text
                                                .trim())
                                            : 0.0,
                                        debit: !provider.isCredit
                                            ? double.parse(provider
                                                .amountEditingController.text
                                                .trim())
                                            : 0.0);

                                    provider.addTransaction(transaction).then(
                                      (value) {
                                        Navigator.pop(context);
                                      },
                                    );
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.all(18.0),
                                    child: Text("Save"),
                                  )),
                            )
                          ]),
                    ),
                  ],
                ),
              );
            },
          );
        });
  }
}
