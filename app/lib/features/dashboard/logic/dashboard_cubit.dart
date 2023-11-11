import 'package:bloc/bloc.dart';

class DashboardData {
  DashboardData({
    required this.text,
    required this.isActive,
  });

  final String text;
  final bool isActive;
}

class DashboardCubit extends Cubit<DashboardData> {
  DashboardCubit() : super(DashboardData(text: '', isActive: false));



  bool get isActive => state.isActive;

  void setTextField(String value) => emit(
      DashboardData(text: value, isActive: value.isNotEmpty),
  );
}
