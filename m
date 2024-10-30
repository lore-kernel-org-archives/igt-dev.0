Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21BBDD5CC9A
	for <igt-dev@archiver.kernel.org>; Wed, 30 Oct 2024 11:21:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E11410E030;
	Wed, 30 Oct 2024 11:21:30 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA68510E030;
 Wed, 30 Oct 2024 11:21:28 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8951218487517439315=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/amdgpu/amd=5Freplay=3A_A?=
 =?utf-8?q?dd_some_page_flips_before_test_start?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tom Chung" <chiahsuan.chung@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 30 Oct 2024 11:21:28 -0000
Message-ID: <173028728869.1363061.4032547298085564159@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241030095301.11671-1-chiahsuan.chung@amd.com>
In-Reply-To: <20241030095301.11671-1-chiahsuan.chung@amd.com>
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

--===============8951218487517439315==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/amdgpu/amd_replay: Add some page flips before test start
URL   : https://patchwork.freedesktop.org/series/140721/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8088_BAT -> XEIGTPW_12001_BAT
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

  Here are the changes found in XEIGTPW_12001_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:
    - bat-pvc-2:          [PASS][1] -> [DMESG-WARN][2] ([Intel XE#3295])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-pvc-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12001/bat-pvc-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html

  * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
    - bat-adlp-7:         [PASS][3] -> [INCOMPLETE][4] ([Intel XE#2874]) +1 other test incomplete
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12001/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html

  
#### Possible fixes ####

  * igt@kms_psr@psr-cursor-plane-move:
    - bat-adlp-7:         [SKIP][5] ([Intel XE#455]) -> [PASS][6] +1 other test pass
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12001/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html

  * igt@kms_psr@psr-primary-page-flip@edp-1:
    - bat-adlp-7:         [DMESG-FAIL][7] ([Intel XE#2871]) -> [PASS][8] +1 other test pass
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-adlp-7/igt@kms_psr@psr-primary-page-flip@edp-1.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12001/bat-adlp-7/igt@kms_psr@psr-primary-page-flip@edp-1.html

  * igt@xe_exec_fault_mode@twice-basic:
    - bat-pvc-2:          [DMESG-WARN][9] ([Intel XE#3295]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-pvc-2/igt@xe_exec_fault_mode@twice-basic.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12001/bat-pvc-2/igt@xe_exec_fault_mode@twice-basic.html

  
#### Warnings ####

  * igt@kms_psr@psr-sprite-plane-onoff:
    - bat-adlp-7:         [SKIP][11] ([Intel XE#455]) -> [DMESG-FAIL][12] ([Intel XE#2871]) +1 other test dmesg-fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-adlp-7/igt@kms_psr@psr-sprite-plane-onoff.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12001/bat-adlp-7/igt@kms_psr@psr-sprite-plane-onoff.html

  
  [Intel XE#2871]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2871
  [Intel XE#2874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874
  [Intel XE#3295]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3295
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455


Build changes
-------------

  * IGT: IGT_8088 -> IGTPW_12001
  * Linux: xe-2139-fb2691707e2d5a8c704ae5e48bc5a314a308b0e0 -> xe-2141-b79238531f1e5a4f707fdc34bb6a32325bce10c7

  IGTPW_12001: b31baefb3021103507591c87aa54eccf66f7d4d3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8088: 0030d5bc92b8e4ac991db1c88af1f0ad7593812a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2139-fb2691707e2d5a8c704ae5e48bc5a314a308b0e0: fb2691707e2d5a8c704ae5e48bc5a314a308b0e0
  xe-2141-b79238531f1e5a4f707fdc34bb6a32325bce10c7: b79238531f1e5a4f707fdc34bb6a32325bce10c7

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12001/index.html

--===============8951218487517439315==
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
<tr><td><b>Series:</b></td><td>tests/amdgpu/amd_replay: Add some page flips before test start</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140721/">https://patchwork.freedesktop.org/series/140721/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12001/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12001/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8088_BAT -&gt; XEIGTPW_12001_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12001_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-pvc-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12001/bat-pvc-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3295">Intel XE#3295</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12001/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874">Intel XE#2874</a>) +1 other test incomplete</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12001/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip@edp-1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-adlp-7/igt@kms_psr@psr-primary-page-flip@edp-1.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2871">Intel XE#2871</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12001/bat-adlp-7/igt@kms_psr@psr-primary-page-flip@edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-basic:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-pvc-2/igt@xe_exec_fault_mode@twice-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3295">Intel XE#3295</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12001/bat-pvc-2/igt@xe_exec_fault_mode@twice-basic.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_psr@psr-sprite-plane-onoff:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8088/bat-adlp-7/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12001/bat-adlp-7/igt@kms_psr@psr-sprite-plane-onoff.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2871">Intel XE#2871</a>) +1 other test dmesg-fail</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8088 -&gt; IGTPW_12001</li>
<li>Linux: xe-2139-fb2691707e2d5a8c704ae5e48bc5a314a308b0e0 -&gt; xe-2141-b79238531f1e5a4f707fdc34bb6a32325bce10c7</li>
</ul>
<p>IGTPW_12001: b31baefb3021103507591c87aa54eccf66f7d4d3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8088: 0030d5bc92b8e4ac991db1c88af1f0ad7593812a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2139-fb2691707e2d5a8c704ae5e48bc5a314a308b0e0: fb2691707e2d5a8c704ae5e48bc5a314a308b0e0<br />
  xe-2141-b79238531f1e5a4f707fdc34bb6a32325bce10c7: b79238531f1e5a4f707fdc34bb6a32325bce10c7</p>

</body>
</html>

--===============8951218487517439315==--
