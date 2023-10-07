import 'package:flutter/material.dart';

enum ViewState {
  done, // 空闲的
  busy, //加载中
  empty, //无数据
  error, //加载失败
}

class ViewStateModel extends ChangeNotifier {
  ViewState _state = ViewState.empty;

  // 防止页面销毁后,异步任务才完成,导致报错
  bool _disposed = false;

  get state => _state;

  set state(state) {
    _state = state;
    notifyListeners();
  }

  void setDone() => state = ViewState.done;

  void setBusy() => state = ViewState.busy;

  void setEmpty() => state = ViewState.empty;

  void setError() => state = ViewState.error;

  @override
  void notifyListeners() {
    if (!_disposed) {
      super.notifyListeners();
    }
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }
}
