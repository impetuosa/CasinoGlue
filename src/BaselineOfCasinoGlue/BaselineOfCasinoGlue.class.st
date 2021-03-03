Class {
	#name : #BaselineOfCasinoGlue,
	#superclass : #BaselineOf,
	#category : #BaselineOfCasinoGlue
}

{ #category : #baselines }
BaselineOfCasinoGlue >> baseline: spec [
	<baseline>
	spec
		baseline: 'Jindao'
		with: [ spec repository: 'github://impetuosa/jindao' ].
	spec
		baseline: 'Casino'
		with: [ spec repository: 'github://badetitou/casino' ].
	spec package: 'CasinoGlue' with: [ spec requires: #(Jindao Casino) ]
]
