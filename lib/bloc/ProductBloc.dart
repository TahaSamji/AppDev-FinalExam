import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myexam/models/Products.dart';
import 'package:myexam/service/FirestoreService.dart';

abstract class ProductEvent {}

class FetchProducts extends ProductEvent {}

// Bloc State
abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<Products> products;
  ProductLoaded(this.products);
}

class ProductError extends ProductState {
  final String error;
  ProductError(this.error);
}

// Update Bloc
class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final FirestoreService _firestoreService;

  ProductBloc(this._firestoreService) : super(ProductInitial()) {
    on<FetchProducts>(_onFetchProducts);
  }

  Future<void> _onFetchProducts(
      FetchProducts event,
      Emitter<ProductState> emit,
      ) async {
    emit(ProductLoading());
    try {
      final products = await _firestoreService.getProducts();
      print(products.length);
      emit(ProductLoaded(products));
    } catch (e) {
      emit(ProductError("Error fetching products: $e"));
    }
  }
}