Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============1272365276585100621=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jeevan B" <jeevan.b@intel.com>
Date: Tue, 21 Nov 2023 08:28:48 -0000
Message-ID: <170055532839.30158.17578687043782472521@emeril.freedesktop.org>
References: <20231121062320.1860993-1-jeevan.b@intel.com>
In-Reply-To: <20231121062320.1860993-1-jeevan.b@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgQWRkIEZC?=
 =?utf-8?q?C_support_to_PSR/PSR2_tests?=
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

--===============1272365276585100621==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add FBC support to PSR/PSR2 tests
URL   : https://patchwork.freedesktop.org/series/126689/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_13901 -> IGTPW_10224
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10224/index.html

Participating hosts (31 -> 30)
------------------------------

  Additional (3): fi-hsw-4770 bat-kbl-2 fi-pnv-d510 
  Missing    (4): fi-kbl-soraka bat-atsm-1 bat-adlp-6 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_10224:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@kms_psr@psr_primary_mmap_gtt}:
    - fi-rkl-11600:       [SKIP][1] ([i915#9673]) -> [SKIP][2] +3 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13901/fi-rkl-11600/igt@kms_psr@psr_primary_mmap_gtt.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10224/fi-rkl-11600/igt@kms_psr@psr_primary_mmap_gtt.html
    - bat-dg2-11:         [SKIP][3] ([i915#9673]) -> [SKIP][4] +3 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13901/bat-dg2-11/igt@kms_psr@psr_primary_mmap_gtt.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10224/bat-dg2-11/igt@kms_psr@psr_primary_mmap_gtt.html
    - bat-adlm-1:         [SKIP][5] ([i915#9673]) -> [SKIP][6] +3 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13901/bat-adlm-1/igt@kms_psr@psr_primary_mmap_gtt.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10224/bat-adlm-1/igt@kms_psr@psr_primary_mmap_gtt.html
    - fi-tgl-1115g4:      [SKIP][7] ([i915#9673]) -> [SKIP][8] +3 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13901/fi-tgl-1115g4/igt@kms_psr@psr_primary_mmap_gtt.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10224/fi-tgl-1115g4/igt@kms_psr@psr_primary_mmap_gtt.html
    - bat-mtlp-6:         [SKIP][9] ([i915#9673]) -> [SKIP][10] +3 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13901/bat-mtlp-6/igt@kms_psr@psr_primary_mmap_gtt.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10224/bat-mtlp-6/igt@kms_psr@psr_primary_mmap_gtt.html

  * {igt@kms_psr@psr_sprite_plane_onoff}:
    - bat-dg2-9:          [SKIP][11] ([i915#9673]) -> [SKIP][12] +3 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13901/bat-dg2-9/igt@kms_psr@psr_sprite_plane_onoff.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10224/bat-dg2-9/igt@kms_psr@psr_sprite_plane_onoff.html

  
Known issues
------------

  Here are the changes found in IGTPW_10224 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@info:
    - bat-kbl-2:          NOTRUN -> [SKIP][13] ([fdo#109271] / [i915#1849])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10224/bat-kbl-2/igt@fbdev@info.html

  * igt@gem_lmem_swapping@basic:
    - fi-pnv-d510:        NOTRUN -> [SKIP][14] ([fdo#109271]) +25 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10224/fi-pnv-d510/igt@gem_lmem_swapping@basic.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - bat-kbl-2:          NOTRUN -> [SKIP][15] ([fdo#109271]) +20 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10224/bat-kbl-2/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - fi-hsw-4770:        NOTRUN -> [SKIP][16] ([fdo#109271] / [i915#5190])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10224/fi-hsw-4770/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-vga-1:
    - fi-hsw-4770:        NOTRUN -> [SKIP][17] ([fdo#109271]) +12 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10224/fi-hsw-4770/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-vga-1.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence:
    - bat-kbl-2:          NOTRUN -> [SKIP][18] ([fdo#109271] / [i915#1845]) +14 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10224/bat-kbl-2/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-apl-guc:         [DMESG-FAIL][19] ([i915#5334]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13901/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10224/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html

  * igt@kms_hdmi_inject@inject-audio:
    - fi-kbl-guc:         [FAIL][21] ([IGT#3]) -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13901/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10224/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1:
    - bat-rplp-1:         [ABORT][23] ([i915#8668]) -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13901/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10224/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html

  * {igt@kms_psr@psr_cursor_plane_move@edp-1}:
    - bat-jsl-1:          [SKIP][25] ([i915#9648]) -> [PASS][26] +2 other tests pass
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13901/bat-jsl-1/igt@kms_psr@psr_cursor_plane_move@edp-1.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10224/bat-jsl-1/igt@kms_psr@psr_cursor_plane_move@edp-1.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#3]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/3
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668
  [i915#9648]: https://gitlab.freedesktop.org/drm/intel/issues/9648
  [i915#9673]: https://gitlab.freedesktop.org/drm/intel/issues/9673


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7595 -> IGTPW_10224

  CI-20190529: 20190529
  CI_DRM_13901: 8d55b3869b666b36e26a40cfc2f1f84b72a34cd3 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10224: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10224/index.html
  IGT_7595: cfa00d99b1dfa0621ea552d1ed54907798da1a1a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10224/index.html

--===============1272365276585100621==
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
<tr><td><b>Series:</b></td><td>Add FBC support to PSR/PSR2 tests</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/126689/">https://patchwork.freedesktop.org/series/126689/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10224/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10224/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13901 -&gt; IGTPW_10224</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10224/index.html</p>
<h2>Participating hosts (31 -&gt; 30)</h2>
<p>Additional (3): fi-hsw-4770 bat-kbl-2 fi-pnv-d510 <br />
  Missing    (4): fi-kbl-soraka bat-atsm-1 bat-adlp-6 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_10224:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@kms_psr@psr_primary_mmap_gtt}:</p>
<ul>
<li>
<p>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13901/fi-rkl-11600/igt@kms_psr@psr_primary_mmap_gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9673">i915#9673</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10224/fi-rkl-11600/igt@kms_psr@psr_primary_mmap_gtt.html">SKIP</a> +3 other tests skip</p>
</li>
<li>
<p>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13901/bat-dg2-11/igt@kms_psr@psr_primary_mmap_gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9673">i915#9673</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10224/bat-dg2-11/igt@kms_psr@psr_primary_mmap_gtt.html">SKIP</a> +3 other tests skip</p>
</li>
<li>
<p>bat-adlm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13901/bat-adlm-1/igt@kms_psr@psr_primary_mmap_gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9673">i915#9673</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10224/bat-adlm-1/igt@kms_psr@psr_primary_mmap_gtt.html">SKIP</a> +3 other tests skip</p>
</li>
<li>
<p>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13901/fi-tgl-1115g4/igt@kms_psr@psr_primary_mmap_gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9673">i915#9673</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10224/fi-tgl-1115g4/igt@kms_psr@psr_primary_mmap_gtt.html">SKIP</a> +3 other tests skip</p>
</li>
<li>
<p>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13901/bat-mtlp-6/igt@kms_psr@psr_primary_mmap_gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9673">i915#9673</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10224/bat-mtlp-6/igt@kms_psr@psr_primary_mmap_gtt.html">SKIP</a> +3 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@psr_sprite_plane_onoff}:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13901/bat-dg2-9/igt@kms_psr@psr_sprite_plane_onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9673">i915#9673</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10224/bat-dg2-9/igt@kms_psr@psr_sprite_plane_onoff.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10224 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10224/bat-kbl-2/igt@fbdev@info.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10224/fi-pnv-d510/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10224/bat-kbl-2/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10224/fi-hsw-4770/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-vga-1:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10224/fi-hsw-4770/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-vga-1.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence:</p>
<ul>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10224/bat-kbl-2/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a>) +14 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13901/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10224/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13901/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/3">IGT#3</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10224/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1:</p>
<ul>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13901/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10224/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_psr@psr_cursor_plane_move@edp-1}:</p>
<ul>
<li>bat-jsl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13901/bat-jsl-1/igt@kms_psr@psr_cursor_plane_move@edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9648">i915#9648</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10224/bat-jsl-1/igt@kms_psr@psr_cursor_plane_move@edp-1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7595 -&gt; IGTPW_10224</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13901: 8d55b3869b666b36e26a40cfc2f1f84b72a34cd3 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10224: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10224/index.html<br />
  IGT_7595: cfa00d99b1dfa0621ea552d1ed54907798da1a1a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============1272365276585100621==--
