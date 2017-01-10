//
//  ViewController.m
//  Waether2
//
//  Created by Dmitry on 02.01.17.
//  Copyright © 2017 Dmitry. All rights reserved.
//

#import "ViewController.h"
#import "Backendless.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
- (IBAction)signUpDidTouchUpInside:(id)sender
{
    //В примере были эти строки, но в дальнейшем не пригодились. Оставил, что бы разбираться с авторизацией/регистрацией в дальнейшем
    
#warning Ну тогда вот тебе сразу и задание. Сделать еще одну таблицу, в которой будут отображаться только записи от твоего пользователя)
// Перенёс на MWASignUpViewController
    BackendlessUser *user = [BackendlessUser new];
    user.email = @"Dmitry@gmail.com";
    user.password = @"123";
    [backendless.userService registering:user];


}
*/

@end
