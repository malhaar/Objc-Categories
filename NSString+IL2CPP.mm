//
//  NSString+IL2CPP.m
//  SpooferPro
//
//  Created by Malhar Ambekar on 6/24/25.
//

#import "NSString+IL2CPP.h"

#ifdef __cplusplus
#import <string>
#import <codecvt>
#import <locale>

// Include the real IL2CPP-generated headers
#import "UnityBridge.h"

using namespace std;

#endif

@implementation NSString (IL2CPP)

+ (instancetype)stringWithSystemString:(void *)ptr {
    if (ptr == nullptr) return @"";

    System_String_o *systemStr = (System_String_o *)ptr;
    int32_t length = systemStr->fields._stringLength;
    if (length == 0) return @"";

    // chars is located right after the struct's _firstChar field
    const char16_t *chars = (const char16_t *)&systemStr->fields._firstChar;

    u16string representation(chars, chars + length);

    wstring_convert<codecvt_utf8_utf16<char16_t>, char16_t> convert;
    string utf8 = convert.to_bytes(representation);

    return [NSString stringWithUTF8String:utf8.c_str()];
}

- (void *)toSystemString {
    const char *utf8String = [self UTF8String];
    void *strptr = String_Ctor(utf8String);
    if (strptr != nullptr) return strptr;

    // Fallback
    wstring_convert<codecvt_utf8_utf16<char16_t>, char16_t> convert;
    u16string utf16 = convert.from_bytes(utf8String);

    size_t len = utf16.length();
    size_t size = sizeof(System_String_o) + (len * sizeof(char16_t));

    System_String_o *str = (System_String_o *)calloc(1, size); // Replace with il2cpp_alloc if needed
    str->fields._stringLength = (int32_t)len;

    char16_t *chars = (char16_t *)&str->fields._firstChar;
    memcpy(chars, utf16.data(), len * sizeof(char16_t));

    return str;
}

@end
