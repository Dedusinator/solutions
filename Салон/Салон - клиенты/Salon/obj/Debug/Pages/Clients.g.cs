﻿#pragma checksum "..\..\..\Pages\Clients.xaml" "{8829d00f-11b8-4213-878b-770e8597ac16}" "95C33DE27DCA9AA9881D169DD1D3E7D04FFBE6B31477FC1A1D2556D6065F4896"
//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан программой.
//     Исполняемая версия:4.0.30319.42000
//
//     Изменения в этом файле могут привести к неправильной работе и будут потеряны в случае
//     повторной генерации кода.
// </auto-generated>
//------------------------------------------------------------------------------

using Salon.Pages;
using System;
using System.Diagnostics;
using System.Windows;
using System.Windows.Automation;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Markup;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Effects;
using System.Windows.Media.Imaging;
using System.Windows.Media.Media3D;
using System.Windows.Media.TextFormatting;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Shell;


namespace Salon.Pages {
    
    
    /// <summary>
    /// Clients
    /// </summary>
    public partial class Clients : System.Windows.Controls.Page, System.Windows.Markup.IComponentConnector {
        
        
        #line 64 "..\..\..\Pages\Clients.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.ComboBox cb_filter;
        
        #line default
        #line hidden
        
        
        #line 76 "..\..\..\Pages\Clients.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.ComboBox cmb_count;
        
        #line default
        #line hidden
        
        
        #line 92 "..\..\..\Pages\Clients.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.DataGrid clientsGrid;
        
        #line default
        #line hidden
        
        
        #line 114 "..\..\..\Pages\Clients.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.CheckBox chb_birthday;
        
        #line default
        #line hidden
        
        
        #line 115 "..\..\..\Pages\Clients.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button addButton;
        
        #line default
        #line hidden
        
        
        #line 120 "..\..\..\Pages\Clients.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBlock full;
        
        #line default
        #line hidden
        
        
        #line 126 "..\..\..\Pages\Clients.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button back;
        
        #line default
        #line hidden
        
        
        #line 127 "..\..\..\Pages\Clients.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.StackPanel pagin;
        
        #line default
        #line hidden
        
        
        #line 129 "..\..\..\Pages\Clients.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button forward;
        
        #line default
        #line hidden
        
        private bool _contentLoaded;
        
        /// <summary>
        /// InitializeComponent
        /// </summary>
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        public void InitializeComponent() {
            if (_contentLoaded) {
                return;
            }
            _contentLoaded = true;
            System.Uri resourceLocater = new System.Uri("/Salon;component/pages/clients.xaml", System.UriKind.Relative);
            
            #line 1 "..\..\..\Pages\Clients.xaml"
            System.Windows.Application.LoadComponent(this, resourceLocater);
            
            #line default
            #line hidden
        }
        
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Design", "CA1033:InterfaceMethodsShouldBeCallableByChildTypes")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Maintainability", "CA1502:AvoidExcessiveComplexity")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1800:DoNotCastUnnecessarily")]
        void System.Windows.Markup.IComponentConnector.Connect(int connectionId, object target) {
            switch (connectionId)
            {
            case 1:
            
            #line 45 "..\..\..\Pages\Clients.xaml"
            ((System.Windows.Controls.TextBox)(target)).TextChanged += new System.Windows.Controls.TextChangedEventHandler(this.TextBox_TextChanged);
            
            #line default
            #line hidden
            return;
            case 2:
            
            #line 46 "..\..\..\Pages\Clients.xaml"
            ((System.Windows.Controls.ComboBox)(target)).SelectionChanged += new System.Windows.Controls.SelectionChangedEventHandler(this.ComboBox_SelectionChanged);
            
            #line default
            #line hidden
            return;
            case 3:
            this.cb_filter = ((System.Windows.Controls.ComboBox)(target));
            
            #line 64 "..\..\..\Pages\Clients.xaml"
            this.cb_filter.SelectionChanged += new System.Windows.Controls.SelectionChangedEventHandler(this.cb_filter_SelectionChanged);
            
            #line default
            #line hidden
            return;
            case 4:
            this.cmb_count = ((System.Windows.Controls.ComboBox)(target));
            
            #line 76 "..\..\..\Pages\Clients.xaml"
            this.cmb_count.SelectionChanged += new System.Windows.Controls.SelectionChangedEventHandler(this.cmb_count_SelectionChanged);
            
            #line default
            #line hidden
            return;
            case 5:
            this.clientsGrid = ((System.Windows.Controls.DataGrid)(target));
            
            #line 92 "..\..\..\Pages\Clients.xaml"
            this.clientsGrid.LoadingRow += new System.EventHandler<System.Windows.Controls.DataGridRowEventArgs>(this.agentGrid_LoadingRow);
            
            #line default
            #line hidden
            
            #line 92 "..\..\..\Pages\Clients.xaml"
            this.clientsGrid.MouseDown += new System.Windows.Input.MouseButtonEventHandler(this.agentGrid_MouseDown);
            
            #line default
            #line hidden
            return;
            case 6:
            this.chb_birthday = ((System.Windows.Controls.CheckBox)(target));
            
            #line 114 "..\..\..\Pages\Clients.xaml"
            this.chb_birthday.Click += new System.Windows.RoutedEventHandler(this.chb_birthday_Click);
            
            #line default
            #line hidden
            return;
            case 7:
            this.addButton = ((System.Windows.Controls.Button)(target));
            
            #line 115 "..\..\..\Pages\Clients.xaml"
            this.addButton.Click += new System.Windows.RoutedEventHandler(this.addButton_Click);
            
            #line default
            #line hidden
            return;
            case 8:
            this.full = ((System.Windows.Controls.TextBlock)(target));
            return;
            case 9:
            this.back = ((System.Windows.Controls.Button)(target));
            
            #line 126 "..\..\..\Pages\Clients.xaml"
            this.back.Click += new System.Windows.RoutedEventHandler(this.Button_Click);
            
            #line default
            #line hidden
            return;
            case 10:
            this.pagin = ((System.Windows.Controls.StackPanel)(target));
            return;
            case 11:
            this.forward = ((System.Windows.Controls.Button)(target));
            
            #line 129 "..\..\..\Pages\Clients.xaml"
            this.forward.Click += new System.Windows.RoutedEventHandler(this.Button_Click1);
            
            #line default
            #line hidden
            return;
            }
            this._contentLoaded = true;
        }
    }
}

