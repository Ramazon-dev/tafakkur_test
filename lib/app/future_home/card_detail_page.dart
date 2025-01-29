import 'dart:io';
import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tafakkur_test/app/app_bloc/app_bloc.dart';
import 'package:tafakkur_test/app/design_system/widgets/card_widget.dart';
import 'package:tafakkur_test/domain/core/extentions.dart';
import 'package:tafakkur_test/domain/model/card_model.dart';

import '../design_system/design_system.dart';

@RoutePage()
class CardDetailPage extends StatefulWidget implements AutoRouteWrapper {
  final CardModel? cardModel;

  const CardDetailPage({super.key, this.cardModel});

  @override
  State<CardDetailPage> createState() => _CardDetailPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppBlocHelper.getCardCubit()),
      ],
      child: this,
    );
  }
}

class _CardDetailPageState extends State<CardDetailPage> {
  final List<String> images = [
    AppAssets.card,
    AppAssets.blur,
    AppAssets.blue,
    AppAssets.desert,
    AppAssets.effect,
    AppAssets.gradient,
    AppAssets.holiday,
    AppAssets.mat,
    AppAssets.texture,
  ];

  final List<Color> colors = [
    Colors.yellow,
    Colors.cyan,
    Colors.grey,
    Colors.blue,
    Colors.red,
    Colors.teal,
    Colors.green,
    Colors.brown,
    Colors.amber,
    Colors.indigo,
    Colors.greenAccent,
    Colors.lime,
  ];

  final List<Gradient> gradients = [
    const LinearGradient(
      colors: [Colors.yellow, Colors.grey],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ),
    const LinearGradient(
      colors: [Colors.cyan, Colors.teal],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ),
    const LinearGradient(
      colors: [Colors.brown, Colors.greenAccent],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ),
    const LinearGradient(
      colors: [Colors.cyanAccent, Colors.blue],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ),
  ];

  final formKey = GlobalKey<FormState>();

  final cardNumberFormatter = MaskTextInputFormatter(
    mask: '#### #### #### ####',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );
  final dateFormatter = MaskTextInputFormatter(
    mask: '##/##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  @override
  void initState() {
    final card = widget.cardModel;
    final cubit = context.read<CardCubit>();
    if (card != null) {
      cubit.fetchData(
        name: card.name,
        number: card.number,
        date: card.dateTime,
        blur: card.blur,
        file: card.file,
        color: card.color,
        gradient: card.gradient,
        asset: card.asset,
      );
      // nameController.text = card.name;
      // nameNotifier.value = card.name;
      // cardNumberController.text = card.number;
      // dateController.text = card.dateTime;
      // galleryImageNotifier.value = card.file;
      // imageNotifier.value = card.asset;
      // gradientNotifier.value = card.gradient;
      // colorNotifier.value = card.color;
      // blurFilterNotifier.value = card.blur;
    }
    if (cubit.state.color == null &&
        cubit.state.asset == null &&
        cubit.state.gradient == null &&
        cubit.state.file == null) {
      final random = Random().nextInt(colors.length);
      cubit.changeColor(colors[random]);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CardCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card Detail page'),
        actions: [
          IconButton(
            onPressed: () async {
              await _pickImage(ImageSource.gallery);
              // final some = Colors.cyanAccent.toHex();
              // print('object hex ${some.replaceAll('#', '')}');
              // final color = HexColor.fromHex(some);
              // print('object color $color');
            },
            icon: const Icon(Icons.image),
          ),
        ],
      ),
      body: BlocBuilder<CardCubit, CardModel>(
        builder: (context, state) {
          print('object card cubit changed ${state.name}');
          return SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20.h),
                  CardWidget(
                    gradient: state.gradient,
                    blur: state.blur,
                    color: state.color,
                    asset: state.asset,
                    galleryImage: state.file,
                    name: state.name,
                    cardNumber: state.number,
                    date: state.dateTime,
                  ),
                  SizedBox(height: 20.h),
                  SizedBox(
                    height: 80.h,
                    child: ListView.separated(
                      shrinkWrap: true,
                      padding: EdgeInsets.symmetric(horizontal: 16.r),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => InkWell(
                        borderRadius: BorderRadius.circular(16),
                        onTap: () {
                          cubit.changeAsset(images[index]);
                          // imageNotifier.value = images[index];
                          // galleryImageNotifier.value = null;
                          // colorNotifier.value = null;
                          // gradientNotifier.value = null;
                        },
                        child: Container(
                          height: 80.h,
                          width: 0.4.sw,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.r),
                            color: Colors.yellow,
                            image: DecorationImage(
                              image: AssetImage(images[index]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      separatorBuilder: (context, index) =>
                          SizedBox(width: 10.r),
                      itemCount: images.length,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: 16.r),
                    child: SizedBox(
                      height: 40.h,
                      child: Row(
                        children: [
                          ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => InkWell(
                              borderRadius: BorderRadius.circular(16.r),
                              onTap: () {
                                cubit.changeGradient(gradients[index]);
                                // gradientNotifier.value = gradients[index];
                                // galleryImageNotifier.value = null;
                                // colorNotifier.value = null;
                                // imageNotifier.value = null;
                              },
                              child: Container(
                                height: 40.h,
                                width: 40.r,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.r),
                                  gradient: gradients[index],
                                ),
                              ),
                            ),
                            separatorBuilder: (context, index) =>
                                SizedBox(width: 10.r),
                            itemCount: gradients.length,
                          ),
                          SizedBox(width: 10.r),
                          ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => InkWell(
                              borderRadius: BorderRadius.circular(16.r),
                              onTap: () {
                                cubit.changeColor(colors[index]);
                                // colorNotifier.value = colors[index];
                                // galleryImageNotifier.value = null;
                                // imageNotifier.value = null;
                                // gradientNotifier.value = null;
                              },
                              child: CircleAvatar(
                                backgroundColor: colors[index],
                                radius: 20.r,
                              ),
                            ),
                            separatorBuilder: (context, index) =>
                                SizedBox(width: 10.r),
                            itemCount: colors.length,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Slider(
                    min: 0,
                    max: 10,
                    value: state.blur,
                    onChanged: (value) {
                      cubit.changeBlur(value);
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.r),
                    child: Column(
                      children: [
                        SizedBox(height: 20.h),
                        TextFormField(
                          controller: cubit.nameController,
                          textCapitalization: TextCapitalization.sentences,
                          onChanged: (value) {
                            context.read<CardCubit>().changeName(value);
                            // nameNotifier.value = value;
                          },
                          validator: (value) {
                            if (value.isNotNullOrEmpty) {
                              return null;
                            }
                            return 'card name must be filled';
                          },
                          decoration: InputDecorationAuth(
                            hintText: 'name',
                            hintStyle: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.teal,
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        TextFormField(
                          controller: cubit.cardNumberController,
                          inputFormatters: [cardNumberFormatter],
                          onChanged: (value) {
                            cubit.changeCardNumber(value);
                          },
                          validator: (value) {
                            if (value?.length != 19) {
                              return 'card number must be filled';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.number,
                          decoration: InputDecorationAuth(
                            hintText: 'card number',
                            hintStyle: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.teal,
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        TextFormField(
                          controller: cubit.dateController,
                          inputFormatters: [
                            dateFormatter,
                            FilteringTextInputFormatter.digitsOnly,
                            DateInputFormatter(),
                          ],
                          validator: (value) {
                            if (value?.length != 5) {
                              return 'date must be filled';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            cubit.changeDate(value);
                          },
                          keyboardType: TextInputType.number,
                          decoration: InputDecorationAuth(
                            hintText: 'date',
                            hintStyle: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.teal,
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 16.h),
        child: BlocListener<CardsCubit, CardsState>(
          listener: (context, state) {
            if (state is CardsLoaded) {
              context.router.maybePop();
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SecondaryButton(
                size: Size(0.4.sw, 50.h),
                onPressed: () async {
                  final id = widget.cardModel?.id;
                  if (id != null) {
                    context.read<CardsCubit>().delete(id);
                  }
                },
                text: 'Delete',
              ),
              SizedBox(height: 20.h),
              PrimaryButton(
                onPressed: () async {
                  if (formKey.currentState?.validate() == true) {
                    if (widget.cardModel != null) {
                      final model = CardModel(
                        id: widget.cardModel?.id ?? 0,
                        name: cubit.state.name,
                        number: cubit.state.number,
                        dateTime: cubit.state.dateTime,
                        file: cubit.state.file,
                        gradient: cubit.state.gradient,
                        asset: cubit.state.asset,
                        color: cubit.state.color,
                        blur: cubit.state.blur,
                      );
                      context
                          .read<CardsCubit>()
                          .update(model, widget.cardModel?.id ?? 0);
                    } else {
                      final model = CardModel(
                        name: cubit.state.name,
                        number: cubit.state.number,
                        dateTime: cubit.state.dateTime,
                        file: cubit.state.file,
                        gradient: cubit.state.gradient,
                        asset: cubit.state.asset,
                        color: cubit.state.color,
                        blur: cubit.state.blur,
                      );
                      context.read<CardsCubit>().add(model);
                    }
                  }
                },
                text: 'Save',
                size: Size(0.4.sw, 50.h),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future _pickImage(ImageSource source) async {
    final navigator = Navigator.of(context);
    final cubit = context.read<CardCubit>();
    try {
      final image = await ImagePicker().pickImage(
        source: source,
        imageQuality: 50,
      );
      if (image != null) {
        File img = File(image.path);
        img = await cropImage(img);
        final fileBytes = await img.readAsBytes();
        final filePath = image.path;
        await img.writeAsBytes(fileBytes);
        cubit.changeFile(filePath);
      }
    } on PlatformException catch (e) {
      debugPrint('eeeeeeeeeeeerror $e');
      navigator.pop();
    }
  }

  Future<File> cropImage(File imageFile) async {
    final CroppedFile? croppedImage = await ImageCropper().cropImage(
      sourcePath: imageFile.path,
      compressFormat: ImageCompressFormat.png,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'card background image',
          toolbarColor: Colors.white,
          hideBottomControls: true,
          showCropGrid: true,
          statusBarColor: Colors.white,
          toolbarWidgetColor: Colors.black,
          initAspectRatio: CropAspectRatioPreset.ratio3x2,
          lockAspectRatio: true,
          activeControlsWidgetColor: Colors.white,
          cropFrameColor: Colors.white,
        ),
        IOSUiSettings(
          minimumAspectRatio: 1.0,
        ),
      ],
    );
    if (croppedImage == null) return imageFile;
    return File(croppedImage.path);
  }
}
