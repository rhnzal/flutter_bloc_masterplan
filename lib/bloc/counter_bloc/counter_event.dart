sealed class CounterEvent {}

final class CounterIncrementPressed extends CounterEvent{}

final class CounterDecrementPressed extends CounterEvent{
  int value;
  
  CounterDecrementPressed(this.value);
}