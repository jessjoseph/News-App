import 'package:bloc/bloc.dart';
import 'package:news_nest/bloc/news_event.dart';
import 'package:news_nest/bloc/news_states.dart';
import 'package:news_nest/repository/news_repository.dart';

class NewsBloc extends Bloc<NewsEvent , NewsState> {
  NewsRepository postRepository  = NewsRepository();

  NewsBloc() :super(NewsState()){
    on<FetchNewsChannelHeadlines>(fetchChannelNews);
    on<NewsCategories>(fetchNewsCategories);

  }

  Future<void> fetchChannelNews(FetchNewsChannelHeadlines event, Emitter<NewsState> emit)async {

    emit(state.copyWith(status: Status.initial));

    await postRepository.fetchNewsChannelHeadlinesApi(event.channelId).then((value){
      emit(
          state.copyWith(
              status: Status.success ,
              newsList: value ,
              message: 'success'
          )
      );
    }).onError((error, stackTrace){
      emit(
          state.copyWith(
              categoriesStatus: Status.failure ,
              categoriesMessage: error.toString()
          )
      );
    });
  }

  Future<void> fetchNewsCategories(NewsCategories event, Emitter<NewsState> emit)async {

    emit(state.copyWith(status: Status.initial));

    await postRepository.fetchNewsCategories(event.category).then((value){
      emit(
          state.copyWith(
              categoriesStatus: Status.success ,
              categoriesNewsModel: value ,
              categoriesMessage: 'success'
          )
      );
    }).onError((error, stackTrace){
      emit(
          state.copyWith(
              categoriesStatus: Status.failure ,
              categoriesMessage: error.toString()
          )
      );
      emit(
          state.copyWith(
              status: Status.failure ,
              message: error.toString()
          )
      );
    });
  }

}