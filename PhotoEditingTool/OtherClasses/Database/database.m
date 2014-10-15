
#import "database.h"


@implementation database

static database *shareDatabase =nil;

+(database*) shareDatabase{
	if(!shareDatabase){
		shareDatabase = [[database alloc] init];
	}
	
	return shareDatabase;
	
}

-(NSString *) GetDatabasePath {
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) ;
    NSString *documentsDirectory = [paths objectAtIndex:0] ;
	return [documentsDirectory stringByAppendingPathComponent:@"myPhotoEditingToolSqllite"] ;
}

-(NSMutableArray *) getAllDataForQuery:(NSString *)sql{
	sqlite3_stmt *statement = nil ;
	NSString *path = [self GetDatabasePath];
	
	NSMutableArray *alldata= [[NSMutableArray alloc] init];
	
	if(sqlite3_open([path UTF8String],&adatabase) == SQLITE_OK )
	{
    	NSString *query = sql;
		
		if((sqlite3_prepare_v2(adatabase,[query UTF8String],-1, &statement, NULL)) == SQLITE_OK)
		{
			while(sqlite3_step(statement) == SQLITE_ROW)
			{	
				
				NSMutableDictionary *currentRow = [[NSMutableDictionary alloc] init];
                
				int count = sqlite3_column_count(statement);
				
				for (int i=0; i < count; i++) {
                    
					char *name = (char*) sqlite3_column_name(statement, i);
					char *data = (char*) sqlite3_column_text(statement, i);
					
					NSString *columnData;
					NSString *columnName = [NSString stringWithCString:name encoding:NSUTF8StringEncoding];
                    
					
					if(data != nil)
						columnData = [NSString stringWithCString:data encoding:NSUTF8StringEncoding];
					else {
						columnData = @"";
					}
                    
					[currentRow setObject:columnData forKey:columnName];
				}
                
				[alldata addObject:currentRow];
			}
		}
		sqlite3_finalize(statement); 
	}
       sqlite3_close(adatabase);
	return alldata;
}

-(void)dataBaseQuery:(NSString *)query
{
	sqlite3_stmt *statement = nil ;
	NSString *path = [self GetDatabasePath];
	
	if(sqlite3_open([path UTF8String],&adatabase) == SQLITE_OK )
	{		
		if((sqlite3_prepare_v2(adatabase,[query UTF8String],-1, &statement, NULL)) == SQLITE_OK)
		{
			sqlite3_step(statement);
		}
		sqlite3_finalize(statement); 
	}
	sqlite3_close(adatabase);
}


-(NSInteger) getMaxValueForQuery:(NSString *)sql{
    
    sqlite3_stmt *statement = nil;
	NSString *path = [self GetDatabasePath];
	NSInteger intMax = 1;
	
	if(sqlite3_open([path UTF8String],&adatabase) == SQLITE_OK)
	{
    	NSString *query = sql;
		
		if((sqlite3_prepare_v2(adatabase,[query UTF8String],-1, &statement, NULL)) == SQLITE_OK)
		{
			while(sqlite3_step(statement) == SQLITE_ROW)
			{
                char *max = (char*) sqlite3_column_text(statement, 0);
                if (max) {
                    NSString *strMax = [NSString stringWithCString:max encoding:NSUTF8StringEncoding];
                    intMax = [strMax intValue];
                }else{
                    intMax=1;
                }
			}
		}
		sqlite3_finalize(statement);
	}
	sqlite3_close(adatabase);
    
    return intMax;
}


-(NSString *) getFirstValueForQuery:(NSString *)sql{
    sqlite3_stmt *statement = nil ;
	NSString *path = [self GetDatabasePath];
    
    NSString *strValue = @"";
	
	if(sqlite3_open([path UTF8String],&adatabase) == SQLITE_OK )
	{
    	NSString *query = sql;
		
		if((sqlite3_prepare_v2(adatabase,[query UTF8String],-1, &statement, NULL)) == SQLITE_OK)
		{
			while(sqlite3_step(statement) == SQLITE_ROW)
			{
                char *data = (char*) sqlite3_column_text(statement, 0);
                if (data) {
                    strValue = [NSString stringWithCString:data encoding:NSUTF8StringEncoding];
                }else{
                }
			}
		}
        else {
            /////     *****NSLog(@"Error:  message '%s'. %@ %s", sqlite3_errmsg(adatabase),sql,__FUNCTION__);
        }
		sqlite3_finalize(statement);
	}
	sqlite3_close(adatabase);
    
    return strValue;
}

-(NSString *) getFirstValueForQueryForBackGround:(NSString *)sql{
    sqlite3_stmt *statement = nil ;
	NSString *path = [self GetDatabasePath];
    
    NSString *strValue = @"";
	
	if(sqlite3_open([path UTF8String],&adatabase) == SQLITE_OK ) {
    	NSString *query = sql;
		
		if((sqlite3_prepare_v2(adatabase,[query UTF8String],-1, &statement, NULL)) == SQLITE_OK)
		{
			while(sqlite3_step(statement) == SQLITE_ROW)
			{
                char *data = (char*) sqlite3_column_text(statement, 0);
                if (data) {
                    strValue = [NSString stringWithCString:data encoding:NSUTF8StringEncoding];
                }else{
                    //                    return nil;  // kunal
                }
			}
		}
        else {
            /////     *****NSLog(@"Error:  message '%s'. %@ %s", sqlite3_errmsg(adatabase),sql,__FUNCTION__);
        }
		sqlite3_finalize(statement);
	}
	sqlite3_close(adatabase);
    
    return strValue;
}

-(int)getMaxColumn:(NSString*)columnName fromTable:(NSString*)tableName andPdfId:(int)pdfId andPageNo:(int)pageNo{
    sqlite3_stmt *statement = nil ;
	NSString *path = [self GetDatabasePath];
    
    int maxValue=0;
	
	if(sqlite3_open([path UTF8String],&adatabase) == SQLITE_OK )
	{
    	NSString *query = [NSString stringWithFormat:@"select max(%@) from %@ where Book_Id=%d and Page_No=%d",columnName,tableName,pdfId,pageNo];
		
		if((sqlite3_prepare_v2(adatabase,[query UTF8String],-1, &statement, NULL)) == SQLITE_OK)
		{
			while(sqlite3_step(statement) == SQLITE_ROW)
			{
                maxValue= sqlite3_column_int(statement, 0);
            }
		}
        else {
            /////     *****NSLog(@"Error:  message '%s'. %@ %s", sqlite3_errmsg(adatabase),sql,__FUNCTION__);
        }
		sqlite3_finalize(statement);
	}
	sqlite3_close(adatabase);
    if (maxValue!=0) {
        return maxValue+1;
    }else{
        return 1001;
    }
}

@end