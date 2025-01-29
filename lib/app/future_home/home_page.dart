import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tafakkur_test/app/app_bloc/app_bloc.dart';
import 'package:tafakkur_test/app/design_system/design_system.dart';
import 'package:tafakkur_test/app/navigation/app_router.gr.dart';

import '../design_system/widgets/card_widget.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home page')),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 20.h),
          BlocBuilder<CardsCubit, CardsState>(
            builder: (context, state) {
              if (state is CardsLoading) {
                return const CircularProgressIndicator.adaptive();
              } else if (state is CardsLoaded) {
                final images = state.cards;
                if (images.isNotEmpty) {
                  return SizedBox(
                    height: 150.h,
                    child: ListView.separated(
                      shrinkWrap: true,
                      padding: EdgeInsets.symmetric(horizontal: 16.r),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final card = images[index];
                        return InkWell(
                          borderRadius: BorderRadius.circular(16),
                          onTap: () {
                            context.router
                                .push(CardDetailRoute(cardModel: card));
                          },
                          child: CardWidget(
                            gradient: card.gradient,
                            blur: card.blur,
                            color: card.color,
                            asset: card.asset,
                            galleryImage: card.file,
                            name: card.name,
                            cardNumber: card.number,
                            date: card.dateTime,
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          SizedBox(width: 10.r),
                      itemCount: images.length,
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              } else {
                return const SizedBox();
              }
            },
          ),
          SizedBox(height: 20.h),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 16.h),
        child: PrimaryButton(
          onPressed: () {
            context.router.push(CardDetailRoute());
          },
          text: 'Create new card',
        ),
      ),
    );
  }
}
