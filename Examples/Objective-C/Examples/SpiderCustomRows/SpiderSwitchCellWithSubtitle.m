//
//  SpiderSwitchCellWithSubtitle.m
//  XLForm
//
//  Created by Dong Lin on 27/03/17.
//  Copyright © 2017 Xmartlabs. All rights reserved.
//

#import "SpiderSwitchCellWithSubtitle.h"

NSString * const XLFormRowDescriptorTypeBooleanSwitchWithSubtitle = @"SpiderSwitchCellWithSubtitle";

@implementation SpiderSwitchCellWithSubtitle

#pragma mark - XLFormDescriptorCell

+(void)load
{
    [XLFormViewController.cellClassesForRowDescriptorTypes setObject:[SpiderSwitchCellWithSubtitle class]
                                                              forKey:XLFormRowDescriptorTypeBooleanSwitchWithSubtitle];
}

- (void)configure
{
    [super configure];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.accessoryView = [[UISwitch alloc] init];
    self.editingAccessoryView = self.accessoryView;
    [self.switchControl addTarget:self action:@selector(valueChanged) forControlEvents:UIControlEventValueChanged];
}

- (void)update
{
    [super update];
    self.textLabel.text = self.rowDescriptor.title;
    [self.textLabel setFont:[UIFont systemFontOfSize:14]];
    self.detailTextLabel.text = self.rowDescriptor.subtitle;
    self.detailTextLabel.numberOfLines = 0;
    [self.detailTextLabel setFont:[UIFont systemFontOfSize:12]];
    self.switchControl.on = [self.rowDescriptor.value boolValue];
    self.switchControl.enabled = !self.rowDescriptor.isDisabled;
    self.switchControl.onTintColor = [UIColor yellowColor];
}

- (UISwitch *)switchControl
{
    return (UISwitch *)self.accessoryView;
}

- (void)valueChanged
{
    self.rowDescriptor.value = @(self.switchControl.on);
}

+(CGFloat)formDescriptorCellHeightForRowDescriptor:(XLFormRowDescriptor *)rowDescriptor
{
    return 68;
}

@end
