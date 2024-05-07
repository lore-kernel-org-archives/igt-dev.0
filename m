Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CE6AC19F4F
	for <igt-dev@archiver.kernel.org>; Tue,  7 May 2024 19:55:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0856910FBE8;
	Tue,  7 May 2024 19:55:23 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2767910FBE8;
 Tue,  7 May 2024 19:55:21 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6127212754457016947=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/intel/kms=5Fbig=5Ffb=3A_?=
 =?utf-8?q?Fix_width_calculation_while_creating_the_intel_buf?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinod Govindapillai" <vinod.govindapillai@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 07 May 2024 19:55:21 -0000
Message-ID: <171511172115.1963161.15318412806431206700@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240507123026.57575-1-vinod.govindapillai@intel.com>
In-Reply-To: <20240507123026.57575-1-vinod.govindapillai@intel.com>
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

--===============6127212754457016947==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/kms_big_fb: Fix width calculation while creating the intel buf
URL   : https://patchwork.freedesktop.org/series/133277/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7838_BAT -> XEIGTPW_11107_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_7838 -> IGTPW_11107
  * Linux: xe-1248-0acac79849c88161fcceb75fdc56a438fa158324 -> xe-1250-9ba3c5b827bb4ad0418a182a5e0064edb6196820

  IGTPW_11107: f566b8a50f672e7e9d2163c20701a87bb251964a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7838: 155628bc9d0ee70c67c3612462a62f095609f152 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1248-0acac79849c88161fcceb75fdc56a438fa158324: 0acac79849c88161fcceb75fdc56a438fa158324
  xe-1250-9ba3c5b827bb4ad0418a182a5e0064edb6196820: 9ba3c5b827bb4ad0418a182a5e0064edb6196820

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11107/index.html

--===============6127212754457016947==
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
<tr><td><b>Series:</b></td><td>tests/intel/kms_big_fb: Fix width calculation while creating the intel buf</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/133277/">https://patchwork.freedesktop.org/series/133277/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11107/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11107/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7838_BAT -&gt; XEIGTPW_11107_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7838 -&gt; IGTPW_11107</li>
<li>Linux: xe-1248-0acac79849c88161fcceb75fdc56a438fa158324 -&gt; xe-1250-9ba3c5b827bb4ad0418a182a5e0064edb6196820</li>
</ul>
<p>IGTPW_11107: f566b8a50f672e7e9d2163c20701a87bb251964a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7838: 155628bc9d0ee70c67c3612462a62f095609f152 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1248-0acac79849c88161fcceb75fdc56a438fa158324: 0acac79849c88161fcceb75fdc56a438fa158324<br />
  xe-1250-9ba3c5b827bb4ad0418a182a5e0064edb6196820: 9ba3c5b827bb4ad0418a182a5e0064edb6196820</p>

</body>
</html>

--===============6127212754457016947==--
