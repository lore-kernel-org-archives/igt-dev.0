Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2787162749456066628=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Swati Sharma" <swati2.sharma@intel.com>
Date: Mon, 18 Sep 2023 13:06:50 -0000
Message-ID: <169504241087.32418.3905995425234204126@emeril.freedesktop.org>
References: <20230918101150.258055-1-swati2.sharma@intel.com>
In-Reply-To: <20230918101150.258055-1-swati2.sharma@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fcontent=5Fprotection=3A_rename_subtests?=
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

--===============2787162749456066628==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_content_protection: rename subtests
URL   : https://patchwork.freedesktop.org/series/123852/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_13647 -> IGTPW_9816
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9816/index.html

Participating hosts (38 -> 39)
------------------------------

  Additional (2): fi-kbl-soraka fi-pnv-d510 
  Missing    (1): fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_9816 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_huc_copy@huc-copy:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][1] ([fdo#109271] / [i915#2190])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9816/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@basic:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][2] ([fdo#109271] / [i915#4613]) +3 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9816/fi-kbl-soraka/igt@gem_lmem_swapping@basic.html

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-apl-guc:         [PASS][3] -> [DMESG-FAIL][4] ([i915#5334])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13647/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9816/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html

  * igt@i915_selftest@live@gt_pm:
    - fi-kbl-soraka:      NOTRUN -> [DMESG-FAIL][5] ([i915#1886] / [i915#7913])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9816/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - fi-hsw-4770:        NOTRUN -> [SKIP][6] ([fdo#109271]) +13 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9816/fi-hsw-4770/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_dsc@dsc-basic:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][7] ([fdo#109271]) +9 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9816/fi-kbl-soraka/igt@kms_dsc@dsc-basic.html

  * igt@kms_frontbuffer_tracking@basic:
    - fi-bsw-nick:        [PASS][8] -> [FAIL][9] ([i915#9276])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13647/fi-bsw-nick/igt@kms_frontbuffer_tracking@basic.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9816/fi-bsw-nick/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - bat-dg2-11:         NOTRUN -> [SKIP][10] ([i915#1845]) +3 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9816/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-vga-1:
    - fi-hsw-4770:        NOTRUN -> [DMESG-WARN][11] ([i915#8841]) +6 other tests dmesg-warn
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9816/fi-hsw-4770/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-vga-1.html

  * igt@kms_psr@primary_page_flip:
    - fi-pnv-d510:        NOTRUN -> [SKIP][12] ([fdo#109271]) +31 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9816/fi-pnv-d510/igt@kms_psr@primary_page_flip.html

  * igt@kms_psr@sprite_plane_onoff:
    - fi-hsw-4770:        NOTRUN -> [SKIP][13] ([fdo#109271] / [i915#1072]) +3 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9816/fi-hsw-4770/igt@kms_psr@sprite_plane_onoff.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s0@smem:
    - bat-dg2-9:          [INCOMPLETE][14] ([i915#8797] / [i915#9275]) -> [PASS][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13647/bat-dg2-9/igt@gem_exec_suspend@basic-s0@smem.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9816/bat-dg2-9/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@i915_selftest@live@hangcheck:
    - fi-skl-guc:         [DMESG-FAIL][16] -> [PASS][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13647/fi-skl-guc/igt@i915_selftest@live@hangcheck.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9816/fi-skl-guc/igt@i915_selftest@live@hangcheck.html

  * igt@kms_hdmi_inject@inject-audio:
    - fi-kbl-guc:         [FAIL][18] ([IGT#3] / [i915#6121]) -> [PASS][19]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13647/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9816/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#3]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/3
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1886]: https://gitlab.freedesktop.org/drm/intel/issues/1886
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#6121]: https://gitlab.freedesktop.org/drm/intel/issues/6121
  [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
  [i915#8797]: https://gitlab.freedesktop.org/drm/intel/issues/8797
  [i915#8841]: https://gitlab.freedesktop.org/drm/intel/issues/8841
  [i915#9275]: https://gitlab.freedesktop.org/drm/intel/issues/9275
  [i915#9276]: https://gitlab.freedesktop.org/drm/intel/issues/9276


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7493 -> IGTPW_9816

  CI-20190529: 20190529
  CI_DRM_13647: 926e8f4826a93750b5a9355a0e8934702edf55b8 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9816: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9816/index.html
  IGT_7493: 2517e42d612e0c1ca096acf8b5f6177f7ef4bce7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@kms_content_protection@content-type-change
+igt@kms_content_protection@mei-interface
+igt@kms_universal_plane@cursor-fb-leak-pipe-a
+igt@kms_universal_plane@cursor-fb-leak-pipe-b
+igt@kms_universal_plane@cursor-fb-leak-pipe-c
+igt@kms_universal_plane@cursor-fb-leak-pipe-d
+igt@kms_universal_plane@cursor-fb-leak-pipe-e
+igt@kms_universal_plane@cursor-fb-leak-pipe-f
+igt@kms_universal_plane@cursor-fb-leak-pipe-g
+igt@kms_universal_plane@cursor-fb-leak-pipe-h
+igt@kms_universal_plane@disable-primary-vs-flip-pipe-a
+igt@kms_universal_plane@disable-primary-vs-flip-pipe-b
+igt@kms_universal_plane@disable-primary-vs-flip-pipe-c
+igt@kms_universal_plane@disable-primary-vs-flip-pipe-d
+igt@kms_universal_plane@disable-primary-vs-flip-pipe-e
+igt@kms_universal_plane@disable-primary-vs-flip-pipe-f
+igt@kms_universal_plane@disable-primary-vs-flip-pipe-g
+igt@kms_universal_plane@disable-primary-vs-flip-pipe-h
+igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-a
+igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-b
+igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-c
+igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-d
+igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-e
+igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-f
+igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-g
+igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-h
+igt@kms_universal_plane@universal-plane-pipe-a-functional
+igt@kms_universal_plane@universal-plane-pipe-a-sanity
+igt@kms_universal_plane@universal-plane-pipe-b-functional
+igt@kms_universal_plane@universal-plane-pipe-b-sanity
+igt@kms_universal_plane@universal-plane-pipe-c-functional
+igt@kms_universal_plane@universal-plane-pipe-c-sanity
+igt@kms_universal_plane@universal-plane-pipe-d-functional
+igt@kms_universal_plane@universal-plane-pipe-d-sanity
+igt@kms_universal_plane@universal-plane-pipe-e-functional
+igt@kms_universal_plane@universal-plane-pipe-e-sanity
+igt@kms_universal_plane@universal-plane-pipe-f-functional
+igt@kms_universal_plane@universal-plane-pipe-f-sanity
+igt@kms_universal_plane@universal-plane-pipe-g-functional
+igt@kms_universal_plane@universal-plane-pipe-g-sanity
+igt@kms_universal_plane@universal-plane-pipe-h-functional
+igt@kms_universal_plane@universal-plane-pipe-h-sanity
-igt@kms_content_protection@content_type_change
-igt@kms_content_protection@mei_interface
-igt@kms_universal_plane@cursor-fb-leak
-igt@kms_universal_plane@disable-primary-vs-flip
-igt@kms_universal_plane@universal-plane-functional
-igt@kms_universal_plane@universal-plane-pageflip-windowed
-igt@kms_universal_plane@universal-plane-sanity

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9816/index.html

--===============2787162749456066628==
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
<tr><td><b>Series:</b></td><td>tests/kms_content_protection: rename subtests</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/123852/">https://patchwork.freedesktop.org/series/123852/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9816/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9816/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13647 -&gt; IGTPW_9816</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9816/index.html</p>
<h2>Participating hosts (38 -&gt; 39)</h2>
<p>Additional (2): fi-kbl-soraka fi-pnv-d510 <br />
  Missing    (1): fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9816 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9816/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9816/fi-kbl-soraka/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13647/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9816/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9816/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1886">i915#1886</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9816/fi-hsw-4770/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9816/fi-kbl-soraka/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13647/fi-bsw-nick/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9816/fi-bsw-nick/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9276">i915#9276</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9816/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-vga-1:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9816/fi-hsw-4770/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-vga-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8841">i915#8841</a>) +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9816/fi-pnv-d510/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_plane_onoff:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9816/fi-hsw-4770/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +3 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13647/bat-dg2-9/igt@gem_exec_suspend@basic-s0@smem.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8797">i915#8797</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9275">i915#9275</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9816/bat-dg2-9/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-skl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13647/fi-skl-guc/igt@i915_selftest@live@hangcheck.html">DMESG-FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9816/fi-skl-guc/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13647/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/3">IGT#3</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6121">i915#6121</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9816/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7493 -&gt; IGTPW_9816</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13647: 926e8f4826a93750b5a9355a0e8934702edf55b8 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9816: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9816/index.html<br />
  IGT_7493: 2517e42d612e0c1ca096acf8b5f6177f7ef4bce7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@kms_content_protection@content-type-change<br />
+igt@kms_content_protection@mei-interface<br />
+igt@kms_universal_plane@cursor-fb-leak-pipe-a<br />
+igt@kms_universal_plane@cursor-fb-leak-pipe-b<br />
+igt@kms_universal_plane@cursor-fb-leak-pipe-c<br />
+igt@kms_universal_plane@cursor-fb-leak-pipe-d<br />
+igt@kms_universal_plane@cursor-fb-leak-pipe-e<br />
+igt@kms_universal_plane@cursor-fb-leak-pipe-f<br />
+igt@kms_universal_plane@cursor-fb-leak-pipe-g<br />
+igt@kms_universal_plane@cursor-fb-leak-pipe-h<br />
+igt@kms_universal_plane@disable-primary-vs-flip-pipe-a<br />
+igt@kms_universal_plane@disable-primary-vs-flip-pipe-b<br />
+igt@kms_universal_plane@disable-primary-vs-flip-pipe-c<br />
+igt@kms_universal_plane@disable-primary-vs-flip-pipe-d<br />
+igt@kms_universal_plane@disable-primary-vs-flip-pipe-e<br />
+igt@kms_universal_plane@disable-primary-vs-flip-pipe-f<br />
+igt@kms_universal_plane@disable-primary-vs-flip-pipe-g<br />
+igt@kms_universal_plane@disable-primary-vs-flip-pipe-h<br />
+igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-a<br />
+igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-b<br />
+igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-c<br />
+igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-d<br />
+igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-e<br />
+igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-f<br />
+igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-g<br />
+igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-h<br />
+igt@kms_universal_plane@universal-plane-pipe-a-functional<br />
+igt@kms_universal_plane@universal-plane-pipe-a-sanity<br />
+igt@kms_universal_plane@universal-plane-pipe-b-functional<br />
+igt@kms_universal_plane@universal-plane-pipe-b-sanity<br />
+igt@kms_universal_plane@universal-plane-pipe-c-functional<br />
+igt@kms_universal_plane@universal-plane-pipe-c-sanity<br />
+igt@kms_universal_plane@universal-plane-pipe-d-functional<br />
+igt@kms_universal_plane@universal-plane-pipe-d-sanity<br />
+igt@kms_universal_plane@universal-plane-pipe-e-functional<br />
+igt@kms_universal_plane@universal-plane-pipe-e-sanity<br />
+igt@kms_universal_plane@universal-plane-pipe-f-functional<br />
+igt@kms_universal_plane@universal-plane-pipe-f-sanity<br />
+igt@kms_universal_plane@universal-plane-pipe-g-functional<br />
+igt@kms_universal_plane@universal-plane-pipe-g-sanity<br />
+igt@kms_universal_plane@universal-plane-pipe-h-functional<br />
+igt@kms_universal_plane@universal-plane-pipe-h-sanity<br />
-igt@kms_content_protection@content_type_change<br />
-igt@kms_content_protection@mei_interface<br />
-igt@kms_universal_plane@cursor-fb-leak<br />
-igt@kms_universal_plane@disable-primary-vs-flip<br />
-igt@kms_universal_plane@universal-plane-functional<br />
-igt@kms_universal_plane@universal-plane-pageflip-windowed<br />
-igt@kms_universal_plane@universal-plane-sanity</p>

</body>
</html>

--===============2787162749456066628==--
