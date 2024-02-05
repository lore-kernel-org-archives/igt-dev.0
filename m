Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2A38C4828D
	for <igt-dev@archiver.kernel.org>; Mon,  5 Feb 2024 06:52:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7972D1123DB;
	Mon,  5 Feb 2024 06:52:23 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45C5D1123DB;
 Mon,  5 Feb 2024 06:52:21 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6202009099094490458=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fexec=5Fque?=
 =?utf-8?q?ue=5Fproperty=3A_Remove_persistence_queue_property_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 05 Feb 2024 06:52:21 -0000
Message-ID: <170711594128.1024297.16856088557012424303@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240205061808.44032-1-tejas.upadhyay@intel.com>
In-Reply-To: <20240205061808.44032-1-tejas.upadhyay@intel.com>
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

--===============6202009099094490458==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_exec_queue_property: Remove persistence queue property (rev2)
URL   : https://patchwork.freedesktop.org/series/129521/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_14217 -> IGTPW_10634
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10634/index.html

Participating hosts (34 -> 24)
------------------------------

  Missing    (10): fi-kbl-7567u bat-dg1-7 bat-dg2-9 fi-ilk-650 fi-apl-guc fi-ivb-3770 fi-cfl-8109u bat-jsl-3 fi-blb-e6850 bat-jsl-1 

Known issues
------------

  Here are the changes found in IGTPW_10634 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@debugfs_test@basic-hwmon:
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][1] ([i915#9318])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10634/fi-tgl-1115g4/igt@debugfs_test@basic-hwmon.html

  * igt@fbdev@info:
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][2] ([i915#1849] / [i915#2582])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10634/fi-tgl-1115g4/igt@fbdev@info.html

  * igt@fbdev@nullptr:
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][3] ([i915#2582]) +3 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10634/fi-tgl-1115g4/igt@fbdev@nullptr.html

  * igt@gem_huc_copy@huc-copy:
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][4] ([i915#2190])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10634/fi-tgl-1115g4/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][5] ([i915#4613]) +3 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10634/fi-tgl-1115g4/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@kms_busy@basic:
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][6] ([i915#10158] / [i915#4303])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10634/fi-tgl-1115g4/igt@kms_busy@basic.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][7] ([i915#10158]) +15 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10634/fi-tgl-1115g4/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html

  * igt@kms_flip@basic-plain-flip:
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][8] ([i915#3637]) +3 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10634/fi-tgl-1115g4/igt@kms_flip@basic-plain-flip.html

  * igt@kms_force_connector_basic@force-load-detect:
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][9] ([fdo#109285])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10634/fi-tgl-1115g4/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_frontbuffer_tracking@basic:
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][10] ([i915#1849])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10634/fi-tgl-1115g4/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pm_backlight@basic-brightness:
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][11] ([i915#9812])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10634/fi-tgl-1115g4/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][12] ([i915#3555])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10634/fi-tgl-1115g4/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-fence-flip:
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][13] ([fdo#109295] / [i915#10158])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10634/fi-tgl-1115g4/igt@prime_vgem@basic-fence-flip.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [i915#10158]: https://gitlab.freedesktop.org/drm/intel/issues/10158
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#4303]: https://gitlab.freedesktop.org/drm/intel/issues/4303
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#9318]: https://gitlab.freedesktop.org/drm/intel/issues/9318
  [i915#9732]: https://gitlab.freedesktop.org/drm/intel/issues/9732
  [i915#9812]: https://gitlab.freedesktop.org/drm/intel/issues/9812
  [i915#9840]: https://gitlab.freedesktop.org/drm/intel/issues/9840


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7702 -> IGTPW_10634

  CI-20190529: 20190529
  CI_DRM_14217: c0cd32d2c1404e5c1218a158e47e6a580e098b61 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10634: 10634
  IGT_7702: bf075a74ece1956fc0e554291591b9da3eab54cf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

-igt@gem_mmap@multigpu-basic
-igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic
-igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind
-igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap
-igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue
-igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind
-igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr
-igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate
-igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race
-igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind
-igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null
-igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind
-igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap
-igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind
-igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind
-igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr
-igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate
-igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race
-igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind
-igt@xe_exec_basic@multigpu-no-exec-basic
-igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind
-igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap
-igt@xe_exec_basic@multigpu-no-exec-bindexecqueue
-igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind
-igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr
-igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate
-igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race
-igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind
-igt@xe_exec_basic@multigpu-no-exec-null
-igt@xe_exec_basic@multigpu-no-exec-null-defer-bind
-igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap
-igt@xe_exec_basic@multigpu-no-exec-null-rebind
-igt@xe_exec_basic@multigpu-no-exec-rebind
-igt@xe_exec_basic@multigpu-no-exec-userptr
-igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate
-igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race
-igt@xe_exec_basic@multigpu-no-exec-userptr-rebind
-igt@xe_exec_basic@multigpu-once-basic
-igt@xe_exec_basic@multigpu-once-basic-defer-bind
-igt@xe_exec_basic@multigpu-once-basic-defer-mmap
-igt@xe_exec_basic@multigpu-once-bindexecqueue
-igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind
-igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr
-igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate
-igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race
-igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind
-igt@xe_exec_basic@multigpu-once-null
-igt@xe_exec_basic@multigpu-once-null-defer-bind
-igt@xe_exec_basic@multigpu-once-null-defer-mmap
-igt@xe_exec_basic@multigpu-once-null-rebind
-igt@xe_exec_basic@multigpu-once-rebind
-igt@xe_exec_basic@multigpu-once-userptr
-igt@xe_exec_basic@multigpu-once-userptr-invalidate
-igt@xe_exec_basic@multigpu-once-userptr-invalidate-race
-igt@xe_exec_basic@multigpu-once-userptr-rebind
-igt@xe_exec_queue_property@persistence-set-property

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10634/index.html

--===============6202009099094490458==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_exec_queue_property: Remove persistence queue property (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129521/">https://patchwork.freedesktop.org/series/129521/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10634/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10634/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14217 -&gt; IGTPW_10634</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10634/index.html</p>
<h2>Participating hosts (34 -&gt; 24)</h2>
<p>Missing    (10): fi-kbl-7567u bat-dg1-7 bat-dg2-9 fi-ilk-650 fi-apl-guc fi-ivb-3770 fi-cfl-8109u bat-jsl-3 fi-blb-e6850 bat-jsl-1 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10634 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@debugfs_test@basic-hwmon:</p>
<ul>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10634/fi-tgl-1115g4/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9318">i915#9318</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10634/fi-tgl-1115g4/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10634/fi-tgl-1115g4/igt@fbdev@nullptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10634/fi-tgl-1115g4/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10634/fi-tgl-1115g4/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic:</p>
<ul>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10634/fi-tgl-1115g4/igt@kms_busy@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10158">i915#10158</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4303">i915#4303</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:</p>
<ul>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10634/fi-tgl-1115g4/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10158">i915#10158</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip:</p>
<ul>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10634/fi-tgl-1115g4/igt@kms_flip@basic-plain-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3637">i915#3637</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10634/fi-tgl-1115g4/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10634/fi-tgl-1115g4/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10634/fi-tgl-1115g4/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9812">i915#9812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10634/fi-tgl-1115g4/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10634/fi-tgl-1115g4/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/10158">i915#10158</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7702 -&gt; IGTPW_10634</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14217: c0cd32d2c1404e5c1218a158e47e6a580e098b61 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10634: 10634<br />
  IGT_7702: bf075a74ece1956fc0e554291591b9da3eab54cf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>-igt@gem_mmap@multigpu-basic<br />
-igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic<br />
-igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind<br />
-igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap<br />
-igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue<br />
-igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind<br />
-igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr<br />
-igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate<br />
-igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race<br />
-igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind<br />
-igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null<br />
-igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind<br />
-igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap<br />
-igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind<br />
-igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind<br />
-igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr<br />
-igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate<br />
-igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race<br />
-igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind<br />
-igt@xe_exec_basic@multigpu-no-exec-basic<br />
-igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind<br />
-igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap<br />
-igt@xe_exec_basic@multigpu-no-exec-bindexecqueue<br />
-igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind<br />
-igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr<br />
-igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate<br />
-igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race<br />
-igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind<br />
-igt@xe_exec_basic@multigpu-no-exec-null<br />
-igt@xe_exec_basic@multigpu-no-exec-null-defer-bind<br />
-igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap<br />
-igt@xe_exec_basic@multigpu-no-exec-null-rebind<br />
-igt@xe_exec_basic@multigpu-no-exec-rebind<br />
-igt@xe_exec_basic@multigpu-no-exec-userptr<br />
-igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate<br />
-igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race<br />
-igt@xe_exec_basic@multigpu-no-exec-userptr-rebind<br />
-igt@xe_exec_basic@multigpu-once-basic<br />
-igt@xe_exec_basic@multigpu-once-basic-defer-bind<br />
-igt@xe_exec_basic@multigpu-once-basic-defer-mmap<br />
-igt@xe_exec_basic@multigpu-once-bindexecqueue<br />
-igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind<br />
-igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr<br />
-igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate<br />
-igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race<br />
-igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind<br />
-igt@xe_exec_basic@multigpu-once-null<br />
-igt@xe_exec_basic@multigpu-once-null-defer-bind<br />
-igt@xe_exec_basic@multigpu-once-null-defer-mmap<br />
-igt@xe_exec_basic@multigpu-once-null-rebind<br />
-igt@xe_exec_basic@multigpu-once-rebind<br />
-igt@xe_exec_basic@multigpu-once-userptr<br />
-igt@xe_exec_basic@multigpu-once-userptr-invalidate<br />
-igt@xe_exec_basic@multigpu-once-userptr-invalidate-race<br />
-igt@xe_exec_basic@multigpu-once-userptr-rebind<br />
-igt@xe_exec_queue_property@persistence-set-property</p>

</body>
</html>

--===============6202009099094490458==--
