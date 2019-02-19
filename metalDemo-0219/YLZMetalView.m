//
//  YLZMetalView.m
//  metalDemo-0219
//
//  Created by 王洪飞 on 2019/2/19.
//  Copyright © 2019 王洪飞. All rights reserved.
//

#import "YLZMetalView.h"
#import <QuartzCore/CAMetalLayer.h>
#import <Metal/Metal.h>
@interface YLZMetalView()
{
    
    id <MTLDevice> device;
    id <MTLCommandQueue>commonQueue;
}
@property(nonatomic, strong)CAMetalLayer *metalLayer;

@end

@implementation YLZMetalView

+(Class)layerClass{
    return [CAMetalLayer class];
}

-(CAMetalLayer *)metalLayer{
    return (CAMetalLayer *)self.layer;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        device = MTLCreateSystemDefaultDevice();
        commonQueue = device.newCommandQueue;
        return self;
    }
    return nil;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        device = MTLCreateSystemDefaultDevice();
        commonQueue = device.newCommandQueue;
        
        return self;
    }
    return nil;
}

-(void)commit{
    
}
-(void)didMoveToWindow{
    [self render];
}

-(void)render {
    
    id <CAMetalDrawable>drawable =  self.metalLayer.nextDrawable;
    if (!drawable) {
        return;
    }
    
    MTLRenderPassDescriptor *renderDescipor = [MTLRenderPassDescriptor new];
    renderDescipor.colorAttachments[0].clearColor = MTLClearColorMake(1.0, 0.1, 0.1, 0.9);
    renderDescipor.colorAttachments[0].texture = drawable.texture;
    renderDescipor.colorAttachments[0].loadAction = MTLLoadActionClear;
    renderDescipor.colorAttachments[0].storeAction = MTLStoreActionStore;
    
    id <MTLCommandBuffer>commandBuffer = commonQueue.commandBuffer;
    id<MTLCommandEncoder>commandEncoder = [commandBuffer renderCommandEncoderWithDescriptor:renderDescipor];
    [commandEncoder endEncoding];
    [commandBuffer presentDrawable:drawable];
    [commandBuffer commit];
    
}

-(instancetype)init{
    if (self = [super init]) {
        
        return self;
    }
    return nil;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
