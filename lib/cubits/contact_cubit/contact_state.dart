part of 'contact_cubit.dart';

sealed class ContactState {}

final class ContactInitial extends ContactState {}

//recent states
final class GetRecentSuccessState extends ContactState {}

final class GetRecentErrorState extends ContactState {}

final class AddRecentErrorState extends ContactState {}

final class RemoveRecentSuccessState extends ContactState {}

final class RemoveRecentErrorState extends ContactState {}

//favorite states
final class GetFavoriteSuccessState extends ContactState {}

final class GetFavoriteErrorState extends ContactState {}

//Contacts Page
final class GetAllNumbersSuccessState extends ContactState {}

final class GetAllNumbersErrorState extends ContactState {}

final class RemoveNumbersState extends ContactState {}

final class RemoveNumbersErrorState extends ContactState {}

final class UpdateNumbersState extends ContactState {}

final class UpdateNumbersErrorState extends ContactState {}

// add states
final class AddContactSuccessState extends ContactState {}

final class AddContactErrorState extends ContactState {}

final class AddToFavoriteSuccessState extends ContactState {}

final class AddToFavoriteErrorState extends ContactState {}

// chose label phone

final class ChoseLabelPhoneState extends ContactState {}

final class ChoseLabelSignificantState extends ContactState {}
