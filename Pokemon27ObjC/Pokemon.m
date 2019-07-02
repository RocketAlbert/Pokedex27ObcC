//
//  Pokemon.m
//  Pokemon27ObjC
//
//  Created by Albert Yu on 7/2/19.
//  Copyright © 2019 AlbertLLC. All rights reserved.
//

#import "Pokemon.h"

@implementation Pokemon
- (instancetype)initWithPokemonName:(NSString *)name indentifier:(NSInteger)indentifier abilities:(NSArray<NSString *> *)abilities {
    
    self = [super init];
    if (self) {
        _pokemonName = name;
        _identifier = indentifier;
        _abilities = abilities;
        
    }
    return self;
}

@end

@implementation Pokemon (JSONConvertible)

-(instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    NSString *name = dictionary[@"name"];
    NSInteger identifier = [dictionary[@"id"] integerValue]; // Keys must be typed correctly.
    NSArray *abilitiesDict = dictionary[@"abilities"];
    if(![name isKindOfClass:[NSString class]] || ![abilitiesDict isKindOfClass:[NSArray class]]) {
        return nil;
    }
    NSMutableArray<NSString *> *abilities = [[NSMutableArray alloc] init];
    // Swift Version: let abilities: [String] = []
    for (NSDictionary *dictionary in abilitiesDict) {
        NSDictionary *abilityDict = dictionary[@"ability"];
        NSString *abilityName = abilityDict[@"name"];
        [abilities addObject:abilityName];
    }
    return [self initWithPokemonName:name indentifier:identifier abilities:abilities];
}

@end
