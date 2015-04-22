//
//  ViewController.m
//  Caroussel
//
//  Created by florian BUREL on 22/04/2015.
//  Copyright (c) 2015 florian BUREL. All rights reserved.
//

#import "ViewController.h"
#import "FBCaroussel.h"

@interface ViewController ()
<FBCarousselDelegate>

@property (weak, nonatomic) IBOutlet FBCaroussel *caroussel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.caroussel.delegate = self;
}

- (UIView *)carroussel:(id)sender pageAtIndex:(int)position
{
    NSString * fileName = [NSString stringWithFormat:@"%d.jpg", position];
    
    
    UIImage * image = [UIImage imageNamed:fileName];
    
    UIImageView * view = [[UIImageView alloc]initWithImage:image];
    
    // Garde l'aspect-ratio lors du resize de l'image
    view.contentMode = UIViewContentModeScaleAspectFit;
    
    return view;
}

@end














