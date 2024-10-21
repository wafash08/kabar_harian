import 'package:kabar_harian/domain/usecases/upload_profile_picture.dart';
import 'package:kabar_harian/presentation/providers/repositories/user_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'upload_profile_picture_provider.g.dart';

@riverpod
UploadProfilePicture uploadProfilePicture(UploadProfilePictureRef ref) =>
    UploadProfilePicture(userRepository: ref.watch(userRepositoryProvider));
