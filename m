Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 930CFC47258
	for <igt-dev@archiver.kernel.org>; Tue, 23 Jan 2024 23:58:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EBE910F1CE;
	Tue, 23 Jan 2024 23:58:42 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09AF110F1C6;
 Tue, 23 Jan 2024 23:58:41 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7094034465484550202=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_Add_tests_for_solid_fill_pl?=
 =?utf-8?q?anes_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jessica Zhang" <quic_jesszhan@quicinc.com>
Date: Tue, 23 Jan 2024 23:58:41 -0000
Message-ID: <170605432103.684313.11178404067335350760@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240123-solid-fill-v2-0-4ecd2cf767fe@quicinc.com>
In-Reply-To: <20240123-solid-fill-v2-0-4ecd2cf767fe@quicinc.com>
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

--===============7094034465484550202==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add tests for solid fill planes (rev2)
URL   : https://patchwork.freedesktop.org/series/127900/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_14166 -> IGTPW_10579
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10579/index.html

Participating hosts (38 -> 37)
------------------------------

  Missing    (1): fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_10579 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_lmem_swapping@verify-random:
    - bat-mtlp-6:         NOTRUN -> [SKIP][1] ([i915#4613]) +3 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10579/bat-mtlp-6/igt@gem_lmem_swapping@verify-random.html

  * igt@i915_pm_rps@basic-api:
    - bat-mtlp-6:         NOTRUN -> [SKIP][2] ([i915#6621])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10579/bat-mtlp-6/igt@i915_pm_rps@basic-api.html

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-kbl-7567u:       [PASS][3] -> [DMESG-WARN][4] ([i915#9730]) +31 other tests dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14166/fi-kbl-7567u/igt@i915_selftest@live@gt_heartbeat.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10579/fi-kbl-7567u/igt@i915_selftest@live@gt_heartbeat.html

  * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
    - bat-mtlp-6:         NOTRUN -> [SKIP][5] ([i915#4212] / [i915#9792]) +8 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10579/bat-mtlp-6/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-mtlp-6:         NOTRUN -> [SKIP][6] ([i915#5190] / [i915#9792])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10579/bat-mtlp-6/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:
    - bat-mtlp-6:         NOTRUN -> [SKIP][7] ([i915#9792]) +16 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10579/bat-mtlp-6/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html

  * igt@kms_flip@basic-flip-vs-dpms:
    - bat-mtlp-6:         NOTRUN -> [SKIP][8] ([i915#3637] / [i915#9792]) +3 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10579/bat-mtlp-6/igt@kms_flip@basic-flip-vs-dpms.html

  * igt@kms_force_connector_basic@force-load-detect:
    - bat-mtlp-6:         NOTRUN -> [SKIP][9] ([fdo#109285] / [i915#9792])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10579/bat-mtlp-6/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - bat-mtlp-6:         NOTRUN -> [SKIP][10] ([i915#5274] / [i915#9792])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10579/bat-mtlp-6/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-mtlp-6:         NOTRUN -> [SKIP][11] ([i915#4342] / [i915#5354] / [i915#9792])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10579/bat-mtlp-6/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-dp-1:
    - fi-kbl-7567u:       [PASS][12] -> [FAIL][13] ([i915#9666])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14166/fi-kbl-7567u/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-dp-1.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10579/fi-kbl-7567u/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-dp-1.html

  * igt@kms_pm_backlight@basic-brightness:
    - bat-mtlp-6:         NOTRUN -> [SKIP][14] ([i915#5354] / [i915#9792])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10579/bat-mtlp-6/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - fi-kbl-7567u:       [PASS][15] -> [DMESG-WARN][16] ([i915#8585]) +13 other tests dmesg-warn
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14166/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10579/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-mtlp-6:         NOTRUN -> [SKIP][17] ([i915#3555] / [i915#8809] / [i915#9792])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10579/bat-mtlp-6/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-fence-flip:
    - bat-mtlp-6:         NOTRUN -> [SKIP][18] ([i915#3708] / [i915#9792])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10579/bat-mtlp-6/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-fence-mmap:
    - bat-mtlp-6:         NOTRUN -> [SKIP][19] ([i915#3708] / [i915#4077]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10579/bat-mtlp-6/igt@prime_vgem@basic-fence-mmap.html

  * igt@prime_vgem@basic-write:
    - bat-mtlp-6:         NOTRUN -> [SKIP][20] ([i915#3708]) +2 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10579/bat-mtlp-6/igt@prime_vgem@basic-write.html

  
#### Possible fixes ####

  * igt@i915_hangman@error-state-basic:
    - bat-mtlp-6:         [ABORT][21] ([i915#9414]) -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14166/bat-mtlp-6/igt@i915_hangman@error-state-basic.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10579/bat-mtlp-6/igt@i915_hangman@error-state-basic.html

  * igt@i915_selftest@live@gt_mocs:
    - bat-mtlp-8:         [DMESG-WARN][23] -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14166/bat-mtlp-8/igt@i915_selftest@live@gt_mocs.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10579/bat-mtlp-8/igt@i915_selftest@live@gt_mocs.html

  * igt@i915_selftest@live@hangcheck:
    - {bat-rpls-3}:       [DMESG-WARN][25] ([i915#5591]) -> [PASS][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14166/bat-rpls-3/igt@i915_selftest@live@hangcheck.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10579/bat-rpls-3/igt@i915_selftest@live@hangcheck.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4342]: https://gitlab.freedesktop.org/drm/intel/issues/4342
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
  [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#5591]: https://gitlab.freedesktop.org/drm/intel/issues/5591
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#8585]: https://gitlab.freedesktop.org/drm/intel/issues/8585
  [i915#8809]: https://gitlab.freedesktop.org/drm/intel/issues/8809
  [i915#9414]: https://gitlab.freedesktop.org/drm/intel/issues/9414
  [i915#9666]: https://gitlab.freedesktop.org/drm/intel/issues/9666
  [i915#9673]: https://gitlab.freedesktop.org/drm/intel/issues/9673
  [i915#9730]: https://gitlab.freedesktop.org/drm/intel/issues/9730
  [i915#9732]: https://gitlab.freedesktop.org/drm/intel/issues/9732
  [i915#9792]: https://gitlab.freedesktop.org/drm/intel/issues/9792


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7690 -> IGTPW_10579

  CI-20190529: 20190529
  CI_DRM_14166: fc6b7c6ee7d786e6ed48425a2ce0e674906e4e5c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10579: 10579
  IGT_7690: aa45298ff675abbe6bf8f04ae186e2388c35f03a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@kms_atomic@plane-cursor-solid-fill
+igt@kms_atomic@plane-primary-solid-fill
-igt@gem_mmap@basic-multigpu
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

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10579/index.html

--===============7094034465484550202==
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
<tr><td><b>Series:</b></td><td>Add tests for solid fill planes (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/127900/">https://patchwork.freedesktop.org/series/127900/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10579/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10579/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14166 -&gt; IGTPW_10579</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10579/index.html</p>
<h2>Participating hosts (38 -&gt; 37)</h2>
<p>Missing    (1): fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10579 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10579/bat-mtlp-6/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10579/bat-mtlp-6/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14166/fi-kbl-7567u/igt@i915_selftest@live@gt_heartbeat.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10579/fi-kbl-7567u/igt@i915_selftest@live@gt_heartbeat.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9730">i915#9730</a>) +31 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-legacy:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10579/bat-mtlp-6/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4212">i915#4212</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9792">i915#9792</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10579/bat-mtlp-6/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9792">i915#9792</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10579/bat-mtlp-6/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9792">i915#9792</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10579/bat-mtlp-6/igt@kms_flip@basic-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9792">i915#9792</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10579/bat-mtlp-6/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9792">i915#9792</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10579/bat-mtlp-6/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5274">i915#5274</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9792">i915#9792</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10579/bat-mtlp-6/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4342">i915#4342</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9792">i915#9792</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-dp-1:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14166/fi-kbl-7567u/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-dp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10579/fi-kbl-7567u/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9666">i915#9666</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10579/bat-mtlp-6/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9792">i915#9792</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14166/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10579/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8585">i915#8585</a>) +13 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10579/bat-mtlp-6/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8809">i915#8809</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9792">i915#9792</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10579/bat-mtlp-6/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9792">i915#9792</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-mmap:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10579/bat-mtlp-6/igt@prime_vgem@basic-fence-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10579/bat-mtlp-6/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_hangman@error-state-basic:</p>
<ul>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14166/bat-mtlp-6/igt@i915_hangman@error-state-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9414">i915#9414</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10579/bat-mtlp-6/igt@i915_hangman@error-state-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_mocs:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14166/bat-mtlp-8/igt@i915_selftest@live@gt_mocs.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10579/bat-mtlp-8/igt@i915_selftest@live@gt_mocs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>{bat-rpls-3}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14166/bat-rpls-3/igt@i915_selftest@live@hangcheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5591">i915#5591</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10579/bat-rpls-3/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7690 -&gt; IGTPW_10579</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14166: fc6b7c6ee7d786e6ed48425a2ce0e674906e4e5c @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10579: 10579<br />
  IGT_7690: aa45298ff675abbe6bf8f04ae186e2388c35f03a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@kms_atomic@plane-cursor-solid-fill<br />
+igt@kms_atomic@plane-primary-solid-fill<br />
-igt@gem_mmap@basic-multigpu<br />
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

--===============7094034465484550202==--
