import 'package:delivery_project/features/providers/auth_provider.dart';
import 'package:delivery_project/features/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with AutomaticKeepAliveClientMixin {
  Uint8List? _imageFile;

  _selectImage(BuildContext) async {
    return showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: const Text('Select Image'),
          children: [
            SimpleDialogOption(
              child: const Text("Take a photo"),
              onPressed: () async {
                Navigator.of(context).pop();
                Uint8List? file = await pickImage(ImageSource.camera);
                setState(() {
                  _imageFile = file;
                });
              },
            ),
            SimpleDialogOption(
              child: const Text("Choose from gallery"),
              onPressed: () async {
                Navigator.of(context).pop();
                Uint8List? file = await pickImage(ImageSource.gallery);
                setState(() {
                  _imageFile = file;
                });
              },
            ),
          ],
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;

  void _editNameDialog(
    BuildContext context,
    String currentFirst,
    String currentLast,
  ) {
    final firstController = TextEditingController(text: currentFirst);
    final lastController = TextEditingController(text: currentLast);
    final formKey = GlobalKey<FormState>();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Name'),
        content: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: firstController,
                decoration: const InputDecoration(labelText: 'First Name'),
                validator: (v) =>
                    v == null || v.trim().isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: lastController,
                decoration: const InputDecoration(labelText: 'Last Name'),
                validator: (v) =>
                    v == null || v.trim().isEmpty ? 'Required' : null,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context), // cancel
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                await context.read<AuthProvider>().updateName(
                  firstController.text.trim(),
                  lastController.text.trim(),
                );
                if (context.mounted) Navigator.pop(context);
              }
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final user = context.watch<AuthProvider>().user;

    if (user == null) {
      return const Center(child: Text('Not logged in'));
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () => _selectImage(context),
              icon: CircleAvatar(
                radius: 40,
                backgroundImage: _imageFile != null
                    ? MemoryImage(_imageFile!)
                    : null,
                child: _imageFile == null
                    ? Text(
                        '${user.firstName[0]}${user.lastName[0]}'.toUpperCase(),
                        style: const TextStyle(fontSize: 28),
                      )
                    : null,
              ),
            ),
            const Text("Username", style: TextStyle(fontSize: 20)),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 12),

                  Expanded(
                    child: Text(
                      '${user.firstName} ${user.lastName}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      _editNameDialog(context, user.firstName, user.lastName);
                    },
                  ),
                ],
              ),
            ),
            Text(user.email),
            Text(user.phone),
            const Spacer(),
            ElevatedButton(
              onPressed: () => context.read<AuthProvider>().logout(),
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
