//---------------------------------------------------------------------------
#ifndef MainH
#define MainH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <stdio.h>
#include <Buttons.hpp>
#include <ExtCtrls.hpp>
#include <Dialogs.hpp>
#include <ComCtrls.hpp>
#include <Menus.hpp>
#include <Graphics.hpp>
#include <jpeg.hpp>
#include <ActnCtrls.hpp>
#include <ActnMan.hpp>
#include <ActnMenus.hpp>
#include <ToolWin.hpp>
//---------------------------------------------------------------------------
#include "RS232_Command.h"
#include "USB_JTAG.h"
#include "PS2_Thread.h"
#include "FTD2XX.H"
#include <ImgList.hpp>
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
   TGroupBox *GroupBox3;
   TLabel *Label5;
   TLabel *Label6;
   TEdit *oFL_ADDR;
   TEdit *oFL_DATA;
   TLabel *Label7;
   TEdit *iFL_DATA;
    TButton *FlashChipEraseButton1;
    TButton *FlashRdWordButton1;
    TButton *FlashWrWordButton1;
    TButton *FlashWrFileButton1;
    TButton *FlashRdFileButton1;
   TGroupBox *GroupBox4;
   TGroupBox *GroupBox5;
   TEdit *iWR_ADDR;
   TLabel *Label8;
   TLabel *Label9;
   TEdit *iWR_Length;
   TCheckBox *CheckBox1;
   TEdit *iRD_ADDR;
   TLabel *Label10;
   TLabel *Label11;
   TEdit *iRD_Length;
   TGroupBox *GroupBox7;
   TCheckBox *CheckBox2;
   TPanel *Panel1;
   TProgressBar *ProgressBar1;
   TLabel *Label12;
   TLabel *Process_Label;
   TGroupBox *GroupBox8;
   TGroupBox *GroupBox9;
   TLabel *Label13;
   TLabel *Label14;
   TLabel *Label15;
   TEdit *iSDR_DATA;
   TEdit *oSDR_ADDR;
   TEdit *oSDR_DATA;
   TGroupBox *GroupBox10;
   TLabel *Label16;
   TLabel *Label17;
   TEdit *iSDR_SWR_ADDR;
   TEdit *iSDR_SWR_Length;
   TGroupBox *GroupBox11;
   TLabel *Label18;
   TLabel *Label19;
   TEdit *iSDR_SRD_ADDR;
   TEdit *iSDR_SRD_Length;
    TButton *SDRAMWrWordButton1;
    TButton *SDRAMRdWordButton1;
    TButton *SDRAMWrFileButton1;
   TCheckBox *CheckBox3;
    TButton *SDRAMRdFileButton1;
   TCheckBox *CheckBox4;
   TPageControl *PageControl1;
   TTabSheet *TabSheet2;
   TTabSheet *TabSheet3;
   TOpenDialog *OpenDialog1;
   TSaveDialog *SaveDialog1;
   TOpenDialog *OpenDialog2;
   TSaveDialog *SaveDialog2;
   TTabSheet *TabSheet4;
   TComboBox *Sdram_Multi;
   TComboBox *Flash_Multi;
   TLabel *Label20;
   TLabel *Label21;
    TButton *ConfigPortsButton1;
   TTabSheet *TabSheet5;
   TGroupBox *GroupBox13;
   TGroupBox *GroupBox14;
   TLabel *Label22;
   TLabel *Label23;
   TLabel *Label24;
   TEdit *iSR_DATA;
   TEdit *oSR_ADDR;
   TEdit *oSR_DATA;
   TGroupBox *GroupBox15;
   TLabel *Label25;
   TLabel *Label26;
   TEdit *iSR_SWR_ADDR;
   TEdit *iSR_SWR_Length;
   TGroupBox *GroupBox16;
   TLabel *Label27;
   TLabel *Label28;
   TEdit *iSR_SRD_ADDR;
   TEdit *iSR_SRD_Length;
    TButton *SRAMWrFileButton1;
    TButton *SRAMWrWordButton1;
    TButton *SRAMRdWordButton1;
    TButton *SRAMRdFileButton1;
   TOpenDialog *OpenDialog3;
   TSaveDialog *SaveDialog3;
   TCheckBox *CheckBox5;
   TCheckBox *CheckBox6;
   TTabSheet *TabSheet6;
   TLabel *Label1;
   TLabel *Label2;
   TLabel *Label3;
   TLabel *Label4;
   TComboBox *DIG_4;
   TComboBox *DIG_3;
   TComboBox *DIG_2;
   TComboBox *DIG_1;
   TGroupBox *GroupBox6;
   TMemo *Memo1;
   TGroupBox *GroupBox2;
   TCheckBox *D1;
   TCheckBox *D2;
   TCheckBox *D3;
   TCheckBox *D4;
    TButton *SetValuesButton1;
   TCheckBox *D5;
   TCheckBox *D6;
   TCheckBox *D7;
   TCheckBox *D8;
   TCheckBox *DR9;
   TCheckBox *DR8;
   TCheckBox *DR7;
   TCheckBox *DR6;
   TCheckBox *DR5;
   TCheckBox *DR4;
   TCheckBox *DR3;
   TCheckBox *DR2;
   TCheckBox *DR1;
   TCheckBox *DR0;
   TLabel *Label33;
   TComboBox *Sram_Multi;
   TTabSheet *TabSheet7;
   TImage *Image1;
   TScrollBar *ScrollBar1;
   TScrollBar *ScrollBar2;
   TLabel *Label36;
   TLabel *Label34;
   TCheckBox *Default_IMG;
   TCheckBox *Cursor_EN;
   TLabel *Cur_X;
   TLabel *Cur_Y;
    TTabSheet *TabSheet1;
    TGroupBox *GroupBox1;
    TGroupBox *GroupBox17;
    TLabel *Label32;
    TLabel *Label35;
    TButton *CopyToSDCardButton1;
    TEdit *Edit4;
    TEdit *Edit5;
    TCheckBox *CheckBox7;
    TGroupBox *GroupBox18;
    TLabel *Label37;
    TLabel *Label38;
    TEdit *Edit6;
    TEdit *Edit7;
    TButton *CopyFromSDCardButton1;
    TCheckBox *CheckBox8;
    TOpenDialog *OpenDialog4;
    TTabSheet *TabSheet8;
    TButton *ConfigControllerButton1;
    TButton *ConfigKotkuButton1;
    TButton *EraseFlashButton1;
    TStaticText *StaticText1;
    TStaticText *StaticText2;
    TLabel *Label29;
    TLabel *Label30;
    TButton *LoadBiosButton1;
    TStaticText *StaticText3;
    TStaticText *StaticText4;
    TStaticText *StaticText5;
    TButton *LoadAtoFlashButton1;
    TLabel *Label41;
    TControlBar *ControlBar1;
    TToolBar *ToolBar1;
    TComboBox *DevComboBox1;
    TCheckBox *BiosROMCheckBox1;
    TCheckBox *IMGFileCheckBox1;
    TStatusBar *StatusBar1;
    TCheckBox *SOFCheckBox1;
    TToolButton *OpenUSBPort1;
    TToolButton *CloseUSBPort1;
    TToolButton *HelpButton1;
    TToolButton *AboutButton1;
    TToolButton *ExitButton1;
    TOpenDialog *OpenDialog5;
    TOpenDialog *OpenDialog6;
    TToolButton *ToolButton1;
    TToolButton *ToolButton2;
    TToolButton *ToolButton3;
    TToolButton *ToolButton4;
    TImageList *ImageList1;
    TSpeedButton *SpeedButton1;
    TToolButton *ToolButton5;
   void __fastcall FormClose(TObject *Sender, TCloseAction &Action);
   void __fastcall SetValuesButton1Click(TObject *Sender);
   void __fastcall FlashWrWordButton1Click(TObject *Sender);
   void __fastcall FlashRdWordButton1Click(TObject *Sender);
   void __fastcall FlashChipEraseButton1Click(TObject *Sender);
   void __fastcall FlashWrFileButton1Click(TObject *Sender);
   void __fastcall FlashRdFileButton1Click(TObject *Sender);
   void __fastcall CheckBox1Click(TObject *Sender);
   void __fastcall CheckBox2Click(TObject *Sender);
   void __fastcall About1Click(TObject *Sender);
   void __fastcall Help1Click(TObject *Sender);
   void __fastcall CheckBox4Click(TObject *Sender);
   void __fastcall CheckBox3Click(TObject *Sender);
   void __fastcall SDRAMWrWordButton1Click(TObject *Sender);
   void __fastcall SDRAMRdWordButton1Click(TObject *Sender);
   void __fastcall SDRAMWrFileButton1Click(TObject *Sender);
   void __fastcall SDRAMRdFileButton1Click(TObject *Sender);
   void __fastcall TabSheet1Show(TObject *Sender);
   void __fastcall ConfigPortsButton1Click(TObject *Sender);
   void __fastcall CloseUSBPort1Click(TObject *Sender);
   void __fastcall TabSheet2Show(TObject *Sender);
   void __fastcall SRAMWrWordButton1Click(TObject *Sender);
   void __fastcall SRAMRdWordButton1Click(TObject *Sender);
   void __fastcall CheckBox5Click(TObject *Sender);
   void __fastcall CheckBox6Click(TObject *Sender);
   void __fastcall SRAMWrFileButton1Click(TObject *Sender);
   void __fastcall SRAMRdFileButton1Click(TObject *Sender);
   void __fastcall ScrollBar2Change(TObject *Sender);
   void __fastcall ScrollBar1Change(TObject *Sender);
   void __fastcall Default_IMGClick(TObject *Sender);
   void __fastcall Cursor_ENClick(TObject *Sender);
    void __fastcall CopyToSDCardButton1Click(TObject *Sender);
    void __fastcall ConfigControllerButton1Click(TObject *Sender);
    void __fastcall ConfigKotkuButton1Click(TObject *Sender);
    void __fastcall Exit1Click(TObject *Sender);
    void __fastcall EraseFlashButton1Click(TObject *Sender);
    void __fastcall LoadBiosButton1Click(TObject *Sender);
    void __fastcall LoadAtoFlashButton1Click(TObject *Sender);
    void __fastcall OpenUSBPort1Click(TObject *Sender);
    void __fastcall FormShow(TObject *Sender);
    void __fastcall DevComboBox1Change(TObject *Sender);

private:	// User declarations
    bool __fastcall AutoOpenUSB(TObject *Sender);
    void __fastcall BuildDevList(TObject *Sender);


public:		// User declarations

    AnsiString AppPath;

    int PS2_times;
    bool USB_is_Open;
    FILE *file1,*file2;
    TThread *PS2_REC;
    USB_JTAG USB1;

    __fastcall TForm1(TComponent* Owner);
    void __fastcall Show_All_Button(bool Show);
    void __fastcall Close_USB_Port();
    int __fastcall  HexToInt(AnsiString strHex);
    int __fastcall Select_File(String File_Name);
    int __fastcall AscToHex(unsigned char a);
    int __fastcall File_AscToHex(String File_Input,String File_Output,int File_Type);
    int __fastcall File_HexToAsc(String File_Input,String File_Output,int File_Type);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
extern int PS2_times;
//---------------------------------------------------------------------------
#endif
