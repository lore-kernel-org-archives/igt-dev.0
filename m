Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============9116219975011809918=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_tests/msm=3A_Add_parallel_r?=
 =?utf-8?q?ecovery_test?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rob Clark" <robdclark@gmail.com>
Date: Tue, 09 Jan 2024 00:57:43 -0000
Message-ID: <170476186377.197000.422535724099041855@5338d5abeb45>
References: <20240108215906.170647-1-robdclark@gmail.com>
In-Reply-To: <20240108215906.170647-1-robdclark@gmail.com>
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

--===============9116219975011809918==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/msm: Add parallel recovery test
URL   : https://patchwork.freedesktop.org/series/128336/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_14098 -> IGTPW_10487
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10487/index.html

Participating hosts (35 -> 36)
------------------------------

  Additional (2): bat-dg2-9 fi-pnv-d510 
  Missing    (1): fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_10487 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s0@smem:
    - bat-jsl-3:          [PASS][1] -> [INCOMPLETE][2] ([i915#9883])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14098/bat-jsl-3/igt@gem_exec_suspend@basic-s0@smem.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10487/bat-jsl-3/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@gem_lmem_swapping@basic:
    - fi-pnv-d510:        NOTRUN -> [SKIP][3] ([fdo#109271]) +31 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10487/fi-pnv-d510/igt@gem_lmem_swapping@basic.html

  * igt@gem_mmap@basic:
    - bat-dg2-9:          NOTRUN -> [SKIP][4] ([i915#4083])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10487/bat-dg2-9/igt@gem_mmap@basic.html

  * igt@gem_mmap_gtt@basic:
    - bat-dg2-9:          NOTRUN -> [SKIP][5] ([i915#4077]) +2 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10487/bat-dg2-9/igt@gem_mmap_gtt@basic.html

  * igt@gem_render_tiled_blits@basic:
    - bat-dg2-9:          NOTRUN -> [SKIP][6] ([i915#4079]) +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10487/bat-dg2-9/igt@gem_render_tiled_blits@basic.html

  * igt@i915_pm_rps@basic-api:
    - bat-dg2-9:          NOTRUN -> [SKIP][7] ([i915#6621])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10487/bat-dg2-9/igt@i915_pm_rps@basic-api.html

  * igt@i915_suspend@basic-s3-without-i915:
    - bat-jsl-3:          [PASS][8] -> [FAIL][9] ([i915#10031])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14098/bat-jsl-3/igt@i915_suspend@basic-s3-without-i915.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10487/bat-jsl-3/igt@i915_suspend@basic-s3-without-i915.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][10] ([i915#6645])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10487/bat-mtlp-6/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-dg2-9:          NOTRUN -> [SKIP][11] ([i915#5190])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10487/bat-dg2-9/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - bat-dg2-9:          NOTRUN -> [SKIP][12] ([i915#4215] / [i915#5190])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10487/bat-dg2-9/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_addfb_basic@framebuffer-vs-set-tiling:
    - bat-dg2-9:          NOTRUN -> [SKIP][13] ([i915#4212]) +7 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10487/bat-dg2-9/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - bat-dg2-9:          NOTRUN -> [SKIP][14] ([i915#4103] / [i915#4213]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10487/bat-dg2-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_force_connector_basic@force-load-detect:
    - bat-dg2-9:          NOTRUN -> [SKIP][15] ([fdo#109285])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10487/bat-dg2-9/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - bat-dg2-9:          NOTRUN -> [SKIP][16] ([i915#5274])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10487/bat-dg2-9/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - bat-dg2-11:         NOTRUN -> [SKIP][17] ([i915#9197])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10487/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - bat-mtlp-6:         NOTRUN -> [SKIP][18] ([i915#9792])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10487/bat-mtlp-6/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_pm_backlight@basic-brightness:
    - bat-dg2-9:          NOTRUN -> [SKIP][19] ([i915#5354])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10487/bat-dg2-9/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-dg2-9:          NOTRUN -> [SKIP][20] ([i915#3555])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10487/bat-dg2-9/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-fence-flip:
    - bat-dg2-9:          NOTRUN -> [SKIP][21] ([i915#3708])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10487/bat-dg2-9/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-fence-mmap:
    - bat-dg2-9:          NOTRUN -> [SKIP][22] ([i915#3708] / [i915#4077]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10487/bat-dg2-9/igt@prime_vgem@basic-fence-mmap.html

  * igt@prime_vgem@basic-write:
    - bat-dg2-9:          NOTRUN -> [SKIP][23] ([i915#3291] / [i915#3708]) +2 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10487/bat-dg2-9/igt@prime_vgem@basic-write.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@ring_submission:
    - bat-mtlp-6:         [INCOMPLETE][24] -> [PASS][25]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14098/bat-mtlp-6/igt@i915_selftest@live@ring_submission.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10487/bat-mtlp-6/igt@i915_selftest@live@ring_submission.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [i915#10031]: https://gitlab.freedesktop.org/drm/intel/issues/10031
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
  [i915#4215]: https://gitlab.freedesktop.org/drm/intel/issues/4215
  [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
  [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#6645]: https://gitlab.freedesktop.org/drm/intel/issues/6645
  [i915#9197]: https://gitlab.freedesktop.org/drm/intel/issues/9197
  [i915#9673]: https://gitlab.freedesktop.org/drm/intel/issues/9673
  [i915#9732]: https://gitlab.freedesktop.org/drm/intel/issues/9732
  [i915#9792]: https://gitlab.freedesktop.org/drm/intel/issues/9792
  [i915#9883]: https://gitlab.freedesktop.org/drm/intel/issues/9883


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7663 -> IGTPW_10487

  CI-20190529: 20190529
  CI_DRM_14098: 33069fe3dece485caa21cc0870afec427877b105 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10487: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10487/index.html
  IGT_7663: b5eca7b97430309e320874594feaeaa8e770e25e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@msm_recovery@gpu-fault-parallel
-igt@kms_bw@linear-tiling-1-displays-2160x1440p
-igt@kms_bw@linear-tiling-2-displays-2160x1440p
-igt@kms_bw@linear-tiling-3-displays-2160x1440p
-igt@kms_bw@linear-tiling-4-displays-2160x1440p
-igt@kms_bw@linear-tiling-5-displays-2160x1440p
-igt@kms_bw@linear-tiling-6-displays-2160x1440p
-igt@kms_bw@linear-tiling-7-displays-2160x1440p
-igt@kms_bw@linear-tiling-8-displays-2160x1440p
-igt@kms_bw@linear-tiling-9-displays-2160x1440p
-igt@kms_bw@linear-tiling-10-displays-2160x1440p
-igt@kms_bw@linear-tiling-11-displays-2160x1440p
-igt@kms_bw@linear-tiling-12-displays-2160x1440p
-igt@kms_bw@linear-tiling-13-displays-2160x1440p
-igt@kms_bw@linear-tiling-14-displays-2160x1440p
-igt@kms_bw@linear-tiling-15-displays-2160x1440p
-igt@kms_bw@linear-tiling-16-displays-2160x1440p

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10487/index.html

--===============9116219975011809918==
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
<tr><td><b>Series:</b></td><td>tests/msm: Add parallel recovery test</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/128336/">https://patchwork.freedesktop.org/series/128336/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10487/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10487/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14098 -&gt; IGTPW_10487</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10487/index.html</p>
<h2>Participating hosts (35 -&gt; 36)</h2>
<p>Additional (2): bat-dg2-9 fi-pnv-d510 <br />
  Missing    (1): fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10487 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>bat-jsl-3:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14098/bat-jsl-3/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10487/bat-jsl-3/igt@gem_exec_suspend@basic-s0@smem.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9883">i915#9883</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10487/fi-pnv-d510/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@basic:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10487/bat-dg2-9/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10487/bat-dg2-9/igt@gem_mmap_gtt@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_tiled_blits@basic:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10487/bat-dg2-9/igt@gem_render_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4079">i915#4079</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10487/bat-dg2-9/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>bat-jsl-3:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14098/bat-jsl-3/igt@i915_suspend@basic-s3-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10487/bat-jsl-3/igt@i915_suspend@basic-s3-without-i915.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10031">i915#10031</a>)</li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10487/bat-mtlp-6/igt@i915_suspend@basic-s3-without-i915.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6645">i915#6645</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10487/bat-dg2-9/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10487/bat-dg2-9/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4215">i915#4215</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@framebuffer-vs-set-tiling:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10487/bat-dg2-9/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4212">i915#4212</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10487/bat-dg2-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4213">i915#4213</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10487/bat-dg2-9/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10487/bat-dg2-9/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5274">i915#5274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10487/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9197">i915#9197</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10487/bat-mtlp-6/igt@kms_pipe_crc_basic@suspend-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9792">i915#9792</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10487/bat-dg2-9/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10487/bat-dg2-9/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10487/bat-dg2-9/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-mmap:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10487/bat-dg2-9/igt@prime_vgem@basic-fence-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10487/bat-dg2-9/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@ring_submission:<ul>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14098/bat-mtlp-6/igt@i915_selftest@live@ring_submission.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10487/bat-mtlp-6/igt@i915_selftest@live@ring_submission.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7663 -&gt; IGTPW_10487</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14098: 33069fe3dece485caa21cc0870afec427877b105 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10487: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10487/index.html<br />
  IGT_7663: b5eca7b97430309e320874594feaeaa8e770e25e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@msm_recovery@gpu-fault-parallel<br />
-igt@kms_bw@linear-tiling-1-displays-2160x1440p<br />
-igt@kms_bw@linear-tiling-2-displays-2160x1440p<br />
-igt@kms_bw@linear-tiling-3-displays-2160x1440p<br />
-igt@kms_bw@linear-tiling-4-displays-2160x1440p<br />
-igt@kms_bw@linear-tiling-5-displays-2160x1440p<br />
-igt@kms_bw@linear-tiling-6-displays-2160x1440p<br />
-igt@kms_bw@linear-tiling-7-displays-2160x1440p<br />
-igt@kms_bw@linear-tiling-8-displays-2160x1440p<br />
-igt@kms_bw@linear-tiling-9-displays-2160x1440p<br />
-igt@kms_bw@linear-tiling-10-displays-2160x1440p<br />
-igt@kms_bw@linear-tiling-11-displays-2160x1440p<br />
-igt@kms_bw@linear-tiling-12-displays-2160x1440p<br />
-igt@kms_bw@linear-tiling-13-displays-2160x1440p<br />
-igt@kms_bw@linear-tiling-14-displays-2160x1440p<br />
-igt@kms_bw@linear-tiling-15-displays-2160x1440p<br />
-igt@kms_bw@linear-tiling-16-displays-2160x1440p</p>

</body>
</html>

--===============9116219975011809918==--
