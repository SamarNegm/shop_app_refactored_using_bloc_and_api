import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop_app_refactored/models/ProfileModel.dart';
import 'package:flutter_shop_app_refactored/models/users.dart';
import 'package:flutter_shop_app_refactored/screens/profile/ProfileState.dart';
import 'package:flutter_shop_app_refactored/network/end_points.dart';
import 'package:flutter_shop_app_refactored/network/local/cache_helper.dart';
import 'package:flutter_shop_app_refactored/network/remote/DioHelper.dart';

class ProfileCubit extends Cubit<profileState> {
  ProfileCubit(profileState initialState) : super(initialState);
  static ProfileCubit get(context) => BlocProvider.of(context);
  users CurrentUser = null;
  final GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController adreessController = TextEditingController();

  Future<void> geProfileData() {
    emit(LoadingState());
    DioHelper.getData(url: PROFILE, token: CacheHelper.getData(key: 'token'))
        .then((value) {
      print('Profile>>' + value.toString());
      ProfileModel profileModel = ProfileModel.fromJson(value.toString());
      CurrentUser = profileModel.data;

      emit(SuccessgState());
    }).onError((error, stackTrace) {
      print('profileDATAERROR..' + error.toString());
      emit(ErrorState());
    });
  }

  void save() {
    if (!formKey.currentState.validate()) {
      emit(NotVaildData());
      return;
    }
    formKey.currentState.save();
    print(
        CurrentUser.name + ' ' + CurrentUser.email + '  ' + CurrentUser.phone);
    UpdateProfile();
  }

  void UpdateProfile() {
    emit(LoadingState());
    DioHelper.putData(
        url: UPDATE_PROFILE,
        token: CacheHelper.getData(key: 'token'),
        data: {
          'name': CurrentUser.name,
          'email': CurrentUser.email,
          'phone': CurrentUser.phone
        }).then((value) {
      print('updateProfile>>' + value.toString());

      emit(SuccessgState());
    }).onError((error, stackTrace) {
      print('profileDATAERROR..' + error.toString());
      emit(ErrorState());
    });
  }
}
