
#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface database : NSObject {
	sqlite3 *adatabase;
}

-(NSMutableArray *) getAllDataForQuery:(NSString *)sql;
-(NSString *) GetDatabasePath;
-(void) dataBaseQuery:(NSString *)query;

+(database*) shareDatabase;
-(NSInteger) getMaxValueForQuery:(NSString *)sql;
-(NSString *) getFirstValueForQuery:(NSString *)sql;
-(int)getMaxColumn:(NSString*)columnName fromTable:(NSString*)tableName andPdfId:(int)pdfId andPageNo:(int)pageNo;

@end
