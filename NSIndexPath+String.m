//
//  NSIndexPath+String.m
//  SpooferPro
//
//  Created by Malhar Ambekar on 6/26/25.
//

#import "NSIndexPath+String.h"

@implementation NSIndexPath (String)

- (NSString *)stringValue {
    return [NSString stringWithFormat:@"%ld-%ld", (long)self.section, (long)self.row];
}

+ (NSIndexPath *)indexPathFromString:(NSString *)string {
    NSArray<NSString *> *components = [string componentsSeparatedByString:@"-"];
    if (components.count != 2) return nil;

    NSInteger section = [components[0] integerValue];
    NSInteger row = [components[1] integerValue];
    return [NSIndexPath indexPathForRow:row inSection:section];
}

@end
