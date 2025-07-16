Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8370C83F22
	for <igt-dev@archiver.kernel.org>; Wed, 16 Jul 2025 19:35:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E4B710E117;
	Wed, 16 Jul 2025 19:35:16 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CB2910E117;
 Wed, 16 Jul 2025 19:35:15 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2950942440297125185=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Runner=3A_report_test_comma?=
 =?utf-8?q?nd_line?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 16 Jul 2025 19:35:15 -0000
Message-ID: <175269451536.167926.13017340672045422405@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250716153102.165779-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20250716153102.165779-1-kamil.konieczny@linux.intel.com>
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

--===============2950942440297125185==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Runner: report test command line
URL   : https://patchwork.freedesktop.org/series/151715/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8462_BAT -> XEIGTPW_13485_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_13485_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_module_load@load:
    - bat-dg2-oem2:       [PASS][1] -> [ABORT][2] ([Intel XE#4966])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8462/bat-dg2-oem2/igt@xe_module_load@load.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13485/bat-dg2-oem2/igt@xe_module_load@load.html

  
  [Intel XE#4966]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4966


Build changes
-------------

  * IGT: IGT_8462 -> IGTPW_13485

  IGTPW_13485: d94db573e51a7b7d5f8d32e897966761b1c987c8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8462: f33a311145a889757f45313d2ff4bf58f7ef01d6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3423-3b965bd54a93adbf5520b143254ecb10b9a11776: 3b965bd54a93adbf5520b143254ecb10b9a11776

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13485/index.html

--===============2950942440297125185==
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
<tr><td><b>Series:</b></td><td>Runner: report test command line</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/151715/">https://patchwork.freedesktop.org/series/151715/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13485/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13485/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8462_BAT -&gt; XEIGTPW_13485_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13485_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8462/bat-dg2-oem2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13485/bat-dg2-oem2/igt@xe_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4966">Intel XE#4966</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8462 -&gt; IGTPW_13485</li>
</ul>
<p>IGTPW_13485: d94db573e51a7b7d5f8d32e897966761b1c987c8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8462: f33a311145a889757f45313d2ff4bf58f7ef01d6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3423-3b965bd54a93adbf5520b143254ecb10b9a11776: 3b965bd54a93adbf5520b143254ecb10b9a11776</p>

</body>
</html>

--===============2950942440297125185==--
