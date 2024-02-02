part of 'formulir_bloc.dart';

@immutable
abstract class FormulirEvent {}

class AddFormulir extends FormulirEvent {
  final FormModel data;

  AddFormulir(this.data);
}
