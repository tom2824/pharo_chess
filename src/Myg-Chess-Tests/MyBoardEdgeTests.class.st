Class {
	#name : 'MyBoardEdgeTests',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'asserting' }
MyBoardEdgeTests >> assertSquares: squares areNamed: names [

	self
		assertCollection: (squares collect: #name) asSet
		hasSameElements: names asSet
]

{ #category : 'tests' }
MyBoardEdgeTests >> testBishopInCornerSlidesOnlyOnTheBoard [

	| board bishop |
	board := MyChessBoard empty.
	board at: 'a1' put: (bishop := MyBishop white).

	self
		assertSquares: bishop legalTargetSquares
		areNamed: #( 'b2' 'c3' 'd4' 'e5' 'f6' 'g7' 'h8' )
]

{ #category : 'tests' }
MyBoardEdgeTests >> testKingInCornerMovesOnlyOnTheBoard [

	| board king |
	board := MyChessBoard empty.
	board at: 'a1' put: (king := MyKing white).

	self
		assertSquares: king legalTargetSquares
		areNamed: #( 'a2' 'b2' 'b1' )
]

{ #category : 'tests' }
MyBoardEdgeTests >> testKingOnTheOppositeCornerMovesOnlyOnTheBoard [

	| board king |
	board := MyChessBoard empty.
	board at: 'h8' put: (king := MyKing white).

	self
		assertSquares: king legalTargetSquares
		areNamed: #( 'g8' 'g7' 'h7' )
]

{ #category : 'tests' }
MyBoardEdgeTests >> testKnightInCornerMovesOnlyOnTheBoard [

	| board knight |
	board := MyChessBoard empty.
	board at: 'a1' put: (knight := MyKnight white).

	self assertSquares: knight legalTargetSquares areNamed: #( 'b3' 'c2' )
]

{ #category : 'tests' }
MyBoardEdgeTests >> testKnightOnTheSideMovesOnlyOnTheBoard [

	| board knight |
	board := MyChessBoard empty.
	board at: 'h4' put: (knight := MyKnight white).

	self
		assertSquares: knight legalTargetSquares
		areNamed: #( 'g6' 'g2' 'f5' 'f3' )
]

{ #category : 'tests' }
MyBoardEdgeTests >> testRookInCornerSlidesOnlyOnTheBoard [

	| board rook |
	board := MyChessBoard empty.
	board at: 'h8' put: (rook := MyRook white).

	self assert: rook legalTargetSquares size equals: 14
]

{ #category : 'tests' }
MyBoardEdgeTests >> testRookIsBlockedByAPieceAndCapturesOpponent [

	| board rook |
	board := MyChessBoard empty.
	board at: 'a1' put: (rook := MyRook white).
	board at: 'a3' put: MyPawn black.
	board at: 'c1' put: MyPawn white.

	self
		assertSquares: rook legalTargetSquares
		areNamed: #( 'a2' 'a3' 'b1' )
]
