import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _userTransactions;

  TransactionList(this._userTransactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: _userTransactions.isEmpty
          ? Column(children: <Widget>[
              Text(
                'No transactions added yet!',
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                height: 200,
                child: Image.asset(
                  'assets/images/empty.png',
                  fit: BoxFit.cover,
                ),
              ),
            ])
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 100.0,
                        margin: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 15,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).primaryColor,
                            width: 2,
                          ),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          '\$${_userTransactions[index].amount.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            _userTransactions[index].title,
                            style: Theme.of(context).textTheme.headline6,
                            // TextStyle(
                            //  fontSize: 18,
                            //  fontWeight: FontWeight.bold,
                            //),
                          ),
                          Text(
                            DateFormat.yMMMMd('en_US')
                                .add_jm()
                                .format(_userTransactions[index].date),
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
              itemCount: _userTransactions.length,
//        children: _userTransactions.map((tx) {
//        }).toList(),
            ),
    );
  }
}
