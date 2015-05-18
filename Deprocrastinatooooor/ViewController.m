//
//  ViewController.m
//  Deprocrastinatooooor
//
//  Created by Alex Santorineos on 5/18/15.
//  Copyright (c) 2015 madApperz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate, UITableViewDelegate, UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property NSMutableArray *textFieldArray;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property NSString *string;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.editing = false;
    self.textFieldArray = [NSMutableArray new];
    self.textField.delegate = self;

}

-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    NSString *cellString = [self.textFieldArray objectAtIndex:sourceIndexPath.row];

    [self.textFieldArray removeObject:cellString];
    [self.textFieldArray insertObject:cellString atIndex:destinationIndexPath.row];

}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {




    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Enter New Dream" message:nil preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];


    UIAlertAction *delete = [UIAlertAction actionWithTitle:@"delete" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {

        [self.textFieldArray removeObjectAtIndex:indexPath.row];
        [self.tableView reloadData];
    }];



    [alertController addAction:cancelAction];
    [alertController addAction:delete];
    [self presentViewController:alertController animated:YES completion:nil];



}
-(void)alertView{


//    UIAlertView *alertView = [UIAlertView new];
//    alertView.delegate = self;
//    alertView.title = @"are u sure u want to delete?";
////    [alertView addButtonWithTitle:@"cancel"];
////    [alertView addButtonWithTitle:@"delete"];
////    [alertView show];


}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 1) {
        NSLog(@"test");


    }


}
- (IBAction)onEdit:(UIBarButtonItem *)sender {

    if (self.editing) {
        self.editing = false;
        [self.tableView setEditing:false animated:true];
        sender.style = UIBarButtonItemStylePlain;
        sender.title =@"Edit";
    } else {
        self.editing = true;
        [self.tableView setEditing:true animated:true];
        sender.style = UIBarButtonItemStyleDone;
        sender.title =@"Done";}

}


- (IBAction)addTextButton:(id)sender {
    [self.textFieldArray addObject:self.textField.text];

    [self.tableView reloadData];

    self.textField.text = @"";
    [self.textField endEditing:YES];


}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField endEditing:YES];
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
