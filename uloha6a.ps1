# Zjistěte vlastnosti třídy umožňující spravovat tiskárny

#Získání informací o třídě pro správu tiskáren
$tiskarnaClass = Get-CimClass -ClassName Win32_Printer
#Vypsání vlastnosti třídy
foreach ($property in $tiskarnaClass.CimClassProperties) {
    Write-Output "Vlastnosti třídy --> Nazev: $($property.Name), Typ: $($property.CimType)"
}