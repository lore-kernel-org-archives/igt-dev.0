Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A1BFC47DDB
	for <igt-dev@archiver.kernel.org>; Thu,  1 Feb 2024 03:41:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D84710EEC7;
	Thu,  1 Feb 2024 03:41:12 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA43010EEC7;
 Thu,  1 Feb 2024 03:41:10 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0292420148623240855=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_igt=5Fkmod_and_sysfs_fixes_=28?=
 =?utf-8?q?rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Thu, 01 Feb 2024 03:41:10 -0000
Message-ID: <170675887069.878358.12561413248899543364@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240201005115.352192-1-lucas.demarchi@intel.com>
In-Reply-To: <20240201005115.352192-1-lucas.demarchi@intel.com>
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
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

--===============0292420148623240855==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: igt_kmod and sysfs fixes (rev2)
URL   : https://patchwork.freedesktop.org/series/129398/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7699_BAT -> XEIGTPW_10618_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_10618_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_10618_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_10618_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_live_ktest@bo@xe_bo-xe_ccs_migrate_kunit:
    - bat-dg2-oem2:       [PASS][1] -> [SKIP][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-dg2-oem2/igt@xe_live_ktest@bo@xe_bo-xe_ccs_migrate_kunit.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10618/bat-dg2-oem2/igt@xe_live_ktest@bo@xe_bo-xe_ccs_migrate_kunit.html

  * igt@xe_module_load@load:
    - bat-dg2-oem2:       [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-dg2-oem2/igt@xe_module_load@load.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10618/bat-dg2-oem2/igt@xe_module_load@load.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_exec_atomic@basic-dec-all}:
    - bat-dg2-oem2:       [PASS][5] -> [SKIP][6] +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-dg2-oem2/igt@xe_exec_atomic@basic-dec-all.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10618/bat-dg2-oem2/igt@xe_exec_atomic@basic-dec-all.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_10618_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-dg2-oem2:       [PASS][7] -> [SKIP][8] ([Intel XE#1136])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10618/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_addfb_basic@bad-pitch-128:
    - bat-dg2-oem2:       [PASS][9] -> [SKIP][10] ([i915#2575]) +50 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10618/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html

  * igt@kms_addfb_basic@invalid-set-prop:
    - bat-adlp-7:         [PASS][11] -> [SKIP][12] ([i915#6077]) +30 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-adlp-7/igt@kms_addfb_basic@invalid-set-prop.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10618/bat-adlp-7/igt@kms_addfb_basic@invalid-set-prop.html

  * igt@kms_flip@basic-flip-vs-dpms:
    - bat-adlp-7:         [PASS][13] -> [SKIP][14] ([Intel XE#1219]) +9 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10618/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html

  * igt@kms_force_connector_basic@force-connector-state:
    - bat-adlp-7:         [PASS][15] -> [SKIP][16] ([Intel XE#540]) +3 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-adlp-7/igt@kms_force_connector_basic@force-connector-state.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10618/bat-adlp-7/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - bat-adlp-7:         [PASS][17] -> [SKIP][18] ([Intel XE#829]) +6 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-adlp-7/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10618/bat-adlp-7/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  * igt@kms_prop_blob@basic:
    - bat-adlp-7:         [PASS][19] -> [SKIP][20] ([Intel XE#780])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-adlp-7/igt@kms_prop_blob@basic.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10618/bat-adlp-7/igt@kms_prop_blob@basic.html

  * igt@xe_intel_bb@create-in-region:
    - bat-dg2-oem2:       [PASS][21] -> [SKIP][22] ([Intel XE#1130]) +147 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10618/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html

  * igt@xe_live_ktest@bo@xe_bo-xe_bo_evict_kunit:
    - bat-dg2-oem2:       [PASS][23] -> [SKIP][24] ([Intel XE#455]) +5 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-dg2-oem2/igt@xe_live_ktest@bo@xe_bo-xe_bo_evict_kunit.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10618/bat-dg2-oem2/igt@xe_live_ktest@bo@xe_bo-xe_bo_evict_kunit.html

  
#### Possible fixes ####

  * igt@xe_module_load@load:
    - bat-pvc-2:          [SKIP][25] ([Intel XE#378]) -> [PASS][26]
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-pvc-2/igt@xe_module_load@load.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10618/bat-pvc-2/igt@xe_module_load@load.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-dg2-oem2:       [SKIP][27] ([Intel XE#623]) -> [SKIP][28] ([i915#2575])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10618/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-dg2-oem2:       [SKIP][29] ([Intel XE#455]) -> [SKIP][30] ([Intel XE#1134])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10618/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html
    - bat-adlp-7:         [SKIP][31] ([Intel XE#455]) -> [SKIP][32] ([Intel XE#1219])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-adlp-7/igt@kms_dsc@dsc-basic.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10618/bat-adlp-7/igt@kms_dsc@dsc-basic.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - bat-dg2-oem2:       [SKIP][33] ([i915#5274]) -> [SKIP][34] ([i915#2575])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10618/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [DMESG-FAIL][35] ([Intel XE#1033]) -> [SKIP][36] ([Intel XE#783])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10618/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
    - bat-dg2-oem2:       [FAIL][37] ([Intel XE#608]) -> [SKIP][38] ([Intel XE#1134])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10618/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate:
    - bat-dg2-oem2:       [SKIP][39] ([Intel XE#288]) -> [SKIP][40] ([Intel XE#1130]) +32 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10618/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html

  * igt@xe_huc_copy@huc_copy:
    - bat-dg2-oem2:       [SKIP][41] ([Intel XE#255]) -> [SKIP][42] ([Intel XE#1130])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10618/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html

  * igt@xe_pat@pat-index-xe2:
    - bat-dg2-oem2:       [SKIP][43] ([Intel XE#977]) -> [SKIP][44] ([Intel XE#1130])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10618/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-dg2-oem2:       [SKIP][45] ([Intel XE#979]) -> [SKIP][46] ([Intel XE#1130]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10618/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1134
  [Intel XE#1136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1136
  [Intel XE#1219]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1219
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/540
  [Intel XE#608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/608
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/780
  [Intel XE#783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/783
  [Intel XE#829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/829
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274
  [i915#6077]: https://gitlab.freedesktop.org/drm/intel/issues/6077


Build changes
-------------

  * IGT: IGT_7699 -> IGTPW_10618
  * Linux: xe-699-c655e0fd28045dbaa581d04bf7cc266eec1c3457 -> xe-712-cba66c6a2af4df1b9b420fbad0a9ac1e68f14030

  IGTPW_10618: 10618
  IGT_7699: 7699
  xe-699-c655e0fd28045dbaa581d04bf7cc266eec1c3457: c655e0fd28045dbaa581d04bf7cc266eec1c3457
  xe-712-cba66c6a2af4df1b9b420fbad0a9ac1e68f14030: cba66c6a2af4df1b9b420fbad0a9ac1e68f14030

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10618/index.html

--===============0292420148623240855==
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
<tr><td><b>Series:</b></td><td>igt_kmod and sysfs fixes (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129398/">https://patchwork.freedesktop.org/series/129398/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10618/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10618/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7699_BAT -&gt; XEIGTPW_10618_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_10618_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_10618_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_10618_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_live_ktest@bo@xe_bo-xe_ccs_migrate_kunit:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-dg2-oem2/igt@xe_live_ktest@bo@xe_bo-xe_ccs_migrate_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10618/bat-dg2-oem2/igt@xe_live_ktest@bo@xe_bo-xe_ccs_migrate_kunit.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-dg2-oem2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10618/bat-dg2-oem2/igt@xe_module_load@load.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@xe_exec_atomic@basic-dec-all}:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-dg2-oem2/igt@xe_exec_atomic@basic-dec-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10618/bat-dg2-oem2/igt@xe_exec_atomic@basic-dec-all.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10618_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10618/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1136">Intel XE#1136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bad-pitch-128:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10618/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +50 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-set-prop:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-adlp-7/igt@kms_addfb_basic@invalid-set-prop.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10618/bat-adlp-7/igt@kms_addfb_basic@invalid-set-prop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6077">i915#6077</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10618/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1219">Intel XE#1219</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-adlp-7/igt@kms_force_connector_basic@force-connector-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10618/bat-adlp-7/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/540">Intel XE#540</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-adlp-7/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10618/bat-adlp-7/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_prop_blob@basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-adlp-7/igt@kms_prop_blob@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10618/bat-adlp-7/igt@kms_prop_blob@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/780">Intel XE#780</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@create-in-region:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10618/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +147 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@bo@xe_bo-xe_bo_evict_kunit:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-dg2-oem2/igt@xe_live_ktest@bo@xe_bo-xe_bo_evict_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10618/bat-dg2-oem2/igt@xe_live_ktest@bo@xe_bo-xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-pvc-2/igt@xe_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10618/bat-pvc-2/igt@xe_module_load@load.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10618/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10618/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1134">Intel XE#1134</a>)</li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-adlp-7/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10618/bat-adlp-7/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1219">Intel XE#1219</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5274">i915#5274</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10618/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10618/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/783">Intel XE#783</a>)</li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/608">Intel XE#608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10618/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1134">Intel XE#1134</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10618/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10618/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10618/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10618/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7699 -&gt; IGTPW_10618</li>
<li>Linux: xe-699-c655e0fd28045dbaa581d04bf7cc266eec1c3457 -&gt; xe-712-cba66c6a2af4df1b9b420fbad0a9ac1e68f14030</li>
</ul>
<p>IGTPW_10618: 10618<br />
  IGT_7699: 7699<br />
  xe-699-c655e0fd28045dbaa581d04bf7cc266eec1c3457: c655e0fd28045dbaa581d04bf7cc266eec1c3457<br />
  xe-712-cba66c6a2af4df1b9b420fbad0a9ac1e68f14030: cba66c6a2af4df1b9b420fbad0a9ac1e68f14030</p>

</body>
</html>

--===============0292420148623240855==--
