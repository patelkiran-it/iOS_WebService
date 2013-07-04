//
//  ViewController.m
//  XMLDemo
//
//  Created by openxcell on 7/4/13.
//  Copyright (c) 2013 openxcell. All rights reserved.
//

#import "ViewController.h"
#import "XMLParser.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
  //  NSString *strURL = @"http://ax.phobos.apple.com.edgesuite.net/WebObjects/MZStore.woa/wpa/MRSS/newreleases/limit=50/rss.xml";
 //   NSArray *arrayTag  =[NSArray arrayWithObjects:@"title",@"link",@"description",@"pubDate", nil];
    
    
#pragma Mark - Call With ProsessBar Syncronus
  //  aryXmlData = [[XMLParser alloc] parseWithURL:strURL RootTag:@"item" TagNames:arrayTag WithProgressBar:self.view];
    //[tblView reloadData];
    
#pragma Mark - Call in Background
   /* [[XMLParser alloc] parseWithURL:strURL RootTag:@"item" TagNames:arrayTag completionHandler:^(NSArray *aryResultList) {
                
        aryXmlData = aryResultList;
        [tblView reloadData];
    }];
    */
     
#pragma Mark - Call in Background with Processbar    
   /* [[XMLParser alloc] parseWithURL:strURL RootTag:@"item" TagNames:arrayTag  WithProgressBar:self.view completionHandler:^(NSArray *aryResultList) {
        
        aryXmlData = aryResultList;
        [tblView reloadData];
    }];
*/
    

#pragma Mark - Print Data  
    /*for(NSDictionary *dic in aryXmlData)
    {
        for(NSString *strKey in dic.keyEnumerator)
        {
            NSLog(@"%@ -- %@",strKey,[dic valueForKey:strKey]);
        }
        NSLog(@"\n\n\n\n=============================================\n\n\n\n");
    }
     */
    
    
    
    
    
 NSString *strUrl = [NSString stringWithFormat:@"%@index.php?c=glossary&func=glossarylist",WEBSERVICE_DOMAIN];
    
#pragma Mark - Call WebService Syncronus    
    //NSDictionary *dic = [WebServices urlString:strUrl];
    //NSDictionary *dic = [WebServices urlString:strUrl progressView:self.view];
    //NSDictionary *dic = [WebServices urlString:strUrl progressView:self.view Lable:@"Song Download"];
   // NSLog(@"-- Result %@",dic);
    
#pragma Mark - Call Web Service In BG(Asyncronous) With Handler
   // [WebServices urlStringInBG:strUrl completionHandler:^(NSDictionary *dicResult) {
     //   NSLog(@"-- cal back %@",dicResult);
    //}];
    
#pragma Mark - Call Web Service In BG(Asyncronous) With Handler and Processbar
    [WebServices urlStringInBG:strUrl progressView:self.view completionHandler:^(NSDictionary *dicResult) {
        NSLog(@"-- cal back %@",dicResult);
    }];
 
#pragma Mark - Call Web Service In BG(Asyncronous) with delegate
    //[WebServices urlStringInBG:strUrl delegate:self];
    
}

#pragma Mark - WebService Delegate
-(void)recievedResponse:(NSDictionary *)dicResult
{
    NSLog(@"Back recived %@",dicResult);
}

-(void)webServicesError:(NSError*)error{
    
    NSLog(@"webServicesError");
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

#pragma mark - Table Delegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
   return 44;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return aryXmlData.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell==nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];    
    }
    cell.textLabel.text = [[aryXmlData objectAtIndex:indexPath.row] valueForKey:@"title"];
    return cell;
}

#pragma mark - TableData Delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{   
    
}


@end
