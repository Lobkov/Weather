//
//  MWASignUpViewController.m
//  Waether2
//
//  Created by Dmitry on 04.01.17.
//  Copyright © 2017 Dmitry. All rights reserved.
//

#import "MWASignUpViewController.h"
#import "Backendless.h"

@interface MWASignUpViewController ()
@property (nonatomic,strong) NSArray *itemsSignUp;

@end


@implementation MWASignUpViewController

@synthesize itemsSignUp;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
      itemsSignUp = @[@"Name", @"Email"];
  
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View Data source 


- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger count = [itemsSignUp count];
    return count;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITextField *textField;
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SimpleTableItem"];
    }
    
    textField = (UITextField *) [cell.contentView viewWithTag:1001];
    textField.text = itemsSignUp[[indexPath row]];
    return cell;
}

#pragma mark - Actions

- (IBAction)SignUpDidTouchUpInside:(id)sender {

/*
//Синхронный метод
    @try {
        
        BackendlessUser *user = [BackendlessUser new];
        user.password = @"iAmWatchingU";
        user.name = @"Mike";
        [user setProperty:@"email" object:@"james.bond@mi6.uk"];
        
        [backendless.userService registering:user];
        return ;
    }
    
    @catch (Fault *fault) {
        NSLog(@"FAULT = %@ <%@>", fault.message, fault.detail);
        return;
    }
*/
//Асинхронный метод
 
    BackendlessUser *user = [BackendlessUser new];
    user.password = @"iAmWatchingU";
    user.name = @"James";
    [user setPassword:@"45"];
    [user setProperty:@"password" object:@"123"];
    [user setProperty:@"email" object:@"james12@uk"];
    
    Responder *responder = [Responder responder:self
                             selResponseHandler:@selector(responseHandler:)
                                selErrorHandler:@selector(errorHandler:)];
    [backendless.userService registering:user responder:responder];
    

}

-(id)responseHandler:(id)response
{
    BackendlessUser *user = (BackendlessUser *)response;
    NSLog(@"user = %@ = %@", user.name, user.password);
    return user;
}
          
-(void)errorHandler:(Fault *)fault
    {
        NSLog(@"FAULT = %@ & <%@>", fault.message, fault.detail);
    }



- (IBAction)UpdateDidTouchUpInside:(id)sender
{
    BackendlessUser *user = [BackendlessUser new];
    user.email = @"james.bond3@uk";
    user.password = @"iAmWatchingU";
    
    [backendless.userService
     registering:user
     response:^(BackendlessUser *registeredUser) {
         NSLog(@"User has been registered (ASYNC): %@", registeredUser);
         
         [registeredUser updateProperties:@{@"name" : @"James8"}];
         [backendless.userService
          update:user
          response:^(BackendlessUser *updatedUser) {
              NSLog(@"User has been updated (ASYNC): %@", updatedUser);
              
              [registeredUser updateProperties:@{@"name" : @"James9"}];
              
          }
          error:^(Fault *fault) {
              NSLog(@"Server reported an error (ASYNC): %@", fault);
          }];
         
     }
     error:^(Fault *fault) {
         NSLog(@"Server reported an error (ASYNC): %@", fault);
     }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
