library PropertyTest

using QUICK

valueset "Female Administrative Sex": '2.16.840.1.113883.3.560.100.2'

context Patient

define EscapedString: 'This string\'s escaped'
define "Escaped\"Identifier": 'This identifier\'s escaped'

define InDemographic:
    AgeInYears() >= 18
        and Patient.gender in "Female Administrative Sex"

define MedianAny: Median(List<Integer>{ null, null, null })
define MedianInt: Median({ 1, 2, 3 })

define ListsOfLists: List<List<Any>>{{'a','b','c'},{1,2,3}}
define LotsOfDups: distinct {1, 2, 2, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5, 5, 4, 3, 2, 1}
define IsIncluded: {2, 3, 4} included in {1, 2, 3, 4, 5}
define IsProperlyIncludes: {1, 2, 3, 4, 5} properly includes {2, 3, 4, 5}
define IsProperlyIncluded: {2, 3, 4} properly included in {1, 2, 3, 4, 5}
define EqInteger: 4 = 4
define EqIntervals: Interval[1, 3] = Interval[1, 3]
define EqTuples: Tuple{a: 1, b: Tuple{c: 1}} = Tuple{a: 1, b: Tuple{c: 1}}
define EqLists: { 1, 2, 3 } = { 1, 2, 3 }

define IsNull: 5 is null
define StringConcat: 'a' + 'b'
define CoalesceExpression: Coalesce(1, 2, 3, 4, 5)
define CoalesceWithNulls: Coalesce(1, null, null, 4, 5)

define HasNull: Count({ 1, null, null, null, 2 })
define Empty: Count({ })

define TypedHasNull: Count(List<Integer> { 1, null, null, null, 2 })
define TypedEmpty: Count(List<Integer> { })

define NestedLet:
  from { { id: 1, value: 10 }, { id: 2, value: 20 } } X
    let
      A: (X.value * 10),
      B: A * 10
    return {
      id: X.id,
      value: X.value,
      a: A,
      b: B
    }
