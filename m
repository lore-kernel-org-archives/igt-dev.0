Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============6150585267427541438=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Swati Sharma" <swati2.sharma@intel.com>
Date: Sat, 23 Sep 2023 09:41:39 -0000
Message-ID: <169546209918.3503.8845660712932528118@emeril.freedesktop.org>
References: <20230923084355.434574-1-swati2.sharma@intel.com>
In-Reply-To: <20230923084355.434574-1-swati2.sharma@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fplane=5Fscaling=3A_rename_subtests?=
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

--===============6150585267427541438==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_plane_scaling: rename subtests
URL   : https://patchwork.freedesktop.org/series/124151/
State : success

== Summary ==

CI Bug Log - changes from IGT_7499 -> IGTPW_9860
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9860/index.html

Participating hosts (39 -> 39)
------------------------------

  Additional (1): fi-kbl-soraka 
  Missing    (1): fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_9860 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s0@smem:
    - bat-mtlp-8:         NOTRUN -> [ABORT][1] ([i915#9262])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9860/bat-mtlp-8/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@gem_huc_copy@huc-copy:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][2] ([fdo#109271] / [i915#2190])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9860/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@basic:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][3] ([fdo#109271] / [i915#4613]) +3 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9860/fi-kbl-soraka/igt@gem_lmem_swapping@basic.html

  * igt@i915_selftest@live@gt_pm:
    - fi-kbl-soraka:      NOTRUN -> [DMESG-FAIL][4] ([i915#1886] / [i915#7913])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9860/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html

  * igt@i915_suspend@basic-s3-without-i915:
    - bat-mtlp-8:         NOTRUN -> [SKIP][5] ([i915#6645])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9860/bat-mtlp-8/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_dsc@dsc-basic:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][6] ([fdo#109271]) +9 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9860/fi-kbl-soraka/igt@kms_dsc@dsc-basic.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - bat-dg2-11:         NOTRUN -> [SKIP][7] ([i915#1845]) +3 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9860/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@requests:
    - bat-mtlp-8:         [ABORT][8] ([i915#9262]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7499/bat-mtlp-8/igt@i915_selftest@live@requests.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9860/bat-mtlp-8/igt@i915_selftest@live@requests.html

  * igt@kms_frontbuffer_tracking@basic:
    - fi-bsw-nick:        [FAIL][10] ([i915#9276]) -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7499/fi-bsw-nick/igt@kms_frontbuffer_tracking@basic.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9860/fi-bsw-nick/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_hdmi_inject@inject-audio:
    - fi-kbl-guc:         [FAIL][12] ([IGT#3]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7499/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9860/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html

  
  [IGT#3]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/3
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1886]: https://gitlab.freedesktop.org/drm/intel/issues/1886
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#6645]: https://gitlab.freedesktop.org/drm/intel/issues/6645
  [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
  [i915#9262]: https://gitlab.freedesktop.org/drm/intel/issues/9262
  [i915#9276]: https://gitlab.freedesktop.org/drm/intel/issues/9276


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7499 -> IGTPW_9860

  CI-20190529: 20190529
  CI_DRM_13671: e1973de2c4516e9130157e538014e79c8aa57b41 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9860: 9860
  IGT_7499: d991240f6c6751e9480456c20de785cfc6e6ff15 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers
+igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format
+igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation
+igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers
+igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format
+igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation
+igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers
+igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format
+igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation
+igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers
+igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format
+igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation
+igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers
+igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format
+igt@kms_plane_scaling@plane-upscale-20x20-with-rotation
+igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers
+igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format
+igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation
-igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-5
-igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25
-igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-75
-igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-5
-igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25
-igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-75
-igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5
-igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25
-igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-75
-igt@kms_plane_scaling@plane-scaler-with-modifiers-unity-scaling
-igt@kms_plane_scaling@plane-scaler-with-pixel-format-unity-scaling
-igt@kms_plane_scaling@plane-scaler-with-rotation-unity-scaling
-igt@kms_plane_scaling@plane-upscale-with-modifiers-20x20
-igt@kms_plane_scaling@plane-upscale-with-modifiers-factor-0-25
-igt@kms_plane_scaling@plane-upscale-with-pixel-format-20x20
-igt@kms_plane_scaling@plane-upscale-with-pixel-format-factor-0-25
-igt@kms_plane_scaling@plane-upscale-with-rotation-20x20
-igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25
-igt@kms_vrr@flip-basic-fastset

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9860/index.html

--===============6150585267427541438==
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
<tr><td><b>Series:</b></td><td>tests/kms_plane_scaling: rename subtests</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/124151/">https://patchwork.freedesktop.org/series/124151/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9860/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9860/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7499 -&gt; IGTPW_9860</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9860/index.html</p>
<h2>Participating hosts (39 -&gt; 39)</h2>
<p>Additional (1): fi-kbl-soraka <br />
  Missing    (1): fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9860 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9860/bat-mtlp-8/igt@gem_exec_suspend@basic-s0@smem.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9262">i915#9262</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9860/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9860/fi-kbl-soraka/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9860/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1886">i915#1886</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9860/bat-mtlp-8/igt@i915_suspend@basic-s3-without-i915.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6645">i915#6645</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9860/fi-kbl-soraka/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9860/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a>) +3 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7499/bat-mtlp-8/igt@i915_selftest@live@requests.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9262">i915#9262</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9860/bat-mtlp-8/igt@i915_selftest@live@requests.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7499/fi-bsw-nick/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9276">i915#9276</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9860/fi-bsw-nick/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7499/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/3">IGT#3</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9860/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7499 -&gt; IGTPW_9860</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13671: e1973de2c4516e9130157e538014e79c8aa57b41 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9860: 9860<br />
  IGT_7499: d991240f6c6751e9480456c20de785cfc6e6ff15 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers<br />
+igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format<br />
+igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation<br />
+igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers<br />
+igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format<br />
+igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation<br />
+igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers<br />
+igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format<br />
+igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation<br />
+igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers<br />
+igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format<br />
+igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation<br />
+igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers<br />
+igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format<br />
+igt@kms_plane_scaling@plane-upscale-20x20-with-rotation<br />
+igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers<br />
+igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format<br />
+igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation<br />
-igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-5<br />
-igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25<br />
-igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-75<br />
-igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-5<br />
-igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25<br />
-igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-75<br />
-igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5<br />
-igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25<br />
-igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-75<br />
-igt@kms_plane_scaling@plane-scaler-with-modifiers-unity-scaling<br />
-igt@kms_plane_scaling@plane-scaler-with-pixel-format-unity-scaling<br />
-igt@kms_plane_scaling@plane-scaler-with-rotation-unity-scaling<br />
-igt@kms_plane_scaling@plane-upscale-with-modifiers-20x20<br />
-igt@kms_plane_scaling@plane-upscale-with-modifiers-factor-0-25<br />
-igt@kms_plane_scaling@plane-upscale-with-pixel-format-20x20<br />
-igt@kms_plane_scaling@plane-upscale-with-pixel-format-factor-0-25<br />
-igt@kms_plane_scaling@plane-upscale-with-rotation-20x20<br />
-igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25<br />
-igt@kms_vrr@flip-basic-fastset</p>

</body>
</html>

--===============6150585267427541438==--
