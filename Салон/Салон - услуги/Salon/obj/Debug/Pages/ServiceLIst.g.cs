﻿#pragma checksum "..\..\..\Pages\ServiceLIst.xaml" "{8829d00f-11b8-4213-878b-770e8597ac16}" "2E5913754F95B6826101508AE56AA5DCE1E01AB813C3DD5B73A59E0B9CB5DF8F"
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
    /// ServiceLIst
    /// </summary>
    public partial class ServiceLIst : System.Windows.Controls.Page, System.Windows.Markup.IComponentConnector {
        
        
        #line 73 "..\..\..\Pages\ServiceLIst.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.ComboBox cmb_count;
        
        #line default
        #line hidden
        
        
        #line 89 "..\..\..\Pages\ServiceLIst.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.DataGrid serviceGrid;
        
        #line default
        #line hidden
        
        
        #line 111 "..\..\..\Pages\ServiceLIst.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button addButton;
        
        #line default
        #line hidden
        
        
        #line 116 "..\..\..\Pages\ServiceLIst.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBlock full;
        
        #line default
        #line hidden
        
        
        #line 122 "..\..\..\Pages\ServiceLIst.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button back;
        
        #line default
        #line hidden
        
        
        #line 123 "..\..\..\Pages\ServiceLIst.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.StackPanel pagin;
        
        #line default
        #line hidden
        
        
        #line 125 "..\..\..\Pages\ServiceLIst.xaml"
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
            System.Uri resourceLocater = new System.Uri("/Salon;component/pages/servicelist.xaml", System.UriKind.Relative);
            
            #line 1 "..\..\..\Pages\ServiceLIst.xaml"
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
            
            #line 46 "..\..\..\Pages\ServiceLIst.xaml"
            ((System.Windows.Controls.TextBox)(target)).TextChanged += new System.Windows.Controls.TextChangedEventHandler(this.TextBox_TextChanged);
            
            #line default
            #line hidden
            return;
            case 2:
            
            #line 47 "..\..\..\Pages\ServiceLIst.xaml"
            ((System.Windows.Controls.ComboBox)(target)).SelectionChanged += new System.Windows.Controls.SelectionChangedEventHandler(this.ComboBox_SelectionChanged);
            
            #line default
            #line hidden
            return;
            case 3:
            this.cmb_count = ((System.Windows.Controls.ComboBox)(target));
            
            #line 73 "..\..\..\Pages\ServiceLIst.xaml"
            this.cmb_count.SelectionChanged += new System.Windows.Controls.SelectionChangedEventHandler(this.cmb_count_SelectionChanged);
            
            #line default
            #line hidden
            return;
            case 4:
            this.serviceGrid = ((System.Windows.Controls.DataGrid)(target));
            
            #line 89 "..\..\..\Pages\ServiceLIst.xaml"
            this.serviceGrid.MouseDown += new System.Windows.Input.MouseButtonEventHandler(this.serviceGrid_MouseDown);
            
            #line default
            #line hidden
            return;
            case 5:
            this.addButton = ((System.Windows.Controls.Button)(target));
            
            #line 111 "..\..\..\Pages\ServiceLIst.xaml"
            this.addButton.Click += new System.Windows.RoutedEventHandler(this.addButton_Click);
            
            #line default
            #line hidden
            return;
            case 6:
            this.full = ((System.Windows.Controls.TextBlock)(target));
            return;
            case 7:
            this.back = ((System.Windows.Controls.Button)(target));
            
            #line 122 "..\..\..\Pages\ServiceLIst.xaml"
            this.back.Click += new System.Windows.RoutedEventHandler(this.Button_Click);
            
            #line default
            #line hidden
            return;
            case 8:
            this.pagin = ((System.Windows.Controls.StackPanel)(target));
            return;
            case 9:
            this.forward = ((System.Windows.Controls.Button)(target));
            
            #line 125 "..\..\..\Pages\ServiceLIst.xaml"
            this.forward.Click += new System.Windows.RoutedEventHandler(this.Button_Click1);
            
            #line default
            #line hidden
            return;
            }
            this._contentLoaded = true;
        }
    }
}

