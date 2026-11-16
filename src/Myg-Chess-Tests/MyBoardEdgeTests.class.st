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
MyBoardEdgeTests >> testEmptySquareContentsIsNotNil [

	| board |
	board := MyChessBoard empty.

	self deny: (board at: 'e4') contents isNil
]

{ #category : 'tests' }
MyBoardEdgeTests >> testEmptySquareHasNoPiece [

	| board |
	board := MyChessBoard empty.

	self deny: (board at: 'e4') contents isPiece.
	self deny: (board at: 'e4') hasPiece
]

{ #category : 'tests' }
MyBoardEdgeTests >> testEmptyingASquareRemovesItsPiece [

	| board |
	board := MyChessBoard empty.
	board at: 'e4' put: MyRook white.

	(board at: 'e4') emptyContents.

	self deny: (board at: 'e4') hasPiece.
	self deny: (board at: 'e4') contents isNil
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
MyBoardEdgeTests >> testNilPieceHasNoTarget [

	self assert: MyNilPiece new targetSquares isEmpty.
	self assert: MyNilPiece new legalTargetSquares isEmpty
]

{ #category : 'tests' }
MyBoardEdgeTests >> testNilPieceIsNotAPiece [

	self deny: MyNilPiece new isPiece
]

{ #category : 'tests' }
MyBoardEdgeTests >> testNilSquareStaysOutsideTheBoard [

	| outside |
	outside := MyNilSquare new.

	self deny: outside isOnBoard.
	self deny: outside hasPiece.
	self assert: outside up == outside.
	self assert: outside down == outside.
	self assert: outside left == outside.
	self assert: outside right == outside
]

{ #category : 'tests' }
MyBoardEdgeTests >> testPiecesOfTheBoardAreOnlyRealPieces [

	| board rook king |
	board := MyChessBoard empty.
	board at: 'a1' put: (rook := MyRook white).
	board at: 'h8' put: (king := MyKing black).

	self
		assertCollection: board pieces asSet
		hasSameElements: { rook. king } asSet
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

{ #category : 'tests' }
MyBoardEdgeTests >> testSquaresOfTheBoardAreOnBoard [

	| board |
	board := MyChessBoard empty.

	self assert: (board at: 'e4') isOnBoard
]
