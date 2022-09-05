import 'dart:developer';

import 'package:cloud_kit/cloud_kit.dart';
import 'package:flutter/material.dart';

class CloudKitPage extends StatefulWidget {
  const CloudKitPage({Key? key}) : super(key: key);

  @override
  State<CloudKitPage> createState() => _CloudKitPageState();
}

class _CloudKitPageState extends State<CloudKitPage> {


  CloudKit cloudKit = CloudKit("iCloud.com.gizemgizg.cloudkit");

  Future icloudSave({required String key, required String value}) async {
    await cloudKit.save(key, value);
  }

  Future icloudGet({required String key}) async {
    await cloudKit.get(key);
  }

  TextEditingController key = TextEditingController();
  TextEditingController value = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cloudkit Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: key,
              decoration: const InputDecoration(hintText: 'Key'),
            ),
            TextFormField(
              controller: value,
              decoration: const InputDecoration(hintText: 'Value'),
            ),
            ElevatedButton(
              onPressed: () async {
                bool success = await icloudSave(key: key.text, value: value.text);
                if (success) {
                  log('Successfully saved key ' + key.text);
                } else {
                  log('Failed to save key: ' + key.text);
                }
              },
              child: const Text('Save'),
            ),
            ElevatedButton(
              onPressed: () async {
                await icloudGet(key: key.text);

                setState(() {});
              },
              child:const Text('Get'),
            ),
          ],
        ),
      ),
    );
  }
}
