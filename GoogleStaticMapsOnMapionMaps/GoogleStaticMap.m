//
//  GoogleStaticMap.m
//  GoogleStaticMapsOnMapionMaps
//
//  Created by honjo2 on 2012/10/21.
//  Copyright (c) 2012年 honjo2. All rights reserved.
//

#import "GoogleStaticMap.h"

@implementation GoogleStaticMap {
  float _screenScale;
}

- (id)init {
  if (!(self = [super init])) return nil;
  
  self.maxZoom = 21;
  self.minZoom = 0;
  self.name = @"GoogleStaticMap";
  self.version = @"";
  self.copyright = @"Google";
  self.tileLength = 512;
  
  _screenScale = 1.0;
  if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)]) {
    _screenScale = [[[UIScreen mainScreen] valueForKey:@"scale"] floatValue];
  }
  
  return self;
}

- (NSURL *)URLForTile:(MMTile)tile {
  float length = exp2f(tile.zoom) * 256/_screenScale;
  float pixelx = tile.x * (256/_screenScale) + (128/_screenScale);
  float pixely = tile.y * (256/_screenScale) + (128/_screenScale);
  
  MMProjectedRect projectedRect = self.projectedRect;
  
  double metersPerPixel = projectedRect.size.width / length;
  
  MMProjectedPoint projectedPoint;
  projectedPoint.x = (pixelx * metersPerPixel) - fabs(projectedRect.origin.x);
  projectedPoint.y = ((length - pixely) * metersPerPixel) - fabs(projectedRect.origin.y);
  
  CLLocationCoordinate2D center = [self projectedPointToCoordinate:projectedPoint];
  
  NSString *urlString = [NSString stringWithFormat:@"http://maps.google.com/maps/api/staticmap?center=%f,%f&zoom=%d&size=256x256&maptype=roadmap&sensor=false&scale=2",  center.latitude, center.longitude, tile.zoom];
  //  NSLog(@"url=%@", urlString);
  
  return [NSURL URLWithString:urlString];
}

@end
