//
//  MWAViewControllerAdd.h
//  Waether2
//
//  Created by Dmitry on 03.01.17.
//  Copyright © 2017 Dmitry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MWAViewControllerAdd : UIViewController
#warning Стандартно используется такой порядок: префикс+особенность+тип. Здесь я бы назвал MWAAddRecordViewControler или даже MWAAddWeatherRecordViewControler. И нет ничего страшного в длинных именах, это лучше, чем потом иметь 15 классов с похожими именами и совершенно разным функционалом.

- (IBAction)addDidTouchUpInside:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *percTextBox;
@property (weak, nonatomic) IBOutlet UILabel *lable;
#warning Можно прогонять названия переменных через гугл транслейт или какой-нибудь спеллчекер, чтоб избежать опечаток
@property (weak, nonatomic) IBOutlet UITextField *tempTextBox;
#warning Используй именование от класса. Если это UITextField, то *TextField (здесь tempTextField). Из стандартных классов полем ввода может быть UITextField и UITextView, и так сразу понятно, что это за объект.
#warning Лучше ипользовать имена без сокращений. 'temp' еще норм, а что такое 'perc' через месяц можно и не вспомнить, а кому-то другому и вовсе можно не понять. Автодополнение работает нормально, скорость набора остается высокой, нет смысла.

@end
