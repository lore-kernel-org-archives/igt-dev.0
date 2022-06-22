Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============3446705311087718741=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Swati Sharma" <swati2.sharma@intel.com>
Date: Wed, 22 Jun 2022 16:52:46 -0000
Message-ID: <165591676695.15063.3605489736023758767@emeril.freedesktop.org>
References: <20220622074348.31284-1-swati2.sharma@intel.com>
In-Reply-To: <20220622074348.31284-1-swati2.sharma@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/kms=5Fflip=5Fscaled=5Fcrc=3A_New_tests_=28rev4=29?=
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

--===============3446705311087718741==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915/kms_flip_scaled_crc: New tests (rev4)
URL   : https://patchwork.freedesktop.org/series/105148/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_11794 -> IGTPW_7359
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7359/index.html

Participating hosts (42 -> 39)
------------------------------

  Missing    (3): fi-cml-u2 fi-bdw-samus bat-dg2-8 

Known issues
------------

  Here are the changes found in IGTPW_7359 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@gem:
    - fi-blb-e6850:       NOTRUN -> [DMESG-FAIL][1] ([i915#4528])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7359/fi-blb-e6850/igt@i915_selftest@live@gem.html

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-skl-6700k2:      [PASS][2] -> [DMESG-FAIL][3] ([i915#5334])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11794/fi-skl-6700k2/igt@i915_selftest@live@gt_heartbeat.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7359/fi-skl-6700k2/igt@i915_selftest@live@gt_heartbeat.html

  * igt@i915_selftest@live@gt_lrc:
    - fi-rkl-guc:         [PASS][4] -> [INCOMPLETE][5] ([i915#4983])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11794/fi-rkl-guc/igt@i915_selftest@live@gt_lrc.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7359/fi-rkl-guc/igt@i915_selftest@live@gt_lrc.html

  * igt@i915_selftest@live@hangcheck:
    - fi-hsw-4770:        [PASS][6] -> [INCOMPLETE][7] ([i915#3303] / [i915#4785])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11794/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7359/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html

  * igt@i915_suspend@basic-s2idle-without-i915:
    - bat-dg1-6:          NOTRUN -> [INCOMPLETE][8] ([i915#6011])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7359/bat-dg1-6/igt@i915_suspend@basic-s2idle-without-i915.html

  * igt@prime_vgem@basic-userptr:
    - fi-tgl-u2:          NOTRUN -> [SKIP][9] ([fdo#109295] / [i915#3301])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7359/fi-tgl-u2/igt@prime_vgem@basic-userptr.html

  * igt@runner@aborted:
    - fi-hsw-4770:        NOTRUN -> [FAIL][10] ([fdo#109271] / [i915#4312] / [i915#5594] / [i915#6246])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7359/fi-hsw-4770/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s0@smem:
    - {fi-ehl-2}:         [DMESG-WARN][11] ([i915#5122]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11794/fi-ehl-2/igt@gem_exec_suspend@basic-s0@smem.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7359/fi-ehl-2/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@i915_selftest@live@gt_engines:
    - bat-dg1-6:          [INCOMPLETE][13] ([i915#4418]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11794/bat-dg1-6/igt@i915_selftest@live@gt_engines.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7359/bat-dg1-6/igt@i915_selftest@live@gt_engines.html

  * igt@i915_selftest@live@requests:
    - fi-blb-e6850:       [DMESG-FAIL][15] ([i915#4528]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11794/fi-blb-e6850/igt@i915_selftest@live@requests.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7359/fi-blb-e6850/igt@i915_selftest@live@requests.html

  * igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:
    - fi-kbl-soraka:      [INCOMPLETE][17] -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11794/fi-kbl-soraka/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7359/fi-kbl-soraka/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html

  * igt@kms_busy@basic@flip:
    - fi-tgl-u2:          [DMESG-WARN][19] ([i915#402]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11794/fi-tgl-u2/igt@kms_busy@basic@flip.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7359/fi-tgl-u2/igt@kms_busy@basic@flip.html
    - {bat-adlp-6}:       [DMESG-WARN][21] ([i915#3576]) -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11794/bat-adlp-6/igt@kms_busy@basic@flip.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7359/bat-adlp-6/igt@kms_busy@basic@flip.html

  * {igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size}:
    - fi-bsw-kefka:       [FAIL][23] -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11794/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7359/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3303]: https://gitlab.freedesktop.org/drm/intel/issues/3303
  [i915#3576]: https://gitlab.freedesktop.org/drm/intel/issues/3576
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4418]: https://gitlab.freedesktop.org/drm/intel/issues/4418
  [i915#4528]: https://gitlab.freedesktop.org/drm/intel/issues/4528
  [i915#4785]: https://gitlab.freedesktop.org/drm/intel/issues/4785
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#5122]: https://gitlab.freedesktop.org/drm/intel/issues/5122
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#5594]: https://gitlab.freedesktop.org/drm/intel/issues/5594
  [i915#6011]: https://gitlab.freedesktop.org/drm/intel/issues/6011
  [i915#6246]: https://gitlab.freedesktop.org/drm/intel/issues/6246


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6539 -> IGTPW_7359

  CI-20190529: 20190529
  CI_DRM_11794: 529f44f159dbe70ba69b6f730280d5db9b7338bc @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7359: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7359/index.html
  IGT_6539: c39caed3b207e058409f5e2b548a4f940b6283c6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling
+igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling
+igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling
+igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling
+igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling
+igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling
+igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling
+igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling
+igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling
+igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling
+igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling
+igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling
+igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling
+igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling
+igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling
+igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling
+igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling
+igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling
+igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling
+igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling
+igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling
+igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling
+igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling
+igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling
+igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling
+igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling
+igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling
+igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling
+igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling
+igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling
+igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling
+igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling
+igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling
-igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-upscaling

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7359/index.html

--===============3446705311087718741==
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
<tr><td><b>Series:</b></td><td>tests/i915/kms_flip_scaled_crc: New tests (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/105148/">https://patchwork.freedesktop.org/series/105148/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7359/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7359/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11794 -&gt; IGTPW_7359</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7359/index.html</p>
<h2>Participating hosts (42 -&gt; 39)</h2>
<p>Missing    (3): fi-cml-u2 fi-bdw-samus bat-dg2-8 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7359 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gem:</p>
<ul>
<li>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7359/fi-blb-e6850/igt@i915_selftest@live@gem.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4528">i915#4528</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>fi-skl-6700k2:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11794/fi-skl-6700k2/igt@i915_selftest@live@gt_heartbeat.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7359/fi-skl-6700k2/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_lrc:</p>
<ul>
<li>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11794/fi-rkl-guc/igt@i915_selftest@live@gt_lrc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7359/fi-rkl-guc/igt@i915_selftest@live@gt_lrc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11794/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7359/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3303">i915#3303</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4785">i915#4785</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s2idle-without-i915:</p>
<ul>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7359/bat-dg1-6/igt@i915_suspend@basic-s2idle-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6011">i915#6011</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-userptr:</p>
<ul>
<li>fi-tgl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7359/fi-tgl-u2/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3301">i915#3301</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7359/fi-hsw-4770/igt@runner@aborted.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5594">i915#5594</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6246">i915#6246</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>{fi-ehl-2}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11794/fi-ehl-2/igt@gem_exec_suspend@basic-s0@smem.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5122">i915#5122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7359/fi-ehl-2/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_engines:</p>
<ul>
<li>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11794/bat-dg1-6/igt@i915_selftest@live@gt_engines.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4418">i915#4418</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7359/bat-dg1-6/igt@i915_selftest@live@gt_engines.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>fi-blb-e6850:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11794/fi-blb-e6850/igt@i915_selftest@live@requests.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4528">i915#4528</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7359/fi-blb-e6850/igt@i915_selftest@live@requests.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:</p>
<ul>
<li>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11794/fi-kbl-soraka/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7359/fi-kbl-soraka/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@flip:</p>
<ul>
<li>
<p>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11794/fi-tgl-u2/igt@kms_busy@basic@flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7359/fi-tgl-u2/igt@kms_busy@basic@flip.html">PASS</a></p>
</li>
<li>
<p>{bat-adlp-6}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11794/bat-adlp-6/igt@kms_busy@basic@flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3576">i915#3576</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7359/bat-adlp-6/igt@kms_busy@basic@flip.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size}:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11794/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7359/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6539 -&gt; IGTPW_7359</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11794: 529f44f159dbe70ba69b6f730280d5db9b7338bc @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7359: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7359/index.html<br />
  IGT_6539: c39caed3b207e058409f5e2b548a4f940b6283c6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling<br />
+igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling<br />
+igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling<br />
+igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling<br />
+igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling<br />
+igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling<br />
+igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling<br />
+igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling<br />
+igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling<br />
+igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling<br />
+igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling<br />
+igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling<br />
+igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling<br />
+igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling<br />
+igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling<br />
+igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling<br />
+igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling<br />
+igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling<br />
+igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling<br />
+igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling<br />
+igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling<br />
+igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling<br />
+igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling<br />
+igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling<br />
+igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling<br />
+igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling<br />
+igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling<br />
+igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling<br />
+igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling<br />
+igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling<br />
+igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling<br />
+igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling<br />
+igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling<br />
-igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-upscaling</p>

</body>
</html>

--===============3446705311087718741==--
