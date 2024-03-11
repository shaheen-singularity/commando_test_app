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
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Gap(64),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Enter your password.',
                contentPadding:
                EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                  BorderSide(color: colorScheme.primary, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(16.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                  BorderSide(color: colorScheme.primary, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(16.0)),
                ),
              ),
            ),
            Card(

              child: ListTile(
                onTap: () {

                },
                title: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Smoke",
                        style: textTheme.headlineMedium?.copyWith(color: Colors.black),
                      ),
                      if (status != "active")
                        WidgetSpan(
                          child: Badge(
                            label: Text(status?.capitalizeFirst ?? ""),
                            backgroundColor: Colors.red.withOpacity(0.1),
                            textColor: Colors.red,
                          ),
                        ),
                    ],
                  ),
                ),
                trailing: ToggleSwitch(
                  minWidth: 65,
                  minHeight: 25.0,
                  initialLabelIndex: status == "active" ? 1 : 0,
                  cornerRadius: 8.0,
                  activeFgColor: Colors.white,
                  inactiveBgColor: Colors.grey,
                  inactiveFgColor: Colors.white,
                  totalSwitches: 2,
                  labels: const ["Inactive", "Active"],
                  fontSize: 8,
                  customTextStyles: const [TextStyle(fontWeight: FontWeight.bold)],
                  activeBgColors: const [
                    [Colors.red],
                    [Colors.green]
                  ],
                  animate: true,
                  curve: Curves.easeOut,
                  onToggle: (index) {
                    String selectedOption = ['inactive', 'active'][index!];
                    print(selectedOption);

                  },
                ),
              ),
            ),
            Card(
              child: ListTile(
                // tileColor: colorScheme.primaryContainer,
                onTap: () {

                },
                title: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Smoke",
                        style: textTheme.headlineMedium?.copyWith(color: Colors.black),
                      ),
                      if (status != "active")
                        WidgetSpan(
                          child: Badge(
                            label: Text(status?.capitalizeFirst ?? ""),
                            backgroundColor: Colors.red.withOpacity(0.1),
                            textColor: Colors.red,
                          ),
                        ),
                    ],
                  ),
                ),
                trailing: ToggleSwitch(
                  minWidth: 65,
                  minHeight: 25.0,
                  initialLabelIndex: status == "active" ? 1 : 0,
                  cornerRadius: 8.0,
                  activeFgColor: Colors.white,
                  inactiveBgColor: Colors.grey,
                  inactiveFgColor: Colors.white,
                  totalSwitches: 2,
                  labels: const ["Inactive", "Active"],
                  fontSize: 8,
                  customTextStyles: const [TextStyle(fontWeight: FontWeight.bold)],
                  activeBgColors: const [
                    [Colors.red],
                    [Colors.green]
                  ],
                  animate: true,
                  curve: Curves.easeOut,
                  onToggle: (index) {
                    String selectedOption = ['inactive', 'active'][index!];
                    print(selectedOption);

                  },
                ),
              ),
            ),
            Card(
              child: ListTile(
                // tileColor: colorScheme.primaryContainer,
                onTap: () {

                },
                title: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Smoke",
                        style: textTheme.headlineMedium?.copyWith(color: Colors.black),
                      ),
                      if (status != "active")
                        WidgetSpan(
                          child: Badge(
                            label: Text(status?.capitalizeFirst ?? ""),
                            backgroundColor: Colors.red.withOpacity(0.1),
                            textColor: Colors.red,
                          ),
                        ),
                    ],
                  ),
                ),
                trailing: ToggleSwitch(
                  minWidth: 65,
                  minHeight: 25.0,
                  initialLabelIndex: status == "active" ? 1 : 0,
                  cornerRadius: 8.0,
                  activeFgColor: Colors.white,
                  inactiveBgColor: Colors.grey,
                  inactiveFgColor: Colors.white,
                  totalSwitches: 2,
                  labels: const ["Inactive", "Active"],
                  fontSize: 8,
                  customTextStyles: const [TextStyle(fontWeight: FontWeight.bold)],
                  activeBgColors: const [
                    [Colors.red],
                    [Colors.green]
                  ],
                  animate: true,
                  curve: Curves.easeOut,
                  onToggle: (index) {
                    String selectedOption = ['inactive', 'active'][index!];
                    print(selectedOption);

                  },
                ),
              ),
            ),
            Card(
              child: ListTile(
                // tileColor: colorScheme.primaryContainer,
                onTap: () {

                },
                title: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Smoke",
                        style: textTheme.headlineMedium?.copyWith(color: Colors.black),
                      ),
                      if (status != "active")
                        WidgetSpan(
                          child: Badge(
                            label: Text(status?.capitalizeFirst ?? ""),
                            backgroundColor: Colors.red.withOpacity(0.1),
                            textColor: Colors.red,
                          ),
                        ),
                    ],
                  ),
                ),
                trailing: ToggleSwitch(
                  minWidth: 65,
                  minHeight: 25.0,
                  initialLabelIndex: status == "active" ? 1 : 0,
                  cornerRadius: 8.0,
                  activeFgColor: Colors.white,
                  inactiveBgColor: Colors.grey,
                  inactiveFgColor: Colors.white,
                  totalSwitches: 2,
                  labels: const ["Inactive", "Active"],
                  fontSize: 8,
                  customTextStyles: const [TextStyle(fontWeight: FontWeight.bold)],
                  activeBgColors: const [
                    [Colors.red],
                    [Colors.green]
                  ],
                  animate: true,
                  curve: Curves.easeOut,
                  onToggle: (index) {
                    String selectedOption = ['inactive', 'active'][index!];
                    print(selectedOption);

                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
