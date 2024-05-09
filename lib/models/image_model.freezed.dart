// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ImageModel _$ImageModelFromJson(Map<String, dynamic> json) {
  return _ImagemMdel.fromJson(json);
}

/// @nodoc
mixin _$ImageModel {
  String get imageName => throw _privateConstructorUsedError;
  String get directoryName => throw _privateConstructorUsedError;
  String get downloadUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImageModelCopyWith<ImageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageModelCopyWith<$Res> {
  factory $ImageModelCopyWith(
          ImageModel value, $Res Function(ImageModel) then) =
      _$ImageModelCopyWithImpl<$Res, ImageModel>;
  @useResult
  $Res call({String imageName, String directoryName, String downloadUrl});
}

/// @nodoc
class _$ImageModelCopyWithImpl<$Res, $Val extends ImageModel>
    implements $ImageModelCopyWith<$Res> {
  _$ImageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageName = null,
    Object? directoryName = null,
    Object? downloadUrl = null,
  }) {
    return _then(_value.copyWith(
      imageName: null == imageName
          ? _value.imageName
          : imageName // ignore: cast_nullable_to_non_nullable
              as String,
      directoryName: null == directoryName
          ? _value.directoryName
          : directoryName // ignore: cast_nullable_to_non_nullable
              as String,
      downloadUrl: null == downloadUrl
          ? _value.downloadUrl
          : downloadUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ImagemMdelImplCopyWith<$Res>
    implements $ImageModelCopyWith<$Res> {
  factory _$$ImagemMdelImplCopyWith(
          _$ImagemMdelImpl value, $Res Function(_$ImagemMdelImpl) then) =
      __$$ImagemMdelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String imageName, String directoryName, String downloadUrl});
}

/// @nodoc
class __$$ImagemMdelImplCopyWithImpl<$Res>
    extends _$ImageModelCopyWithImpl<$Res, _$ImagemMdelImpl>
    implements _$$ImagemMdelImplCopyWith<$Res> {
  __$$ImagemMdelImplCopyWithImpl(
      _$ImagemMdelImpl _value, $Res Function(_$ImagemMdelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageName = null,
    Object? directoryName = null,
    Object? downloadUrl = null,
  }) {
    return _then(_$ImagemMdelImpl(
      imageName: null == imageName
          ? _value.imageName
          : imageName // ignore: cast_nullable_to_non_nullable
              as String,
      directoryName: null == directoryName
          ? _value.directoryName
          : directoryName // ignore: cast_nullable_to_non_nullable
              as String,
      downloadUrl: null == downloadUrl
          ? _value.downloadUrl
          : downloadUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ImagemMdelImpl implements _ImagemMdel {
  _$ImagemMdelImpl(
      {required this.imageName,
      required this.directoryName,
      required this.downloadUrl});

  factory _$ImagemMdelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImagemMdelImplFromJson(json);

  @override
  final String imageName;
  @override
  final String directoryName;
  @override
  final String downloadUrl;

  @override
  String toString() {
    return 'ImageModel(imageName: $imageName, directoryName: $directoryName, downloadUrl: $downloadUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImagemMdelImpl &&
            (identical(other.imageName, imageName) ||
                other.imageName == imageName) &&
            (identical(other.directoryName, directoryName) ||
                other.directoryName == directoryName) &&
            (identical(other.downloadUrl, downloadUrl) ||
                other.downloadUrl == downloadUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, imageName, directoryName, downloadUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImagemMdelImplCopyWith<_$ImagemMdelImpl> get copyWith =>
      __$$ImagemMdelImplCopyWithImpl<_$ImagemMdelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ImagemMdelImplToJson(
      this,
    );
  }
}

abstract class _ImagemMdel implements ImageModel {
  factory _ImagemMdel(
      {required final String imageName,
      required final String directoryName,
      required final String downloadUrl}) = _$ImagemMdelImpl;

  factory _ImagemMdel.fromJson(Map<String, dynamic> json) =
      _$ImagemMdelImpl.fromJson;

  @override
  String get imageName;
  @override
  String get directoryName;
  @override
  String get downloadUrl;
  @override
  @JsonKey(ignore: true)
  _$$ImagemMdelImplCopyWith<_$ImagemMdelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
