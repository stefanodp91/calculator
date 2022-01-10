//
//  TryCatch.m
//  calculator
//
//  Created by Stefano De Pascalis on 07/01/22.
//

#import "TryCatch.h"

@implementation TryCatch

+ (BOOL)catchException:(void(^)(void))tryBlock error:(__autoreleasing NSError **)error {
    @try {
        tryBlock();
        return YES;
    }
    @catch (NSException *exception) {
        *error = [[NSError alloc] initWithDomain:exception.name code:0 userInfo:exception.userInfo];
        return NO;
    }
}

@end
