# AutoLayout

## Calculator
StackView  
Hugging Priority  
minium, maximum constraint  

## DynamicFont
Alignment  
Setting proper ratio  

## CustomKeyboard
Custom view (using xib)  

## ExpandCellAtLabel
tableView  
numberOfLines 조절하여 expand  
TableCell Height, Animation 제어  

## FloatingButton
Visual Effect View with Blur  
버튼 튀어오르는 애니메이션 효과 =>  UIView.animate(damping)   
escaping closure  

## GraphLayout
Proportional Height - Multiplier (get-only property)  
NSLayoutConstraint의 extension 활용하여 다른 값 그대로, multiplier 값 재설정  

```
extension NSLayoutConstraint {
    func changeMultiplier(value: CGFloat) -> NSLayoutConstraint {
        
        // 원래 가진 값을 전부 비활성화
        NSLayoutConstraint.deactivate([self])
        
        let newLayoutConstraint = NSLayoutConstraint.init(item: self.firstItem, attribute: self.firstAttribute, relatedBy: self.relation, toItem: self.secondItem, attribute: self.secondAttribute, multiplier: value, constant: self.constant)
        
        newLayoutConstraint.priority = self.priority
        newLayoutConstraint.shouldBeArchived = self.shouldBeArchived
        newLayoutConstraint.identifier = self.identifier
        
        // 새로 만든걸 다시 활성화
        NSLayoutConstraint.activate([newLayoutConstraint])
        
        return newLayoutConstraint
    }
}
```
