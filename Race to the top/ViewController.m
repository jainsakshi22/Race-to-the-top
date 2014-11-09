//
//  ViewController.m
//  Race to the top
//
//  Created by Sakshi Jain on 04/11/14.
//
//

#import "ViewController.h"
#import "RTPathView.h"
#import "RTMountainPath.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet RTPathView *pathView; //Drag from storyboard
@property (strong,nonatomic) NSTimer *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapDetected: )];
    //Used in opening a folder
    tapRecognizer.numberOfTapsRequired = 2;
    [self.pathView addGestureRecognizer:tapRecognizer];
    
    UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panDetected:)];
    [self.pathView addGestureRecognizer:panRecognizer];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerFired) userInfo:nil repeats:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)panDetected : (UIPanGestureRecognizer *)panRecognizer
{
    CGPoint fingerLocation = [panRecognizer locationInView : self.pathView];
   // NSLog(@"I'm at location (%f,%f)", fingerLocation.x, fingerLocation.y);
    for (UIBezierPath *path in [RTMountainPath mountainPathsForRect:self.pathView.bounds])
    {
        UIBezierPath *tapTarget = [RTMountainPath tapTargetForPath:path];
        
        if ([tapTarget containsPoint:fingerLocation])
        {
            NSLog(@"You hit a wall");
        }
            
    }
}

-(void)tapDetected : (UITapGestureRecognizer *)tapRecognizer
{
    NSLog(@"Tap Detected");
    CGPoint tapLocation = [tapRecognizer locationInView: self.pathView];
    NSLog(@"Tap location is at point (%f,%f)", tapLocation.x, tapLocation.y);
}

-(void)timerFired
{
    NSLog(@"Timer fired");
}







@end
