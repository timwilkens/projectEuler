package main

import "fmt"

/*
You are given the following information, but you may prefer to do some research for yourself.

1 Jan 1900 was a Monday.
Thirty days has September,
April, June and November.
All the rest have thirty-one,
Saving February alone,
Which has twenty-eight, rain or shine.
And on leap years, twenty-nine.

A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.

How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?
*/

type Date struct {
	Month     int // 1 based
	Day	      int // 1 based
	Year      int // 1 based
	DayOfWeek int // 0 based, starting with Sunday
}

var lastDay = [13]int{ 0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 }

func (d *Date) Next() {
	d.NextDayOfWeek()
	d.Day += 1

	endOfMonth := d.LastDayOfMonth()
	if d.Day > endOfMonth {
		d.Day = 1
		d.NextMonth()
	}

	// Next year if we are in January.
	if d.Month == 1 && d.Day == 1 {
		d.Year += 1
	}
}

func (d *Date) LastDayOfMonth() int {
	if d.Month == 2 {
		if d.IsLeap() {
			return 29
		} else {
			return 28
		}
	} else {
		return lastDay[d.Month]
	}
}

func (d *Date) NextMonth() {
	month := d.Month
	if month < 12 {
		d.Month += 1
	} else {
		d.Month = 1
	}
}

func (d *Date) IsLeap() bool {
	year := d.Year
	if ((year % 4 == 0) && (year % 100 != 0)) || year % 400 == 0 {
		return true
	} else {
		return false
	}
}

func (d *Date) NextDayOfWeek() {
	if d.DayOfWeek < 6 {
		d.DayOfWeek += 1
	} else {
		d.DayOfWeek = 0
	}
}

func (d *Date) FirstSunday() bool {
	if d.DayOfWeek == 0 && d.Day == 1 {
		return true
	} else {
		return false
	}
}

func main() {
	date := Date{ Month : 1, Day : 1, Year : 1900, DayOfWeek : 1 }
	firstSunday := 0
	for date.Year < 2001 {
		if date.Year > 1900 && date.FirstSunday() {
			firstSunday += 1
		}
		date.Next()
	}
	fmt.Println(firstSunday)
}