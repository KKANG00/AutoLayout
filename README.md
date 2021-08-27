# AutoLayout

## Calculator
constraint 개념 활용하여 계산기 Layout 그리기  

### Keywords
StackView  
Hugging Priority  
minium, maximum constraint  


- - -

## DynamicFont
화면 크기에 맞게 동적으로 폰트 위치, 사이즈 움직이기  

### Keywords
Alignment  
Multiplier  
Setting proper ratio  


- - -

## CustomKeyboard
Custom view 구현하여 커스텀 키보드 그리기 (using xib)  

![](https://github.com/KKANG00/AutoLayout/blob/main/CustomKeyboard/CustomKeyboard.png)


- - -

## ExpandCellAtLabel
내용 길이에 맞게 확장되는 TableView Cell 구현하기  

### Keywords
TableView numberOfLines  
TableCell Height, Animation 제어  

![](https://github.com/KKANG00/AutoLayout/blob/main/ExpandCellAtLabel/ExpandCellAtLabel.gif)


- - -

## FloatingButton
버튼이 튀어오르며 나타나는 효과 구현하기  

### Keywords
Visual Effect View with Blur  
UIView.animate(damping)   
escaping closure  

![](https://github.com/KKANG00/AutoLayout/blob/main/FloatingButton/FloatingButton.gif)


- - -

## GraphLayout
Multiplier 값 조정하여 움직이는 막대그래프 그리기  

### Keywords
Proportional Height - Multiplier (get-only property)  
* Multiplier 값을 코드로 조정  
=> NSLayoutConstraint의 extension 활용하여 다른 값 그대로, multiplier 값 재설정  


- - -

## CodeView
CustomView 구현 후 StoryBoard에 연동해서 편집하기  

### Keywords
UIBezierPath  
CAShapeLayer  
masking  
* custom CodeView를 storyboard에서 사용하기 위한 키워드  
@IBDesignable  
@IBInspectable  


- - -

## CustomSwitch
CustomSwitch 구현방식으로 Apple UISwitch 카피하기  

### Keywords
UIView.animate  
constraint constant  

![](https://github.com/KKANG00/AutoLayout/blob/main/CustomSwitch/CustomSwitch.gif)


- - -

## Popup
view 바깥으로 튀어나온 팝업 페이지 그리기  

### Keywords
modalPresentationStyle  
overCurrentContext  

![](https://github.com/KKANG00/AutoLayout/blob/main/Popup/Popup.png)


- - -

## SignIn
로그인 화면에서 입력에 따라 에러메세지 노출하기  

### Keywords
TextField.addTarget  
heightAnchor.constraint(equalToConstant: 0)  
Regular Expression  
``` swift
//이메일 정규식 표현  
let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
```


- - -

## ChatApp
유연하게 움직이는 채팅 앱 그리기

### Keywords
Custom TableViewCell (UINib)
Keyboard Observer  
``` swift
NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
```
