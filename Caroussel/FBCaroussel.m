//
//  FBCaroussel.m
//  Caroussel
//
//  Created by florian BUREL on 22/04/2015.
//  Copyright (c) 2015 florian BUREL. All rights reserved.
//

#import "FBCaroussel.h"

@interface FBCaroussel ()

@property (nonatomic) BOOL isConfigured;

@property (nonatomic) int currentPageIndex;


@end


@implementation FBCaroussel

- (void)layoutSubviews
{
    if(!self.isConfigured)
    {
        [self configure];
        
        [self displayFirstPage];
        
        self.isConfigured = YES;
    }
   
}

// Ajoute les gestures recognizer
-(void) configure
{
    
    UISwipeGestureRecognizer * swipeR = [UISwipeGestureRecognizer new];
    swipeR.direction = UISwipeGestureRecognizerDirectionRight;
    [swipeR addTarget:self action:@selector(handleSwipe:)];
    [self addGestureRecognizer:swipeR];
    
    UISwipeGestureRecognizer * swipeL = [UISwipeGestureRecognizer new];
    swipeL.direction = UISwipeGestureRecognizerDirectionLeft;
    [swipeL addTarget:self action:@selector(handleSwipe:)];
    [self addGestureRecognizer:swipeL];
}

// Affiche la 1ere page
- (void) displayFirstPage
{
    [self displayPage:0 animated:NO];
}

// Affiche la page a la position donnée
- (void) displayPage:(int)pageIdx animated:(BOOL)animated
{
    
    UIView * page = [self.delegate carroussel:self pageAtIndex:pageIdx];
    
    page.frame = self.bounds;
    
    page.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    
    [self addSubview:page];
    
    self.currentPageIndex = pageIdx;
}

// Reponds au swipe (change de page en fonction de la direction)
- (void) handleSwipe:(UISwipeGestureRecognizer *)sender
{
    if(sender.direction == UISwipeGestureRecognizerDirectionLeft)
    {
        [self displayPage:self.currentPageIndex + 1 animated:YES];
    }
    else
    {
        [self displayPage:self.currentPageIndex - 1 animated:YES];
    }
}

@end
