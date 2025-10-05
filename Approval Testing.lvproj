<?xml version='1.0' encoding='UTF-8'?>
<Project Type="Project" LVVersion="20008000">
	<Property Name="NI.LV.All.SaveVersion" Type="Str">20.0</Property>
	<Property Name="NI.LV.All.SourceOnly" Type="Bool">true</Property>
	<Property Name="NI.Project.Description" Type="Str"></Property>
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
		<Item Name="astemes-string-diff-utils" Type="Folder">
			<Item Name="Find All Highlights.vi" Type="VI" URL="../Source/astemes-string-diff-utils/source/Find All Highlights.vi"/>
			<Item Name="Find Highlights.vi" Type="VI" URL="../Source/astemes-string-diff-utils/source/Find Highlights.vi"/>
			<Item Name="Diff Tool.vi" Type="VI" URL="../Source/astemes-string-diff-utils/source/Diff Tool.vi"/>
			<Item Name="Find Common Chars.vi" Type="VI" URL="../Source/astemes-string-diff-utils/source/Find Common Chars.vi"/>
			<Item Name="Find Added Sections.vi" Type="VI" URL="../Source/astemes-string-diff-utils/source/Find Added Sections.vi"/>
		</Item>
		<Item Name="Other Relevant Projects" Type="Folder">
			<Item Name="Extensions.lvproj" Type="Document" URL="../Source/Extensions/Extensions.lvproj"/>
			<Item Name="Core Library Tests.lvproj" Type="Document" URL="../Tests/Core Library Tests.lvproj"/>
			<Item Name="Extension Tests.lvproj" Type="Document" URL="../Tests/Extension Tests.lvproj"/>
		</Item>
		<Item Name="Approval Tests.lvlib" Type="Library" URL="../Source/Approval Tests/Approval Tests.lvlib"/>
		<Item Name="Dependencies" Type="Dependencies"/>
		<Item Name="Build Specifications" Type="Build"/>
	</Item>
</Project>
