Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F488CCF9FA
	for <igt-dev@archiver.kernel.org>; Fri, 31 Oct 2025 09:46:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCCCF10EAE5;
	Fri, 31 Oct 2025 09:46:01 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01D1110EAE5;
 Fri, 31 Oct 2025 09:46:00 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8934986613933714896=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Add_new_test_to_validate_ad?=
 =?utf-8?q?aptive_sharpness_filter_=28rev15=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Swati Sharma" <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 31 Oct 2025 09:45:59 -0000
Message-ID: <176190395999.4050.4606254393834142897@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251031080534.880321-1-swati2.sharma@intel.com>
In-Reply-To: <20251031080534.880321-1-swati2.sharma@intel.com>
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

--===============8934986613933714896==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add new test to validate adaptive sharpness filter (rev15)
URL   : https://patchwork.freedesktop.org/series/130218/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8604_BAT -> XEIGTPW_13969_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_13969_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-plain-flip@a-edp1:
    - bat-adlp-7:         [PASS][1] -> [DMESG-WARN][2] ([Intel XE#4543]) +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8604/bat-adlp-7/igt@kms_flip@basic-plain-flip@a-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13969/bat-adlp-7/igt@kms_flip@basic-plain-flip@a-edp1.html

  
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543


Build changes
-------------

  * IGT: IGT_8604 -> IGTPW_13969
  * Linux: xe-4017-31f6cf867833cb67c289427c7cfe00d35d0fd340 -> xe-4018-fbd719e0eb058dd8b23a734e199f52e81cd9f267

  IGTPW_13969: 9fa3fedd2b38965def38e413f373c5af176338e1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8604: 8604
  xe-4017-31f6cf867833cb67c289427c7cfe00d35d0fd340: 31f6cf867833cb67c289427c7cfe00d35d0fd340
  xe-4018-fbd719e0eb058dd8b23a734e199f52e81cd9f267: fbd719e0eb058dd8b23a734e199f52e81cd9f267

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13969/index.html

--===============8934986613933714896==
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
<tr><td><b>Series:</b></td><td>Add new test to validate adaptive sharpness filter (rev15)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/130218/">https://patchwork.freedesktop.org/series/130218/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13969/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13969/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8604_BAT -&gt; XEIGTPW_13969_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13969_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_flip@basic-plain-flip@a-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8604/bat-adlp-7/igt@kms_flip@basic-plain-flip@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13969/bat-adlp-7/igt@kms_flip@basic-plain-flip@a-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8604 -&gt; IGTPW_13969</li>
<li>Linux: xe-4017-31f6cf867833cb67c289427c7cfe00d35d0fd340 -&gt; xe-4018-fbd719e0eb058dd8b23a734e199f52e81cd9f267</li>
</ul>
<p>IGTPW_13969: 9fa3fedd2b38965def38e413f373c5af176338e1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8604: 8604<br />
  xe-4017-31f6cf867833cb67c289427c7cfe00d35d0fd340: 31f6cf867833cb67c289427c7cfe00d35d0fd340<br />
  xe-4018-fbd719e0eb058dd8b23a734e199f52e81cd9f267: fbd719e0eb058dd8b23a734e199f52e81cd9f267</p>

</body>
</html>

--===============8934986613933714896==--
