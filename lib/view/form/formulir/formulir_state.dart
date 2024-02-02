part of 'formulir_bloc.dart';

@immutable
abstract class FormulirState {}

class FormulirInitial extends FormulirState {}

class FormulirLoading extends FormulirState {}

class FormulirSuccess extends FormulirState {
  final String message;

  FormulirSuccess(this.message);
}

class FormulirFailed extends FormulirState {
  final String errorMessage;

  FormulirFailed(this.errorMessage);
}
