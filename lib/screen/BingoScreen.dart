import 'package:bingo_app/bloc/bloc_event.dart';
import 'package:bingo_app/bloc/bloc_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Strings/strings.dart';
import '../bloc/bingo_bloc.dart';
import 'BoxWidget.dart';

class BingoScreen extends StatefulWidget {
  const BingoScreen({Key? key}) : super(key: key);

  @override
  State<BingoScreen> createState() => _BingoScreenState();
}

class _BingoScreenState extends State<BingoScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BingoBloc(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(Strings.appBarTitle,
            style: TextStyle(
                fontSize: 26, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        body: const BingoTable(),
      ),
    );
  }
}

class BingoTable extends StatefulWidget {
  const BingoTable({Key? key}) : super(key: key);

  @override
  State<BingoTable> createState() => _BingoTableState();
}

class _BingoTableState extends State<BingoTable> {
  @override
  Widget build(BuildContext context) {
    final BingoBloc bingoBloc = BlocProvider.of<BingoBloc>(context);
    return Padding(
      padding: const EdgeInsets.only(top: 50, bottom: 200, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Center(
              child: Text(
            Strings.title,
            style: TextStyle(
              letterSpacing: 3,
              height: 3,
              fontWeight: FontWeight.bold,
              color: Colors.pink,
              fontSize: 32,
            ),
          )),
          BlocBuilder<BingoBloc, BingoState>(
            builder: (context, state) {
              return Flexible(
                child: Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.width - 40,
                  width: MediaQuery.of(context).size.width - 10,
                  decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: GridView.builder(
                        itemCount:25,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 5,childAspectRatio: 1),
                        itemBuilder: (BuildContext context, int index) {
                          return ButtonWidget(
                            buttonTapped: () {
                              bingoBloc
                                  .add(BingoAddNumberEvent(index));
                            },
                            buttonText: state is BingoAddNumberState
                                ? state.userIndexList[index].toString()
                                : "",
                            textColor: Colors.black,index: index,
                          );
                        }),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }


}
