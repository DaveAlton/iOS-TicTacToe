//
//  TicTacToeGame.h
//  TicTacToe
//
//  Created by Dave Alton on 2014-03-28.
//  Copyright (c) 2014 Dave Alton. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Placement.h"

@interface TicTacToeGame : NSObject
@property(strong, nonatomic) Placement *topLeft;
@property(strong, nonatomic) Placement *topMiddle;
@property(strong, nonatomic) Placement *topRight;
@property(strong, nonatomic) Placement *middleLeft;
@property(strong, nonatomic) Placement *middle;
@property(strong, nonatomic) Placement *middleRight;
@property(strong, nonatomic) Placement *bottomLeft;
@property(strong, nonatomic) Placement *bottomMiddle;
@property(strong, nonatomic) Placement *bottomRight;
@property(strong, nonatomic) NSString *player;
@property(nonatomic) int scoreForX;
@property(nonatomic) int scoreForO;
-(bool)won;
-(id)reset;
@end
