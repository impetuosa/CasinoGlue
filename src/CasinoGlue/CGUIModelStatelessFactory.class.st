Class {
	#name : #CGUIModelStatelessFactory,
	#superclass : #CGUIModelAbstractStatelessFactory,
	#category : #'CasinoGlue-GlueAPI'
}

{ #category : #'as yet unclassified' }
CGUIModelStatelessFactory >> calculateKindOfWidget: aMOObject [

	| viewKindNumber |
	viewKindNumber := aMOObject state at: #DefaultView.

	"Single Form 	0 	(Default) Displays one record at a time.
Continuous Forms 	1 	Displays multiple records (as many as will fit in the current window), each in its own copy of the form's detail section.
Datasheet 	2 	Displays the form fields arranged in rows and columns like a spreadsheet.
PivotTable 	3 	Displays the form as a PivotTable.
PivotChart 	4 	Displays the form as a PivotChart.
Split Form 	5"

	^ #( SingleForm ContinuousForm Datasheet PivotTable PivotChart
	     SplitForm ) at: viewKindNumber + 1
]

{ #category : #accessing }
CGUIModelStatelessFactory >> disabled [
	^ CSNUIDisabled new
		disabled: true;
		yourself
]

{ #category : #accessing }
CGUIModelStatelessFactory >> height: aJinControlCheckbox [
	^ CSNUIAbsoluteHeight new
		attributeValue: aJinControlCheckbox height;
		yourself
]

{ #category : #'as yet unclassified' }
CGUIModelStatelessFactory >> importAccessProperty: aProperty inTheContextOf: anImportedControl [
	| attribute |
	attribute := aProperty acceptVisitor: self.
	(attribute isNil or: [ attribute = self ])
		ifTrue: [ ^ nil ].
	anImportedControl mooseModel add: attribute. 
	anImportedControl addAttribute: attribute.
	^ attribute
]

{ #category : #'as yet unclassified' }
CGUIModelStatelessFactory >> importAccessProperty: aPropertyName state: aValue inTheContextOf: anImportedControl [

	| attribute visitSelector |
	visitSelector := ('visit' , aPropertyName capitalized , ':value:')
		                 asSymbol.

	(self respondsTo: visitSelector) ifFalse: [ 
		self class superclass compile: 'visit' , aPropertyName capitalized
			, ': anAttributeName value: aValue ' ].

	attribute := self perform: visitSelector withArguments: { 
			             aPropertyName.
			             aValue }.
	(attribute isNil or: [ attribute = self ]) ifTrue: [ ^ nil ].

	anImportedControl mooseModel add: attribute.
	attribute beAddedInto: anImportedControl.
	^ attribute
]

{ #category : #'as yet unclassified' }
CGUIModelStatelessFactory >> importControl: aControl widgetState: aState inTheContextOf: aWidget [

	| control intro |
	control := self importModelFrom: aControl state: aState.
	control ifNotNil: [ 
		aWidget mooseModel add: control.
		intro := self
			         resolveLayoutContainer: (aState at: #LayoutID)
			         section: (aState at: #Section)
			         type: (aState at: #LayoutName)
			         inTheContextOf: aWidget.
		intro addWidget: control ].
	^ control
]

{ #category : #'as yet unclassified' }
CGUIModelStatelessFactory >> importForm: aForm widgetInstance: anInstance inTheContextOf: aProject [

	| layout page |
	layout := CSNLVerticalLayout new.
	aProject mooseModel add: layout.

	page := CGPage new
		        realClassName: aForm class name;
		        name: (self sanitizeName: aForm );
		        project: aProject;
		        layout: layout;
		        yourself.


	page kindOfPage: (self calculateKindOfWidget: anInstance).
	aProject mooseModel add: page.
	^ page
]

{ #category : #'as yet unclassified' }
CGUIModelStatelessFactory >> importModelFrom: aControl state: aWidgetState [ 

	| visitSelector |
	visitSelector := aControl typeReference name.
	visitSelector first = $_ ifTrue: [ 
		visitSelector := visitSelector copyFrom: 2 to: visitSelector size ].
	visitSelector := ('visit' , visitSelector , ':state:') asSymbol.

	^ self perform: visitSelector withArguments: { aControl .aWidgetState }
]

{ #category : #'as yet unclassified' }
CGUIModelStatelessFactory >> importOrGetSchema: aJinQuery inTheContextOf: aCSNUICWModel [
	^ aCSNUICWModel entities
		detect: [ :e | e species = MDRelationalSchema ]
		ifNone: [ | sch |
			sch := MDRelationalSchema new.
			sch name: 'Default Access Schema'.
			aCSNUICWModel add: sch.
			sch ]
]

{ #category : #'as yet unclassified' }
CGUIModelStatelessFactory >> importQueryEntity: aJinQuery inTheContextOf: aCSNUICWModel [
	| schema element columns |
	schema := self
		importOrGetSchema: aJinQuery
		inTheContextOf: aCSNUICWModel.
	^ schema elements
		detect: [ :e | e name = aJinQuery name ]
		ifNone: [ element := MDRelationalView new.
			element name: aJinQuery name.
			element sql: aJinQuery sql.

			columns := aJinQuery fields
				collect: [ :f | 
					| col |
					col := MDColumn new
						name: f name;
						type: (self mapType: f typeName);
						yourself.
					element addElement: col.
					
					col ].
			schema addElement: element.
			aCSNUICWModel addAll: columns.
			aCSNUICWModel add: element.
			element ]
]

{ #category : #'as yet unclassified' }
CGUIModelStatelessFactory >> importSubform: aJinControlSubForm inTheContextOf: aForm [
	| wu |

	wu := CGWidgetUsage new
		name: aJinControlSubForm name ;
		widgetName: aJinControlSubForm sourceObjectWithoutSpaces;
		yourself.
	aForm mooseModel add: wu.
	aForm addWidget: wu
]

{ #category : #'as yet unclassified' }
CGUIModelStatelessFactory >> importTableEntity: aJinTable inTheContextOf: aCSNUICWModel [
	| schema element columns |
	schema := self
		importOrGetSchema: aJinTable
		inTheContextOf: aCSNUICWModel.
	^ schema elements
		detect: [ :e | e name = aJinTable name ]
		ifNone: [ element := MDRelationalTable new.
			element name: aJinTable name.
			columns := aJinTable fields
				collect: [ :f | 
					| col |
					col := MDColumn new
						name: f name;
						type: (self mapType: f typeName);
						yourself.
					element addElement: col.
					col ].
			schema addElement: element.
			aCSNUICWModel addAll: columns.
			aCSNUICWModel add: element.
			element ]
]

{ #category : #'as yet unclassified' }
CGUIModelStatelessFactory >> importingContext: aName model: aModel [

	^ CGImportingContext new
		  name: aName;
		  model: aModel;
		  yourself
]

{ #category : #'as yet unclassified' }
CGUIModelStatelessFactory >> mapType: aTypeName [
	^ aTypeName 
]

{ #category : #'as yet unclassified' }
CGUIModelStatelessFactory >> resolveLayoutContainer: aLayoutId section: aSection type: aLayoutTypeName inTheContextOf: aContainer [
	| layoutedContainer section |

	section := (aContainer section: aSection) .
	^ section widgets
		detect: [ :c | 
			c isContainer
				and:
					[ c layout isNotNil and: [ (c propertyNamed: 'LayoutID') = aLayoutId ] ] ]
		ifNone: [ 
			layoutedContainer := CSNUIPanel new.
			" (aLayoutId = 0
				ifTrue: [ CSNUIPanel ]
				ifFalse: [ CSNUIFieldset ]) new."
			layoutedContainer propertyNamed: 'LayoutID' put: aLayoutId.
			layoutedContainer
				layout:
					(aLayoutId = 0
						ifTrue: [ CGAbsolutePositionLayout ]
						ifFalse: [ CGTabulateLayout ]) new.
			section mooseModel add: layoutedContainer.
			section mooseModel add: layoutedContainer layout.
			section addWidget: layoutedContainer.
			layoutedContainer ]
]

{ #category : #'as yet unclassified' }
CGUIModelStatelessFactory >> sanitizeName: aFormOrReport [

	^ (aFormOrReport sanitizedName copyReplaceAll: 'Form_' with: '')
		  copyReplaceAll: 'Report_'
		  with: ''
]

{ #category : #'visiting - properties' }
CGUIModelStatelessFactory >> toPixelSize: aValue [
	^ aValue / 10
]

{ #category : #'visit - control' }
CGUIModelStatelessFactory >> visitAttachment: aJinControlAttachment [
	| input |
	input := CSNUIInputFile new.
	input name: aJinControlAttachment nameWithoutSpaces.
	^ input
]

{ #category : #visiting }
CGUIModelStatelessFactory >> visitAttachment: aMOAttribute state: aMOObject [

	| input |
	input := CSNUIInputFile new.
	input name: aMOAttribute name.
	^ input
]

{ #category : #'visit - control' }
CGUIModelStatelessFactory >> visitCheckbox: aJinControlCheckbox [ 
	| input |
	input := CSNUIInputCheckbox new. 
	input name: aJinControlCheckbox nameWithoutSpaces.
	[input value: aJinControlCheckbox value.] on: Win32Error do: [ :e | e passIfNotError0x80020009  ].
	^ input 
]

{ #category : #'visit - control' }
CGUIModelStatelessFactory >> visitCombobox: aJinControlCombobox [
	| input |
	input := CSNUISelect new.
	input name: aJinControlCombobox nameWithoutSpaces.
	input value: aJinControlCombobox defaultValue.
	^ input
]

{ #category : #visiting }
CGUIModelStatelessFactory >> visitCombobox: aMOAttribute state: aMOObject [

	| input |
	input := CSNUISelect new.
	input name: aMOAttribute name.
	input value: (aMOObject at: #DefaultValue).
	^ input
]

{ #category : #'visit - control' }
CGUIModelStatelessFactory >> visitCommandButton: aJinControlCommandButton [
	| input |
	input := CSNUIButton new.
	input name: aJinControlCommandButton nameWithoutSpaces.
	input
		addAttribute:
			(CSNUILabel new
				attributeValue: aJinControlCommandButton caption;
				yourself).
	^ input
]

{ #category : #visiting }
CGUIModelStatelessFactory >> visitCommandButton: aMOAttribute state: aMOObject [

	| input |
	input := CSNUIButton new.
	input name: aMOAttribute name.
	input addAttribute: (CSNUILabel new
			 attributeValue: (aMOObject at: #Caption);
			 yourself).
	^ input
]

{ #category : #'as yet unclassified' }
CGUIModelStatelessFactory >> visitCustomControl: aJinControlGeneric [
	aJinControlGeneric type = 'OptionGroup'
		ifTrue: [ ^ nil ].
	aJinControlGeneric type = 'OptionButton'
		ifTrue: [ ^ nil ].
	(aJinControlGeneric handle propertyNamed: #OLEClass)
		= 'WMEBoutons020000.BoutonGenerique'
		ifTrue: [ | input |
			input := CSNUIButton new.
			input name: aJinControlGeneric nameWithoutSpaces.
			input
				addAttribute:
					(CSNUILabel new
						attributeValue: (aJinControlGeneric handle propertyNamed: 'ControlTipText');
						yourself).
			^ input ].
	(aJinControlGeneric handle propertyNamed: #OLEClass)
		= 'WMEBoutons020000.BoutonLibelle'
		ifTrue: [ | input |
			input := CSNUIButton new.
			input name: aJinControlGeneric nameWithoutSpaces.
			input
				addAttribute:
					(CSNUILabel new
						attributeValue: (aJinControlGeneric handle propertyNamed: 'Name');
						yourself).
			^ input ].
		
	(aJinControlGeneric handle propertyNamed: #OLEClass) = 	'Microsoft Web Browser' ifTrue: [ ^ nil ].
	(aJinControlGeneric handle propertyNamed: #OLEClass)
		= 'ImageComboCtl'
		ifTrue: [ ^ nil ].
	(aJinControlGeneric handle propertyNamed: #OLEClass) = 'TreeCtrl'
		ifTrue: [ ^ nil ].
	(aJinControlGeneric handle propertyNamed: #OLEClass)
		= 'ImageListCtrl'
		ifTrue: [ ^ nil ].
	self halt
]

{ #category : #'visiting - properties' }
CGUIModelStatelessFactory >> visitDatasheetCaption: aJinDatasheetCaption [
	aJinDatasheetCaption value
		ifNotEmpty: [ :val | 
			self halt. 
			^ CSNUILabel new
				attributeValue: val;
				yourself ]
]

{ #category : #visiting }
CGUIModelStatelessFactory >> visitHeight: aMOAttribute value: anInteger [ 

	^ CSNUIAbsoluteHeight new
		attributeValue:  (self toPixelSize: anInteger  value);
		name: #height;
		yourself
]

{ #category : #visiting }
CGUIModelStatelessFactory >> visitImage: aMOAttribute state: aMOObject [

	| input |
	input := CSNUIImage new.
	input name: aMOAttribute name.

	^ input
]

{ #category : #'visit - control' }
CGUIModelStatelessFactory >> visitLabel: aJinControlLabel [
	| input |
	input := CSNUIParagraph new.
	input name: aJinControlLabel nameWithoutSpaces.
	input
		addAttribute:
			(CSNUILabel new
				attributeValue: aJinControlLabel caption;
				yourself).
	^ input
]

{ #category : #visiting }
CGUIModelStatelessFactory >> visitLabel: aMOAttribute state: anUndefinedObject [

	| input |
	input := CSNUIParagraph new.
	input name: aMOAttribute name.
	input addAttribute: (CSNUILabel new
			 attributeValue: (anUndefinedObject
					  ifNotNil: [ :a | a at: #Caption ]
					  ifNil: [ #Unkown ]);
			 yourself).
	^ input
]

{ #category : #visiting }
CGUIModelStatelessFactory >> visitLeft: aMOAttribute value: anInteger [

	^ CGUILeft new
		  attributeValue: (self toPixelSize: anInteger);
		  name: #left;
		  yourself
]

{ #category : #'visit - control' }
CGUIModelStatelessFactory >> visitListBox: aJinControlListBox [
	| input |
	input := CSNUIOrderedList new.
	input name: aJinControlListBox nameWithoutSpaces.
	^ input
]

{ #category : #'visit - control' }
CGUIModelStatelessFactory >> visitPage: aJinControlPage [
	| input |
	input := CSNUITab new.
	input name: aJinControlPage nameWithoutSpaces.
	^ input
]

{ #category : #visiting }
CGUIModelStatelessFactory >> visitPage: aMOAttribute state: aMOObject [

	| input |
	input := CSNUITab new.
	input name: aMOAttribute name.
	^ input
]

{ #category : #'visit - control' }
CGUIModelStatelessFactory >> visitRectangle: aJinControlRectangle [
	| input |
	input := CSNUIPanel new.
	input name: aJinControlRectangle nameWithoutSpaces.
	^ input
]

{ #category : #'visit - control' }
CGUIModelStatelessFactory >> visitSubForm: aJinControlSubForm [
	| input |
	input := CSNUIFieldset new.
	input name: aJinControlSubForm nameWithoutSpaces.
	^ input
]

{ #category : #visiting }
CGUIModelStatelessFactory >> visitSubForm: aMOAttribute state: aMOObject [ 
	| input |
	input := CSNUIFieldset new.
	input name: aMOAttribute name.
	^ input
]

{ #category : #'visit - control' }
CGUIModelStatelessFactory >> visitTabControl: aJinControlTabControl [
	| input |
	input := CSNUITabManager new.
	input name: aJinControlTabControl nameWithoutSpaces.
	^ input
]

{ #category : #visiting }
CGUIModelStatelessFactory >> visitTabControl: aMOAttribute state: aMOObject [

	| input |
	input := CSNUITabManager new.
	input name: aMOAttribute name.
	^ input
]

{ #category : #visiting }
CGUIModelStatelessFactory >> visitTextbox: anAttribute state: aMOObject [

	| input |
	"
	
	(aJinControlTextbox showDatePicker = 1
		ifTrue: [ CSNUIInputDate ]
		ifFalse: [ CSNUIInputText ]) new.
	
	Regardless what the documentation says, this property is not enough to know if we shall or not use a datepicker. 
	It is mostly a mix of this and the data type bounded. (by example a column of a table).
	"
	input := CSNUIInputText new.
	input name: anAttribute name.
	input value: (aMOObject state at: #DefaultValue).
	^ input
]

{ #category : #visiting }
CGUIModelStatelessFactory >> visitTop: aMOAttribute value: anInteger [ 
	^ CGUITop new
		attributeValue: (self toPixelSize: anInteger);
		name:#top;
		yourself
]

{ #category : #'visiting - properties' }
CGUIModelStatelessFactory >> visitVisible: aJinVisible [
	aJinVisible value
		ifTrue: [ ^ self visitAccessProperty: aJinVisible ].
	"^ CSNUIVisibility new
		name: #hidden;
		attributeValue: true;
		yourself"
]

{ #category : #visiting }
CGUIModelStatelessFactory >> visitVisible: aString value: aBoolean [


]

{ #category : #visiting }
CGUIModelStatelessFactory >> visitWidth: aString value: anInteger [ 
^ CSNUIAbsoluteWidth new
		attributeValue: (self toPixelSize: anInteger);
		name: #width;
		yourself
]

{ #category : #'as yet unclassified' }
CGUIModelStatelessFactory >> warn: text [
	Warning signal: text
]

{ #category : #accessing }
CGUIModelStatelessFactory >> width: aJinControlCheckbox [ 
	^ CSNUIAbsoluteWidth new
		attributeValue: aJinControlCheckbox width;
		yourself
]
