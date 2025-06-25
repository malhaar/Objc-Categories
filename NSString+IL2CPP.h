//
//  NSString+IL2CPP.h
//  SpooferPro
//
//  Created by Malhar Ambekar on 6/24/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (IL2CPP)

+ (instancetype)stringWithSystemString:(void *)ptr;
- (void *)toSystemString;

@end

NS_ASSUME_NONNULL_END
