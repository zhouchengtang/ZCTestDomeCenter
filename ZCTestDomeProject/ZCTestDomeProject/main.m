//
//  main.m
//  ZCTestDomeProject
//
//  Created by zhoucheng on 2017/7/4.
//  Copyright © 2017年 zhoucheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

typedef struct Node
{
    int data;
    struct Node *next;
}pNode;

pNode * creatList(int len)
{
    pNode *head, *pt, *p;
    head = pt = (struct Node *)malloc(sizeof(pNode));
    pt->data = len;
    while(pt->data != 0){
        len--;
        p = pt;
        pt = (struct Node *)malloc(sizeof(pNode));
        pt->data = len;
        p->next = pt;
        
    }
    p->next = NULL;
    return head;
}

void printfList(pNode * head)
{
    pNode * p = head;
    while(p->next != NULL){
        printf("%d ",p->data);
        p = p->next;
    }
    printf("%d ",p->data);
}

pNode * reverseList(pNode *pHead) {
    pNode *p1,*p2,*p3;
    p1=pHead;
    p2=p1->next;//　这个结点为要移动的结点
    while(p2){
        p3=p2->next;//记录的为要移动的结点的下一个结点
        p2->next=p1;//移动结点到最前
        p1=p2;//移动的结点变为新表头
        p2=p3;//下个结点变为要移动的结点
    }
    pHead->next=NULL;//移动完毕后head变为表尾，让它指向为空
    return p1;
}

int getListLength(pNode * pHead)
{
    pNode *p;
    p=pHead;
    int j = 0;/*用来存放链表的长度*/
    while(p != NULL)
    {
        p=p->next;
        j++;
    }
    return j;
}

//找到链表的第m个元素
pNode * getTheData(pNode * pHead,int m)
{
    if (pHead == NULL) {
        return NULL;
    }
    if (m == 1) {
        return pHead;
    }
    pNode * p = pHead;
    for (int i = 0; i < m - 1; i++) {
        p = p -> next;
    }
    return p;
}

pNode * getTheBottomNumberOfData(pNode * pHead,int m)
{
    pNode * p1, * p2;
    p1 = p2 = pHead;
    for (int i = 0; i < m - 1; i++) {
        p1 = p1->next;
        if (p1 == NULL) {
            return NULL;
        }
    }
    if (p1->next!=NULL) {
        while (p1->next) {
            p1 = p1->next;
            p2 = p2->next;
        }
    }else{
        p2 = pHead;
    }
    return p2;
}

int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        pNode * listNodes = creatList(5);
        printfList(listNodes);
        listNodes = reverseList(listNodes);
        printfList(listNodes);
        printf("%d\n", getTheBottomNumberOfData(listNodes, 2)->data);
        printf("%d\n", getTheData(listNodes, 5)->data);
        
        int testA = 5;
        int *testA_p = &testA;
        printf("%d ---- %x ---- %x\n", *testA_p, testA_p, &testA);
        
        int **testA_pp = &testA_p;
        printf("%d ----\n ", **testA_pp);
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
