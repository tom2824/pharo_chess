Class {
	#name : 'MyEnPassantTests',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyEnPassantTests >> testBoardHasNoEnPassantSquareInitially [

	| board |
	board := MyChessBoard empty.

	self assert: board enPassantSquare isNil
]

{ #category : 'tests' }
MyEnPassantTests >> testCannotCaptureEnPassantFromFarAway [

	| board white black |
	board := MyChessBoard empty.
	board at: 'a5' put: (white := MyPawn white).
	board at: 'd7' put: (black := MyPawn black).

	black moveTo: (board at: 'd5').

	self deny: (white targetSquares includes: (board at: 'd6'))
]

{ #category : 'tests' }
MyEnPassantTests >> testCannotCaptureEnPassantOneMoveLater [

	| board white black rook |
	board := MyChessBoard empty.
	board at: 'e5' put: (white := MyPawn white).
	board at: 'd7' put: (black := MyPawn black).
	board at: 'a1' put: (rook := MyRook white).

	black moveTo: (board at: 'd5').
	rook moveTo: (board at: 'a2').

	self deny: (white targetSquares includes: (board at: 'd6'))
]

{ #category : 'tests' }
MyEnPassantTests >> testDoubleStepSetsEnPassantSquare [

	| board pawn |
	board := MyChessBoard empty.
	board at: 'e2' put: (pawn := MyPawn white).

	pawn moveTo: (board at: 'e4').

	self assert: board enPassantSquare equals: (board at: 'e3')
]

{ #category : 'tests' }
MyEnPassantTests >> testEnPassantCaptureClearsEnPassantSquare [

	| board white black |
	board := MyChessBoard empty.
	board at: 'e5' put: (white := MyPawn white).
	board at: 'd7' put: (black := MyPawn black).

	black moveTo: (board at: 'd5').
	white moveTo: (board at: 'd6').

	self assert: board enPassantSquare isNil
]

{ #category : 'tests' }
MyEnPassantTests >> testEnPassantCaptureRemovesCapturedPawn [

	| board white black |
	board := MyChessBoard empty.
	board at: 'e5' put: (white := MyPawn white).
	board at: 'd7' put: (black := MyPawn black).

	black moveTo: (board at: 'd5').
	white moveTo: (board at: 'd6').

	self assert: (board at: 'd6') contents equals: white.
	self deny: (board at: 'd5') hasPiece
]

{ #category : 'tests' }
MyEnPassantTests >> testEnPassantSquareCanBeSet [

	| board |
	board := MyChessBoard empty.
	board enPassantSquare: (board at: 'e3').

	self assert: board enPassantSquare equals: (board at: 'e3')
]

{ #category : 'tests' }
MyEnPassantTests >> testNormalPawnMoveDoesNotRemoveNeighbourPawn [

	| board white black |
	board := MyChessBoard empty.
	board at: 'e4' put: (white := MyPawn white).
	board at: 'd5' put: (black := MyPawn black).

	white moveTo: (board at: 'e5').

	self assert: (board at: 'd5') contents equals: black
]

{ #category : 'tests' }
MyEnPassantTests >> testOtherPieceMoveClearsEnPassantSquare [

	| board rook |
	board := MyChessBoard empty.
	board at: 'a1' put: (rook := MyRook white).
	board enPassantSquare: (board at: 'e3').

	rook moveTo: (board at: 'a4').

	self assert: board enPassantSquare isNil
]

{ #category : 'tests' }
MyEnPassantTests >> testPawnCannotCaptureOwnEnPassantSquare [

	| board mover neighbour |
	board := MyChessBoard empty.
	board at: 'd2' put: (mover := MyPawn white).
	board at: 'e2' put: (neighbour := MyPawn white).

	mover moveTo: (board at: 'd4').

	self deny: (neighbour targetSquares includes: (board at: 'd3'))
]

{ #category : 'tests' }
MyEnPassantTests >> testSingleStepClearsEnPassantSquare [

	| board pawn |
	board := MyChessBoard empty.
	board at: 'e2' put: (pawn := MyPawn white).
	board enPassantSquare: (board at: 'a6').

	pawn moveTo: (board at: 'e3').

	self assert: board enPassantSquare isNil
]

{ #category : 'tests' }
MyEnPassantTests >> testWhitePawnCanCaptureEnPassantRightAfterDoubleStep [

	| board white black |
	board := MyChessBoard empty.
	board at: 'e5' put: (white := MyPawn white).
	board at: 'd7' put: (black := MyPawn black).

	black moveTo: (board at: 'd5').

	self assert: (white targetSquares includes: (board at: 'd6'))
]
