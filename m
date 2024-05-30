Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1058C25B7E
	for <igt-dev@archiver.kernel.org>; Thu, 30 May 2024 20:05:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 470E210E678;
	Thu, 30 May 2024 20:05:59 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56C3D10E678;
 Thu, 30 May 2024 20:05:57 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8106661896504423077=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_man=3A_Add_--decode_to_intel?=
 =?utf-8?q?=5Freg=2Erst?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 30 May 2024 20:05:57 -0000
Message-ID: <171709955735.2239183.4883966516622805287@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240530193325.1072381-1-lucas.demarchi@intel.com>
In-Reply-To: <20240530193325.1072381-1-lucas.demarchi@intel.com>
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

--===============8106661896504423077==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: man: Add --decode to intel_reg.rst
URL   : https://patchwork.freedesktop.org/series/134263/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7874_BAT -> XEIGTPW_11210_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_11210_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_11210_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (5 -> 1)
------------------------------

  ERROR: It appears as if the changes made in XEIGTPW_11210_BAT prevented too many machines from booting.

  Missing    (4): bat-adlp-7 bat-dg2-oem2 bat-lnl-1 bat-atsm-2 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_7874 -> IGTPW_11210
  * Linux: xe-1377-bdab4dd15a635eedc4b4d95be9d4155be46e5e4b -> xe-1380-8a03c116f647be54b169f3f5552341488e2df12b

  IGTPW_11210: 11210
  IGT_7874: 4d9b4ee12b5f0852c02818ca9a886355b43fbbff @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1377-bdab4dd15a635eedc4b4d95be9d4155be46e5e4b: bdab4dd15a635eedc4b4d95be9d4155be46e5e4b
  xe-1380-8a03c116f647be54b169f3f5552341488e2df12b: 8a03c116f647be54b169f3f5552341488e2df12b

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11210/index.html

--===============8106661896504423077==
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
<tr><td><b>Series:</b></td><td>man: Add --decode to intel_reg.rst</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/134263/">https://patchwork.freedesktop.org/series/134263/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11210/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11210/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7874_BAT -&gt; XEIGTPW_11210_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_11210_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_11210_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (5 -&gt; 1)</h2>
<p>ERROR: It appears as if the changes made in XEIGTPW_11210_BAT prevented too many machines from booting.</p>
<p>Missing    (4): bat-adlp-7 bat-dg2-oem2 bat-lnl-1 bat-atsm-2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7874 -&gt; IGTPW_11210</li>
<li>Linux: xe-1377-bdab4dd15a635eedc4b4d95be9d4155be46e5e4b -&gt; xe-1380-8a03c116f647be54b169f3f5552341488e2df12b</li>
</ul>
<p>IGTPW_11210: 11210<br />
  IGT_7874: 4d9b4ee12b5f0852c02818ca9a886355b43fbbff @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1377-bdab4dd15a635eedc4b4d95be9d4155be46e5e4b: bdab4dd15a635eedc4b4d95be9d4155be46e5e4b<br />
  xe-1380-8a03c116f647be54b169f3f5552341488e2df12b: 8a03c116f647be54b169f3f5552341488e2df12b</p>

</body>
</html>

--===============8106661896504423077==--
