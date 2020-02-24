from datetime import datetime, date
def is_leap_year(year):
    return year % 4 == 0 and (year % 100 != 0 or year % 400 == 0)
def calcDaysInMonth(year,month):
    months = {"jan":31,"feb":28,"mar":}
