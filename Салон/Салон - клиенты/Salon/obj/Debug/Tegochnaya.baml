   M S B A M L   `   `   `  ����@  <Salon, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullclr-namespace:SalonSalon  5   	       Salon.Tegochnaya   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   %localclr-namespace:Salon     5   	     � Title$  Тэгочная��5   	   $	��450��6   $	��400��6'    � Icon$ /beauty_logo.png��63   .��5	      �� $��5q�6   
����� �._�5
   
   �  � 	Resources 5       	  MyCol �� Orientation��%T  &	        �� 5      .R�5      �� $��1q�6   
���   �$��5,5,5,5q�6E   ._�5      �� $
��auto��6%   $
��auto��62   $ 
Horizontal=�6@   .+�5      �� $ Vertical=�6)   $
��auto��6@   .+�5   "   �� $	��175��6C   $
��Left=�6O   ��6,   �� *Title+��6j   �� *Color+5      5      5      5      5      .+�5      �  � RowDefinitions 5      �� 5      �� 5      $��40 �6$   62   .+�5      &   System.Windows.Controls.DataGrid  -   5          Name$ grid_tagClient��5   7      AutoGenerateColumns .  $��0��6O      
IsReadOnly .    GridLinesVisibility$
 None=�6n   	   Columns	 5       4  .System.Windows.Controls.DataGridTemplateColumn  5!      
   CellTemplate#
 [  61   ,  &System.Windows.Controls.DataGridColumn   Width5  /System.Windows.Controls.DataGridLengthConverter$ * 6W   5"      5$      �� 5&      -   5         ��Name$ 
btn_addTag��5&      $��Добавить тэг��6-   $��1��6D   $	��100��6Q   $��-270 0 0 0 q�6]   6r   �� 5'      -   5         ��Name$ cb_tag��5'      $��1��6+   $	��125��68   $��30��6D   $
��Left=�6P   $��	135 0 0 0q�6k   $��Center=�6~   ��6�   �� �� 5(      -   5        $ btn_deleteTag��5(      $��Удалить тэг��60   $��1��6F   $	��100��6S   $��
270 0 0 0 q�6_   6s   5*      5+      5,      5-      