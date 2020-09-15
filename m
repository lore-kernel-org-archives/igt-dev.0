Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 15 Sep 2020 00:32:42 -0000
Message-ID: <160012996270.30602.71928901396628045@emeril.freedesktop.org>
References: <20200904130607.133724-1-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20200904130607.133724-1-tvrtko.ursulin@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgUGVyIGNs?=
 =?utf-8?q?ient_engine_busyness_for_intel=5Fgpu=5Ftop_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============2074553847=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============2074553847==
Content-Type: multipart/alternative;
 boundary="===============4073026723194893658=="

--===============4073026723194893658==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Per client engine busyness for intel_gpu_top (rev2)
URL   : https://patchwork.freedesktop.org/series/81338/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9007_full -> IGTPW_4980_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4980/index.html

Known issues
------------

  Here are the changes found in IGTPW_4980_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_whisper@basic-fds-all:
    - shard-glk:          [PASS][1] -> [DMESG-WARN][2] ([i915#118] / [i915#95])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9007/shard-glk9/igt@gem_exec_whisper@basic-fds-all.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4980/shard-glk7/igt@gem_exec_whisper@basic-fds-all.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglb:         [PASS][3] -> [SKIP][4] ([i915#2190])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9007/shard-tglb5/igt@gem_huc_copy@huc-copy.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4980/shard-tglb6/igt@gem_huc_copy@huc-copy.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][5] -> [FAIL][6] ([i915#454])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9007/shard-iclb1/igt@i915_pm_dc@dc6-psr.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4980/shard-iclb6/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-apl:          [PASS][7] -> [DMESG-WARN][8] ([i915#1635] / [i915#1982]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9007/shard-apl8/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4980/shard-apl7/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-hsw:          [PASS][9] -> [FAIL][10] ([i915#96]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9007/shard-hsw6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4980/shard-hsw8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - shard-hsw:          [PASS][11] -> [FAIL][12] ([i915#2370])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9007/shard-hsw6/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4980/shard-hsw1/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-untiled:
    - shard-glk:          [PASS][13] -> [DMESG-WARN][14] ([i915#1982]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9007/shard-glk6/igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-untiled.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4980/shard-glk9/igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-untiled.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-kbl:          [PASS][15] -> [DMESG-WARN][16] ([i915#180]) +8 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9007/shard-kbl6/igt@kms_hdr@bpc-switch-suspend.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4980/shard-kbl1/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [PASS][17] -> [SKIP][18] ([fdo#109441]) +2 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9007/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4980/shard-iclb7/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_vblank@pipe-c-query-busy:
    - shard-tglb:         [PASS][19] -> [DMESG-WARN][20] ([i915#1982])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9007/shard-tglb2/igt@kms_vblank@pipe-c-query-busy.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4980/shard-tglb5/igt@kms_vblank@pipe-c-query-busy.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@legacy-engines-mixed-process@blt:
    - shard-apl:          [FAIL][21] ([i915#1635] / [i915#2374]) -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9007/shard-apl1/igt@gem_ctx_persistence@legacy-engines-mixed-process@blt.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4980/shard-apl3/igt@gem_ctx_persistence@legacy-engines-mixed-process@blt.html

  * igt@gem_exec_whisper@basic-fds-forked:
    - shard-glk:          [DMESG-WARN][23] ([i915#118] / [i915#95]) -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9007/shard-glk1/igt@gem_exec_whisper@basic-fds-forked.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4980/shard-glk8/igt@gem_exec_whisper@basic-fds-forked.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-apl:          [FAIL][25] ([i915#1635] / [i915#644]) -> [PASS][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9007/shard-apl7/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4980/shard-apl2/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-hsw:          [WARN][27] ([i915#1519]) -> [PASS][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9007/shard-hsw8/igt@i915_pm_rc6_residency@rc6-fence.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4980/shard-hsw4/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@kms_color@pipe-b-ctm-max:
    - shard-apl:          [FAIL][29] ([i915#1635] / [i915#168]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9007/shard-apl7/igt@kms_color@pipe-b-ctm-max.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4980/shard-apl2/igt@kms_color@pipe-b-ctm-max.html
    - shard-kbl:          [FAIL][31] ([i915#168]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9007/shard-kbl3/igt@kms_color@pipe-b-ctm-max.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4980/shard-kbl2/igt@kms_color@pipe-b-ctm-max.html

  * igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions:
    - shard-kbl:          [DMESG-WARN][33] ([i915#1982]) -> [PASS][34] +3 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9007/shard-kbl4/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4980/shard-kbl1/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions.html
    - shard-tglb:         [DMESG-WARN][35] ([i915#1982]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9007/shard-tglb5/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4980/shard-tglb3/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-untiled:
    - shard-apl:          [DMESG-WARN][37] ([i915#1635] / [i915#1982]) -> [PASS][38] +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9007/shard-apl4/igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-untiled.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4980/shard-apl4/igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-untiled.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render:
    - shard-kbl:          [FAIL][39] ([i915#49]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9007/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4980/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html
    - shard-apl:          [FAIL][41] ([i915#1635] / [i915#49]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9007/shard-apl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4980/shard-apl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [DMESG-WARN][43] ([i915#180]) -> [PASS][44] +3 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9007/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4980/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:
    - shard-iclb:         [DMESG-WARN][45] ([i915#1982]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9007/shard-iclb3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4980/shard-iclb8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html

  * igt@kms_psr@psr2_sprite_blt:
    - shard-iclb:         [SKIP][47] ([fdo#109441]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9007/shard-iclb6/igt@kms_psr@psr2_sprite_blt.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4980/shard-iclb2/igt@kms_psr@psr2_sprite_blt.html

  * igt@perf@polling-small-buf:
    - shard-iclb:         [FAIL][49] ([i915#1722]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9007/shard-iclb7/igt@perf@polling-small-buf.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4980/shard-iclb2/igt@perf@polling-small-buf.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-tglb:         [DMESG-WARN][51] ([i915#2411]) -> [SKIP][52] ([i915#1904])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9007/shard-tglb1/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4980/shard-tglb6/igt@i915_pm_dc@dc3co-vpb-simulation.html

  
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1519]: https://gitlab.freedesktop.org/drm/intel/issues/1519
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#168]: https://gitlab.freedesktop.org/drm/intel/issues/168
  [i915#1722]: https://gitlab.freedesktop.org/drm/intel/issues/1722
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1904]: https://gitlab.freedesktop.org/drm/intel/issues/1904
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2370]: https://gitlab.freedesktop.org/drm/intel/issues/2370
  [i915#2374]: https://gitlab.freedesktop.org/drm/intel/issues/2374
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [i915#96]: https://gitlab.freedesktop.org/drm/intel/issues/96


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5782 -> IGTPW_4980
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_9007: 30b3e38bd6d569451279af2767b620d0ef88665d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4980: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4980/index.html
  IGT_5782: ccfb27dab0f06c009d332053548920cb740e4258 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4980/index.html

--===============4073026723194893658==
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
<tr><td><b>Series:</b></td><td>Per client engine busyness for intel_gpu_top (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/81338/">https://patchwork.freedesktop.org/series/81338/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4980/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4980/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9007_full -&gt; IGTPW_4980_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4980/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_4980_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_whisper@basic-fds-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9007/shard-glk9/igt@gem_exec_whisper@basic-fds-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4980/shard-glk7/igt@gem_exec_whisper@basic-fds-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9007/shard-tglb5/igt@gem_huc_copy@huc-copy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4980/shard-tglb6/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9007/shard-iclb1/igt@i915_pm_dc@dc6-psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4980/shard-iclb6/igt@i915_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-180:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9007/shard-apl8/igt@kms_big_fb@linear-64bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4980/shard-apl7/igt@kms_big_fb@linear-64bpp-rotate-180.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9007/shard-hsw6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4980/shard-hsw8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/96">i915#96</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-toggle:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9007/shard-hsw6/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4980/shard-hsw1/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2370">i915#2370</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-untiled:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9007/shard-glk6/igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-untiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4980/shard-glk9/igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-untiled.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9007/shard-kbl6/igt@kms_hdr@bpc-switch-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4980/shard-kbl1/igt@kms_hdr@bpc-switch-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9007/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4980/shard-iclb7/igt@kms_psr@psr2_primary_mmap_cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-query-busy:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9007/shard-tglb2/igt@kms_vblank@pipe-c-query-busy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4980/shard-tglb5/igt@kms_vblank@pipe-c-query-busy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-mixed-process@blt:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9007/shard-apl1/igt@gem_ctx_persistence@legacy-engines-mixed-process@blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2374">i915#2374</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4980/shard-apl3/igt@gem_ctx_persistence@legacy-engines-mixed-process@blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-fds-forked:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9007/shard-glk1/igt@gem_exec_whisper@basic-fds-forked.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4980/shard-glk8/igt@gem_exec_whisper@basic-fds-forked.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ppgtt@flink-and-close-vma-leak:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9007/shard-apl7/igt@gem_ppgtt@flink-and-close-vma-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/644">i915#644</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4980/shard-apl2/igt@gem_ppgtt@flink-and-close-vma-leak.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9007/shard-hsw8/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1519">i915#1519</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4980/shard-hsw4/igt@i915_pm_rc6_residency@rc6-fence.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-ctm-max:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9007/shard-apl7/igt@kms_color@pipe-b-ctm-max.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/168">i915#168</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4980/shard-apl2/igt@kms_color@pipe-b-ctm-max.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9007/shard-kbl3/igt@kms_color@pipe-b-ctm-max.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/168">i915#168</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4980/shard-kbl2/igt@kms_color@pipe-b-ctm-max.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9007/shard-kbl4/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4980/shard-kbl1/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions.html">PASS</a> +3 similar issues</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9007/shard-tglb5/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4980/shard-tglb3/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-untiled:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9007/shard-apl4/igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-untiled.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4980/shard-apl4/igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-untiled.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9007/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/49">i915#49</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4980/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9007/shard-apl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/49">i915#49</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4980/shard-apl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9007/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4980/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-suspend.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9007/shard-iclb3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4980/shard-iclb8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_blt:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9007/shard-iclb6/igt@kms_psr@psr2_sprite_blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4980/shard-iclb2/igt@kms_psr@psr2_sprite_blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@polling-small-buf:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9007/shard-iclb7/igt@perf@polling-small-buf.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1722">i915#1722</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4980/shard-iclb2/igt@perf@polling-small-buf.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_pm_dc@dc3co-vpb-simulation:<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9007/shard-tglb1/igt@i915_pm_dc@dc3co-vpb-simulation.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4980/shard-tglb6/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1904">i915#1904</a>)</li>
</ul>
</li>
</ul>
<h2>Participating hosts (11 -&gt; 8)</h2>
<p>Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5782 -&gt; IGTPW_4980</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9007: 30b3e38bd6d569451279af2767b620d0ef88665d @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_4980: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4980/index.html<br />
  IGT_5782: ccfb27dab0f06c009d332053548920cb740e4258 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============4073026723194893658==--

--===============2074553847==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============2074553847==--
