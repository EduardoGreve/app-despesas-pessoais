import 'package:flutter/material.dart';
import '../models/transaction.dart';
import './transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _transaction;
  final void Function(String) onRemove;
  TransactionList(this._transaction, this.onRemove);

  @override
  Widget build(BuildContext context) {
    return _transaction.isEmpty
        ? LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                children: <Widget>[
                  const SizedBox(height: 20),
                  const Text(
                    'Nenhum transação cadastrada',
                    style: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 25),
                  Container(
                    height: constraints.maxHeight * 0.4,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              );
            },
          )
        : ListView.builder(
            itemCount: _transaction.length,
            itemBuilder: (ctx, index) {
              final tr = _transaction[index];
              return TransactionItem(tr: tr, onRemove: onRemove);
            },
          );
  }
}


