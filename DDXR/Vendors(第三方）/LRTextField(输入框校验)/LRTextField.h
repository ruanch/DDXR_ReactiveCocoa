//
//  LRTextField.h
//  LRTextField
//
//  Created by LR Studio on 7/26/15.
//  Copyright (c) 2015 LR Studio. All rights reserved.
//

/*
 ==========================Example=============================
 LRTextField *textFieldEmail = [[LRTextField alloc] initWithFrame:CGRectMake(20, 70, 260, 30) labelHeight:15 style:LRTextFieldStyleEmail]; // init with pre-defined style
 [self.view addSubview:textFieldEmail];
 
 LRTextField *textFieldPhone = [[LRTextField alloc] initWithFrame:CGRectMake(20, 150, 260, 30) labelHeight:15];
 textFieldPhone.placeholder = @"Phone";
 textFieldPhone.hintText = @"(Optional)";
 textFieldPhone.format = @"(###)###-####"; // set format for segment input string
 textFieldPhone.keyboardType = UIKeyboardTypePhonePad;
 [self.view addSubview:textFieldPhone];
 
 LRTextField *textFieldValidation = [[LRTextField alloc] initWithFrame:CGRectMake(20, 240, 260, 30) labelHeight:15];
 textFieldValidation.placeholder = @"Validation Demo";
 textFieldValidation.hintText = @"Enter \"abc\"";
 [textFieldValidation setValidationBlock:^NSDictionary *(LRTextField *textField, NSString *text) {
 [NSThread sleepForTimeInterval:1.0];
 if ([text isEqualToString:@"abc"]) {
 return @{ VALIDATION_INDICATOR_YES : @"Correct" };
 }
 return @{ VALIDATION_INDICATOR_NO : @"Error" };
 }];
 [self.view addSubview:textFieldValidation];
 
 LRTextField *textFieldCustom = [[LRTextField alloc] initWithFrame:CGRectMake(20, 320, 260, 30) labelHeight:15];
 textFieldCustom.placeholder = @"Placeholder";
 textFieldCustom.placeholderActiveColor = [UIColor redColor];
 textFieldCustom.placeholderInactiveColor = [UIColor blackColor];
 textFieldCustom.hintText = @"Purple hint";
 textFieldCustom.hintTextColor = [UIColor purpleColor];
 textFieldCustom.enableAnimation = NO;
 [self.view addSubview:textFieldCustom];

 - (IBAction)hideKeyboardPressed:(id)sender
 {
    [self.view endEditing:YES];
 }
*/


#import <UIKit/UIKit.h>

#define VALIDATION_INDICATOR_YES @"YES"
#define VALIDATION_INDICATOR_NO  @"NO"
#define VALIDATION_INDICATOR_COLOR @"VALIDATE_COLOR"

@class LRTextField;

typedef NS_ENUM(NSInteger, LRTextFieldStyle)
{
    LRTextFieldStyleEmail,          //Default placeholder: 'Email';   Default validation: email validation regular expression
    LRTextFieldStylePhone,          //Default placeholder: 'Phone';   Default format: '###-###-####'
    LRTextFieldStylePassword,       //Default placeholder: 'Password; Default: secure text entry
    LRTextFieldStyleNone,           //Default style
};

/**
 * Validation block to be applied to validate raw text synchronously or asynchronously.
 * @param text The raw text of the text field
 * @param textField
 * @return A dictionary with key of YES or NO and value of string to be displayed.
 */
typedef NSDictionary *(^ValidationBlock)(LRTextField *textField, NSString *text);

IB_DESIGNABLE
@interface LRTextField : UITextField

- (instancetype) initWithFrame:(CGRect)frame;

/**
 * Init with float label height
 *
 * @param frame The frame of text field
 * @param labelHeight Height of float label when displayed above textfield
 */
- (instancetype) initWithFrame:(CGRect)frame labelHeight:(CGFloat)labelHeight;

/**
 * Init with float label height and pre-defined style
 *
 * @param frame The frame of text field
 * @param labelHeight Height of float label when displayed above textfield
 * @param style Pre-defined style
 */
- (instancetype) initWithFrame:(CGRect)frame labelHeight:(CGFloat)labelHeight style:(LRTextFieldStyle)style;

/**
 * Style of text: email, phone, password
 * Default is nil.
 */
@property (nonatomic, assign) LRTextFieldStyle style;

/**
 * Height of floating Label.
 * Default is 0.5 * self.frame.height
 */
@property (nonatomic, assign) IBInspectable CGFloat floatingLabelHeight;

/**
 * Mask of input text. '#' represent any single character input
 * Default is nil.
 */
@property (nonatomic, copy) IBInspectable NSString *format;

/**
 * Text without mask.
 * Default is nil.
 */
@property (nonatomic, copy, readonly) NSString *rawText;

/**
 * Indicate whether the floating label animation is enabled.
 * Default is YES.
 */
@property (nonatomic) IBInspectable BOOL enableAnimation;

/**
 * Text color to be applied to floating placeholder text when editing.
 * Default is tint color.
 */
@property (nonatomic, strong) IBInspectable UIColor *placeholderActiveColor;

/**
 * Text color to be applied to floating placeholder text when not editing.
 * Default is 70% gray.
 */
@property (nonatomic, strong) IBInspectable UIColor *placeholderInactiveColor;

/**
 * Text to be displayed in the floating hint label.
 * Default is nil.
 */
@property (nonatomic, copy) IBInspectable NSString *hintText;

/**
 * Text color to be applied to the floating hint text.
 * Default is [UIColor grayColor].
 */
@property (nonatomic, strong) IBInspectable UIColor *hintTextColor;

/**
 * Set validation block.
 *
 * @param block The block to be applied to validate input text and return valid and invalid output.
 */
- (void) setValidationBlock:(ValidationBlock)block;

@end
