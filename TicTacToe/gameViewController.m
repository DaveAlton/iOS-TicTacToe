//
//  gameViewController.m
//  TicTacToe
//
//  Created by Dave Alton on 2014-03-28.
//  Copyright (c) 2014 Dave Alton. All rights reserved.
//

#import "gameViewController.h"
#import "TicTacToeGame.h"

@interface gameViewController ()
@property (strong, nonatomic) TicTacToeGame *game;
@property (weak, nonatomic) IBOutlet UIButton *topLeftButton;
@property (weak, nonatomic) IBOutlet UIButton *topMiddleButton;
@property (weak, nonatomic) IBOutlet UIButton *topRightButton;
@property (weak, nonatomic) IBOutlet UIButton *middleLeftButton;
@property (weak, nonatomic) IBOutlet UIButton *middleButton;
@property (weak, nonatomic) IBOutlet UIButton *middleRightButton;
@property (weak, nonatomic) IBOutlet UIButton *bottomLeftButton;
@property (weak, nonatomic) IBOutlet UIButton *bottomMiddleButton;
@property (weak, nonatomic) IBOutlet UIButton *bottomRightButton;
@property (weak, nonatomic) IBOutlet UILabel *winnerLabel;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *placementButtons;
@property (weak, nonatomic) IBOutlet UILabel *xScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *oScoreLabel;



@end

@implementation gameViewController

- (IBAction)touchPlacementButton:(UIButton *)sender {
    if(sender.enabled){
        if ([sender isEqual:self.topLeftButton])
            self.game.topLeft.chosenBy = _game.player;
        else if ([sender isEqual:self.topMiddleButton])
            self.game.topMiddle.chosenBy = _game.player;
        else if ([sender isEqual:self.topRightButton])
            self.game.topRight.chosenBy = _game.player;
        else if ([sender isEqual:self.middleLeftButton])
            self.game.middleLeft.chosenBy = _game.player;
        else if ([sender isEqual:self.middleRightButton])
            self.game.middleRight.chosenBy = _game.player;
        else if ([sender isEqual:self.middleButton])
            self.game.middle.chosenBy = _game.player;
        else if ([sender isEqual:self.bottomLeftButton])
            self.game.bottomLeft.chosenBy = _game.player;
        else if ([sender isEqual:self.bottomMiddleButton])
            self.game.bottomMiddle.chosenBy = _game.player;
        else if ([sender isEqual:self.bottomRightButton])
            self.game.bottomRight.chosenBy = _game.player;
        sender.enabled = NO;
    }
    if(_game.won){
        [_winnerLabel setText:[NSString stringWithFormat:@"%@ Wins!", _game.player]];
        if([_game.player isEqualToString:@"X"]){
            _game.scoreForX++;
            [_xScoreLabel setText:[NSString stringWithFormat:@"%d", _game.scoreForX]];
        } else if([_game.player isEqualToString:@"O"]){
            _game.scoreForO++;
            [_oScoreLabel setText:[NSString stringWithFormat:@"%d", _game.scoreForO]];
        }
    }
    if ([_game.player isEqualToString:@"X"]){
        [sender setTitle:_game.player forState:UIControlStateNormal];
        _game.player = @"O";
    } else if ([_game.player isEqualToString:@"O"]){
        [sender setTitle:_game.player forState:UIControlStateNormal];
        self.game.player = @"X";
    }
}
- (IBAction)resetButtonTouched {
    _game = [_game reset];
    for(UIButton *button in self.placementButtons){
        button.enabled = YES;
        [button setTitle:@"" forState:UIControlStateNormal];
        [_winnerLabel setText:@""];
    }
}

- (TicTacToeGame *)game
{
    if (!_game) {
        _game = [[TicTacToeGame alloc] init];
    }
    return _game;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
