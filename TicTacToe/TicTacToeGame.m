//
//  TicTacToeGame.m
//  TicTacToe
//
//  Created by Dave Alton on 2014-03-28.
//  Copyright (c) 2014 Dave Alton. All rights reserved.
//

#import "TicTacToeGame.h"
#import "Placement.h"


@interface TicTacToeGame()
@property(nonatomic) NSString *firstPlayer;
@end
@implementation TicTacToeGame

-(id) reset
{
    if(self){
        _topLeft = [[Placement alloc] init];
        _topMiddle = [[Placement alloc] init];
        _topRight = [[Placement alloc] init];
        _middleLeft = [[Placement alloc] init];
        _middle = [[Placement alloc] init];
        _middleRight = [[Placement alloc] init];
        _bottomLeft = [[Placement alloc] init];
        _bottomMiddle = [[Placement alloc] init];
        _bottomRight = [[Placement alloc] init];
        if([_firstPlayer isEqualToString:@"X"])
        {
            _player = @"O";
            _firstPlayer = @"0";
        }
        else
        {
            _player = @"X";
            _firstPlayer = @"X";
        }
    }
    return self;
}
-(id)init{
    self = [super init];
    [self reset];
    _scoreForO = 0;
    _scoreForX = 0;
    _firstPlayer = @"X";
    return self;
}

-(bool)won
{
    if([_topLeft.chosenBy isEqualToString: _topMiddle.chosenBy]
       && [_topMiddle.chosenBy isEqualToString: _topRight.chosenBy])
        return YES;
    else if([_middleLeft.chosenBy isEqualToString: _middle.chosenBy]
            && [_middle.chosenBy isEqualToString: _middleRight.chosenBy])
        return YES;
    else if([_bottomLeft.chosenBy isEqualToString: _bottomMiddle.chosenBy]
            && [_bottomMiddle.chosenBy isEqualToString: _bottomRight.chosenBy])
        return YES;
    else if([_topLeft.chosenBy isEqualToString: _middleLeft.chosenBy]
            && [_middleLeft.chosenBy isEqualToString: _bottomLeft.chosenBy])
        return YES;
    else if([_topMiddle.chosenBy isEqualToString: _middle.chosenBy]
            && [_middle.chosenBy isEqualToString: _bottomMiddle.chosenBy])
        return YES;
    else if([_topRight.chosenBy isEqualToString: _middleRight.chosenBy]
            && [_middleRight.chosenBy isEqualToString: _bottomRight.chosenBy])
        return YES;
    else if([_topRight.chosenBy isEqualToString: _middle.chosenBy]
            && [_middle.chosenBy isEqualToString: _bottomLeft.chosenBy])
        return YES;
    else if([_topLeft.chosenBy isEqualToString: _middle.chosenBy]
            && [_middle.chosenBy isEqualToString: _bottomRight.chosenBy])
        return YES;
    return NO;
}

@end
