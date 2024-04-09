Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91C96CD128A
	for <igt-dev@archiver.kernel.org>; Tue,  9 Apr 2024 23:22:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCE6A10E7FC;
	Tue,  9 Apr 2024 23:22:42 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52EB1112FF9;
 Tue,  9 Apr 2024 23:22:40 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8297125964960573209=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_series_starting_with_=5Bi-g?=
 =?utf-8?q?-t=2C1/3=5D_tests/intel/xe=5Fwedged=3A_Introduce_a_new_test_for_X?=
 =?utf-8?q?e_device_wedged_state?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 09 Apr 2024 23:22:40 -0000
Message-ID: <171270496032.1318715.15580508155717362078@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240409221908.1077893-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240409221908.1077893-1-rodrigo.vivi@intel.com>
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

--===============8297125964960573209==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/3] tests/intel/xe_wedged: Introduce a new test for Xe device wedged state
URL   : https://patchwork.freedesktop.org/series/132234/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_14552 -> IGTPW_10993
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10993/index.html

Participating hosts (37 -> 29)
------------------------------

  Additional (3): bat-kbl-2 fi-rkl-11600 fi-cfl-8109u 
  Missing    (11): fi-kbl-7567u bat-mtlp-8 fi-bsw-n3050 fi-apl-guc fi-glk-j4005 fi-kbl-8809g bat-atsm-1 fi-elk-e7500 bat-dg2-11 bat-jsl-1 bat-arls-2 

Known issues
------------

  Here are the changes found in IGTPW_10993 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@debugfs_test@basic-hwmon:
    - fi-rkl-11600:       NOTRUN -> [SKIP][1] ([i915#9318])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10993/fi-rkl-11600/igt@debugfs_test@basic-hwmon.html

  * igt@fbdev@info:
    - bat-kbl-2:          NOTRUN -> [SKIP][2] ([i915#1849])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10993/bat-kbl-2/igt@fbdev@info.html

  * igt@gem_huc_copy@huc-copy:
    - fi-cfl-8109u:       NOTRUN -> [SKIP][3] ([i915#2190])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10993/fi-cfl-8109u/igt@gem_huc_copy@huc-copy.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][4] ([i915#2190])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10993/fi-rkl-11600/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - bat-kbl-2:          NOTRUN -> [SKIP][5] +39 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10993/bat-kbl-2/igt@gem_lmem_swapping@parallel-random-engines.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][6] ([i915#4613]) +3 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10993/fi-rkl-11600/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@gem_lmem_swapping@verify-random:
    - fi-cfl-8109u:       NOTRUN -> [SKIP][7] ([i915#4613]) +3 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10993/fi-cfl-8109u/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_tiled_pread_basic:
    - fi-rkl-11600:       NOTRUN -> [SKIP][8] ([i915#3282])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10993/fi-rkl-11600/igt@gem_tiled_pread_basic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - fi-rkl-11600:       NOTRUN -> [SKIP][9] ([i915#4103]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10993/fi-rkl-11600/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_dsc@dsc-basic:
    - fi-rkl-11600:       NOTRUN -> [SKIP][10] ([i915#3555] / [i915#3840])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10993/fi-rkl-11600/igt@kms_dsc@dsc-basic.html

  * igt@kms_force_connector_basic@force-load-detect:
    - fi-rkl-11600:       NOTRUN -> [SKIP][11]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10993/fi-rkl-11600/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_pm_backlight@basic-brightness:
    - fi-rkl-11600:       NOTRUN -> [SKIP][12] ([i915#5354])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10993/fi-rkl-11600/igt@kms_pm_backlight@basic-brightness.html
    - fi-cfl-8109u:       NOTRUN -> [SKIP][13] +11 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10993/fi-cfl-8109u/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - fi-rkl-11600:       NOTRUN -> [SKIP][14] ([i915#1072] / [i915#9732]) +3 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10993/fi-rkl-11600/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - fi-rkl-11600:       NOTRUN -> [SKIP][15] ([i915#3555])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10993/fi-rkl-11600/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-read:
    - fi-rkl-11600:       NOTRUN -> [SKIP][16] ([i915#3291] / [i915#3708]) +2 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10993/fi-rkl-11600/igt@prime_vgem@basic-read.html

  
#### Possible fixes ####

  * igt@gem_lmem_swapping@basic@lmem0:
    - bat-dg2-9:          [FAIL][17] ([i915#10378]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14552/bat-dg2-9/igt@gem_lmem_swapping@basic@lmem0.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10993/bat-dg2-9/igt@gem_lmem_swapping@basic@lmem0.html

  * igt@i915_selftest@live@gt_contexts:
    - bat-dg2-8:          [ABORT][19] ([i915#10366]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14552/bat-dg2-8/igt@i915_selftest@live@gt_contexts.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10993/bat-dg2-8/igt@i915_selftest@live@gt_contexts.html

  
  [i915#10366]: https://gitlab.freedesktop.org/drm/intel/issues/10366
  [i915#10378]: https://gitlab.freedesktop.org/drm/intel/issues/10378
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#9318]: https://gitlab.freedesktop.org/drm/intel/issues/9318
  [i915#9732]: https://gitlab.freedesktop.org/drm/intel/issues/9732


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7803 -> IGTPW_10993

  CI-20190529: 20190529
  CI_DRM_14552: 057ec21a54cddd595a7725fa8731eb4c5bd5abff @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10993: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10993/index.html
  IGT_7803: 9669a17ae56f1dcd22ba4c5cb39b3cd334a46862 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@xe_wedged@basic-wedged
+igt@xe_wedged@wedged-at-any-timeout
-igt@xe_exec_fault_mode@many-basic-imm
-igt@xe_exec_fault_mode@many-bindexecqueue-imm
-igt@xe_exec_fault_mode@many-bindexecqueue-rebind-imm
-igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm
-igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-imm
-igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm
-igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-imm
-igt@xe_exec_fault_mode@many-execqueues-basic-imm
-igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-imm
-igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm
-igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-imm
-igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm
-igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm
-igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-imm
-igt@xe_exec_fault_mode@many-execqueues-rebind-imm
-igt@xe_exec_fault_mode@many-execqueues-userptr-imm
-igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm
-igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm
-igt@xe_exec_fault_mode@many-execqueues-userptr-rebind-imm
-igt@xe_exec_fault_mode@many-rebind-imm
-igt@xe_exec_fault_mode@many-userptr-imm
-igt@xe_exec_fault_mode@many-userptr-invalidate-imm
-igt@xe_exec_fault_mode@many-userptr-invalidate-race-imm
-igt@xe_exec_fault_mode@many-userptr-rebind-imm
-igt@xe_exec_fault_mode@once-basic-imm
-igt@xe_exec_fault_mode@once-bindexecqueue-imm
-igt@xe_exec_fault_mode@once-bindexecqueue-rebind-imm
-igt@xe_exec_fault_mode@once-bindexecqueue-userptr-imm
-igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-imm
-igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-race-imm
-igt@xe_exec_fault_mode@once-bindexecqueue-userptr-rebind-imm
-igt@xe_exec_fault_mode@once-rebind-imm
-igt@xe_exec_fault_mode@once-userptr-imm
-igt@xe_exec_fault_mode@once-userptr-invalidate-imm
-igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm
-igt@xe_exec_fault_mode@once-userptr-rebind-imm
-igt@xe_exec_fault_mode@twice-basic-imm
-igt@xe_exec_fault_mode@twice-bindexecqueue-imm
-igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm
-igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-imm
-igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-imm
-igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race-imm
-igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-imm
-igt@xe_exec_fault_mode@twice-rebind-imm
-igt@xe_exec_fault_mode@twice-userptr-imm
-igt@xe_exec_fault_mode@twice-userptr-invalidate-imm
-igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm
-igt@xe_exec_fault_mode@twice-userptr-rebind-imm

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10993/index.html

--===============8297125964960573209==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/3] tests/intel/xe_wedged: Introduce a new test for Xe device wedged state</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132234/">https://patchwork.freedesktop.org/series/132234/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10993/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10993/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14552 -&gt; IGTPW_10993</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10993/index.html</p>
<h2>Participating hosts (37 -&gt; 29)</h2>
<p>Additional (3): bat-kbl-2 fi-rkl-11600 fi-cfl-8109u <br />
  Missing    (11): fi-kbl-7567u bat-mtlp-8 fi-bsw-n3050 fi-apl-guc fi-glk-j4005 fi-kbl-8809g bat-atsm-1 fi-elk-e7500 bat-dg2-11 bat-jsl-1 bat-arls-2 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10993 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@debugfs_test@basic-hwmon:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10993/fi-rkl-11600/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9318">i915#9318</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10993/bat-kbl-2/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10993/fi-cfl-8109u/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10993/fi-rkl-11600/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10993/bat-kbl-2/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> +39 other tests skip</li>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10993/fi-rkl-11600/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10993/fi-cfl-8109u/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10993/fi-rkl-11600/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10993/fi-rkl-11600/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10993/fi-rkl-11600/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10993/fi-rkl-11600/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10993/fi-rkl-11600/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>)</li>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10993/fi-cfl-8109u/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10993/fi-rkl-11600/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9732">i915#9732</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10993/fi-rkl-11600/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-read:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10993/fi-rkl-11600/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_lmem_swapping@basic@lmem0:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14552/bat-dg2-9/igt@gem_lmem_swapping@basic@lmem0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10378">i915#10378</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10993/bat-dg2-9/igt@gem_lmem_swapping@basic@lmem0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_contexts:</p>
<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14552/bat-dg2-8/igt@i915_selftest@live@gt_contexts.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10366">i915#10366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10993/bat-dg2-8/igt@i915_selftest@live@gt_contexts.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7803 -&gt; IGTPW_10993</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14552: 057ec21a54cddd595a7725fa8731eb4c5bd5abff @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10993: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10993/index.html<br />
  IGT_7803: 9669a17ae56f1dcd22ba4c5cb39b3cd334a46862 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@xe_wedged@basic-wedged<br />
+igt@xe_wedged@wedged-at-any-timeout<br />
-igt@xe_exec_fault_mode@many-basic-imm<br />
-igt@xe_exec_fault_mode@many-bindexecqueue-imm<br />
-igt@xe_exec_fault_mode@many-bindexecqueue-rebind-imm<br />
-igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm<br />
-igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-imm<br />
-igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm<br />
-igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-imm<br />
-igt@xe_exec_fault_mode@many-execqueues-basic-imm<br />
-igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-imm<br />
-igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm<br />
-igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-imm<br />
-igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm<br />
-igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm<br />
-igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-imm<br />
-igt@xe_exec_fault_mode@many-execqueues-rebind-imm<br />
-igt@xe_exec_fault_mode@many-execqueues-userptr-imm<br />
-igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm<br />
-igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm<br />
-igt@xe_exec_fault_mode@many-execqueues-userptr-rebind-imm<br />
-igt@xe_exec_fault_mode@many-rebind-imm<br />
-igt@xe_exec_fault_mode@many-userptr-imm<br />
-igt@xe_exec_fault_mode@many-userptr-invalidate-imm<br />
-igt@xe_exec_fault_mode@many-userptr-invalidate-race-imm<br />
-igt@xe_exec_fault_mode@many-userptr-rebind-imm<br />
-igt@xe_exec_fault_mode@once-basic-imm<br />
-igt@xe_exec_fault_mode@once-bindexecqueue-imm<br />
-igt@xe_exec_fault_mode@once-bindexecqueue-rebind-imm<br />
-igt@xe_exec_fault_mode@once-bindexecqueue-userptr-imm<br />
-igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-imm<br />
-igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-race-imm<br />
-igt@xe_exec_fault_mode@once-bindexecqueue-userptr-rebind-imm<br />
-igt@xe_exec_fault_mode@once-rebind-imm<br />
-igt@xe_exec_fault_mode@once-userptr-imm<br />
-igt@xe_exec_fault_mode@once-userptr-invalidate-imm<br />
-igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm<br />
-igt@xe_exec_fault_mode@once-userptr-rebind-imm<br />
-igt@xe_exec_fault_mode@twice-basic-imm<br />
-igt@xe_exec_fault_mode@twice-bindexecqueue-imm<br />
-igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm<br />
-igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-imm<br />
-igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-imm<br />
-igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race-imm<br />
-igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-imm<br />
-igt@xe_exec_fault_mode@twice-rebind-imm<br />
-igt@xe_exec_fault_mode@twice-userptr-imm<br />
-igt@xe_exec_fault_mode@twice-userptr-invalidate-imm<br />
-igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm<br />
-igt@xe_exec_fault_mode@twice-userptr-rebind-imm</p>

</body>
</html>

--===============8297125964960573209==--
