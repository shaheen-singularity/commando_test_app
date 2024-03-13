import 'package:commando_test_app/core/utils/resource_ui_state.dart';
import 'package:commando_test_app/core/view/app_toast.dart';
import 'package:commando_test_app/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:toggle_switch/toggle_switch.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  String status = "inactive";

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return Obx(() => Scaffold(
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          const Gap(64),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: controller.regNumberController,
                                  onChanged: (value) {
                                    controller.regNumber(int.parse(value));
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'Enter device ID',
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 16.0, horizontal: 12.0),
                                    border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(16.0)),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: colorScheme.primary,
                                          width: 1.0),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(16.0)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: colorScheme.primary,
                                          width: 2.0),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(16.0)),
                                    ),
                                  ),
                                ),
                              ),
                              const Gap(8),
                              Obx(
                                () => Container(
                                  height: 50,
                                  child: FilledButton(
                                      style: ButtonStyle(
                                        shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                          ),
                                        ),
                                      ),
                                      onPressed: () {
                                        if (controller.regNumberController.text
                                            .isNotEmpty) {
                                          controller.onReset();
                                        } else {
                                          AppToast.showError(
                                              "Please enter valid ID first");
                                        }
                                      },
                                      child: controller.resetState ==
                                              Status.loading
                                          ? const SizedBox(
                                              height: 20,
                                              width: 20,
                                              child: CircularProgressIndicator(
                                                color: Colors.white,
                                                strokeWidth: 3,
                                              ),
                                            )
                                          : const Text('Reset')),
                                ),
                              )
                            ],
                          ),
                          const Gap(8),
                          controller.updateStateFire == Status.loading ||
                                  controller.updateStateSmoke ==
                                      Status.loading ||
                                  controller.updateStateShutter ==
                                      Status.loading ||
                                  controller.updateStateMotion ==
                                      Status.loading ||
                                  controller.updateStatePower == Status.loading
                              ? Center(
                                  child: Column(
                                    children: [
                                      Gap(20),
                                      const Text('Please wait'),
                                      SpinKitCircle(
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return DecoratedBox(
                                            decoration: BoxDecoration(
                                              color: index.isEven
                                                  ? Colors.black
                                                  : Colors.black,
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                )
                              : Column(
                                  children: [
                                    Card(
                                      child: ListTile(
                                        onTap: null,
                                        title: Text(
                                          "Fire",
                                          style: textTheme.headlineSmall
                                              ?.copyWith(color: Colors.black),
                                        ),
                                        trailing: ToggleSwitch(
                                          minWidth: 55,
                                          minHeight: 35.0,
                                          initialLabelIndex: controller
                                                      .fireSensorUpdateStatus
                                                      .value ==
                                                  true
                                              ? 1
                                              : 0,
                                          cornerRadius: 8.0,
                                          activeFgColor: Colors.white,
                                          inactiveBgColor: Colors.grey,
                                          inactiveFgColor: Colors.white,
                                          totalSwitches: 2,
                                          labels: const ["Off", "On"],
                                          fontSize: 8,
                                          customTextStyles: const [
                                            TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16)
                                          ],
                                          activeBgColors: const [
                                            [Colors.red],
                                            [Colors.green]
                                          ],
                                          animate: true,
                                          changeOnTap: controller
                                              .fireSensorUpdateStatus.value,
                                          curve: Curves.easeOut,
                                          onToggle: (index) {
                                            if ((index == 0 &&
                                                    controller
                                                            .fireSensorUpdateStatus
                                                            .value ==
                                                        false) ||
                                                (index == 1 &&
                                                    controller
                                                            .fireSensorUpdateStatus
                                                            .value ==
                                                        true)) {
                                              return;
                                            }

                                            if (index == 0) {
                                              controller.value(index);
                                              controller.sensorType('E');
                                              controller.onUpdateFire();
                                            } else if (index == 1) {
                                              if (controller.regNumberController
                                                      .text.isNum &&
                                                  controller.regNumberController
                                                      .text.isNotEmpty) {
                                                controller.value(index);
                                                controller.sensorType('E');
                                                controller.onUpdateFire();
                                              } else {
                                                AppToast.showError(
                                                    "Please enter a valid ID first");
                                              }
                                            }
                                          },
                                        ),
                                      ),
                                    ),
                                    const Gap(8),
                                    Card(
                                      child: ListTile(
                                        // tileColor: colorScheme.primaryContainer,
                                        onTap: null,
                                        title: Text(
                                          "Smoke",
                                          style: textTheme.headlineSmall
                                              ?.copyWith(color: Colors.black),
                                        ),
                                        trailing: ToggleSwitch(
                                          minWidth: 55,
                                          minHeight: 35.0,
                                          initialLabelIndex: controller
                                                      .smokeSensorUpdateStatus
                                                      .value ==
                                                  true
                                              ? 1
                                              : 0,
                                          cornerRadius: 8.0,
                                          activeFgColor: Colors.white,
                                          inactiveBgColor: Colors.grey,
                                          inactiveFgColor: Colors.white,
                                          totalSwitches: 2,
                                          labels: const ["Off", "On"],
                                          fontSize: 8,
                                          customTextStyles: const [
                                            TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16)
                                          ],
                                          activeBgColors: const [
                                            [Colors.red],
                                            [Colors.green]
                                          ],
                                          animate: true,
                                          changeOnTap: controller
                                              .smokeSensorUpdateStatus.value,
                                          curve: Curves.easeOut,
                                          onToggle: (index) {
                                            if ((index == 0 &&
                                                    controller
                                                            .smokeSensorUpdateStatus
                                                            .value ==
                                                        false) ||
                                                (index == 1 &&
                                                    controller
                                                            .smokeSensorUpdateStatus
                                                            .value ==
                                                        true)) {
                                              return;
                                            }

                                            if (index == 0) {
                                              controller.value(index);
                                              controller.sensorType('D');
                                              controller.onUpdateSmoke();
                                            } else if (index == 1) {
                                              if (controller.regNumberController
                                                      .text.isNum &&
                                                  controller.regNumberController
                                                      .text.isNotEmpty) {
                                                controller.value(index);
                                                controller.sensorType('D');
                                                controller.onUpdateSmoke();
                                              } else {
                                                AppToast.showError(
                                                    "Please enter a valid ID first");
                                              }
                                            }
                                          },
                                        ),
                                      ),
                                    ),
                                    const Gap(8),
                                    Card(
                                      child: ListTile(
                                        // tileColor: colorScheme.primaryContainer,
                                        onTap: null,
                                        title: Text(
                                          "Shutter",
                                          style: textTheme.headlineSmall
                                              ?.copyWith(color: Colors.black),
                                        ),
                                        trailing: ToggleSwitch(
                                          minWidth: 55,
                                          minHeight: 35.0,
                                          initialLabelIndex: controller
                                                      .shutterSensorUpdateStatus
                                                      .value ==
                                                  true
                                              ? 1
                                              : 0,
                                          cornerRadius: 8.0,
                                          activeFgColor: Colors.white,
                                          inactiveBgColor: Colors.grey,
                                          inactiveFgColor: Colors.white,
                                          totalSwitches: 2,
                                          labels: const ["Off", "On"],
                                          fontSize: 8,
                                          customTextStyles: const [
                                            TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16)
                                          ],
                                          activeBgColors: const [
                                            [Colors.red],
                                            [Colors.green]
                                          ],
                                          animate: true,
                                          curve: Curves.easeOut,
                                          changeOnTap: controller
                                              .shutterSensorUpdateStatus.value,
                                          onToggle: (index) {
                                            if ((index == 0 &&
                                                    controller
                                                            .shutterSensorUpdateStatus
                                                            .value ==
                                                        false) ||
                                                (index == 1 &&
                                                    controller
                                                            .shutterSensorUpdateStatus
                                                            .value ==
                                                        true)) {
                                              return;
                                            }

                                            if (index == 0) {
                                              controller.value(index);
                                              controller.sensorType('C');
                                              controller.onUpdateShutter();
                                            } else if (index == 1) {
                                              if (controller.regNumberController
                                                      .text.isNum &&
                                                  controller.regNumberController
                                                      .text.isNotEmpty) {
                                                controller.value(index);
                                                controller.sensorType('C');
                                                controller.onUpdateShutter();
                                              } else {
                                                AppToast.showError(
                                                    "Please enter a valid ID first");
                                              }
                                            }
                                          },
                                        ),
                                      ),
                                    ),
                                    const Gap(8),
                                    Card(
                                      child: ListTile(
                                          // tileColor: colorScheme.primaryContainer,
                                          onTap: null,
                                          title: Text(
                                            "Motion",
                                            style: textTheme.headlineSmall
                                                ?.copyWith(color: Colors.black),
                                          ),
                                          trailing: ToggleSwitch(
                                            minWidth: 55,
                                            minHeight: 35.0,
                                            initialLabelIndex: controller
                                                        .motionSensorUpdateStatus
                                                        .value ==
                                                    true
                                                ? 1
                                                : 0,
                                            cornerRadius: 8.0,
                                            activeFgColor: Colors.white,
                                            inactiveBgColor: Colors.grey,
                                            inactiveFgColor: Colors.white,
                                            totalSwitches: 2,
                                            labels: const ["Off", "On"],
                                            fontSize: 8,
                                            customTextStyles: const [
                                              TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16)
                                            ],
                                            activeBgColors: const [
                                              [Colors.red],
                                              [Colors.green]
                                            ],
                                            animate: true,
                                            curve: Curves.easeOut,
                                            changeOnTap: controller
                                                .motionSensorUpdateStatus.value,
                                            onToggle: (index) {
                                              if ((index == 0 &&
                                                      controller
                                                              .motionSensorUpdateStatus
                                                              .value ==
                                                          false) ||
                                                  (index == 1 &&
                                                      controller
                                                              .motionSensorUpdateStatus
                                                              .value ==
                                                          true)) {
                                                return;
                                              }

                                              if (index == 0) {
                                                controller.value(index);
                                                controller.sensorType('F');
                                                controller.onUpdateMotion();
                                              } else if (index == 1) {
                                                if (controller
                                                        .regNumberController
                                                        .text
                                                        .isNum &&
                                                    controller
                                                        .regNumberController
                                                        .text
                                                        .isNotEmpty) {
                                                  controller.value(index);
                                                  controller.sensorType('F');
                                                  controller.onUpdateMotion();
                                                } else {
                                                  AppToast.showError(
                                                      "Please enter a valid ID first");
                                                }
                                              }
                                            },
                                          )),
                                    ),
                                    const Gap(8),
                                    Card(
                                      child: ListTile(
                                          // tileColor: colorScheme.primaryContainer,
                                          onTap: null,
                                          title: Text(
                                            "Power",
                                            style: textTheme.headlineSmall
                                                ?.copyWith(color: Colors.black),
                                          ),
                                          trailing: ToggleSwitch(
                                            minWidth: 55,
                                            minHeight: 35.0,
                                            initialLabelIndex: controller
                                                        .powerSensorUpdateStatus
                                                        .value ==
                                                    true
                                                ? 1
                                                : 0,
                                            cornerRadius: 8.0,
                                            activeFgColor: Colors.white,
                                            inactiveBgColor: Colors.grey,
                                            inactiveFgColor: Colors.white,
                                            totalSwitches: 2,
                                            labels: const ["Off", "On"],
                                            fontSize: 8,
                                            customTextStyles: const [
                                              TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16)
                                            ],
                                            activeBgColors: const [
                                              [Colors.red],
                                              [Colors.green]
                                            ],
                                            animate: true,
                                            curve: Curves.easeOut,
                                            changeOnTap: controller
                                                .powerSensorUpdateStatus.value,
                                            onToggle: (index) {
                                              if ((index == 0 &&
                                                      controller
                                                              .powerSensorUpdateStatus
                                                              .value ==
                                                          false) ||
                                                  (index == 1 &&
                                                      controller
                                                              .powerSensorUpdateStatus
                                                              .value ==
                                                          true)) {
                                                return;
                                              }
                                              if (index == 0) {
                                                controller.value(index);
                                                controller.sensorType('K');
                                                controller.onUpdatePower();
                                              } else if (index == 1) {
                                                if (controller
                                                        .regNumberController
                                                        .text
                                                        .isNum &&
                                                    controller
                                                        .regNumberController
                                                        .text
                                                        .isNotEmpty) {
                                                  controller.value(index);
                                                  controller.sensorType('K');
                                                  controller.onUpdatePower();
                                                } else {
                                                  AppToast.showError(
                                                      "Please enter a valid ID first");
                                                }
                                              }
                                            },
                                          )),
                                    ),
                                  ],
                                ),
                        ],
                      ),
                    ),
                  ),
                ),
              ));
        });
  }
}
