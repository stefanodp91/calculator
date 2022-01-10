//
//  TryCatch.h
//  calculator
//
//  Created by Stefano De Pascalis on 07/01/22.
//

#import <Foundation/Foundation.h>

@interface TryCatch : NSObject

+ (BOOL)catchException:(void(^)(void))tryBlock error:(__autoreleasing NSError **)error;

@end
