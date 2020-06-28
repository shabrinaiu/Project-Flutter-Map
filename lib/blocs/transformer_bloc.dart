import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:maptravo/repositories/repositories.dart';
import 'package:maptravo/models/models.dart';

abstract class TransformerEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class TransformerFetched extends TransformerEvent {}

abstract class TransformerState extends Equatable {
  const TransformerState();

  @override
  List<Object> get props => [];
}

class TransformerInitial extends TransformerState {}

class TransformerLoading extends TransformerState {}

class TransformerFailure extends TransformerState {
  final String errorMessage;

  TransformerFailure(this.errorMessage);
}

class TransformerLoaded extends TransformerState {
  final List<Transformer> transformers;

  TransformerLoaded(this.transformers);
}

class TransformerBloc extends Bloc<TransformerEvent, TransformerState> {
  final TransformerRepository repository;

  TransformerBloc({@required this.repository}) : assert(repository != null);

  @override
  TransformerState get initialState => TransformerInitial();

  @override
  Stream<TransformerState> mapEventToState(TransformerEvent event) async* {
    if (event is TransformerFetched) {
      yield* _mapTransformerFetchedToState(event);
    }
  }

  Stream<TransformerState> _mapTransformerFetchedToState(
    TransformerFetched event,
  ) async* {
    yield TransformerLoading();

    try {
      final List<Transformer> transformerPositions =
          await repository.getTransformers();

      yield TransformerLoaded(transformerPositions);
    } catch (_) {
      yield TransformerFailure("Failed to get data");
    }
  }
}
