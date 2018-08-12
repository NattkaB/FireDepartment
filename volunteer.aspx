<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="volunteer.aspx.cs" Inherits="GroupProject.volunteer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Volunteers</title>
	<meta charset="utf-8" />
	<link href="style.css" rel="stylesheet" />
        <link rel="icon"
          type="image/png"
          href="flame.png"/>
</head>
<body>

       <div id="wrapper">
	<header><h1 id="tagline">CONQUEROR HOOK AND LADDER</h1></header>
        <main>
            <div id="ribbon"></div>
			<div id="left">
				<nav>
					<ul>
						<li><a href ="index.html"> HOME </a></li>
						<li><a href="gallery.html"> GALLERY </a></li>
                        <li><a href="volunteer.aspx"> VOLUNTEERS </a></li>
						<li><a href="administrator.aspx"> ADMINISTRATOR </a></li>
					</ul>
				</nav>
			</div>
            <div id="middlevol">
                <h1 id="about">Become a Volunteer Firefighter! </h1>
                <p>"Volunteer firefighters comprise two-thirds of the estimated 1.2 million firefighters in this country,"
                    said Charlie Dickinson, Acting Assistant Administrator of the United States Fire Association (USFA). <br />

                    We are a 100% Volunteer Department, like the majority of the neighborhoods in Westchester. 
                    There is no time table or schedule; you respond when you wish to or when you can. You will 
                    know when you are needed as the Village Horn will sound with a specific number of blasts,
                    additionally you may have a radio pager which send a tone followed by a voice message with details
                    of the type of emergency, locations and the units requested to respond. </p>
               
                <form id="formVolunteer" runat="server">
      
                   <h3>Provide the Following Information:</h3> 
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="Label1" runat="server">Enter your First Name:</asp:Label>
                            </td>
                            <td colspan="2">
                                <asp:TextBox runat="server" ID="fname" />
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                                      ControlToValidate="fname"
                                      ErrorMessage="First name is a required field."
                                      ForeColor="Red" Font-Size="Small">
                                    </asp:RequiredFieldValidator>
                            </td>
                        </tr>
                         <tr>
                            <td>
                                <asp:Label ID="Label2" runat="server">Enter your Last Name:</asp:Label>
                            </td>
                            <td colspan="2">
                               <asp:TextBox runat="server" ID="lname"/>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                      ControlToValidate="lname"
                                      ErrorMessage="Last name is a required field."
                                      ForeColor="Red" Display="Dynamic" Font-Size="Small"> 
                                    </asp:RequiredFieldValidator>
                            </td>
                        </tr>

                         <tr>
                            <td>
                                <asp:Label ID="Label3" runat="server">Enter your Phone Number:</asp:Label>
                            </td>
                             
                            <td colspan="2">
                                <asp:TextBox runat="server" ID="phone" Placeholder ="***-***-****" />
                                  <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                                      ErrorMessage="Enter valid Phone number." 
                                      ForeColor="Red" Display="Dynamic" 
                                      ControlToValidate="phone" 
                                      ValidationExpression="^[01]?[- .]?(\([2-9]\d{2}\)|[2-9]\d{2})[- .]?\d{3}[- .]?\d{4}$"></asp:RegularExpressionValidator>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                      ControlToValidate="phone"
                                      ErrorMessage="Phone # is a required field."
                                      ForeColor="Red" Display="Dynamic" Font-Size="Small"> 
                                    </asp:RequiredFieldValidator>
                            </td>
                        </tr>

                         <tr>
                            <td>
                               <asp:Label ID="Label4" runat="server">Enter your E-mail:</asp:Label>
                            </td>
                            <td colspan="2">
                                <asp:TextBox runat="server" ID="email" />
                                 <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                                     ErrorMessage="Enter valid email."
                                     ForeColor="Red" Display="Dynamic" 
                                     ControlToValidate="email"
                                     ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$"></asp:RegularExpressionValidator>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                      ControlToValidate="email"
                                      ErrorMessage="E-mail is a required field."
                                      ForeColor="Red" Display="Dynamic" Font-Size="Small"> 
                                    </asp:RequiredFieldValidator>
                            </td>
                        </tr>

                         <tr>
                            <td>
                               <asp:Label ID="Label5" runat="server">What is the preferred Method of Contacting you?</asp:Label>
                            </td>
                            <td colspan="2">
                                <asp:DropDownList runat="server" ID="ddlThings" 
                                        AutoPostBack ="true" width="142px" 
                                        OnSelectedIndexChanged ="ddlThings_SelectedIndexChanged" />
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                                         ValidationGroup="YourValGroup" ControlToValidate="ddlThings"
                                         ErrorMessage="Make Selection" InitialValue="Please select" 
                                         ForeColor="Red" Display="Dynamic">
                                     </asp:RequiredFieldValidator>
                            </td>
                        </tr>

                         <tr>
                            <td>

                                    <asp:Panel runat="server" ID ="Showtime" Visible="false">
                                    What is the best Time to call you? </asp:Panel>
                                </td>
                            <td colspan="2"> 
                           
                                <asp:DropDownList runat="server" ID="ddlbesttime" Visible="false" />
                            </td>  

                        </tr>

                    </table>
                    <asp:button runat="server" name="BtnSubmit" ID="BtnSubmit" onclick="BtnSubmit_Click" Text="SUBMIT HERE" BackColor= "#ed5319" Font-Bold="True" Height="40px" Width="160px" /> <br />

                    </form> 
                <p>
                    <asp:Label runat="server" ID="lblID" /> 
                 </p>
            </div>
            <div id="right">
			<h1>AVAILABLE MEETINGS</h1>
                <div id="divMeetings" runat="server">
                    
                </div>
            </div>
        </main>
           
     <footer>
        <p id="adress">1000 Avenue Of the Americas, New York, NY 10010  |  Copyright &copy; 2018 Conqueror Hook and Ladder</p><br />
	</footer>
    </div>
          

</body>
</html>