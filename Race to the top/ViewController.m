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

#define RTMAP_STARTING_SCORE 15000
#define RTMAP_SCORE_DECREMENT_AMOUNT 100
#define RTTimer_Interval 0.1
#define RTWall_Penalty 500

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
    
   /* self.timer = [NSTimer scheduledTimerWithTimeInterval:RTTimer_Interval target:self selector:@selector(timerFired) userInfo:nil repeats:YES];*/
    
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %i",RTMAP_STARTING_SCORE];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)panDetected : (UIPanGestureRecognizer *)panRecognizer
{
    CGPoint fingerLocation = [panRecognizer locationInView : self.pathView];

    if (panRecognizer.state == UIGestureRecognizerStateBegan && fingerLocation.y <=750)
    {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:RTTimer_Interval target:self selector:@selector(timerFired) userInfo:nil repeats:YES];
        
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %i",RTMAP_STARTING_SCORE];
    }
    else if(panRecognizer.state == UIGestureRecognizerStateChanged)
    {
        for (UIBezierPath *path in [RTMountainPath mountainPathsForRect:self.pathView.bounds])
        {
            UIBezierPath *tapTarget = [RTMountainPath tapTargetForPath:path];
            
            if ([tapTarget containsPoint:fingerLocation])
            {
                //NSLog(@"You hit a wall");
                [self decrementScoreByAmount:RTWall_Penalty];
            }
            
        }
    }
    
    else if (panRecognizer.state == UIGestureRecognizerStateEnded && fingerLocation.y <= 165)
    {
        [self.timer invalidate];
        self.timer = nil;
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Make sue to start with thte bottom of the path, hold your finger and finish at the top of the path" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        
        [self.timer invalidate];
        self.timer = nil;
        
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
   // NSLog(@"Timer fired");
    [self decrementScoreByAmount:RTMAP_SCORE_DECREMENT_AMOUNT];
}

-(void)decrementScoreByAmount: (int)amount
{
    NSString *scoreText = [[self.scoreLabel.text componentsSeparatedByString:@" "] lastObject];
    int score  = [scoreText intValue];
    score = score - amount;
    
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %i",score];
}





@end
