//
//  HomeViewController.m
//  Intelect
//
//  Created by Narek Sedrakyan on 10/28/17.
//  Copyright © 2017 Narek Sedrakyan. All rights reserved.
//
#import "HomeViewController.h"

typedef NS_ENUM(NSUInteger, type) {
    Info = 0,
    Challenges,
    FollowedTopics,
    GameHistory,
};

@interface HomeViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableview;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self presentLogin];
    [self setup];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)presentLogin {
    UINavigationController *navController = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginNavigation"];
    [self presentViewController:navController animated:YES completion:nil];
}

- (void)setup {
    [self registerNibs];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)registerNibs {
    [self.tableview registerNib:[UINib nibWithNibName:@"InfoTableViewCell" bundle:nil] forCellReuseIdentifier:@"InfoTableViewCell"];
    [self.tableview registerNib:[UINib nibWithNibName:@"ChallengesTableViewCell" bundle:nil] forCellReuseIdentifier:@"ChallengesTableViewCell"];
    [self.tableview registerNib:[UINib nibWithNibName:@"FollowedTopicsTableViewCell" bundle:nil] forCellReuseIdentifier:@"FollowedTopicsTableViewCell"];
    [self.tableview registerNib:[UINib nibWithNibName:@"GameHistoryTableViewCell" bundle:nil] forCellReuseIdentifier:@"GameHistoryTableViewCell"];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;
    
    switch (indexPath.row) {
        case Info: {
            cell = [tableView dequeueReusableCellWithIdentifier:@"InfoTableViewCell"];
        }
            break;
        case Challenges: {
            cell = [tableView dequeueReusableCellWithIdentifier:@"ChallengesTableViewCell"];
        }
            break;
        case FollowedTopics: {
            cell = [tableView dequeueReusableCellWithIdentifier:@"FollowedTopicsTableViewCell"];

        }
            break;
        case GameHistory: {
            cell = [tableView dequeueReusableCellWithIdentifier:@"GameHistoryTableViewCell"];
        }
            break;
        default:
            break;
    }
    
    return cell;
}


//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//
//}

@end