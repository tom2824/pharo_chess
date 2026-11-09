"
I am the square you get when you leave the board (Null Object pattern).

Going up, down, left or right from me leads to me again: outside of the board, you stay outside of the board.
I am never part of the legal moves: pieces ask isOnBoard to know it.
"
Class {
	#name : 'MyNilSquare',
	#superclass : 'Object',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'arithmetic' }
MyNilSquare >> + aPoint [

	^ self
]

{ #category : 'api - configuration' }
MyNilSquare >> down [

	^ self
]

{ #category : 'testing' }
MyNilSquare >> hasPiece [
	"No piece can stand outside of the board"

	^ false
]

{ #category : 'testing' }
MyNilSquare >> isOnBoard [

	^ false
]

{ #category : 'api - configuration' }
MyNilSquare >> left [

	^ self
]

{ #category : 'api - configuration' }
MyNilSquare >> right [

	^ self
]

{ #category : 'api - configuration' }
MyNilSquare >> up [

	^ self
]
