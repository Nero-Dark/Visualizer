object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 509
  ClientWidth = 975
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 8
    Top = 8
    Width = 955
    Height = 417
    OnMouseLeave = Image1MouseLeave
    OnMouseMove = Image1MouseMove
  end
  object Label2: TLabel
    Left = 216
    Top = 468
    Width = 22
    Height = 13
    Caption = 'FPS:'
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 490
    Width = 975
    Height = 19
    Panels = <>
  end
  object TrackBar1: TTrackBar
    Left = 0
    Top = 431
    Width = 975
    Height = 26
    Cursor = crHandPoint
    TabOrder = 1
    TickMarks = tmBoth
    TickStyle = tsNone
    OnChange = TrackBar1Change
  end
  object Button1: TButton
    Left = 8
    Top = 463
    Width = 46
    Height = 25
    Caption = '|<--'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 60
    Top = 463
    Width = 46
    Height = 25
    Caption = '>'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 112
    Top = 463
    Width = 46
    Height = 25
    Caption = '||'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 164
    Top = 463
    Width = 46
    Height = 25
    Caption = '-->|'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = Button4Click
  end
  object Edit1: TEdit
    Left = 244
    Top = 463
    Width = 29
    Height = 21
    TabOrder = 6
    Text = '30'
    TextHint = 'FPS'
    OnChange = Edit1Change
  end
  object Button5: TButton
    Left = 279
    Top = 463
    Width = 75
    Height = 25
    Caption = 'Visualize'
    TabOrder = 7
    OnClick = Button5Click
  end
  object MainMenu1: TMainMenu
    Left = 928
    Top = 16
    object File1: TMenuItem
      Caption = 'File'
      object Open1: TMenuItem
        Caption = 'Open'
        OnClick = Open1Click
      end
      object Save1: TMenuItem
        Caption = 'Save'
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Exit1: TMenuItem
        Caption = 'Exit'
        OnClick = Exit1Click
      end
    end
    object Help1: TMenuItem
      Caption = 'Help'
      object AboutProgram1: TMenuItem
        Caption = 'About Program'
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 888
    Top = 16
  end
  object SaveDialog1: TSaveDialog
    Left = 848
    Top = 16
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 808
    Top = 16
  end
end
