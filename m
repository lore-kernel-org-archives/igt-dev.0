Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD9EBC54E58
	for <igt-dev@archiver.kernel.org>; Mon, 18 Mar 2024 19:24:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8538110FDEB;
	Mon, 18 Mar 2024 19:24:21 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B4D310FDEB;
 Mon, 18 Mar 2024 19:24:20 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2159133515005154935=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_introduce_Xe_multigpu_and_o?=
 =?utf-8?q?ther_multi-GPU_helpers_=28rev13=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 18 Mar 2024 19:24:20 -0000
Message-ID: <171078986024.886689.10363719487241912143@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240318132624.110746-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20240318132624.110746-1-kamil.konieczny@linux.intel.com>
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

--===============2159133515005154935==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: introduce Xe multigpu and other multi-GPU helpers (rev13)
URL   : https://patchwork.freedesktop.org/series/129101/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_14443 -> IGTPW_10856
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10856/index.html

Participating hosts (35 -> 33)
------------------------------

  Additional (2): bat-arls-4 bat-jsl-1 
  Missing    (4): bat-kbl-2 fi-kbl-8809g fi-apl-guc fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_10856 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@debugfs_test@basic-hwmon:
    - bat-jsl-1:          NOTRUN -> [SKIP][1] ([i915#9318])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10856/bat-jsl-1/igt@debugfs_test@basic-hwmon.html

  * igt@gem_huc_copy@huc-copy:
    - fi-cfl-8109u:       NOTRUN -> [SKIP][2] ([i915#2190])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10856/fi-cfl-8109u/igt@gem_huc_copy@huc-copy.html
    - bat-jsl-1:          NOTRUN -> [SKIP][3] ([i915#2190])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10856/bat-jsl-1/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@basic@lmem0:
    - bat-dg2-14:         [PASS][4] -> [FAIL][5] ([i915#10378])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14443/bat-dg2-14/igt@gem_lmem_swapping@basic@lmem0.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10856/bat-dg2-14/igt@gem_lmem_swapping@basic@lmem0.html

  * igt@gem_lmem_swapping@verify-random:
    - fi-cfl-8109u:       NOTRUN -> [SKIP][6] ([i915#4613]) +3 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10856/fi-cfl-8109u/igt@gem_lmem_swapping@verify-random.html
    - bat-jsl-1:          NOTRUN -> [SKIP][7] ([i915#4613]) +3 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10856/bat-jsl-1/igt@gem_lmem_swapping@verify-random.html

  * igt@i915_selftest@live@dmabuf:
    - bat-arls-3:         [PASS][8] -> [DMESG-FAIL][9] ([i915#10249])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14443/bat-arls-3/igt@i915_selftest@live@dmabuf.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10856/bat-arls-3/igt@i915_selftest@live@dmabuf.html

  * igt@i915_selftest@live@gt_engines:
    - bat-adls-6:         [PASS][10] -> [TIMEOUT][11] ([i915#10026] / [i915#10134])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14443/bat-adls-6/igt@i915_selftest@live@gt_engines.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10856/bat-adls-6/igt@i915_selftest@live@gt_engines.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - bat-jsl-1:          NOTRUN -> [SKIP][12] ([i915#4103]) +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10856/bat-jsl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-jsl-1:          NOTRUN -> [SKIP][13] ([i915#3555] / [i915#9886])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10856/bat-jsl-1/igt@kms_dsc@dsc-basic.html

  * igt@kms_force_connector_basic@force-edid:
    - bat-dg2-8:          [PASS][14] -> [INCOMPLETE][15] ([i915#10419])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14443/bat-dg2-8/igt@kms_force_connector_basic@force-edid.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10856/bat-dg2-8/igt@kms_force_connector_basic@force-edid.html

  * igt@kms_force_connector_basic@force-load-detect:
    - bat-jsl-1:          NOTRUN -> [SKIP][16]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10856/bat-jsl-1/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_pm_backlight@basic-brightness:
    - fi-cfl-8109u:       NOTRUN -> [SKIP][17] +11 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10856/fi-cfl-8109u/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-jsl-1:          NOTRUN -> [SKIP][18] ([i915#3555])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10856/bat-jsl-1/igt@kms_setmode@basic-clone-single-crtc.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@hangcheck:
    - bat-adlp-6:         [ABORT][19] ([i915#10021]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14443/bat-adlp-6/igt@i915_selftest@live@hangcheck.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10856/bat-adlp-6/igt@i915_selftest@live@hangcheck.html
    - bat-rpls-3:         [DMESG-WARN][21] ([i915#5591]) -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14443/bat-rpls-3/igt@i915_selftest@live@hangcheck.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10856/bat-rpls-3/igt@i915_selftest@live@hangcheck.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10021]: https://gitlab.freedesktop.org/drm/intel/issues/10021
  [i915#10026]: https://gitlab.freedesktop.org/drm/intel/issues/10026
  [i915#10134]: https://gitlab.freedesktop.org/drm/intel/issues/10134
  [i915#10196]: https://gitlab.freedesktop.org/drm/intel/issues/10196
  [i915#10197]: https://gitlab.freedesktop.org/drm/intel/issues/10197
  [i915#10200]: https://gitlab.freedesktop.org/drm/intel/issues/10200
  [i915#10202]: https://gitlab.freedesktop.org/drm/intel/issues/10202
  [i915#10206]: https://gitlab.freedesktop.org/drm/intel/issues/10206
  [i915#10207]: https://gitlab.freedesktop.org/drm/intel/issues/10207
  [i915#10208]: https://gitlab.freedesktop.org/drm/intel/issues/10208
  [i915#10209]: https://gitlab.freedesktop.org/drm/intel/issues/10209
  [i915#10211]: https://gitlab.freedesktop.org/drm/intel/issues/10211
  [i915#10212]: https://gitlab.freedesktop.org/drm/intel/issues/10212
  [i915#10213]: https://gitlab.freedesktop.org/drm/intel/issues/10213
  [i915#10214]: https://gitlab.freedesktop.org/drm/intel/issues/10214
  [i915#10216]: https://gitlab.freedesktop.org/drm/intel/issues/10216
  [i915#10249]: https://gitlab.freedesktop.org/drm/intel/issues/10249
  [i915#10378]: https://gitlab.freedesktop.org/drm/intel/issues/10378
  [i915#10419]: https://gitlab.freedesktop.org/drm/intel/issues/10419
  [i915#10436]: https://gitlab.freedesktop.org/drm/intel/issues/10436
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#5591]: https://gitlab.freedesktop.org/drm/intel/issues/5591
  [i915#8809]: https://gitlab.freedesktop.org/drm/intel/issues/8809
  [i915#9318]: https://gitlab.freedesktop.org/drm/intel/issues/9318
  [i915#9732]: https://gitlab.freedesktop.org/drm/intel/issues/9732
  [i915#9812]: https://gitlab.freedesktop.org/drm/intel/issues/9812
  [i915#9886]: https://gitlab.freedesktop.org/drm/intel/issues/9886


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7769 -> IGTPW_10856

  CI-20190529: 20190529
  CI_DRM_14443: ce8cc731d53f9197a853b0d00386d7835f2b80e6 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10856: 10856
  IGT_7769: 7769


Testlist changes
----------------

+igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic
+igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind
+igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap
+igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue
+igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind
+igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr
+igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate
+igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race
+igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind
+igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null
+igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind
+igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap
+igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind
+igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind
+igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr
+igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate
+igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race
+igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind
+igt@xe_exec_basic@multigpu-no-exec-basic
+igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind
+igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap
+igt@xe_exec_basic@multigpu-no-exec-bindexecqueue
+igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind
+igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr
+igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate
+igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race
+igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind
+igt@xe_exec_basic@multigpu-no-exec-null
+igt@xe_exec_basic@multigpu-no-exec-null-defer-bind
+igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap
+igt@xe_exec_basic@multigpu-no-exec-null-rebind
+igt@xe_exec_basic@multigpu-no-exec-rebind
+igt@xe_exec_basic@multigpu-no-exec-userptr
+igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate
+igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race
+igt@xe_exec_basic@multigpu-no-exec-userptr-rebind
+igt@xe_exec_basic@multigpu-once-basic
+igt@xe_exec_basic@multigpu-once-basic-defer-bind
+igt@xe_exec_basic@multigpu-once-basic-defer-mmap
+igt@xe_exec_basic@multigpu-once-bindexecqueue
+igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind
+igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr
+igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate
+igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race
+igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind
+igt@xe_exec_basic@multigpu-once-null
+igt@xe_exec_basic@multigpu-once-null-defer-bind
+igt@xe_exec_basic@multigpu-once-null-defer-mmap
+igt@xe_exec_basic@multigpu-once-null-rebind
+igt@xe_exec_basic@multigpu-once-rebind
+igt@xe_exec_basic@multigpu-once-userptr
+igt@xe_exec_basic@multigpu-once-userptr-invalidate
+igt@xe_exec_basic@multigpu-once-userptr-invalidate-race
+igt@xe_exec_basic@multigpu-once-userptr-rebind

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10856/index.html

--===============2159133515005154935==
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
<tr><td><b>Series:</b></td><td>introduce Xe multigpu and other multi-GPU helpers (rev13)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129101/">https://patchwork.freedesktop.org/series/129101/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10856/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10856/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14443 -&gt; IGTPW_10856</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10856/index.html</p>
<h2>Participating hosts (35 -&gt; 33)</h2>
<p>Additional (2): bat-arls-4 bat-jsl-1 <br />
  Missing    (4): bat-kbl-2 fi-kbl-8809g fi-apl-guc fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10856 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@debugfs_test@basic-hwmon:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10856/bat-jsl-1/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9318">i915#9318</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10856/fi-cfl-8109u/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10856/bat-jsl-1/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic@lmem0:</p>
<ul>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14443/bat-dg2-14/igt@gem_lmem_swapping@basic@lmem0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10856/bat-dg2-14/igt@gem_lmem_swapping@basic@lmem0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10378">i915#10378</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10856/fi-cfl-8109u/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 other tests skip</li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10856/bat-jsl-1/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@dmabuf:</p>
<ul>
<li>bat-arls-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14443/bat-arls-3/igt@i915_selftest@live@dmabuf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10856/bat-arls-3/igt@i915_selftest@live@dmabuf.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10249">i915#10249</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_engines:</p>
<ul>
<li>bat-adls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14443/bat-adls-6/igt@i915_selftest@live@gt_engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10856/bat-adls-6/igt@i915_selftest@live@gt_engines.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10026">i915#10026</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/10134">i915#10134</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10856/bat-jsl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10856/bat-jsl-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9886">i915#9886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-edid:</p>
<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14443/bat-dg2-8/igt@kms_force_connector_basic@force-edid.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10856/bat-dg2-8/igt@kms_force_connector_basic@force-edid.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10419">i915#10419</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10856/bat-jsl-1/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10856/fi-cfl-8109u/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10856/bat-jsl-1/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@hangcheck:<ul>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14443/bat-adlp-6/igt@i915_selftest@live@hangcheck.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10021">i915#10021</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10856/bat-adlp-6/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
<li>bat-rpls-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14443/bat-rpls-3/igt@i915_selftest@live@hangcheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5591">i915#5591</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10856/bat-rpls-3/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7769 -&gt; IGTPW_10856</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14443: ce8cc731d53f9197a853b0d00386d7835f2b80e6 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10856: 10856<br />
  IGT_7769: 7769</p>
<h2>Testlist changes</h2>
<p>+igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic<br />
+igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind<br />
+igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap<br />
+igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue<br />
+igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind<br />
+igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr<br />
+igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate<br />
+igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race<br />
+igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind<br />
+igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null<br />
+igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind<br />
+igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap<br />
+igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind<br />
+igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind<br />
+igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr<br />
+igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate<br />
+igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race<br />
+igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind<br />
+igt@xe_exec_basic@multigpu-no-exec-basic<br />
+igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind<br />
+igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap<br />
+igt@xe_exec_basic@multigpu-no-exec-bindexecqueue<br />
+igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind<br />
+igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr<br />
+igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate<br />
+igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race<br />
+igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind<br />
+igt@xe_exec_basic@multigpu-no-exec-null<br />
+igt@xe_exec_basic@multigpu-no-exec-null-defer-bind<br />
+igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap<br />
+igt@xe_exec_basic@multigpu-no-exec-null-rebind<br />
+igt@xe_exec_basic@multigpu-no-exec-rebind<br />
+igt@xe_exec_basic@multigpu-no-exec-userptr<br />
+igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate<br />
+igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race<br />
+igt@xe_exec_basic@multigpu-no-exec-userptr-rebind<br />
+igt@xe_exec_basic@multigpu-once-basic<br />
+igt@xe_exec_basic@multigpu-once-basic-defer-bind<br />
+igt@xe_exec_basic@multigpu-once-basic-defer-mmap<br />
+igt@xe_exec_basic@multigpu-once-bindexecqueue<br />
+igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind<br />
+igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr<br />
+igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate<br />
+igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race<br />
+igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind<br />
+igt@xe_exec_basic@multigpu-once-null<br />
+igt@xe_exec_basic@multigpu-once-null-defer-bind<br />
+igt@xe_exec_basic@multigpu-once-null-defer-mmap<br />
+igt@xe_exec_basic@multigpu-once-null-rebind<br />
+igt@xe_exec_basic@multigpu-once-rebind<br />
+igt@xe_exec_basic@multigpu-once-userptr<br />
+igt@xe_exec_basic@multigpu-once-userptr-invalidate<br />
+igt@xe_exec_basic@multigpu-once-userptr-invalidate-race<br />
+igt@xe_exec_basic@multigpu-once-userptr-rebind</p>

</body>
</html>

--===============2159133515005154935==--
