Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 339AEC4345F
	for <igt-dev@archiver.kernel.org>; Fri, 26 Apr 2024 17:57:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7EE210F23E;
	Fri, 26 Apr 2024 17:57:15 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FE9910F23E;
 Fri, 26 Apr 2024 17:57:14 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2900475045314759829=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_series_starting_with_=5Bi-g-t?=
 =?utf-8?q?=2C1/2=5D_intel=5Freg=3A_Reorder_commands_and_annotate_ones_needi?=
 =?utf-8?q?ng_reg_spec?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 26 Apr 2024 17:57:14 -0000
Message-ID: <171415423425.1687463.3866460539357052861@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240426153352.3209972-1-lucas.demarchi@intel.com>
In-Reply-To: <20240426153352.3209972-1-lucas.demarchi@intel.com>
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

--===============2900475045314759829==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/2] intel_reg: Reorder commands and annotate ones needing reg spec
URL   : https://patchwork.freedesktop.org/series/132964/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7825_BAT -> XEIGTPW_11077_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_11077_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@bad-pitch-128:
    - bat-dg2-oem2:       [PASS][1] -> [SKIP][2] ([i915#2575]) +50 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11077/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-dg2-oem2:       [PASS][3] -> [SKIP][4] ([Intel XE#1134])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11077/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][5] ([Intel XE#1130]) +54 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11077/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html

  * igt@xe_intel_bb@create-in-region:
    - bat-dg2-oem2:       [PASS][6] -> [SKIP][7] ([Intel XE#1130]) +133 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11077/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html

  * igt@xe_module_load@load:
    - bat-dg2-oem2:       [PASS][8] -> [FAIL][9] ([Intel XE#1132])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/bat-dg2-oem2/igt@xe_module_load@load.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11077/bat-dg2-oem2/igt@xe_module_load@load.html

  
#### Warnings ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-dg2-oem2:       [INCOMPLETE][10] ([Intel XE#1451]) -> [SKIP][11] ([Intel XE#1136])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11077/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-dg2-oem2:       [SKIP][12] ([Intel XE#623]) -> [SKIP][13] ([i915#2575])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11077/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-dg2-oem2:       [SKIP][14] ([Intel XE#455]) -> [SKIP][15] ([Intel XE#1134])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11077/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - bat-dg2-oem2:       [SKIP][16] ([i915#5274]) -> [SKIP][17] ([i915#2575])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11077/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_psr@psr-cursor-plane-move:
    - bat-dg2-oem2:       [SKIP][18] ([Intel XE#929]) -> [SKIP][19] ([Intel XE#1134]) +2 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11077/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html

  * igt@xe_huc_copy@huc_copy:
    - bat-dg2-oem2:       [SKIP][20] ([Intel XE#255]) -> [SKIP][21] ([Intel XE#1130])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11077/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html

  * igt@xe_pat@pat-index-xe2:
    - bat-dg2-oem2:       [SKIP][22] ([Intel XE#977]) -> [SKIP][23] ([Intel XE#1130])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11077/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-dg2-oem2:       [SKIP][24] ([Intel XE#979]) -> [SKIP][25] ([Intel XE#1130]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11077/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html

  
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1132]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1132
  [Intel XE#1134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1134
  [Intel XE#1136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1136
  [Intel XE#1451]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1451
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274


Build changes
-------------

  * IGT: IGT_7825 -> IGTPW_11077
  * Linux: xe-1188-f39ba481e5873b7617afc2e8cf618ac9dc85123f -> xe-1192-098a032be5e189eb306b909c73ae79ca6645844f

  IGTPW_11077: eb32b2226e03eb1d05ef34c323a2335b63d37dcd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7825: 28b2a1b0be86e33a2fc04a022e04f07bd25b66d9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1188-f39ba481e5873b7617afc2e8cf618ac9dc85123f: f39ba481e5873b7617afc2e8cf618ac9dc85123f
  xe-1192-098a032be5e189eb306b909c73ae79ca6645844f: 098a032be5e189eb306b909c73ae79ca6645844f

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11077/index.html

--===============2900475045314759829==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/2] intel_reg: Reorder commands and annotate ones needing reg spec</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132964/">https://patchwork.freedesktop.org/series/132964/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11077/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11077/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7825_BAT -&gt; XEIGTPW_11077_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11077_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@bad-pitch-128:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11077/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +50 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11077/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1134">Intel XE#1134</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11077/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +54 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@create-in-region:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11077/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +133 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/bat-dg2-oem2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11077/bat-dg2-oem2/igt@xe_module_load@load.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1132">Intel XE#1132</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1451">Intel XE#1451</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11077/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1136">Intel XE#1136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11077/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11077/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1134">Intel XE#1134</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11077/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11077/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1134">Intel XE#1134</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11077/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11077/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7825/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11077/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7825 -&gt; IGTPW_11077</li>
<li>Linux: xe-1188-f39ba481e5873b7617afc2e8cf618ac9dc85123f -&gt; xe-1192-098a032be5e189eb306b909c73ae79ca6645844f</li>
</ul>
<p>IGTPW_11077: eb32b2226e03eb1d05ef34c323a2335b63d37dcd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7825: 28b2a1b0be86e33a2fc04a022e04f07bd25b66d9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1188-f39ba481e5873b7617afc2e8cf618ac9dc85123f: f39ba481e5873b7617afc2e8cf618ac9dc85123f<br />
  xe-1192-098a032be5e189eb306b909c73ae79ca6645844f: 098a032be5e189eb306b909c73ae79ca6645844f</p>

</body>
</html>

--===============2900475045314759829==--
