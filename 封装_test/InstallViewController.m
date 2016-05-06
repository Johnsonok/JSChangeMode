//
//  InstallViewController.m
//  piaDemo
//
//  Created by 姜杉 on 16/4/26.
//  Copyright © 2016年 Charlie. All rights reserved.
//

#import "InstallViewController.h"
#import <Masonry.h>
#import "Model.h"
#import "NSObject+GetPropertyName.h"
#import "UIColor+MemberColor.h"
#define widthRate           appFrame.size.width/320.0
#define heightRate          appFrame.size.height/568.0

@interface InstallViewController ()<UITextFieldDelegate,UIActionSheetDelegate>
@property (nonatomic ,strong)UITextField         * PhoneLabel;
@property (nonatomic ,strong)UITextField         * ValidateLabel;
@property (nonatomic ,strong)UITextField         * PasswordLabel;
@property (nonatomic ,strong)UIView              * LineView1;
@property (nonatomic ,strong)UIView              * LineView2;
@property (nonatomic ,strong)UIView              * LineView3;
@property (nonatomic ,strong)UIButton            * ValidateButton;
@property (nonatomic ,strong)UIButton            * SubmitButton;
@property (nonatomic ,strong)UIButton            * ProtocolButton;
@property (nonatomic ,strong)UILabel             * ProtocolLabel;
@property (nonatomic ,strong)UIButton            * ProtocolUserButton;
@property (nonatomic ,assign)BOOL                ifAgreeProtocol;
@property (nonatomic ,assign)BOOL                ifVoice;
@property (nonatomic ,strong)Model               *model;
@property (nonatomic ,assign)BOOL                isgreen;


@end

@implementation InstallViewController
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:22],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    UIBarButtonItem *backbtn = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStyleDone target:self action:@selector(backclick)];
    self.navigationItem.leftBarButtonItem = backbtn;
    
    [super.navigationController setNavigationBarHidden:NO animated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    _model = [Model shareInstance];
    [self setupUI];
    self.title = @"注册";
    self.view.backgroundColor = [UIColor colorWithRed:32.0/255.0 green:33.0/255.0 blue:34.0/255.0 alpha:1.0];

}

- (void)night {
    [self.ProtocolButton setNeedsDisplay];
    
}

- (void)setupUI{
    [self.view addSubview:self.PhoneLabel];
    [self.view addSubview:self.ValidateLabel];
    [self.view addSubview:self.PasswordLabel];
    [self.view addSubview:self.LineView1];
    [self.view addSubview:self.LineView2];
    [self.view addSubview:self.LineView3];
    [self.view addSubview:self.ProtocolButton];
    [self.view addSubview:self.ProtocolLabel];
    [self.view addSubview:self.ProtocolUserButton];
    [self.view addSubview:self.ValidateButton];
    [self.view addSubview:self.SubmitButton];
    [self makeConstraints];
}

- (void)makeConstraints{
    [_PhoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo (self.view).offset (64+33);
        make.left.mas_equalTo (self.view).offset(19);
        make.right.mas_equalTo (self.view).offset(-19);
        make.height.mas_equalTo (17);
    }];
    [_LineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_PhoneLabel.mas_bottom).offset(1);
        make.left.mas_equalTo (self.view).offset(19);
        make.right.mas_equalTo (self.view).offset (-19);
        make.height.mas_equalTo(1);
    }];
    [_ValidateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_LineView1.mas_bottom).offset(33);
        make.left.mas_equalTo(_PhoneLabel);
        make.right.mas_equalTo(_PhoneLabel);
        make.height.mas_equalTo(17);
    }];
    [_LineView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_ValidateLabel.mas_bottom).offset(1);
        make.left.mas_equalTo (self.view).offset(19);
        make.right.mas_equalTo (self.view).offset (-19);
        make.height.mas_equalTo(1);
    }];
    [_PasswordLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_LineView2.mas_bottom).offset(33);
        make.left.mas_equalTo(_PhoneLabel);
        make.right.mas_equalTo(_PhoneLabel);
        make.height.mas_equalTo(17);
    }];
    [_LineView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_PasswordLabel.mas_bottom).offset(1);
        make.left.mas_equalTo (self.view).offset(19);
        make.right.mas_equalTo (self.view).offset (-19);
        make.height.mas_equalTo(1);
    }];
    [_ValidateButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(_LineView2).offset(-4);
        make.size.mas_equalTo (CGSizeMake(82, 23));
        make.right.mas_equalTo(_PhoneLabel);
    }];
    [_SubmitButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_LineView3.mas_bottom).offset(60);
        make.left.mas_equalTo(self.view).offset(19);
        make.right.mas_equalTo(self.view).offset(-19);
        make.height.mas_equalTo(40);
    }];
    [_ProtocolLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(_SubmitButton.mas_top).offset(-20);
        make.left.mas_equalTo (_ProtocolButton.mas_right).offset(6);
        make.size.mas_equalTo(CGSizeMake(115, 20));
    }];
    [_ProtocolUserButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(_SubmitButton.mas_top).offset(-20);
        make.left.mas_equalTo(_ProtocolLabel.mas_right).offset(-10);
        make.size.mas_equalTo(CGSizeMake(110, 20));
    }];
    [_ProtocolButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_PhoneLabel);
        make.bottom.mas_equalTo(_SubmitButton.mas_top).offset(-25);
        make.size.mas_equalTo(CGSizeMake(15, 15));
    }];
}

- (void)backclick{

}
- (void)submitclick{

    }

- (void)validateclick{
    UIActionSheet *sheet = [[UIActionSheet alloc]initWithTitle:@"请选择方式" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"绿色" otherButtonTitles:@"红色", nil];
    [sheet showInView:self.view];

}
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0) {
            [Model shareInstance].isgreen = YES;
    }
    else{
        [Model shareInstance].isgreen = NO;
    }
    }

- (void)protocolclick{

}
- (void)protocoUserlclick{

}
#pragma mark - Getter
- (UITextField *)PhoneLabel{
    if (!_PhoneLabel) {
        _PhoneLabel = [[UITextField alloc] init];
        _PhoneLabel.delegate = self;
        _PhoneLabel.backgroundColor = [UIColor clearColor];
        _PhoneLabel.placeholder = @"请输入手机号";
        _PhoneLabel.keyboardType = UIKeyboardTypeNamePhonePad;
        _PhoneLabel.font = [UIFont systemFontOfSize:18];
        [_PhoneLabel setTextColor:[UIColor whiteColor]];
        [_PhoneLabel setValue:[UIColor colorWithWhite:1 alpha:0.7] forKeyPath:@"_placeholderLabel.textColor"];
    }
    return _PhoneLabel;
}

- (UITextField *)ValidateLabel{
    if (!_ValidateLabel) {
        _ValidateLabel = [[UITextField alloc] init];
        _ValidateLabel.delegate = self;
        _ValidateLabel.backgroundColor = [UIColor clearColor];
        _ValidateLabel.placeholder = @"请输入验证码";
        _ValidateLabel.keyboardType = UIKeyboardTypeNamePhonePad;
        _ValidateLabel.font = [UIFont systemFontOfSize:18];
        [_ValidateLabel setTextColor:[UIColor whiteColor]];
        [_ValidateLabel setValue:[UIColor colorWithWhite:1 alpha:0.7] forKeyPath:@"_placeholderLabel.textColor"];
    }
    return _ValidateLabel;
}

- (UITextField *)PasswordLabel{
    if (!_PasswordLabel) {
        _PasswordLabel = [[UITextField alloc] init];
        _PasswordLabel.delegate = self;
        _PasswordLabel.backgroundColor = [UIColor clearColor];
        _PasswordLabel.placeholder = @"请输入密码";
        _PasswordLabel.keyboardType = UIKeyboardTypeNamePhonePad;
        _PasswordLabel.secureTextEntry = YES;
        _PasswordLabel.font = [UIFont systemFontOfSize:18];
        [_PasswordLabel setTextColor:[UIColor whiteColor]];
        [_PasswordLabel setValue:[UIColor colorWithWhite:1 alpha:0.7] forKeyPath:@"_placeholderLabel.textColor"];
    }
    return _PasswordLabel;
}

- (UIView *)LineView1{
    if (!_LineView1) {
        _LineView1 = [[UIView alloc]init];
        _LineView1.backgroundColor = [UIColor whiteColor];
    }
    return _LineView1;
}

- (UIView *)LineView2{
    if (!_LineView2) {
        _LineView2 = [[UIView alloc]init];
        _LineView2.backgroundColor = [UIColor whiteColor];
    }
    return _LineView2;
}

- (UIView *)LineView3{
    if (!_LineView3) {
        _LineView3 = [[UIView alloc]init];
        _LineView3.backgroundColor = [UIColor whiteColor];
    }
    return _LineView3;
}

- (UIButton *)ValidateButton{
    if (!_ValidateButton) {
        _ValidateButton = [UIButton buttonWithType:UIButtonTypeSystem];

        [_ValidateButton setTintColor:[UIColor whiteColor]];
        [_ValidateButton setTitle:@"获取验证码" forState:UIControlStateNormal];
        _ValidateButton.layer.cornerRadius = 8;
        [_ValidateButton addTarget:self action:@selector(validateclick) forControlEvents:UIControlEventTouchUpInside];
    }
    _ValidateButton.backgroundColor = [UIColor getbuttonColor];
//            _ValidateButton.backgroundColor =self.model.buttonColor;
    return _ValidateButton;
}

- (UIButton *)SubmitButton{
    if (!_SubmitButton) {
        _SubmitButton = [UIButton buttonWithType:UIButtonTypeSystem];

        [_SubmitButton setTintColor:[UIColor whiteColor]];
        [_SubmitButton setTitle:@"提交" forState:UIControlStateNormal];
        _SubmitButton.layer.cornerRadius = 8;
        [_SubmitButton addTarget:self action:@selector(submitclick) forControlEvents:UIControlEventTouchUpInside];
    }
//            _SubmitButton.backgroundColor = self.model.buttonColor;
    _SubmitButton.backgroundColor = [UIColor getbuttonColor];
    return _SubmitButton;
}

- (UIButton *)ProtocolButton{
    if (!_ProtocolButton) {
        _ProtocolButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_ProtocolButton setTintColor:[UIColor whiteColor]];
        [_ProtocolButton setImage:[UIImage imageNamed:@"zhuce_xuanzhong"] forState:UIControlStateNormal];
        [_ProtocolButton addTarget:self action:@selector(protocolclick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _ProtocolButton;
}

- (UILabel *)ProtocolLabel{
    if (!_ProtocolLabel) {
        _ProtocolLabel = [[UILabel alloc]init];
        _ProtocolLabel.text = @"我已阅读并同意";
        _ProtocolLabel.textColor = [UIColor whiteColor];
        _ProtocolLabel.font = [UIFont systemFontOfSize:16];
    }
    return  _ProtocolLabel;
}

- (UIButton *)ProtocolUserButton{
    if (!_ProtocolUserButton) {
        _ProtocolUserButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_ProtocolUserButton setTitle:@"《用户协议》" forState:UIControlStateNormal];
        _ProtocolUserButton.backgroundColor = [UIColor clearColor];
        [_ProtocolUserButton addTarget:self action:@selector(protocoUserlclick) forControlEvents:UIControlEventTouchUpInside];

    }
//    [_ProtocolUserButton setTintColor:self.model.buttonColor];
    
    
    [_ProtocolUserButton setTintColor:[UIColor getbuttonColor]];
    return _ProtocolUserButton;
}
#pragma mark - Notification Method

/**
 *  This method is a Notification method,when Model-data changed notification will post this method to change UI
 */
- (void)setModel {
    
    /**
     *  BaseViewController Method to get all member's getter method.
     */
    [self getproperty];

    

}



@end
