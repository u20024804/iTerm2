//
//  VT100ScreenMark.m
//  iTerm
//
//  Created by George Nachman on 12/5/13.
//
//

#import "VT100ScreenMark.h"

@implementation VT100ScreenMark {
    NSMutableArray *_capturedOutput;
}

@synthesize entry;

- (void)dealloc {
    [_command release];
    [_startDate release];
    [_endDate release];
    [_capturedOutput release];
    [super dealloc];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"<%@: %p interval=%@ sessionID=%d>",
            self.class, self, self.entry.interval, self.sessionID];
}

- (void)setCommand:(NSString *)command {
  [_command autorelease];
  _command = [command copy];
  self.startDate = [NSDate date];
}

- (void)addCapturedOutput:(CapturedOutput *)capturedOutput {
    if (!_capturedOutput) {
        _capturedOutput = [[NSMutableArray alloc] init];
    }
    [_capturedOutput addObject:capturedOutput];
}

@end
