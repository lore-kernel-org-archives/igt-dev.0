Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 12 Aug 2020 11:38:21 -0000
Message-ID: <159723230191.25466.13539167601890821254@emeril.freedesktop.org>
References: <20200812090548.4973-1-adam.miszczak@linux.intel.com>
In-Reply-To: <20200812090548.4973-1-adam.miszczak@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgbGliL2k5?=
 =?utf-8?q?15=3A_Add_DG1_platform_definition?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1018444798=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1018444798==
Content-Type: multipart/alternative;
 boundary="===============5486516757330477161=="

--===============5486516757330477161==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/i915: Add DG1 platform definition
URL   : https://patchwork.freedesktop.org/series/80559/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8874_full -> IGTPW_4877_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4877/index.html

Known issues
------------

  Here are the changes found in IGTPW_4877_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@preservation-s3@vecs0:
    - shard-kbl:          [PASS][1] -> [DMESG-WARN][2] ([i915#180])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8874/shard-kbl4/igt@gem_ctx_isolation@preservation-s3@vecs0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4877/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@vecs0.html

  * igt@gem_mmap_wc@write-prefaulted:
    - shard-snb:          [PASS][3] -> [TIMEOUT][4] ([i915#1958]) +3 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8874/shard-snb5/igt@gem_mmap_wc@write-prefaulted.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4877/shard-snb4/igt@gem_mmap_wc@write-prefaulted.html
    - shard-hsw:          [PASS][5] -> [TIMEOUT][6] ([i915#1958]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8874/shard-hsw8/igt@gem_mmap_wc@write-prefaulted.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4877/shard-hsw4/igt@gem_mmap_wc@write-prefaulted.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-apl:          [PASS][7] -> [DMESG-WARN][8] ([i915#1635] / [i915#1982])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8874/shard-apl4/igt@i915_module_load@reload-with-fault-injection.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4877/shard-apl1/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_suspend@forcewake:
    - shard-kbl:          [PASS][9] -> [INCOMPLETE][10] ([i915#155] / [i915#636])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8874/shard-kbl6/igt@i915_suspend@forcewake.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4877/shard-kbl1/igt@i915_suspend@forcewake.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-0:
    - shard-glk:          [PASS][11] -> [DMESG-FAIL][12] ([i915#118] / [i915#95])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8874/shard-glk5/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4877/shard-glk8/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html

  * igt@kms_flip@wf_vblank-ts-check@a-edp1:
    - shard-tglb:         [PASS][13] -> [DMESG-WARN][14] ([i915#1982]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8874/shard-tglb8/igt@kms_flip@wf_vblank-ts-check@a-edp1.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4877/shard-tglb7/igt@kms_flip@wf_vblank-ts-check@a-edp1.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [PASS][15] -> [SKIP][16] ([i915#433])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8874/shard-tglb1/igt@kms_hdmi_inject@inject-audio.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4877/shard-tglb7/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_psr@psr2_basic:
    - shard-iclb:         [PASS][17] -> [SKIP][18] ([fdo#109441])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8874/shard-iclb2/igt@kms_psr@psr2_basic.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4877/shard-iclb3/igt@kms_psr@psr2_basic.html

  * igt@perf@blocking-parameterized:
    - shard-iclb:         [PASS][19] -> [FAIL][20] ([i915#1542])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8874/shard-iclb7/igt@perf@blocking-parameterized.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4877/shard-iclb2/igt@perf@blocking-parameterized.html

  * igt@prime_busy@after@vecs0:
    - shard-hsw:          [PASS][21] -> [FAIL][22] ([i915#2258]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8874/shard-hsw1/igt@prime_busy@after@vecs0.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4877/shard-hsw2/igt@prime_busy@after@vecs0.html

  
#### Possible fixes ####

  * igt@gem_exec_balancer@nop:
    - shard-iclb:         [INCOMPLETE][23] ([i915#2268]) -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8874/shard-iclb2/igt@gem_exec_balancer@nop.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4877/shard-iclb4/igt@gem_exec_balancer@nop.html

  * igt@gem_exec_whisper@basic-contexts-forked:
    - shard-glk:          [DMESG-WARN][25] ([i915#118] / [i915#95]) -> [PASS][26] +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8874/shard-glk7/igt@gem_exec_whisper@basic-contexts-forked.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4877/shard-glk3/igt@gem_exec_whisper@basic-contexts-forked.html

  * {igt@gem_mmap_offset@blt-coherency}:
    - shard-apl:          [FAIL][27] ([i915#1635]) -> [PASS][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8874/shard-apl4/igt@gem_mmap_offset@blt-coherency.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4877/shard-apl7/igt@gem_mmap_offset@blt-coherency.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [FAIL][29] ([i915#644]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8874/shard-glk6/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4877/shard-glk8/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][31] ([i915#454]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8874/shard-iclb8/igt@i915_pm_dc@dc6-psr.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4877/shard-iclb8/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_selftest@mock@contexts:
    - shard-apl:          [INCOMPLETE][33] ([i915#1635]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8874/shard-apl2/igt@i915_selftest@mock@contexts.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4877/shard-apl8/igt@i915_selftest@mock@contexts.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-tglb:         [DMESG-WARN][35] ([i915#1982]) -> [PASS][36] +4 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8874/shard-tglb8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4877/shard-tglb1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-untiled:
    - shard-apl:          [DMESG-WARN][37] ([i915#1635] / [i915#1982]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8874/shard-apl8/igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-untiled.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4877/shard-apl7/igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-untiled.html

  * igt@kms_flip@flip-vs-suspend@c-dp1:
    - shard-kbl:          [DMESG-WARN][39] ([i915#180]) -> [PASS][40] +5 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8874/shard-kbl1/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4877/shard-kbl1/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_flip_tiling@flip-changes-tiling-yf:
    - shard-kbl:          [DMESG-WARN][41] ([i915#1982]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8874/shard-kbl7/igt@kms_flip_tiling@flip-changes-tiling-yf.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4877/shard-kbl2/igt@kms_flip_tiling@flip-changes-tiling-yf.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][43] ([fdo#109441]) -> [PASS][44] +4 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8874/shard-iclb6/igt@kms_psr@psr2_sprite_plane_move.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4877/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@perf_pmu@rc6:
    - shard-apl:          [TIMEOUT][45] ([i915#1635] / [i915#1958]) -> [PASS][46] +4 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8874/shard-apl3/igt@perf_pmu@rc6.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4877/shard-apl8/igt@perf_pmu@rc6.html
    - shard-hsw:          [TIMEOUT][47] ([i915#1958]) -> [PASS][48] +3 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8874/shard-hsw1/igt@perf_pmu@rc6.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4877/shard-hsw8/igt@perf_pmu@rc6.html
    - shard-snb:          [TIMEOUT][49] ([i915#1958]) -> [PASS][50] +3 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8874/shard-snb2/igt@perf_pmu@rc6.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4877/shard-snb5/igt@perf_pmu@rc6.html

  * igt@prime_busy@hang@bcs0:
    - shard-hsw:          [FAIL][51] ([i915#2258]) -> [PASS][52] +2 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8874/shard-hsw8/igt@prime_busy@hang@bcs0.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4877/shard-hsw6/igt@prime_busy@hang@bcs0.html

  
#### Warnings ####

  * igt@gem_exec_reloc@basic-concurrent16:
    - shard-apl:          [TIMEOUT][53] ([i915#1635] / [i915#1958]) -> [INCOMPLETE][54] ([i915#1635] / [i915#1958])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8874/shard-apl3/igt@gem_exec_reloc@basic-concurrent16.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4877/shard-apl2/igt@gem_exec_reloc@basic-concurrent16.html

  * igt@kms_ccs@pipe-d-crc-primary-rotation-180:
    - shard-snb:          [SKIP][55] ([fdo#109271]) -> [TIMEOUT][56] ([i915#1958]) +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8874/shard-snb4/igt@kms_ccs@pipe-d-crc-primary-rotation-180.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4877/shard-snb4/igt@kms_ccs@pipe-d-crc-primary-rotation-180.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-kbl:          [TIMEOUT][57] ([i915#1319]) -> [TIMEOUT][58] ([i915#1319] / [i915#1958])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8874/shard-kbl7/igt@kms_content_protection@atomic-dpms.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4877/shard-kbl4/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_flip_tiling@flip-changes-tiling-y:
    - shard-hsw:          [TIMEOUT][59] ([i915#1958]) -> [SKIP][60] ([fdo#109271])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8874/shard-hsw1/igt@kms_flip_tiling@flip-changes-tiling-y.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4877/shard-hsw4/igt@kms_flip_tiling@flip-changes-tiling-y.html
    - shard-snb:          [TIMEOUT][61] ([i915#1958]) -> [SKIP][62] ([fdo#109271])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8874/shard-snb2/igt@kms_flip_tiling@flip-changes-tiling-y.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4877/shard-snb4/igt@kms_flip_tiling@flip-changes-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-hsw:          [SKIP][63] ([fdo#109271]) -> [TIMEOUT][64] ([i915#1958]) +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8874/shard-hsw2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4877/shard-hsw4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2258]: https://gitlab.freedesktop.org/drm/intel/issues/2258
  [i915#2268]: https://gitlab.freedesktop.org/drm/intel/issues/2268
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#636]: https://gitlab.freedesktop.org/drm/intel/issues/636
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5767 -> IGTPW_4877
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8874: 7d3f0451f8e91b593e08dd3f522248004459113d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4877: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4877/index.html
  IGT_5767: 39e9aa1032a4e60f776f34b3ccf4fb728abbfe5c @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4877/index.html

--===============5486516757330477161==
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
<tr><td><b>Series:</b></td><td>lib/i915: Add DG1 platform definition</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/80559/">https://patchwork.freedesktop.org/series/80559/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4877/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4877/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_8874_full -&gt; IGTPW_4877_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4877/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_4877_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@vecs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8874/shard-kbl4/igt@gem_ctx_isolation@preservation-s3@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4877/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@vecs0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-prefaulted:</p>
<ul>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8874/shard-snb5/igt@gem_mmap_wc@write-prefaulted.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4877/shard-snb4/igt@gem_mmap_wc@write-prefaulted.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) +3 similar issues</p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8874/shard-hsw8/igt@gem_mmap_wc@write-prefaulted.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4877/shard-hsw4/igt@gem_mmap_wc@write-prefaulted.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8874/shard-apl4/igt@i915_module_load@reload-with-fault-injection.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4877/shard-apl1/igt@i915_module_load@reload-with-fault-injection.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8874/shard-kbl6/igt@i915_suspend@forcewake.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4877/shard-kbl1/igt@i915_suspend@forcewake.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/636">i915#636</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8874/shard-glk5/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4877/shard-glk8/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8874/shard-tglb8/igt@kms_flip@wf_vblank-ts-check@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4877/shard-tglb7/igt@kms_flip@wf_vblank-ts-check@a-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8874/shard-tglb1/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4877/shard-tglb7/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/433">i915#433</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_basic:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8874/shard-iclb2/igt@kms_psr@psr2_basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4877/shard-iclb3/igt@kms_psr@psr2_basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@blocking-parameterized:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8874/shard-iclb7/igt@perf@blocking-parameterized.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4877/shard-iclb2/igt@perf@blocking-parameterized.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1542">i915#1542</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_busy@after@vecs0:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8874/shard-hsw1/igt@prime_busy@after@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4877/shard-hsw2/igt@prime_busy@after@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2258">i915#2258</a>) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_balancer@nop:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8874/shard-iclb2/igt@gem_exec_balancer@nop.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2268">i915#2268</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4877/shard-iclb4/igt@gem_exec_balancer@nop.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts-forked:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8874/shard-glk7/igt@gem_exec_whisper@basic-contexts-forked.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4877/shard-glk3/igt@gem_exec_whisper@basic-contexts-forked.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>{igt@gem_mmap_offset@blt-coherency}:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8874/shard-apl4/igt@gem_mmap_offset@blt-coherency.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4877/shard-apl7/igt@gem_mmap_offset@blt-coherency.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ppgtt@flink-and-close-vma-leak:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8874/shard-glk6/igt@gem_ppgtt@flink-and-close-vma-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/644">i915#644</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4877/shard-glk8/igt@gem_ppgtt@flink-and-close-vma-leak.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8874/shard-iclb8/igt@i915_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4877/shard-iclb8/igt@i915_pm_dc@dc6-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@mock@contexts:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8874/shard-apl2/igt@i915_selftest@mock@contexts.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4877/shard-apl8/igt@i915_selftest@mock@contexts.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8874/shard-tglb8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4877/shard-tglb1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-untiled:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8874/shard-apl8/igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-untiled.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4877/shard-apl7/igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-untiled.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8874/shard-kbl1/igt@kms_flip@flip-vs-suspend@c-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4877/shard-kbl1/igt@kms_flip@flip-vs-suspend@c-dp1.html">PASS</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-changes-tiling-yf:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8874/shard-kbl7/igt@kms_flip_tiling@flip-changes-tiling-yf.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4877/shard-kbl2/igt@kms_flip_tiling@flip-changes-tiling-yf.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8874/shard-iclb6/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4877/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8874/shard-apl3/igt@perf_pmu@rc6.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4877/shard-apl8/igt@perf_pmu@rc6.html">PASS</a> +4 similar issues</p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8874/shard-hsw1/igt@perf_pmu@rc6.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4877/shard-hsw8/igt@perf_pmu@rc6.html">PASS</a> +3 similar issues</p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8874/shard-snb2/igt@perf_pmu@rc6.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4877/shard-snb5/igt@perf_pmu@rc6.html">PASS</a> +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_busy@hang@bcs0:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8874/shard-hsw8/igt@prime_busy@hang@bcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2258">i915#2258</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4877/shard-hsw6/igt@prime_busy@hang@bcs0.html">PASS</a> +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_reloc@basic-concurrent16:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8874/shard-apl3/igt@gem_exec_reloc@basic-concurrent16.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4877/shard-apl2/igt@gem_exec_reloc@basic-concurrent16.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-primary-rotation-180:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8874/shard-snb4/igt@kms_ccs@pipe-d-crc-primary-rotation-180.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4877/shard-snb4/igt@kms_ccs@pipe-d-crc-primary-rotation-180.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8874/shard-kbl7/igt@kms_content_protection@atomic-dpms.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1319">i915#1319</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4877/shard-kbl4/igt@kms_content_protection@atomic-dpms.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1319">i915#1319</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-changes-tiling-y:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8874/shard-hsw1/igt@kms_flip_tiling@flip-changes-tiling-y.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4877/shard-hsw4/igt@kms_flip_tiling@flip-changes-tiling-y.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8874/shard-snb2/igt@kms_flip_tiling@flip-changes-tiling-y.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4877/shard-snb4/igt@kms_flip_tiling@flip-changes-tiling-y.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8874/shard-hsw2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4877/shard-hsw4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) +1 similar issue</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (11 -&gt; 8)</h2>
<p>Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5767 -&gt; IGTPW_4877</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_8874: 7d3f0451f8e91b593e08dd3f522248004459113d @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_4877: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4877/index.html<br />
  IGT_5767: 39e9aa1032a4e60f776f34b3ccf4fb728abbfe5c @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============5486516757330477161==--

--===============1018444798==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1018444798==--
