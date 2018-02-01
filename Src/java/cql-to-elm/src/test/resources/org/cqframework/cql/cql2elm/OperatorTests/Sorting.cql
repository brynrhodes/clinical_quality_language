define TestSimpleSort: from { 1, 2, 3, 4, 5 } X sort desc
define TestColumnSort: from { { id: 1, name: 'Joe' } } X sort by id desc
define TestExpressionSort: from { 1, 2, 3, 4, 5 } X sort by $this * $this
define TestAliasSort: from { 1, 2, 3, 4, 5 } X sort by X desc
