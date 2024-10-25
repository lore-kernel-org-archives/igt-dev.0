Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2E4DD116EF
	for <igt-dev@archiver.kernel.org>; Fri, 25 Oct 2024 05:26:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5190A10E02E;
	Fri, 25 Oct 2024 05:26:29 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F3AF10E02E;
 Fri, 25 Oct 2024 05:26:27 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7032771956706088005=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/intel/xe=5Fexec=5Ffault?=
 =?utf-8?q?=5Fmode=3A_wait_for_the_completion_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Yang, Fei" <fei.yang@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 25 Oct 2024 05:26:27 -0000
Message-ID: <172983398757.1330837.4289520661620503013@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241025002322.1422552-1-fei.yang@intel.com>
In-Reply-To: <20241025002322.1422552-1-fei.yang@intel.com>
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

--===============7032771956706088005==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_exec_fault_mode: wait for the completion (rev2)
URL   : https://patchwork.freedesktop.org/series/140464/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8082_BAT -> XEIGTPW_11979_BAT
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

  Here are the changes found in XEIGTPW_11979_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_reset@cm-close-fd-no-exec:
    - bat-adlp-vf:        [PASS][1] -> [DMESG-WARN][2] ([Intel XE#3230])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/bat-adlp-vf/igt@xe_exec_reset@cm-close-fd-no-exec.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11979/bat-adlp-vf/igt@xe_exec_reset@cm-close-fd-no-exec.html
    - bat-pvc-2:          [PASS][3] -> [DMESG-WARN][4] ([Intel XE#3230])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/bat-pvc-2/igt@xe_exec_reset@cm-close-fd-no-exec.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11979/bat-pvc-2/igt@xe_exec_reset@cm-close-fd-no-exec.html
    - bat-lnl-1:          [PASS][5] -> [DMESG-WARN][6] ([Intel XE#3230])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/bat-lnl-1/igt@xe_exec_reset@cm-close-fd-no-exec.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11979/bat-lnl-1/igt@xe_exec_reset@cm-close-fd-no-exec.html
    - bat-bmg-2:          [PASS][7] -> [DMESG-WARN][8] ([Intel XE#3230])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/bat-bmg-2/igt@xe_exec_reset@cm-close-fd-no-exec.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11979/bat-bmg-2/igt@xe_exec_reset@cm-close-fd-no-exec.html
    - bat-bmg-1:          [PASS][9] -> [DMESG-WARN][10] ([Intel XE#3230])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/bat-bmg-1/igt@xe_exec_reset@cm-close-fd-no-exec.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11979/bat-bmg-1/igt@xe_exec_reset@cm-close-fd-no-exec.html
    - bat-adlp-7:         [PASS][11] -> [DMESG-WARN][12] ([Intel XE#3230])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/bat-adlp-7/igt@xe_exec_reset@cm-close-fd-no-exec.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11979/bat-adlp-7/igt@xe_exec_reset@cm-close-fd-no-exec.html
    - bat-lnl-2:          [PASS][13] -> [DMESG-WARN][14] ([Intel XE#3230])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/bat-lnl-2/igt@xe_exec_reset@cm-close-fd-no-exec.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11979/bat-lnl-2/igt@xe_exec_reset@cm-close-fd-no-exec.html
    - bat-dg2-oem2:       [PASS][15] -> [DMESG-WARN][16] ([Intel XE#3230])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/bat-dg2-oem2/igt@xe_exec_reset@cm-close-fd-no-exec.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11979/bat-dg2-oem2/igt@xe_exec_reset@cm-close-fd-no-exec.html

  * igt@xe_exec_threads@threads-mixed-basic:
    - bat-atsm-2:         [PASS][17] -> [DMESG-WARN][18] ([Intel XE#3230])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/bat-atsm-2/igt@xe_exec_threads@threads-mixed-basic.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11979/bat-atsm-2/igt@xe_exec_threads@threads-mixed-basic.html

  * igt@xe_live_ktest@xe_bo:
    - bat-adlp-vf:        [PASS][19] -> [SKIP][20] ([Intel XE#1192]) +2 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11979/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html
    - bat-lnl-1:          [PASS][21] -> [SKIP][22] ([Intel XE#1192]) +2 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/bat-lnl-1/igt@xe_live_ktest@xe_bo.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11979/bat-lnl-1/igt@xe_live_ktest@xe_bo.html
    - bat-pvc-2:          [PASS][23] -> [SKIP][24] ([Intel XE#1192]) +2 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/bat-pvc-2/igt@xe_live_ktest@xe_bo.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11979/bat-pvc-2/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_dma_buf:
    - bat-bmg-2:          NOTRUN -> [SKIP][25] ([Intel XE#1192]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11979/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-bmg-1:          [PASS][26] -> [SKIP][27] ([Intel XE#1192]) +2 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11979/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html
    - bat-adlp-7:         [PASS][28] -> [SKIP][29] ([Intel XE#1192]) +2 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11979/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html
    - bat-lnl-2:          [PASS][30] -> [SKIP][31] ([Intel XE#1192]) +2 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11979/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html
    - bat-dg2-oem2:       [PASS][32] -> [SKIP][33] ([Intel XE#1192]) +2 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11979/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html

  
#### Warnings ####

  * igt@kms_dsc@dsc-basic:
    - bat-lnl-1:          [SKIP][34] ([Intel XE#599]) -> [SKIP][35] ([Intel XE#2244])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/bat-lnl-1/igt@kms_dsc@dsc-basic.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11979/bat-lnl-1/igt@kms_dsc@dsc-basic.html

  * igt@xe_live_ktest@xe_bo:
    - bat-bmg-2:          [INCOMPLETE][36] ([Intel XE#2874] / [Intel XE#2998]) -> [SKIP][37] ([Intel XE#1192])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/bat-bmg-2/igt@xe_live_ktest@xe_bo.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11979/bat-bmg-2/igt@xe_live_ktest@xe_bo.html

  
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874
  [Intel XE#2998]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2998
  [Intel XE#3230]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599


Build changes
-------------

  * IGT: IGT_8082 -> IGTPW_11979
  * Linux: xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52 -> xe-2125-75eab7b9ee32a121d95a42ac704b679097f1fac4

  IGTPW_11979: 1cf517d6fea9e4996ecef282f21da77bac092f3e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8082: c8379ec8b26f3c21bae5473706b23da78bd26ffa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52: beaeaccd284ba3b69b6dbfdc18bb89441fc99a52
  xe-2125-75eab7b9ee32a121d95a42ac704b679097f1fac4: 75eab7b9ee32a121d95a42ac704b679097f1fac4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11979/index.html

--===============7032771956706088005==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_exec_fault_mode: wait for the completion (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140464/">https://patchwork.freedesktop.org/series/140464/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11979/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11979/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8082_BAT -&gt; XEIGTPW_11979_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11979_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_exec_reset@cm-close-fd-no-exec:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/bat-adlp-vf/igt@xe_exec_reset@cm-close-fd-no-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11979/bat-adlp-vf/igt@xe_exec_reset@cm-close-fd-no-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>)</li>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/bat-pvc-2/igt@xe_exec_reset@cm-close-fd-no-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11979/bat-pvc-2/igt@xe_exec_reset@cm-close-fd-no-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>)</li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/bat-lnl-1/igt@xe_exec_reset@cm-close-fd-no-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11979/bat-lnl-1/igt@xe_exec_reset@cm-close-fd-no-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>)</li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/bat-bmg-2/igt@xe_exec_reset@cm-close-fd-no-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11979/bat-bmg-2/igt@xe_exec_reset@cm-close-fd-no-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>)</li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/bat-bmg-1/igt@xe_exec_reset@cm-close-fd-no-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11979/bat-bmg-1/igt@xe_exec_reset@cm-close-fd-no-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>)</li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/bat-adlp-7/igt@xe_exec_reset@cm-close-fd-no-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11979/bat-adlp-7/igt@xe_exec_reset@cm-close-fd-no-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>)</li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/bat-lnl-2/igt@xe_exec_reset@cm-close-fd-no-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11979/bat-lnl-2/igt@xe_exec_reset@cm-close-fd-no-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>)</li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/bat-dg2-oem2/igt@xe_exec_reset@cm-close-fd-no-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11979/bat-dg2-oem2/igt@xe_exec_reset@cm-close-fd-no-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-basic:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/bat-atsm-2/igt@xe_exec_threads@threads-mixed-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11979/bat-atsm-2/igt@xe_exec_threads@threads-mixed-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11979/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +2 other tests skip</li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/bat-lnl-1/igt@xe_live_ktest@xe_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11979/bat-lnl-1/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +2 other tests skip</li>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/bat-pvc-2/igt@xe_live_ktest@xe_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11979/bat-pvc-2/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11979/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11979/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +2 other tests skip</li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11979/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +2 other tests skip</li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11979/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +2 other tests skip</li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11979/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/bat-lnl-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11979/bat-lnl-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/bat-bmg-2/igt@xe_live_ktest@xe_bo.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874">Intel XE#2874</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2998">Intel XE#2998</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11979/bat-bmg-2/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8082 -&gt; IGTPW_11979</li>
<li>Linux: xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52 -&gt; xe-2125-75eab7b9ee32a121d95a42ac704b679097f1fac4</li>
</ul>
<p>IGTPW_11979: 1cf517d6fea9e4996ecef282f21da77bac092f3e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8082: c8379ec8b26f3c21bae5473706b23da78bd26ffa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52: beaeaccd284ba3b69b6dbfdc18bb89441fc99a52<br />
  xe-2125-75eab7b9ee32a121d95a42ac704b679097f1fac4: 75eab7b9ee32a121d95a42ac704b679097f1fac4</p>

</body>
</html>

--===============7032771956706088005==--
