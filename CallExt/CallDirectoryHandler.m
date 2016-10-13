//
//  CallDirectoryHandler.m
//  CallExt
//
//  Created by apple on 16/10/11.
//  Copyright © 2016年 ivan. All rights reserved.
//

#import "CallDirectoryHandler.h"

@interface CallDirectoryHandler () <CXCallDirectoryExtensionContextDelegate>
@end

@implementation CallDirectoryHandler

- (void)beginRequestWithExtensionContext:(CXCallDirectoryExtensionContext *)context {
    
    NSDictionary*dic = [[[NSUserDefaults alloc] initWithSuiteName:@"group.zyextension"] objectForKey:@"save_contact_data"];
    NSLog(@"%@",dic);
    
    NSMutableDictionary *labelsKeyedByPhoneNumber  = @{}.mutableCopy;

    [dic enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        labelsKeyedByPhoneNumber[@([key longLongValue])] = obj;
    }];
 
//    NSDictionary *labelsKeyedByPhoneNumber  = @{}.mutableCopy;
    
//    NSDictionary<NSNumber *, NSString *> *labelsKeyedByPhoneNumber = @{@(8613573410044) :@"super shuai"};
    
    for (NSNumber *phoneNumber in [labelsKeyedByPhoneNumber.allKeys sortedArrayUsingSelector:@selector(compare:)]) {
        NSString *label = labelsKeyedByPhoneNumber[phoneNumber];
        [context addIdentificationEntryWithNextSequentialPhoneNumber:(CXCallDirectoryPhoneNumber)[phoneNumber unsignedLongLongValue] label:label];
    }
    
    [context completeRequestWithCompletionHandler:nil];
}

- (void)requestFailedForExtensionContext:(CXCallDirectoryExtensionContext *)extensionContext withError:(NSError *)error{}

@end
