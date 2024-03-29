Class {
	#name : #CGAbsolutePositionLayout,
	#superclass : #CSNLLayout,
	#category : #'CasinoGlue-Model'
}

{ #category : #visiting }
CGAbsolutePositionLayout >> accept: aCSNModelVisitor [
	^ aCSNModelVisitor visitCSNLAbsolutePositionLayout: self

	

]

{ #category : #'as yet unclassified' }
CGAbsolutePositionLayout >> getLayoutAttribute [
	^ {}
]

{ #category : #'as yet unclassified' }
CGAbsolutePositionLayout >> rows [
	| inferrableRows nonInferrableRows rows |
	" 
		The layouts in access are defined by the elements, there is not such a container feature. 
		In the case of tabulation, the important thing is the configuration: top and left. 
	"
	inferrableRows := cell
		select: [ :c | c widget attributes anySatisfy: [ :a | a name = #top ] ].
	nonInferrableRows := cell
		select: [ :c | c widget attributes noneSatisfy: [ :a | a name = #top ] ]
		thenCollect: [ :c | {c} asOrderedCollection ].
	rows := (inferrableRows
		groupedBy: [ :c | 
			((c widget attributes detect: [ :a | a name = #top ]) attributeValue
				asNumber / 10) asInteger ]) associations.
	rows := (rows sort: [ :a :b | a key asNumber < b key asNumber ])
		collect: #value.
	^ (rows
		collect: [ :r | 
			r
				sort: [ :a :b | 
					(a widget attributes detect: [ :d | d name = #left ]) attributeValue
						asNumber
						<
							(b widget attributes detect: [ :d | d name = #left ]) attributeValue
								asNumber ] ]) , nonInferrableRows
]

{ #category : #'as yet unclassified' }
CGAbsolutePositionLayout >> rowsDo: aBlockClosure [
	self rows do: aBlockClosure
]
