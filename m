Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54F68C46CD2
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jan 2024 18:54:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAB3D11343F;
	Tue, 30 Jan 2024 18:54:24 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC081113430;
 Tue, 30 Jan 2024 18:54:23 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4917680972898510022=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_tests/kms=5Fprime=3A_Add_XE?=
 =?utf-8?q?_support_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nidhi Gupta" <nidhi1.gupta@intel.com>
Date: Tue, 30 Jan 2024 18:54:23 -0000
Message-ID: <170664086389.824492.14744116576238949897@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240130182033.24900-1-nidhi1.gupta@intel.com>
In-Reply-To: <20240130182033.24900-1-nidhi1.gupta@intel.com>
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
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

--===============4917680972898510022==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_prime: Add XE support (rev5)
URL   : https://patchwork.freedesktop.org/series/128045/
State : success

== Summary ==

CI Bug Log - changes from IGT_7699 -> IGTPW_10607
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10607/index.html

Participating hosts (38 -> 36)
------------------------------

  Missing    (2): bat-mtlp-8 fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_10607 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@debugfs_test@basic-hwmon:
    - bat-jsl-1:          NOTRUN -> [SKIP][1] ([i915#9318])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10607/bat-jsl-1/igt@debugfs_test@basic-hwmon.html

  * igt@gem_huc_copy@huc-copy:
    - bat-jsl-1:          NOTRUN -> [SKIP][2] ([i915#2190])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10607/bat-jsl-1/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@verify-random:
    - bat-mtlp-6:         NOTRUN -> [SKIP][3] ([i915#4613]) +3 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10607/bat-mtlp-6/igt@gem_lmem_swapping@verify-random.html
    - bat-jsl-1:          NOTRUN -> [SKIP][4] ([i915#4613]) +3 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10607/bat-jsl-1/igt@gem_lmem_swapping@verify-random.html

  * igt@i915_pm_rps@basic-api:
    - bat-mtlp-6:         NOTRUN -> [SKIP][5] ([i915#6621])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10607/bat-mtlp-6/igt@i915_pm_rps@basic-api.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - bat-jsl-1:          NOTRUN -> [SKIP][6] ([i915#4103]) +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10607/bat-jsl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-jsl-1:          NOTRUN -> [SKIP][7] ([i915#3555] / [i915#9886])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10607/bat-jsl-1/igt@kms_dsc@dsc-basic.html

  * igt@kms_force_connector_basic@force-load-detect:
    - bat-mtlp-6:         NOTRUN -> [SKIP][8] ([fdo#109285] / [i915#9792])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10607/bat-mtlp-6/igt@kms_force_connector_basic@force-load-detect.html
    - bat-jsl-1:          NOTRUN -> [SKIP][9] ([fdo#109285])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10607/bat-jsl-1/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - bat-mtlp-6:         NOTRUN -> [SKIP][10] ([i915#5274] / [i915#9792])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10607/bat-mtlp-6/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-mtlp-6:         NOTRUN -> [SKIP][11] ([i915#4342] / [i915#5354] / [i915#9792])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10607/bat-mtlp-6/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@hang-read-crc:
    - bat-mtlp-6:         NOTRUN -> [SKIP][12] ([i915#9792]) +6 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10607/bat-mtlp-6/igt@kms_pipe_crc_basic@hang-read-crc.html

  * igt@kms_pm_backlight@basic-brightness:
    - bat-mtlp-6:         NOTRUN -> [SKIP][13] ([i915#5354] / [i915#9792])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10607/bat-mtlp-6/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-jsl-1:          NOTRUN -> [SKIP][14] ([i915#3555])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10607/bat-jsl-1/igt@kms_setmode@basic-clone-single-crtc.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][15] ([i915#3555] / [i915#8809] / [i915#9792])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10607/bat-mtlp-6/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-fence-flip:
    - bat-mtlp-6:         NOTRUN -> [SKIP][16] ([i915#3708] / [i915#9792])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10607/bat-mtlp-6/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-fence-mmap:
    - bat-mtlp-6:         NOTRUN -> [SKIP][17] ([i915#3708] / [i915#4077]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10607/bat-mtlp-6/igt@prime_vgem@basic-fence-mmap.html

  * igt@prime_vgem@basic-write:
    - bat-mtlp-6:         NOTRUN -> [SKIP][18] ([i915#3708]) +2 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10607/bat-mtlp-6/igt@prime_vgem@basic-write.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@hangcheck:
    - {bat-adls-6}:       [DMESG-WARN][19] ([i915#5591]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adls-6/igt@i915_selftest@live@hangcheck.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10607/bat-adls-6/igt@i915_selftest@live@hangcheck.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4342]: https://gitlab.freedesktop.org/drm/intel/issues/4342
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#5591]: https://gitlab.freedesktop.org/drm/intel/issues/5591
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#8809]: https://gitlab.freedesktop.org/drm/intel/issues/8809
  [i915#9318]: https://gitlab.freedesktop.org/drm/intel/issues/9318
  [i915#9673]: https://gitlab.freedesktop.org/drm/intel/issues/9673
  [i915#9732]: https://gitlab.freedesktop.org/drm/intel/issues/9732
  [i915#9792]: https://gitlab.freedesktop.org/drm/intel/issues/9792
  [i915#9886]: https://gitlab.freedesktop.org/drm/intel/issues/9886


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7699 -> IGTPW_10607

  CI-20190529: 20190529
  CI_DRM_14193: c655e0fd28045dbaa581d04bf7cc266eec1c3457 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10607: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10607/index.html
  IGT_7699: 7699


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

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10607/index.html

--===============4917680972898510022==
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
<tr><td><b>Series:</b></td><td>tests/kms_prime: Add XE support (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/128045/">https://patchwork.freedesktop.org/series/128045/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10607/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10607/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7699 -&gt; IGTPW_10607</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10607/index.html</p>
<h2>Participating hosts (38 -&gt; 36)</h2>
<p>Missing    (2): bat-mtlp-8 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10607 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@debugfs_test@basic-hwmon:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10607/bat-jsl-1/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9318">i915#9318</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10607/bat-jsl-1/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10607/bat-mtlp-6/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 other tests skip</li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10607/bat-jsl-1/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10607/bat-mtlp-6/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10607/bat-jsl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10607/bat-jsl-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9886">i915#9886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10607/bat-mtlp-6/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9792">i915#9792</a>)</li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10607/bat-jsl-1/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10607/bat-mtlp-6/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5274">i915#5274</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9792">i915#9792</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10607/bat-mtlp-6/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4342">i915#4342</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9792">i915#9792</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10607/bat-mtlp-6/igt@kms_pipe_crc_basic@hang-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9792">i915#9792</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10607/bat-mtlp-6/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9792">i915#9792</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10607/bat-jsl-1/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10607/bat-mtlp-6/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8809">i915#8809</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9792">i915#9792</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10607/bat-mtlp-6/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9792">i915#9792</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-mmap:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10607/bat-mtlp-6/igt@prime_vgem@basic-fence-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10607/bat-mtlp-6/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@hangcheck:<ul>
<li>{bat-adls-6}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7699/bat-adls-6/igt@i915_selftest@live@hangcheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5591">i915#5591</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10607/bat-adls-6/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7699 -&gt; IGTPW_10607</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14193: c655e0fd28045dbaa581d04bf7cc266eec1c3457 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10607: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10607/index.html<br />
  IGT_7699: 7699</p>
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
-igt@xe_exec_basic@multigpu-once-userptr-rebind</p>

</body>
</html>

--===============4917680972898510022==--
