//
//  MWATableViewControllerShow.m
//  Waether2
//
//  Created by Dmitry on 04.01.17.
//  Copyright © 2017 Dmitry. All rights reserved.
//

#import "MWATableViewControllerShow.h"
#import "MWAWeather.h"                  //Так и надо повторять в каждом файле?
#import "Backendless.h"                 //Так и надо повторять в каждом файле?
#warning Можно сделать prefix файл, и в него добавить импорты, которые тебе нужны в каждом фале. Раньше он был стандартно, потом его выпилили. Я особо не разбирался в сути проблемы, но видимо есть смысл. Сам пишу импорты каждый раз. Можно сделать один .h файл, который содержит в себе, например, все инклуды модели, и добавлять его вместо 15 отдельных. Здесь можно объединить это в "MWAApis.h"
#import <Foundation/Foundation.h>


@interface MWATableViewControllerShow ()

//@property (nonatomic, strong) NSMutableArray *tableData;

@property (nonatomic, strong) NSArray * tableWeather;       //Массив с данными типа MWAWeather
@property (nonatomic, strong) NSArray * img;                //Массив с названиями файлов для картинок. Может это надо было реализовать по-другому?
@property (nonatomic, strong) NSNumber * pageSize;
@property (nonatomic, strong) NSNumber * pageOffset;


@end

@implementation MWATableViewControllerShow
{
//Кто это? почему не "@property ...." в *.h?
//    NSMutableArray *tableData ;
//#warning Вообще, я такого не помню) Это какие-то особенности синтаксиса, которыми никто не пользуется. Возможно, атавизм. Все объявления лучше делать в @interface через @property
}

@synthesize tableWeather;
@synthesize img;
@synthesize pageSize;
@synthesize pageOffset;


#pragma mark - IResponder methods


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



#pragma mark - Methods
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    img = [NSArray arrayWithObjects: @"w.png", @"p.png", nil];
//    pageSize = @3;
    pageOffset = @0;
    
//#warning Теперь загрузка данных происходит в фоне
    // Вызываем код в фоне
//    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{

        
/*
//Синхронный метод
        id<IDataStore> dataStore = [backendless.persistenceService of:[MWAWeather class]];
        BackendlessCollection *collection = [dataStore find:nil];
        tableWeather = [[NSArray alloc] initWithArray:collection.data];
*/
 
//Асинхронный метод
    BackendlessDataQuery *query = [BackendlessDataQuery query];
    query.queryOptions.sortBy = @[@"weatherDate"];
    query.queryOptions.pageSize = pageSize;
    id<IDataStore> dataStore = [backendless.persistenceService of:[MWAWeather class]];
    [dataStore find:query
           response:^(BackendlessCollection *collect) {
               tableWeather = [[NSArray alloc] initWithArray:collect.data];
               [self.tableView reloadData];
           }
              error:^(Fault *fault) {
                  NSLog(@"Server reported an error: %@", fault);
              }
    ];


// Сортировка
// 1) compare
/*
        NSArray *sortedArray = [tableWeather sortedArrayUsingSelector:@selector(compare:)];
        tableWeather = sortedArray;
*/
        

//Правильно ли использовать оператор присваивания для массивов? А если один NSArray, а второй NSMutableArray?
// 2) NSSortDescriptor
/*
        NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"weatherDate" ascending:YES];
        NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
        NSArray *sortedArray = [tableWeather sortedArrayUsingDescriptors:sortDescriptors];
        tableWeather = sortedArray;
*/
// 3) Block
/*        NSArray *sortedArray;
        sortedArray = [tableWeather sortedArrayUsingComparator:^NSComparisonResult(id a, id b) {
            NSDate *first = [(MWAWeather*)a weatherDate];
            NSDate *second = [(MWAWeather*)b weatherDate];
            return [first compare:second];
            
        }];
        tableWeather = sortedArray;
*/
//#warning Обновляем таблицу в главном потоке. Вся работа с интерфейсом, просиходит в главном потоке.
//#warning Не забывай вызвать reloadData после получения данных. Здесь был синхронный вызов до создания таблицы, поэтому сработало. В другом случае получил бы чистую таблицу.
//        dispatch_async(dispatch_get_main_queue(), ^(void){
//            [self.tableView reloadData];
//        });
//    });

//#warning Перепиши это на асинхронных вызовах самой библиотеки (-(void)find:(void(^)(BackendlessCollection *))responseBlock error:(void(^)(Fault *))errorBlock; вместо find). В этом случае на надо делать никаких dispatch_async
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    return [tableWeather count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//неосмысленный копипаст
//#warning Чтобы экономить память и увеличить производительсность используются одни и те же объекты ячеек таблицы много раз для разных записей. Чтобы их получить, у них есть идентификатор (здесь SimpleTableItem), а добавются они вызовом dequeueReusableCellWithIdentifier:. Если ячеек еще нет, то она создается. И еще поэтому у ячейки надо каждый раз устанавливать все поля. Даже если поле пустое, то надо установить, что пустое значение, потому что там могут оставаться данные от предыдущего использования.
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UIImageView *imageViewTemperature, *imageViewPrecipitation;
    UILabel *lableTemperature, *lablePrecipitation, *lableDate;
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil)        //Это выражение не теряет своей актуальности?
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    // способ обращения к элементам лежащим на вьюхе "viewWithTag:2001" может заменить IBOutlet?
    imageViewTemperature = [cell.contentView viewWithTag:2001];
    imageViewTemperature.image = [UIImage imageNamed:img[0]];
    
    lableTemperature = (UILabel *) [cell.contentView viewWithTag:2002];
    lableTemperature.text = [[tableWeather[indexPath.row] temperature] stringValue];
    
    imageViewPrecipitation = [cell.contentView viewWithTag:2003];
    imageViewPrecipitation.image = [UIImage imageNamed:img[1]];
    
    lablePrecipitation = (UILabel *) [cell.contentView viewWithTag:2004];
    lablePrecipitation.text = [[tableWeather[indexPath.row] precipitation] stringValue];
    
    lableDate = (UILabel *) [cell.contentView viewWithTag:2005];
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"HH:mm:ss dd.MM.yyyy"];
    NSDate *now = [tableWeather[indexPath.row] weatherDate];
    NSString *nsstr = [format stringFromDate:now];
    lableDate.text = nsstr;
//Может есть способ привести NSDate к NSString проще?
    
 
    

    return cell;
    
}

#pragma mark -

- (IBAction)loadMoreDidTouchUpInside:(id)sender {
//tableFooterView




}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
