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
    NSURL *url = [NSURL URLWithString:@"http://www.gear-wiki.com/showfile/2251/gearwikilogo.png/269"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSError *error = nil;
    
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:NULL error:&error];
    
    if (!data)
    {
      NSLog(@"fetch failed: %@", [error localizedDescription]);
      return 1;
    }
    
    NSLog(@"The file is %lu bytes", (unsigned long)[data length]);
    BOOL written = [data writeToFile:@"/tmp/google.png" options:0 error:&error];
    
    if (!written)
    {
      NSLog(@"write failed: %@", [error localizedDescription]);
      return 1;
    }
    
    NSLog(@"Success");
    
  } // @autoreleasepool
    return 0;
} // main()
