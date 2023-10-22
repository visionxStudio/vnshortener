class ApiLink {
  //static const base = "https://digicoach.anmup.org/api/v1";
  // static const base = "https://api.digicoachme.com/api/v1";

  // notification
  static const getNotification = "/notifications";

  // Authentication
  static const login = '/firebase/token/verify';
  static const signup = '/api/sanctum/register';

  // Notifications
  // static const getNotification = '/notifications';
  // payment history
  static const getPaymentHistory = '/payments';
  // payment invoice
  static const getPaymentInvoice = 'invoice/pdf/';

  static const getRatings = '/ratings';

  /// Course [GET] related
  static const getInterestTopics = "/interest/topics?interest_id=";

  /// Course [POST] Related
  static const createCourse = "/course";
  static const createTopic = "/interest/topics";

  /// Course [GET] Related
  static const getCourse = "/course";

  /// [GET] coach related
  static const getCoachList = "/coaches";
  static const getCoachDetail = "/coach/";
  static const getCoachOneMonthAppointment = "/month/appointment/";
  static const updateCoachSkills = "/coach/skill";
  static const getCoachSkills = "/coach/skill";
  static const getUserNextAppointment = "/next/appointment/";

  // [Delete]  coach avaibility
  static const deleteCouchAvaibility = "/delete-avaibility";
  static const getCoachAvaibilityForMonth =
      "/coach/availability/timeslot?month=";
  static const getCoachAvaibilityForDay = "/coach/availability/timeslot?day=";

  /// [POST] Coach Related
  static const createCoach = "/coach";
  static const updateUserProfile = "/update-user";
  static const uploadCoachDocuments = "/document";
  // Create a new schedule
  static const createCoachSchedule = "/new/avaibility";
  static const deleteAvaibility = "/delete-avaibility";
  // update schedule if already created
  static const updateTimeSlot = "/update/timeslot";

  // Get single day time slot
  static const getSingleDayTimeslot = "/coach/availability/timeslot?day=";

  static const updateCourse = "/course/";

  //profile settings Links
  static const getGoalSetting = "/user/setting/goals";
  static const wellbeing = "/user/setting/well-being";
  static const bio = "/user/bio";

  static const getMe = "/me";
  // static const studentProfiledetail = "/me";
  static const coachAviliablity = "/coach/availability";
  static const enrolltoCourse = "/enroll";

  //upload caoch image
  static const userImageUpload = "/user/image";

  static const paymentDetail = "/user-payment-detail"; //user-payment-detail

  ///getavailabilit [GET]
  static const getAvailability = "/coach/availability";

  ///  Appointment Related [POST]
  static const getOneDayAppointment = "/appointment";

  /// All User Activity related
  static const createComment = "/create-comment";
  static const switchProfile = "/switch";

  static const dashboard = "/dashboard";

  //  Message and chat related
  static const getChats = "/chats";
  static const getMessages = "/chat/";
  static const postChat = "/message";
  static const logOut = "/logout";

  // [GET] user notifications settings
  static const getNotificationSettings = "/user/setting/notification";
  static const switchAvaibilityStatus = "coach/availability/status";

  static const likeUser = "/like";
  static const favouriteUser = "/favourite";
  static const getFavourites = "/favourites";

  static const getCoursePackages = "/course-package";

  static const getAssociates = "/associates";
  static const getCoachMyAvaibility = "/my/availability";

  static const getCoupon = "/coupons";
  static const buyCoupon = "/coupon";
  static const redeemCoupon = "/coupon/redeem";

  static const location = "/location";

  static const googleTokenVerify = "/google/token/verify";
}
