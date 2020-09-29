import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_demo_mvp_02/screen/counter/presenter/counter_presenter.dart';
import 'package:flutter_demo_mvp_02/screen/counter/view/counter_view.dart';
import 'package:flutter_demo_mvp_02/screen/counter/viewmodel/counter_viewmodel.dart';

import 'package:mvp_core/mvp_core.dart';

class CountScreen extends StatefulWidget {
  CountScreen({Key key}) : super(key: key);

  @override
  _CountScreenState createState() => _CountScreenState();
}

class _CountScreenState extends StateView<CountScreen, ICounterPresenter>
    implements ICounterView {
  CounterViewModel _counterViewModel;
  CounterPresenter _counterPresenter;
  @override
  void initState() {
    super.initState();
    this._counterPresenter = createPresenter();
    this._counterPresenter.counterView = this;
  }

  @override
  ICounterPresenter createPresenter() {
    // TODO: implement createPresenter
    return new CounterPresenter();
  }

  @override
  void refreshCounter(CounterViewModel viewModel) {
    // TODO: implement refreshCounter
    setState(() {
      this._counterViewModel = viewModel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Demo'),
      ),
      body: new Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: Text(
                "Click buttons to add and substract.",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FloatingActionButton(
                  onPressed: () {
                    this._counterPresenter.decrementCounter();
                  },
                  tooltip: 'Decrement',
                  child: Icon(Icons.remove),
                ),
                Text(
                  _counterViewModel?.counter.toString(),
                  style: Theme.of(context).textTheme.display1,
                ),
                FloatingActionButton(
                  onPressed: () {
                    this._counterPresenter.incrementCounter();
                  },
                  tooltip: 'Increment',
                  child: Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
