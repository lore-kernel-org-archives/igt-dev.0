Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFF90C369D1
	for <igt-dev@archiver.kernel.org>; Fri, 25 Apr 2025 11:05:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3117710E957;
	Fri, 25 Apr 2025 11:05:32 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCF9510E94C;
 Fri, 25 Apr 2025 11:05:31 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5681089167860802908=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_series_starting_with_=5Bi-g?=
 =?utf-8?q?-t=2Cv2=2C1/2=5D_tests/intel/xe=5Feu=5Fstall=3A_Add_tests_to_run_?=
 =?utf-8?q?blocking_and_non-blocking_read_twice?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Harish Chegondi" <harish.chegondi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 25 Apr 2025 11:05:31 -0000
Message-ID: <174557913190.10677.949458040241780719@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <29f92b276ff8c0a246dc5d22757193bc66f27c66.1745565376.git.harish.chegondi@intel.com>
In-Reply-To: <29f92b276ff8c0a246dc5d22757193bc66f27c66.1745565376.git.harish.chegondi@intel.com>
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

--===============5681089167860802908==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,v2,1/2] tests/intel/xe_eu_stall: Add tests to run blocking and non-blocking read twice
URL   : https://patchwork.freedesktop.org/series/148246/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8337_BAT -> XEIGTPW_13042_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_13042_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_13042_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (8 -> 0)
------------------------------

  ERROR: It appears as if the changes made in XEIGTPW_13042_BAT prevented too many machines from booting.

  Missing    (8): bat-bmg-1 bat-lnl-2 bat-adlp-vf bat-lnl-1 bat-dg2-oem2 bat-atsm-2 bat-bmg-2 bat-adlp-7 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8337 -> IGTPW_13042

  IGTPW_13042: 1b77482d3129cdb32fbb626ccf43624e7ade694f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8337: a5f980e11a5540c1c079cc6fceb2b2d889b5a460 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2997-22d29c516450a3931a8e0b1346ab9f334c19ab9c: 22d29c516450a3931a8e0b1346ab9f334c19ab9c

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13042/index.html

--===============5681089167860802908==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,v2,1/2] tests/intel/xe_eu_stall: Add tests to run blocking and non-blocking read twice</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/148246/">https://patchwork.freedesktop.org/series/148246/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13042/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13042/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8337_BAT -&gt; XEIGTPW_13042_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_13042_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_13042_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (8 -&gt; 0)</h2>
<p>ERROR: It appears as if the changes made in XEIGTPW_13042_BAT prevented too many machines from booting.</p>
<p>Missing    (8): bat-bmg-1 bat-lnl-2 bat-adlp-vf bat-lnl-1 bat-dg2-oem2 bat-atsm-2 bat-bmg-2 bat-adlp-7 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8337 -&gt; IGTPW_13042</li>
</ul>
<p>IGTPW_13042: 1b77482d3129cdb32fbb626ccf43624e7ade694f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8337: a5f980e11a5540c1c079cc6fceb2b2d889b5a460 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2997-22d29c516450a3931a8e0b1346ab9f334c19ab9c: 22d29c516450a3931a8e0b1346ab9f334c19ab9c</p>

</body>
</html>

--===============5681089167860802908==--
