"
I am a pawn.

I move forward, one square at a time, or two squares on my first move.
I never jump over a piece and I never capture straight ahead: I capture diagonally, including the en passant capture.
"
Class {
	#name : 'MyPawn',
	#superclass : 'MyPiece',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'rendering' }
MyPawn >> blackLetter [
	"The letter drawing a black pawn in the chess font"

	^ 'O'
]

{ #category : 'moves' }
MyPawn >> attackingSquares [
	"A pawn threatens its diagonals, even when they are empty (the king cannot go there). It does not threaten the square in front of it."

	^ self diagonalSquares
]

{ #category : 'moves' }
MyPawn >> backwardOf: aSquare [
	"The square behind aSquare, from my point of view"

	^ self isWhite
		  ifTrue: [ aSquare down ]
		  ifFalse: [ aSquare up ]
]

{ #category : 'moves' }
MyPawn >> canCaptureEnPassantOn: aSquare [
	"I can capture en passant on the square just skipped by an opponent pawn that made its double step on the previous move"

	| capturedSquare |
	aSquare == self board enPassantSquare ifFalse: [ ^ false ].
	capturedSquare := self backwardOf: aSquare.
	^ capturedSquare hasPiece and: [
		  capturedSquare contents color ~= color ]
]

{ #category : 'moves' }
MyPawn >> canCaptureOn: aSquare [
	"Normal capture, or en passant capture"

	^ (aSquare hasPiece and: [ aSquare contents color ~= color ])
	  or: [ self canCaptureEnPassantOn: aSquare ]
]

{ #category : 'moves' }
MyPawn >> captureSquares [
	"The diagonal squares where I can capture"

	^ self diagonalSquares select: [ :each | self canCaptureOn: each ]
]

{ #category : 'moving' }
MyPawn >> captureOn: aSquare [
	"When I capture en passant, the captured pawn is not on the square I go to: remove it"

	(self canCaptureEnPassantOn: aSquare) ifTrue: [
		(self backwardOf: aSquare) emptyContents ]
]

{ #category : 'moves' }
MyPawn >> diagonalSquares [
	"The squares diagonally in front of me, only the ones inside the board"

	| ahead |
	ahead := self forwardOf: square.
	^ { ahead left. ahead right } select: #isOnBoard
]

{ #category : 'moving' }
MyPawn >> enPassantSquareAfterMovingFrom: aSquare to: anotherSquare [
	"After a double step, the opponent can capture me en passant on the square I jumped over"

	| jumpedSquare |
	jumpedSquare := self forwardOf: aSquare.
	^ (self forwardOf: jumpedSquare) == anotherSquare
		  ifTrue: [ jumpedSquare ]
		  ifFalse: [ super enPassantSquareAfterMovingFrom: aSquare to: anotherSquare ]
]

{ #category : 'moves' }
MyPawn >> forwardOf: aSquare [
	"The square in front of aSquare, from my point of view: up the board for white, down for black"

	^ self isWhite
		  ifTrue: [ aSquare up ]
		  ifFalse: [ aSquare down ]
]

{ #category : 'moves' }
MyPawn >> forwardSquares [
	"The squares in front of me where I can go: one square, or two squares from my starting position. I cannot jump over a piece and I cannot capture here."

	| oneStep twoSteps |
	oneStep := self forwardOf: square.
	(oneStep isOnBoard and: [ oneStep hasPiece not ]) ifFalse: [ ^ #() ].
	twoSteps := self forwardOf: oneStep.
	^ (self isOnStartingRank and: [ twoSteps hasPiece not ])
		  ifTrue: [ { oneStep. twoSteps } ]
		  ifFalse: [ { oneStep } ]
]

{ #category : 'accessing' }
MyPawn >> id [

	^ 'P'
]

{ #category : 'testing' }
MyPawn >> isOnStartingRank [
	"White pawns start on the second rank, black pawns on the seventh"

	^ square file = (self isWhite
		   ifTrue: [ $2 ]
		   ifFalse: [ $7 ])
]

{ #category : 'rendering' }
MyPawn >> targetSquaresLegal: aBoolean [

	^ self forwardSquares , self captureSquares
]
