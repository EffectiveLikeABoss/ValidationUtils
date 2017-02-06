//
//  This is free and unencumbered software released into the public domain.
//
//  Anyone is free to copy, modify, publish, use, compile, sell, or
//  distribute this software, either in source code form or as a compiled
//  binary, for any purpose, commercial or non-commercial, and by any
//  means.

//  In jurisdictions that recognize copyright laws, the author or authors
//  of this software dedicate any and all copyright interest in the
//  software to the public domain. We make this dedication for the benefit
//  of the public at large and to the detriment of our heirs and
//  successors. We intend this dedication to be an overt act of
//  relinquishment in perpetuity of all present and future rights to this
//  software under copyright law.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
//  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
//  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
//  IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
//  OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
//  ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
//  OTHER DEALINGS IN THE SOFTWARE.
//
//  For more information, please refer to <http://unlicense.org>
//
//  Created by Effective Like ABoss
//

#import "NSDate+ELBZeroTime.h"

@implementation NSDate(ELBZeroTime)

-(NSDate*)resetTimeToZero{
    static unsigned int flags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSDateComponents* components = [calendar components:flags fromDate:self];
    return [calendar dateFromComponents:components];
}

-(NSDate*)resetDateToCurrent{
    unsigned int currentDateFlags =
    NSCalendarUnitEra                  |
    NSCalendarUnitYear                 |
    NSCalendarUnitMonth                |
    NSCalendarUnitDay                  |
    NSCalendarUnitHour                 |
    NSCalendarUnitMinute               |
    NSCalendarUnitSecond               |
    NSCalendarUnitWeekday              |
    NSCalendarUnitWeekdayOrdinal       |
    NSCalendarUnitQuarter              |
    NSCalendarUnitWeekOfMonth          |
    NSCalendarUnitWeekOfYear           |
    NSCalendarUnitYearForWeekOfYear    |
    NSCalendarUnitNanosecond           |
    NSCalendarUnitCalendar             |
    NSCalendarUnitTimeZone;
    
    NSCalendar *calendar=[NSCalendar currentCalendar];
    NSDateComponents *currentDateComponents = [calendar components:currentDateFlags fromDate:[NSDate date]];
    
    unsigned int oldTimeFlags = NSCalendarUnitHour | NSCalendarUnitMinute;
    NSDateComponents* oldTimeComponents=[calendar components:oldTimeFlags fromDate:self];
    
    
    [currentDateComponents setHour:[oldTimeComponents hour]];
    [currentDateComponents setMinute:[oldTimeComponents minute]];
    [currentDateComponents setSecond:0];
    [currentDateComponents setNanosecond:0];
    
    return [calendar dateFromComponents:currentDateComponents];
}

@end
