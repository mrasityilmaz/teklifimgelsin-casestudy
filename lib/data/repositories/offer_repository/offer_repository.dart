import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_coding_setup/core/errors/errors.dart';
import 'package:my_coding_setup/core/extensions/dartz_extension.dart';
import 'package:my_coding_setup/core/platform/network_info.dart';
import 'package:my_coding_setup/data/models/offer_response_model/offers_response_model.dart';
import 'package:my_coding_setup/data/models/search_params_model/search_params_model.dart';
import 'package:my_coding_setup/domain/repositories/offer_repository/data_sources/ilocal_repository.dart';
import 'package:my_coding_setup/domain/repositories/offer_repository/data_sources/iremote_repository.dart';
import 'package:my_coding_setup/domain/repositories/offer_repository/i_offer_repository.dart';

@LazySingleton(as: IOfferRepository)
final class OfferRepository implements IOfferRepository {
  const OfferRepository({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });
  final IOfferRemoteRepository remoteDataSource;
  final IOfferLocalRepository localDataSource;
  final NetworkInfo networkInfo;

  @override
  Future<DataModel<OffersResponseModel>> getLoanOffers({required SearchParamsModel searchParams}) async {
    if (await networkInfo.isConnected) {
      return remoteDataSource.getLoanOffers(searchParams: searchParams);
    } else {
      return Left(NetworkFailure());
    }
  }
}
