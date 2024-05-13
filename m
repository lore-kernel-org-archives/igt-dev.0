Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CFD7C25B78
	for <igt-dev@archiver.kernel.org>; Mon, 13 May 2024 22:39:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0BEB10E263;
	Mon, 13 May 2024 22:39:43 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5298B10E21C;
 Mon, 13 May 2024 22:39:43 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7045102383760462711=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_series_starting_with_=5Bi-g-t?=
 =?utf-8?q?=2C1/3=5D_tests/intel/xe=5Fpm=3A_Rename_and_clarify_mocs=5Fsuspen?=
 =?utf-8?q?d=5Fresume?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 13 May 2024 22:39:43 -0000
Message-ID: <171563998333.2095830.5262111113354210524@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240513162435.952578-1-lucas.demarchi@intel.com>
In-Reply-To: <20240513162435.952578-1-lucas.demarchi@intel.com>
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

--===============7045102383760462711==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/3] tests/intel/xe_pm: Rename and clarify mocs_suspend_resume
URL   : https://patchwork.freedesktop.org/series/133562/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7850_BAT -> XEIGTPW_11135_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_7850 -> IGTPW_11135
  * Linux: xe-1280-3d00e04692d45ab076e9e493252361bb18373a0e -> xe-1281-5f823e6608065c42909c6a41adc7ff448cbfbfc5

  IGTPW_11135: 0cbcb9a97b616168c1ac621e9ecde25f2286364f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7850: 7850
  xe-1280-3d00e04692d45ab076e9e493252361bb18373a0e: 3d00e04692d45ab076e9e493252361bb18373a0e
  xe-1281-5f823e6608065c42909c6a41adc7ff448cbfbfc5: 5f823e6608065c42909c6a41adc7ff448cbfbfc5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/index.html

--===============7045102383760462711==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/3] tests/intel/xe_pm: Rename and clarify mocs_suspend_resume</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/133562/">https://patchwork.freedesktop.org/series/133562/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11135/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7850_BAT -&gt; XEIGTPW_11135_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7850 -&gt; IGTPW_11135</li>
<li>Linux: xe-1280-3d00e04692d45ab076e9e493252361bb18373a0e -&gt; xe-1281-5f823e6608065c42909c6a41adc7ff448cbfbfc5</li>
</ul>
<p>IGTPW_11135: 0cbcb9a97b616168c1ac621e9ecde25f2286364f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7850: 7850<br />
  xe-1280-3d00e04692d45ab076e9e493252361bb18373a0e: 3d00e04692d45ab076e9e493252361bb18373a0e<br />
  xe-1281-5f823e6608065c42909c6a41adc7ff448cbfbfc5: 5f823e6608065c42909c6a41adc7ff448cbfbfc5</p>

</body>
</html>

--===============7045102383760462711==--
