Class {
	#name : 'MyPawn',
	#superclass : 'MyPiece',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'accessing' }
MyPawn >> id [

	^ 'P'
]

{ #category : 'testing' }
MyPawn >> isOnInitialRank [

	^ square file = (self isWhite ifTrue: [ $2 ] ifFalse: [ $7 ])
]

{ #category : 'rendering' }
MyPawn >> renderPieceOn: aSquare [ 
	
	^ aSquare renderPawn: self
]

{ #category : 'rendering' }
MyPawn >> targetSquaresLegal: aBoolean [

	| forward squares |
	forward := self isWhite
		           ifTrue: [ square up ]
		           ifFalse: [ square down ].
	squares := OrderedCollection new.
	(forward notNil and: [ forward hasPiece not ]) ifTrue: [
		squares add: forward.
		(self isOnInitialRank and: [ 
			 (self isWhite ifTrue: [ forward up ] ifFalse: [ forward down ]) 
				 ifNotNil: [ :two | two hasPiece not ] ifNil: [ false ] ]) ifTrue: [ 
			squares add: (self isWhite ifTrue: [ forward up ] ifFalse: [ forward down ]) ] ].
	^ squares
]
