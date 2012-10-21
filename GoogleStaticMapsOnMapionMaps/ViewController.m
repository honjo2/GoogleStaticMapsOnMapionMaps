//
//  ViewController.m
//  GoogleStaticMapsOnMapionMaps
//
//  Created by honjo2 on 2012/10/21.
//  Copyright (c) 2012年 honjo2. All rights reserved.
//

#import "ViewController.h"
#import "GoogleStaticMap.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
  
  GoogleStaticMap *googleStaticMap = [[GoogleStaticMap alloc] init];
  
  MMMapView *mapView = [[MMMapView alloc] initWithFrame:self.view.bounds key:@"2af36091efd531989641a0f01e195d65" map:googleStaticMap];
  
  mapView.zoom = 10;
  
  [self.view addSubview:mapView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
