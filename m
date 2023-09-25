Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============7578392634620566874=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jesse Zhang" <jesse.zhang@amd.com>
Date: Mon, 25 Sep 2023 02:49:54 -0000
Message-ID: <169561019467.21533.14608320087916364529@emeril.freedesktop.org>
References: <20230925020522.3523365-1-jesse.zhang@amd.com>
In-Reply-To: <20230925020522.3523365-1-jesse.zhang@amd.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?amd=5Fdeadlock=3A_add_reset_subtest?=
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

--===============7578392634620566874==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/amd_deadlock: add reset subtest
URL   : https://patchwork.freedesktop.org/series/124171/
State : success

== Summary ==

CI Bug Log - changes from IGT_7499 -> IGTPW_9861
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9861/index.html

Participating hosts (39 -> 39)
------------------------------

  Additional (1): bat-dg2-8 
  Missing    (1): fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_9861 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s0@smem:
    - bat-mtlp-8:         NOTRUN -> [ABORT][1] ([i915#9262])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9861/bat-mtlp-8/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@gem_mmap@basic:
    - bat-dg2-8:          NOTRUN -> [SKIP][2] ([i915#4083])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9861/bat-dg2-8/igt@gem_mmap@basic.html

  * igt@gem_mmap_gtt@basic:
    - bat-dg2-8:          NOTRUN -> [SKIP][3] ([i915#4077]) +2 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9861/bat-dg2-8/igt@gem_mmap_gtt@basic.html

  * igt@gem_tiled_pread_basic:
    - bat-dg2-8:          NOTRUN -> [SKIP][4] ([i915#4079]) +1 other test skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9861/bat-dg2-8/igt@gem_tiled_pread_basic.html

  * igt@i915_pm_rps@basic-api:
    - bat-dg2-8:          NOTRUN -> [SKIP][5] ([i915#6621])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9861/bat-dg2-8/igt@i915_pm_rps@basic-api.html

  * igt@i915_suspend@basic-s3-without-i915:
    - bat-mtlp-8:         NOTRUN -> [SKIP][6] ([i915#6645])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9861/bat-mtlp-8/igt@i915_suspend@basic-s3-without-i915.html
    - bat-dg2-8:          NOTRUN -> [SKIP][7] ([i915#6645])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9861/bat-dg2-8/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-dg2-8:          NOTRUN -> [SKIP][8] ([i915#5190])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9861/bat-dg2-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - bat-dg2-8:          NOTRUN -> [SKIP][9] ([i915#4215] / [i915#5190])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9861/bat-dg2-8/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_addfb_basic@framebuffer-vs-set-tiling:
    - bat-dg2-8:          NOTRUN -> [SKIP][10] ([i915#4212]) +6 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9861/bat-dg2-8/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html

  * igt@kms_addfb_basic@tile-pitch-mismatch:
    - bat-dg2-8:          NOTRUN -> [SKIP][11] ([i915#4212] / [i915#5608])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9861/bat-dg2-8/igt@kms_addfb_basic@tile-pitch-mismatch.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - bat-dg2-8:          NOTRUN -> [SKIP][12] ([i915#4103] / [i915#4213] / [i915#5608]) +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9861/bat-dg2-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_force_connector_basic@force-load-detect:
    - bat-dg2-8:          NOTRUN -> [SKIP][13] ([fdo#109285])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9861/bat-dg2-8/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - bat-dg2-8:          NOTRUN -> [SKIP][14] ([i915#5274])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9861/bat-dg2-8/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_psr@cursor_plane_move:
    - bat-dg2-8:          NOTRUN -> [SKIP][15] ([i915#1072]) +3 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9861/bat-dg2-8/igt@kms_psr@cursor_plane_move.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-dg2-8:          NOTRUN -> [SKIP][16] ([i915#3555])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9861/bat-dg2-8/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-fence-flip:
    - bat-dg2-8:          NOTRUN -> [SKIP][17] ([i915#3708])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9861/bat-dg2-8/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-fence-mmap:
    - bat-dg2-8:          NOTRUN -> [SKIP][18] ([i915#3708] / [i915#4077]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9861/bat-dg2-8/igt@prime_vgem@basic-fence-mmap.html

  * igt@prime_vgem@basic-write:
    - bat-dg2-8:          NOTRUN -> [SKIP][19] ([i915#3291] / [i915#3708]) +2 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9861/bat-dg2-8/igt@prime_vgem@basic-write.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@requests:
    - bat-mtlp-8:         [ABORT][20] ([i915#9262]) -> [PASS][21]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7499/bat-mtlp-8/igt@i915_selftest@live@requests.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9861/bat-mtlp-8/igt@i915_selftest@live@requests.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
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
  [i915#5608]: https://gitlab.freedesktop.org/drm/intel/issues/5608
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#6645]: https://gitlab.freedesktop.org/drm/intel/issues/6645
  [i915#7952]: https://gitlab.freedesktop.org/drm/intel/issues/7952
  [i915#9262]: https://gitlab.freedesktop.org/drm/intel/issues/9262


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7499 -> IGTPW_9861

  CI-20190529: 20190529
  CI_DRM_13671: e1973de2c4516e9130157e538014e79c8aa57b41 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9861: 9861
  IGT_7499: d991240f6c6751e9480456c20de785cfc6e6ff15 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-5
+igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25
+igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-75
+igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-5
+igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25
+igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-75
+igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5
+igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25
+igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-75
+igt@kms_plane_scaling@plane-scaler-with-modifiers-unity-scaling
+igt@kms_plane_scaling@plane-scaler-with-pixel-format-unity-scaling
+igt@kms_plane_scaling@plane-scaler-with-rotation-unity-scaling
+igt@kms_plane_scaling@plane-upscale-with-modifiers-20x20
+igt@kms_plane_scaling@plane-upscale-with-modifiers-factor-0-25
+igt@kms_plane_scaling@plane-upscale-with-pixel-format-20x20
+igt@kms_plane_scaling@plane-upscale-with-pixel-format-factor-0-25
+igt@kms_plane_scaling@plane-upscale-with-rotation-20x20
+igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25
-igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers
-igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format
-igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation
-igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers
-igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format
-igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation
-igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers
-igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format
-igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation
-igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers
-igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format
-igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation
-igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers
-igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format
-igt@kms_plane_scaling@plane-upscale-20x20-with-rotation
-igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers
-igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format
-igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9861/index.html

--===============7578392634620566874==
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
<tr><td><b>Series:</b></td><td>tests/amd_deadlock: add reset subtest</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/124171/">https://patchwork.freedesktop.org/series/124171/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9861/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9861/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7499 -&gt; IGTPW_9861</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9861/index.html</p>
<h2>Participating hosts (39 -&gt; 39)</h2>
<p>Additional (1): bat-dg2-8 <br />
  Missing    (1): fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9861 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9861/bat-mtlp-8/igt@gem_exec_suspend@basic-s0@smem.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9262">i915#9262</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@basic:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9861/bat-dg2-8/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9861/bat-dg2-8/igt@gem_mmap_gtt@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9861/bat-dg2-8/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4079">i915#4079</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9861/bat-dg2-8/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>
<p>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9861/bat-mtlp-8/igt@i915_suspend@basic-s3-without-i915.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6645">i915#6645</a>)</p>
</li>
<li>
<p>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9861/bat-dg2-8/igt@i915_suspend@basic-s3-without-i915.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6645">i915#6645</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9861/bat-dg2-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9861/bat-dg2-8/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4215">i915#4215</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@framebuffer-vs-set-tiling:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9861/bat-dg2-8/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4212">i915#4212</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@tile-pitch-mismatch:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9861/bat-dg2-8/igt@kms_addfb_basic@tile-pitch-mismatch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4212">i915#4212</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5608">i915#5608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9861/bat-dg2-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4213">i915#4213</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5608">i915#5608</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9861/bat-dg2-8/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9861/bat-dg2-8/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5274">i915#5274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@cursor_plane_move:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9861/bat-dg2-8/igt@kms_psr@cursor_plane_move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9861/bat-dg2-8/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9861/bat-dg2-8/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-mmap:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9861/bat-dg2-8/igt@prime_vgem@basic-fence-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9861/bat-dg2-8/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@requests:<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7499/bat-mtlp-8/igt@i915_selftest@live@requests.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9262">i915#9262</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9861/bat-mtlp-8/igt@i915_selftest@live@requests.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7499 -&gt; IGTPW_9861</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13671: e1973de2c4516e9130157e538014e79c8aa57b41 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9861: 9861<br />
  IGT_7499: d991240f6c6751e9480456c20de785cfc6e6ff15 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-5<br />
+igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25<br />
+igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-75<br />
+igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-5<br />
+igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25<br />
+igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-75<br />
+igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5<br />
+igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25<br />
+igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-75<br />
+igt@kms_plane_scaling@plane-scaler-with-modifiers-unity-scaling<br />
+igt@kms_plane_scaling@plane-scaler-with-pixel-format-unity-scaling<br />
+igt@kms_plane_scaling@plane-scaler-with-rotation-unity-scaling<br />
+igt@kms_plane_scaling@plane-upscale-with-modifiers-20x20<br />
+igt@kms_plane_scaling@plane-upscale-with-modifiers-factor-0-25<br />
+igt@kms_plane_scaling@plane-upscale-with-pixel-format-20x20<br />
+igt@kms_plane_scaling@plane-upscale-with-pixel-format-factor-0-25<br />
+igt@kms_plane_scaling@plane-upscale-with-rotation-20x20<br />
+igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25<br />
-igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers<br />
-igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format<br />
-igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation<br />
-igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers<br />
-igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format<br />
-igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation<br />
-igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers<br />
-igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format<br />
-igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation<br />
-igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers<br />
-igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format<br />
-igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation<br />
-igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers<br />
-igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format<br />
-igt@kms_plane_scaling@plane-upscale-20x20-with-rotation<br />
-igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers<br />
-igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format<br />
-igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation</p>

</body>
</html>

--===============7578392634620566874==--
