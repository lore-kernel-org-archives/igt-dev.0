Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 24 Sep 2020 12:32:57 -0000
Message-ID: <160095077776.24489.2244550896615715579@emeril.freedesktop.org>
References: <20200924091240.30918-1-priyanka.dandamudi@intel.com>
In-Reply-To: <20200924091240.30918-1-priyanka.dandamudi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fclose=3A_Added_test_description_for_test_case_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0352235249=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: priyanka.dandamudi@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0352235249==
Content-Type: multipart/alternative;
 boundary="===============1742603002222424219=="

--===============1742603002222424219==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915/gem_close: Added test description for test case (rev2)
URL   : https://patchwork.freedesktop.org/series/80063/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9046_full -> IGTPW_5009_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5009/index.html

Known issues
------------

  Here are the changes found in IGTPW_5009_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s3:
    - shard-kbl:          [PASS][1] -> [INCOMPLETE][2] ([i915#155])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9046/shard-kbl4/igt@gem_exec_suspend@basic-s3.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5009/shard-kbl4/igt@gem_exec_suspend@basic-s3.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-hsw:          [PASS][3] -> [WARN][4] ([i915#1519])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9046/shard-hsw2/igt@i915_pm_rc6_residency@rc6-idle.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5009/shard-hsw6/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@kms_cursor_edge_walk@pipe-a-64x64-top-edge:
    - shard-hsw:          [PASS][5] -> [DMESG-WARN][6] ([i915#1982])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9046/shard-hsw1/igt@kms_cursor_edge_walk@pipe-a-64x64-top-edge.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5009/shard-hsw6/igt@kms_cursor_edge_walk@pipe-a-64x64-top-edge.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy:
    - shard-kbl:          [PASS][7] -> [DMESG-WARN][8] ([i915#1982])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9046/shard-kbl2/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5009/shard-kbl6/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a1:
    - shard-glk:          [PASS][9] -> [DMESG-WARN][10] ([i915#118] / [i915#95]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9046/shard-glk2/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a1.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5009/shard-glk6/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [PASS][11] -> [DMESG-WARN][12] ([i915#180]) +5 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9046/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5009/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_flip@flip-vs-suspend@c-hdmi-a1:
    - shard-hsw:          [PASS][13] -> [INCOMPLETE][14] ([i915#2055])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9046/shard-hsw4/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5009/shard-hsw1/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-glk:          [PASS][15] -> [FAIL][16] ([i915#49])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9046/shard-glk7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5009/shard-glk6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-badstride:
    - shard-glk:          [PASS][17] -> [DMESG-WARN][18] ([i915#1982])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9046/shard-glk7/igt@kms_frontbuffer_tracking@fbc-badstride.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5009/shard-glk3/igt@kms_frontbuffer_tracking@fbc-badstride.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [PASS][19] -> [SKIP][20] ([fdo#109642] / [fdo#111068])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9046/shard-iclb2/igt@kms_psr2_su@page_flip.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5009/shard-iclb1/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][21] -> [SKIP][22] ([fdo#109441]) +2 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9046/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5009/shard-iclb8/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_vblank@pipe-b-query-forked-busy:
    - shard-apl:          [PASS][23] -> [DMESG-WARN][24] ([i915#1635] / [i915#1982]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9046/shard-apl2/igt@kms_vblank@pipe-b-query-forked-busy.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5009/shard-apl6/igt@kms_vblank@pipe-b-query-forked-busy.html

  * igt@kms_vblank@pipe-d-ts-continuation-modeset:
    - shard-tglb:         [PASS][25] -> [DMESG-WARN][26] ([i915#1982]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9046/shard-tglb8/igt@kms_vblank@pipe-d-ts-continuation-modeset.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5009/shard-tglb7/igt@kms_vblank@pipe-d-ts-continuation-modeset.html

  * igt@perf_pmu@module-unload:
    - shard-iclb:         [PASS][27] -> [DMESG-WARN][28] ([i915#1982])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9046/shard-iclb8/igt@perf_pmu@module-unload.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5009/shard-iclb2/igt@perf_pmu@module-unload.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@preservation-s3@vcs0:
    - shard-kbl:          [DMESG-WARN][29] ([i915#180]) -> [PASS][30] +3 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9046/shard-kbl1/igt@gem_ctx_isolation@preservation-s3@vcs0.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5009/shard-kbl4/igt@gem_ctx_isolation@preservation-s3@vcs0.html

  * igt@gem_exec_reloc@basic-many-active@vecs0:
    - shard-glk:          [FAIL][31] ([i915#2389]) -> [PASS][32] +2 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9046/shard-glk8/igt@gem_exec_reloc@basic-many-active@vecs0.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5009/shard-glk4/igt@gem_exec_reloc@basic-many-active@vecs0.html

  * igt@gem_exec_suspend@basic-s4-devices:
    - shard-hsw:          [INCOMPLETE][33] ([i915#1888]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9046/shard-hsw4/igt@gem_exec_suspend@basic-s4-devices.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5009/shard-hsw7/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-kbl:          [INCOMPLETE][35] ([i915#1436]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9046/shard-kbl6/igt@gen9_exec_parse@allowed-all.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5009/shard-kbl1/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_selftest@mock@contexts:
    - shard-apl:          [INCOMPLETE][37] ([i915#1635] / [i915#2278]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9046/shard-apl2/igt@i915_selftest@mock@contexts.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5009/shard-apl4/igt@i915_selftest@mock@contexts.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-hsw:          [INCOMPLETE][39] ([CI#80]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9046/shard-hsw2/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5009/shard-hsw4/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen:
    - shard-tglb:         [DMESG-WARN][41] ([i915#1982]) -> [PASS][42] +4 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9046/shard-tglb8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5009/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-pwrite:
    - shard-kbl:          [DMESG-WARN][43] ([i915#1982]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9046/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-pwrite.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5009/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-pwrite.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [SKIP][45] ([fdo#109441]) -> [PASS][46] +2 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9046/shard-iclb4/igt@kms_psr@psr2_cursor_render.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5009/shard-iclb2/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_setmode@basic:
    - shard-glk:          [FAIL][47] ([i915#31]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9046/shard-glk9/igt@kms_setmode@basic.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5009/shard-glk6/igt@kms_setmode@basic.html

  * igt@perf@polling-small-buf:
    - shard-iclb:         [FAIL][49] ([i915#1722]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9046/shard-iclb2/igt@perf@polling-small-buf.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5009/shard-iclb7/igt@perf@polling-small-buf.html

  
#### Warnings ####

  * igt@kms_plane_alpha_blend@pipe-a-alpha-basic:
    - shard-apl:          [FAIL][51] ([fdo#108145] / [i915#1635] / [i915#265]) -> [DMESG-FAIL][52] ([fdo#108145] / [i915#1635] / [i915#1982])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9046/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5009/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1519]: https://gitlab.freedesktop.org/drm/intel/issues/1519
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1722]: https://gitlab.freedesktop.org/drm/intel/issues/1722
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2055]: https://gitlab.freedesktop.org/drm/intel/issues/2055
  [i915#2278]: https://gitlab.freedesktop.org/drm/intel/issues/2278
  [i915#2389]: https://gitlab.freedesktop.org/drm/intel/issues/2389
  [i915#2469]: https://gitlab.freedesktop.org/drm/intel/issues/2469
  [i915#2476]: https://gitlab.freedesktop.org/drm/intel/issues/2476
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (12 -> 8)
------------------------------

  Missing    (4): pig-snb-2600 pig-glk-j5005 pig-skl-6260u pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5787 -> IGTPW_5009
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_9046: da6944fc0f5b972075ebcc290709e9a36b9a5656 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5009: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5009/index.html
  IGT_5787: 0ec962017c8131de14e0cb038f7f76b1f17ed637 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5009/index.html

--===============1742603002222424219==
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
<tr><td><b>Series:</b></td><td>i915/gem_close: Added test description for test case (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/80063/">https://patchwork.freedesktop.org/series/80063/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5009/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5009/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9046_full -&gt; IGTPW_5009_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5009/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5009_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9046/shard-kbl4/igt@gem_exec_suspend@basic-s3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5009/shard-kbl4/igt@gem_exec_suspend@basic-s3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9046/shard-hsw2/igt@i915_pm_rc6_residency@rc6-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5009/shard-hsw6/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1519">i915#1519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-a-64x64-top-edge:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9046/shard-hsw1/igt@kms_cursor_edge_walk@pipe-a-64x64-top-edge.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5009/shard-hsw6/igt@kms_cursor_edge_walk@pipe-a-64x64-top-edge.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9046/shard-kbl2/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5009/shard-kbl6/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9046/shard-glk2/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5009/shard-glk6/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9046/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5009/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9046/shard-hsw4/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5009/shard-hsw1/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2055">i915#2055</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9046/shard-glk7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5009/shard-glk6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/49">i915#49</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-badstride:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9046/shard-glk7/igt@kms_frontbuffer_tracking@fbc-badstride.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5009/shard-glk3/igt@kms_frontbuffer_tracking@fbc-badstride.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9046/shard-iclb2/igt@kms_psr2_su@page_flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5009/shard-iclb1/igt@kms_psr2_su@page_flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109642">fdo#109642</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111068">fdo#111068</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9046/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5009/shard-iclb8/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-query-forked-busy:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9046/shard-apl2/igt@kms_vblank@pipe-b-query-forked-busy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5009/shard-apl6/igt@kms_vblank@pipe-b-query-forked-busy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-ts-continuation-modeset:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9046/shard-tglb8/igt@kms_vblank@pipe-d-ts-continuation-modeset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5009/shard-tglb7/igt@kms_vblank@pipe-d-ts-continuation-modeset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9046/shard-iclb8/igt@perf_pmu@module-unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5009/shard-iclb2/igt@perf_pmu@module-unload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@vcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9046/shard-kbl1/igt@gem_ctx_isolation@preservation-s3@vcs0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5009/shard-kbl4/igt@gem_ctx_isolation@preservation-s3@vcs0.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@vecs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9046/shard-glk8/igt@gem_exec_reloc@basic-many-active@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5009/shard-glk4/igt@gem_exec_reloc@basic-many-active@vecs0.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s4-devices:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9046/shard-hsw4/igt@gem_exec_suspend@basic-s4-devices.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5009/shard-hsw7/igt@gem_exec_suspend@basic-s4-devices.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9046/shard-kbl6/igt@gen9_exec_parse@allowed-all.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5009/shard-kbl1/igt@gen9_exec_parse@allowed-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@mock@contexts:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9046/shard-apl2/igt@i915_selftest@mock@contexts.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2278">i915#2278</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5009/shard-apl4/igt@i915_selftest@mock@contexts.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9046/shard-hsw2/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80">CI#80</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5009/shard-hsw4/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9046/shard-tglb8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5009/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-pwrite:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9046/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-pwrite.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5009/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-pwrite.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_render:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9046/shard-iclb4/igt@kms_psr@psr2_cursor_render.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5009/shard-iclb2/igt@kms_psr@psr2_cursor_render.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9046/shard-glk9/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/31">i915#31</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5009/shard-glk6/igt@kms_setmode@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@polling-small-buf:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9046/shard-iclb2/igt@perf@polling-small-buf.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1722">i915#1722</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5009/shard-iclb7/igt@perf@polling-small-buf.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_plane_alpha_blend@pipe-a-alpha-basic:<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9046/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=108145">fdo#108145</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/265">i915#265</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5009/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html">DMESG-FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=108145">fdo#108145</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (12 -&gt; 8)</h2>
<p>Missing    (4): pig-snb-2600 pig-glk-j5005 pig-skl-6260u pig-icl-1065g7 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5787 -&gt; IGTPW_5009</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9046: da6944fc0f5b972075ebcc290709e9a36b9a5656 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5009: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5009/index.html<br />
  IGT_5787: 0ec962017c8131de14e0cb038f7f76b1f17ed637 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============1742603002222424219==--

--===============0352235249==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0352235249==--
