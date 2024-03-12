import 'package:commando_test_app/core/view/app_toast.dart';
import 'package:commando_test_app/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
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
            body: Padding(
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
                              hintText: 'Enter your password.',
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 16.0, horizontal: 12.0),
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16.0)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: colorScheme.primary, width: 1.0),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(16.0)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: colorScheme.primary, width: 2.0),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(16.0)),
                              ),
                            ),
                          ),
                        ),
                        const Gap(8),
                        Obx(
                          () => FilledButton(
                              onPressed: () {
                                controller.regNumberController.clear();
                                controller.onReset();
                              },
                              child: controller.resetState == Status.loading
                                  ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(color: Colors.white,strokeWidth: 3,),
                              )
                                  : const Text('Reset')),
                        )
                      ],
                    ),
                    const Gap(8),
                    Card(
                      child: ListTile(
                        onTap: null,
                        title: Text(
                          "Fire",
                          style: textTheme.headlineMedium
                              ?.copyWith(color: Colors.black),
                        ),
                        trailing: ToggleSwitch(
                          minWidth: 65,
                          minHeight: 25.0,
                          initialLabelIndex:
                          controller.fireSensorUpdateStatus.value == true
                              ? 1
                              : 0,
                          cornerRadius: 8.0,
                          activeFgColor: Colors.white,
                          inactiveBgColor: Colors.grey,
                          inactiveFgColor: Colors.white,
                          totalSwitches: 2,
                          labels: const ["Inactive", "Active"],
                          fontSize: 8,
                          customTextStyles: const [
                            TextStyle(fontWeight: FontWeight.bold)
                          ],
                          activeBgColors: const [
                            [Colors.red],
                            [Colors.green]
                          ],
                          animate: true,
                          changeOnTap:
                              controller.fireSensorUpdateStatus.value == true
                                  ? true
                                  : false,
                          curve: Curves.easeOut,
                          onToggle: (index) {
                            if (controller.regNumberController.text.isNum &&
                                controller
                                    .regNumberController.text.isNotEmpty) {
                              controller.value(index);
                              controller.sensorType('C');
                              controller.onUpdateFire();
                            } else {
                              AppToast.showError("Please enter valid ID first");
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
                          style: textTheme.headlineMedium
                              ?.copyWith(color: Colors.black),
                        ),
                        trailing: ToggleSwitch(
                          minWidth: 65,
                          minHeight: 25.0,
                          initialLabelIndex:
                          controller.smokeSensorUpdateStatus.value == true
                              ? 1
                              : 0,
                          cornerRadius: 8.0,
                          activeFgColor: Colors.white,
                          inactiveBgColor: Colors.grey,
                          inactiveFgColor: Colors.white,
                          totalSwitches: 2,
                          labels: const ["Inactive", "Active"],
                          fontSize: 8,
                          customTextStyles: const [
                            TextStyle(fontWeight: FontWeight.bold)
                          ],
                          activeBgColors: const [
                            [Colors.red],
                            [Colors.green]
                          ],
                          animate: true,
                          changeOnTap:
                          controller.smokeSensorUpdateStatus.value == true
                              ? true
                              : false,
                          curve: Curves.easeOut,
                          onToggle: (index) {
                            if (controller.regNumberController.text.isNum &&
                                controller
                                    .regNumberController.text.isNotEmpty) {
                              controller.value(index);
                              controller.sensorType('D');
                              controller.onUpdateSmoke();
                            } else {
                              AppToast.showError("Please enter valid ID first");
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
                          style: textTheme.headlineMedium
                              ?.copyWith(color: Colors.black),
                        ),
                        trailing: ToggleSwitch(
                          minWidth: 65,
                          minHeight: 25.0,
                          initialLabelIndex:
                          controller.shutterSensorUpdateStatus.value == true
                              ? 1
                              : 0,
                          cornerRadius: 8.0,
                          activeFgColor: Colors.white,
                          inactiveBgColor: Colors.grey,
                          inactiveFgColor: Colors.white,
                          totalSwitches: 2,
                          labels: const ["Inactive", "Active"],
                          fontSize: 8,
                          customTextStyles: const [
                            TextStyle(fontWeight: FontWeight.bold)
                          ],
                          activeBgColors: const [
                            [Colors.red],
                            [Colors.green]
                          ],
                          animate: true,
                          curve: Curves.easeOut,
                          changeOnTap:
                          controller.shutterSensorUpdateStatus.value == true
                              ? true
                              : false,
                          onToggle: (index) {
                            if (controller.regNumberController.text.isNum &&
                                controller
                                    .regNumberController.text.isNotEmpty) {
                              controller.value(index);
                              controller.sensorType('E');
                              controller.onUpdateShutter();
                            } else {
                              AppToast.showError("Please enter valid ID first");
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
                            style: textTheme.headlineMedium
                                ?.copyWith(color: Colors.black),
                          ),
                          trailing: ToggleSwitch(
                            minWidth: 65,
                            minHeight: 25.0,
                            initialLabelIndex:
                            controller.motionSensorUpdateStatus.value == true
                                ? 1
                                : 0,
                            cornerRadius: 8.0,
                            activeFgColor: Colors.white,
                            inactiveBgColor: Colors.grey,
                            inactiveFgColor: Colors.white,
                            totalSwitches: 2,
                            labels: const ["Inactive", "Active"],
                            fontSize: 8,
                            customTextStyles: const [
                              TextStyle(fontWeight: FontWeight.bold)
                            ],
                            activeBgColors: const [
                              [Colors.red],
                              [Colors.green]
                            ],
                            animate: true,
                            curve: Curves.easeOut,
                            changeOnTap:
                                controller.motionSensorUpdateStatus.value ==
                                        true
                                    ? true
                                    : false,
                            onToggle: (index) {
                              if (controller.regNumberController.text.isNum &&
                                  controller
                                      .regNumberController.text.isNotEmpty) {
                                controller.value(index);
                                controller.sensorType('F');
                                controller.onUpdateMotion();
                              } else {
                                AppToast.showError(
                                    "Please enter valid ID first");
                              }
                            },
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ));
        });
  }
}
