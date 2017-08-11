






#ifndef DDMacros_h
#define DDMacros_h

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#ifdef DEBUG
#define DDLog(fmt,...) NSLog(fmt, ##__VA_ARGS__);
#else

#define DDLog(...)
#endif

/**
 需求要求两个版本，其中一个为上架app store版本，另一个为公司内部使用版本。上架版本只需要包含聚会这一块内容。
 
 @param >.0 1，则只包含聚会，0则包含所有功能
 */
#define MEETING_GROUP_ONLY 1 

/**
 *  提示框的展现时长
 *  @param >.0
 */
#define MIN_HUD_DISMISS_INTERVAL 1.5

/**
 *  info.plist中的URLSchema
 */
static NSString *const ZainarUrlSchema = @"zainar";


#define USERDEFAULT_SERVERS_URL     @"USERDEFAULT_SERVERS_URL"

#define PhotoUploadFinished             @"完成了本活动的照片多张上传"
#define OnePhotoUploadFinished          @"完成了一张照片多张上传"
#define OnePhotoUploadMarked            @"一张照片的上传状态被改变了"


#define WEB_SERVICE_ERROR_NOTIFICATION           @"WEB_SERVICE_ERROR_NOTIFICATION"
#define WEB_SERVICE_BUSINESS_FAILUE             @"WEB_SERVICE_BUSINESS_FAILUE"
#define WEB_SERVICE_NOT_REACHABLE             @"WEB_SERVICE_NOT_REACHABLE"
#define END_REFRESH_LOADMORE                   @"END_REFRESH_LOADMORE"

#define UPDATE_USER_NICKNAME                     @"UpdateUserNickName"/**<更新用户的nickName*/
#define UPDATE_USER_PHOTO                        @"UpdateUserPhoto" /**<更新用户的头像*/

#define WEB_SERVICE_TOKEN_OVERDUE_NOTIFICATION   @"WEB_SERVICE_TOKEN_OVERDUE_NOTIFICATION"
#define PHONE_BOOK_GETTED_NOTIFICATION           @"PHONE_BOOK_GETTED_NOTIFICATION"
#define PHONE_BOOK_GETTED_ERROR_NOTIFICATION     @"PHONE_BOOK_GETTED_ERROR_NOTIFICATION"
#define MENBER_SELECTED_NOTIFICATION             @"选择好群组成员了"
#define ADD_MEMBER_FROM_GROUP_NOTIFICATION       @"从现有群组中选择好成员了"
#define ADMIN_SETTED_NOTIFICATION                @"设置好Admin了"
#define MENBER_DELETED_NOTIFICATION              @"删除了一些成员"
#define NEED_REFRESH_GROUP_LIST                  @"需要去服务器更新一下群组数据"
#define NOTIFICATION_RECEIVE                     @"RECEVIE_NOTIFICATION_HANDLE"
#define SCAN_AGAIN_NOTIFICATION                  @"没有查找到群组，再扫一扫吧"


#define YOUR_FRIEND_REQUEST_HAS_BEEN_APPLY              @"你的好友申请被接受了"
#define SOME_ONE_INVITE_YOU_JION_GROUP_PUSHNOTIFICATION @"有人邀请你入组"
#define YOU_HASE_BEEN_PAGING                            @"有人寻呼你"
#define FREIDN_REQUEST_PUSHNOTIFICATION                 @"XXX请求添加你为好友"
#define MEETING_GROUP_INVITING_PUSHNOTIFICATION         @"邀请你加入聚会群组"
#define MEETING_INVITING_PUSHNOTIFICATION               @"邀请你加入聚会"
#define CONTACTS_SETTED_PUSHNOTIFICATION                @"设置为聚会联络人"
#define MG_STATUS_UPDATE_REQUEST_PUSHNOTIFICATION       @"请更新一下聚会状态"
#define CHANGE_CARD_PUSHNOTIFICATION                    @"收到名片交换推送"
#define BEEN_DELETE_FRIEND                              @"被删除好友了"

#define SHARING_KEY_PATH_TRAIL           @"Documents/SharingKey.plist"
#define SHARING_KEY_OBJECT_TYPE_ACTIVITY @"0"
#define SHARING_KEY_OBJECT_TYPE_GROUP    @"1"
#define SHARING_KEY_OBJECT_TYPE_USER     @"2"


#define DD_SCREEN_HEIGHT           UIScreen.mainScreen.bounds.size.height
#define DD_SCREEN_WIDTH            UIScreen.mainScreen.bounds.size.width
#define DD_IOS7_OR_LATER           ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
#define DD_IOS8_OR_LATER           ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
#define DD_IOS9_OR_LATER           ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0)
#define DD_VERSION                 [[[NSBundle mainBundle] infoDictionary] valueForKey:@"CFBundleShortVersionString"]
#define DD_IS_IPHONE               [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone

//在这TICK和Tock之间写上要测试运行时间的代码
#define TICK   NSDate *startTime = [NSDate date];
#define TOCK   NSLog(@"Time: %f", -[startTime timeIntervalSinceNow]);


#define DD_IS_NULL(string)          (!string || [string isEqual: @""] || [string isEqual:[NSNull null]])
//加一个去掉连续空格的
#define DD_IS_NULL_WHITE(string)          (!string || [string isEqual: @""] || [string isEqual:[NSNull null]] || ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0))

 //================================ UI ======================
#define AVATAR_PLACEHOLDER [UIImage imageNamed:@"placeholderAvtivityAvatar72"]
#define POSTER_PLACEHOLDER [UIImage imageNamed:@"CMGAvatar"]




#define MainStoryboard [UIStoryboard storyboardWithName:@"Main" bundle:nil]
#define LoginStoryboard [UIStoryboard storyboardWithName:@"Login" bundle:nil]
#define MeetingGroupStoryboard [UIStoryboard storyboardWithName:@"MeetingGroup" bundle:nil]

#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define LIGHT_GRAY           0x999999
#define TABBAR_TINCOLOR   THEME_TINT

#define SWIPE_BUTTON_ENABLE  0x31b304
#define SWIPE_BUTTON_DISABLE 0x999999

#define SWIPE_BUTTON_ENABLE_DING  0x2481df
#define SWIPE_BUTTON_DISABLE_DING 0xf0f0f0

#define AVALIABLE_STATE_ON   0x07be04
#define AVALIABLE_STATE_OFF  TEXT_GRAY
#define AVALIABLE_STATE_WATING  0xff9b34
#define AVALIABLE_STATE_FAILURE  0xff3826

#define DISABLE_COLOR 0xBEBEBE
#define SPERATOR_COLOR 0xe1e1e1

#define RETRY_GRAY 0xC8C7CE
#define DELETE_RED 0xFF3826

//======= Globle UI Define ========

#define THEME_TINT        0x00AAF0
#define THEME_GREEN       0x00bf00
#define THEME_ORANGE      0xffb43c
#define THEME_GRAY       0x00bf00

#define NAVIGATION_BLACK  0x3E444F

#define TEXT_GRAY 0x969696
#define TEXT_BLACK 0x323232

#define DEFAULT_TEXT_COLOR_LARGE  TEXT_BLACK
#define DEFAULT_TEXT_COLOR_TITLE  0xffffff
#define DEFAULT_TEXT_COLOR_MEDIUM TEXT_GRAY
#define DEFAULT_TEXT_COLOR_SMALL TEXT_GRAY
#define DEFAULT_TEXT_COLOR_PUNINESS TEXT_GRAY

#define TABLEVIEW_BACKGROUND_COLOR  [UIColor groupTableViewBackgroundColor]

#define DEFAULT_FONT_NAME @"FZLTHJW--GB1-0"

// 文字统一间距、字体大小等
static CGFloat DEFAULT_MARGIN_LITE = 12;
static CGFloat DEFAULT_SPACE = 10;
static CGFloat DEFAULT_MARGIN = 15;

static CGFloat DEFAULT_TEXT_SIZE_TITLE = 18.0;
static CGFloat DEFAULT_TEXT_SIZE_LARGE = 16.0;
static CGFloat DEFAULT_TEXT_SIZE_MEDIUM = 14.0;
static CGFloat DEFAULT_TEXT_SIZE_SMALL = 12.0;
static CGFloat DEFAULT_TEXT_SIZE_PUNINESS = 11.0;

// 默认头像长宽度
static CGFloat DEFAULT_AVATAR_WIDTH = 36;
static CGFloat DEFAULT_AVATAR_WIDTH_LARGE = 65;

// 默认一次加载数据数量。
#define DefaultPageCount 10
#define DefaultPageCountWithDouble 20

static UInt8 LIMITEED[15];

#define TEXTFIELD_CARACTER_LIMITED 15 //输入最大字符数
#define PHONE_NUMBER_LIMITED 11 //输入最大字符数
#define AVATAR_SCALE_RATIO 1.0f // 头像压缩比例
#define POSTER_SCALE_RATIO 1.0f // 海报压缩比例
#define PHOTO_SCALE_RATIO 2.0f // 相册照片压缩比例
#define CARD_SCALE_RATIO 5.0f // 名片压缩比例

// 默认tableView 头部偏移
#define DEFAULT_TABLEVIEW_INSET UIEdgeInsetsMake(-20, 0, 0, 0)

#endif /* DDMacros_h */
