<?xml version='1.0' encoding='UTF-8'?>
<Project Type="Project" LVVersion="20008000">
	<Property Name="NI.LV.All.SaveVersion" Type="Str">25.0</Property>
	<Property Name="NI.LV.All.SourceOnly" Type="Bool">true</Property>
	<Item Name="My Computer" Type="My Computer">
		<Property Name="NI.SortType" Type="Int">3</Property>
		<Property Name="server.app.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.control.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.tcp.enabled" Type="Bool">false</Property>
		<Property Name="server.tcp.port" Type="Int">0</Property>
		<Property Name="server.tcp.serviceName" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.tcp.serviceName.default" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.vi.callsEnabled" Type="Bool">true</Property>
		<Property Name="server.vi.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="specify.custom.address" Type="Bool">false</Property>
		<Item Name="Common" Type="Folder" URL="../Common">
			<Property Name="NI.DISK" Type="Bool">true</Property>
		</Item>
		<Item Name="Keep" Type="Folder">
			<Item Name="Comparator Tests.lvclass" Type="LVClass" URL="../Comparator Tests/Comparator Tests.lvclass"/>
			<Item Name="Core Library Error Propagation.lvclass" Type="LVClass" URL="../Core Library Error Propagation/Core Library Error Propagation.lvclass"/>
			<Item Name="Date Regex Finder Tests.lvclass" Type="LVClass" URL="../Date Regex Finder Tests/Date Regex Finder Tests.lvclass"/>
			<Item Name="Scrubber Tests.lvclass" Type="LVClass" URL="../Scrubber Tests/Scrubber Tests.lvclass"/>
			<Item Name="Basic Mechanics Tests.lvclass" Type="LVClass" URL="../Basic Mechanics Tests/Basic Mechanics Tests.lvclass"/>
		</Item>
		<Item Name="Namer.Tests.lvclass" Type="LVClass" URL="../Namer.Tests/Namer.Tests.lvclass"/>
		<Item Name="Dependencies" Type="Dependencies"/>
		<Item Name="Build Specifications" Type="Build"/>
	</Item>
</Project>
