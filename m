Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35CFAC3DA49
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jul 2024 06:36:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD6BE10E74F;
	Thu, 25 Jul 2024 06:36:42 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D526B10E723;
 Thu, 25 Jul 2024 06:36:41 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0502439371978716312=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_series_starting_with_=5Bi-g-t?=
 =?utf-8?q?=2CV2=2C1/2=5D_lib/drmtest=3A_Ensure_the_XE_driver_is_idle_before?=
 =?utf-8?q?_starting_a_test_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 25 Jul 2024 06:36:41 -0000
Message-ID: <172188940186.378399.3542753601895840064@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240724070544.1734040-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20240724070544.1734040-1-bhanuprakash.modem@intel.com>
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

--===============0502439371978716312==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,V2,1/2] lib/drmtest: Ensure the XE driver is idle before starting a test (rev2)
URL   : https://patchwork.freedesktop.org/series/136408/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7936_BAT -> XEIGTPW_11453_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_11453_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_11453_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (6 -> 7)
------------------------------

  Additional (1): bat-pvc-2 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_11453_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_huc_copy@huc_copy:
    - bat-lnl-1:          [PASS][1] -> [SKIP][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7936/bat-lnl-1/igt@xe_huc_copy@huc_copy.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11453/bat-lnl-1/igt@xe_huc_copy@huc_copy.html

  * igt@xe_mmap@cpu-caching:
    - bat-lnl-1:          [PASS][3] -> [DMESG-WARN][4] +135 other tests dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7936/bat-lnl-1/igt@xe_mmap@cpu-caching.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11453/bat-lnl-1/igt@xe_mmap@cpu-caching.html

  * igt@xe_pm_residency@gt-c6-on-idle:
    - bat-lnl-1:          [PASS][5] -> [DMESG-FAIL][6] +1 other test dmesg-fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7936/bat-lnl-1/igt@xe_pm_residency@gt-c6-on-idle.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11453/bat-lnl-1/igt@xe_pm_residency@gt-c6-on-idle.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_rmfb@rmfb-ioctl:
    - {bat-lnl-2}:        NOTRUN -> [SKIP][7] +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11453/bat-lnl-2/igt@kms_rmfb@rmfb-ioctl.html

  * igt@xe_exec_balancer@no-exec-virtual-basic:
    - {bat-lnl-2}:        [PASS][8] -> [DMESG-WARN][9] +137 other tests dmesg-warn
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7936/bat-lnl-2/igt@xe_exec_balancer@no-exec-virtual-basic.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11453/bat-lnl-2/igt@xe_exec_balancer@no-exec-virtual-basic.html

  * {igt@xe_intel_bb@render@render-tile64-256}:
    - bat-lnl-1:          [PASS][10] -> [DMESG-WARN][11]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7936/bat-lnl-1/igt@xe_intel_bb@render@render-tile64-256.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11453/bat-lnl-1/igt@xe_intel_bb@render@render-tile64-256.html

  * igt@xe_pat@pat-index-xe2@render:
    - {bat-bmg-1}:        [PASS][12] -> [DMESG-WARN][13] +1 other test dmesg-warn
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7936/bat-bmg-1/igt@xe_pat@pat-index-xe2@render.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11453/bat-bmg-1/igt@xe_pat@pat-index-xe2@render.html

  * igt@xe_pm_residency@gt-c6-on-idle:
    - {bat-lnl-2}:        [PASS][14] -> [DMESG-FAIL][15]
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7936/bat-lnl-2/igt@xe_pm_residency@gt-c6-on-idle.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11453/bat-lnl-2/igt@xe_pm_residency@gt-c6-on-idle.html

  
New tests
---------

  New tests have been introduced between XEIGT_7936_BAT and XEIGTPW_11453_BAT:

### New IGT tests (4) ###

  * igt@kms_rmfb@close-fd@pipe-b-dp-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.22] s

  * igt@kms_rmfb@close-fd@pipe-d-dp-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.25] s

  * igt@kms_rmfb@rmfb-ioctl@pipe-b-dp-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.24] s

  * igt@kms_rmfb@rmfb-ioctl@pipe-d-dp-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.23] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_11453_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
    - bat-pvc-2:          NOTRUN -> [SKIP][16] ([i915#6077]) +30 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11453/bat-pvc-2/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - bat-pvc-2:          NOTRUN -> [SKIP][17] ([Intel XE#1024] / [Intel XE#782]) +5 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11453/bat-pvc-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  * igt@kms_dsc@dsc-basic:
    - bat-pvc-2:          NOTRUN -> [SKIP][18] ([Intel XE#1024] / [Intel XE#784])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11453/bat-pvc-2/igt@kms_dsc@dsc-basic.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-pvc-2:          NOTRUN -> [SKIP][19] ([Intel XE#1024] / [Intel XE#947]) +3 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11453/bat-pvc-2/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_force_connector_basic@force-connector-state:
    - bat-pvc-2:          NOTRUN -> [SKIP][20] ([Intel XE#540]) +3 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11453/bat-pvc-2/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-pvc-2:          NOTRUN -> [SKIP][21] ([Intel XE#1024] / [Intel XE#783])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11453/bat-pvc-2/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - bat-pvc-2:          NOTRUN -> [SKIP][22] ([Intel XE#829]) +6 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11453/bat-pvc-2/igt@kms_pipe_crc_basic@nonblocking-crc.html

  * igt@kms_prop_blob@basic:
    - bat-pvc-2:          NOTRUN -> [SKIP][23] ([Intel XE#780])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11453/bat-pvc-2/igt@kms_prop_blob@basic.html

  * igt@kms_rmfb@rmfb-ioctl:
    - bat-pvc-2:          NOTRUN -> [SKIP][24] ([Intel XE#1024]) +4 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11453/bat-pvc-2/igt@kms_rmfb@rmfb-ioctl.html
    - bat-atsm-2:         NOTRUN -> [SKIP][25] ([Intel XE#1024]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11453/bat-atsm-2/igt@kms_rmfb@rmfb-ioctl.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - bat-pvc-2:          NOTRUN -> [SKIP][26] ([Intel XE#1932]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11453/bat-pvc-2/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_exec_compute_mode@twice-bindexecqueue-rebind:
    - bat-lnl-1:          [PASS][27] -> [DMESG-FAIL][28] ([Intel XE#1069]) +5 other tests dmesg-fail
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7936/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-rebind.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11453/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-rebind.html

  * igt@xe_gt_freq@freq_range_idle:
    - bat-lnl-1:          [PASS][29] -> [SKIP][30] ([Intel XE#1462])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7936/bat-lnl-1/igt@xe_gt_freq@freq_range_idle.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11453/bat-lnl-1/igt@xe_gt_freq@freq_range_idle.html
    - bat-pvc-2:          NOTRUN -> [SKIP][31] ([Intel XE#1021]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11453/bat-pvc-2/igt@xe_gt_freq@freq_range_idle.html

  * igt@xe_huc_copy@huc_copy:
    - bat-pvc-2:          NOTRUN -> [SKIP][32] ([Intel XE#255])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11453/bat-pvc-2/igt@xe_huc_copy@huc_copy.html

  * igt@xe_intel_bb@render:
    - bat-pvc-2:          NOTRUN -> [SKIP][33] ([Intel XE#532])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11453/bat-pvc-2/igt@xe_intel_bb@render.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - bat-pvc-2:          NOTRUN -> [SKIP][34] ([Intel XE#2229])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11453/bat-pvc-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-lnl-1:          [PASS][35] -> [SKIP][36] ([Intel XE#1192]) +2 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7936/bat-lnl-1/igt@xe_live_ktest@xe_migrate.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11453/bat-lnl-1/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_pat@pat-index-xe2:
    - bat-pvc-2:          NOTRUN -> [SKIP][37] ([Intel XE#977]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11453/bat-pvc-2/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xehpc@render:
    - bat-pvc-2:          NOTRUN -> [SKIP][38] ([Intel XE#976])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11453/bat-pvc-2/igt@xe_pat@pat-index-xehpc@render.html

  * igt@xe_pat@pat-index-xelpg:
    - bat-pvc-2:          NOTRUN -> [SKIP][39] ([Intel XE#979])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11453/bat-pvc-2/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm_residency@gt-c6-on-idle:
    - bat-pvc-2:          NOTRUN -> [SKIP][40] ([Intel XE#531])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11453/bat-pvc-2/igt@xe_pm_residency@gt-c6-on-idle.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1021
  [Intel XE#1024]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024
  [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1462]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1462
  [Intel XE#1932]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1932
  [Intel XE#2109]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2109
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#531]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/531
  [Intel XE#532]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/532
  [Intel XE#540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/540
  [Intel XE#780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/780
  [Intel XE#782]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/782
  [Intel XE#783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/783
  [Intel XE#784]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/784
  [Intel XE#829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/829
  [Intel XE#947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/947
  [Intel XE#976]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/976
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#6077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077


Build changes
-------------

  * IGT: IGT_7936 -> IGTPW_11453
  * Linux: xe-1651-049eae5224ed92f3cb723a492593b255654e0649 -> xe-1664-724a2a53988a57709d7f9dcd5c58dd5737d45cb2

  IGTPW_11453: fd3b45b184a0859ef711278b5a156977858f7549 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7936: 7936
  xe-1651-049eae5224ed92f3cb723a492593b255654e0649: 049eae5224ed92f3cb723a492593b255654e0649
  xe-1664-724a2a53988a57709d7f9dcd5c58dd5737d45cb2: 724a2a53988a57709d7f9dcd5c58dd5737d45cb2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11453/index.html

--===============0502439371978716312==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,V2,1/2] lib/drmtest: Ensure the XE driver is idle before starting a test (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136408/">https://patchwork.freedesktop.org/series/136408/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11453/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11453/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7936_BAT -&gt; XEIGTPW_11453_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_11453_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_11453_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (6 -&gt; 7)</h2>
<p>Additional (1): bat-pvc-2 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_11453_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7936/bat-lnl-1/igt@xe_huc_copy@huc_copy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11453/bat-lnl-1/igt@xe_huc_copy@huc_copy.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_mmap@cpu-caching:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7936/bat-lnl-1/igt@xe_mmap@cpu-caching.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11453/bat-lnl-1/igt@xe_mmap@cpu-caching.html">DMESG-WARN</a> +135 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-on-idle:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7936/bat-lnl-1/igt@xe_pm_residency@gt-c6-on-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11453/bat-lnl-1/igt@xe_pm_residency@gt-c6-on-idle.html">DMESG-FAIL</a> +1 other test dmesg-fail</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_rmfb@rmfb-ioctl:</p>
<ul>
<li>{bat-lnl-2}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11453/bat-lnl-2/igt@kms_rmfb@rmfb-ioctl.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-virtual-basic:</p>
<ul>
<li>{bat-lnl-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7936/bat-lnl-2/igt@xe_exec_balancer@no-exec-virtual-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11453/bat-lnl-2/igt@xe_exec_balancer@no-exec-virtual-basic.html">DMESG-WARN</a> +137 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>{igt@xe_intel_bb@render@render-tile64-256}:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7936/bat-lnl-1/igt@xe_intel_bb@render@render-tile64-256.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11453/bat-lnl-1/igt@xe_intel_bb@render@render-tile64-256.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2@render:</p>
<ul>
<li>{bat-bmg-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7936/bat-bmg-1/igt@xe_pat@pat-index-xe2@render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11453/bat-bmg-1/igt@xe_pat@pat-index-xe2@render.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-on-idle:</p>
<ul>
<li>{bat-lnl-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7936/bat-lnl-2/igt@xe_pm_residency@gt-c6-on-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11453/bat-lnl-2/igt@xe_pm_residency@gt-c6-on-idle.html">DMESG-FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_7936_BAT and XEIGTPW_11453_BAT:</p>
<h3>New IGT tests (4)</h3>
<ul>
<li>
<p>igt@kms_rmfb@close-fd@pipe-b-dp-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_rmfb@close-fd@pipe-d-dp-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_rmfb@rmfb-ioctl@pipe-b-dp-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_rmfb@rmfb-ioctl@pipe-d-dp-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.23] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11453_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-legacy:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11453/bat-pvc-2/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077">i915#6077</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11453/bat-pvc-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/782">Intel XE#782</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11453/bat-pvc-2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/784">Intel XE#784</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11453/bat-pvc-2/igt@kms_flip@basic-flip-vs-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/947">Intel XE#947</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11453/bat-pvc-2/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/540">Intel XE#540</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11453/bat-pvc-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/783">Intel XE#783</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11453/bat-pvc-2/igt@kms_pipe_crc_basic@nonblocking-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_prop_blob@basic:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11453/bat-pvc-2/igt@kms_prop_blob@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/780">Intel XE#780</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rmfb@rmfb-ioctl:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11453/bat-pvc-2/igt@kms_rmfb@rmfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a>) +4 other tests skip</li>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11453/bat-atsm-2/igt@kms_rmfb@rmfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11453/bat-pvc-2/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1932">Intel XE#1932</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-bindexecqueue-rebind:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7936/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11453/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-rebind.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069</a>) +5 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_range_idle:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7936/bat-lnl-1/igt@xe_gt_freq@freq_range_idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11453/bat-lnl-1/igt@xe_gt_freq@freq_range_idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1462">Intel XE#1462</a>)</li>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11453/bat-pvc-2/igt@xe_gt_freq@freq_range_idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1021">Intel XE#1021</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11453/bat-pvc-2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@render:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11453/bat-pvc-2/igt@xe_intel_bb@render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/532">Intel XE#532</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11453/bat-pvc-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7936/bat-lnl-1/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11453/bat-lnl-1/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11453/bat-pvc-2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc@render:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11453/bat-pvc-2/igt@xe_pat@pat-index-xehpc@render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/976">Intel XE#976</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11453/bat-pvc-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-on-idle:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11453/bat-pvc-2/igt@xe_pm_residency@gt-c6-on-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/531">Intel XE#531</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7936 -&gt; IGTPW_11453</li>
<li>Linux: xe-1651-049eae5224ed92f3cb723a492593b255654e0649 -&gt; xe-1664-724a2a53988a57709d7f9dcd5c58dd5737d45cb2</li>
</ul>
<p>IGTPW_11453: fd3b45b184a0859ef711278b5a156977858f7549 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7936: 7936<br />
  xe-1651-049eae5224ed92f3cb723a492593b255654e0649: 049eae5224ed92f3cb723a492593b255654e0649<br />
  xe-1664-724a2a53988a57709d7f9dcd5c58dd5737d45cb2: 724a2a53988a57709d7f9dcd5c58dd5737d45cb2</p>

</body>
</html>

--===============0502439371978716312==--
