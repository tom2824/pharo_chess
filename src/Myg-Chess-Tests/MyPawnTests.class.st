"
I test the moves of the pawns: advancing, the double step, the captures and the en passant capture.
"
Class {
	#name : 'MyPawnTests',
	#superclass : 'TestCase',
	#instVars : [
		'board'
	],
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'asserting' }
MyPawnTests >> assertSquares: squares areNamed: names [

	self
		assertCollection: (squares collect: #name) asSet
		hasSameElements: names asSet
]

{ #category : 'running' }
MyPawnTests >> setUp [

	super setUp.
	board := MyChessBoard empty
]

{ #category : 'tests - advance' }
MyPawnTests >> testBlackPawnAdvancesDown [

	| pawn |
	board at: 'e7' put: (pawn := MyPawn black).

	self assertSquares: pawn legalTargetSquares areNamed: #( 'e6' 'e5' )
]

{ #category : 'tests - capture' }
MyPawnTests >> testBlackPawnCapturesDiagonally [

	| pawn |
	board at: 'e5' put: (pawn := MyPawn black).
	board at: 'd4' put: MyRook white.
	board at: 'f4' put: MyRook white.

	self
		assertSquares: pawn legalTargetSquares
		areNamed: #( 'e4' 'd4' 'f4' )
]

{ #category : 'tests - capture' }
MyPawnTests >> testCannotCaptureAnEmptyDiagonal [

	| pawn |
	board at: 'e4' put: (pawn := MyPawn white).

	self assertSquares: pawn legalTargetSquares areNamed: #( 'e5' )
]

{ #category : 'tests - capture' }
MyPawnTests >> testCannotCaptureAPieceOfTheSameColor [

	| pawn |
	board at: 'e4' put: (pawn := MyPawn white).
	board at: 'd5' put: MyRook white.
	board at: 'f5' put: MyRook white.

	self assertSquares: pawn legalTargetSquares areNamed: #( 'e5' )
]

{ #category : 'tests - capture' }
MyPawnTests >> testCannotCaptureStraightAhead [

	| pawn |
	board at: 'e4' put: (pawn := MyPawn white).
	board at: 'e5' put: MyRook black.

	self assert: pawn legalTargetSquares isEmpty
]

{ #category : 'tests - capture' }
MyPawnTests >> testCaptureOnTheBorderOnlyHasOneDiagonal [

	| pawn |
	board at: 'a4' put: (pawn := MyPawn white).
	board at: 'b5' put: MyRook black.

	self assertSquares: pawn legalTargetSquares areNamed: #( 'a5' 'b5' )
]

{ #category : 'tests - advance' }
MyPawnTests >> testDoubleStepIsBlockedByAPieceOnTheSecondSquare [

	| pawn |
	board at: 'e2' put: (pawn := MyPawn white).
	board at: 'e4' put: MyRook black.

	self assertSquares: pawn legalTargetSquares areNamed: #( 'e3' )
]

{ #category : 'tests - advance' }
MyPawnTests >> testDoubleStepIsBlockedByAPieceRightAhead [

	| pawn |
	board at: 'e2' put: (pawn := MyPawn white).
	board at: 'e3' put: MyRook black.

	self assert: pawn legalTargetSquares isEmpty
]

{ #category : 'tests - en passant' }
MyPawnTests >> testEnPassantCaptureRemovesTheCapturedPawn [

	| white black |
	board at: 'd5' put: (white := MyPawn white).
	board at: 'e7' put: (black := MyPawn black).

	black moveTo: (board at: 'e5').
	white moveTo: (board at: 'e6').

	self assert: (board at: 'e6') contents equals: white.
	self deny: (board at: 'e5') hasPiece.
	self deny: (board at: 'd5') hasPiece
]

{ #category : 'tests - en passant' }
MyPawnTests >> testEnPassantIsAvailableAfterADoubleStep [

	| white black |
	board at: 'd5' put: (white := MyPawn white).
	board at: 'e7' put: (black := MyPawn black).

	black moveTo: (board at: 'e5').

	self
		assertSquares: white legalTargetSquares
		areNamed: #( 'd6' 'e6' )
]

{ #category : 'tests - en passant' }
MyPawnTests >> testEnPassantIsNotAvailableAfterASingleStep [

	| white black |
	board at: 'd5' put: (white := MyPawn white).
	board at: 'e6' put: (black := MyPawn black).

	black moveTo: (board at: 'e5').

	self assertSquares: white legalTargetSquares areNamed: #( 'd6' )
]

{ #category : 'tests - en passant' }
MyPawnTests >> testEnPassantIsOnlyAvailableRightAfterTheDoubleStep [

	| white black rook |
	board at: 'd5' put: (white := MyPawn white).
	board at: 'e7' put: (black := MyPawn black).
	board at: 'a1' put: (rook := MyRook white).

	black moveTo: (board at: 'e5').
	rook moveTo: (board at: 'a2').

	self assertSquares: white legalTargetSquares areNamed: #( 'd6' )
]

{ #category : 'tests - en passant' }
MyPawnTests >> testNormalCaptureStillRemovesOnlyTheTarget [

	| white |
	board at: 'd5' put: (white := MyPawn white).
	board at: 'e6' put: MyRook black.
	board at: 'e5' put: MyRook black.

	white moveTo: (board at: 'e6').

	self assert: (board at: 'e6') contents equals: white.
	self assert: (board at: 'e5') hasPiece
]

{ #category : 'tests - advance' }
MyPawnTests >> testPawnAtTheEndOfTheBoardHasNoMove [

	| pawn |
	board at: 'e8' put: (pawn := MyPawn white).

	self assert: pawn legalTargetSquares isEmpty
]

{ #category : 'tests - advance' }
MyPawnTests >> testPawnAttacksItsEmptyDiagonals [

	| pawn king |
	board at: 'e4' put: (pawn := MyPawn white).
	board at: 'd5' put: (king := MyKing black).

	self assertSquares: pawn attackingSquares areNamed: #( 'd5' 'f5' ).
	self assert: king isInCheck
]

{ #category : 'tests - advance' }
MyPawnTests >> testPawnDoesNotAttackStraightAhead [

	| pawn king |
	board at: 'e4' put: (pawn := MyPawn white).
	board at: 'e5' put: (king := MyKing black).

	self deny: king isInCheck
]

{ #category : 'tests - advance' }
MyPawnTests >> testPawnMovesOneSquareAfterItsFirstMove [

	| pawn |
	board at: 'e2' put: (pawn := MyPawn white).

	pawn moveTo: (board at: 'e3').

	self assertSquares: pawn legalTargetSquares areNamed: #( 'e4' )
]

{ #category : 'tests - advance' }
MyPawnTests >> testWhitePawnAdvancesOneOrTwoSquaresOnItsFirstMove [

	| pawn |
	board at: 'e2' put: (pawn := MyPawn white).

	self assertSquares: pawn legalTargetSquares areNamed: #( 'e3' 'e4' )
]

{ #category : 'tests - capture' }
MyPawnTests >> testWhitePawnCapturesDiagonally [

	| pawn |
	board at: 'e4' put: (pawn := MyPawn white).
	board at: 'd5' put: MyRook black.
	board at: 'f5' put: MyRook black.

	self
		assertSquares: pawn legalTargetSquares
		areNamed: #( 'e5' 'd5' 'f5' )
]
