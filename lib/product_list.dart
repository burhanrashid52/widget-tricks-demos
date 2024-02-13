import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:network_curl/network_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_list.g.dart';

@riverpod
Future<List<String>> products(ProductsRef ref) {
  Timer(const Duration(seconds: 5), () {
    print("Refresh");
    ref.invalidateSelf();
  });
  return getProducts();
}

@riverpod
class CustomProducts extends _$CustomProducts {
  @override
  Future<List<String>> build() {
    Timer(const Duration(seconds: 5), () {
      print("Refresh");
      ref.invalidateSelf();
    });
    return getProducts();
  }
}

class ProductListPage extends ConsumerWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final product = ref.watch(customProductsProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Product List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: product.when(
          skipLoadingOnRefresh: false,
          data: (data) => ListView.builder(
            itemCount: data.length,
            itemBuilder: (_, index) => ListTile(
              title: Text(
                data[index],
              ),
            ),
          ),
          error: (e, s) => Center(
            child: Text(
              e.toString(),
            ),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
