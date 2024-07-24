Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE6AC3DA63
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jul 2024 09:10:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E55B010E567;
	Wed, 24 Jul 2024 09:10:41 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BA9110E567;
 Wed, 24 Jul 2024 09:10:31 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2743971909529338717=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_series_starting_with_=5Bi-g-t?=
 =?utf-8?q?=2C1/2=5D_lib/drmtest=3A_Ensure_the_XE_driver_is_idle_before_star?=
 =?utf-8?q?ting_a_test?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 24 Jul 2024 09:10:31 -0000
Message-ID: <172181223161.361450.3377464772983311310@2413ebb6fbb6>
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

--===============2743971909529338717==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/2] lib/drmtest: Ensure the XE driver is idle before starting a test
URL   : https://patchwork.freedesktop.org/series/136408/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7936_BAT -> XEIGTPW_11445_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_11445_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_11445_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (6 -> 5)
------------------------------

  Missing    (1): bat-adlp-7 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_11445_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-lnl-1:          [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7936/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11445/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - bat-atsm-2:         [PASS][3] -> [DMESG-WARN][4] +1 other test dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7936/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11445/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1:
    - bat-atsm-2:         [PASS][5] -> [DMESG-FAIL][6] +1 other test dmesg-fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7936/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11445/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html

  * igt@xe_exec_balancer@twice-parallel-userptr-invalidate:
    - bat-dg2-oem2:       [PASS][7] -> [FAIL][8] +1 other test fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7936/bat-dg2-oem2/igt@xe_exec_balancer@twice-parallel-userptr-invalidate.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11445/bat-dg2-oem2/igt@xe_exec_balancer@twice-parallel-userptr-invalidate.html

  * igt@xe_exec_balancer@twice-parallel-userptr-rebind:
    - bat-atsm-2:         [PASS][9] -> [TIMEOUT][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7936/bat-atsm-2/igt@xe_exec_balancer@twice-parallel-userptr-rebind.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11445/bat-atsm-2/igt@xe_exec_balancer@twice-parallel-userptr-rebind.html

  * igt@xe_exec_compute_mode@twice-userptr-invalidate:
    - bat-atsm-2:         [PASS][11] -> [FAIL][12] +10 other tests fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7936/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11445/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html

  * igt@xe_huc_copy@huc_copy:
    - bat-lnl-1:          [PASS][13] -> [DMESG-WARN][14] +31 other tests dmesg-warn
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7936/bat-lnl-1/igt@xe_huc_copy@huc_copy.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11445/bat-lnl-1/igt@xe_huc_copy@huc_copy.html

  * igt@xe_pm_residency@gt-c6-on-idle:
    - bat-lnl-1:          [PASS][15] -> [DMESG-FAIL][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7936/bat-lnl-1/igt@xe_pm_residency@gt-c6-on-idle.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11445/bat-lnl-1/igt@xe_pm_residency@gt-c6-on-idle.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@core_hotunplug@unbind-rebind:
    - {bat-lnl-2}:        [PASS][17] -> [ABORT][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7936/bat-lnl-2/igt@core_hotunplug@unbind-rebind.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11445/bat-lnl-2/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_rmfb@rmfb-ioctl:
    - {bat-lnl-2}:        NOTRUN -> [SKIP][19] +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11445/bat-lnl-2/igt@kms_rmfb@rmfb-ioctl.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-imm:
    - {bat-bmg-1}:        [PASS][20] -> [FAIL][21] +35 other tests fail
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7936/bat-bmg-1/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-imm.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11445/bat-bmg-1/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-imm.html

  * igt@xe_gt_freq@freq_basic_api:
    - {bat-lnl-2}:        [PASS][22] -> [FAIL][23]
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7936/bat-lnl-2/igt@xe_gt_freq@freq_basic_api.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11445/bat-lnl-2/igt@xe_gt_freq@freq_basic_api.html

  * igt@xe_pat@pat-index-xe2@blt:
    - {bat-lnl-2}:        [PASS][24] -> [DMESG-WARN][25] +16 other tests dmesg-warn
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7936/bat-lnl-2/igt@xe_pat@pat-index-xe2@blt.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11445/bat-lnl-2/igt@xe_pat@pat-index-xe2@blt.html

  * igt@xe_pm_residency@gt-c6-on-idle:
    - {bat-lnl-2}:        [PASS][26] -> [DMESG-FAIL][27]
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7936/bat-lnl-2/igt@xe_pm_residency@gt-c6-on-idle.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11445/bat-lnl-2/igt@xe_pm_residency@gt-c6-on-idle.html

  
New tests
---------

  New tests have been introduced between XEIGT_7936_BAT and XEIGTPW_11445_BAT:

### New IGT tests (4) ###

  * igt@kms_rmfb@close-fd@pipe-b-dp-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.22] s

  * igt@kms_rmfb@close-fd@pipe-d-dp-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.24] s

  * igt@kms_rmfb@rmfb-ioctl@pipe-b-dp-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.24] s

  * igt@kms_rmfb@rmfb-ioctl@pipe-d-dp-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.24] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_11445_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_rmfb@rmfb-ioctl:
    - bat-atsm-2:         NOTRUN -> [SKIP][28] ([Intel XE#1024]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11445/bat-atsm-2/igt@kms_rmfb@rmfb-ioctl.html

  * igt@xe_exec_balancer@twice-cm-virtual-userptr-rebind:
    - bat-dg2-oem2:       [PASS][29] -> [FAIL][30] ([Intel XE#1069]) +9 other tests fail
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7936/bat-dg2-oem2/igt@xe_exec_balancer@twice-cm-virtual-userptr-rebind.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11445/bat-dg2-oem2/igt@xe_exec_balancer@twice-cm-virtual-userptr-rebind.html

  * igt@xe_exec_compute_mode@twice-bindexecqueue:
    - bat-lnl-1:          [PASS][31] -> [DMESG-FAIL][32] ([Intel XE#1069]) +10 other tests dmesg-fail
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7936/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11445/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue.html

  * igt@xe_gt_freq@freq_range_idle:
    - bat-lnl-1:          [PASS][33] -> [SKIP][34] ([Intel XE#1462]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7936/bat-lnl-1/igt@xe_gt_freq@freq_range_idle.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11445/bat-lnl-1/igt@xe_gt_freq@freq_range_idle.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1024]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024
  [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
  [Intel XE#1462]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1462
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255


Build changes
-------------

  * IGT: IGT_7936 -> IGTPW_11445
  * Linux: xe-1651-049eae5224ed92f3cb723a492593b255654e0649 -> xe-1655-b4f66aefb5cd89dc39e187d6c622f1493630eb08

  IGTPW_11445: a496e395191a830024be2edee464e86363749249 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7936: 7936
  xe-1651-049eae5224ed92f3cb723a492593b255654e0649: 049eae5224ed92f3cb723a492593b255654e0649
  xe-1655-b4f66aefb5cd89dc39e187d6c622f1493630eb08: b4f66aefb5cd89dc39e187d6c622f1493630eb08

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11445/index.html

--===============2743971909529338717==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/2] lib/drmtest: Ensure the XE driver is idle before starting a test</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136408/">https://patchwork.freedesktop.org/series/136408/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11445/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11445/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7936_BAT -&gt; XEIGTPW_11445_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_11445_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_11445_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (6 -&gt; 5)</h2>
<p>Missing    (1): bat-adlp-7 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_11445_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7936/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11445/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7936/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-off.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11445/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-off.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7936/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11445/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html">DMESG-FAIL</a> +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-parallel-userptr-invalidate:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7936/bat-dg2-oem2/igt@xe_exec_balancer@twice-parallel-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11445/bat-dg2-oem2/igt@xe_exec_balancer@twice-parallel-userptr-invalidate.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-parallel-userptr-rebind:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7936/bat-atsm-2/igt@xe_exec_balancer@twice-parallel-userptr-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11445/bat-atsm-2/igt@xe_exec_balancer@twice-parallel-userptr-rebind.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-userptr-invalidate:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7936/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11445/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html">FAIL</a> +10 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7936/bat-lnl-1/igt@xe_huc_copy@huc_copy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11445/bat-lnl-1/igt@xe_huc_copy@huc_copy.html">DMESG-WARN</a> +31 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-on-idle:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7936/bat-lnl-1/igt@xe_pm_residency@gt-c6-on-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11445/bat-lnl-1/igt@xe_pm_residency@gt-c6-on-idle.html">DMESG-FAIL</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>{bat-lnl-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7936/bat-lnl-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11445/bat-lnl-2/igt@core_hotunplug@unbind-rebind.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_rmfb@rmfb-ioctl:</p>
<ul>
<li>{bat-lnl-2}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11445/bat-lnl-2/igt@kms_rmfb@rmfb-ioctl.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-imm:</p>
<ul>
<li>{bat-bmg-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7936/bat-bmg-1/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-imm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11445/bat-bmg-1/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-imm.html">FAIL</a> +35 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_basic_api:</p>
<ul>
<li>{bat-lnl-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7936/bat-lnl-2/igt@xe_gt_freq@freq_basic_api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11445/bat-lnl-2/igt@xe_gt_freq@freq_basic_api.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2@blt:</p>
<ul>
<li>{bat-lnl-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7936/bat-lnl-2/igt@xe_pat@pat-index-xe2@blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11445/bat-lnl-2/igt@xe_pat@pat-index-xe2@blt.html">DMESG-WARN</a> +16 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-on-idle:</p>
<ul>
<li>{bat-lnl-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7936/bat-lnl-2/igt@xe_pm_residency@gt-c6-on-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11445/bat-lnl-2/igt@xe_pm_residency@gt-c6-on-idle.html">DMESG-FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_7936_BAT and XEIGTPW_11445_BAT:</p>
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
<li>Exec time: [0.24] s</li>
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
<li>Exec time: [0.24] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11445_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_rmfb@rmfb-ioctl:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11445/bat-atsm-2/igt@kms_rmfb@rmfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-cm-virtual-userptr-rebind:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7936/bat-dg2-oem2/igt@xe_exec_balancer@twice-cm-virtual-userptr-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11445/bat-dg2-oem2/igt@xe_exec_balancer@twice-cm-virtual-userptr-rebind.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069</a>) +9 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-bindexecqueue:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7936/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11445/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069</a>) +10 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_range_idle:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7936/bat-lnl-1/igt@xe_gt_freq@freq_range_idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11445/bat-lnl-1/igt@xe_gt_freq@freq_range_idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1462">Intel XE#1462</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7936 -&gt; IGTPW_11445</li>
<li>Linux: xe-1651-049eae5224ed92f3cb723a492593b255654e0649 -&gt; xe-1655-b4f66aefb5cd89dc39e187d6c622f1493630eb08</li>
</ul>
<p>IGTPW_11445: a496e395191a830024be2edee464e86363749249 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7936: 7936<br />
  xe-1651-049eae5224ed92f3cb723a492593b255654e0649: 049eae5224ed92f3cb723a492593b255654e0649<br />
  xe-1655-b4f66aefb5cd89dc39e187d6c622f1493630eb08: b4f66aefb5cd89dc39e187d6c622f1493630eb08</p>

</body>
</html>

--===============2743971909529338717==--
