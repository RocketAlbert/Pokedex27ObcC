//
//  Pokemon.h
//  Pokemon27ObjC
//
//  Created by Albert Yu on 7/2/19.
//  Copyright © 2019 AlbertLLC. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Pokemon : NSObject

@property(nonatomic, copy, readonly) NSString *pokemonName;
// let pokemon: String
@property(nonatomic, readonly) NSInteger identifier;
// NSInterger is not a classs. That's why no * and no "copy"
@property (nonatomic, copy, readonly) NSArray<NSString *> *abilities;
// *1 is for the individual strings, *2 is for the arrayu

- (instancetype) initWithPokemonName: (NSString *) name
                         indentifier: (NSInteger) indentifier
                           abilities: (NSArray<NSString *> *) abilities;
/*
 init(name: String, indentifier: Int, abilities [String]) {
 
 
 }
 */
@end

// how to write a class extension

@interface Pokemon (JSONConvertible) //JsonConvertible named such because it is the goal
-(instancetype) initWithDictionary:(NSDictionary<NSString *, id> *)dictionary;
// init(with dictionary: [String: Any]) {

@end

NS_ASSUME_NONNULL_END
