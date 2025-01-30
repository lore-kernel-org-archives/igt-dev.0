Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 917F6C02193
	for <igt-dev@archiver.kernel.org>; Thu, 30 Jan 2025 17:58:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FFBD10E9BC;
	Thu, 30 Jan 2025 17:58:34 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECAEB10E065;
 Thu, 30 Jan 2025 17:58:32 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1087837605903669079=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_tests/intel/kms=5Fjoiner=3A?=
 =?utf-8?q?_Add_a_new_test_to_validate_non-joiner_mode_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jeevan B" <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 30 Jan 2025 17:58:32 -0000
Message-ID: <173825991296.2931756.13606778789311800507@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250130172031.4126606-1-jeevan.b@intel.com>
In-Reply-To: <20250130172031.4126606-1-jeevan.b@intel.com>
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

--===============1087837605903669079==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/kms_joiner: Add a new test to validate non-joiner mode (rev3)
URL   : https://patchwork.freedesktop.org/series/143972/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8218_BAT -> XEIGTPW_12518_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_12518_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_12518_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_12518_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_feature_discovery@non-uhbr-mst (NEW):
    - bat-lnl-1:          NOTRUN -> [SKIP][1] +3 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12518/bat-lnl-1/igt@kms_feature_discovery@non-uhbr-mst.html
    - bat-bmg-2:          NOTRUN -> [SKIP][2] +3 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12518/bat-bmg-2/igt@kms_feature_discovery@non-uhbr-mst.html
    - bat-bmg-1:          NOTRUN -> [SKIP][3] +3 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12518/bat-bmg-1/igt@kms_feature_discovery@non-uhbr-mst.html

  * igt@kms_feature_discovery@uhbr-sst (NEW):
    - bat-lnl-2:          NOTRUN -> [SKIP][4] +5 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12518/bat-lnl-2/igt@kms_feature_discovery@uhbr-sst.html
    - bat-dg2-oem2:       NOTRUN -> [SKIP][5] +2 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12518/bat-dg2-oem2/igt@kms_feature_discovery@uhbr-sst.html

  
New tests
---------

  New tests have been introduced between XEIGT_8218_BAT and XEIGTPW_12518_BAT:

### New IGT tests (4) ###

  * igt@kms_feature_discovery@non-uhbr-mst:
    - Statuses : 8 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@kms_feature_discovery@non-uhbr-sst:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0, 0.06] s

  * igt@kms_feature_discovery@uhbr-mst:
    - Statuses : 8 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@kms_feature_discovery@uhbr-sst:
    - Statuses : 8 skip(s)
    - Exec time: [0.0, 0.02] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_12518_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - bat-lnl-1:          NOTRUN -> [SKIP][6] ([Intel XE#3070])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12518/bat-lnl-1/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - bat-bmg-2:          NOTRUN -> [SKIP][7] ([Intel XE#3419])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12518/bat-bmg-2/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - bat-bmg-1:          NOTRUN -> [SKIP][8] ([Intel XE#3070])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12518/bat-bmg-1/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - bat-lnl-2:          NOTRUN -> [SKIP][9] ([Intel XE#2235])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12518/bat-lnl-2/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_feature_discovery@uhbr-mst (NEW):
    - bat-adlp-vf:        NOTRUN -> [SKIP][10] ([Intel XE#2463]) +12 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12518/bat-adlp-vf/igt@kms_feature_discovery@uhbr-mst.html

  * igt@kms_joiner@basic-big-joiner:
    - bat-bmg-2:          NOTRUN -> [SKIP][11] ([Intel XE#346]) +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12518/bat-bmg-2/igt@kms_joiner@basic-big-joiner.html
    - bat-bmg-1:          NOTRUN -> [SKIP][12] ([Intel XE#346]) +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12518/bat-bmg-1/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-big-joiner:
    - bat-pvc-2:          NOTRUN -> [SKIP][13] ([Intel XE#1024]) +12 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12518/bat-pvc-2/igt@kms_joiner@basic-force-big-joiner.html
    - bat-bmg-2:          NOTRUN -> [SKIP][14] ([Intel XE#3012]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12518/bat-bmg-2/igt@kms_joiner@basic-force-big-joiner.html
    - bat-bmg-1:          NOTRUN -> [SKIP][15] ([Intel XE#3012]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12518/bat-bmg-1/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][16] ([Intel XE#2925]) +1 other test skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12518/bat-dg2-oem2/igt@kms_joiner@basic-force-ultra-joiner.html
    - bat-atsm-2:         NOTRUN -> [SKIP][17] ([Intel XE#1024]) +12 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12518/bat-atsm-2/igt@kms_joiner@basic-force-ultra-joiner.html
    - bat-lnl-1:          NOTRUN -> [SKIP][18] ([Intel XE#2934]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12518/bat-lnl-1/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - bat-lnl-1:          NOTRUN -> [SKIP][19] ([Intel XE#2927]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12518/bat-lnl-1/igt@kms_joiner@basic-ultra-joiner.html
    - bat-bmg-2:          NOTRUN -> [SKIP][20] ([Intel XE#2927]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12518/bat-bmg-2/igt@kms_joiner@basic-ultra-joiner.html
    - bat-bmg-1:          NOTRUN -> [SKIP][21] ([Intel XE#2927]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12518/bat-bmg-1/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - bat-lnl-2:          NOTRUN -> [SKIP][22] ([Intel XE#346]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12518/bat-lnl-2/igt@kms_joiner@invalid-modeset-big-joiner.html
    - bat-dg2-oem2:       NOTRUN -> [SKIP][23] ([Intel XE#346]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12518/bat-dg2-oem2/igt@kms_joiner@invalid-modeset-big-joiner.html
    - bat-lnl-1:          NOTRUN -> [SKIP][24] ([Intel XE#346]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12518/bat-lnl-1/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - bat-bmg-2:          NOTRUN -> [SKIP][25] ([Intel XE#2934]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12518/bat-bmg-2/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - bat-bmg-1:          NOTRUN -> [SKIP][26] ([Intel XE#2934]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12518/bat-bmg-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - bat-lnl-2:          NOTRUN -> [SKIP][27] ([Intel XE#2934]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12518/bat-lnl-2/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - bat-lnl-2:          NOTRUN -> [SKIP][28] ([Intel XE#2927]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12518/bat-lnl-2/igt@kms_joiner@invalid-modeset-ultra-joiner.html
    - bat-dg2-oem2:       NOTRUN -> [SKIP][29] ([Intel XE#2927]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12518/bat-dg2-oem2/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - bat-adlp-vf:        NOTRUN -> [SKIP][30] ([Intel XE#2229] / [Intel XE#455]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12518/bat-adlp-vf/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - bat-adlp-vf:        NOTRUN -> [SKIP][31] ([Intel XE#2229])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12518/bat-adlp-vf/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  
#### Possible fixes ####

  * igt@xe_exec_basic@twice-bindexecqueue-rebind:
    - bat-adlp-vf:        [DMESG-WARN][32] ([Intel XE#3970] / [Intel XE#4078]) -> [PASS][33]
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8218/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12518/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-adlp-vf:        [SKIP][34] ([Intel XE#1192]) -> [PASS][35] +1 other test pass
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8218/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12518/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html

  
#### Warnings ####

  * igt@xe_live_ktest@xe_bo:
    - bat-adlp-vf:        [SKIP][36] ([Intel XE#1192]) -> [SKIP][37] ([Intel XE#2229] / [Intel XE#455])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8218/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12518/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html

  
  [Intel XE#1024]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2235]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235
  [Intel XE#2463]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2463
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#3070]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3070
  [Intel XE#3419]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3419
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970
  [Intel XE#4078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4078
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455


Build changes
-------------

  * IGT: IGT_8218 -> IGTPW_12518
  * Linux: xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b -> xe-2574-d68801b664289e615fec8fd9139797b4f88e39f9

  IGTPW_12518: 12518
  IGT_8218: fafef52e0a83fec5f8c4f8df851d27319467762b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b: c2a5da40b8b1c5af77dcdabed8516069949fea3b
  xe-2574-d68801b664289e615fec8fd9139797b4f88e39f9: d68801b664289e615fec8fd9139797b4f88e39f9

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12518/index.html

--===============1087837605903669079==
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
<tr><td><b>Series:</b></td><td>tests/intel/kms_joiner: Add a new test to validate non-joiner mode (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/143972/">https://patchwork.freedesktop.org/series/143972/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12518/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12518/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8218_BAT -&gt; XEIGTPW_12518_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_12518_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_12518_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_12518_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_feature_discovery@non-uhbr-mst (NEW):</p>
<ul>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12518/bat-lnl-1/igt@kms_feature_discovery@non-uhbr-mst.html">SKIP</a> +3 other tests skip</li>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12518/bat-bmg-2/igt@kms_feature_discovery@non-uhbr-mst.html">SKIP</a> +3 other tests skip</li>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12518/bat-bmg-1/igt@kms_feature_discovery@non-uhbr-mst.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@uhbr-sst (NEW):</p>
<ul>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12518/bat-lnl-2/igt@kms_feature_discovery@uhbr-sst.html">SKIP</a> +5 other tests skip</li>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12518/bat-dg2-oem2/igt@kms_feature_discovery@uhbr-sst.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8218_BAT and XEIGTPW_12518_BAT:</p>
<h3>New IGT tests (4)</h3>
<ul>
<li>
<p>igt@kms_feature_discovery@non-uhbr-mst:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@non-uhbr-sst:</p>
<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@uhbr-mst:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@uhbr-sst:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12518_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12518/bat-lnl-1/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3070">Intel XE#3070</a>)</li>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12518/bat-bmg-2/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3419">Intel XE#3419</a>)</li>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12518/bat-bmg-1/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3070">Intel XE#3070</a>)</li>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12518/bat-lnl-2/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@uhbr-mst (NEW):</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12518/bat-adlp-vf/igt@kms_feature_discovery@uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2463">Intel XE#2463</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12518/bat-bmg-2/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) +1 other test skip</li>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12518/bat-bmg-1/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12518/bat-pvc-2/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a>) +12 other tests skip</li>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12518/bat-bmg-2/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>) +1 other test skip</li>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12518/bat-bmg-1/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12518/bat-dg2-oem2/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>) +1 other test skip</li>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12518/bat-atsm-2/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a>) +12 other tests skip</li>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12518/bat-lnl-1/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934">Intel XE#2934</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12518/bat-lnl-1/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>) +1 other test skip</li>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12518/bat-bmg-2/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>) +1 other test skip</li>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12518/bat-bmg-1/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12518/bat-lnl-2/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) +1 other test skip</li>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12518/bat-dg2-oem2/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) +1 other test skip</li>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12518/bat-lnl-1/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12518/bat-bmg-2/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934">Intel XE#2934</a>) +1 other test skip</li>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12518/bat-bmg-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934">Intel XE#2934</a>) +1 other test skip</li>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12518/bat-lnl-2/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934">Intel XE#2934</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12518/bat-lnl-2/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>) +1 other test skip</li>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12518/bat-dg2-oem2/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12518/bat-adlp-vf/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12518/bat-adlp-vf/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-rebind:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8218/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4078">Intel XE#4078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12518/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8218/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12518/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_live_ktest@xe_bo:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8218/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12518/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8218 -&gt; IGTPW_12518</li>
<li>Linux: xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b -&gt; xe-2574-d68801b664289e615fec8fd9139797b4f88e39f9</li>
</ul>
<p>IGTPW_12518: 12518<br />
  IGT_8218: fafef52e0a83fec5f8c4f8df851d27319467762b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b: c2a5da40b8b1c5af77dcdabed8516069949fea3b<br />
  xe-2574-d68801b664289e615fec8fd9139797b4f88e39f9: d68801b664289e615fec8fd9139797b4f88e39f9</p>

</body>
</html>

--===============1087837605903669079==--
