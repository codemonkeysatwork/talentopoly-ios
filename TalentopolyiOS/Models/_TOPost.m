// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to TOPost.m instead.

#import "_TOPost.h"

const struct TOPostAttributes TOPostAttributes = {
	.link = @"link",
	.post_description = @"post_description",
	.post_id = @"post_id",
	.posted_at = @"posted_at",
	.title = @"title",
	.total_comments = @"total_comments",
	.total_likes = @"total_likes",
	.total_views = @"total_views",
};

const struct TOPostRelationships TOPostRelationships = {
};

const struct TOPostFetchedProperties TOPostFetchedProperties = {
};

@implementation TOPostID
@end

@implementation _TOPost

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Post" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Post";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Post" inManagedObjectContext:moc_];
}

- (TOPostID*)objectID {
	return (TOPostID*)[super objectID];
}

+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"post_idValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"post_id"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}
	if ([key isEqualToString:@"total_commentsValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"total_comments"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}
	if ([key isEqualToString:@"total_likesValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"total_likes"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}
	if ([key isEqualToString:@"total_viewsValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"total_views"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}

	return keyPaths;
}




@dynamic link;






@dynamic post_description;






@dynamic post_id;



- (int32_t)post_idValue {
	NSNumber *result = [self post_id];
	return [result intValue];
}

- (void)setPost_idValue:(int32_t)value_ {
	[self setPost_id:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitivePost_idValue {
	NSNumber *result = [self primitivePost_id];
	return [result intValue];
}

- (void)setPrimitivePost_idValue:(int32_t)value_ {
	[self setPrimitivePost_id:[NSNumber numberWithInt:value_]];
}





@dynamic posted_at;






@dynamic title;






@dynamic total_comments;



- (int32_t)total_commentsValue {
	NSNumber *result = [self total_comments];
	return [result intValue];
}

- (void)setTotal_commentsValue:(int32_t)value_ {
	[self setTotal_comments:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveTotal_commentsValue {
	NSNumber *result = [self primitiveTotal_comments];
	return [result intValue];
}

- (void)setPrimitiveTotal_commentsValue:(int32_t)value_ {
	[self setPrimitiveTotal_comments:[NSNumber numberWithInt:value_]];
}





@dynamic total_likes;



- (int32_t)total_likesValue {
	NSNumber *result = [self total_likes];
	return [result intValue];
}

- (void)setTotal_likesValue:(int32_t)value_ {
	[self setTotal_likes:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveTotal_likesValue {
	NSNumber *result = [self primitiveTotal_likes];
	return [result intValue];
}

- (void)setPrimitiveTotal_likesValue:(int32_t)value_ {
	[self setPrimitiveTotal_likes:[NSNumber numberWithInt:value_]];
}





@dynamic total_views;



- (int32_t)total_viewsValue {
	NSNumber *result = [self total_views];
	return [result intValue];
}

- (void)setTotal_viewsValue:(int32_t)value_ {
	[self setTotal_views:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveTotal_viewsValue {
	NSNumber *result = [self primitiveTotal_views];
	return [result intValue];
}

- (void)setPrimitiveTotal_viewsValue:(int32_t)value_ {
	[self setPrimitiveTotal_views:[NSNumber numberWithInt:value_]];
}










@end
