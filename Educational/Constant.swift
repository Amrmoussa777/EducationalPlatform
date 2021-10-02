//
//  Constant.swift
//  Educational
//
//  Created by Amr Moussa on 16/08/2021.
//

import UIKit


enum TabbarItemImage{
    static let notificationImage = UIImage(systemName: "bell.fill")
}


enum EDImages{
    static let largeLogo = UIImage(named: "largeLogo")
    static let playImage = UIImage(systemName: "play")
    static let thumbnail = UIImage(named: "thumnail")
    static let thumbnail2 = UIImage(named: "thumbnail2")
    
    static let loginAvatar = UIImage(named: "largeLogo")
    static let testIcon = UIImage(systemName:  "newspaper")
    static let moreIcon = UIImage(systemName:  "square.grid.2x2.fill")
    
    
    
}

enum SignUpHeaderKeys{
    static let email = "email"
    static let password = "password"
    static let phone = "phone"
    static let name = "name"
    static let yearId = "yearId"
    static let image = "image"
}

enum getUnitsKey{
    static let Authorization = "Authorization"
}

enum studyLevels:String{
    case level315 = "المرحلة الاولى الثانوية"
    case level325 = "المرحلة الثانية الثانوية"
    case level335 = "المرحلة الثاثة الثانوية"
}


enum Yearlevels {
    static let levels:[Int:String] = [
        315:"المرحلة الاولى الثانوية",
        325:"المرحلة الثانية الثانوية",
        335:"المرحلة الثاثة الثانوية"
    ]
}


struct UserDefaultKeys {
    static let currentUserKey = "userKey"
    static let lastVide = "lastVideo"
}



struct SignInUserData: Codable  {
    let  token:String
    let userId:Int
    let email:String
    let phone:String
    let yearId:Int
    let name:String
    
}
struct iconName {
    static let profile = "person.fill"
    static let about = "exclamationmark.bubble"
    static let rate = "list.star"
    static let share = "square.and.arrow.up"
    static let logOut = "arrow.backward"
    
}


struct EDStrings {
    static let lessonHeadline = "الدروس"
    static let noLessonsForUnit = "لا يوجد دروس لهذه الوحدة"
    static let teleNumberPlaceHolder = " رقم التليفون "
    static let passwordPLaceHolder = "كلمة المرور "
    static let emailPLaceHolder = "البريد الاكتروني"
    static let userNamePlaceHolder = "اسم المستخدم"
    static let more = "المزيد"
    static let soon  = "قريبا .."
    static let mainScreen = "الرئيسية"
    static let loginHeadLabel = "املأ البيانات لتسجيل الدخول 🚀"
    
    static let loginButtonText = "تسجيل الدخول "
    static let registerButtonText =  "تسجيل جديد"
    static let newSoRegister =  "جديد؟ تسجيل حساب جديد"
    static let noRecordOfyouurData =  "لا يوجد تطابق لبيناتك .."
    static let ok = "حسنا"
    static let yearIDText = "المرحلة التعليمية"
    static let passValidEmail = "اضف بريد الكتروني فعال وكلمة مرور سليمة"
    static let validUserName = "اضف اسم مناسب"
    static let validtelephone =  "اضف رقم تليفون فعال "
    static let register = "تسجيل"
    static let alredyHAveAccoutn = "تمتلك حساب بالفعل؟"
    static let dontHaveAccount = "لا تمتلك حساب ؟"
    static let emailValidationTextFotter =  """
                   البريد الالكترني يجيب ان يكون فعال
                ولرقم السري تكون من ٨ حروف ويمكن ان يحتوي
                علي a-z A-Z  
                """
    static let userNameValidationTextFotter =
        """
            اختر صوره مناسبة وادخل
            اسم المستخدم الذي سوف يظهر بجانب
            صورتك الشخصية
            """
    
 
    static let telephoneValidationTextFotter =  """
                    رقم المحمول يجب ان يكون ١٠ -١٢ حرف
                    ويكون رقم محمول فعال
                    """
    
    static let pleaseAddAvalidData = "من فضلك ادخل بيانات صحيحة"
    static let pleaseReEnterData = "حاول مره اخري بادخال بريد الكتوني ورقم تليفون صحيحين"
    static let nextButtonText = "التالي"
    static let errorSaving = "حدث خطأ في حفظ البيانات"
    static let passNotMatch = "كلمة المرور غير متطابقة"
    
    static let chooseYearID = "اختر السنة الدراسية"
    static let units = "الوحدات"
    static let noLessonsAvailable = "لا يوجد دروس حالية"
    static let whichExam = "اي الامتحانات اليوم ؟ "
    static let endedUnits = "وحدات منتهية"
    static let exams = "امتحانات"
    static let courses = "كورساتي"
    static let profile = "الملف الشخصي"
    static let about = "عن سيجما "
    static let rating =     "تقيمم البرنامج"
    static let share = "نشر التطبيق"
    static let logOut = "تسجيل الخروج"
    static let editProfile = "تعديل الملف الشخصي"
    static let editingDone = "تم التعديل بنجاح"
    
    static let appStoreLink = "https://apps.apple.com/us/app/educational/id1583405410"
    
    


    
    
}
