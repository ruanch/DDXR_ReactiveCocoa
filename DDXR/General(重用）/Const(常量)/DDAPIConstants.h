







#ifndef DDAPIConstants_h
#define DDAPIConstants_h

static NSString *const DDNETWORK_CODE     = @"code";
static NSString *const DDNETWORK_DATA     = @"data";
static NSString *const DDNETWORK_MESSAGE  = @"message";



typedef NS_ENUM(NSInteger, DDResponseStatus)
{
    DDResponseStatusSuccess         = 1,/**< 业务成功*/
    DDResponseStatusFailure         = 2,/**< 业务失败*/
    DDResponseStatusTokenOverdue    = 3,/**< Token过期*/
};

/**
 * 缓存
 */
typedef NS_ENUM(NSUInteger, DDURLResponseStatus)
{
    DDURLResponseStatusSuccess, //作为底层，请求是否成功只考虑是否成功收到服务器反馈。至于签名是否正确，返回的数据是否完整，由上层的RTApiBaseManager来决定。
    DDURLResponseStatusErrorTimeout,
    DDURLResponseStatusErrorNoNetwork // 默认除了超时以外的错误都是无网络错误。
};
static BOOL kDDShouldCache = YES;
static NSUInteger kDDCacheCountLimit = 1000; // 最多1000条cache
static NSTimeInterval kMCCacheOutdateTimeSeconds = 300; // 5分钟的cache过期时间
static NSString *kServiceType = @"SERVICE_TYPE";
/**
 *  同步数据
 */
static NSString *const SYNC_DATA   = @"api/DataSync/GetSyncData";/**< 同步数据*/

static NSString *const CHECK_QUIT_GROUP           = @"api/Group/CheckForQuitGroup";/**< 检测是否可以退出群组*/
static NSString *const FETCH_DETAIL_PATH           = @"api/Group/GetGroupDetail2";/**< 获取聚会模式群组详情*/
static NSString *const UPDATE_MY_LOCATION          = @"api/Activity/UpdateMyLocation";/**< 更新我的位置-聚会模式*/
static NSString *const DELETE_ACTIVITY_PHOTO       = @"api/Activity/DeleteActivityPhoto";/**< 删除聚会照片*/
static NSString *const UPLOAD_ACTIVITY_PHOTO       = @"api/Activity/UploadActivityPhoto";/**< 上传聚会照片*/
static NSString *const ALL_UNARRIVE_STATUS         = @"api/Activity/RequestAllNotArrivedUpdate";/**< 请求所有未到达参与者更新状态*/
static NSString *const ACTIVITY_SETTING            = @"api/Activity/GetSettingsInActivity";/**< 获取我在活动中的设置*/
static NSString *const TRANSFER_GROUP              = @"api/Group/TransferGroup";/**< 转让群组*/
static NSString *const PUBLIC_PHONE                = @"api/Group/PublishPhoneNo";/**< 公开📱号*/
static NSString *const ACTIVITY_OF_GROUP           = @"api/Activity/GetActivitiesOfGroup";/**< 获取群组中的活动*/
static NSString *const ACTIVITY_DETAIL             = @"api/Activity/GetActivityDetail";/**< 获取活动详情*/
static NSString *const UPDATE_ACTIVITY             = @"api/Activity/UpdateActivity";/**< 更新活动信息*/
static NSString *const GET_ACTIVITY_GROUP_DETAIL   = @"api/Group/GetActivityGroupDetail";/**< 获取活动的群组详情*/
static NSString *const GET_ACTIVITY_DETAIL         = @"api/Activity/GetActivityDetail";/**< 获取活动详情*/
static NSString *const ACCEPT_CONTACTS_ASSIGN      = @"api/Message/AcceptActivityContactAssignment";/**< 接受联络人指派*/
static NSString *const COMPLAIN_REPORT             = @"api/ComplainReport/Report"; /**< 投诉*/
static NSString *const GET_COMPLAINT_DETAILS       = @"api/ComplainReport/GetComplaintDetails";/**<获取投诉详情*/
static NSString *const COMPLAIN_REPORT_APPEAL        = @"api/ComplainReport/Appeal";/**<发起申诉*/
static NSString *const FRIEND_APPLICATION          = @"api/Friend/GetFriendApplication";/**< 获取好友申请*/
static NSString *const SEARCH_USER                 = @"api/User/SearchUser";/**< 搜索好友*/
static NSString *const FEED_BACK_SUBMIT            = @"api/Feedback/Submit";/**< 反馈*/
static NSString *const PROCESS_MESSAGE             = @"api/Message/ProcessMessage";/**< 删除一条验证消息*/


static NSString *const GET_LOGIN                       = @"api/ChatWeb/Login";/**< 登录*/
static NSString *const GET_VCODE                       = @"api/ChatWeb/GetVerificationCode";/**< 获取验证码*/
static NSString *const GET_SEARCH_USER                 = @"api/ChatWeb/SearchUser";/**< 搜索好友*/
static NSString *const GET_USER_INFO                   = @"api/User/GetUserInfo";/**< 获取用户信息*/
static NSString *const GET_TOKEN                       = @"api/ChatWeb/GetToken";/**< 获取Token*/
static NSString *const GET_VERIFY_CELLPHONE            = @"api/ChatWeb/VerifyCellphone";/**< 验证验证码/手机号*/
static NSString *const NEW_GROUP                       = @"api/Group/GetJoinGroupInvitation";/**< 获取新的群组*/
static NSString *const GET_GROUP_DETAIL                = @"api/Group/GetGroupDetails";/**< 获取群组详细信息*/
static NSString *const GET_MY_FRIENDS                  = @"api/LocalContacts/GetMyFriends";/**< 获取我的好友*/
static NSString *const DELETE_FROM_MY_FRIENDS          = @"api/Friend/DeleteFromMyFriends";/**< 删除好友*/
static NSString *const GET_MY_GROUPS                   = @"api/CreateGroup/GetMyGroups";/**< 获取我的群组*/
static NSString *const FUZZY_SEARCH                    = @"api/Group/FuzzySearch";/**< 群组活动模糊查询*/
static NSString *const GET_STATUS                      = @"api/ChatWeb/GetStatus";/**< 获取群组状态*/
static NSString *const GET_SEND_IS_APP_OPEN            = @"api/ChatWeb/SendAppOpenStatus";/**< App目前的状态是否打开*/
static NSString *const GET_APPLY_JOIN_GROUP            = @"api/Group/ApplyAddingAsGroup";/**< 申请加入群组*/
static NSString *const GET_SEARCH_GROUP                = @"api/Group/SearchGroup";/**< 搜索群组*/
static NSString *const GET_USER_STATUS_ONLINE_SETTINGS = @"api/Group/GetUserStatusOnlineSettings";/**< 获取用户在在本群的在线时间设置*/
static NSString *const GET_STATUS_REQUEST_HISTORY      = @"api/Group/GetAdminPagingRequestRecords";/**< 获取用户收到的状态请求历史记录  */
static NSString *const GET_PAGING_HISTORY              = @"api/Group/GetPagingHistory";/**< 管理员获取历史记录  */
static NSString *const GET_LOGOUT                      = @"api/ChatWeb/Logout";/**< 登出  */
static NSString *const GET_PAGING_GROUP_MENBER         = @"api/Group/PagingGroupMember";/**< 单独寻呼成员  */
static NSString *const GET_PAGTING_ALL_ONLINE_MENBER   = @"api/Group/PagingAllOnpenedAndOnlineMember";/**< 寻呼全体在线成员  */
static NSString *const GET_VALIDATION_MSG              = @"api/Message/GetValidationMsg1";/**< 获取验证消息-新接口 */
static NSString *const GET_MSG_NOTIFICATION            = @"api/Message/GetNotifications";/**< 获取消息通知 */
static NSString *const GET_ROUTING                     = @"api/Activity/GetUnfinishedActivities";/**< 获取行程 */
static NSString *const GET_RCIMGROUPID                 = @"api/Group/GetIMGroupId";/**< 获取即时聊天所用群组id */
static NSString *const GET_RCIMGTOKEN                = @"api/User/ApplyNewIMToken";/**< 重新获取IMToken*/

static NSString *const GET_ACCPET_JOIN_APPLY           = @"api/Group/AcceptGroupInvitation";/**< 允许入群 */
static NSString *const GET_QUIT_GROUP                  = @"api/Group/QuitGroup";/**< 退出群组  */
static NSString *const GET_UNREAD_GROUP_MESSAGE_COUNT  = @"api/Message/GetUnreadGroupMessageCount";/**< 获取未读消息数量*/
static NSString *const GET_RESPONSE_PAGING             = @"api/Group/ResponsePaging";/**< 响应寻呼请求*/
static NSString *const GET_ALL_UnreadMessageCount      = @"api/Message/GetAllUnreadMessageCount";/**< 获取所有未读取消息数量*/
static NSString *const GET_ACTIVITY_ALBUM              = @"api/Activity/GetActivityAlbum";/**< 获取活动相册*/
static NSString *const GET_ACTIVITY_ALBUM_CAPACITY    = @"api/Activity/GetActivityAlbumCapacity";/**<获取获取聚会相册容量及剩余空间*/
static NSString *const POST_PARTICIPANT_STATUS         = @"api/Activity/GetAllParticipantStatus";/**< 获取与会者状态*/
static NSString *const POST_TERMINATE_ACTIVITY         = @"api/Activity/TerminateActivity";/**< 结束活动*/
static NSString *const POST_CANCEL_ACTIVITY            = @"api/Activity/CancelActivity";/**< 取消活动*/
static NSString *const POST_UPDATE_ACTIVITY_SETTING    = @"api/Activity/UpdateSettingsInActivity";/**< 更新我在活动中的设置*/
static NSString *const POST_CREAT_ACTIVITY_GROUP       = @"api/Group/CreateActivityGroup";/**< 创建聚会模式群组*/
static NSString *const POST_CREAT_ACTIVITY             = @"api/Activity/CreateActivity";/**< 创建聚会*/
static NSString *const SCAN_ACTIVITY             = @"api/Activity/ScanActivity";/**< 扫描聚会*/
static NSString *const POST_REGISTER                   = @"api/ChatWeb/Register";/**< 注册*/
static NSString *const POST_UPDATE_USER_INFO           = @"api/User/UpdateUserInfo";/**< 更新用户信息*/
static NSString *const POST_UPDATE_GROUP_INFO          = @"api/UpdateGroup/UpdateGroupInfo";/**< 更新用户信息*/
static NSString *const POST_APPLY_ADDING_FRIEND        = @"api/Friend/ApplyAddingAsFriend";/**< 申请添加好友*/
static NSString *const POST_ACCEPT_INVITATION          = @"api/NonFriend/AcceptFriendInvitation";/**< 接受好友邀请*/
static NSString *const POST_CREAT_GROUP                = @"api/CreateGroup/CreateGroup";/**< 创建群组*/
static NSString *const POST_DELETE_MENBERS             = @"api/DeleteGroupMember/DeleteGroupMember";/**< 删除群组成员*/
static NSString *const POST_BATCH_SEARCH_USER          = @"api/LocalContacts/BatchSearchUser";
static NSString *const POST_ADD_GROUP_MENBER           = @"api/AddGroupMember/AddGroupMember";/**< 添加群组成员*/
static NSString *const POST_SET_ADMIN                  = @"api/SetAdmin/SetAdmin";/**< 设置管理员权限*/
static NSString *const POST_ACCEPT_GROUP_INVITATION    = @"api/NonGroup/AcceptGroupInvitation";/**< 接受群组邀请*/
static NSString *const POST_SEND_MY_CURRENT_STATUS     = @"api/Group/UpdateUserCurrentStatus";/**< 更新我当前的状态*/
static NSString *const POST_USER_CURRENT_UPDATES       = @"api/Group/UpdateUserCurrentStatus";/**< 更新用户当前状态(更新用户当前状态)*/
static NSString *const POST_CHANGE_PWD                 = @"api/User/ChangePassword";/**< 修改密码*/
static NSString *const POST_DETECT_VERSION                 = @"api/Version/DetectVersion";/**< 更新版本*/
static NSString *const POST_GET_ACTIVITIES_GROUP       = @"api/Activity/GetActivitiesOfGroup";/**< 获取群组中的活动*/

static NSString *const GET_INVITE_FRIEND               = @"api/User/InviteFriend" ;/**< 邀请好友*/
static NSString *const POST_CREATE_GROUP_FOR_CHAT      = @"api/Group/CreateGroupForChat";/**< 通讯录发起聊天*/

static NSString *const GET_SERVERS_URL                 = @"api/Config/GetServersUrl" ;/**< 获得url*///已更换成下面的接口加入了一个小助手
static NSString *const GET_SYSTEM_PROFILE              = @"/api/Config/GetSystemProfile" ;/**< 获得url*/

static NSString *const GET_SHARING_KEY                 = @"api/Sharing/GetSharingKey" ;/**< 获得sharingKey*/
static NSString *const POST_SET_VISIBILITY             = @"api/Sharing/SetVisibility" ;/**< 设置可见性*/



static NSString *const POST_COOK_QUERY                 = @"cook/query"; /**< 设置查询

/*****************名片************************/

//static NSString *const POST_GET_MY_CARDS         = @"api/BusinessCard/GetMyCards";/**< 获取用户所有的有效名片*/
//static NSString *const POST_GET_MY_CARD_TAG_LIST = @"api/BusinessCard/GetMyCardTagList";/**< 获取用户所有的有效名片标签*/
static NSString *const POST_CREATE_CARD          = @"api/BusinessCard/CreateCard"; /**< 添加新的名片*/
static NSString *const POST_UPDATE_CARD          = @"api/BusinessCard/UpdateMyCard"; /**< 更新我的名片*/
static NSString *const POST_DELETE_FROM_MY_CARDS = @"api/BusinessCard/DeleteFromMyCards"; /**< 删除我的名片*/

static NSString *const POST_GET_CARD_EXCHANGE_REQUEST_COUNT = @"api/BusinessCard/GetCardExchangeRequestCount"; /**< 获取未处理的名片交换请求数量*/

//static NSString *const POST_GET_MY_CARD_HOLDER = @"api/BusinessCard/GetMyCardHolder"; /**< 获取我的名片夹*/

static NSString *const POST_DELETE_CARDS_FROM_CARDHOLDER = @"api/BusinessCard/DeleteCardsFromCardHolderByUser"; /**< 删除某人的所有名片*/

//static NSString *const POST_GET_CARDS_FROM_CARDHOLDER_BYUSER         = @"api/BusinessCard/GetCardsFromCardHolderByUser";/**< 获取用户持有的指定用户的所有名片*/

static NSString *const POST_DELETE_FROM_MY_CARDHOLDER_BYID         = @"api/BusinessCard/DeleteFromMyCardHolderById";/**< 删除用户持有的指定用户的名片*/

static NSString *const POST_GET_LAST_EXCHANGED_CARD         = @"api/BusinessCard/GetLastExchangedCard";/**< 获取上一次交换出的名片*/

static NSString *const POST_REQUEST_TO_EXCHANGED_CARD         = @"api/BusinessCard/RequestToExchangeCard";/**<  请求交换名片*/

static NSString *const POST_GET_CARD_EXCHANGE_REQUEST         = @"api/BusinessCard/GetCardExchangeRequest";/**< 获取名片交换请求*/

static NSString *const POST_ACCEPT_CARD_EXCHANGE_REQUEST         = @"api/BusinessCard/AcceptCardExchangeRequest";/**<  获取用户的名片交换请求*/

static NSString *const POST_GET_CARD_EXCHANGE_REQUEST_DETAIL         = @"api/BusinessCard/GetCardOfExchangeRequest";/**< 获取名片交换请求方给出的名片*/

static NSString *const POST_DELETE_GROUP_MEMBER               = @"api/DeleteGroupMember/DeleteGroupMember";/**< 群组删除成员*/

static NSString *const POST_GROUP_CLEAR_GROUP               = @"api/Group/ClearGroup";/**< 清除已退群组*/

static NSString *const POST_RESTORE_IMGROUP_MEMBER = @"api/Group/RestoreIMGroupMember";/**<修复聊天群成员*/

/*****************积分************************/

static NSString *const POST_SIGN_IN           = @"api/Credit/DailySignIn";/**< 用户签到 */

static NSString *const POST_BONUS_POINT_PURCHASE           = @"api/Credit/Purchase";/**< 积分购买 */

/*****************群组************************/
static NSString *const POST_ATTACHTOGROUP           = @"api/Activity/AttachToGroup";/**< 附加聚会到已有的群组 */

#endif /* DDAPIConstants_h */
