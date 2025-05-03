import 'package:equatable/equatable.dart';
import 'package:task_management/core/usecases/common_usecases.dart';
import 'package:task_management/core/utils/api_common_exception.dart';
import 'package:task_management/features/base/base_bloc/data/models/base_model.dart';
import 'package:task_management/features/base/base_bloc/domain/use_cases/base_uc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'base_event.dart';
part 'base_state.dart';

class BaseBloc extends Bloc<BaseEvent, BaseState> {
    final BasedUC basedUC;
  BaseBloc(initialState,this.basedUC) : super(initialState) {
    on<BaseEvent>((event, emit) async{
      if(event is FetchBaseDataEvent){
        await ApiExceptionHandler.handle(
              () async {
            emit(BaseLoadingState());
            final failureOrDashboard = await basedUC(NoParams());
            failureOrDashboard.fold(
                  (failure) {
                emit(BaseFailureState(message: failure.message));
              },
                  (r) {
                emit(BaseSuccessState(baseModel: r));
              },
            );
          },
          emit,
          onFailure: (message) => BaseFailureState(message: message),
        );
      }
    });
  }
}
