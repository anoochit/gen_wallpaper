// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallpaper.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetWallpaperCollection on Isar {
  IsarCollection<Wallpaper> get wallpapers => this.collection();
}

const WallpaperSchema = CollectionSchema(
  name: r'Wallpaper',
  id: 1241814794692501325,
  properties: {
    r'imageData': PropertySchema(
      id: 0,
      name: r'imageData',
      type: IsarType.byteList,
    ),
    r'prompt': PropertySchema(
      id: 1,
      name: r'prompt',
      type: IsarType.string,
    ),
    r'template': PropertySchema(
      id: 2,
      name: r'template',
      type: IsarType.string,
    ),
    r'type': PropertySchema(
      id: 3,
      name: r'type',
      type: IsarType.byte,
      enumMap: _WallpapertypeEnumValueMap,
    )
  },
  estimateSize: _wallpaperEstimateSize,
  serialize: _wallpaperSerialize,
  deserialize: _wallpaperDeserialize,
  deserializeProp: _wallpaperDeserializeProp,
  idName: r'id',
  indexes: {
    r'prompt': IndexSchema(
      id: -1213917865015735015,
      name: r'prompt',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'prompt',
          type: IndexType.value,
          caseSensitive: true,
        )
      ],
    ),
    r'template': IndexSchema(
      id: 1071991172087850361,
      name: r'template',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'template',
          type: IndexType.value,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _wallpaperGetId,
  getLinks: _wallpaperGetLinks,
  attach: _wallpaperAttach,
  version: '3.1.0+1',
);

int _wallpaperEstimateSize(
  Wallpaper object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.imageData;
    if (value != null) {
      bytesCount += 3 + value.length;
    }
  }
  {
    final value = object.prompt;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.template;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _wallpaperSerialize(
  Wallpaper object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeByteList(offsets[0], object.imageData);
  writer.writeString(offsets[1], object.prompt);
  writer.writeString(offsets[2], object.template);
  writer.writeByte(offsets[3], object.type.index);
}

Wallpaper _wallpaperDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Wallpaper();
  object.id = id;
  object.imageData = reader.readByteList(offsets[0]);
  object.prompt = reader.readStringOrNull(offsets[1]);
  object.template = reader.readStringOrNull(offsets[2]);
  object.type = _WallpapertypeValueEnumMap[reader.readByteOrNull(offsets[3])] ??
      WallpaperType.local;
  return object;
}

P _wallpaperDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readByteList(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (_WallpapertypeValueEnumMap[reader.readByteOrNull(offset)] ??
          WallpaperType.local) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _WallpapertypeEnumValueMap = {
  'local': 0,
  'generated': 1,
};
const _WallpapertypeValueEnumMap = {
  0: WallpaperType.local,
  1: WallpaperType.generated,
};

Id _wallpaperGetId(Wallpaper object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _wallpaperGetLinks(Wallpaper object) {
  return [];
}

void _wallpaperAttach(IsarCollection<dynamic> col, Id id, Wallpaper object) {
  object.id = id;
}

extension WallpaperQueryWhereSort
    on QueryBuilder<Wallpaper, Wallpaper, QWhere> {
  QueryBuilder<Wallpaper, Wallpaper, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<Wallpaper, Wallpaper, QAfterWhere> anyPrompt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'prompt'),
      );
    });
  }

  QueryBuilder<Wallpaper, Wallpaper, QAfterWhere> anyTemplate() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'template'),
      );
    });
  }
}

extension WallpaperQueryWhere
    on QueryBuilder<Wallpaper, Wallpaper, QWhereClause> {
  QueryBuilder<Wallpaper, Wallpaper, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Wallpaper, Wallpaper, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Wallpaper, Wallpaper, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Wallpaper, Wallpaper, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Wallpaper, Wallpaper, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Wallpaper, Wallpaper, QAfterWhereClause> promptIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'prompt',
        value: [null],
      ));
    });
  }

  QueryBuilder<Wallpaper, Wallpaper, QAfterWhereClause> promptIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'prompt',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<Wallpaper, Wallpaper, QAfterWhereClause> promptEqualTo(
      String? prompt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'prompt',
        value: [prompt],
      ));
    });
  }

  QueryBuilder<Wallpaper, Wallpaper, QAfterWhereClause> promptNotEqualTo(
      String? prompt) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'prompt',
              lower: [],
              upper: [prompt],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'prompt',
              lower: [prompt],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'prompt',
              lower: [prompt],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'prompt',
              lower: [],
              upper: [prompt],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Wallpaper, Wallpaper, QAfterWhereClause> promptGreaterThan(
    String? prompt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'prompt',
        lower: [prompt],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Wallpaper, Wallpaper, QAfterWhereClause> promptLessThan(
    String? prompt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'prompt',
        lower: [],
        upper: [prompt],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Wallpaper, Wallpaper, QAfterWhereClause> promptBetween(
    String? lowerPrompt,
    String? upperPrompt, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'prompt',
        lower: [lowerPrompt],
        includeLower: includeLower,
        upper: [upperPrompt],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Wallpaper, Wallpaper, QAfterWhereClause> promptStartsWith(
      String PromptPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'prompt',
        lower: [PromptPrefix],
        upper: ['$PromptPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<Wallpaper, Wallpaper, QAfterWhereClause> promptIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'prompt',
        value: [''],
      ));
    });
  }

  QueryBuilder<Wallpaper, Wallpaper, QAfterWhereClause> promptIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'prompt',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'prompt',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'prompt',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'prompt',
              upper: [''],
            ));
      }
    });
  }

  QueryBuilder<Wallpaper, Wallpaper, QAfterWhereClause> templateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'template',
        value: [null],
      ));
    });
  }

  QueryBuilder<Wallpaper, Wallpaper, QAfterWhereClause> templateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'template',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<Wallpaper, Wallpaper, QAfterWhereClause> templateEqualTo(
      String? template) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'template',
        value: [template],
      ));
    });
  }

  QueryBuilder<Wallpaper, Wallpaper, QAfterWhereClause> templateNotEqualTo(
      String? template) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'template',
              lower: [],
              upper: [template],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'template',
              lower: [template],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'template',
              lower: [template],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'template',
              lower: [],
              upper: [template],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Wallpaper, Wallpaper, QAfterWhereClause> templateGreaterThan(
    String? template, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'template',
        lower: [template],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Wallpaper, Wallpaper, QAfterWhereClause> templateLessThan(
    String? template, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'template',
        lower: [],
        upper: [template],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Wallpaper, Wallpaper, QAfterWhereClause> templateBetween(
    String? lowerTemplate,
    String? upperTemplate, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'template',
        lower: [lowerTemplate],
        includeLower: includeLower,
        upper: [upperTemplate],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Wallpaper, Wallpaper, QAfterWhereClause> templateStartsWith(
      String TemplatePrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'template',
        lower: [TemplatePrefix],
        upper: ['$TemplatePrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<Wallpaper, Wallpaper, QAfterWhereClause> templateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'template',
        value: [''],
      ));
    });
  }

  QueryBuilder<Wallpaper, Wallpaper, QAfterWhereClause> templateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'template',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'template',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'template',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'template',
              upper: [''],
            ));
      }
    });
  }
}

extension WallpaperQueryFilter
    on QueryBuilder<Wallpaper, Wallpaper, QFilterCondition> {
  QueryBuilder<Wallpaper, Wallpaper, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Wallpaper, Wallpaper, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Wallpaper, Wallpaper, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Wallpaper, Wallpaper, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Wallpaper, Wallpaper, QAfterFilterCondition> imageDataIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'imageData',
      ));
    });
  }

  QueryBuilder<Wallpaper, Wallpaper, QAfterFilterCondition>
      imageDataIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'imageData',
      ));
    });
  }

  QueryBuilder<Wallpaper, Wallpaper, QAfterFilterCondition>
      imageDataElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageData',
        value: value,
      ));
    });
  }

  QueryBuilder<Wallpaper, Wallpaper, QAfterFilterCondition>
      imageDataElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'imageData',
        value: value,
      ));
    });
  }

  QueryBuilder<Wallpaper, Wallpaper, QAfterFilterCondition>
      imageDataElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'imageData',
        value: value,
      ));
    });
  }

  QueryBuilder<Wallpaper, Wallpaper, QAfterFilterCondition>
      imageDataElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'imageData',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Wallpaper, Wallpaper, QAfterFilterCondition>
      imageDataLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'imageData',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Wallpaper, Wallpaper, QAfterFilterCondition> imageDataIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'imageData',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Wallpaper, Wallpaper, QAfterFilterCondition>
      imageDataIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'imageData',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Wallpaper, Wallpaper, QAfterFilterCondition>
      imageDataLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'imageData',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Wallpaper, Wallpaper, QAfterFilterCondition>
      imageDataLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'imageData',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Wallpaper, Wallpaper, QAfterFilterCondition>
      imageDataLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'imageData',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Wallpaper, Wallpaper, QAfterFilterCondition> promptIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'prompt',
      ));
    });
  }

  QueryBuilder<Wallpaper, Wallpaper, QAfterFilterCondition> promptIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'prompt',
      ));
    });
  }

  QueryBuilder<Wallpaper, Wallpaper, QAfterFilterCondition> promptEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'prompt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Wallpaper, Wallpaper, QAfterFilterCondition> promptGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'prompt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Wallpaper, Wallpaper, QAfterFilterCondition> promptLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'prompt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Wallpaper, Wallpaper, QAfterFilterCondition> promptBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'prompt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Wallpaper, Wallpaper, QAfterFilterCondition> promptStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'prompt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Wallpaper, Wallpaper, QAfterFilterCondition> promptEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'prompt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Wallpaper, Wallpaper, QAfterFilterCondition> promptContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'prompt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Wallpaper, Wallpaper, QAfterFilterCondition> promptMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'prompt',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Wallpaper, Wallpaper, QAfterFilterCondition> promptIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'prompt',
        value: '',
      ));
    });
  }

  QueryBuilder<Wallpaper, Wallpaper, QAfterFilterCondition> promptIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'prompt',
        value: '',
      ));
    });
  }

  QueryBuilder<Wallpaper, Wallpaper, QAfterFilterCondition> templateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'template',
      ));
    });
  }

  QueryBuilder<Wallpaper, Wallpaper, QAfterFilterCondition>
      templateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'template',
      ));
    });
  }

  QueryBuilder<Wallpaper, Wallpaper, QAfterFilterCondition> templateEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'template',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Wallpaper, Wallpaper, QAfterFilterCondition> templateGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'template',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Wallpaper, Wallpaper, QAfterFilterCondition> templateLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'template',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Wallpaper, Wallpaper, QAfterFilterCondition> templateBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'template',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Wallpaper, Wallpaper, QAfterFilterCondition> templateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'template',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Wallpaper, Wallpaper, QAfterFilterCondition> templateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'template',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Wallpaper, Wallpaper, QAfterFilterCondition> templateContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'template',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Wallpaper, Wallpaper, QAfterFilterCondition> templateMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'template',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Wallpaper, Wallpaper, QAfterFilterCondition> templateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'template',
        value: '',
      ));
    });
  }

  QueryBuilder<Wallpaper, Wallpaper, QAfterFilterCondition>
      templateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'template',
        value: '',
      ));
    });
  }

  QueryBuilder<Wallpaper, Wallpaper, QAfterFilterCondition> typeEqualTo(
      WallpaperType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<Wallpaper, Wallpaper, QAfterFilterCondition> typeGreaterThan(
    WallpaperType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<Wallpaper, Wallpaper, QAfterFilterCondition> typeLessThan(
    WallpaperType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<Wallpaper, Wallpaper, QAfterFilterCondition> typeBetween(
    WallpaperType lower,
    WallpaperType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'type',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension WallpaperQueryObject
    on QueryBuilder<Wallpaper, Wallpaper, QFilterCondition> {}

extension WallpaperQueryLinks
    on QueryBuilder<Wallpaper, Wallpaper, QFilterCondition> {}

extension WallpaperQuerySortBy on QueryBuilder<Wallpaper, Wallpaper, QSortBy> {
  QueryBuilder<Wallpaper, Wallpaper, QAfterSortBy> sortByPrompt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prompt', Sort.asc);
    });
  }

  QueryBuilder<Wallpaper, Wallpaper, QAfterSortBy> sortByPromptDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prompt', Sort.desc);
    });
  }

  QueryBuilder<Wallpaper, Wallpaper, QAfterSortBy> sortByTemplate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'template', Sort.asc);
    });
  }

  QueryBuilder<Wallpaper, Wallpaper, QAfterSortBy> sortByTemplateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'template', Sort.desc);
    });
  }

  QueryBuilder<Wallpaper, Wallpaper, QAfterSortBy> sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<Wallpaper, Wallpaper, QAfterSortBy> sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension WallpaperQuerySortThenBy
    on QueryBuilder<Wallpaper, Wallpaper, QSortThenBy> {
  QueryBuilder<Wallpaper, Wallpaper, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Wallpaper, Wallpaper, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Wallpaper, Wallpaper, QAfterSortBy> thenByPrompt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prompt', Sort.asc);
    });
  }

  QueryBuilder<Wallpaper, Wallpaper, QAfterSortBy> thenByPromptDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prompt', Sort.desc);
    });
  }

  QueryBuilder<Wallpaper, Wallpaper, QAfterSortBy> thenByTemplate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'template', Sort.asc);
    });
  }

  QueryBuilder<Wallpaper, Wallpaper, QAfterSortBy> thenByTemplateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'template', Sort.desc);
    });
  }

  QueryBuilder<Wallpaper, Wallpaper, QAfterSortBy> thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<Wallpaper, Wallpaper, QAfterSortBy> thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension WallpaperQueryWhereDistinct
    on QueryBuilder<Wallpaper, Wallpaper, QDistinct> {
  QueryBuilder<Wallpaper, Wallpaper, QDistinct> distinctByImageData() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'imageData');
    });
  }

  QueryBuilder<Wallpaper, Wallpaper, QDistinct> distinctByPrompt(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'prompt', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Wallpaper, Wallpaper, QDistinct> distinctByTemplate(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'template', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Wallpaper, Wallpaper, QDistinct> distinctByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type');
    });
  }
}

extension WallpaperQueryProperty
    on QueryBuilder<Wallpaper, Wallpaper, QQueryProperty> {
  QueryBuilder<Wallpaper, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Wallpaper, List<int>?, QQueryOperations> imageDataProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'imageData');
    });
  }

  QueryBuilder<Wallpaper, String?, QQueryOperations> promptProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'prompt');
    });
  }

  QueryBuilder<Wallpaper, String?, QQueryOperations> templateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'template');
    });
  }

  QueryBuilder<Wallpaper, WallpaperType, QQueryOperations> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }
}
