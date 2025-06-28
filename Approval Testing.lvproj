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
		<Item Name="Extensions" Type="Folder">
			<Item Name="Caraya.Extension.lvlib" Type="Library" URL="../Source/Extensions/Caraya.Extension/Caraya.Extension.lvlib"/>
			<Item Name="LUnit.Extension.lvlib" Type="Library" URL="../Source/Extensions/LUnit.Extension/LUnit.Extension.lvlib"/>
			<Item Name="VITester.Extension.lvlib" Type="Library" URL="../Source/Extensions/VITester.Extension/VITester.Extension.lvlib"/>
		</Item>
		<Item Name="Tests" Type="Folder">
			<Item Name="Common" Type="Folder">
				<Item Name="Person" Type="Folder">
					<Item Name="Person.lvclass" Type="LVClass" URL="../Tests/Common/Person/Person.lvclass"/>
				</Item>
				<Item Name="Class Roster Cluster--constant.vi" Type="VI" URL="../Tests/Common/Class Roster Cluster--constant.vi">
					<Property Name="marked" Type="Int">0</Property>
				</Item>
				<Item Name="MultiCombo.vi" Type="VI" URL="../Tests/Common/MultiCombo.vi">
					<Property Name="marked" Type="Int">0</Property>
				</Item>
				<Item Name="MyAnd.vi" Type="VI" URL="../Tests/Common/MyAnd.vi">
					<Property Name="marked" Type="Int">0</Property>
				</Item>
				<Item Name="Scripting Replace Message.vi" Type="VI" URL="../Tests/Common/Scripting Replace Message.vi">
					<Property Name="marked" Type="Int">0</Property>
				</Item>
				<Item Name="Scripting Start.vi" Type="VI" URL="../Tests/Common/Scripting Start.vi">
					<Property Name="marked" Type="Int">0</Property>
				</Item>
				<Item Name="VI to Verify.vi" Type="VI" URL="../Tests/Common/VI to Verify.vi">
					<Property Name="marked" Type="Int">0</Property>
				</Item>
			</Item>
			<Item Name="Caraya Extension Tests.lvclass" Type="LVClass" URL="../Tests/Caraya.Tests/Caraya Extension Tests/Caraya Extension Tests.lvclass"/>
			<Item Name="LUnit Extensions Tests.lvclass" Type="LVClass" URL="../Tests/LUnit.Tests/LUnit Extensions Tests/LUnit Extensions Tests.lvclass"/>
			<Item Name="Scrubber.Tests.lvclass" Type="LVClass" URL="../Tests/Scrubber.Tests/Scrubber.Tests.lvclass"/>
			<Item Name="VITester Extension Tests.lvclass" Type="LVClass" URL="../Tests/VITester.Tests/VITester Extension Tests/VITester Extension Tests.lvclass"/>
			<Item Name="Basic.Mechanics.Tests.lvclass" Type="LVClass" URL="../Tests/Basic.Mechanics.Tests/Basic.Mechanics.Tests.lvclass"/>
			<Item Name="Error.Propagation.Tests.lvclass" Type="LVClass" URL="../Tests/Error.Propagation.Tests/Error.Propagation.Tests.lvclass"/>
			<Item Name="Namer.Tests.lvclass" Type="LVClass" URL="../Tests/Namer.Tests/Namer.Tests.lvclass"/>
		</Item>
		<Item Name="astemes-string-diff-utils" Type="Folder">
			<Item Name="Find All Highlights.vi" Type="VI" URL="../Source/astemes-string-diff-utils/source/Find All Highlights.vi"/>
			<Item Name="Find Highlights.vi" Type="VI" URL="../Source/astemes-string-diff-utils/source/Find Highlights.vi"/>
			<Item Name="Diff Tool.vi" Type="VI" URL="../Source/astemes-string-diff-utils/source/Diff Tool.vi"/>
			<Item Name="Find Common Chars.vi" Type="VI" URL="../Source/astemes-string-diff-utils/source/Find Common Chars.vi"/>
			<Item Name="Find Added Sections.vi" Type="VI" URL="../Source/astemes-string-diff-utils/source/Find Added Sections.vi"/>
		</Item>
		<Item Name="Approval Tests.lvlib" Type="Library" URL="../Source/Approval Tests/Approval Tests.lvlib"/>
		<Item Name="Dependencies" Type="Dependencies"/>
		<Item Name="Build Specifications" Type="Build"/>
	</Item>
</Project>
