import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:khata_app/app/services/hive/transaction.dart';

class AddTransactionForm extends StatefulWidget {
  const AddTransactionForm({super.key});

  @override
  _AddTransactionFormState createState() => _AddTransactionFormState();
}

class _AddTransactionFormState extends State<AddTransactionForm> {
  final _formKey = GlobalKey<FormState>();
  final _dateController = TextEditingController();
  final _particularController = TextEditingController();
  final _creditController = TextEditingController();
  final _debitController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Transaction')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _dateController,
                decoration: const InputDecoration(labelText: 'Date'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a date';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _particularController,
                decoration: const InputDecoration(labelText: 'Particular'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a particular';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _creditController,
                decoration: const InputDecoration(labelText: 'Credit'),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: _debitController,
                decoration: const InputDecoration(labelText: 'Debit'),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final transaction = Transaction(
                      date: _dateController.text,
                      particular: _particularController.text,
                      credit: _creditController.text.isEmpty
                          ? 0.0
                          : double.parse(_creditController.text),
                      debit: _debitController.text.isEmpty
                          ? 0.0
                          : double.parse(_debitController.text),
                    );
                    addTransaction(transaction);
                    Navigator.pop(context);
                  }
                },
                child: const Text('Add Transaction'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void addTransaction(Transaction transaction) {
    final box = Hive.box<Transaction>('transactions');
    box.add(transaction);
  }
}
