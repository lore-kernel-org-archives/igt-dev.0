Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============1672252073703833998=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nidhi Gupta" <nidhi1.gupta@intel.com>
Date: Wed, 10 Aug 2022 14:54:35 -0000
Message-ID: <166014327500.12354.10551510155547456318@emeril.freedesktop.org>
References: <20220804034029.17355-1-nidhi1.gupta@intel.com>
In-Reply-To: <20220804034029.17355-1-nidhi1.gupta@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/kms=5Fdraw=5Fcrc=3A_Test_Cleanup_=28rev7=29?=
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

--===============1672252073703833998==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915/kms_draw_crc: Test Cleanup (rev7)
URL   : https://patchwork.freedesktop.org/series/106898/
State : success

== Summary ==

CI Bug Log - changes from IGT_6620 -> IGTPW_7632
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7632/index.html

Participating hosts (30 -> 29)
------------------------------

  Additional (1): fi-cfl-8109u 
  Missing    (2): fi-ctg-p8600 fi-hsw-4200u 

Known issues
------------

  Here are the changes found in IGTPW_7632 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_huc_copy@huc-copy:
    - fi-cfl-8109u:       NOTRUN -> [SKIP][1] ([fdo#109271] / [i915#2190])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7632/fi-cfl-8109u/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@basic:
    - fi-apl-guc:         NOTRUN -> [SKIP][2] ([fdo#109271] / [i915#4613]) +3 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7632/fi-apl-guc/igt@gem_lmem_swapping@basic.html

  * igt@gem_lmem_swapping@verify-random:
    - fi-cfl-8109u:       NOTRUN -> [SKIP][3] ([fdo#109271] / [i915#4613]) +3 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7632/fi-cfl-8109u/igt@gem_lmem_swapping@verify-random.html

  * igt@kms_chamelium@dp-crc-fast:
    - fi-cfl-8109u:       NOTRUN -> [SKIP][4] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7632/fi-cfl-8109u/igt@kms_chamelium@dp-crc-fast.html

  * igt@kms_chamelium@hdmi-crc-fast:
    - fi-apl-guc:         NOTRUN -> [SKIP][5] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7632/fi-apl-guc/igt@kms_chamelium@hdmi-crc-fast.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size:
    - fi-bsw-kefka:       [PASS][6] -> [FAIL][7] ([i915#6298])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6620/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7632/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1:
    - fi-kbl-soraka:      [PASS][8] -> [FAIL][9] ([i915#2122])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6620/fi-kbl-soraka/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7632/fi-kbl-soraka/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html

  * igt@kms_force_connector_basic@force-connector-state:
    - fi-apl-guc:         NOTRUN -> [SKIP][10] ([fdo#109271]) +11 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7632/fi-apl-guc/igt@kms_force_connector_basic@force-connector-state.html

  * igt@prime_vgem@basic-userptr:
    - fi-cfl-8109u:       NOTRUN -> [SKIP][11] ([fdo#109271]) +10 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7632/fi-cfl-8109u/igt@prime_vgem@basic-userptr.html

  
#### Possible fixes ####

  * igt@gem_render_tiled_blits@basic:
    - fi-apl-guc:         [INCOMPLETE][12] -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6620/fi-apl-guc/igt@gem_render_tiled_blits@basic.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7632/fi-apl-guc/igt@gem_render_tiled_blits@basic.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#6298]: https://gitlab.freedesktop.org/drm/intel/issues/6298


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6620 -> IGTPW_7632

  CI-20190529: 20190529
  CI_DRM_11981: 6f207fdd93a13166b4adfe2f3a2972a9c632e757 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7632: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7632/index.html
  IGT_6620: 90549cfba1606b695fe60f78ef87b7d54586eab7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@kms_draw_crc@draw-method
-igt@kms_draw_crc@draw-method-rgb565-blt-4tiled
-igt@kms_draw_crc@draw-method-rgb565-blt-untiled
-igt@kms_draw_crc@draw-method-rgb565-blt-xtiled
-igt@kms_draw_crc@draw-method-rgb565-blt-ytiled
-igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-4tiled
-igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-untiled
-igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-xtiled
-igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-ytiled
-igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-4tiled
-igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-untiled
-igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled
-igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled
-igt@kms_draw_crc@draw-method-rgb565-mmap-wc-4tiled
-igt@kms_draw_crc@draw-method-rgb565-mmap-wc-untiled
-igt@kms_draw_crc@draw-method-rgb565-mmap-wc-xtiled
-igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled
-igt@kms_draw_crc@draw-method-rgb565-pwrite-4tiled
-igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled
-igt@kms_draw_crc@draw-method-rgb565-pwrite-xtiled
-igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled
-igt@kms_draw_crc@draw-method-rgb565-render-4tiled
-igt@kms_draw_crc@draw-method-rgb565-render-untiled
-igt@kms_draw_crc@draw-method-rgb565-render-xtiled
-igt@kms_draw_crc@draw-method-rgb565-render-ytiled
-igt@kms_draw_crc@draw-method-xrgb8888-blt-4tiled
-igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled
-igt@kms_draw_crc@draw-method-xrgb8888-blt-xtiled
-igt@kms_draw_crc@draw-method-xrgb8888-blt-ytiled
-igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-4tiled
-igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled
-igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-xtiled
-igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-ytiled
-igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-4tiled
-igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled
-igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-xtiled
-igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-ytiled
-igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-4tiled
-igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled
-igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-xtiled
-igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-ytiled
-igt@kms_draw_crc@draw-method-xrgb8888-pwrite-4tiled
-igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled
-igt@kms_draw_crc@draw-method-xrgb8888-pwrite-xtiled
-igt@kms_draw_crc@draw-method-xrgb8888-pwrite-ytiled
-igt@kms_draw_crc@draw-method-xrgb8888-render-4tiled
-igt@kms_draw_crc@draw-method-xrgb8888-render-untiled
-igt@kms_draw_crc@draw-method-xrgb8888-render-xtiled
-igt@kms_draw_crc@draw-method-xrgb8888-render-ytiled
-igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled
-igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled
-igt@kms_draw_crc@draw-method-xrgb2101010-blt-xtiled
-igt@kms_draw_crc@draw-method-xrgb2101010-blt-ytiled
-igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-4tiled
-igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-untiled
-igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-xtiled
-igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-ytiled
-igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-4tiled
-igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-untiled
-igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled
-igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-ytiled
-igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-4tiled
-igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-untiled
-igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-xtiled
-igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-ytiled
-igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-4tiled
-igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-untiled
-igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-xtiled
-igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-ytiled
-igt@kms_draw_crc@draw-method-xrgb2101010-render-4tiled
-igt@kms_draw_crc@draw-method-xrgb2101010-render-untiled
-igt@kms_draw_crc@draw-method-xrgb2101010-render-xtiled
-igt@kms_draw_crc@draw-method-xrgb2101010-render-ytiled

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7632/index.html

--===============1672252073703833998==
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
<tr><td><b>Series:</b></td><td>tests/i915/kms_draw_crc: Test Cleanup (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/106898/">https://patchwork.freedesktop.org/series/106898/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7632/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7632/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6620 -&gt; IGTPW_7632</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7632/index.html</p>
<h2>Participating hosts (30 -&gt; 29)</h2>
<p>Additional (1): fi-cfl-8109u <br />
  Missing    (2): fi-ctg-p8600 fi-hsw-4200u </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7632 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7632/fi-cfl-8109u/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7632/fi-apl-guc/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7632/fi-cfl-8109u/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-fast:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7632/fi-cfl-8109u/igt@kms_chamelium@dp-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-crc-fast:</p>
<ul>
<li>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7632/fi-apl-guc/igt@kms_chamelium@hdmi-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6620/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7632/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6298">i915#6298</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1:</p>
<ul>
<li>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6620/fi-kbl-soraka/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7632/fi-kbl-soraka/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2122">i915#2122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7632/fi-apl-guc/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-userptr:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7632/fi-cfl-8109u/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +10 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@gem_render_tiled_blits@basic:<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6620/fi-apl-guc/igt@gem_render_tiled_blits@basic.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7632/fi-apl-guc/igt@gem_render_tiled_blits@basic.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6620 -&gt; IGTPW_7632</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11981: 6f207fdd93a13166b4adfe2f3a2972a9c632e757 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7632: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7632/index.html<br />
  IGT_6620: 90549cfba1606b695fe60f78ef87b7d54586eab7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@kms_draw_crc@draw-method<br />
-igt@kms_draw_crc@draw-method-rgb565-blt-4tiled<br />
-igt@kms_draw_crc@draw-method-rgb565-blt-untiled<br />
-igt@kms_draw_crc@draw-method-rgb565-blt-xtiled<br />
-igt@kms_draw_crc@draw-method-rgb565-blt-ytiled<br />
-igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-4tiled<br />
-igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-untiled<br />
-igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-xtiled<br />
-igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-ytiled<br />
-igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-4tiled<br />
-igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-untiled<br />
-igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled<br />
-igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled<br />
-igt@kms_draw_crc@draw-method-rgb565-mmap-wc-4tiled<br />
-igt@kms_draw_crc@draw-method-rgb565-mmap-wc-untiled<br />
-igt@kms_draw_crc@draw-method-rgb565-mmap-wc-xtiled<br />
-igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled<br />
-igt@kms_draw_crc@draw-method-rgb565-pwrite-4tiled<br />
-igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled<br />
-igt@kms_draw_crc@draw-method-rgb565-pwrite-xtiled<br />
-igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled<br />
-igt@kms_draw_crc@draw-method-rgb565-render-4tiled<br />
-igt@kms_draw_crc@draw-method-rgb565-render-untiled<br />
-igt@kms_draw_crc@draw-method-rgb565-render-xtiled<br />
-igt@kms_draw_crc@draw-method-rgb565-render-ytiled<br />
-igt@kms_draw_crc@draw-method-xrgb8888-blt-4tiled<br />
-igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled<br />
-igt@kms_draw_crc@draw-method-xrgb8888-blt-xtiled<br />
-igt@kms_draw_crc@draw-method-xrgb8888-blt-ytiled<br />
-igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-4tiled<br />
-igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled<br />
-igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-xtiled<br />
-igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-ytiled<br />
-igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-4tiled<br />
-igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled<br />
-igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-xtiled<br />
-igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-ytiled<br />
-igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-4tiled<br />
-igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled<br />
-igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-xtiled<br />
-igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-ytiled<br />
-igt@kms_draw_crc@draw-method-xrgb8888-pwrite-4tiled<br />
-igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled<br />
-igt@kms_draw_crc@draw-method-xrgb8888-pwrite-xtiled<br />
-igt@kms_draw_crc@draw-method-xrgb8888-pwrite-ytiled<br />
-igt@kms_draw_crc@draw-method-xrgb8888-render-4tiled<br />
-igt@kms_draw_crc@draw-method-xrgb8888-render-untiled<br />
-igt@kms_draw_crc@draw-method-xrgb8888-render-xtiled<br />
-igt@kms_draw_crc@draw-method-xrgb8888-render-ytiled<br />
-igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled<br />
-igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled<br />
-igt@kms_draw_crc@draw-method-xrgb2101010-blt-xtiled<br />
-igt@kms_draw_crc@draw-method-xrgb2101010-blt-ytiled<br />
-igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-4tiled<br />
-igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-untiled<br />
-igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-xtiled<br />
-igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-ytiled<br />
-igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-4tiled<br />
-igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-untiled<br />
-igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled<br />
-igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-ytiled<br />
-igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-4tiled<br />
-igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-untiled<br />
-igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-xtiled<br />
-igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-ytiled<br />
-igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-4tiled<br />
-igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-untiled<br />
-igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-xtiled<br />
-igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-ytiled<br />
-igt@kms_draw_crc@draw-method-xrgb2101010-render-4tiled<br />
-igt@kms_draw_crc@draw-method-xrgb2101010-render-untiled<br />
-igt@kms_draw_crc@draw-method-xrgb2101010-render-xtiled<br />
-igt@kms_draw_crc@draw-method-xrgb2101010-render-ytiled</p>

</body>
</html>

--===============1672252073703833998==--
