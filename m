Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 302B8C5475B
	for <igt-dev@archiver.kernel.org>; Wed,  6 Mar 2024 17:34:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8D40112110;
	Wed,  6 Mar 2024 17:34:49 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38962112110;
 Wed,  6 Mar 2024 17:34:48 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0396499116767346566=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_Add_xe=5Frender=5Fcopy_test?=
 =?utf-8?q?s_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 06 Mar 2024 17:34:48 -0000
Message-ID: <170974648822.562293.8901664342025593218@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240306150219.301977-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20240306150219.301977-1-zbigniew.kempczynski@intel.com>
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

--===============0396499116767346566==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add xe_render_copy tests (rev3)
URL   : https://patchwork.freedesktop.org/series/130707/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_14398 -> IGTPW_10787
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_10787 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_10787, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10787/index.html

Participating hosts (41 -> 36)
------------------------------

  Missing    (5): fi-apl-guc fi-snb-2520m fi-cfl-8109u bat-jsl-1 bat-mtlp-8 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_10787:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_pipe_crc_basic@read-crc@pipe-c-dp-1:
    - bat-dg2-8:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14398/bat-dg2-8/igt@kms_pipe_crc_basic@read-crc@pipe-c-dp-1.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10787/bat-dg2-8/igt@kms_pipe_crc_basic@read-crc@pipe-c-dp-1.html

  
Known issues
------------

  Here are the changes found in IGTPW_10787 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_lmem_swapping@verify-random:
    - bat-arls-2:         NOTRUN -> [SKIP][3] ([i915#10213]) +3 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10787/bat-arls-2/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_mmap@basic:
    - bat-arls-2:         NOTRUN -> [SKIP][4] ([i915#4083])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10787/bat-arls-2/igt@gem_mmap@basic.html

  * igt@gem_mmap_gtt@basic:
    - bat-arls-2:         NOTRUN -> [SKIP][5] ([i915#10196] / [i915#4077]) +2 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10787/bat-arls-2/igt@gem_mmap_gtt@basic.html

  * igt@gem_render_tiled_blits@basic:
    - bat-arls-2:         NOTRUN -> [SKIP][6] ([i915#10197] / [i915#10211] / [i915#4079])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10787/bat-arls-2/igt@gem_render_tiled_blits@basic.html

  * igt@gem_tiled_pread_basic:
    - bat-arls-2:         NOTRUN -> [SKIP][7] ([i915#10206] / [i915#4079])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10787/bat-arls-2/igt@gem_tiled_pread_basic.html

  * igt@i915_pm_rps@basic-api:
    - bat-arls-2:         NOTRUN -> [SKIP][8] ([i915#10209])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10787/bat-arls-2/igt@i915_pm_rps@basic-api.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-arls-2:         NOTRUN -> [SKIP][9] ([i915#10200]) +9 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10787/bat-arls-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - bat-arls-2:         NOTRUN -> [SKIP][10] ([i915#10202]) +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10787/bat-arls-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-arls-2:         NOTRUN -> [SKIP][11] ([i915#9886])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10787/bat-arls-2/igt@kms_dsc@dsc-basic.html

  * igt@kms_force_connector_basic@force-load-detect:
    - bat-arls-2:         NOTRUN -> [SKIP][12] ([i915#10207])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10787/bat-arls-2/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_psr@psr-primary-mmap-gtt@edp-1:
    - bat-arls-2:         NOTRUN -> [SKIP][13] ([i915#10196] / [i915#4077] / [i915#9688])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10787/bat-arls-2/igt@kms_psr@psr-primary-mmap-gtt@edp-1.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-arls-2:         NOTRUN -> [SKIP][14] ([i915#10208] / [i915#8809])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10787/bat-arls-2/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-fence-mmap:
    - bat-arls-2:         NOTRUN -> [SKIP][15] ([i915#10196] / [i915#3708] / [i915#4077]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10787/bat-arls-2/igt@prime_vgem@basic-fence-mmap.html

  * igt@prime_vgem@basic-fence-read:
    - bat-arls-2:         NOTRUN -> [SKIP][16] ([i915#10212] / [i915#3708])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10787/bat-arls-2/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@basic-read:
    - bat-arls-2:         NOTRUN -> [SKIP][17] ([i915#10214] / [i915#3708])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10787/bat-arls-2/igt@prime_vgem@basic-read.html

  * igt@prime_vgem@basic-write:
    - bat-arls-2:         NOTRUN -> [SKIP][18] ([i915#10216] / [i915#3708])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10787/bat-arls-2/igt@prime_vgem@basic-write.html

  
#### Possible fixes ####

  * igt@gem_exec_parallel@engines@contexts:
    - bat-arls-2:         [ABORT][19] -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14398/bat-arls-2/igt@gem_exec_parallel@engines@contexts.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10787/bat-arls-2/igt@gem_exec_parallel@engines@contexts.html

  * igt@gem_lmem_swapping@basic@lmem0:
    - bat-dg2-14:         [FAIL][21] ([i915#10378]) -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14398/bat-dg2-14/igt@gem_lmem_swapping@basic@lmem0.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10787/bat-dg2-14/igt@gem_lmem_swapping@basic@lmem0.html

  * igt@i915_selftest@live@gt_pm:
    - bat-dg2-14:         [ABORT][23] ([i915#10366]) -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14398/bat-dg2-14/igt@i915_selftest@live@gt_pm.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10787/bat-dg2-14/igt@i915_selftest@live@gt_pm.html

  * igt@i915_selftest@live@gt_timelines:
    - bat-arls-1:         [INCOMPLETE][25] -> [PASS][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14398/bat-arls-1/igt@i915_selftest@live@gt_timelines.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10787/bat-arls-1/igt@i915_selftest@live@gt_timelines.html

  
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
  [i915#10366]: https://gitlab.freedesktop.org/drm/intel/issues/10366
  [i915#10378]: https://gitlab.freedesktop.org/drm/intel/issues/10378
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#8809]: https://gitlab.freedesktop.org/drm/intel/issues/8809
  [i915#9688]: https://gitlab.freedesktop.org/drm/intel/issues/9688
  [i915#9886]: https://gitlab.freedesktop.org/drm/intel/issues/9886


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7749 -> IGTPW_10787

  CI-20190529: 20190529
  CI_DRM_14398: e96742a33719079709b8e180448b491622e6a427 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10787: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10787/index.html
  IGT_7749: 2fd91b8c3cf9aa2b0bb78537a6b5e2bc3de50e0e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@xe_render_copy@render-full
+igt@xe_render_copy@render-hstripes
+igt@xe_render_copy@render-random
+igt@xe_render_copy@render-square
+igt@xe_render_copy@render-vstripes
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

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10787/index.html

--===============0396499116767346566==
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
<tr><td><b>Series:</b></td><td>Add xe_render_copy tests (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/130707/">https://patchwork.freedesktop.org/series/130707/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10787/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10787/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14398 -&gt; IGTPW_10787</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_10787 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_10787, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10787/index.html</p>
<h2>Participating hosts (41 -&gt; 36)</h2>
<p>Missing    (5): fi-apl-guc fi-snb-2520m fi-cfl-8109u bat-jsl-1 bat-mtlp-8 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_10787:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_pipe_crc_basic@read-crc@pipe-c-dp-1:<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14398/bat-dg2-8/igt@kms_pipe_crc_basic@read-crc@pipe-c-dp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10787/bat-dg2-8/igt@kms_pipe_crc_basic@read-crc@pipe-c-dp-1.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10787 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>bat-arls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10787/bat-arls-2/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10213">i915#10213</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@basic:</p>
<ul>
<li>bat-arls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10787/bat-arls-2/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic:</p>
<ul>
<li>bat-arls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10787/bat-arls-2/igt@gem_mmap_gtt@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10196">i915#10196</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_tiled_blits@basic:</p>
<ul>
<li>bat-arls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10787/bat-arls-2/igt@gem_render_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10197">i915#10197</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/10211">i915#10211</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4079">i915#4079</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic:</p>
<ul>
<li>bat-arls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10787/bat-arls-2/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10206">i915#10206</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4079">i915#4079</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>bat-arls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10787/bat-arls-2/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10209">i915#10209</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-arls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10787/bat-arls-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10200">i915#10200</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>bat-arls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10787/bat-arls-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10202">i915#10202</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-arls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10787/bat-arls-2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9886">i915#9886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>bat-arls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10787/bat-arls-2/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10207">i915#10207</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-mmap-gtt@edp-1:</p>
<ul>
<li>bat-arls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10787/bat-arls-2/igt@kms_psr@psr-primary-mmap-gtt@edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10196">i915#10196</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9688">i915#9688</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>bat-arls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10787/bat-arls-2/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10208">i915#10208</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8809">i915#8809</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-mmap:</p>
<ul>
<li>bat-arls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10787/bat-arls-2/igt@prime_vgem@basic-fence-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10196">i915#10196</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>bat-arls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10787/bat-arls-2/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10212">i915#10212</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-read:</p>
<ul>
<li>bat-arls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10787/bat-arls-2/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10214">i915#10214</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>bat-arls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10787/bat-arls-2/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10216">i915#10216</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_parallel@engines@contexts:</p>
<ul>
<li>bat-arls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14398/bat-arls-2/igt@gem_exec_parallel@engines@contexts.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10787/bat-arls-2/igt@gem_exec_parallel@engines@contexts.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic@lmem0:</p>
<ul>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14398/bat-dg2-14/igt@gem_lmem_swapping@basic@lmem0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10378">i915#10378</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10787/bat-dg2-14/igt@gem_lmem_swapping@basic@lmem0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14398/bat-dg2-14/igt@i915_selftest@live@gt_pm.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10366">i915#10366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10787/bat-dg2-14/igt@i915_selftest@live@gt_pm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_timelines:</p>
<ul>
<li>bat-arls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14398/bat-arls-1/igt@i915_selftest@live@gt_timelines.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10787/bat-arls-1/igt@i915_selftest@live@gt_timelines.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7749 -&gt; IGTPW_10787</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14398: e96742a33719079709b8e180448b491622e6a427 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10787: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10787/index.html<br />
  IGT_7749: 2fd91b8c3cf9aa2b0bb78537a6b5e2bc3de50e0e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@xe_render_copy@render-full<br />
+igt@xe_render_copy@render-hstripes<br />
+igt@xe_render_copy@render-random<br />
+igt@xe_render_copy@render-square<br />
+igt@xe_render_copy@render-vstripes<br />
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

--===============0396499116767346566==--
