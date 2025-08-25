import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tetsugym/core/constants/rk_font_sizes.dart';
import 'package:tetsugym/core/constants/rk_fonts.dart';
import 'package:tetsugym/domain/app_service.dart';
import 'package:tetsugym/utils/input_text/basic_input_text.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: RkInsets.xl,
        bottom: RkInsets.xl,
        right: RkInsets.xl,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Personal Information',
            style: TextStyle(fontSize: 24, fontFamily: RkFonts.semiBold),
          ),
          Text(
            'Provide you information so that your account can operate correctly.',
            style: TextStyle(fontSize: 12, fontFamily: RkFonts.regular),
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            'Profile',
            style: TextStyle(fontSize: 20, fontFamily: RkFonts.semiBold),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              ClipOval(
                child: CachedNetworkImage(
                  imageUrl:
                      'https://cdn.pixabay.com/photo/2018/01/03/19/54/fashion-3059143_960_720.jpg',
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              InkWell(
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                focusColor: Colors.transparent,
                onTap: () async {
                  await pickFile();
                },
                child: Container(
                  width: 140,
                  height: 35,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.black.withValues(alpha: 0.2),
                    ),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          CupertinoIcons.camera_fill,
                          size: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 7),
                          child: Text(
                            'Foto de perfil',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          PersonalInformation(),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }

  Future<void> pickFile() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: false,
      );

      if (result != null && result.files.isNotEmpty) {
        // Uint8List? fileBytes = result.files.first.bytes;
        // String fileName = result.files.first.name;
      }
    } catch (e) {
      log('Error picking file: $e');
    }
  }
}

class PersonalInformation extends StatefulWidget {
  const PersonalInformation({super.key});

  @override
  State<PersonalInformation> createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {
  late TextEditingController emailController;

  @override
  void initState() {
    super.initState();

    //? Init
    final user = FirebaseAuth.instance.currentUser;
    emailController = TextEditingController(text: '${user?.email}');
  }

  @override
  Widget build(BuildContext context) {
    // final nameController = TextEditingController();
    // final lastNameController = TextEditingController();
    // final curpController = TextEditingController();
    // final rfcController = TextEditingController();
    final user = FirebaseAuth.instance.currentUser;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Wrap(
          spacing: 20,
          runSpacing: 20,
          children: [
            SizedBox(
              width: 250,
              child: InputText(
                label: 'Nombre',
                required: true,
                controller: TextEditingController(),
                hint: 'Ej. Ricardo',
              ),
            ),
            SizedBox(
              width: 250,
              child: InputText(
                label: 'Apellido paterno',
                required: true,
                hint: 'Ej. Rodríguez',
                controller: TextEditingController(),
              ),
            ),
            SizedBox(
              width: 250,
              child: InputText(
                label: 'Fecha de nacimiento',
                required: true,
                hint: 'Ej. 12/12/1996',
                controller: TextEditingController(),
              ),
            ),
            SizedBox(
              width: 250,
              child: InputText(
                label: 'Correo electrónico',
                required: true,
                hint: 'Ej. rick@gmail.com',
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obligatorio';
                  }
                  if (!value.contains('@')) {
                    return 'Correo no válido';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              width: 250,
              child: InputText(
                label: 'CURP',
                required: true,
                controller: TextEditingController(),
                hint: 'Ej. PPYYMMDDHNECLLLNN',
              ),
            ),
            SizedBox(
              width: 250,
              child: InputText(
                label: 'RFC',
                required: true,
                controller: TextEditingController(),
                hint: 'Ej. RACJ850624H1A',
              ),
            ),
            SizedBox(
              width: 250,
              child: InputText(
                label: 'Teléfono personal',
                required: true,
                controller: TextEditingController(),
                hint: 'Ej. 443 123 4567',
              ),
            ),
            SizedBox(
              width: 250,
              child: InputText(
                label: 'Calle',
                required: true,
                controller: TextEditingController(),
                hint: 'Ej. Av. Madero Poniente',
              ),
            ),
            SizedBox(
              width: 250,
              child: InputText(
                label: 'Número',
                required: true,
                controller: TextEditingController(),
                hint: 'Ej. 12',
              ),
            ),
            SizedBox(
              width: 250,
              child: InputText(
                label: 'Colonia',
                required: true,
                controller: TextEditingController(),
                hint: 'Ej. Prados verdes',
              ),
            ),
            SizedBox(
              width: 250,
              child: InputText(
                label: 'Estado',
                required: true,
                controller: TextEditingController(),
                hint: 'Ej. Michoacán',
              ),
            ),
            SizedBox(
              width: 250,
              child: InputText(
                label: 'Ciudad',
                required: true,
                controller: TextEditingController(),
                hint: 'Ej. Morelia',
              ),
            ),
            SizedBox(
              width: 250,
              child: InputText(
                label: 'ZIP',
                required: true,
                controller: TextEditingController(),
                hint: 'Ej. 50222',
              ),
            ),
            SizedBox(
              width: 250,
              child: InputText(
                label: 'Tipo de sangre',
                required: true,
                controller: TextEditingController(),
                hint: 'Ej. 0+',
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: RkInsets.md,
          ),
          child: Divider(),
        ),
        Wrap(
          children: [
            InkWell(
              splashColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              focusColor: Colors.transparent,
              onTap: () async {
                await pickFile();
              },
              child: Container(
                width: 190,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.black.withValues(alpha: 0.2),
                  ),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        CupertinoIcons.camera_fill,
                        size: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 7),
                        child: Text(
                          'Identificación oficial',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: RkInsets.xl,
          ),
          child: Divider(),
        ),
        InkWell(
          onTap: () async {
            /*await AppService().createUser('${user?.uid}', {
              'name': 'Luis Adrian',
              'surname': 'Pineda Herrera',
              'date_of_birth': '04/03/1996',
              'email': '${user?.email}',
            });*/
          },
          child: Text('Guardar'),
        ),
      ],
    );
  }

  Future<void> pickFile() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: false,
      );

      if (result != null && result.files.isNotEmpty) {
        // Uint8List? fileBytes = result.files.first.bytes;
        // String fileName = result.files.first.name;
      }
    } catch (e) {
      log('Error picking file: $e');
    }
  }
}
