// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to TOPost.h instead.

#import <CoreData/CoreData.h>


extern const struct TOPostAttributes {
	 NSString *link;
	 NSString *post_description;
	 NSString *post_id;
	 NSString *posted_at;
	 NSString *title;
	 NSString *total_comments;
	 NSString *total_likes;
	 NSString *total_views;
} TOPostAttributes;

extern const struct TOPostRelationships {
} TOPostRelationships;

extern const struct TOPostFetchedProperties {
} TOPostFetchedProperties;











@interface TOPostID : NSManagedObjectID {}
@end

@interface _TOPost : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (TOPostID*)objectID;




@property (nonatomic, retain) NSString *link;


//- (BOOL)validateLink:(id*)value_ error:(NSError**)error_;




@property (nonatomic, retain) NSString *post_description;


//- (BOOL)validatePost_description:(id*)value_ error:(NSError**)error_;




@property (nonatomic, retain) NSNumber *post_id;


@property int32_t post_idValue;
- (int32_t)post_idValue;
- (void)setPost_idValue:(int32_t)value_;

//- (BOOL)validatePost_id:(id*)value_ error:(NSError**)error_;




@property (nonatomic, retain) NSDate *posted_at;


//- (BOOL)validatePosted_at:(id*)value_ error:(NSError**)error_;




@property (nonatomic, retain) NSString *title;


//- (BOOL)validateTitle:(id*)value_ error:(NSError**)error_;




@property (nonatomic, retain) NSNumber *total_comments;


@property int32_t total_commentsValue;
- (int32_t)total_commentsValue;
- (void)setTotal_commentsValue:(int32_t)value_;

//- (BOOL)validateTotal_comments:(id*)value_ error:(NSError**)error_;




@property (nonatomic, retain) NSNumber *total_likes;


@property int32_t total_likesValue;
- (int32_t)total_likesValue;
- (void)setTotal_likesValue:(int32_t)value_;

//- (BOOL)validateTotal_likes:(id*)value_ error:(NSError**)error_;




@property (nonatomic, retain) NSNumber *total_views;


@property int32_t total_viewsValue;
- (int32_t)total_viewsValue;
- (void)setTotal_viewsValue:(int32_t)value_;

//- (BOOL)validateTotal_views:(id*)value_ error:(NSError**)error_;






@end

@interface _TOPost (CoreDataGeneratedAccessors)

@end

@interface _TOPost (CoreDataGeneratedPrimitiveAccessors)


- (NSString *)primitiveLink;
- (void)setPrimitiveLink:(NSString *)value;




- (NSString *)primitivePost_description;
- (void)setPrimitivePost_description:(NSString *)value;




- (NSNumber *)primitivePost_id;
- (void)setPrimitivePost_id:(NSNumber *)value;

- (int32_t)primitivePost_idValue;
- (void)setPrimitivePost_idValue:(int32_t)value_;




- (NSDate *)primitivePosted_at;
- (void)setPrimitivePosted_at:(NSDate *)value;




- (NSString *)primitiveTitle;
- (void)setPrimitiveTitle:(NSString *)value;




- (NSNumber *)primitiveTotal_comments;
- (void)setPrimitiveTotal_comments:(NSNumber *)value;

- (int32_t)primitiveTotal_commentsValue;
- (void)setPrimitiveTotal_commentsValue:(int32_t)value_;




- (NSNumber *)primitiveTotal_likes;
- (void)setPrimitiveTotal_likes:(NSNumber *)value;

- (int32_t)primitiveTotal_likesValue;
- (void)setPrimitiveTotal_likesValue:(int32_t)value_;




- (NSNumber *)primitiveTotal_views;
- (void)setPrimitiveTotal_views:(NSNumber *)value;

- (int32_t)primitiveTotal_viewsValue;
- (void)setPrimitiveTotal_viewsValue:(int32_t)value_;




@end
