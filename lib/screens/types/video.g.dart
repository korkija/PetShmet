// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VideoDetailsImpl _$$VideoDetailsImplFromJson(Map<String, dynamic> json) =>
    _$VideoDetailsImpl(
      id: json['id'] as String? ?? 'id',
      iso6391: json['iso_639_1'] as String? ?? 'en',
      iso31661: json['iso_3166_1'] as String? ?? 'US',
      name: json['name'] as String? ?? '',
      key: json['key'] as String? ?? '',
      site: json['site'] as String? ?? '',
      size: (json['size'] as num?)?.toInt() ?? 0,
      type: json['type'] as String? ?? '',
      official: json['official'] as bool? ?? true,
      publishedAt: json['published_at'] as String? ?? '',
    );

Map<String, dynamic> _$$VideoDetailsImplToJson(_$VideoDetailsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'iso_639_1': instance.iso6391,
      'iso_3166_1': instance.iso31661,
      'name': instance.name,
      'key': instance.key,
      'site': instance.site,
      'size': instance.size,
      'type': instance.type,
      'official': instance.official,
      'published_at': instance.publishedAt,
    };
