

import 'package:flutter_demo_mvp_02/screen/counter/viewmodel/counter_viewmodel.dart';
import 'package:mvp_core/mvp_core.dart';

/// The interface the presenter will use to communicate with the view.
abstract class ICounterView extends IView {
  void refreshCounter(CounterViewModel viewModel);
}
