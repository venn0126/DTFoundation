//
//  DTASN1SerializationTest.m
//  DTFoundation
//
//  Created by Oliver Drobnik on 3/9/13.
//  Copyright (c) 2013 Cocoanetics. All rights reserved.
//

#import "DTASN1SerializationTest.h"

#import "DTASN1Serialization.h"
#import "DTBase64Coding.h"

@implementation DTASN1SerializationTest

- (void)testDeserialization
{
	NSString *string = @"MBaAFDxB4o8ICKlMJYmNbcU40PyFjGIX";
	NSData *data = [DTBase64Coding dataByDecodingString:string];
	
	id object = [DTASN1Serialization objectWithData:data];
	
	STAssertNotNil(object, @"Should be able to decode as array");
	STAssertTrue([object isKindOfClass:[NSArray class]], @"Decoded object should be an array");
}

- (void)testBitString
{
	NSString *string = @"AwIFoA==";
	NSData *data = [DTBase64Coding dataByDecodingString:string];

	id object = [DTASN1Serialization objectWithData:data];
	
	NSString *asString = [object description];
	STAssertTrue([@"101" isEqualToString:asString], @"Result should be 101");
}

// a sequence with no contents should still be returned as array
- (void)testDecodingEmptySequence
{
	NSString *string = @"MAA=";
	NSData *data = [DTBase64Coding dataByDecodingString:string];
	
	id object = [DTASN1Serialization objectWithData:data];
	
	STAssertNotNil(object, @"Should be able to decode as array");
	STAssertTrue([object isKindOfClass:[NSArray class]], @"Decoded object should be an array");
}

@end