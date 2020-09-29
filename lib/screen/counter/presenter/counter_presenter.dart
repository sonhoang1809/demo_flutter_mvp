

import 'package:flutter_demo_mvp_02/screen/counter/view/counter_view.dart';
import 'package:flutter_demo_mvp_02/screen/counter/viewmodel/counter_viewmodel.dart';
import 'package:mvp_core/mvp_core.dart';

/// The interface the view will use to communicate with the presenter.
abstract class ICounterPresenter extends IPresenter {
  void incrementCounter();
  void decrementCounter();
  set counterView(ICounterView value);
}

/// The concrete presenter which updates the view and the model.
class CounterPresenter extends Presenter<ICounterView>
    implements ICounterPresenter {
  CounterViewModel _counterViewModel;
  ICounterView _counterView;
  CounterPresenter() {
    this._counterViewModel = new CounterViewModel(0);
  }
  @override
  void set counterView(ICounterView value) {
    // TODO: implement counterView
    this._counterView = value;
    this._counterView.refreshCounter(this._counterViewModel);
  }

  @override
  void decrementCounter() {
    // TODO: implement decrementCounter
    this._counterViewModel.counter--;
    this._counterView.refreshCounter(this._counterViewModel);
  }

  @override
  void incrementCounter() {
    // TODO: implement incrementCounter
    this._counterViewModel.counter++;
    this._counterView.refreshCounter(this._counterViewModel);
  }
}
