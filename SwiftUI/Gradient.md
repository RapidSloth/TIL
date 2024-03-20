# 기본 
-  `colors` 파라미터 내부에 배열로 색깔 전달
- `startPoint`, `endPoint` 지정이 핵심
```swift
LinearGradient(colors: , startPoint: , endPoint: )
```



### 예시 - 전체배경에 적용

- 얘도 하나의 View이므로 그냥 배치 가능
```swift
var body: some View {
	 LinearGradient(
		 colors: [Color("GreenLight"), Color("GreenMedium")],
		 startPoint: .top, 
		 endPoint: .bottom
	)
}
```

## Text
```swift
Text("iOS")
	.font(.system(size: 180))
	.fontWeight(.black)
	.foregroundStyle(
		LinearGradient(
			colors: [.pink, .purple, .blue],
			startPoint: .topLeading,
			endPoint: .bottomTrailing
		)
	)
```

## Circle
```swift
Circle()
	.fill(
		LinearGradient(
			colors: [Color("IndigoMedium"), Color("ColorSalmonLight")],
			startPoint: .topLeading,
			endPoint: .bottomTrailing
		)
	)
	.frame(width: 256, height: 256)
```