library Test93

define "Invalid Sort": from { Interval[1, 3], Interval[3, 5] } S sort asc
define "Invalid Column Sort":
  from
    {
      { id: 1, relevantPeriod: Interval[Today(), Today() + 1 day] },
      { id: 2, relevantPeriod: Interval[Today(), Today() + 2 days] }
    }
  S sort by relevantPeriod desc

define "Invalid Expression Sort":
  from
    {
      { id: 1, relevantPeriod: Interval[Today(), Today() + 1 day] },
      { id: 2, relevantPeriod: Interval[Today(), Today() + 2 days] }
    }
  S sort by Interval[start of relevantPeriod, end of relevantPeriod]
