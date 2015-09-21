#CodeBook

#判決結果
<ul>
	<li> loc $判決法院</li>
	<li> judgedate $判決日期</li>
	<li> court_case $判決結果:{勝訴:1,敗訴:0)</li>
</ul>

#家庭背景
<ul>
	<li> duration $結婚年數</li>
	<li> nationality $國籍</li>
</ul>


#離婚原因
<br>
<ul>
  <li>r_dissappear $惡意遺棄、失蹤</li>
  <li>r_violence $家暴、意圖殺害</li>
  <li>r_affair $外遇、重婚</li>
  <li>r_prisoner $徒刑</li>
  <li>r_disorder $不治之惡疾,精神疾病</li>
  <li>r_other $其他原因</li>
</ul>


#孩子扶養
<ul>
	<li> children_num $孩子數</li>
	<li> custody $扶養權:{被告全拿:0,原告全拿:1,原告拿一半:2,遺失值:99}</li>
	<li> caregiver $監護權：{被告全拿:0,原告全拿:1,原告拿一半:2,遺失值:99}</li>
</ul>




#律師
<ul>
	<li>off_lawyer $原告律師數量</li>
	<li>de_lawyer $被告律師數量</li>
</ul>



