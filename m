Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 302F1D149F6
	for <igt-dev@archiver.kernel.org>; Fri, 25 Oct 2024 22:28:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2A4010EB9C;
	Fri, 25 Oct 2024 22:28:06 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB22410EB9C;
 Fri, 25 Oct 2024 22:28:05 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1600263821753192989=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/intel/oa=3A_Tests_for_OA?=
 =?utf-8?q?_syncs_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 25 Oct 2024 22:28:05 -0000
Message-ID: <172989528588.1334319.17587433141408274135@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241025185205.1327235-1-ashutosh.dixit@intel.com>
In-Reply-To: <20241025185205.1327235-1-ashutosh.dixit@intel.com>
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

--===============1600263821753192989==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/oa: Tests for OA syncs (rev4)
URL   : https://patchwork.freedesktop.org/series/137482/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8086_BAT -> XEIGTPW_11987_BAT
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

  Here are the changes found in XEIGTPW_11987_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_fault_mode@twice-invalid-fault:
    - bat-lnl-2:          [PASS][1] -> [DMESG-WARN][2] ([Intel XE#3230])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-lnl-2/igt@xe_exec_fault_mode@twice-invalid-fault.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/bat-lnl-2/igt@xe_exec_fault_mode@twice-invalid-fault.html

  * igt@xe_exec_reset@cm-close-fd-no-exec:
    - bat-lnl-1:          [PASS][3] -> [DMESG-WARN][4] ([Intel XE#3230])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-lnl-1/igt@xe_exec_reset@cm-close-fd-no-exec.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/bat-lnl-1/igt@xe_exec_reset@cm-close-fd-no-exec.html
    - bat-adlp-7:         [PASS][5] -> [DMESG-WARN][6] ([Intel XE#3230])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-adlp-7/igt@xe_exec_reset@cm-close-fd-no-exec.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/bat-adlp-7/igt@xe_exec_reset@cm-close-fd-no-exec.html

  * igt@xe_exec_threads@threads-mixed-basic:
    - bat-dg2-oem2:       [PASS][7] -> [DMESG-WARN][8] ([Intel XE#3230])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-basic.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-basic.html
    - bat-atsm-2:         [PASS][9] -> [DMESG-WARN][10] ([Intel XE#3230])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-atsm-2/igt@xe_exec_threads@threads-mixed-basic.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/bat-atsm-2/igt@xe_exec_threads@threads-mixed-basic.html
    - bat-pvc-2:          [PASS][11] -> [DMESG-WARN][12] ([Intel XE#3230])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-pvc-2/igt@xe_exec_threads@threads-mixed-basic.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/bat-pvc-2/igt@xe_exec_threads@threads-mixed-basic.html

  * igt@xe_live_ktest@xe_bo:
    - bat-lnl-1:          [PASS][13] -> [SKIP][14] ([Intel XE#1192]) +2 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-lnl-1/igt@xe_live_ktest@xe_bo.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/bat-lnl-1/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - bat-lnl-2:          NOTRUN -> [SKIP][15] ([Intel XE#2229]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/bat-lnl-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-adlp-7:         [PASS][16] -> [SKIP][17] ([Intel XE#1192]) +2 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - bat-atsm-2:         NOTRUN -> [SKIP][18] ([Intel XE#2229]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/bat-atsm-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
    - bat-adlp-vf:        NOTRUN -> [SKIP][19] ([Intel XE#2229]) +2 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/bat-adlp-vf/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
    - bat-pvc-2:          NOTRUN -> [SKIP][20] ([Intel XE#2229]) +2 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/bat-pvc-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  
#### Possible fixes ####

  * igt@xe_exec_compute_mode@twice-preempt-fence-early:
    - bat-pvc-2:          [DMESG-WARN][21] -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-pvc-2/igt@xe_exec_compute_mode@twice-preempt-fence-early.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/bat-pvc-2/igt@xe_exec_compute_mode@twice-preempt-fence-early.html

  * igt@xe_exec_fault_mode@twice-invalid-fault:
    - bat-lnl-1:          [DMESG-WARN][23] ([Intel XE#3230]) -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-lnl-1/igt@xe_exec_fault_mode@twice-invalid-fault.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/bat-lnl-1/igt@xe_exec_fault_mode@twice-invalid-fault.html

  * igt@xe_exec_reset@cm-close-fd-no-exec:
    - bat-adlp-vf:        [DMESG-WARN][25] ([Intel XE#3230]) -> [PASS][26]
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-adlp-vf/igt@xe_exec_reset@cm-close-fd-no-exec.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/bat-adlp-vf/igt@xe_exec_reset@cm-close-fd-no-exec.html
    - bat-lnl-2:          [DMESG-WARN][27] ([Intel XE#3230]) -> [PASS][28]
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-lnl-2/igt@xe_exec_reset@cm-close-fd-no-exec.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/bat-lnl-2/igt@xe_exec_reset@cm-close-fd-no-exec.html
    - bat-atsm-2:         [DMESG-WARN][29] ([Intel XE#3230]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-atsm-2/igt@xe_exec_reset@cm-close-fd-no-exec.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/bat-atsm-2/igt@xe_exec_reset@cm-close-fd-no-exec.html

  * igt@xe_exec_threads@threads-mixed-shared-vm-basic:
    - bat-dg2-oem2:       [DMESG-WARN][31] ([Intel XE#3230]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html

  * igt@xe_live_ktest@xe_bo:
    - bat-adlp-vf:        [SKIP][33] ([Intel XE#1192]) -> [PASS][34] +2 other tests pass
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html
    - bat-pvc-2:          [SKIP][35] ([Intel XE#1192]) -> [PASS][36] +2 other tests pass
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-pvc-2/igt@xe_live_ktest@xe_bo.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/bat-pvc-2/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-lnl-2:          [SKIP][37] ([Intel XE#1192]) -> [PASS][38] +2 other tests pass
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html
    - bat-atsm-2:         [SKIP][39] ([Intel XE#1192]) -> [PASS][40] +2 other tests pass
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html

  
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#3230]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230


Build changes
-------------

  * IGT: IGT_8086 -> IGTPW_11987
  * Linux: xe-2132-263b21a91964ddc599f4f85cf3511b0aafd2028e -> xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306

  IGTPW_11987: 690bba0c6a9a345ec062cba6ba7b6e1e4f71f6b8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8086: 18939acec2446c6644644186b090d16e366af8bc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2132-263b21a91964ddc599f4f85cf3511b0aafd2028e: 263b21a91964ddc599f4f85cf3511b0aafd2028e
  xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306: 3ec61d11c7429a65dcc3ac46b9e845f13891a306

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/index.html

--===============1600263821753192989==
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
<tr><td><b>Series:</b></td><td>tests/intel/oa: Tests for OA syncs (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137482/">https://patchwork.freedesktop.org/series/137482/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8086_BAT -&gt; XEIGTPW_11987_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11987_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_exec_fault_mode@twice-invalid-fault:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-lnl-2/igt@xe_exec_fault_mode@twice-invalid-fault.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/bat-lnl-2/igt@xe_exec_fault_mode@twice-invalid-fault.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-close-fd-no-exec:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-lnl-1/igt@xe_exec_reset@cm-close-fd-no-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/bat-lnl-1/igt@xe_exec_reset@cm-close-fd-no-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>)</li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-adlp-7/igt@xe_exec_reset@cm-close-fd-no-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/bat-adlp-7/igt@xe_exec_reset@cm-close-fd-no-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-basic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>)</li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-atsm-2/igt@xe_exec_threads@threads-mixed-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/bat-atsm-2/igt@xe_exec_threads@threads-mixed-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>)</li>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-pvc-2/igt@xe_exec_threads@threads-mixed-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/bat-pvc-2/igt@xe_exec_threads@threads-mixed-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-lnl-1/igt@xe_live_ktest@xe_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/bat-lnl-1/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/bat-lnl-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/bat-atsm-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) +1 other test skip</li>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/bat-adlp-vf/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) +2 other tests skip</li>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/bat-pvc-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@xe_exec_compute_mode@twice-preempt-fence-early:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-pvc-2/igt@xe_exec_compute_mode@twice-preempt-fence-early.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/bat-pvc-2/igt@xe_exec_compute_mode@twice-preempt-fence-early.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-invalid-fault:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-lnl-1/igt@xe_exec_fault_mode@twice-invalid-fault.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/bat-lnl-1/igt@xe_exec_fault_mode@twice-invalid-fault.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-close-fd-no-exec:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-adlp-vf/igt@xe_exec_reset@cm-close-fd-no-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/bat-adlp-vf/igt@xe_exec_reset@cm-close-fd-no-exec.html">PASS</a></li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-lnl-2/igt@xe_exec_reset@cm-close-fd-no-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/bat-lnl-2/igt@xe_exec_reset@cm-close-fd-no-exec.html">PASS</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-atsm-2/igt@xe_exec_reset@cm-close-fd-no-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/bat-atsm-2/igt@xe_exec_reset@cm-close-fd-no-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-shared-vm-basic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html">PASS</a> +2 other tests pass</li>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-pvc-2/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/bat-pvc-2/igt@xe_live_ktest@xe_bo.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html">PASS</a> +2 other tests pass</li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11987/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8086 -&gt; IGTPW_11987</li>
<li>Linux: xe-2132-263b21a91964ddc599f4f85cf3511b0aafd2028e -&gt; xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306</li>
</ul>
<p>IGTPW_11987: 690bba0c6a9a345ec062cba6ba7b6e1e4f71f6b8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8086: 18939acec2446c6644644186b090d16e366af8bc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2132-263b21a91964ddc599f4f85cf3511b0aafd2028e: 263b21a91964ddc599f4f85cf3511b0aafd2028e<br />
  xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306: 3ec61d11c7429a65dcc3ac46b9e845f13891a306</p>

</body>
</html>

--===============1600263821753192989==--
