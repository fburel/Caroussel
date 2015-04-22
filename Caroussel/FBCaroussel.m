//
//  FBCaroussel.m
//  Caroussel
//
//  Created by florian BUREL on 22/04/2015.
//  Copyright (c) 2015 florian BUREL. All rights reserved.
//

#import "FBCaroussel.h"

#define PAGE_VIEW_TAG       42

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
    UIView * oldView = [self viewWithTag:PAGE_VIEW_TAG];
    
    UIView * nextPage = [self.delegate carroussel:self pageAtIndex:pageIdx];
    
    nextPage.tag = PAGE_VIEW_TAG;
    
    nextPage.frame = self.bounds;
    
    nextPage.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    
    [self addSubview:nextPage];
    
    [oldView removeFromSuperview];
    
    self.currentPageIndex = pageIdx;
}

// Reponds au swipe (change de page en fonction de la direction)
- (void) handleSwipe:(UISwipeGestureRecognizer *)sender
{
    if(sender.direction == UISwipeGestureRecognizerDirectionLeft && ![self isDisplayingLastPage])
    {
        [self displayPage:self.currentPageIndex + 1 animated:YES];
    }
    else if(sender.direction == UISwipeGestureRecognizerDirectionRight && self.currentPageIndex > 0)
    {
        [self displayPage:self.currentPageIndex - 1 animated:YES];
    }
}

- (int) isDisplayingLastPage
{
    return self.currentPageIndex == [self.delegate numberOfPageInCaroussel:self] - 1;
}
@end
