// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_list.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$productsHash() => r'86253dbe4b9c5b529cd4b37740041dbb562e5cd6';

/// See also [products].
@ProviderFor(products)
final productsProvider = AutoDisposeFutureProvider<List<String>>.internal(
  products,
  name: r'productsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$productsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ProductsRef = AutoDisposeFutureProviderRef<List<String>>;
String _$customProductsHash() => r'ada33b2e5e213c620645240c30b4621502069fc4';

/// See also [CustomProducts].
@ProviderFor(CustomProducts)
final customProductsProvider =
    AutoDisposeAsyncNotifierProvider<CustomProducts, List<String>>.internal(
  CustomProducts.new,
  name: r'customProductsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$customProductsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CustomProducts = AutoDisposeAsyncNotifier<List<String>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
