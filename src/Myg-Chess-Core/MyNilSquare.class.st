Class {
	#name : 'MyNilSquare',
	#superclass : 'Object',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'api - configuration' }
MyNilSquare >> down [

	^ self
]

{ #category : 'testing' }
MyNilSquare >> hasPiece [

	^ false
]

{ #category : 'testing' }
MyNilSquare >> isOnBoard [

	^ false
]

{ #category : 'accessing' }
MyNilSquare >> left [

	^ self
]

{ #category : 'accessing' }
MyNilSquare >> right [

	^ self
]

{ #category : 'instance creation' }
MyNilSquare >> up [

	^ self
]
