//
//  ViewController.m
//  Race to the top
//
//  Created by Sakshi Jain on 04/11/14.
//
//

#import "ViewController.h"
#import "RTPathView.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet RTPathView *pathView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapDetected: )];
    //Used in opening a folder
    tapRecognizer.numberOfTapsRequired = 2;
    [self.pathView addGestureRecognizer:tapRecognizer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tapDetected : (UITapGestureRecognizer *) tapRecognizer
{
    NSLog(@"Tap Detected");
    CGPoint tapLocation = [tapRecognizer locationInView: self.pathView];
    NSLog(@"Tap location is at point (%f,%f)", tapLocation.x, tapLocation.y);
}

@end
