- 먼저 저장속성에 Bool값을 할당 

```swift
@State private var isPhotoVisible = true
```



- toggle을 이용해서 (대부분 버튼) 앞에서 생성한 저장속성의 값이 변경되게 

```swift
self.isPhotoVisible.toggle()


// 스르륵
withAnimation {
	self.isPhotoVisible.toggle()
}
```



- 토글을 통해 펴고 접을 뷰를 if문 내부에 넣으면 끝

```swift
if isPhotoVisible {
...
}
```

