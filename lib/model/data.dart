import 'package:flutter/foundation.dart';

class Data {
  //final int ID;
  final String Security;
  // final int IndustryID;
  final String Industry;
  // final int SectorID;
   final String Sector;
   final double MCAP ;
  // final String? EV;
  // final String? EVDateEnd;
   final double BookNavPerShare;
   final double TTMPE;
  // final double TTMYearEnd;
   final double Yield;
  // final double YearEnd;
  // final String SectorSlug;
  // final String IndustrySlug;
  // final String SecuritySlug;
  final double PEGRatio;

  Data(
       {
       // required this.ID,
       required this.Security,
      // required this.IndustryID,
        required this.Industry,
      // required this.SectorID,
       required this.Sector,
       required this.MCAP,
      // required this.EV,
      // required this.EVDateEnd,
       required this.BookNavPerShare,
      required this.TTMPE,
      // required this.TTMYearEnd,
       required this.Yield,
      // required this.YearEnd,
      // required this.SectorSlug,
      // required this.IndustrySlug,
      // required this.SecuritySlug,
       required this.PEGRatio
      });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
        //ID: json['ID'] as int,
        Security: json['Security'] as String,
        // IndustryID: json['IndustryID'] as int,
          Industry: json['Industry'] as String,
        // SectorID: json['SectorID'] as int,
         Sector: json['Sector'] as String,
         MCAP: json['MCAP'].toDouble(),
        // EV: json['EV'],
        // EVDateEnd: json['EVDateEnd'],
         BookNavPerShare: json['BookNavPerShare'].toDouble(),
         TTMPE:  json['TTMPE'].toDouble(),
        // TTMYearEnd: double.parse(json['TTMYearEnd']),
         Yield: json['Yield'].toDouble(),
        //  YearEnd: double.parse(json['YearEnd']),
        // SectorSlug: json['SectorSlug'],
        // IndustrySlug: json['IndustrySlug'],
        // SecuritySlug: json['SecuritySlug'],
         PEGRatio: json['PEGRatio'].toDouble()






        //  MCAP:  json['MCAP'] as double,
        // EV: json['EV'] as String,
        // EVDateEnd: json['EVDateEnd'] as String,
        // BookNavPerShare: json['BookNavPerShare']as double,
        // TTMPE:  json['TTMPE'] as double,
        // TTMYearEnd: json['TTMYearEnd'] as double,
        // Yield:  json['Yield'] as double,
        //  YearEnd:  json['YearEnd'] as double,
        // SectorSlug: json['SectorSlug'] as String,
        // IndustrySlug: json['IndustrySlug'] as String,
        // SecuritySlug: json['SecuritySlug'] as String,
        // PEGRatio:  json['PEGRatio'] as double,
        
        );
  }
}
