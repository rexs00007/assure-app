import 'package:cloud_firestore/cloud_firestore.dart';

class LoanModel {
  String? email;
  int? loanAppliedCount;
  int? loanApproved;
  String? name;
  String? phone;
  List<DataObject>? data;
  String? uid;
  String? profilePic;

  LoanModel({
    this.email,
    this.loanAppliedCount,
    this.loanApproved,
    this.name,
    this.phone,
    this.data,
    this.uid,
    this.profilePic
  });

  factory LoanModel.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data();
    List<DataObject>? dataObjects;
    if (data!['data'] != null) {
      dataObjects = List<DataObject>.from(
        data['data'].map((data) => DataObject.fromFirestore(data)),
      );
    }
    return LoanModel(
      email: data['email'],
      loanAppliedCount: data['loan_applied_count'],
      loanApproved: data['loan_approved'],
      name: data['name'],
      phone: data['phone'],
      uid: data['uid'],
      profilePic: data['profile_pic'],
      data: dataObjects,
    );
  }
}

class DataObject {
  int? amountOfLoan;
  String? branchCode;
  String? countryForResidence;
  String? dealer;
  Timestamp? dob;
  String? education;
  String? father;
  String? gender;
  String? gstNumber;
  String? interestRateTypes;
  String? loanRequestedForVal;
  int? loanTenure;
  String? make;
  String? maritalStatus;
  String? model;
  String? mother;
  String? mudraLoan;
  String? name;
  String? nationality;
  int? numberOfVehicle;
  String? otherEducation;
  String? otherProfession;
  String? otherPurposeOfLoan;
  String? primaryApplicantForm;
  String? profession;
  String? purposeOfLoan;
  String? religionCategories;
  String? residenceAddress;
  String? residenceCity;
  String? residenceLandmark;
  String? residenceMobile;
  String? residencePin;
  String? residenceTelephone;
  String? serialNumber;
  int? valuation;

  DataObject({
    this.amountOfLoan,
    this.branchCode,
    this.countryForResidence,
    this.dealer,
    this.dob,
    this.education,
    this.father,
    this.gender,
    this.gstNumber,
    this.interestRateTypes,
    this.loanRequestedForVal,
    this.loanTenure,
    this.make,
    this.maritalStatus,
    this.model,
    this.mother,
    this.mudraLoan,
    this.name,
    this.nationality,
    this.numberOfVehicle,
    this.otherEducation,
    this.otherProfession,
    this.otherPurposeOfLoan,
    this.primaryApplicantForm,
    this.profession,
    this.purposeOfLoan,
    this.religionCategories,
    this.residenceAddress,
    this.residenceCity,
    this.residenceLandmark,
    this.residenceMobile,
    this.residencePin,
    this.residenceTelephone,
    this.serialNumber,
    this.valuation,
  });

  factory DataObject.fromFirestore(Map<String, dynamic> json) {
    return DataObject(
      amountOfLoan: json['amount_of_loan'],
      branchCode: json['branch_code'],
      countryForResidence: json['country_for_residence'],
      dealer: json['dealer'],
      dob: json['dob'],
      education: json['education'],
      father: json['father'],
      gender: json['gender'],
      gstNumber: json['gst_number'],
      interestRateTypes: json['intrest_rate_types'],
      loanRequestedForVal: json['loan_requested_for_val'],
      loanTenure: json['loan_tenure'],
      make: json['make'],
      maritalStatus: json['marital_status'],
      model: json['model'],
      mother: json['mother'],
      mudraLoan: json['mudra_loan'],
      name: json['name'],
      nationality: json['nationality'],
      numberOfVehicle: json['number_of_vehicle'],
      otherEducation: json['other_education'],
      otherProfession: json['other_profession'],
      otherPurposeOfLoan: json['other_purpose_of_loan'],
      primaryApplicantForm: json['primary_applicant_form'],
      profession: json['profession'],
      purposeOfLoan: json['purpose_of_loan'],
      religionCategories: json['religion_categories'],
      residenceAddress: json['residence_address'],
      residenceCity: json['residence_city'],
      residenceLandmark: json['residence_landmark'],
      residenceMobile: json['residence_mobile'],
      residencePin: json['residence_pin'],
      residenceTelephone: json['residence_telephone'],
      serialNumber: json['serial_number'],
      valuation: json['valuation'],
    );
  }
}