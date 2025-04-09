Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5798EC36010
	for <igt-dev@archiver.kernel.org>; Wed,  9 Apr 2025 03:38:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0164510E27D;
	Wed,  9 Apr 2025 03:38:58 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 853CA10E146;
 Wed,  9 Apr 2025 03:38:57 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3768933376188204009=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fsysfs=5Fsc?=
 =?utf-8?q?heduler=3A_Add_invalid_string_test_for_engine_sysfs_properties_?=
 =?utf-8?q?=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sobin Thomas" <sobin.thomas@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 09 Apr 2025 03:38:57 -0000
Message-ID: <174416993753.50698.995998088217585595@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250409022217.2292395-1-sobin.thomas@intel.com>
In-Reply-To: <20250409022217.2292395-1-sobin.thomas@intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

--===============3768933376188204009==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_sysfs_scheduler: Add invalid string test for engine sysfs properties (rev3)
URL   : https://patchwork.freedesktop.org/series/147056/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8311_BAT -> XEIGTPW_12945_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_12945_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_basic@twice-bindexecqueue-rebind:
    - bat-adlp-vf:        [PASS][1] -> [ABORT][2] ([Intel XE#3970])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8311/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12945/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html

  
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970


Build changes
-------------

  * IGT: IGT_8311 -> IGTPW_12945
  * Linux: xe-2911-a33da369e8cde6c7208381a592866cd61f1ce188 -> xe-2921-a49a4787e6bc70296204f4a6e1b0fed3759938cd

  IGTPW_12945: d71b68cb6dc833d13cd4dc88d42aaa265a8aa6e7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8311: 851a9c1cb1a690d8c527f26c49c250ec583af65e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2911-a33da369e8cde6c7208381a592866cd61f1ce188: a33da369e8cde6c7208381a592866cd61f1ce188
  xe-2921-a49a4787e6bc70296204f4a6e1b0fed3759938cd: a49a4787e6bc70296204f4a6e1b0fed3759938cd

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12945/index.html

--===============3768933376188204009==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <title>Project List - Patchwork</title>
  <style id="css-table-select" type="text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>tests/intel/xe_sysfs_scheduler: Add invalid string test for engine sysfs properties (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/147056/">https://patchwork.freedesktop.org/series/147056/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12945/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12945/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8311_BAT -&gt; XEIGTPW_12945_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12945_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_exec_basic@twice-bindexecqueue-rebind:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8311/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12945/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8311 -&gt; IGTPW_12945</li>
<li>Linux: xe-2911-a33da369e8cde6c7208381a592866cd61f1ce188 -&gt; xe-2921-a49a4787e6bc70296204f4a6e1b0fed3759938cd</li>
</ul>
<p>IGTPW_12945: d71b68cb6dc833d13cd4dc88d42aaa265a8aa6e7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8311: 851a9c1cb1a690d8c527f26c49c250ec583af65e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2911-a33da369e8cde6c7208381a592866cd61f1ce188: a33da369e8cde6c7208381a592866cd61f1ce188<br />
  xe-2921-a49a4787e6bc70296204f4a6e1b0fed3759938cd: a49a4787e6bc70296204f4a6e1b0fed3759938cd</p>

</body>
</html>

--===============3768933376188204009==--
