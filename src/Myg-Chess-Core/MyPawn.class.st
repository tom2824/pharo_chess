Class {
	#name : 'MyPawn',
	#superclass : 'MyPiece',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'path commands' }
MyPawn >> afterMoveFrom: origin [

	| skipped |
	skipped := self forwardFrom: origin.
	self board enPassantSquare:
		((self forwardFrom: skipped) = square
			 ifTrue: [ skipped ]
			 ifFalse: [ nil ])
]

{ #category : 'rendering' }
MyPawn >> attackingSquares [

	^ self diagonalSquares
]

{ #category : 'rendering' }
MyPawn >> captureSquares [

	^ self diagonalSquares select: [ :aSquare |
		  aSquare hasPiece and: [ aSquare contents color ~= color ] ]
]

{ #category : 'rendering' }
MyPawn >> diagonalSquares [

	| ahead |
	ahead := self forwardFrom: square.
	ahead ifNil: [ ^ #(  ) ].
	^ { ahead left. ahead right } select: [ :aSquare | aSquare notNil ]
]

{ #category : 'rendering' }
MyPawn >> forwardFrom: aSquare [

	^ self isWhite
		  ifTrue: [ aSquare up ]
		  ifFalse: [ aSquare down ]
]

{ #category : 'rendering' }
MyPawn >> forwardSquares [

	| oneStep twoSteps |
	oneStep := self forwardFrom: square.
	(oneStep notNil and: [ oneStep hasPiece not ]) ifFalse: [ ^ #(  ) ].

	twoSteps := self forwardFrom: oneStep.
	^ (self isOnInitialRank and: [
		   twoSteps notNil and: [ twoSteps hasPiece not ] ])
		  ifTrue: [ { oneStep. twoSteps } ]
		  ifFalse: [ { oneStep } ]
]

{ #category : 'accessing' }
MyPawn >> id [

	^ 'P'
]

{ #category : 'testing' }
MyPawn >> isOnInitialRank [

	^ square file = (self isWhite
		   ifTrue: [ $2 ]
		   ifFalse: [ $7 ])
]

{ #category : 'rendering' }
MyPawn >> renderPieceOn: aSquare [ 
	
	^ aSquare renderPawn: self
]

{ #category : 'rendering' }
MyPawn >> targetSquaresLegal: aBoolean [

	^ self forwardSquares , self captureSquares
]
