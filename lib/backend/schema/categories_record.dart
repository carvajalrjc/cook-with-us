import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CategoriesRecord extends FirestoreRecord {
  CategoriesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name_sp" field.
  String? _nameSp;
  String get nameSp => _nameSp ?? '';
  bool hasNameSp() => _nameSp != null;

  // "name_en" field.
  String? _nameEn;
  String get nameEn => _nameEn ?? '';
  bool hasNameEn() => _nameEn != null;

  // "name_fr" field.
  String? _nameFr;
  String get nameFr => _nameFr ?? '';
  bool hasNameFr() => _nameFr != null;

  // "icon" field.
  String? _icon;
  String get icon => _icon ?? '';
  bool hasIcon() => _icon != null;

  void _initializeFields() {
    _nameSp = snapshotData['name_sp'] as String?;
    _nameEn = snapshotData['name_en'] as String?;
    _nameFr = snapshotData['name_fr'] as String?;
    _icon = snapshotData['icon'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('categories');

  static Stream<CategoriesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CategoriesRecord.fromSnapshot(s));

  static Future<CategoriesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CategoriesRecord.fromSnapshot(s));

  static CategoriesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CategoriesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CategoriesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CategoriesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CategoriesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CategoriesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCategoriesRecordData({
  String? nameSp,
  String? nameEn,
  String? nameFr,
  String? icon,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name_sp': nameSp,
      'name_en': nameEn,
      'name_fr': nameFr,
      'icon': icon,
    }.withoutNulls,
  );

  return firestoreData;
}

class CategoriesRecordDocumentEquality implements Equality<CategoriesRecord> {
  const CategoriesRecordDocumentEquality();

  @override
  bool equals(CategoriesRecord? e1, CategoriesRecord? e2) {
    return e1?.nameSp == e2?.nameSp &&
        e1?.nameEn == e2?.nameEn &&
        e1?.nameFr == e2?.nameFr &&
        e1?.icon == e2?.icon;
  }

  @override
  int hash(CategoriesRecord? e) =>
      const ListEquality().hash([e?.nameSp, e?.nameEn, e?.nameFr, e?.icon]);

  @override
  bool isValidKey(Object? o) => o is CategoriesRecord;
}
