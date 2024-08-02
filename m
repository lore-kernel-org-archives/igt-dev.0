Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B87E3C3DA49
	for <igt-dev@archiver.kernel.org>; Fri,  2 Aug 2024 09:40:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78D0110E9CB;
	Fri,  2 Aug 2024 09:40:56 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 645AB10E9CB;
 Fri,  2 Aug 2024 09:40:55 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6990057813139227873=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_lib/xe/xe=5Fquery=3A_Do_not_re?=
 =?utf-8?q?quire_QUERY=5FOA=5FUNITS_for_all_Xe_tests_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Peter Senna Tschudin" <peter.senna@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 02 Aug 2024 09:40:55 -0000
Message-ID: <172259165540.502828.15922687534994302734@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <78c5f531-f482-49c7-8290-38710698e4a7@linux.intel.com>
In-Reply-To: <78c5f531-f482-49c7-8290-38710698e4a7@linux.intel.com>
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

--===============6990057813139227873==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/xe/xe_query: Do not require QUERY_OA_UNITS for all Xe tests (rev6)
URL   : https://patchwork.freedesktop.org/series/136499/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7952_BAT -> XEIGTPW_11522_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (6 -> 6)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_11522_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-dg2-oem2:       NOTRUN -> [ABORT][1] ([Intel XE#2418])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html
    - bat-atsm-2:         NOTRUN -> [ABORT][2] ([Intel XE#2418])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/bat-atsm-2/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
    - bat-pvc-2:          NOTRUN -> [SKIP][3] ([i915#6077]) +30 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/bat-pvc-2/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][4] ([Intel XE#623])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@invalid-set-prop-any:
    - bat-atsm-2:         NOTRUN -> [SKIP][5] ([i915#6077]) +30 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/bat-atsm-2/igt@kms_addfb_basic@invalid-set-prop-any.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - bat-pvc-2:          NOTRUN -> [SKIP][6] ([Intel XE#1024] / [Intel XE#782]) +5 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/bat-pvc-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
    - bat-atsm-2:         NOTRUN -> [SKIP][7] ([Intel XE#1024] / [Intel XE#782]) +5 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/bat-atsm-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  * igt@kms_dsc@dsc-basic:
    - bat-pvc-2:          NOTRUN -> [SKIP][8] ([Intel XE#1024] / [Intel XE#784])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/bat-pvc-2/igt@kms_dsc@dsc-basic.html
    - bat-dg2-oem2:       NOTRUN -> [SKIP][9] ([Intel XE#455])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html
    - bat-atsm-2:         NOTRUN -> [SKIP][10] ([Intel XE#1024] / [Intel XE#784])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/bat-atsm-2/igt@kms_dsc@dsc-basic.html

  * igt@kms_flip@basic-flip-vs-modeset:
    - bat-atsm-2:         NOTRUN -> [SKIP][11] ([Intel XE#1024] / [Intel XE#947]) +3 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/bat-atsm-2/igt@kms_flip@basic-flip-vs-modeset.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-pvc-2:          NOTRUN -> [SKIP][12] ([Intel XE#1024] / [Intel XE#947]) +3 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/bat-pvc-2/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_force_connector_basic@force-connector-state:
    - bat-pvc-2:          NOTRUN -> [SKIP][13] ([Intel XE#540]) +3 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/bat-pvc-2/igt@kms_force_connector_basic@force-connector-state.html
    - bat-atsm-2:         NOTRUN -> [SKIP][14] ([Intel XE#540]) +3 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/bat-atsm-2/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][15] ([i915#5274])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-pvc-2:          NOTRUN -> [SKIP][16] ([Intel XE#1024] / [Intel XE#783])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/bat-pvc-2/igt@kms_frontbuffer_tracking@basic.html
    - bat-atsm-2:         NOTRUN -> [SKIP][17] ([Intel XE#1024] / [Intel XE#783])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/bat-atsm-2/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - bat-pvc-2:          NOTRUN -> [SKIP][18] ([Intel XE#829]) +6 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/bat-pvc-2/igt@kms_pipe_crc_basic@nonblocking-crc.html
    - bat-atsm-2:         NOTRUN -> [SKIP][19] ([i915#1836]) +6 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/bat-atsm-2/igt@kms_pipe_crc_basic@nonblocking-crc.html

  * igt@kms_prop_blob@basic:
    - bat-pvc-2:          NOTRUN -> [SKIP][20] ([Intel XE#780])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/bat-pvc-2/igt@kms_prop_blob@basic.html
    - bat-atsm-2:         NOTRUN -> [SKIP][21] ([Intel XE#780])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/bat-atsm-2/igt@kms_prop_blob@basic.html

  * igt@kms_psr@psr-cursor-plane-move:
    - bat-pvc-2:          NOTRUN -> [SKIP][22] ([Intel XE#1024]) +2 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/bat-pvc-2/igt@kms_psr@psr-cursor-plane-move.html
    - bat-dg2-oem2:       NOTRUN -> [SKIP][23] ([Intel XE#929]) +2 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html

  * igt@kms_psr@psr-primary-page-flip:
    - bat-atsm-2:         NOTRUN -> [SKIP][24] ([Intel XE#1024]) +2 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/bat-atsm-2/igt@kms_psr@psr-primary-page-flip.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - bat-pvc-2:          NOTRUN -> [SKIP][25] ([Intel XE#1932]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/bat-pvc-2/igt@sriov_basic@enable-vfs-autoprobe-off.html
    - bat-dg2-oem2:       NOTRUN -> [SKIP][26] ([Intel XE#1091]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_evict@evict-beng-small-external:
    - bat-pvc-2:          NOTRUN -> [FAIL][27] ([Intel XE#1000]) +3 other tests fail
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html

  * igt@xe_evict@evict-small-external-cm:
    - bat-pvc-2:          NOTRUN -> [DMESG-FAIL][28] ([Intel XE#482]) +3 other tests dmesg-fail
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/bat-pvc-2/igt@xe_evict@evict-small-external-cm.html

  * igt@xe_gt_freq@freq_range_idle:
    - bat-pvc-2:          NOTRUN -> [SKIP][29] ([Intel XE#1021]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/bat-pvc-2/igt@xe_gt_freq@freq_range_idle.html

  * igt@xe_huc_copy@huc_copy:
    - bat-pvc-2:          NOTRUN -> [SKIP][30] ([Intel XE#255])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/bat-pvc-2/igt@xe_huc_copy@huc_copy.html
    - bat-dg2-oem2:       NOTRUN -> [SKIP][31] ([Intel XE#255])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html
    - bat-atsm-2:         NOTRUN -> [SKIP][32] ([Intel XE#255])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/bat-atsm-2/igt@xe_huc_copy@huc_copy.html

  * igt@xe_intel_bb@render:
    - bat-pvc-2:          NOTRUN -> [SKIP][33] ([Intel XE#532])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/bat-pvc-2/igt@xe_intel_bb@render.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - bat-pvc-2:          NOTRUN -> [SKIP][34] ([Intel XE#2229]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/bat-pvc-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_pat@pat-index-xe2:
    - bat-pvc-2:          NOTRUN -> [SKIP][35] ([Intel XE#977]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/bat-pvc-2/igt@xe_pat@pat-index-xe2.html
    - bat-atsm-2:         NOTRUN -> [SKIP][36] ([Intel XE#977])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/bat-atsm-2/igt@xe_pat@pat-index-xe2.html
    - bat-dg2-oem2:       NOTRUN -> [SKIP][37] ([Intel XE#977])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][38] ([Intel XE#979]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html
    - bat-atsm-2:         NOTRUN -> [SKIP][39] ([Intel XE#979]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/bat-atsm-2/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xehpc@render:
    - bat-pvc-2:          NOTRUN -> [SKIP][40] ([Intel XE#976])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/bat-pvc-2/igt@xe_pat@pat-index-xehpc@render.html

  * igt@xe_pat@pat-index-xelpg:
    - bat-pvc-2:          NOTRUN -> [SKIP][41] ([Intel XE#979])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/bat-pvc-2/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm_residency@gt-c6-on-idle:
    - bat-pvc-2:          NOTRUN -> [SKIP][42] ([Intel XE#531])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/bat-pvc-2/igt@xe_pm_residency@gt-c6-on-idle.html

  
#### Warnings ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-1:          [ABORT][43] ([Intel XE#2418] / [Intel XE#2421]) -> [ABORT][44] ([Intel XE#2418])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html
    - bat-adlp-7:         [ABORT][45] ([Intel XE#2418] / [Intel XE#2421]) -> [ABORT][46] ([Intel XE#2418])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1021
  [Intel XE#1024]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1932]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1932
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2418]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2418
  [Intel XE#2421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2421
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/482
  [Intel XE#531]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/531
  [Intel XE#532]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/532
  [Intel XE#540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/540
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/780
  [Intel XE#782]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/782
  [Intel XE#783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/783
  [Intel XE#784]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/784
  [Intel XE#829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/829
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/947
  [Intel XE#976]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/976
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#1836]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1836
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274
  [i915#6077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077


Build changes
-------------

  * IGT: IGT_7952 -> IGTPW_11522
  * Linux: xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5 -> xe-1708-974ee82a5f44e91fd93895cc12fb1e76e55b229a

  IGTPW_11522: 11522
  IGT_7952: 7952
  xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5: d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5
  xe-1708-974ee82a5f44e91fd93895cc12fb1e76e55b229a: 974ee82a5f44e91fd93895cc12fb1e76e55b229a

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/index.html

--===============6990057813139227873==
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
<tr><td><b>Series:</b></td><td>lib/xe/xe_query: Do not require QUERY_OA_UNITS for all Xe tests (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136499/">https://patchwork.freedesktop.org/series/136499/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7952_BAT -&gt; XEIGTPW_11522_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (6 -&gt; 6)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11522_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2418">Intel XE#2418</a>)</li>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/bat-atsm-2/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2418">Intel XE#2418</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-legacy:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/bat-pvc-2/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077">i915#6077</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-set-prop-any:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/bat-atsm-2/igt@kms_addfb_basic@invalid-set-prop-any.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077">i915#6077</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/bat-pvc-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/782">Intel XE#782</a>) +5 other tests skip</li>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/bat-atsm-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/782">Intel XE#782</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/bat-pvc-2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/784">Intel XE#784</a>)</li>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/bat-atsm-2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/784">Intel XE#784</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/bat-atsm-2/igt@kms_flip@basic-flip-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/947">Intel XE#947</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/bat-pvc-2/igt@kms_flip@basic-flip-vs-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/947">Intel XE#947</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/bat-pvc-2/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/540">Intel XE#540</a>) +3 other tests skip</li>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/bat-atsm-2/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/540">Intel XE#540</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/bat-pvc-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/783">Intel XE#783</a>)</li>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/bat-atsm-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/783">Intel XE#783</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/bat-pvc-2/igt@kms_pipe_crc_basic@nonblocking-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) +6 other tests skip</li>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/bat-atsm-2/igt@kms_pipe_crc_basic@nonblocking-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1836">i915#1836</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_prop_blob@basic:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/bat-pvc-2/igt@kms_prop_blob@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/780">Intel XE#780</a>)</li>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/bat-atsm-2/igt@kms_prop_blob@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/780">Intel XE#780</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/bat-pvc-2/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a>) +2 other tests skip</li>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/bat-atsm-2/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/bat-pvc-2/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1932">Intel XE#1932</a>) +1 other test skip</li>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-external:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external-cm:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/bat-pvc-2/igt@xe_evict@evict-small-external-cm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/482">Intel XE#482</a>) +3 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_range_idle:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/bat-pvc-2/igt@xe_gt_freq@freq_range_idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1021">Intel XE#1021</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/bat-pvc-2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/bat-atsm-2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@render:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/bat-pvc-2/igt@xe_intel_bb@render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/532">Intel XE#532</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/bat-pvc-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/bat-pvc-2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) +1 other test skip</li>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/bat-atsm-2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) +1 other test skip</li>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/bat-atsm-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc@render:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/bat-pvc-2/igt@xe_pat@pat-index-xehpc@render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/976">Intel XE#976</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/bat-pvc-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-on-idle:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/bat-pvc-2/igt@xe_pm_residency@gt-c6-on-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/531">Intel XE#531</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2418">Intel XE#2418</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2421">Intel XE#2421</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2418">Intel XE#2418</a>)</li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2418">Intel XE#2418</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2421">Intel XE#2421</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2418">Intel XE#2418</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7952 -&gt; IGTPW_11522</li>
<li>Linux: xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5 -&gt; xe-1708-974ee82a5f44e91fd93895cc12fb1e76e55b229a</li>
</ul>
<p>IGTPW_11522: 11522<br />
  IGT_7952: 7952<br />
  xe-1705-d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5: d1ec20e149fc0bd4d15cbf34573b84d4fa47e3a5<br />
  xe-1708-974ee82a5f44e91fd93895cc12fb1e76e55b229a: 974ee82a5f44e91fd93895cc12fb1e76e55b229a</p>

</body>
</html>

--===============6990057813139227873==--
