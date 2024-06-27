import 'dart:math';
import 'package:bmi/controller/bmi_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BmiView extends StatefulWidget {
  const BmiView({super.key});

  @override
  State<BmiView> createState() => _BmiViewState();
}

class _BmiViewState extends State<BmiView> {
  final BmiController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.bmi,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  // ignore: avoid_unnecessary_containers
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        controller.changeGender(true);
                      },
                      child: Obx(
                        () => Container(
                            height: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: controller.isMale.value
                                    ? Colors.blue
                                    : Colors.grey),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.male,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Icon(
                                  Icons.male,
                                  size: 50.0,
                                ),
                              ],
                            )),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 30.0,
                  ),
                  // ignore: avoid_unnecessary_containers
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        controller.changeGender(false);
                        setState(() {});
                      },
                      child: Obx(
                        () => Container(
                          height: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: controller.isMale.value
                                  ? Colors.grey
                                  : Colors.pink),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.female,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              const Icon(
                                Icons.female,
                                size: 50.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              // ignore: avoid_unnecessary_containers
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade300),
                child: Column(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.height,
                      style: const TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w500),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Obx(
                          () => Text(
                            '${controller.height.round()}',
                            style: const TextStyle(
                                fontSize: 25.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          AppLocalizations.of(context)!.cm,
                          style: const TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                      ],
                    ),
                    Slider(
                        activeColor: Colors.deepOrange,
                        min: 80,
                        max: 220,
                        value: controller.height.value,
                        onChanged: (val) {
                          setState(() {
                            controller.height.value = val;
                          });
                        }),
                  ],
                ),
              ),
              const SizedBox(
                height: 50.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.weight,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Obx(
                            () => Text(
                              '${controller.weight}',
                              style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.deepOrange,
                                child: IconButton(
                                  icon: const Icon(Icons.add),
                                  onPressed: () {
                                    controller.incrementWeight();
                                  },
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              CircleAvatar(
                                backgroundColor: Colors.deepOrange,
                                child: IconButton(
                                  icon: const Icon(Icons.remove),
                                  onPressed: () {
                                    controller.decrementWeight();
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Expanded(
                    child: Container(
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.age,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Obx(
                            () => Text(
                              '${controller.age}',
                              style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.deepOrange,
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.add,
                                  ),
                                  onPressed: () {
                                    controller.incrementAge();
                                  },
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              CircleAvatar(
                                backgroundColor: Colors.deepOrange,
                                child: IconButton(
                                  icon: const Icon(Icons.remove),
                                  onPressed: () {
                                    controller.decrementAge();
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 20,
              ),

              MaterialButton(
                minWidth: double.infinity,
                color: Colors.deepOrange,
                onPressed: () {
                  String message;
                  var result =
                      controller.weight / pow(controller.height / 100, 2);
                  if (result < 18.5) {
                    message = 'Underweight.';
                  } else if (result >= 18.5 && result < 24.9) {
                    message = 'Normal.';
                  } else if (result >= 25 && result < 29.9) {
                    message = 'Overweight.';
                  } else {
                    message = 'Obese.';
                  }

                  Get.defaultDialog(
                    title: AppLocalizations.of(context)!.result,
                    content: Text(
                      '${AppLocalizations.of(context)!.your}: ${result.toStringAsFixed(2)}\n\n${AppLocalizations.of(context)!.message}: $message',
                    ),
                    confirm: TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text(AppLocalizations.of(context)!.ok),
                    ),
                  );
                },
                child: Text(
                  AppLocalizations.of(context)!.calculate,
                  style: const TextStyle(fontSize: 20.0),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  child: Column(
                    children: [
                      RadioListTile(
                          activeColor: Colors.deepOrange,
                          title: Text(
                            AppLocalizations.of(context)!.en,
                            style: TextStyle(fontSize: 20),
                          ),
                          value: 'en',
                          groupValue: controller.selectedLang.value,
                          onChanged: (val) {
                            controller.changeLang(val!);
                          }),
                      RadioListTile(
                          activeColor: Colors.deepOrange,
                          title: Text(
                            AppLocalizations.of(context)!.ar,
                            style: TextStyle(fontSize: 20),
                          ),
                          value: 'ar',
                          groupValue: controller.selectedLang.value,
                          onChanged: (val) {
                            controller.changeLang(val!);
                          }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
