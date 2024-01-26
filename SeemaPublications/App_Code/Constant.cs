using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SeemaPublications.App_Code
{
    public class Constant
    {
        public static int ExcelSize = 30000;
        public static int SuperAdmin = 1;
        public static int State_Authority = 2;
        public static int MO_State_Authority = 3;
        public static int District_Authority = 4;
        public static int MO_District_Authority = 5;
        public static int Support_Enginner = 6;
        public static int Support_Head = 7;
        public static int Account_User = 8;
        public static int Account_Head = 9;
        public static int State_Support_Head = 10;
        public static int Dept_Head = 11;
        public static int Head_officeInv = 12;
        public static int officeInv = 13;
        public static int Vendor_Inv = 14;
        public static int DoctorRoleID = 15;
        public static int CallCenter = 17;
        public static int OperationalHead = 18;
        public static int EmployeeMgmt = 19;
        public static int Report = 21;


        public static DateTime GSTStartDate = new DateTime(2017, 07, 01);
        public static string M_AmitSir = "amit.ghorpade1@magnumopus.in";

        public static string M_Nitin = "dipali@magnumopusindia.in";
        public static string M_Account = "accounts@magnumopusindia.in";
        public static string M_FromMail = "invoice@magnumopus.in";
        public static string M_FromPwd = "mo@invoice1234";
        public static string FromEmailAlert = "alert@magnumopusindia.in";
        public static string FromPwdalert = "jfuljpedcfgbyoil";
        public static string M_Jaipur = "magnum.jaipur@gmail.com";
        public static string M_Vishal = "swapnil@magnumopus.in";
        public static string M_Vinayak = "kiran@magnumopus.in";
        public static string M_toArti = "aarti.narode@magnumopusindia.in";
        public static string Online_Profarmalink = "https://megovernance.org/actc/ProfarmaOnlinePayment.aspx?PaymentId=";
        public static string Pwd_ArtiEmail = "fczoisqewtziwtpu";
        public static string Inv_Deliveredtext = "Received";
        public static string Inv_PartialDisptext = "Partially Dispatched";
        public static string Inv_Dispatext = "Dispatched";
        public static string Inv_ParDeliveredtext = "Partially Received";
        public static string Inv_N_Atext = "N/A";

        public static string BANKNAME = "Bank:Bank Of Maharashtra";
        public static string BANKAC = "A/C :60078805577";
        public static string BANKIFSC = "Bank IFSC:MAHB0000243";

        public static string SMTPURL = "smtp.mail.yahoo.com";
        public static int SMTPPort = 587;



        public static string Profarma_MailFormat = "<Table cellspacing=1 cellpadding=5 width=750px>" +
              "<tr><td>" +
               "<b>" +
               "Dear Sir/Madam, <br/>$centerName" +
               "</b>" +
               "</td></tr>" +
               "<tr><td>$Containt" +
               "</td></tr><br />" +
                 "<tr><td><b>Please use Following Banking Details for Cash Deposite/Net banking</b>" +
               "</td></tr>" +
               "<tr><td>Name: MAGNUM OPUS IT CONSULTING PVT. LTD.</td></tr>" +
               //"<tr><td>Bank   : Bank of Maharashtra </td></tr>" +
               //"<tr><td>A/C     : 60078805577</td></tr>" +
               //"<tr><td>IFSC CODE: MAHB0000243</td></tr>" +
               "<tr><td>Bank   : AXIS BANK LTD</td></tr>" +
               "<tr><td>A/C     : 912020066299770</td></tr>" +
               "<tr><td>IFSC CODE: UTIB0000104</td></tr>" +
                 "<tr><td>Payable Amount :$TotalAmount Rs.</td></tr>" +
                 "<tr><td>Contact:-  07719832525 /8094013123.</td></tr>" +
                    "<tr><td></br>" +
               " <b>For Pay online <a href='$link'>" +
               "Click Here</a></b></br>" +
               "</td></tr>" +
               "<tr><td><b>$Note</b></td></tr>" +
               "<tr><td>$Disclaimer</td></tr>" +
               "</Table>";

        public static string Note = "Note: -" + "<ol type=\"1\"><li>If you are going to pay through Net Banking/Online Please Send Us UTR/IMPS/Payment Reffernce number after payment confirmation. If you are going to deposit cash/Cheque Directly in bank Please provide deposit slip. You can send details on the mail amit.ghorpade1@magnumopus.in ,accounts@magnumopusindia.in and magnum.jaipur@gmail.com </li>"
                                 + "<li> On non receipt of the AMC Payment the Services shall be discontinued and the SIM may also be deactivated due to non payment for which you will be solely responsible.</li>"
                                 + "<li> The service engineer should not be paid cash under any circumstances. Company will not be liable for the misappropriation of that amount.</li></ol>";
        public static string Disclaimer = "<br />You are receiving this email because your e-mail ID is registered with Magnum Opus India Pvt Ltd. This is a system-generated e-mail alert to update you about the status of your device. " +
                                           "<b>Please do not reply to this e-mail; as reply to this email id is not monitored and is not intended for incoming mails.</b><br />" +
                                           "<div style=\"font-size:small; font-family:Courier New;\"><br>" +
                                           "</br>**************** CAUTION - Disclaimer *****************<br />" +
                                           "This e-mail contains PRIVILEGED AND CONFIDENTIAL INFORMATION intended solely " +
                                           "for the use of the addressee(s). If you are not the intended recipient, you are not " +
                                           "to copy, disclose, or distribute this e-mail or its contents to any other person and " +
                                           "any such actions are unlawful. This e-mail may contain viruses. Magnum Opus has taken " +
                                           "every reasonable precaution to minimize this risk, but is not liable for any damage " +
                                           "you may sustain as a result of any virus in this e-mail. You should carry out your " +
                                           "own virus checks before opening the e-mail or attachment. Magnum Opus reserves the " +
                                           "right to monitor and review the content of all messages sent from this e-mail " +
                                           "address. Messages sent from this e-mail address may be stored on the " +
                                           "Magnum Opus e-mail system.<br />" +
                                           "***Magnum Opus******** End of Disclaimer ********Magnum Opus***" +
                                           "​</div> ";
    }
}
