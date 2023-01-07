Extension { #name : #CSNAttribute }

{ #category : #'*CasinoGlue' }
CSNAttribute >> beAddedInto: aCSNUISelect [

	^ aCSNUISelect addAttribute: self
]

{ #category : #'*CasinoGlue' }
CSNAttribute >> isDataBinding [

	^ false
]
