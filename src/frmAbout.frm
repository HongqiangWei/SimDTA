VERSION 5.00
Begin VB.Form frmAbout 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "About SimDTA"
   ClientHeight    =   8085
   ClientLeft      =   2340
   ClientTop       =   1935
   ClientWidth     =   6450
   ClipControls    =   0   'False
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5580.411
   ScaleMode       =   0  'User
   ScaleWidth      =   6056.883
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.PictureBox picIcon 
      AutoSize        =   -1  'True
      ClipControls    =   0   'False
      Height          =   1560
      Left            =   240
      Picture         =   "frmAbout.frx":0000
      ScaleHeight     =   1053.5
      ScaleMode       =   0  'User
      ScaleWidth      =   1053.5
      TabIndex        =   1
      Top             =   120
      Width           =   1560
   End
   Begin VB.CommandButton cmdOK 
      Cancel          =   -1  'True
      Caption         =   "ȷ��(&OK)"
      Default         =   -1  'True
      Height          =   345
      Left            =   1140
      TabIndex        =   0
      Top             =   7620
      Width           =   1500
   End
   Begin VB.CommandButton cmdSysInfo 
      Caption         =   "ϵͳ��Ϣ(&S)..."
      Height          =   345
      Left            =   3780
      TabIndex        =   2
      Top             =   7620
      Width           =   1485
   End
   Begin VB.Label lblMailAddr 
      Caption         =   "Label1"
      Height          =   2775
      Left            =   180
      TabIndex        =   8
      Top             =   4620
      Width           =   6015
   End
   Begin VB.Label lblAcknowledgement 
      Caption         =   "Label1"
      Height          =   2235
      Left            =   240
      TabIndex        =   7
      Top             =   1920
      Width           =   5955
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00808080&
      BorderStyle     =   6  'Inside Solid
      Index           =   6
      X1              =   -281.715
      X2              =   6676.657
      Y1              =   5135.221
      Y2              =   5135.221
   End
   Begin VB.Label lblDescription 
      Caption         =   "�س�־ / QIN Cheng-Zhi  (email: qincz@lreis.ac.cn)"
      ForeColor       =   &H00000000&
      Height          =   570
      Left            =   1920
      TabIndex        =   3
      Top             =   1260
      Width           =   4245
   End
   Begin VB.Label lblTitle 
      Caption         =   "SimDTA: Simple/Simulation Digital Terrain Analysis (developed with VB6.0)"
      ForeColor       =   &H00000000&
      Height          =   600
      Left            =   1920
      TabIndex        =   5
      Top             =   180
      Width           =   4065
   End
   Begin VB.Label lblVersion 
      Caption         =   "�汾: 0.94  (released on 2008/7/1)"
      Height          =   285
      Left            =   1920
      TabIndex        =   6
      Top             =   840
      Width           =   3765
   End
   Begin VB.Label lblDisclaimer 
      Caption         =   "����һ������Ƭ��� / This is a postcard software."
      ForeColor       =   &H00000000&
      Height          =   285
      Left            =   180
      TabIndex        =   4
      Top             =   4320
      Width           =   5565
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00808080&
      BorderStyle     =   6  'Inside Solid
      Index           =   2
      X1              =   -169.029
      X2              =   6789.343
      Y1              =   1283.805
      Y2              =   1283.805
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00808080&
      BorderStyle     =   6  'Inside Solid
      Index           =   1
      X1              =   -140.858
      X2              =   6817.515
      Y1              =   2898.915
      Y2              =   2898.915
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00FFFFFF&
      BorderWidth     =   2
      Index           =   3
      X1              =   -154.944
      X2              =   6733
      Y1              =   1283.805
      Y2              =   1283.805
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00FFFFFF&
      BorderWidth     =   2
      Index           =   0
      X1              =   -126.772
      X2              =   6817.515
      Y1              =   2898.915
      Y2              =   2898.915
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00FFFFFF&
      BorderWidth     =   2
      Index           =   5
      X1              =   -436.659
      X2              =   6507.627
      Y1              =   5135.221
      Y2              =   5135.221
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00808080&
      BorderStyle     =   6  'Inside Solid
      Index           =   4
      X1              =   -450.745
      X2              =   6507.627
      Y1              =   5135.221
      Y2              =   5135.221
   End
End
Attribute VB_Name = "frmAbout"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

' ע���ؼ��ְ�ȫѡ��...
Const READ_CONTROL = &H20000
Const KEY_QUERY_VALUE = &H1
Const KEY_SET_VALUE = &H2
Const KEY_CREATE_SUB_KEY = &H4
Const KEY_ENUMERATE_SUB_KEYS = &H8
Const KEY_NOTIFY = &H10
Const KEY_CREATE_LINK = &H20
Const KEY_ALL_ACCESS = KEY_QUERY_VALUE + KEY_SET_VALUE + KEY_CREATE_SUB_KEY + KEY_ENUMERATE_SUB_KEYS + KEY_NOTIFY + KEY_CREATE_LINK + READ_CONTROL
                     
' ע���ؼ��� ROOT ����...
Const HKEY_LOCAL_MACHINE = &H80000002
Const ERROR_SUCCESS = 0
Const REG_SZ = 1                         ' �����Ŀյ��ս��ַ���
Const REG_DWORD = 4                      ' 32λ����

Const gREGKEYSYSINFOLOC = "SOFTWARE\Microsoft\Shared Tools Location"
Const gREGVALSYSINFOLOC = "MSINFO"
Const gREGKEYSYSINFO = "SOFTWARE\Microsoft\Shared Tools\MSINFO"
Const gREGVALSYSINFO = "PATH"

Private Declare Function RegOpenKeyEx Lib "advapi32" Alias "RegOpenKeyExA" (ByVal hKey As Long, ByVal lpSubKey As String, ByVal ulOptions As Long, ByVal samDesired As Long, ByRef phkResult As Long) As Long
Private Declare Function RegQueryValueEx Lib "advapi32" Alias "RegQueryValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal lpReserved As Long, ByRef lpType As Long, ByVal lpData As String, ByRef lpcbData As Long) As Long
Private Declare Function RegCloseKey Lib "advapi32" (ByVal hKey As Long) As Long


Private Sub cmdSysInfo_Click()
  Call StartSysInfo
End Sub

Private Sub cmdOK_Click()
  Unload Me
End Sub

Private Sub Form_Load()
    Me.Caption = "About " & App.Title
    'lblVersion.Caption = "�汾 " & App.Major & "." & App.Minor & "." & App.Revision
    'lblTitle.Caption = App.Title
    lblDescription.Caption = "�س�־ / QIN Cheng-Zhi" + Chr(10) + "(email: qincz@lreis.ac.cn)"
    
    lblVersion.Caption = C_VersionInfo
        
    lblAcknowledgement.Caption = "��л / Acknowledgements" + Chr(10) + Chr(10) _
         + "������Ȼ��ѧ�������������Ŀ��40501056����" _
         + "�й���ѧԺ֪ʶ���¹�����Ҫ������ĿȺ��Ŀ�ӿ��⣨KZCX2-YW-Q10-1-5����" _
         + "��Դ�뻷����Ϣϵͳ�����ص�ʵ����������������" + Chr(10) + Chr(10) _
         & "Supported by the National Natural Science Foundation of China (Project Number: 40501056), " _
         + "Knowledge Innovation Program of the Chinese Academy of Sciences (KZCX2-YW-Q10-1-5)," _
         + "Innovation from the State Key Laboratory of Resources and Environmental Information Systems"
    
    lblMailAddr.Caption = "���Ҽ�������Ƭ�����������������þͿ����ˡ�" + Chr(10) + Chr(10) _
         & "���� �������� ����· ��11��" & vbCrLf & "�й���ѧԺ�����ѧ����Դ�о���" + Chr(10) _
         & "��Դ�뻷����Ϣϵͳ�����ص�ʵ����" + Chr(10) & "�ʱࣺ100101" & vbCrLf & vbCrLf _
         & "State Key Laboratory of Resources & Environmental Information System," & vbCrLf _
         & "Institute of Geographical Sciences & Natural Resources Research," & vbCrLf & "Chinese Academy of Sciences" & vbCrLf _
         & "11A Datun Road, Anwai, Beijing 100101, PR China" & vbCrLf & "PO Number��9719"
End Sub

Public Sub StartSysInfo()
    On Error GoTo SysInfoErr
  
    Dim rc As Long
    Dim SysInfoPath As String
    
    ' ��ͼ��ע����л��ϵͳ��Ϣ�����·��������...
    If GetKeyValue(HKEY_LOCAL_MACHINE, gREGKEYSYSINFO, gREGVALSYSINFO, SysInfoPath) Then
    ' ��ͼ����ע����л��ϵͳ��Ϣ�����·��...
    ElseIf GetKeyValue(HKEY_LOCAL_MACHINE, gREGKEYSYSINFOLOC, gREGVALSYSINFOLOC, SysInfoPath) Then
        ' ��֪32λ�ļ��汾����Чλ��
        If (Dir(SysInfoPath & "\MSINFO32.EXE") <> "") Then
            SysInfoPath = SysInfoPath & "\MSINFO32.EXE"
            
        ' ���� - �ļ����ܱ��ҵ�...
        Else
            GoTo SysInfoErr
        End If
    ' ���� - ע�����Ӧ��Ŀ���ܱ��ҵ�...
    Else
        GoTo SysInfoErr
    End If
    
    Call Shell(SysInfoPath, vbNormalFocus)
    
    Exit Sub
SysInfoErr:
    MsgBox "��ʱϵͳ��Ϣ������", vbOKOnly
End Sub

Public Function GetKeyValue(KeyRoot As Long, KeyName As String, SubKeyRef As String, ByRef KeyVal As String) As Boolean
    Dim i As Long                                           ' ѭ��������
    Dim rc As Long                                          ' ���ش���
    Dim hKey As Long                                        ' �򿪵�ע���ؼ��־��
    Dim hDepth As Long                                      '
    Dim KeyValType As Long                                  ' ע���ؼ�����������
    Dim tmpVal As String                                    ' ע���ؼ���ֵ����ʱ�洢��
    Dim KeyValSize As Long                                  ' ע���ؼ��Ա����ĳߴ�
    '------------------------------------------------------------
    ' �� {HKEY_LOCAL_MACHINE...} �µ� RegKey
    '------------------------------------------------------------
    rc = RegOpenKeyEx(KeyRoot, KeyName, 0, KEY_ALL_ACCESS, hKey) ' ��ע���ؼ���
    
    If (rc <> ERROR_SUCCESS) Then GoTo GetKeyError          ' �������...
    
    tmpVal = String$(1024, 0)                             ' ��������ռ�
    KeyValSize = 1024                                       ' ��Ǳ����ߴ�
    
    '------------------------------------------------------------
    ' ����ע���ؼ��ֵ�ֵ...
    '------------------------------------------------------------
    rc = RegQueryValueEx(hKey, SubKeyRef, 0, _
                         KeyValType, tmpVal, KeyValSize)    ' ���/�����ؼ���ֵ
                        
    If (rc <> ERROR_SUCCESS) Then GoTo GetKeyError          ' �������
    
    If (Asc(Mid(tmpVal, KeyValSize, 1)) = 0) Then           ' Win95 ��ӳ�����ս��ַ���...
        tmpVal = Left(tmpVal, KeyValSize - 1)               ' Null ���ҵ�,���ַ����з������
    Else                                                    ' WinNT û�п��ս��ַ���...
        tmpVal = Left(tmpVal, KeyValSize)                   ' Null û�б��ҵ�, �����ַ���
    End If
    '------------------------------------------------------------
    ' ����ת���Ĺؼ��ֵ�ֵ����...
    '------------------------------------------------------------
    Select Case KeyValType                                  ' ������������...
    Case REG_SZ                                             ' �ַ���ע��ؼ�����������
        KeyVal = tmpVal                                     ' �����ַ�����ֵ
    Case REG_DWORD                                          ' ���ֽڵ�ע���ؼ�����������
        For i = Len(tmpVal) To 1 Step -1                    ' ��ÿλ����ת��
            KeyVal = KeyVal + Hex(Asc(Mid(tmpVal, i, 1)))   ' ����ֵ�ַ��� By Char��
        Next
        KeyVal = Format$("&h" + KeyVal)                     ' ת�����ֽڵ��ַ�Ϊ�ַ���
    End Select
    
    GetKeyValue = True                                      ' ���سɹ�
    rc = RegCloseKey(hKey)                                  ' �ر�ע���ؼ���
    Exit Function                                           ' �˳�
    
GetKeyError:      ' �������������...
    KeyVal = ""                                             ' ���÷���ֵ�����ַ���
    GetKeyValue = False                                     ' ����ʧ��
    rc = RegCloseKey(hKey)                                  ' �ر�ע���ؼ���
End Function
