//
//  DTSetTableViewModel.m
//  DrivingTest
//
//  Created by 郭大侠 on 2018/6/6.
//  Copyright © 2018年 eclicks. All rights reserved.
//

#import "DTSetTableViewModel.h"
#import "DTSetTableViewHeaderFootView.h"
StringAsKey(DTSetTableViewHeaderFootViewID)
@implementation DTSetTableViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.sectionModelArray = [NSMutableArray array];
    }
    return self;
}

- (DTTableViewSectionModel*)sectionModelAtSection:(NSInteger)section
{
    @try {
        DTTableViewSectionModel *sectionModel = self.sectionModelArray[section];
        return sectionModel;
    }
    @catch (NSException *exception) {
        return nil;
    }
}

- (DTTableViewCellModel*)cellModelAtIndexPath:(NSIndexPath *)indexPath
{
    @try {
        DTTableViewSectionModel *sectionModel = self.sectionModelArray[indexPath.section];
        DTTableViewCellModel *cellModel = sectionModel.cellModelArray[indexPath.row];
        return cellModel;
    }
    @catch (NSException *exception) {
        return nil;
    }
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DTTableViewCellModel *cellModel = [self cellModelAtIndexPath:indexPath];
    return cellModel.height;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    DTTableViewSectionModel *sectionModel = [self sectionModelAtSection:section];
    return sectionModel.headerHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    DTTableViewSectionModel *sectionModel = [self sectionModelAtSection:section];
    return sectionModel.footerHeight;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    DTTableViewSectionModel *sectionModel = [self sectionModelAtSection:section];
    DTViewRenderBlock headerViewRenderBlock = sectionModel.headerViewRenderBlock;
    if (headerViewRenderBlock) {
        return headerViewRenderBlock(section, tableView);
    } else if (sectionModel.defaultHeaderTitle.length>0){
        DTSetTableViewHeaderFootView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:DTSetTableViewHeaderFootViewID];
        if(header== nil){
            header = [[DTSetTableViewHeaderFootView alloc]initWithReuseIdentifier:DTSetTableViewHeaderFootViewID];
            header.leftTitleLabel.text = sectionModel.defaultHeaderTitle;
            header.leftTitleLabel.textColor = sectionModel.defaultHeaderTextColor==nil ? [UIColor blackColor]: sectionModel.defaultHeaderTextColor;
            header.leftTitleLabel.font = sectionModel.defaultHeaderTextFont == nil ? [UIFont systemFontOfSize:16]:sectionModel.defaultHeaderTextFont;
            header.contentView.backgroundColor = sectionModel.headerBackGroudColor == nil ? [UIColor whiteColor]:sectionModel.headerBackGroudColor;
        }
        return header;
    }else{
        return sectionModel.headerView;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    DTTableViewSectionModel *sectionModel = [self sectionModelAtSection:section];
    DTViewRenderBlock footerViewRenderBlock = sectionModel.footerViewRenderBlock;
    if (footerViewRenderBlock) {
        return footerViewRenderBlock(section, tableView);
    } else {
        return sectionModel.footerView;
    }
}

- (nullable NSIndexPath *)tableView:(UITableView *)tableView
           willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DTTableViewCellModel *cellModel = [self cellModelAtIndexPath:indexPath];
    DTCellWillSelectBlock willSelectBlock = cellModel.willSelectBlock;
    ;
    if (willSelectBlock) {
        return willSelectBlock(indexPath, tableView);
    }
    return indexPath;
}

- (nullable NSIndexPath *)tableView:(UITableView *)tableView
         willDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DTTableViewCellModel *cellModel = [self cellModelAtIndexPath:indexPath];
    DTCellWillSelectBlock willDeselectBlock = cellModel.willDeselectBlock;
    ;
    if (willDeselectBlock) {
        return willDeselectBlock(indexPath, tableView);
    }
    return indexPath;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DTTableViewCellModel *cellModel = [self cellModelAtIndexPath:indexPath];
    DTCellSelectionBlock selectionBlock = cellModel.selectionBlock;
    if (selectionBlock) {
        selectionBlock(indexPath, tableView);
    }
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DTTableViewCellModel *cellModel = [self cellModelAtIndexPath:indexPath];
    DTCellSelectionBlock deselectionBlock = cellModel.deselectionBlock;
    if (deselectionBlock) {
        deselectionBlock(indexPath, tableView);
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DTTableViewCellModel *cellModel = [self cellModelAtIndexPath:indexPath];
    return cellModel.deleteConfirmationButtonTitle;
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sectionModelArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    DTTableViewSectionModel *sectionModel = [self sectionModelAtSection:section];
    return sectionModel.cellModelArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DTTableViewCellModel *cellModel = [self cellModelAtIndexPath:indexPath];
    UITableViewCell *cell = nil;
    DTCellRenderBlock renderBlock = cellModel.renderBlock;
    if (renderBlock) {
        cell = renderBlock(indexPath, tableView);
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    DTTableViewCellModel *cellModel = [self cellModelAtIndexPath:indexPath];
    DTCellWillDisplayBlock willDisplayBlock = cellModel.willDisplayBlock;
    if (willDisplayBlock) {
        willDisplayBlock(cell, indexPath, tableView);
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    DTTableViewSectionModel *sectionModel = [self sectionModelAtSection:section];
    return sectionModel.headerTitle;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    DTTableViewSectionModel *sectionModel = [self sectionModelAtSection:section];
    return sectionModel.footerTitle;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    DTTableViewCellModel *cellModel = [self cellModelAtIndexPath:indexPath];
    return cellModel.canEdit;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    DTTableViewCellModel *cellModel = [self cellModelAtIndexPath:indexPath];
    DTCellCommitEditBlock commitEditBlock = cellModel.commitEditBlock;
    if (commitEditBlock) {
        commitEditBlock(indexPath, tableView, editingStyle);
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (self.dtDelegate && [self.dtDelegate respondsToSelector:@selector(DTScrollViewDidScroll:)]) {
        [self.dtDelegate DTScrollViewDidScroll:scrollView];
    }
}

@end
