Class {
	#name : #CGUIModelAbstractStatelessFactory,
	#superclass : #Object,
	#category : #'CasinoGlue-GlueAPI'
}

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitAccChild: aMOAttribute value: anUndefinedObject [

	self assert: anUndefinedObject isNil
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitAccDefaultAction: aMOAttribute value: anUndefinedObject [

	self assert: anUndefinedObject isNil
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitAccHelp: aMOAttribute value: anUndefinedObject [

	self assert: anUndefinedObject isNil
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitAccHelpTopic: aMOAttribute value: anUndefinedObject [

	self assert: anUndefinedObject isNil
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitAccParent: aMOAttribute value: anUndefinedObject [

	self assert: anUndefinedObject isNil
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitAccRole: aMOAttribute value: anUndefinedObject [

	self assert: anUndefinedObject isEmptyOrNil
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitAccState: aMOAttribute value: anUndefinedObject [ 
	self assert: anUndefinedObject isNil
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitAccValue: aMOAttribute value: anUndefinedObject [ 
 self assert: anUndefinedObject  isEmptyOrNil 
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitAddColon: aString value: anUndefinedObject [

	self assert: anUndefinedObject isEmptyOrNil
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitAfterUpdate: aString value: aString2 [


]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitAfterUpdateMacro: aString value: aString2 [


]

{ #category : #'as yet unclassified' }
CGUIModelAbstractStatelessFactory >> visitAlignment: anAttributeName value: aValue [ 
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitAllowAutoCorrect: aString value: aBoolean [

	self assert: aBoolean
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitAllowValueListEdits: aString value: aBoolean [ 

]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitAsianLineBreak: aString value: aBoolean [

	self assert: aBoolean
]

{ #category : #'as yet unclassified' }
CGUIModelAbstractStatelessFactory >> visitAttachmentCount: anAttributeName value: aValue [ 
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitAutoExpand: aString value: aBoolean [ 

]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitAutoLabel: aString value: anUndefinedObject [ 
	self assert: anUndefinedObject isEmptyOrNil
]

{ #category : #'as yet unclassified' }
CGUIModelAbstractStatelessFactory >> visitAutoRepeat: anAttributeName value: aValue [ 
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitAutoTab: aString value: aBoolean [

	self assert: aBoolean not
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitBackColor: aString value: anInteger [

	self assert: anInteger = 16777215
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitBackShade: aString value: aNumber [ 
	self assert: aNumber = 100
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitBackStyle: aString value: anInteger [


]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitBackThemeColorIndex: aString value: anInteger [

	self assert: anInteger = -1
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitBackTint: aMOAttribute value: aNumber [ 
	self assert: aNumber = 100
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitBeforeUpdate: aString value: aString2 [

	self assert: aString2 isEmptyOrNil
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitBeforeUpdateMacro: aString value: aString2 [

	self assert: aString2 isEmptyOrNil
]

{ #category : #'as yet unclassified' }
CGUIModelAbstractStatelessFactory >> visitBevel: anAttributeName value: aValue [ 
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitBorderColor: aString value: anInteger [ 


]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitBorderLineStyle: aMOAttribute value: anUndefinedObject [

	self assert: anUndefinedObject isEmptyOrNil
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitBorderShade: aMOAttribute value: aNumber [ 
	self assert: aNumber = 100
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitBorderStyle: aString value: anInteger [


]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitBorderThemeColorIndex: aString value: anInteger [ 
		self assert: anInteger = -1 
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitBorderTint: aMOAttribute value: aNumber [ 

]

{ #category : #'not -yet -implemented' }
CGUIModelAbstractStatelessFactory >> visitBorderWidth: aJinBorderWidth [ 
]

{ #category : #'\\' }
CGUIModelAbstractStatelessFactory >> visitBorderWidth: aString value: anInteger [

	self assert: anInteger = 0
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitBottomMargin: aString value: anInteger [ 

]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitBottomPadding: aMOAttribute value: anInteger [ 
	
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitBoundColumn: aString value: anInteger [ 

]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitCanGrow: aString value: aBoolean [ 

]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitCanShrink: aString value: aBoolean [

	self assert: aBoolean not
]

{ #category : #'as yet unclassified' }
CGUIModelAbstractStatelessFactory >> visitCancel: anAttributeName value: aValue [ 
]

{ #category : #'as yet unclassified' }
CGUIModelAbstractStatelessFactory >> visitCaption: anAttributeName value: aValue [ 
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitColumn: aString value: anUndefinedObject [ 

]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitColumnCount: aString value: anInteger [ 

]

{ #category : #'as yet unclassified' }
CGUIModelAbstractStatelessFactory >> visitColumnHeads: anAttributeName value: aValue [ 
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitColumnHidden: aString value: aBoolean [

	self assert: aBoolean not
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitColumnOrder: aMOAttribute value: anInteger [

	self assert: anInteger = 0
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitColumnWidth: aString value: anInteger [ 
	self assert:anInteger = -1 .
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitColumnWidths: aString value: aString2 [ 

]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitControlSource: aMOAttribute value: aString [ 

]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitControlTipText: aMOAttribute value: aString [

	self assert: aString isEmpty
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitControlType: aMOAttribute value: anInteger [

	
]

{ #category : #'as yet unclassified' }
CGUIModelAbstractStatelessFactory >> visitCurrentAttachment: anAttributeName value: aValue [ 
]

{ #category : #'as yet unclassified' }
CGUIModelAbstractStatelessFactory >> visitCursorOnHover: anAttributeName value: aValue [ 
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitDecimalPlaces: aString value: anInteger [ 
	self assert: anInteger = 255
]

{ #category : #'as yet unclassified' }
CGUIModelAbstractStatelessFactory >> visitDefault: anAttributeName value: aValue [ 
]

{ #category : #'as yet unclassified' }
CGUIModelAbstractStatelessFactory >> visitDefaultPicture: anAttributeName value: aValue [ 
]

{ #category : #'as yet unclassified' }
CGUIModelAbstractStatelessFactory >> visitDefaultPictureType: anAttributeName value: aValue [ 
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitDefaultValue: aMOAttribute value: aString [

	self assert: aString isEmpty
]

{ #category : #'as yet unclassified' }
CGUIModelAbstractStatelessFactory >> visitDisplayAs: anAttributeName value: aValue [ 
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitDisplayAsHyperlink: aString value: anInteger [

	self assert: anInteger = 0
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitDisplayWhen: aMOAttribute value: anInteger [

	self assert: anInteger = 0
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitEnabled: aMOAttribute value: aBoolean [


]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitEnterKeyBehavior: aString value: aBoolean [ 

]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitEventProcPrefix: aString value: aString2 [ 

]

{ #category : #'as yet unclassified' }
CGUIModelAbstractStatelessFactory >> visitFileName: anAttributeName value: aValue [ 
]

{ #category : #'as yet unclassified' }
CGUIModelAbstractStatelessFactory >> visitFileType: anAttributeName value: aValue [ 
]

{ #category : #'as yet unclassified' }
CGUIModelAbstractStatelessFactory >> visitFileURL: anAttributeName value: aValue [ 
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitFilterLookup: aString value: anInteger [ 

]

{ #category : #'as yet unclassified' }
CGUIModelAbstractStatelessFactory >> visitFilterOnEmptyMaster: anAttributeName value: aValue [ 
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitFontBold: aString value: anInteger [


]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitFontItalic: aString value: aBoolean [

	self assert: aBoolean not
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitFontName: aString value: aString2 [ 

]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitFontSize: aMOAttribute value: anInteger [

]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitFontUnderline: aString value: aBoolean [ 

]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitFontWeight: aString value: anInteger [ 

]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitForeColor: aMOAttribute value: anInteger [ 

]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitForeShade: aString value: aNumber [ 
		self assert: aNumber = 100
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitForeThemeColorIndex: aString value: anInteger [

	self assert: anInteger = -1
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitForeTint: aString value: aNumber [

	self assert: aNumber = 100
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitFormat: anAttributeName value: aString [

	self assert: aString isEmptyOrNil
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitFuriganaControl: aString value: aString2 [ 
	self assert: aString2 isEmptyOrNil
]

{ #category : #'as yet unclassified' }
CGUIModelAbstractStatelessFactory >> visitGlow: anAttributeName value: aValue [ 
]

{ #category : #'as yet unclassified' }
CGUIModelAbstractStatelessFactory >> visitGradient: anAttributeName value: aValue [ 
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitGridlineColor: aString value: anInteger [ 

]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitGridlineShade: aMOAttribute value: aNumber [

	self assert: aNumber = 100
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitGridlineStyleBottom: aMOAttribute value: anInteger [

	self assert: anInteger = 0
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitGridlineStyleLeft: aString value: anInteger [ 
		self assert: anInteger = 0
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitGridlineStyleRight: aString value: anInteger [

	self assert: anInteger = 0
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitGridlineStyleTop: aString value: anInteger [

	self assert: anInteger = 0
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitGridlineThemeColorIndex: aString value: anInteger [

	self assert: anInteger = -1
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitGridlineTint: aMOAttribute value: aNumber [ 
 self assert: aNumber = 100
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitGridlineWidthBottom: aString value: anInteger [

	self assert: anInteger = 1
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitGridlineWidthLeft: aMOAttribute value: anInteger [ 
	self assert: anInteger = 1
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitGridlineWidthRight: aString value: anInteger [

	self assert: anInteger = 1
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitGridlineWidthTop: aString value: anInteger [ 

]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitHelpContextId: aString value: anInteger [

	self assert: anInteger = 0
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitHideDuplicates: aMOAttribute value: anUndefinedObject [

	self assert: anUndefinedObject isNil
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitHorizontalAnchor: aString value: anInteger [ 

]

{ #category : #'as yet unclassified' }
CGUIModelAbstractStatelessFactory >> visitHoverColor: anAttributeName value: aValue [ 
]

{ #category : #'as yet unclassified' }
CGUIModelAbstractStatelessFactory >> visitHoverForeColor: anAttributeName value: aValue [ 
]

{ #category : #'as yet unclassified' }
CGUIModelAbstractStatelessFactory >> visitHoverForeShade: anAttributeName value: aValue [ 
]

{ #category : #'as yet unclassified' }
CGUIModelAbstractStatelessFactory >> visitHoverForeThemeColorIndex: anAttributeName value: aValue [ 
]

{ #category : #'as yet unclassified' }
CGUIModelAbstractStatelessFactory >> visitHoverForeTint: anAttributeName value: aValue [ 
]

{ #category : #'as yet unclassified' }
CGUIModelAbstractStatelessFactory >> visitHoverShade: anAttributeName value: aValue [ 
]

{ #category : #'as yet unclassified' }
CGUIModelAbstractStatelessFactory >> visitHoverThemeColorIndex: anAttributeName value: aValue [ 
]

{ #category : #'as yet unclassified' }
CGUIModelAbstractStatelessFactory >> visitHoverTint: anAttributeName value: aValue [ 
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitHyperlink: aMOAttribute value: anUndefinedObject [ 
	self assert: anUndefinedObject isNil
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitHyperlinkAddress: aString value:aString2 [ 
	self assert: aString2 isEmptyOrNil 
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitHyperlinkSubAddress: aString value: aString2 [ 
	self assert: aString2 isEmptyOrNil 
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitIMEHold: aMOAttribute value: aBoolean [

	self assert: aBoolean not
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitIMEMode: aMOAttribute value: anInteger [


]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitIMESentenceMode: aString value: anInteger [


]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitImageHeight: aString value: anInteger [ 

]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitImageWidth: aString value: anInteger [ 

]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitInSelection: aMOAttribute value: aBoolean [

	self assert: aBoolean not
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitInheritValueList: aString value: aBoolean [ 

]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitInputMask: aMOAttribute value: aString [

	self assert: aString isEmpty
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitIsHyperlink: aString value: aBoolean [


]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitIsVisible: aMOAttribute value: anUndefinedObject [

	self assert: anUndefinedObject isEmptyOrNil
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitItemData: aString value: anUndefinedObject [ 

]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitItemsSelected: aString value: anUndefinedObject [ 

]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitKeyboardLanguage: aMOAttribute value: anInteger [

	self assert: anInteger = 0
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitLabelAlign: aMOAttribute value: anUndefinedObject [

	self assert: anUndefinedObject isNil
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitLabelX: aString value: anUndefinedObject [ 
	self assert: anUndefinedObject isEmptyOrNil
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitLabelY: aString value: anUndefinedObject [ 
	 self assert: anUndefinedObject isEmptyOrNil 
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitLayout: aMOAttribute value: anUndefinedObject [ 

]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitLayoutID: aString value: anInteger [ 

]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitLayoutName: aString value: aString2 [ 
	
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitLeftMargin: aString value: anInteger [ 

]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitLeftPadding: aMOAttribute value: anInteger [

]

{ #category : #'as yet unclassified' }
CGUIModelAbstractStatelessFactory >> visitLimitToList: anAttributeName value: aValue [ 
]

{ #category : #'visit - control' }
CGUIModelAbstractStatelessFactory >> visitLine: aJinControlLine [ 
"	self error: 'There is no widget for Line yet. '"
	^ nil
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitLineSpacing: aString value: anInteger [

	self assert: anInteger = 0
]

{ #category : #'as yet unclassified' }
CGUIModelAbstractStatelessFactory >> visitLinkChildFields: anAttributeName value: aValue [ 
]

{ #category : #'as yet unclassified' }
CGUIModelAbstractStatelessFactory >> visitLinkMasterFields: anAttributeName value: aValue [ 
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitListCount: aString value: anUndefinedObject [ 

]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitListIndex: aString value: anUndefinedObject [ 

]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitListItemsEditForm: aString value: aString2 [ 
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitListRows: aString value: anInteger [ 

]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitListWidth: aString value: aString2 [ 

]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitLocked: aMOAttribute value: aBoolean [

]

{ #category : #'as yet unclassified' }
CGUIModelAbstractStatelessFactory >> visitMultiRow: anAttributeName value: aValue [ 
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitName: aString value: aString2 [ 
	
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitNumeralShapes: aMOAttribute value: anInteger [ 

]

{ #category : #asd }
CGUIModelAbstractStatelessFactory >> visitObjectPalette: aString value:aString2 [ 
	self assert: aString2 isEmptyOrNil 
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitOldBorderStyle: aString value: anInteger [


]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitOldValue: aString value: anUndefinedObject [ 
	self assert: anUndefinedObject isEmptyOrNil
]

{ #category : #'as yet unclassified' }
CGUIModelAbstractStatelessFactory >> visitOnAttachmentCurrent: anAttributeName value: aValue [ 
]

{ #category : #'as yet unclassified' }
CGUIModelAbstractStatelessFactory >> visitOnAttachmentCurrentMacro: anAttributeName value: aValue [ 
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitOnChange: aString value: aString2 [

	self assert: aString2 isEmptyOrNil
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitOnChangeMacro: aMOAttribute value: aString [ 
	self assert: aString isEmpty 
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitOnClick: aMOAttribute value: aString [ 

]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitOnClickMacro: aString value: aString2 [


]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitOnDblClick: aString value: aString2 [


]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitOnDblClickMacro: aString value: aString2 [


]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitOnDirty: aString value: aString2 [ 
	self assert: aString2 isEmptyOrNil
]

{ #category : #'as yet unclassified' }
CGUIModelAbstractStatelessFactory >> visitOnDirtyMacro: anAttributeName value: aValue [ 
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitOnEnter: aMOAttribute value: aString [

	self assert: aString isEmpty
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitOnEnterMacro: aString value: aString2 [ 
	 self assert: aString2 isEmptyOrNil 
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitOnExit: aMOAttribute value: aString [

	self assert: aString isEmptyOrNil
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitOnExitMacro: aString value: aString2 [

	self assert: aString2 isEmptyOrNil
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitOnGotFocus: aString value: aString2 [ 

]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitOnGotFocusMacro: aMOAttribute value: aString [


]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitOnKeyDown: aString value: aString2 [

	self assert: aString2 isEmptyOrNil
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitOnKeyDownMacro: aMOAttribute value: aString [ 
 self assert: aString isEmptyOrNil 
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitOnKeyPress: aString value: aString2 [

	self assert: aString2 isEmptyOrNil
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitOnKeyPressMacro: aMOAttribute value: aString [

	self assert: aString isEmpty
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitOnKeyUp: aString value: aString2 [ 
	self assert: aString2 isEmptyOrNil
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitOnKeyUpMacro: aString value: aString2 [ 
	 self assert: aString2 isEmptyOrNil 
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitOnLostFocus: aString value: aString2 [

	self assert: aString2 isEmptyOrNil
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitOnLostFocusMacro: aString value: aString2 [ 
	self assert: aString2 isEmptyOrNil
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitOnMouseDown: aString value: aString2 [ 
	self assert: aString2 isEmptyOrNil
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitOnMouseDownMacro: aString value: aString2 [

	self assert: aString2 isEmptyOrNil
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitOnMouseMove: aMOAttribute value: aString [ 
	 self assert: aString isEmptyOrNil 
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitOnMouseMoveMacro: aString value: aString2 [

	self assert: aString2 isEmptyOrNil
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitOnMouseUp: aString value:aString2 [ 
	self assert: aString2 isEmptyOrNil 
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitOnMouseUpMacro: aMOAttribute value: aString [ 
	self assert: aString isEmpty
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitOnNotInList: aString value: aString2 [ 

]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitOnNotInListMacro: aString value: aString2 [ 

]

{ #category : #'as yet unclassified' }
CGUIModelAbstractStatelessFactory >> visitOnPush: anAttributeName value: aValue [ 
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitOnUndo: aString value: aString2 [

	self assert: aString2 isEmptyOrNil
]

{ #category : #'as yet unclassified' }
CGUIModelAbstractStatelessFactory >> visitPageIndex: anAttributeName value: aValue [ 
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitPicture: aString value: aString2 [ 

]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitPictureAlignment: aString value: anInteger [ 

]

{ #category : #'as yet unclassified' }
CGUIModelAbstractStatelessFactory >> visitPictureCaptionArrangement: anAttributeName value: aValue [ 
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitPictureData: aString value: aString2 [ 
	self assert: aString2 isEmptyOrNil 
]

{ #category : #'as yet unclassified' }
CGUIModelAbstractStatelessFactory >> visitPictureSizeMode: anAttributeName value: aValue [ 
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitPictureTiling: aString value: aBoolean [ 

]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitPictureType: aString value: anInteger [ 

]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitPostalAddress: aString value: anUndefinedObject [ 
	self assert: anUndefinedObject isEmptyOrNil 
]

{ #category : #'as yet unclassified' }
CGUIModelAbstractStatelessFactory >> visitPressedColor: anAttributeName value: aValue [ 
]

{ #category : #'as yet unclassified' }
CGUIModelAbstractStatelessFactory >> visitPressedForeColor: anAttributeName value: aValue [ 
]

{ #category : #'as yet unclassified' }
CGUIModelAbstractStatelessFactory >> visitPressedForeShade: anAttributeName value: aValue [ 
]

{ #category : #'as yet unclassified' }
CGUIModelAbstractStatelessFactory >> visitPressedForeThemeColorIndex: anAttributeName value: aValue [ 
]

{ #category : #'as yet unclassified' }
CGUIModelAbstractStatelessFactory >> visitPressedForeTint: anAttributeName value: aValue [ 
]

{ #category : #'as yet unclassified' }
CGUIModelAbstractStatelessFactory >> visitPressedShade: anAttributeName value: aValue [ 
]

{ #category : #'as yet unclassified' }
CGUIModelAbstractStatelessFactory >> visitPressedThemeColorIndex: anAttributeName value: aValue [ 
]

{ #category : #'as yet unclassified' }
CGUIModelAbstractStatelessFactory >> visitPressedTint: anAttributeName value: aValue [ 
]

{ #category : #'as yet unclassified' }
CGUIModelAbstractStatelessFactory >> visitQuickStyle: anAttributeName value: aValue [ 
]

{ #category : #'as yet unclassified' }
CGUIModelAbstractStatelessFactory >> visitQuickStyleMask: anAttributeName value: aValue [ 
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitReadingOrder: aString value: anInteger [

	self assert: anInteger = 0
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitRecordset: aString value: anUndefinedObject [ 

]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitRightMargin: aMOAttribute value: anInteger [


]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitRightPadding: aMOAttribute value: anInteger [


]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitRowSource: aString value: aString2 [ 

]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitRowSourceType: aString value: aString2 [ 

]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitRunningSum: aString value: anUndefinedObject [

	self assert: anUndefinedObject isEmptyOrNil
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitScrollBarAlign: aMOAttribute value: anInteger [

	self assert: anInteger = 0
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitScrollBars: aMOAttribute value: anInteger [


]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitSection: aString value: anInteger [


]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitSelLength: aString value: anUndefinedObject [

	self assert: anUndefinedObject isEmptyOrNil
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitSelStart: aString value: anUndefinedObject [

	self assert: anUndefinedObject isEmptyOrNil
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitSelText: aMOAttribute value: anUndefinedObject [

	self assert: anUndefinedObject isEmptyOrNil
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitSelected: aString value: anUndefinedObject [ 

]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitSeparatorCharacters: aString value: anInteger [ 

]

{ #category : #'as yet unclassified' }
CGUIModelAbstractStatelessFactory >> visitShadow: anAttributeName value: aValue [ 
]

{ #category : #'as yet unclassified' }
CGUIModelAbstractStatelessFactory >> visitShape: anAttributeName value: aValue [ 
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitShortcutMenuBar: aString value: aString2 [

	self assert: aString2 isEmptyOrNil
]

{ #category : #'not -yet -implemented' }
CGUIModelAbstractStatelessFactory >> visitShowDatePicker: aJinShowDatePicker [ 
	" this property is used during the building of the text box. nothing to do here "

]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitShowDatePicker: aMOAttribute value: anInteger [ 
	" this property is used during the building of the text box. nothing to do here "
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitShowOnlyRowSourceValues: aString value: aBoolean [ 

]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitSizeMode: aString value: anInteger [ 

]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitSmartTags: aString value: anUndefinedObject [

	self assert: anUndefinedObject isEmptyOrNil
]

{ #category : #'as yet unclassified' }
CGUIModelAbstractStatelessFactory >> visitSoftEdges: anAttributeName value: aValue [ 
]

{ #category : #'as yet unclassified' }
CGUIModelAbstractStatelessFactory >> visitSourceObject: anAttributeName value: aValue [ 
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitSpecialEffect: aMOAttribute value: anInteger [

	self assert: anInteger = 0
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitStatusBarText: aString value: aString2 [ 
	self assert: aString2 isEmptyOrNil
]

{ #category : #'as yet unclassified' }
CGUIModelAbstractStatelessFactory >> visitStyle: anAttributeName value: aValue [ 
]

{ #category : #'as yet unclassified' }
CGUIModelAbstractStatelessFactory >> visitTabFixedHeight: anAttributeName value: aValue [ 
]

{ #category : #'as yet unclassified' }
CGUIModelAbstractStatelessFactory >> visitTabFixedWidth: anAttributeName value: aValue [ 
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitTabIndex: aString value: anInteger [ 

]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitTabStop: aString value: aBoolean [


]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitTag: aString value: aString2 [ 

]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitText: aMOAttribute value: anUndefinedObject [

	self assert: anUndefinedObject isEmptyOrNil
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitTextAlign: aString value: anInteger [ 

]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitTextAlignGeneral: aMOAttribute value: anUndefinedObject [ 
 self assert: anUndefinedObject isEmptyOrNil 
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitTextFormat: aString value: anInteger [


]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitThemeFontIndex: aString value: anInteger [

	self assert: anInteger = -1
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitTopMargin: aMOAttribute value: anInteger [


]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitTopPadding: aString value: anInteger [ 
	
]

{ #category : #'as yet unclassified' }
CGUIModelAbstractStatelessFactory >> visitTransparent: anAttributeName value: aValue [ 
]

{ #category : #'as yet unclassified' }
CGUIModelAbstractStatelessFactory >> visitUseTheme: anAttributeName value: aValue [ 
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitValidationRule: aString value: aString2 [

	self assert: aString2 isEmptyOrNil
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitValidationText: aMOAttribute value: aString [ 
		self assert: aString isEmpty 
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitValue: aMOAttribute value: anUndefinedObject [


]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitVertical: aMOAttribute value: aBoolean [ 
	self assert: aBoolean not 
]

{ #category : #visiting }
CGUIModelAbstractStatelessFactory >> visitVerticalAnchor: aString value: anInteger [


]
