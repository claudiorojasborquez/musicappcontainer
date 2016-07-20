//
//  HelperProjectFile.m
//  the complete musician mvp 1
//
//  Created by Claudio Rojas on 7/18/16.
//  Copyright © 2016 Claudio. All rights reserved.
//

#import "HelperProjectFile.h"

NSMutableArray * getFilesAndDirectories(NSString* root, BOOL filterFiles, BOOL filterDirectories){
    NSMutableArray *filesAndDirs;
    NSString * resourcePath =[[NSBundle mainBundle]  resourcePath];
    resourcePath = [NSString stringWithFormat:@"%@/%@", resourcePath, root];
    NSDirectoryEnumerator *directoryEnumerator = [[NSFileManager defaultManager] enumeratorAtPath:resourcePath];
    
    filesAndDirs = [[NSMutableArray alloc] init];
    
    for (NSString *file in directoryEnumerator){
        NSString *fullPath = [NSString stringWithFormat:@"%@/%@", resourcePath, file];
        
        BOOL isDir = NO;
        [[NSFileManager defaultManager] fileExistsAtPath:fullPath isDirectory:&isDir];
 
        if(isDir && !filterDirectories){ //if dir and not filter dir
            [filesAndDirs addObject:file];
        }else if (!isDir && !filterFiles){
            [filesAndDirs addObject:file];
        }
    }
    return filesAndDirs;

}
