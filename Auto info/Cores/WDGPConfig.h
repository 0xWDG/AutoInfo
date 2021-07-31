//
//  WDGPConfig.h
//  iWebTools
//
//  Created by wesley de groot on 20-05-13.
//  Copyright (c) 2013 WDG.P. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WDGPConfig : NSObject
{
    NSMutableDictionary *configdb;
    NSString            *saveFile;
    BOOL                *autoSave;
}

+ (WDGPConfig *)sharedInstance;
- (NSString *) encode:(NSString*)string1 salt:(NSString *)string2;

- (WDGPConfig *) autoSave:(BOOL)val;
- (WDGPConfig *) remove:(NSString *)key;
- (WDGPConfig *) setValue:(NSString *)value forKey:(NSString *)key;
- (WDGPConfig *) setObject:(NSObject *)value forKey:(NSString *)key;
- (WDGPConfig *) get:(NSString *)key;
- (WDGPConfig *) objectForKey:(NSString *)key;
- (WDGPConfig *) save;
- (WDGPConfig *) makeConfig;
- (WDGPConfig *) debCfg;

@end
