import 'package:flutter/material.dart';
import 'package:kliq_movies/core/widgets/custom_shimmer.dart';

class NewsLoadingWidget extends StatelessWidget {
  const NewsLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            CustomShimmer(
              widget: Container(
                decoration: const BoxDecoration(
                  color: Colors.grey,
                ),
                width: 120,
                height: 150,
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomShimmer(
                      widget: Container(
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                        ),
                        width: double.infinity,
                        height: 30,
                      ),
                    ),
                    CustomShimmer(
                      widget: Container(
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                        ),
                        width: double.infinity,
                        height: 30,
                      ),
                    ),
                    CustomShimmer(
                      widget: Container(
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                        ),
                        width: double.infinity,
                        height: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
