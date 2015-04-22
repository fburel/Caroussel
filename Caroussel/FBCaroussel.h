//
//  FBCaroussel.h
//  Caroussel
//
//  Created by florian BUREL on 22/04/2015.
//  Copyright (c) 2015 florian BUREL. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol FBCarousselDelegate <NSObject>

@required

- (UIView *) carroussel:(id)sender pageAtIndex:(int)position;

- (int) numberOfPageInCaroussel:(id)sender;

@optional


@end



@interface FBCaroussel : UIView


@property (/*readwrite, */ nonatomic, weak) id<FBCarousselDelegate> delegate;

@end
