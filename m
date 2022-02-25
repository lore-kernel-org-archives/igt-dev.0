Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8367373365467893231=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jeevan B" <jeevan.b@intel.com>
Date: Fri, 25 Feb 2022 05:48:46 -0000
Message-ID: <164576812685.6271.15119490148688112329@emeril.freedesktop.org>
References: <20220225050853.8349-1-jeevan.b@intel.com>
In-Reply-To: <20220225050853.8349-1-jeevan.b@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgVGlsZSA0?=
 =?utf-8?q?_plane_format_support?=
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

--===============8367373365467893231==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Tile 4 plane format support
URL   : https://patchwork.freedesktop.org/series/100721/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_11285 -> IGTPW_6702
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6702/index.html

Participating hosts (39 -> 40)
------------------------------

  Additional (2): fi-kbl-soraka fi-pnv-d510 
  Missing    (1): fi-bdw-samus 

Known issues
------------

  Here are the changes found in IGTPW_6702 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_fence@basic-busy@bcs0:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][1] ([fdo#109271]) +8 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6702/fi-kbl-soraka/igt@gem_exec_fence@basic-busy@bcs0.html

  * igt@gem_flink_basic@bad-flink:
    - fi-skl-6600u:       NOTRUN -> [FAIL][2] ([i915#4547])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6702/fi-skl-6600u/igt@gem_flink_basic@bad-flink.html

  * igt@gem_huc_copy@huc-copy:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][3] ([fdo#109271] / [i915#2190])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6702/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@basic:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][4] ([fdo#109271] / [i915#4613]) +3 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6702/fi-kbl-soraka/igt@gem_lmem_swapping@basic.html

  * igt@i915_selftest@live@gt_pm:
    - fi-kbl-soraka:      NOTRUN -> [DMESG-FAIL][5] ([i915#1886] / [i915#2291])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6702/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html

  * igt@i915_selftest@live@hangcheck:
    - fi-snb-2600:        [PASS][6] -> [INCOMPLETE][7] ([i915#3921])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11285/fi-snb-2600/igt@i915_selftest@live@hangcheck.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6702/fi-snb-2600/igt@i915_selftest@live@hangcheck.html

  * igt@i915_selftest@live@requests:
    - fi-blb-e6850:       [PASS][8] -> [DMESG-FAIL][9] ([i915#5026])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11285/fi-blb-e6850/igt@i915_selftest@live@requests.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6702/fi-blb-e6850/igt@i915_selftest@live@requests.html
    - fi-pnv-d510:        NOTRUN -> [DMESG-FAIL][10] ([i915#2927] / [i915#4528])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6702/fi-pnv-d510/igt@i915_selftest@live@requests.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][11] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6702/fi-kbl-soraka/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b:
    - fi-cfl-8109u:       [PASS][12] -> [DMESG-WARN][13] ([i915#295]) +11 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11285/fi-cfl-8109u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6702/fi-cfl-8109u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][14] ([fdo#109271] / [i915#533])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6702/fi-kbl-soraka/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html

  * igt@prime_vgem@basic-userptr:
    - fi-pnv-d510:        NOTRUN -> [SKIP][15] ([fdo#109271]) +39 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6702/fi-pnv-d510/igt@prime_vgem@basic-userptr.html

  * igt@runner@aborted:
    - fi-pnv-d510:        NOTRUN -> [FAIL][16] ([fdo#109271] / [i915#2403] / [i915#4312])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6702/fi-pnv-d510/igt@runner@aborted.html
    - fi-blb-e6850:       NOTRUN -> [FAIL][17] ([fdo#109271] / [i915#2403] / [i915#2426] / [i915#4312])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6702/fi-blb-e6850/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-modeset@a-edp1:
    - {bat-adlp-6}:       [DMESG-WARN][18] ([i915#3576]) -> [PASS][19] +1 similar issue
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11285/bat-adlp-6/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6702/bat-adlp-6/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1886]: https://gitlab.freedesktop.org/drm/intel/issues/1886
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2291]: https://gitlab.freedesktop.org/drm/intel/issues/2291
  [i915#2403]: https://gitlab.freedesktop.org/drm/intel/issues/2403
  [i915#2426]: https://gitlab.freedesktop.org/drm/intel/issues/2426
  [i915#2927]: https://gitlab.freedesktop.org/drm/intel/issues/2927
  [i915#295]: https://gitlab.freedesktop.org/drm/intel/issues/295
  [i915#3576]: https://gitlab.freedesktop.org/drm/intel/issues/3576
  [i915#3921]: https://gitlab.freedesktop.org/drm/intel/issues/3921
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4528]: https://gitlab.freedesktop.org/drm/intel/issues/4528
  [i915#4547]: https://gitlab.freedesktop.org/drm/intel/issues/4547
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#5026]: https://gitlab.freedesktop.org/drm/intel/issues/5026
  [i915#5068]: https://gitlab.freedesktop.org/drm/intel/issues/5068
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6357 -> IGTPW_6702

  CI-20190529: 20190529
  CI_DRM_11285: 937927c7022766ecf991e0071ae055412fb3805f @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6702: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6702/index.html
  IGT_6357: 6546304ecf053b9c5ec278ee3c210d2c6d50a3a6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git



== Testlist changes ==

+igt@kms_big_fb@4-tiled-8bpp-rotate-0
+igt@kms_big_fb@4-tiled-8bpp-rotate-90
+igt@kms_big_fb@4-tiled-8bpp-rotate-180
+igt@kms_big_fb@4-tiled-8bpp-rotate-270
+igt@kms_big_fb@4-tiled-16bpp-rotate-0
+igt@kms_big_fb@4-tiled-16bpp-rotate-90
+igt@kms_big_fb@4-tiled-16bpp-rotate-180
+igt@kms_big_fb@4-tiled-16bpp-rotate-270
+igt@kms_big_fb@4-tiled-32bpp-rotate-0
+igt@kms_big_fb@4-tiled-32bpp-rotate-90
+igt@kms_big_fb@4-tiled-32bpp-rotate-180
+igt@kms_big_fb@4-tiled-32bpp-rotate-270
+igt@kms_big_fb@4-tiled-64bpp-rotate-0
+igt@kms_big_fb@4-tiled-64bpp-rotate-90
+igt@kms_big_fb@4-tiled-64bpp-rotate-180
+igt@kms_big_fb@4-tiled-64bpp-rotate-270
+igt@kms_big_fb@4-tiled-addfb
+igt@kms_big_fb@4-tiled-addfb-size-offset-overflow
+igt@kms_big_fb@4-tiled-addfb-size-overflow
+igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0
+igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip
+igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip
+igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip
+igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180
+igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip
+igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip
+igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip
+igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0
+igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip
+igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip
+igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip
+igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180
+igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip
+igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip
+igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip
+igt@kms_draw_crc@draw-method-rgb565-blt-4tiled
+igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-4tiled
+igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-4tiled
+igt@kms_draw_crc@draw-method-rgb565-mmap-wc-4tiled
+igt@kms_draw_crc@draw-method-rgb565-pwrite-4tiled
+igt@kms_draw_crc@draw-method-rgb565-render-4tiled
+igt@kms_draw_crc@draw-method-xrgb8888-blt-4tiled
+igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-4tiled
+igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-4tiled
+igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-4tiled
+igt@kms_draw_crc@draw-method-xrgb8888-pwrite-4tiled
+igt@kms_draw_crc@draw-method-xrgb8888-render-4tiled
+igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled
+igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-4tiled
+igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-4tiled
+igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-4tiled
+igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-4tiled
+igt@kms_draw_crc@draw-method-xrgb2101010-render-4tiled
+igt@kms_plane_lowres@pipe-a-tiling-4
+igt@kms_plane_lowres@pipe-b-tiling-4
+igt@kms_plane_lowres@pipe-c-tiling-4
+igt@kms_plane_lowres@pipe-d-tiling-4
+igt@kms_plane_lowres@pipe-e-tiling-4
+igt@kms_plane_lowres@pipe-f-tiling-4
+igt@kms_plane_multiple@atomic-pipe-a-tiling-4
+igt@kms_plane_multiple@atomic-pipe-b-tiling-4
+igt@kms_plane_multiple@atomic-pipe-c-tiling-4
+igt@kms_plane_multiple@atomic-pipe-d-tiling-4
+igt@kms_plane_multiple@atomic-pipe-e-tiling-4
+igt@kms_plane_multiple@atomic-pipe-f-tiling-4
+igt@kms_rotation_crc@primary-4-tiled-reflect-x-0
+igt@kms_rotation_crc@primary-4-tiled-reflect-x-180

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6702/index.html

--===============8367373365467893231==
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
<tr><td><b>Series:</b></td><td>Tile 4 plane format support</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/100721/">https://patchwork.freedesktop.org/series/100721/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6702/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6702/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11285 -&gt; IGTPW_6702</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6702/index.html</p>
<h2>Participating hosts (39 -&gt; 40)</h2>
<p>Additional (2): fi-kbl-soraka fi-pnv-d510 <br />
  Missing    (1): fi-bdw-samus </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6702 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_fence@basic-busy@bcs0:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6702/fi-kbl-soraka/igt@gem_exec_fence@basic-busy@bcs0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_flink_basic@bad-flink:</p>
<ul>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6702/fi-skl-6600u/igt@gem_flink_basic@bad-flink.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4547">i915#4547</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6702/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6702/fi-kbl-soraka/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6702/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1886">i915#1886</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2291">i915#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-snb-2600:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11285/fi-snb-2600/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6702/fi-snb-2600/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3921">i915#3921</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>
<p>fi-blb-e6850:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11285/fi-blb-e6850/igt@i915_selftest@live@requests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6702/fi-blb-e6850/igt@i915_selftest@live@requests.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5026">i915#5026</a>)</p>
</li>
<li>
<p>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6702/fi-pnv-d510/igt@i915_selftest@live@requests.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2927">i915#2927</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4528">i915#4528</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6702/fi-kbl-soraka/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11285/fi-cfl-8109u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6702/fi-cfl-8109u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/295">i915#295</a>) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6702/fi-kbl-soraka/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-userptr:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6702/fi-pnv-d510/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +39 similar issues</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6702/fi-pnv-d510/igt@runner@aborted.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2403">i915#2403</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</p>
</li>
<li>
<p>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6702/fi-blb-e6850/igt@runner@aborted.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2403">i915#2403</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-modeset@a-edp1:<ul>
<li>{bat-adlp-6}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11285/bat-adlp-6/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3576">i915#3576</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6702/bat-adlp-6/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html">PASS</a> +1 similar issue</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6357 -&gt; IGTPW_6702</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11285: 937927c7022766ecf991e0071ae055412fb3805f @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6702: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6702/index.html<br />
  IGT_6357: 6546304ecf053b9c5ec278ee3c210d2c6d50a3a6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<p>== Testlist changes ==</p>
<p>+igt@kms_big_fb@4-tiled-8bpp-rotate-0<br />
+igt@kms_big_fb@4-tiled-8bpp-rotate-90<br />
+igt@kms_big_fb@4-tiled-8bpp-rotate-180<br />
+igt@kms_big_fb@4-tiled-8bpp-rotate-270<br />
+igt@kms_big_fb@4-tiled-16bpp-rotate-0<br />
+igt@kms_big_fb@4-tiled-16bpp-rotate-90<br />
+igt@kms_big_fb@4-tiled-16bpp-rotate-180<br />
+igt@kms_big_fb@4-tiled-16bpp-rotate-270<br />
+igt@kms_big_fb@4-tiled-32bpp-rotate-0<br />
+igt@kms_big_fb@4-tiled-32bpp-rotate-90<br />
+igt@kms_big_fb@4-tiled-32bpp-rotate-180<br />
+igt@kms_big_fb@4-tiled-32bpp-rotate-270<br />
+igt@kms_big_fb@4-tiled-64bpp-rotate-0<br />
+igt@kms_big_fb@4-tiled-64bpp-rotate-90<br />
+igt@kms_big_fb@4-tiled-64bpp-rotate-180<br />
+igt@kms_big_fb@4-tiled-64bpp-rotate-270<br />
+igt@kms_big_fb@4-tiled-addfb<br />
+igt@kms_big_fb@4-tiled-addfb-size-offset-overflow<br />
+igt@kms_big_fb@4-tiled-addfb-size-overflow<br />
+igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0<br />
+igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip<br />
+igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip<br />
+igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip<br />
+igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180<br />
+igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip<br />
+igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip<br />
+igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip<br />
+igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0<br />
+igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip<br />
+igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip<br />
+igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip<br />
+igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180<br />
+igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip<br />
+igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip<br />
+igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip<br />
+igt@kms_draw_crc@draw-method-rgb565-blt-4tiled<br />
+igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-4tiled<br />
+igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-4tiled<br />
+igt@kms_draw_crc@draw-method-rgb565-mmap-wc-4tiled<br />
+igt@kms_draw_crc@draw-method-rgb565-pwrite-4tiled<br />
+igt@kms_draw_crc@draw-method-rgb565-render-4tiled<br />
+igt@kms_draw_crc@draw-method-xrgb8888-blt-4tiled<br />
+igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-4tiled<br />
+igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-4tiled<br />
+igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-4tiled<br />
+igt@kms_draw_crc@draw-method-xrgb8888-pwrite-4tiled<br />
+igt@kms_draw_crc@draw-method-xrgb8888-render-4tiled<br />
+igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled<br />
+igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-4tiled<br />
+igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-4tiled<br />
+igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-4tiled<br />
+igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-4tiled<br />
+igt@kms_draw_crc@draw-method-xrgb2101010-render-4tiled<br />
+igt@kms_plane_lowres@pipe-a-tiling-4<br />
+igt@kms_plane_lowres@pipe-b-tiling-4<br />
+igt@kms_plane_lowres@pipe-c-tiling-4<br />
+igt@kms_plane_lowres@pipe-d-tiling-4<br />
+igt@kms_plane_lowres@pipe-e-tiling-4<br />
+igt@kms_plane_lowres@pipe-f-tiling-4<br />
+igt@kms_plane_multiple@atomic-pipe-a-tiling-4<br />
+igt@kms_plane_multiple@atomic-pipe-b-tiling-4<br />
+igt@kms_plane_multiple@atomic-pipe-c-tiling-4<br />
+igt@kms_plane_multiple@atomic-pipe-d-tiling-4<br />
+igt@kms_plane_multiple@atomic-pipe-e-tiling-4<br />
+igt@kms_plane_multiple@atomic-pipe-f-tiling-4<br />
+igt@kms_rotation_crc@primary-4-tiled-reflect-x-0<br />
+igt@kms_rotation_crc@primary-4-tiled-reflect-x-180</p>

</body>
</html>

--===============8367373365467893231==--
