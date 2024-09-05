part of 'contact_cubit.dart';

sealed class ContactState {}

final class ContactInitial extends ContactState {}

final class RecentSuccessState extends ContactState {}

final class RecentErrorState extends ContactState {}

final class GetAllNumbersSuccessState extends ContactState {}

final class GetAllNumbersErrorState extends ContactState {}

final class AddContactSuccessState extends ContactState {}

final class AddContactErrorState extends ContactState {}

final class AddToFavoriteSuccessState extends ContactState {}

final class AddToFavoriteErrorState extends ContactState {}
