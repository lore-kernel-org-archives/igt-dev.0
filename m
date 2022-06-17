Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8824690076096053350=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sharma, Swati2" <swati2.sharma@intel.com>
Date: Fri, 17 Jun 2022 13:01:52 -0000
Message-ID: <165547091284.20134.15810121822654090299@emeril.freedesktop.org>
References: <20220617110828.26508-1-swati2.sharma@intel.com>
In-Reply-To: <20220617110828.26508-1-swati2.sharma@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/kms=5Fflip=5Fscaled=5Fcrc=3A_New_tests_=28rev2=29?=
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

--===============8824690076096053350==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915/kms_flip_scaled_crc: New tests (rev2)
URL   : https://patchwork.freedesktop.org/series/105148/
State : success

== Summary ==

CI Bug Log - changes from IGT_6535 -> IGTPW_7334
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/index.html

Participating hosts (35 -> 35)
------------------------------

  Additional (2): fi-icl-u2 fi-apl-guc 
  Missing    (2): fi-rkl-11600 fi-bdw-samus 

Known issues
------------

  Here are the changes found in IGTPW_7334 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@debugfs_test@read_all_entries:
    - fi-apl-guc:         NOTRUN -> [DMESG-WARN][1] ([i915#1610] / [i915#5595])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/fi-apl-guc/igt@debugfs_test@read_all_entries.html

  * igt@gem_huc_copy@huc-copy:
    - fi-icl-u2:          NOTRUN -> [SKIP][2] ([i915#2190])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/fi-icl-u2/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@random-engines:
    - fi-icl-u2:          NOTRUN -> [SKIP][3] ([i915#4613]) +3 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/fi-icl-u2/igt@gem_lmem_swapping@random-engines.html

  * igt@i915_module_load@load:
    - fi-kbl-soraka:      [PASS][4] -> [DMESG-WARN][5] ([i915#1982])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6535/fi-kbl-soraka/igt@i915_module_load@load.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/fi-kbl-soraka/igt@i915_module_load@load.html

  * igt@i915_selftest@live@gem_contexts:
    - fi-icl-u2:          NOTRUN -> [INCOMPLETE][6] ([i915#4890])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/fi-icl-u2/igt@i915_selftest@live@gem_contexts.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-hsw-4770:        NOTRUN -> [SKIP][7] ([fdo#109271] / [fdo#111827])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/fi-hsw-4770/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-icl-u2:          NOTRUN -> [SKIP][8] ([fdo#111827]) +7 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - fi-icl-u2:          NOTRUN -> [SKIP][9] ([fdo#109278] / [i915#4103]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/fi-icl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_flip@basic-flip-vs-modeset@a-edp1:
    - fi-tgl-u2:          [PASS][10] -> [DMESG-WARN][11] ([i915#402])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6535/fi-tgl-u2/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/fi-tgl-u2/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html

  * igt@kms_force_connector_basic@force-connector-state:
    - fi-icl-u2:          NOTRUN -> [WARN][12] ([i915#6008])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/fi-icl-u2/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_force_connector_basic@force-load-detect:
    - fi-icl-u2:          NOTRUN -> [SKIP][13] ([fdo#109285])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/fi-icl-u2/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
    - fi-icl-u2:          NOTRUN -> [SKIP][14] ([fdo#109278])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/fi-icl-u2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - fi-icl-u2:          NOTRUN -> [SKIP][15] ([i915#3555])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/fi-icl-u2/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-userptr:
    - fi-icl-u2:          NOTRUN -> [SKIP][16] ([fdo#109295] / [i915#3301])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/fi-icl-u2/igt@prime_vgem@basic-userptr.html

  * igt@runner@aborted:
    - fi-icl-u2:          NOTRUN -> [FAIL][17] ([i915#4312])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/fi-icl-u2/igt@runner@aborted.html
    - fi-apl-guc:         NOTRUN -> [FAIL][18] ([i915#4312])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/fi-apl-guc/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@hangcheck:
    - fi-hsw-4770:        [INCOMPLETE][19] ([i915#3303] / [i915#4785]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6535/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html

  * igt@kms_flip@basic-plain-flip@a-edp1:
    - fi-tgl-u2:          [DMESG-WARN][21] ([i915#402]) -> [PASS][22] +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6535/fi-tgl-u2/igt@kms_flip@basic-plain-flip@a-edp1.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/fi-tgl-u2/igt@kms_flip@basic-plain-flip@a-edp1.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1610]: https://gitlab.freedesktop.org/drm/intel/issues/1610
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3303]: https://gitlab.freedesktop.org/drm/intel/issues/3303
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4785]: https://gitlab.freedesktop.org/drm/intel/issues/4785
  [i915#4890]: https://gitlab.freedesktop.org/drm/intel/issues/4890
  [i915#5595]: https://gitlab.freedesktop.org/drm/intel/issues/5595
  [i915#6008]: https://gitlab.freedesktop.org/drm/intel/issues/6008


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6535 -> IGTPW_7334

  CI-20190529: 20190529
  CI_DRM_11775: 93bea5a783b94aa5336606ddee482f659ccd9804 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7334: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/index.html
  IGT_6535: c30662230963df6e6dba0f5df4792840b2feae85 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


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

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/index.html

--===============8824690076096053350==
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
<tr><td><b>Series:</b></td><td>tests/i915/kms_flip_scaled_crc: New tests (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/105148/">https://patchwork.freedesktop.org/series/105148/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6535 -&gt; IGTPW_7334</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/index.html</p>
<h2>Participating hosts (35 -&gt; 35)</h2>
<p>Additional (2): fi-icl-u2 fi-apl-guc <br />
  Missing    (2): fi-rkl-11600 fi-bdw-samus </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7334 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@debugfs_test@read_all_entries:</p>
<ul>
<li>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/fi-apl-guc/igt@debugfs_test@read_all_entries.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1610">i915#1610</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5595">i915#5595</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/fi-icl-u2/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/fi-icl-u2/igt@gem_lmem_swapping@random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6535/fi-kbl-soraka/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/fi-kbl-soraka/igt@i915_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gem_contexts:</p>
<ul>
<li>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/fi-icl-u2/igt@i915_selftest@live@gem_contexts.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4890">i915#4890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/fi-hsw-4770/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-fast:</p>
<ul>
<li>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/fi-icl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@a-edp1:</p>
<ul>
<li>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6535/fi-tgl-u2/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/fi-tgl-u2/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/fi-icl-u2/igt@kms_force_connector_basic@force-connector-state.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6008">i915#6008</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/fi-icl-u2/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:</p>
<ul>
<li>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/fi-icl-u2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/fi-icl-u2/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-userptr:</p>
<ul>
<li>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/fi-icl-u2/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3301">i915#3301</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/fi-icl-u2/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</p>
</li>
<li>
<p>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/fi-apl-guc/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6535/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3303">i915#3303</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4785">i915#4785</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@a-edp1:</p>
<ul>
<li>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6535/fi-tgl-u2/igt@kms_flip@basic-plain-flip@a-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/fi-tgl-u2/igt@kms_flip@basic-plain-flip@a-edp1.html">PASS</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6535 -&gt; IGTPW_7334</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11775: 93bea5a783b94aa5336606ddee482f659ccd9804 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7334: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/index.html<br />
  IGT_6535: c30662230963df6e6dba0f5df4792840b2feae85 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
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

--===============8824690076096053350==--
