Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8820D7876C
	for <igt-dev@archiver.kernel.org>; Thu, 21 Nov 2024 14:36:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 814AB10E974;
	Thu, 21 Nov 2024 14:36:08 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5919810E974;
 Thu, 21 Nov 2024 14:36:07 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0850798534263797940=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Feudebug=5F?=
 =?utf-8?q?online=3A_Introduce_read/write_pagefault_tests_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gwan-gyeong Mun" <gwan-gyeong.mun@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 21 Nov 2024 14:36:07 -0000
Message-ID: <173219976738.1200949.9547654389488405966@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241121122230.451423-1-gwan-gyeong.mun@intel.com>
In-Reply-To: <20241121122230.451423-1-gwan-gyeong.mun@intel.com>
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

--===============0850798534263797940==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_eudebug_online: Introduce read/write pagefault tests (rev2)
URL   : https://patchwork.freedesktop.org/series/141401/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8118_BAT -> XEIGTPW_12158_BAT
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

  Here are the changes found in XEIGTPW_12158_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-adlp-7:         [PASS][1] -> [DMESG-WARN][2] ([Intel XE#3517]) +2 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12158/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_psr@psr-cursor-plane-move:
    - bat-adlp-7:         [PASS][3] -> [SKIP][4] ([Intel XE#455]) +3 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12158/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - bat-lnl-2:          NOTRUN -> [SKIP][5] ([Intel XE#2229]) +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12158/bat-lnl-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - bat-lnl-1:          NOTRUN -> [SKIP][6] ([Intel XE#2229]) +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12158/bat-lnl-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  
#### Possible fixes ####

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch:
    - bat-lnl-1:          [DMESG-FAIL][7] ([Intel XE#3466]) -> [PASS][8] +33 other tests pass
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/bat-lnl-1/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12158/bat-lnl-1/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:
    - bat-lnl-2:          [DMESG-FAIL][9] ([Intel XE#3466]) -> [PASS][10] +33 other tests pass
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/bat-lnl-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12158/bat-lnl-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html

  * igt@xe_exec_threads@threads-basic:
    - bat-lnl-1:          [DMESG-WARN][11] ([Intel XE#3466]) -> [PASS][12] +3 other tests pass
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/bat-lnl-1/igt@xe_exec_threads@threads-basic.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12158/bat-lnl-1/igt@xe_exec_threads@threads-basic.html

  * igt@xe_exec_threads@threads-mixed-basic:
    - bat-lnl-2:          [DMESG-WARN][13] ([Intel XE#3466]) -> [PASS][14] +3 other tests pass
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/bat-lnl-2/igt@xe_exec_threads@threads-mixed-basic.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12158/bat-lnl-2/igt@xe_exec_threads@threads-mixed-basic.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-lnl-2:          [SKIP][15] ([Intel XE#1192]) -> [PASS][16] +1 other test pass
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12158/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html
    - bat-lnl-1:          [SKIP][17] ([Intel XE#1192]) -> [PASS][18] +1 other test pass
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/bat-lnl-1/igt@xe_live_ktest@xe_migrate.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12158/bat-lnl-1/igt@xe_live_ktest@xe_migrate.html

  
#### Warnings ####

  * igt@kms_dsc@dsc-basic:
    - bat-adlp-7:         [SKIP][19] ([Intel XE#3443] / [Intel XE#455]) -> [SKIP][20] ([Intel XE#455])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/bat-adlp-7/igt@kms_dsc@dsc-basic.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12158/bat-adlp-7/igt@kms_dsc@dsc-basic.html

  * igt@xe_evict@evict-beng-small:
    - bat-adlp-7:         [SKIP][21] ([Intel XE#261] / [Intel XE#3443] / [Intel XE#688]) -> [SKIP][22] ([Intel XE#261] / [Intel XE#688]) +15 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/bat-adlp-7/igt@xe_evict@evict-beng-small.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12158/bat-adlp-7/igt@xe_evict@evict-beng-small.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:
    - bat-adlp-7:         [SKIP][23] ([Intel XE#3443] / [Intel XE#688]) -> [SKIP][24] ([Intel XE#688]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12158/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:
    - bat-adlp-7:         [SKIP][25] ([Intel XE#288] / [Intel XE#3443]) -> [SKIP][26] ([Intel XE#288]) +32 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12158/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html

  * igt@xe_live_ktest@xe_bo:
    - bat-lnl-1:          [SKIP][27] ([Intel XE#1192]) -> [SKIP][28] ([Intel XE#2229])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/bat-lnl-1/igt@xe_live_ktest@xe_bo.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12158/bat-lnl-1/igt@xe_live_ktest@xe_bo.html
    - bat-lnl-2:          [SKIP][29] ([Intel XE#1192]) -> [SKIP][30] ([Intel XE#2229])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/bat-lnl-2/igt@xe_live_ktest@xe_bo.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12158/bat-lnl-2/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - bat-adlp-7:         [SKIP][31] ([Intel XE#2229] / [Intel XE#3443] / [Intel XE#455]) -> [SKIP][32] ([Intel XE#2229] / [Intel XE#455]) +2 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12158/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - bat-adlp-7:         [SKIP][33] ([Intel XE#2229] / [Intel XE#3443]) -> [SKIP][34] ([Intel XE#2229])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/bat-adlp-7/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12158/bat-adlp-7/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_mmap@vram:
    - bat-adlp-7:         [SKIP][35] ([Intel XE#1008] / [Intel XE#3443]) -> [SKIP][36] ([Intel XE#1008])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/bat-adlp-7/igt@xe_mmap@vram.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12158/bat-adlp-7/igt@xe_mmap@vram.html

  * igt@xe_pat@pat-index-xe2:
    - bat-atsm-2:         [SKIP][37] ([Intel XE#2839] / [Intel XE#977]) -> [SKIP][38] ([Intel XE#977])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/bat-atsm-2/igt@xe_pat@pat-index-xe2.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12158/bat-atsm-2/igt@xe_pat@pat-index-xe2.html
    - bat-adlp-vf:        [SKIP][39] ([Intel XE#2839] / [Intel XE#977]) -> [SKIP][40] ([Intel XE#977])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/bat-adlp-vf/igt@xe_pat@pat-index-xe2.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12158/bat-adlp-vf/igt@xe_pat@pat-index-xe2.html
    - bat-adlp-7:         [SKIP][41] ([Intel XE#2839] / [Intel XE#3443] / [Intel XE#977]) -> [SKIP][42] ([Intel XE#977])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/bat-adlp-7/igt@xe_pat@pat-index-xe2.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12158/bat-adlp-7/igt@xe_pat@pat-index-xe2.html
    - bat-dg2-oem2:       [SKIP][43] ([Intel XE#2839] / [Intel XE#977]) -> [SKIP][44] ([Intel XE#977])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12158/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-adlp-7:         [SKIP][45] ([Intel XE#2838] / [Intel XE#3443] / [Intel XE#979]) -> [SKIP][46] ([Intel XE#2838] / [Intel XE#979])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/bat-adlp-7/igt@xe_pat@pat-index-xehpc.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12158/bat-adlp-7/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelp:
    - bat-bmg-2:          [SKIP][47] ([Intel XE#2237] / [Intel XE#2245]) -> [SKIP][48] ([Intel XE#2245])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/bat-bmg-2/igt@xe_pat@pat-index-xelp.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12158/bat-bmg-2/igt@xe_pat@pat-index-xelp.html
    - bat-bmg-1:          [SKIP][49] ([Intel XE#2237] / [Intel XE#2245]) -> [SKIP][50] ([Intel XE#2245])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/bat-bmg-1/igt@xe_pat@pat-index-xelp.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12158/bat-bmg-1/igt@xe_pat@pat-index-xelp.html
    - bat-lnl-2:          [SKIP][51] ([Intel XE#2237] / [Intel XE#977]) -> [SKIP][52] ([Intel XE#977])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/bat-lnl-2/igt@xe_pat@pat-index-xelp.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12158/bat-lnl-2/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - bat-adlp-7:         [SKIP][53] ([Intel XE#3443] / [Intel XE#979]) -> [SKIP][54] ([Intel XE#979])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/bat-adlp-7/igt@xe_pat@pat-index-xelpg.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12158/bat-adlp-7/igt@xe_pat@pat-index-xelpg.html

  
  [Intel XE#1008]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2237]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2237
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2839]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2839
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#3443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3443
  [Intel XE#3466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3466
  [Intel XE#3517]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3517
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * IGT: IGT_8118 -> IGTPW_12158
  * Linux: xe-2252-f8f85a38f6c75e091805f01ceff4041ac2fdf3fd -> xe-2257-e46649e7764a9f6868ccbcba7b8b23b413303380

  IGTPW_12158: 12158
  IGT_8118: 17707095f1e5d3c30f463b43022f01c0160579b6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2252-f8f85a38f6c75e091805f01ceff4041ac2fdf3fd: f8f85a38f6c75e091805f01ceff4041ac2fdf3fd
  xe-2257-e46649e7764a9f6868ccbcba7b8b23b413303380: e46649e7764a9f6868ccbcba7b8b23b413303380

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12158/index.html

--===============0850798534263797940==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_eudebug_online: Introduce read/write pagefault tests (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/141401/">https://patchwork.freedesktop.org/series/141401/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12158/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12158/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8118_BAT -&gt; XEIGTPW_12158_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12158_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12158/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3517">Intel XE#3517</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12158/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12158/bat-lnl-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12158/bat-lnl-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/bat-lnl-1/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3466">Intel XE#3466</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12158/bat-lnl-1/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch.html">PASS</a> +33 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/bat-lnl-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3466">Intel XE#3466</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12158/bat-lnl-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">PASS</a> +33 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-basic:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/bat-lnl-1/igt@xe_exec_threads@threads-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3466">Intel XE#3466</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12158/bat-lnl-1/igt@xe_exec_threads@threads-basic.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-basic:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/bat-lnl-2/igt@xe_exec_threads@threads-mixed-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3466">Intel XE#3466</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12158/bat-lnl-2/igt@xe_exec_threads@threads-mixed-basic.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12158/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html">PASS</a> +1 other test pass</li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/bat-lnl-1/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12158/bat-lnl-1/igt@xe_live_ktest@xe_migrate.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/bat-adlp-7/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3443">Intel XE#3443</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12158/bat-adlp-7/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/bat-adlp-7/igt@xe_evict@evict-beng-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3443">Intel XE#3443</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12158/bat-adlp-7/igt@xe_evict@evict-beng-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3443">Intel XE#3443</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12158/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3443">Intel XE#3443</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12158/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/bat-lnl-1/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12158/bat-lnl-1/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/bat-lnl-2/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12158/bat-lnl-2/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3443">Intel XE#3443</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12158/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/bat-adlp-7/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3443">Intel XE#3443</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12158/bat-adlp-7/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/bat-adlp-7/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008">Intel XE#1008</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3443">Intel XE#3443</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12158/bat-adlp-7/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008">Intel XE#1008</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/bat-atsm-2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2839">Intel XE#2839</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12158/bat-atsm-2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/bat-adlp-vf/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2839">Intel XE#2839</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12158/bat-adlp-vf/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/bat-adlp-7/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2839">Intel XE#2839</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3443">Intel XE#3443</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12158/bat-adlp-7/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2839">Intel XE#2839</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12158/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/bat-adlp-7/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3443">Intel XE#3443</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12158/bat-adlp-7/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/bat-bmg-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2237">Intel XE#2237</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12158/bat-bmg-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a>)</li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/bat-bmg-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2237">Intel XE#2237</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12158/bat-bmg-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a>)</li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/bat-lnl-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2237">Intel XE#2237</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12158/bat-lnl-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/bat-adlp-7/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3443">Intel XE#3443</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12158/bat-adlp-7/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8118 -&gt; IGTPW_12158</li>
<li>Linux: xe-2252-f8f85a38f6c75e091805f01ceff4041ac2fdf3fd -&gt; xe-2257-e46649e7764a9f6868ccbcba7b8b23b413303380</li>
</ul>
<p>IGTPW_12158: 12158<br />
  IGT_8118: 17707095f1e5d3c30f463b43022f01c0160579b6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2252-f8f85a38f6c75e091805f01ceff4041ac2fdf3fd: f8f85a38f6c75e091805f01ceff4041ac2fdf3fd<br />
  xe-2257-e46649e7764a9f6868ccbcba7b8b23b413303380: e46649e7764a9f6868ccbcba7b8b23b413303380</p>

</body>
</html>

--===============0850798534263797940==--
