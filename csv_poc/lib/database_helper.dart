import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

const String TABLE_NAME_PATIENT = "patient";
const String PATIENT_TABLE_COLUMNS =
    "(patient_track_id INTEGER,gender TEXT,age INTEGER,weight REAL,created_at TEXT,avg_diastolic INTEGER,next_medical_review_date TEXT,next_bp_assesment_date TEXT,bmi REAL,last_assessment_date TEXT,avg_systolic INTEGER,enrollment_at TEXT,enrollment_at_red TEXT,screening_referral TEXT,is_confirm_diagnosis TEXT,is_red_risk_patient TEXT,is_pregnant TEXT,cvd_risk_level TEXT,glucose_type TEXT,screening_id INTEGER,is_screening TEXT,patient_status TEXT,patient_id INTEGER,tenant_id INTEGER,updated_at TEXT,program_id INTEGER,glucose_value REAL,sc_name TEXT,country_name TEXT,county_name TEXT,sub_county_name TEXT,is_deleted_s TEXT,city TEXT,is_active TEXT,name TEXT,confirm_diagnosis TEXT,comorbidity_name TEXT,comorbidity TEXT,other_comorbidity TEXT,diabetes_year_of_diagnosis INTEGER,diabetes_patient_type TEXT,htn_patient_type TEXT,diabetes_diagnosis TEXT,htn_year_of_diagnosis INTEGER,is_diabetes_diagnosis TEXT,is_htn_diagnosis TEXT,diabetes_diag_controlled_type TEXT,created_at_s TEXT,category_s TEXT,glucose_value_s REAL,glucose_type_s TEXT,avg_diastolic_long_s INTEGER,avg_systolic_long_s INTEGER,is_before_htn_diagnosis_s TEXT,is_before_diabetes_diagnosis_s TEXT,referredreason TEXT,diabetes_type_s TEXT,diagnosis TEXT,enrolledcondition TEXT,p_name TEXT,provisional_diagnosis TEXT,insurance_type TEXT,insurance_status TEXT,insurance_type_case TEXT,htn_new_vs_existing_diagnoses TEXT,dbm_new_vs_existing_diagnoses TEXT,pregnant_status TEXT)";
const String PATIENT_TABLE_INSERT_VALUE =
    "(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

class DataBaseHelper {
  DataBaseHelper._();

  static const String dbName = "bi_db";
  static final DataBaseHelper instance = DataBaseHelper._();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDataBase();
    return _database!;
  }

  Future<Database> initDataBase() async {
    String path = join(await getDatabasesPath(), dbName);
    return openDatabase(path, version: 1, onCreate: (db, version) async {
      //create tables
      db.execute("CREATE TABLE $TABLE_NAME_PATIENT $PATIENT_TABLE_COLUMNS");
    });
  }
}
