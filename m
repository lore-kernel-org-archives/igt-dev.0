Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F4AAD0C5EC
	for <igt-dev@archiver.kernel.org>; Fri, 25 Oct 2024 09:05:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E22F910EA3B;
	Fri, 25 Oct 2024 09:05:18 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 182AF10EA3B;
 Fri, 25 Oct 2024 09:05:17 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7834031460353718961=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/xe=3A_Add_tests_to_valid?=
 =?utf-8?q?ate_GT_coarse_power_gating_status_and_toggle_coarse_power_gating_?=
 =?utf-8?q?states_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: sk.anirban@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 25 Oct 2024 09:05:17 -0000
Message-ID: <172984711709.1331517.15223568808285106079@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241025055959.2152585-1-sk.anirban@intel.com>
In-Reply-To: <20241025055959.2152585-1-sk.anirban@intel.com>
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

--===============7834031460353718961==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/xe: Add tests to validate GT coarse power gating status and toggle coarse power gating states (rev3)
URL   : https://patchwork.freedesktop.org/series/140473/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8083_BAT -> XEIGTPW_11981_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_11981_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-adlp-7:         [PASS][1] -> [DMESG-WARN][2] ([Intel XE#2871])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11981/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_psr@psr-cursor-plane-move:
    - bat-adlp-7:         [PASS][3] -> [SKIP][4] ([Intel XE#455]) +3 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11981/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html

  * igt@kms_psr@psr-primary-page-flip@edp-1:
    - bat-adlp-7:         [PASS][5] -> [DMESG-FAIL][6] ([Intel XE#2871]) +1 other test dmesg-fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/bat-adlp-7/igt@kms_psr@psr-primary-page-flip@edp-1.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11981/bat-adlp-7/igt@kms_psr@psr-primary-page-flip@edp-1.html

  * igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate:
    - bat-lnl-1:          [PASS][7] -> [FAIL][8] ([Intel XE#2754])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11981/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@twice-invalid-fault:
    - bat-lnl-1:          [PASS][9] -> [DMESG-WARN][10] ([Intel XE#3230])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/bat-lnl-1/igt@xe_exec_fault_mode@twice-invalid-fault.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11981/bat-lnl-1/igt@xe_exec_fault_mode@twice-invalid-fault.html

  * igt@xe_exec_reset@cm-close-fd-no-exec:
    - bat-adlp-7:         [PASS][11] -> [DMESG-WARN][12] ([Intel XE#3230])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/bat-adlp-7/igt@xe_exec_reset@cm-close-fd-no-exec.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11981/bat-adlp-7/igt@xe_exec_reset@cm-close-fd-no-exec.html

  * igt@xe_exec_threads@threads-mixed-basic:
    - bat-dg2-oem2:       [PASS][13] -> [DMESG-WARN][14] ([Intel XE#3230])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-basic.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11981/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-basic.html
    - bat-pvc-2:          [PASS][15] -> [DMESG-WARN][16] ([Intel XE#3230])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/bat-pvc-2/igt@xe_exec_threads@threads-mixed-basic.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11981/bat-pvc-2/igt@xe_exec_threads@threads-mixed-basic.html

  * igt@xe_exec_threads@threads-mixed-fd-basic:
    - bat-adlp-vf:        [PASS][17] -> [DMESG-WARN][18] ([Intel XE#3230])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/bat-adlp-vf/igt@xe_exec_threads@threads-mixed-fd-basic.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11981/bat-adlp-vf/igt@xe_exec_threads@threads-mixed-fd-basic.html

  * igt@xe_exec_threads@threads-mixed-shared-vm-basic:
    - bat-bmg-1:          [PASS][19] -> [DMESG-WARN][20] ([Intel XE#3230])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/bat-bmg-1/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11981/bat-bmg-1/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - bat-lnl-2:          NOTRUN -> [SKIP][21] ([Intel XE#2229]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11981/bat-lnl-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - bat-bmg-1:          NOTRUN -> [SKIP][22] ([Intel XE#2229])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11981/bat-bmg-1/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-adlp-7:         [PASS][23] -> [SKIP][24] ([Intel XE#1192]) +2 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11981/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][25] ([Intel XE#2229])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11981/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
    - bat-adlp-vf:        NOTRUN -> [SKIP][26] ([Intel XE#2229]) +2 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11981/bat-adlp-vf/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  
#### Possible fixes ####

  * igt@xe_exec_fault_mode@twice-invalid-fault:
    - bat-pvc-2:          [DMESG-WARN][27] ([Intel XE#3230]) -> [PASS][28]
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/bat-pvc-2/igt@xe_exec_fault_mode@twice-invalid-fault.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11981/bat-pvc-2/igt@xe_exec_fault_mode@twice-invalid-fault.html

  * igt@xe_exec_fault_mode@twice-invalid-userptr-fault:
    - bat-lnl-1:          [DMESG-WARN][29] ([Intel XE#3230]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/bat-lnl-1/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11981/bat-lnl-1/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html

  * igt@xe_exec_reset@cm-close-fd-no-exec:
    - bat-adlp-vf:        [DMESG-WARN][31] ([Intel XE#3230]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/bat-adlp-vf/igt@xe_exec_reset@cm-close-fd-no-exec.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11981/bat-adlp-vf/igt@xe_exec_reset@cm-close-fd-no-exec.html
    - bat-bmg-1:          [DMESG-WARN][33] ([Intel XE#3230]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/bat-bmg-1/igt@xe_exec_reset@cm-close-fd-no-exec.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11981/bat-bmg-1/igt@xe_exec_reset@cm-close-fd-no-exec.html
    - bat-lnl-2:          [DMESG-WARN][35] ([Intel XE#3230]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/bat-lnl-2/igt@xe_exec_reset@cm-close-fd-no-exec.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11981/bat-lnl-2/igt@xe_exec_reset@cm-close-fd-no-exec.html
    - bat-dg2-oem2:       [DMESG-WARN][37] ([Intel XE#3230]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/bat-dg2-oem2/igt@xe_exec_reset@cm-close-fd-no-exec.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11981/bat-dg2-oem2/igt@xe_exec_reset@cm-close-fd-no-exec.html

  * igt@xe_exec_threads@threads-mixed-fd-basic:
    - bat-adlp-7:         [DMESG-WARN][39] ([Intel XE#3230]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/bat-adlp-7/igt@xe_exec_threads@threads-mixed-fd-basic.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11981/bat-adlp-7/igt@xe_exec_threads@threads-mixed-fd-basic.html

  * igt@xe_live_ktest@xe_bo:
    - bat-adlp-vf:        [SKIP][41] ([Intel XE#1192]) -> [PASS][42] +2 other tests pass
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11981/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-bmg-1:          [SKIP][43] ([Intel XE#1192]) -> [PASS][44] +2 other tests pass
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11981/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html
    - bat-lnl-2:          [SKIP][45] ([Intel XE#1192]) -> [PASS][46] +2 other tests pass
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11981/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html
    - bat-dg2-oem2:       [SKIP][47] ([Intel XE#1192]) -> [PASS][48] +2 other tests pass
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11981/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html

  
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2754]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2754
  [Intel XE#2871]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2871
  [Intel XE#3230]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455


Build changes
-------------

  * IGT: IGT_8083 -> IGTPW_11981
  * Linux: xe-2125-75eab7b9ee32a121d95a42ac704b679097f1fac4 -> xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107

  IGTPW_11981: 543e56460dbdac145fcd067d6000e0cfb0db172b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8083: 73f910ebf47fe8f379d2e233cab754e4d6091701 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2125-75eab7b9ee32a121d95a42ac704b679097f1fac4: 75eab7b9ee32a121d95a42ac704b679097f1fac4
  xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107: 8fb857e3bba9a5e5fa43d99cf5863608cde9c107

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11981/index.html

--===============7834031460353718961==
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
<tr><td><b>Series:</b></td><td>tests/xe: Add tests to validate GT coarse power gating status and toggle coarse power gating states (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140473/">https://patchwork.freedesktop.org/series/140473/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11981/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11981/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8083_BAT -&gt; XEIGTPW_11981_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11981_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11981/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2871">Intel XE#2871</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11981/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip@edp-1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/bat-adlp-7/igt@kms_psr@psr-primary-page-flip@edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11981/bat-adlp-7/igt@kms_psr@psr-primary-page-flip@edp-1.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2871">Intel XE#2871</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11981/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2754">Intel XE#2754</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-invalid-fault:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/bat-lnl-1/igt@xe_exec_fault_mode@twice-invalid-fault.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11981/bat-lnl-1/igt@xe_exec_fault_mode@twice-invalid-fault.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-close-fd-no-exec:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/bat-adlp-7/igt@xe_exec_reset@cm-close-fd-no-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11981/bat-adlp-7/igt@xe_exec_reset@cm-close-fd-no-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-basic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11981/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>)</li>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/bat-pvc-2/igt@xe_exec_threads@threads-mixed-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11981/bat-pvc-2/igt@xe_exec_threads@threads-mixed-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-fd-basic:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/bat-adlp-vf/igt@xe_exec_threads@threads-mixed-fd-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11981/bat-adlp-vf/igt@xe_exec_threads@threads-mixed-fd-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-shared-vm-basic:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/bat-bmg-1/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11981/bat-bmg-1/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11981/bat-lnl-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11981/bat-bmg-1/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11981/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11981/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11981/bat-adlp-vf/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@xe_exec_fault_mode@twice-invalid-fault:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/bat-pvc-2/igt@xe_exec_fault_mode@twice-invalid-fault.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11981/bat-pvc-2/igt@xe_exec_fault_mode@twice-invalid-fault.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-invalid-userptr-fault:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/bat-lnl-1/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11981/bat-lnl-1/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-close-fd-no-exec:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/bat-adlp-vf/igt@xe_exec_reset@cm-close-fd-no-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11981/bat-adlp-vf/igt@xe_exec_reset@cm-close-fd-no-exec.html">PASS</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/bat-bmg-1/igt@xe_exec_reset@cm-close-fd-no-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11981/bat-bmg-1/igt@xe_exec_reset@cm-close-fd-no-exec.html">PASS</a></li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/bat-lnl-2/igt@xe_exec_reset@cm-close-fd-no-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11981/bat-lnl-2/igt@xe_exec_reset@cm-close-fd-no-exec.html">PASS</a></li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/bat-dg2-oem2/igt@xe_exec_reset@cm-close-fd-no-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11981/bat-dg2-oem2/igt@xe_exec_reset@cm-close-fd-no-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-fd-basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/bat-adlp-7/igt@xe_exec_threads@threads-mixed-fd-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11981/bat-adlp-7/igt@xe_exec_threads@threads-mixed-fd-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11981/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11981/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html">PASS</a> +2 other tests pass</li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11981/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html">PASS</a> +2 other tests pass</li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8083/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11981/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8083 -&gt; IGTPW_11981</li>
<li>Linux: xe-2125-75eab7b9ee32a121d95a42ac704b679097f1fac4 -&gt; xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107</li>
</ul>
<p>IGTPW_11981: 543e56460dbdac145fcd067d6000e0cfb0db172b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8083: 73f910ebf47fe8f379d2e233cab754e4d6091701 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2125-75eab7b9ee32a121d95a42ac704b679097f1fac4: 75eab7b9ee32a121d95a42ac704b679097f1fac4<br />
  xe-2126-8fb857e3bba9a5e5fa43d99cf5863608cde9c107: 8fb857e3bba9a5e5fa43d99cf5863608cde9c107</p>

</body>
</html>

--===============7834031460353718961==--
