"
I check which letter of the chess font is used to draw each piece.

A white piece and a black piece do not use the same letter. And the letter is written in lowercase when the piece is on a black square (the font draws the piece on a dark background).
"
Class {
	#name : 'MyPieceRenderingTests',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'asserting' }
MyPieceRenderingTests >> assertRendering: aPiece onWhiteSquare: whiteSquareLetter onBlackSquare: blackSquareLetter [

	self
		assert: (aPiece renderPieceOn: MyChessSquare white)
		equals: whiteSquareLetter.
	self
		assert: (aPiece renderPieceOn: MyChessSquare black)
		equals: blackSquareLetter
]

{ #category : 'tests' }
MyPieceRenderingTests >> testBishop [

	self assertRendering: MyBishop white onWhiteSquare: 'B' onBlackSquare: 'b'.
	self assertRendering: MyBishop black onWhiteSquare: 'V' onBlackSquare: 'v'
]

{ #category : 'tests' }
MyPieceRenderingTests >> testEmptySquare [

	self
		assertRendering: MyNilPiece new
		onWhiteSquare: 'z'
		onBlackSquare: 'x'
]

{ #category : 'tests' }
MyPieceRenderingTests >> testKing [

	self assertRendering: MyKing white onWhiteSquare: 'K' onBlackSquare: 'k'.
	self assertRendering: MyKing black onWhiteSquare: 'L' onBlackSquare: 'l'
]

{ #category : 'tests' }
MyPieceRenderingTests >> testKnight [

	self assertRendering: MyKnight white onWhiteSquare: 'N' onBlackSquare: 'n'.
	self assertRendering: MyKnight black onWhiteSquare: 'M' onBlackSquare: 'm'
]

{ #category : 'tests' }
MyPieceRenderingTests >> testPawn [

	self assertRendering: MyPawn white onWhiteSquare: 'P' onBlackSquare: 'p'.
	self assertRendering: MyPawn black onWhiteSquare: 'O' onBlackSquare: 'o'
]

{ #category : 'tests' }
MyPieceRenderingTests >> testQueen [

	self assertRendering: MyQueen white onWhiteSquare: 'Q' onBlackSquare: 'q'.
	self assertRendering: MyQueen black onWhiteSquare: 'W' onBlackSquare: 'w'
]

{ #category : 'tests' }
MyPieceRenderingTests >> testRook [

	self assertRendering: MyRook white onWhiteSquare: 'R' onBlackSquare: 'r'.
	self assertRendering: MyRook black onWhiteSquare: 'T' onBlackSquare: 't'
]
