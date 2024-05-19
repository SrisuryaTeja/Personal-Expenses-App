import 'package:flutter/material.dart';
import '../models/transaction.dart';
import './Transaction_Item.dart';

class TranscationList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;
  TranscationList(this.transactions, this.deleteTx);
  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: [
                Text('No transactions added yet'),
                SizedBox(
                  height: 50,
                ),
                Container(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                    // height: 300,
                  ),
                )
              ],
            );
          })
        : Container(
            height: 430,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return TransactionItem(transaction: transactions[index], deleteTx: deleteTx);
              },
              itemCount: transactions.length,
            ),
          );
  }
}

