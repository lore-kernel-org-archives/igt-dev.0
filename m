Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2720626718344708023=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Date: Mon, 02 Oct 2023 12:44:03 -0000
Message-ID: <169625064362.3204.17752881947780181632@emeril.freedesktop.org>
References: <20231002104846.21443-1-nirmoy.das@intel.com>
In-Reply-To: <20231002104846.21443-1-nirmoy.das@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?intel/gem=5Feio=3A_Skip_stress_test_on_BCS0_for_MTL?=
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
List-ID: <igt-dev@lists.freedesktop.org>

--===============2720626718344708023==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/gem_eio: Skip stress test on BCS0 for MTL
URL   : https://patchwork.freedesktop.org/series/124517/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_13698 -> IGTPW_9900
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_9900 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_9900, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9900/index.html

Participating hosts (40 -> 33)
------------------------------

  Additional (1): bat-dg2-8 
  Missing    (8): fi-kbl-soraka fi-rkl-11600 bat-adls-5 fi-snb-2520m fi-hsw-4770 bat-atsm-1 bat-jsl-3 fi-bsw-nick 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_9900:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@coherency:
    - bat-rpls-1:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13698/bat-rpls-1/igt@i915_selftest@live@coherency.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9900/bat-rpls-1/igt@i915_selftest@live@coherency.html

  * igt@i915_selftest@live@hangcheck:
    - fi-kbl-guc:         [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13698/fi-kbl-guc/igt@i915_selftest@live@hangcheck.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9900/fi-kbl-guc/igt@i915_selftest@live@hangcheck.html

  * igt@kms_flip@basic-flip-vs-modeset@b-dp1:
    - bat-dg2-9:          [PASS][5] -> [INCOMPLETE][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13698/bat-dg2-9/igt@kms_flip@basic-flip-vs-modeset@b-dp1.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9900/bat-dg2-9/igt@kms_flip@basic-flip-vs-modeset@b-dp1.html

  * igt@kms_pipe_crc_basic@read-crc@pipe-d-edp-1:
    - bat-rplp-1:         [PASS][7] -> [INCOMPLETE][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13698/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc@pipe-d-edp-1.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9900/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc@pipe-d-edp-1.html

  * igt@vgem_basic@unload:
    - fi-cfl-8700k:       [PASS][9] -> [INCOMPLETE][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13698/fi-cfl-8700k/igt@vgem_basic@unload.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9900/fi-cfl-8700k/igt@vgem_basic@unload.html

  
Known issues
------------

  Here are the changes found in IGTPW_9900 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_parallel@engines@userptr:
    - bat-mtlp-6:         [PASS][11] -> [ABORT][12] ([i915#9414])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13698/bat-mtlp-6/igt@gem_exec_parallel@engines@userptr.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9900/bat-mtlp-6/igt@gem_exec_parallel@engines@userptr.html

  * igt@gem_exec_suspend@basic-s3@smem:
    - bat-mtlp-8:         [PASS][13] -> [ABORT][14] ([i915#9262])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13698/bat-mtlp-8/igt@gem_exec_suspend@basic-s3@smem.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9900/bat-mtlp-8/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@gem_mmap@basic:
    - bat-dg2-8:          NOTRUN -> [SKIP][15] ([i915#4083])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9900/bat-dg2-8/igt@gem_mmap@basic.html

  * igt@gem_mmap_gtt@basic:
    - bat-dg2-8:          NOTRUN -> [SKIP][16] ([i915#4077]) +2 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9900/bat-dg2-8/igt@gem_mmap_gtt@basic.html

  * igt@gem_tiled_pread_basic:
    - bat-dg2-8:          NOTRUN -> [SKIP][17] ([i915#4079]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9900/bat-dg2-8/igt@gem_tiled_pread_basic.html

  * igt@i915_pm_rps@basic-api:
    - bat-dg2-8:          NOTRUN -> [SKIP][18] ([i915#6621])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9900/bat-dg2-8/igt@i915_pm_rps@basic-api.html

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-apl-guc:         [PASS][19] -> [DMESG-FAIL][20] ([i915#5334] / [i915#7634])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13698/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9900/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html

  * igt@i915_selftest@live@reset:
    - fi-apl-guc:         [PASS][21] -> [DMESG-WARN][22] ([i915#7634]) +31 other tests dmesg-warn
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13698/fi-apl-guc/igt@i915_selftest@live@reset.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9900/fi-apl-guc/igt@i915_selftest@live@reset.html

  * igt@i915_suspend@basic-s2idle-without-i915:
    - fi-apl-guc:         [PASS][23] -> [DMESG-WARN][24] ([i915#180] / [i915#7634])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13698/fi-apl-guc/igt@i915_suspend@basic-s2idle-without-i915.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9900/fi-apl-guc/igt@i915_suspend@basic-s2idle-without-i915.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-dg2-8:          NOTRUN -> [SKIP][25] ([i915#5190])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9900/bat-dg2-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - bat-dg2-8:          NOTRUN -> [SKIP][26] ([i915#4215] / [i915#5190])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9900/bat-dg2-8/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_addfb_basic@framebuffer-vs-set-tiling:
    - bat-dg2-8:          NOTRUN -> [SKIP][27] ([i915#4212]) +6 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9900/bat-dg2-8/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html

  * igt@kms_addfb_basic@tile-pitch-mismatch:
    - bat-dg2-8:          NOTRUN -> [SKIP][28] ([i915#4212] / [i915#5608])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9900/bat-dg2-8/igt@kms_addfb_basic@tile-pitch-mismatch.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - bat-dg2-8:          NOTRUN -> [SKIP][29] ([i915#4103] / [i915#4213] / [i915#5608]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9900/bat-dg2-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - bat-adlp-11:        [PASS][30] -> [DMESG-WARN][31] ([i915#6868])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13698/bat-adlp-11/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9900/bat-adlp-11/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
    - bat-adlp-11:        [PASS][32] -> [SKIP][33] ([i915#3546]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13698/bat-adlp-11/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9900/bat-adlp-11/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html

  * igt@kms_force_connector_basic@force-load-detect:
    - bat-dg2-8:          NOTRUN -> [SKIP][34] ([fdo#109285])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9900/bat-dg2-8/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - bat-dg2-8:          NOTRUN -> [SKIP][35] ([i915#5274])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9900/bat-dg2-8/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence:
    - bat-dg2-11:         NOTRUN -> [SKIP][36] ([i915#1845])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9900/bat-dg2-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html

  * igt@kms_psr@cursor_plane_move:
    - bat-dg2-8:          NOTRUN -> [SKIP][37] ([i915#1072]) +3 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9900/bat-dg2-8/igt@kms_psr@cursor_plane_move.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-dg2-8:          NOTRUN -> [SKIP][38] ([i915#3555])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9900/bat-dg2-8/igt@kms_setmode@basic-clone-single-crtc.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
  [i915#4215]: https://gitlab.freedesktop.org/drm/intel/issues/4215
  [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
  [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#5608]: https://gitlab.freedesktop.org/drm/intel/issues/5608
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#6868]: https://gitlab.freedesktop.org/drm/intel/issues/6868
  [i915#7634]: https://gitlab.freedesktop.org/drm/intel/issues/7634
  [i915#7952]: https://gitlab.freedesktop.org/drm/intel/issues/7952
  [i915#9262]: https://gitlab.freedesktop.org/drm/intel/issues/9262
  [i915#9414]: https://gitlab.freedesktop.org/drm/intel/issues/9414


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7508 -> IGTPW_9900

  CI-20190529: 20190529
  CI_DRM_13698: 3d2a99736b6bdeebd24117c9de0a8d369f10da62 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9900: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9900/index.html
  IGT_7508: f366406b05ca6b3d16eaa734a91e0833bd159f54 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@kms_frontbuffer_tracking@fbcdrrs-badstride
+igt@kms_frontbuffer_tracking@fbcpsrdrrs-badstride
+igt@kms_frontbuffer_tracking@fbcpsr-badstride
+igt@kms_frontbuffer_tracking@fbc-badstride

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9900/index.html

--===============2720626718344708023==
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
<tr><td><b>Series:</b></td><td>tests/intel/gem_eio: Skip stress test on BCS0 for MTL</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/124517/">https://patchwork.freedesktop.org/series/124517/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9900/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9900/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13698 -&gt; IGTPW_9900</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_9900 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_9900, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9900/index.html</p>
<h2>Participating hosts (40 -&gt; 33)</h2>
<p>Additional (1): bat-dg2-8 <br />
  Missing    (8): fi-kbl-soraka fi-rkl-11600 bat-adls-5 fi-snb-2520m fi-hsw-4770 bat-atsm-1 bat-jsl-3 fi-bsw-nick </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_9900:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@i915_selftest@live@coherency:</p>
<ul>
<li>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13698/bat-rpls-1/igt@i915_selftest@live@coherency.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9900/bat-rpls-1/igt@i915_selftest@live@coherency.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13698/fi-kbl-guc/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9900/fi-kbl-guc/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@b-dp1:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13698/bat-dg2-9/igt@kms_flip@basic-flip-vs-modeset@b-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9900/bat-dg2-9/igt@kms_flip@basic-flip-vs-modeset@b-dp1.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-d-edp-1:</p>
<ul>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13698/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc@pipe-d-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9900/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc@pipe-d-edp-1.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@vgem_basic@unload:</p>
<ul>
<li>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13698/fi-cfl-8700k/igt@vgem_basic@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9900/fi-cfl-8700k/igt@vgem_basic@unload.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9900 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_parallel@engines@userptr:</p>
<ul>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13698/bat-mtlp-6/igt@gem_exec_parallel@engines@userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9900/bat-mtlp-6/igt@gem_exec_parallel@engines@userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9414">i915#9414</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3@smem:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13698/bat-mtlp-8/igt@gem_exec_suspend@basic-s3@smem.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9900/bat-mtlp-8/igt@gem_exec_suspend@basic-s3@smem.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9262">i915#9262</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@basic:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9900/bat-dg2-8/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9900/bat-dg2-8/igt@gem_mmap_gtt@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9900/bat-dg2-8/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4079">i915#4079</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9900/bat-dg2-8/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13698/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9900/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7634">i915#7634</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@reset:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13698/fi-apl-guc/igt@i915_selftest@live@reset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9900/fi-apl-guc/igt@i915_selftest@live@reset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7634">i915#7634</a>) +31 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s2idle-without-i915:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13698/fi-apl-guc/igt@i915_suspend@basic-s2idle-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9900/fi-apl-guc/igt@i915_suspend@basic-s2idle-without-i915.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7634">i915#7634</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9900/bat-dg2-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9900/bat-dg2-8/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4215">i915#4215</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@framebuffer-vs-set-tiling:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9900/bat-dg2-8/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4212">i915#4212</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@tile-pitch-mismatch:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9900/bat-dg2-8/igt@kms_addfb_basic@tile-pitch-mismatch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4212">i915#4212</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5608">i915#5608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9900/bat-dg2-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4213">i915#4213</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5608">i915#5608</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13698/bat-adlp-11/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9900/bat-adlp-11/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6868">i915#6868</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13698/bat-adlp-11/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9900/bat-adlp-11/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3546">i915#3546</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9900/bat-dg2-8/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9900/bat-dg2-8/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5274">i915#5274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9900/bat-dg2-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@cursor_plane_move:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9900/bat-dg2-8/igt@kms_psr@cursor_plane_move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9900/bat-dg2-8/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7508 -&gt; IGTPW_9900</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13698: 3d2a99736b6bdeebd24117c9de0a8d369f10da62 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9900: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9900/index.html<br />
  IGT_7508: f366406b05ca6b3d16eaa734a91e0833bd159f54 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@kms_frontbuffer_tracking@fbcdrrs-badstride<br />
+igt@kms_frontbuffer_tracking@fbcpsrdrrs-badstride<br />
+igt@kms_frontbuffer_tracking@fbcpsr-badstride<br />
+igt@kms_frontbuffer_tracking@fbc-badstride</p>

</body>
</html>

--===============2720626718344708023==--
