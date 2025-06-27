//
//  NSIndexPath+String.h
//  SpooferPro
//
//  Created by Malhar Ambekar on 6/26/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSIndexPath (String)

- (NSString *)stringValue;
+ (NSIndexPath *)indexPathFromString:(NSString *)string;

@end

NS_ASSUME_NONNULL_END
