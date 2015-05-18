//
//  ViewController.m
//  Deprocrastinatooooor
//
//  Created by Alex Santorineos on 5/18/15.
//  Copyright (c) 2015 madApperz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property NSMutableArray *textFieldArray;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.textFieldArray = [NSMutableArray new];
    self.textField.delegate = self;

}


- (IBAction)addTextButton:(id)sender {
    [self.textFieldArray addObject:self.textField.text];

    [self.tableView reloadData];

    self.textField.text = @"";
    [self.textField endEditing:YES];


}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
//    [textField endEditing:YES];
    return YES;

}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    [self.textField endEditing:YES];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.textFieldArray.count;



}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];

    cell.textLabel.text = [self.textFieldArray objectAtIndex:indexPath.row];

    return cell;


}

@end
