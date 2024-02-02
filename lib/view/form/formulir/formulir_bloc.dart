import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:spreadsheet/data/model/form_model.dart';
import 'package:spreadsheet/data/service/form_service.dart';

part 'formulir_event.dart';
part 'formulir_state.dart';

class FormulirBloc extends Bloc<FormulirEvent, FormulirState> {
  final FormService service;

  FormulirBloc(this.service) : super(FormulirInitial()) {
    on<AddFormulir>((event, emit) async {
      try {
        emit(FormulirLoading());
        await service.postData(event.data);
        emit(FormulirSuccess('Formulir berhasil ditambahkan.'));
      } catch (e) {
        emit(FormulirFailed('Gagal mengupload data.'));
      }
    });
  }
}
