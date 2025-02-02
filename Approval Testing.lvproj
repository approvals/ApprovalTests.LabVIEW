<?xml version='1.0' encoding='UTF-8'?>
<Project Type="Project" LVVersion="20008000">
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
		</Item>
		<Item Name="astemes-string-diff-utils" Type="Folder">
			<Item Name="Find All Highlights.vi" Type="VI" URL="../astemes-string-diff-utils/source/Find All Highlights.vi"/>
			<Item Name="Find Highlights.vi" Type="VI" URL="../astemes-string-diff-utils/source/Find Highlights.vi"/>
			<Item Name="Diff Tool.vi" Type="VI" URL="../astemes-string-diff-utils/source/Diff Tool.vi"/>
			<Item Name="Find Common Chars.vi" Type="VI" URL="../astemes-string-diff-utils/source/Find Common Chars.vi"/>
			<Item Name="Find Added Sections.vi" Type="VI" URL="../astemes-string-diff-utils/source/Find Added Sections.vi"/>
			<Item Name="Find Index to Insert at.vi" Type="VI" URL="../astemes-string-diff-utils/tests/Diff Tool Test/Find Index to Insert at.vi"/>
		</Item>
		<Item Name="Approval Tests.lvlib" Type="Library" URL="../Source/Approval Tests/Approval Tests.lvlib"/>
		<Item Name="Dependencies" Type="Dependencies">
			<Item Name="vi.lib" Type="Folder">
				<Item Name="1D String Array to Delimited String.vi" Type="VI" URL="/&lt;vilib&gt;/AdvancedString/1D String Array to Delimited String.vi">
					<Property Name="marked" Type="Int">0</Property>
				</Item>
				<Item Name="Assert Complex Numeric Type.vim" Type="VI" URL="/&lt;vilib&gt;/Utility/TypeAssert/Assert Complex Numeric Type.vim">
					<Property Name="marked" Type="Int">0</Property>
				</Item>
				<Item Name="Assert Fixed-Point Numeric Type.vim" Type="VI" URL="/&lt;vilib&gt;/Utility/TypeAssert/Assert Fixed-Point Numeric Type.vim">
					<Property Name="marked" Type="Int">0</Property>
				</Item>
				<Item Name="Assert Floating-Point Numeric Type.vim" Type="VI" URL="/&lt;vilib&gt;/Utility/TypeAssert/Assert Floating-Point Numeric Type.vim">
					<Property Name="marked" Type="Int">0</Property>
				</Item>
				<Item Name="Assert Integer Type.vim" Type="VI" URL="/&lt;vilib&gt;/Utility/TypeAssert/Assert Integer Type.vim">
					<Property Name="marked" Type="Int">0</Property>
				</Item>
				<Item Name="Assert Real Floating-Point Numeric Type.vim" Type="VI" URL="/&lt;vilib&gt;/Utility/TypeAssert/Assert Real Floating-Point Numeric Type.vim">
					<Property Name="marked" Type="Int">0</Property>
				</Item>
				<Item Name="Base64 Support.lvlib" Type="Library" URL="/&lt;vilib&gt;/JDP Science/JDP Science Common Utilities/Base64/Base64 Support.lvlib"/>
				<Item Name="Check if File or Folder Exists.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Check if File or Folder Exists.vi">
					<Property Name="marked" Type="Int">0</Property>
				</Item>
				<Item Name="Clear Errors.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Clear Errors.vi">
					<Property Name="marked" Type="Int">0</Property>
				</Item>
				<Item Name="Error Cluster From Error Code.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Error Cluster From Error Code.vi">
					<Property Name="marked" Type="Int">0</Property>
				</Item>
				<Item Name="Generate Temporary File Path.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Generate Temporary File Path.vi">
					<Property Name="marked" Type="Int">0</Property>
				</Item>
				<Item Name="Generic Object Serializer.lvclass" Type="LVClass" URL="/&lt;vilib&gt;/PNR/JSONtext Object Serialization/Generic Object Serializer/Generic Object Serializer.lvclass"/>
				<Item Name="Get File Extension.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Get File Extension.vi">
					<Property Name="marked" Type="Int">0</Property>
				</Item>
				<Item Name="Get GObject Label.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/traverseref.llb/Get GObject Label.vi">
					<Property Name="marked" Type="Int">0</Property>
				</Item>
				<Item Name="Get LV Class Name.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/LVClass/Get LV Class Name.vi">
					<Property Name="marked" Type="Int">0</Property>
				</Item>
				<Item Name="Get LV Class Path.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/LVClass/Get LV Class Path.vi">
					<Property Name="marked" Type="Int">0</Property>
				</Item>
				<Item Name="JDP Timestamp.lvlib" Type="Library" URL="/&lt;vilib&gt;/JDP Science/JDP Science Common Utilities/Timestamp/JDP Timestamp.lvlib"/>
				<Item Name="JDP Utility.lvlib" Type="Library" URL="/&lt;vilib&gt;/JDP Science/JDP Science Common Utilities/JDP Utility.lvlib"/>
				<Item Name="JSONtext LVClass Serializer.lvclass" Type="LVClass" URL="/&lt;vilib&gt;/JDP Science/JSONtext/LVClass Serializer/JSONtext LVClass Serializer.lvclass"/>
				<Item Name="JSONtext.lvlib" Type="Library" URL="/&lt;vilib&gt;/JDP Science/JSONtext/JSONtext.lvlib"/>
				<Item Name="LUnit Runnable.lvclass" Type="LVClass" URL="/&lt;vilib&gt;/Astemes/LUnit/LUnit Runnable.lvclass"/>
				<Item Name="LVNumericRepresentation.ctl" Type="VI" URL="/&lt;vilib&gt;/numeric/LVNumericRepresentation.ctl">
					<Property Name="marked" Type="Int">0</Property>
				</Item>
				<Item Name="NI_Bit Manipulation.lvlib" Type="Library" URL="/&lt;vilib&gt;/Bit Manipulation/NI_Bit Manipulation.lvlib"/>
				<Item Name="NI_Data Type.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/Data Type/NI_Data Type.lvlib"/>
				<Item Name="NI_FileType.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/lvfile.llb/NI_FileType.lvlib"/>
				<Item Name="NI_Keccak.lvlib" Type="Library" URL="/&lt;vilib&gt;/security/Message Digest/Keccak/NI_Keccak.lvlib"/>
				<Item Name="NI_Message Digest API.lvlib" Type="Library" URL="/&lt;vilib&gt;/security/Message Digest/API/NI_Message Digest API.lvlib"/>
				<Item Name="NI_PackedLibraryUtility.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/LVLibp/NI_PackedLibraryUtility.lvlib"/>
				<Item Name="NI_SCC.lvlib" Type="Library" URL="/&lt;vilib&gt;/SourceControl/sccapi/NI_SCC.lvlib"/>
				<Item Name="NI_SHA-3.lvclass" Type="LVClass" URL="/&lt;vilib&gt;/security/Message Digest/SHA-3/NI_SHA-3.lvclass"/>
				<Item Name="NI_SHA-256.lvclass" Type="LVClass" URL="/&lt;vilib&gt;/security/Message Digest/SHA-2/SHA-256/NI_SHA-256.lvclass"/>
				<Item Name="NI_SHA-512.lvclass" Type="LVClass" URL="/&lt;vilib&gt;/security/Message Digest/SHA-2/SHA-512/NI_SHA-512.lvclass"/>
				<Item Name="Normalize End Of Line.vi" Type="VI" URL="/&lt;vilib&gt;/AdvancedString/Normalize End Of Line.vi">
					<Property Name="marked" Type="Int">0</Property>
				</Item>
				<Item Name="SCCSup Compare Two VIs.vi" Type="VI" URL="/&lt;vilib&gt;/SourceControl/support/SCCSup Compare Two VIs.vi">
					<Property Name="marked" Type="Int">0</Property>
				</Item>
				<Item Name="SCCSup Lock VI.vi" Type="VI" URL="/&lt;vilib&gt;/SourceControl/support/SCCSup Lock VI.vi">
					<Property Name="marked" Type="Int">0</Property>
				</Item>
				<Item Name="Search and Replace Pattern.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Search and Replace Pattern.vi">
					<Property Name="marked" Type="Int">0</Property>
				</Item>
				<Item Name="Space Constant.vi" Type="VI" URL="/&lt;vilib&gt;/dlg_ctls.llb/Space Constant.vi">
					<Property Name="marked" Type="Int">0</Property>
				</Item>
				<Item Name="System Exec.vi" Type="VI" URL="/&lt;vilib&gt;/Platform/system.llb/System Exec.vi">
					<Property Name="marked" Type="Int">0</Property>
				</Item>
				<Item Name="Test Case.lvclass" Type="LVClass" URL="/&lt;vilib&gt;/Astemes/LUnit/Test Case.lvclass"/>
				<Item Name="Test Suite.lvclass" Type="LVClass" URL="/&lt;vilib&gt;/Astemes/LUnit/Test Suite.lvclass"/>
				<Item Name="TestCase.lvclass" Type="LVClass" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/VI Tester/TestCase.llb/TestCase.lvclass"/>
				<Item Name="TRef Find Object By Label.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/traverseref.llb/TRef Find Object By Label.vi">
					<Property Name="marked" Type="Int">0</Property>
				</Item>
				<Item Name="TRef Traverse.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/traverseref.llb/TRef Traverse.vi">
					<Property Name="marked" Type="Int">0</Property>
				</Item>
				<Item Name="TRef TravTarget.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/traverseref.llb/TRef TravTarget.ctl">
					<Property Name="marked" Type="Int">0</Property>
				</Item>
				<Item Name="Trim Whitespace.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Trim Whitespace.vi">
					<Property Name="marked" Type="Int">0</Property>
				</Item>
				<Item Name="VI Scripting - Traverse.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/traverseref.llb/VI Scripting - Traverse.lvlib"/>
				<Item Name="whitespace.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/whitespace.ctl">
					<Property Name="marked" Type="Int">0</Property>
				</Item>
				<Item Name="Define Test.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/Caraya/classes/Test/Define Test.vi"/>
				<Item Name="Sort 1D Array.vim" Type="VI" URL="/&lt;vilib&gt;/Array/Sort 1D Array.vim"/>
				<Item Name="Less Functor.lvclass" Type="LVClass" URL="/&lt;vilib&gt;/Comparison/Less/Less Functor/Less Functor.lvclass"/>
				<Item Name="Less Comparable.lvclass" Type="LVClass" URL="/&lt;vilib&gt;/Comparison/Less/Less Comparable/Less Comparable.lvclass"/>
				<Item Name="Sort 1D Array Core.vim" Type="VI" URL="/&lt;vilib&gt;/Array/Helpers/Sort 1D Array Core.vim"/>
				<Item Name="Less.vim" Type="VI" URL="/&lt;vilib&gt;/Comparison/Less.vim"/>
				<Item Name="Properties.Assert.lvclass" Type="LVClass" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/Caraya/classes/Properties.Assert/Properties.Assert.lvclass"/>
				<Item Name="Assert.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/Caraya/classes/Assert/Assert.vi"/>
				<Item Name="Assert True.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/Caraya/classes/Assert/Assert True.vi"/>
				<Item Name="array to array of variants.vim" Type="VI" URL="/&lt;vilib&gt;/SAS/Approval Tests/Approval Tests/array to array of variants.vim"/>
				<Item Name="Assert False.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/Caraya/classes/Assert/Assert False.vi"/>
				<Item Name="Assert Equal Value_Variant.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/Caraya/classes/Assert/Assert Equal Value_Variant.vi"/>
				<Item Name="Assert Equal Value and Type_Variant.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_JKI Toolkits/Caraya/classes/Assert/Assert Equal Value and Type_Variant.vi"/>
			</Item>
		</Item>
		<Item Name="Build Specifications" Type="Build"/>
	</Item>
</Project>
