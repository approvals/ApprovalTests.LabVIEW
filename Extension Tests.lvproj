<?xml version='1.0' encoding='UTF-8'?>
<Project Type="Project" LVVersion="26008000">
	<Property Name="NI.LV.All.SaveVersion" Type="Str">Editor version</Property>
	<Property Name="NI.LV.All.SourceOnly" Type="Bool">true</Property>
	<Property Name="NI.Project.Description" Type="Str"></Property>
	<Item Name="My Computer" Type="My Computer">
		<Property Name="server.app.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.control.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.tcp.enabled" Type="Bool">false</Property>
		<Property Name="server.tcp.port" Type="Int">0</Property>
		<Property Name="server.tcp.serviceName" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.tcp.serviceName.default" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.vi.callsEnabled" Type="Bool">true</Property>
		<Property Name="server.vi.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="specify.custom.address" Type="Bool">false</Property>
		<Item Name="Common" Type="Folder" URL="../Tests/Common">
			<Property Name="NI.DISK" Type="Bool">true</Property>
		</Item>
		<Item Name="Extensions.Approved.Files" Type="Folder">
			<Item Name="Verify AND Combos.approved.txt" Type="Document" URL="../Tests/Extensions.Approved.Files/Verify AND Combos.approved.txt"/>
			<Item Name="Verify AND Parameterized.approved.txt" Type="Document" URL="../Tests/Extensions.Approved.Files/Verify AND Parameterized.approved.txt"/>
			<Item Name="Verify Class Roster as JSON.approved.json" Type="Document" URL="../Tests/Extensions.Approved.Files/Verify Class Roster as JSON.approved.json"/>
			<Item Name="Verify Class Roster.approved.txt" Type="Document" URL="../Tests/Extensions.Approved.Files/Verify Class Roster.approved.txt"/>
			<Item Name="Verify CLI Echo Hello World.approved.txt" Type="Document" URL="../Tests/Extensions.Approved.Files/Verify CLI Echo Hello World.approved.txt"/>
			<Item Name="Verify CLI STD ERR.Linux.approved.txt" Type="Document" URL="../Tests/Extensions.Approved.Files/Verify CLI STD ERR.Linux.approved.txt"/>
			<Item Name="Verify CLI STD ERR.Win.approved.txt" Type="Document" URL="../Tests/Extensions.Approved.Files/Verify CLI STD ERR.Win.approved.txt"/>
			<Item Name="Verify Hello World.approved.txt" Type="Document" URL="../Tests/Extensions.Approved.Files/Verify Hello World.approved.txt"/>
			<Item Name="Verify Multi Combos.approved.txt" Type="Document" URL="../Tests/Extensions.Approved.Files/Verify Multi Combos.approved.txt"/>
			<Item Name="Verify Person as JSON.approved.json" Type="Document" URL="../Tests/Extensions.Approved.Files/Verify Person as JSON.approved.json"/>
			<Item Name="Verify Person.approved.txt" Type="Document" URL="../Tests/Extensions.Approved.Files/Verify Person.approved.txt"/>
		</Item>
		<Item Name="Caraya Extension Tests.lvclass" Type="LVClass" URL="../Tests/Caraya.Tests/Caraya Extension Tests/Caraya Extension Tests.lvclass"/>
		<Item Name="Error.Propagation.Tests.lvclass" Type="LVClass" URL="../Tests/Error.Propagation.Tests/Error.Propagation.Tests.lvclass"/>
		<Item Name="LUnit Extensions Tests.lvclass" Type="LVClass" URL="../Tests/LUnit.Tests/LUnit Extensions Tests/LUnit Extensions Tests.lvclass"/>
		<Item Name="Dependencies" Type="Dependencies"/>
		<Item Name="Build Specifications" Type="Build"/>
	</Item>
</Project>
