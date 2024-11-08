import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SwitchLang extends StatefulWidget {
  const SwitchLang({super.key});

  @override
  SwitchLangState createState() => SwitchLangState();
}

class SwitchLangState extends State<SwitchLang> {
  String buttonText = "Switch Language";

  void _showLanguageDialog() {
    // Change the button text when dialog opens
    setState(() {
      buttonText = "Cancel";
    });

    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Text(
          'Select Language',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'English',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text(
                  'Default',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
            const Divider(
              height: 3,
              color: Colors.black,
              thickness: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'العربية',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 12,
                  ),
                ),
              ],
            ),
            const Divider(
              height: 0,
              color: Colors.black,
              thickness: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'भारतीय',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 12,
                  ),
                ),
              ],
            ),
            const Divider(
              height: 0,
              color: Colors.black,
              thickness: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Filipino',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 12,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 100,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: OutlinedButton(
                onPressed: () {
                  Get.back();
                },
                style: Theme.of(context).outlinedButtonTheme.style,
                child: Text(
                  'APPLY',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
            )
          ],
        ),
      ),
    ).then((_) {
      // Reset the button text when dialog closes
      setState(() {
        buttonText = "Switch Language";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: _showLanguageDialog,
      child: Text(
        buttonText,
        style: Theme.of(context).textTheme.titleSmall,
      ),
    );
  }
}
