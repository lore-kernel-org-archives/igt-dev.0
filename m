Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B8E4C25B74
	for <igt-dev@archiver.kernel.org>; Mon, 27 May 2024 22:25:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D96F710F8E7;
	Mon, 27 May 2024 22:25:46 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8921510F8E7;
 Mon, 27 May 2024 22:25:45 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8006412222221073810=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeFULL=3A_failure_for_tests/intel/kms=5Fpm=5Fdc=3A_?=
 =?utf-8?q?Add_a_new_test_to_validate_the_deep_sleep_state_during_extended_v?=
 =?utf-8?q?blank_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jeevan B" <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 27 May 2024 22:25:45 -0000
Message-ID: <171684874555.2213622.16769107418276193001@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240527173948.535894-1-jeevan.b@intel.com>
In-Reply-To: <20240527173948.535894-1-jeevan.b@intel.com>
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

--===============8006412222221073810==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/kms_pm_dc: Add a new test to validate the deep sleep state during extended vblank (rev3)
URL   : https://patchwork.freedesktop.org/series/134058/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7871_full -> XEIGTPW_11199_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_11199_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_11199_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 2)
------------------------------

  Missing    (1): shard-adlp 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_11199_full:

### IGT changes ###

#### Possible regressions ####

  * igt@runner@aborted:
    - shard-dg2-set2:     NOTRUN -> ([FAIL][1], [FAIL][2], [FAIL][3], [FAIL][4], [FAIL][5], [FAIL][6], [FAIL][7], [FAIL][8], [FAIL][9], [FAIL][10], [FAIL][11], [FAIL][12], [FAIL][13], [FAIL][14], [FAIL][15], [FAIL][16], [FAIL][17], [FAIL][18], [FAIL][19], [FAIL][20], [FAIL][21], [FAIL][22], [FAIL][23], [FAIL][24], [FAIL][25])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11199/shard-dg2-435/igt@runner@aborted.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11199/shard-dg2-435/igt@runner@aborted.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11199/shard-dg2-435/igt@runner@aborted.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11199/shard-dg2-466/igt@runner@aborted.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11199/shard-dg2-432/igt@runner@aborted.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11199/shard-dg2-466/igt@runner@aborted.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11199/shard-dg2-432/igt@runner@aborted.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11199/shard-dg2-463/igt@runner@aborted.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11199/shard-dg2-463/igt@runner@aborted.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11199/shard-dg2-432/igt@runner@aborted.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11199/shard-dg2-466/igt@runner@aborted.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11199/shard-dg2-466/igt@runner@aborted.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11199/shard-dg2-463/igt@runner@aborted.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11199/shard-dg2-433/igt@runner@aborted.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11199/shard-dg2-434/igt@runner@aborted.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11199/shard-dg2-434/igt@runner@aborted.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11199/shard-dg2-433/igt@runner@aborted.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11199/shard-dg2-436/igt@runner@aborted.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11199/shard-dg2-464/igt@runner@aborted.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11199/shard-dg2-436/igt@runner@aborted.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11199/shard-dg2-433/igt@runner@aborted.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11199/shard-dg2-464/igt@runner@aborted.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11199/shard-dg2-434/igt@runner@aborted.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11199/shard-dg2-464/igt@runner@aborted.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11199/shard-dg2-436/igt@runner@aborted.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_addfb_basic@bad-pitch-32:
    - {shard-lnl}:        [PASS][26] -> [SKIP][27]
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7871/shard-lnl-2/igt@kms_addfb_basic@bad-pitch-32.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11199/shard-lnl-7/igt@kms_addfb_basic@bad-pitch-32.html

  
New tests
---------

  New tests have been introduced between XEIGT_7871_full and XEIGTPW_11199_full:

### New IGT tests (1) ###

  * igt@kms_pm_dc@deep-pkgc:
    - Statuses :
    - Exec time: [None] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_11199_full that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_cursor_edge_walk@128x128-right-edge:
    - {shard-lnl}:        [FAIL][28] ([Intel XE#581]) -> [PASS][29]
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7871/shard-lnl-6/igt@kms_cursor_edge_walk@128x128-right-edge.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11199/shard-lnl-5/igt@kms_cursor_edge_walk@128x128-right-edge.html

  * igt@kms_pm_dc@dc5-psr:
    - {shard-lnl}:        [ABORT][30] ([Intel XE#1939]) -> [PASS][31] +1 other test pass
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7871/shard-lnl-2/igt@kms_pm_dc@dc5-psr.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11199/shard-lnl-8/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_prop_blob@blob-prop-validate:
    - {shard-lnl}:        [SKIP][32] ([Intel XE#780]) -> [PASS][33]
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7871/shard-lnl-6/igt@kms_prop_blob@blob-prop-validate.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11199/shard-lnl-4/igt@kms_prop_blob@blob-prop-validate.html

  * igt@kms_properties@invalid-properties-legacy:
    - {shard-lnl}:        [SKIP][34] ([Intel XE#1646] / [Intel XE#1650]) -> [PASS][35] +2 other tests pass
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7871/shard-lnl-6/igt@kms_properties@invalid-properties-legacy.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11199/shard-lnl-8/igt@kms_properties@invalid-properties-legacy.html

  * igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidate:
    - {shard-lnl}:        [DMESG-WARN][36] ([Intel XE#1330]) -> [PASS][37]
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7871/shard-lnl-7/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidate.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11199/shard-lnl-7/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_threads@threads-hang-shared-vm-userptr-invalidate:
    - {shard-lnl}:        [INCOMPLETE][38] ([Intel XE#1169] / [Intel XE#1330]) -> [PASS][39]
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7871/shard-lnl-4/igt@xe_exec_threads@threads-hang-shared-vm-userptr-invalidate.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11199/shard-lnl-6/igt@xe_exec_threads@threads-hang-shared-vm-userptr-invalidate.html

  * igt@xe_pm@s2idle-vm-bind-userptr:
    - {shard-lnl}:        [DMESG-WARN][40] ([Intel XE#1595]) -> [PASS][41]
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7871/shard-lnl-2/igt@xe_pm@s2idle-vm-bind-userptr.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11199/shard-lnl-5/igt@xe_pm@s2idle-vm-bind-userptr.html

  * igt@xe_pm_residency@idle-residency:
    - {shard-lnl}:        [FAIL][42] ([Intel XE#1442]) -> [PASS][43]
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7871/shard-lnl-6/igt@xe_pm_residency@idle-residency.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11199/shard-lnl-7/igt@xe_pm_residency@idle-residency.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
  [Intel XE#1169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
  [Intel XE#1442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1442
  [Intel XE#1446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1446
  [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
  [Intel XE#1477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477
  [Intel XE#1504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1595]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1595
  [Intel XE#1638]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638
  [Intel XE#1646]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1646
  [Intel XE#1650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1650
  [Intel XE#1661]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1661
  [Intel XE#1663]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1663
  [Intel XE#1725]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1725
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1761]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1761
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1830]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1830
  [Intel XE#1908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1908
  [Intel XE#1912]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1912
  [Intel XE#1939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1939
  [Intel XE#305]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/305
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/374
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#581]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/581
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#664]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/664
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/780
  [Intel XE#829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/829
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * IGT: IGT_7871 -> IGTPW_11199
  * Linux: xe-1337-1cea2d72e1159a0a7923af196458aa68e6074f90 -> xe-1352-e3349a28c5e6fe986305d4c99b13e59eb7ca9b9c

  IGTPW_11199: 9b1394160ca87b63f1c216072b5d36fcf7a8313b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7871: 1d7b961235e345db20933c057f265898e2e96fd2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1337-1cea2d72e1159a0a7923af196458aa68e6074f90: 1cea2d72e1159a0a7923af196458aa68e6074f90
  xe-1352-e3349a28c5e6fe986305d4c99b13e59eb7ca9b9c: e3349a28c5e6fe986305d4c99b13e59eb7ca9b9c

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11199/index.html

--===============8006412222221073810==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


<!DOCTYPE html>
<html xmlns=3D"http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8"/>
  <title>Project List - Patchwork</title>
  <style id=3D"css-table-select" type=3D"text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>tests/intel/kms_pm_dc: Add a new test to val=
idate the deep sleep state during extended vblank (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/134058/">https://patchwork.freedesktop.org/series/134058/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_11199/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_11199/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7871_full -&gt; XEIGTPW_11199_full<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_11199_full absolutely need t=
o be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in XEIGTPW_11199_full, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (3 -&gt; 2)</h2>
<p>Missing    (1): shard-adlp </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_11=
199_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@runner@aborted:<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_11199/shard-dg2-435/igt@runner@aborted.html">FAIL</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11199/shard-dg=
2-435/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_11199/shard-dg2-435/igt@runner@aborted.html">FAIL<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11199/shard=
-dg2-466/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_11199/shard-dg2-432/igt@runner@aborted.html">FA=
IL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11199/sh=
ard-dg2-466/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_11199/shard-dg2-432/igt@runner@aborted.html"=
>FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11199=
/shard-dg2-463/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_11199/shard-dg2-463/igt@runner@aborted.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11=
199/shard-dg2-432/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_11199/shard-dg2-466/igt@runner@aborted=
.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_11199/shard-dg2-466/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11199/shard-dg2-463/igt@runner@abor=
ted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_11199/shard-dg2-433/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11199/shard-dg2-434/igt@runner@a=
borted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_11199/shard-dg2-434/igt@runner@aborted.html">FAIL</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11199/shard-dg2-433/igt@runne=
r@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_11199/shard-dg2-436/igt@runner@aborted.html">FAIL</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11199/shard-dg2-464/igt@ru=
nner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_11199/shard-dg2-436/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11199/shard-dg2-433/igt=
@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_11199/shard-dg2-464/igt@runner@aborted.html">FAIL</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11199/shard-dg2-434/=
igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_11199/shard-dg2-464/igt@runner@aborted.html">FAIL</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11199/shard-dg2-4=
36/igt@runner@aborted.html">FAIL</a>)</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>igt@kms_addfb_basic@bad-pitch-32:<ul>
<li>{shard-lnl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7871/shard-lnl-2/igt@kms_addfb_basic@bad-pitch-32.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11199/shard-ln=
l-7/igt@kms_addfb_basic@bad-pitch-32.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_7871_full and XEIGTPW_11199=
_full:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_pm_dc@deep-pkgc:<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11199_full that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_edge_walk@128x128-right-edge:</p>
<ul>
<li>{shard-lnl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7871/shard-lnl-6/igt@kms_cursor_edge_walk@128x128-right-edge.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/581"=
>Intel XE#581</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_11199/shard-lnl-5/igt@kms_cursor_edge_walk@128x128-right-edge.html=
">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>{shard-lnl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7871/shard-lnl-2/igt@kms_pm_dc@dc5-psr.html">ABORT</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1939">Intel XE#1939</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11199/shar=
d-lnl-8/igt@kms_pm_dc@dc5-psr.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_prop_blob@blob-prop-validate:</p>
<ul>
<li>{shard-lnl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7871/shard-lnl-6/igt@kms_prop_blob@blob-prop-validate.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/780">Intel =
XE#780</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_11199/shard-lnl-4/igt@kms_prop_blob@blob-prop-validate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_properties@invalid-properties-legacy:</p>
<ul>
<li>{shard-lnl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7871/shard-lnl-6/igt@kms_properties@invalid-properties-legacy.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/164=
6">Intel XE#1646</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1650">Intel XE#1650</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_11199/shard-lnl-8/igt@kms_properties@invalid-prop=
erties-legacy.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidat=
e:</p>
<ul>
<li>{shard-lnl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7871/shard-lnl-7/igt@xe_exec_compute_mode@many-execqueues-bindexecque=
ue-userptr-invalidate.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1330">Intel XE#1330</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11199/shard-lnl-7/igt@xe_exe=
c_compute_mode@many-execqueues-bindexecqueue-userptr-invalidate.html">PASS<=
/a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-shared-vm-userptr-invalidate:</p>
<ul>
<li>{shard-lnl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7871/shard-lnl-4/igt@xe_exec_threads@threads-hang-shared-vm-userptr-i=
nvalidate.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1169">Intel XE#1169</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1330">Intel XE#1330</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11199/shard-lnl-6/igt@xe_e=
xec_threads@threads-hang-shared-vm-userptr-invalidate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-userptr:</p>
<ul>
<li>{shard-lnl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7871/shard-lnl-2/igt@xe_pm@s2idle-vm-bind-userptr.html">DMESG-WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1595">Int=
el XE#1595</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_11199/shard-lnl-5/igt@xe_pm@s2idle-vm-bind-userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@idle-residency:</p>
<ul>
<li>{shard-lnl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7871/shard-lnl-6/igt@xe_pm_residency@idle-residency.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1442">Intel X=
E#1442</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_11199/shard-lnl-7/igt@xe_pm_residency@idle-residency.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7871 -&gt; IGTPW_11199</li>
<li>Linux: xe-1337-1cea2d72e1159a0a7923af196458aa68e6074f90 -&gt; xe-1352-e=
3349a28c5e6fe986305d4c99b13e59eb7ca9b9c</li>
</ul>
<p>IGTPW_11199: 9b1394160ca87b63f1c216072b5d36fcf7a8313b @ https://gitlab.f=
reedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7871: 1d7b961235e345db20933c057f265898e2e96fd2 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-1337-1cea2d72e1159a0a7923af196458aa68e6074f90: 1cea2d72e1159a0a7923af1=
96458aa68e6074f90<br />
  xe-1352-e3349a28c5e6fe986305d4c99b13e59eb7ca9b9c: e3349a28c5e6fe986305d4c=
99b13e59eb7ca9b9c</p>

</body>
</html>

--===============8006412222221073810==--
