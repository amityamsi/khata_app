import 'package:hive/hive.dart';

part 'transaction.g.dart';

@HiveType(typeId: 0)
class Transaction {
  @HiveField(0)
  final String date;

  @HiveField(1)
  final String particular;

  @HiveField(2)
  final double credit;

  @HiveField(3)
  final double debit;

  @HiveField(4)
  double balance;

  Transaction({
    required this.date,
    required this.particular,
    this.credit = 0.0,
    this.debit = 0.0,
    this.balance = 0.0,
  });

  void calculateBalance(double previousBalance) {
    balance = previousBalance + credit - debit;
  }
}
