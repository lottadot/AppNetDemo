//
//  Constants.m
//  AppNetDemo
//
//  Created by Shane Zatezalo on 10/8/12.
//  Copyright (c) 2012 Lottadot LLC. All rights reserved.
//

#ifdef STR_CONST
#undef STR_CONST
#endif
#define STR_CONST(name, value) NSString* const name = @ value
#include "ConstantList.h"

