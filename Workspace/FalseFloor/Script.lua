

falsefloors = script.Parent
ThreeLayered = falsefloors.ThreeLayered:GetChildren()
TwoLayered = falsefloors.TwoLayered:GetChildren()

choosenNum = math.random(1,#ThreeLayered)
choosenNum2 = math.random(1, #TwoLayered)

print(ThreeLayered[choosenNum])
print(TwoLayered[choosenNum2])


ThreeLayered[choosenNum].CanCollide = true
ThreeLayered[choosenNum].Transparency = 0

TwoLayered[choosenNum2].CanCollide = true
TwoLayered[choosenNum2].Transparency = 0



