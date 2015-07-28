//
//  main.m
//  ImageFetch
//
//  Created by John Leonard on 7/28/15.
//  Copyright (c) 2015 John Leonard. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char *argv[])
{
  @autoreleasepool
  {
    NSURL *url = [NSURL URLWithString:@"http://www.spitcrazy.com/corsair.jpg"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSError *error = nil;
    
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:NULL error:&error];
    
    if (!data)
    {
      NSLog(@"fetch failed: %@", [error localizedDescription]);
      return 1;
    }
    
    NSLog(@"The file is %lu bytes", (unsigned long)[data length]);
    BOOL written = [data writeToFile:@"/Users/cwnidog/corsair.jpg" options:NSDataWritingAtomic error:&error];
    
    if (!written)
    {
      NSLog(@"write failed: %@", [error localizedDescription]);
      return 1;
    }
    
    NSLog(@"Success");
    
  } // @autoreleasepool
    return 0;
} // main()
