Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 06 Aug 2020 14:46:06 -0000
Message-ID: <159672516683.5530.7295059971955228683@emeril.freedesktop.org>
References: <20200806110803.19062-1-swati2.sharma@intel.com>
In-Reply-To: <20200806110803.19062-1-swati2.sharma@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaW50ZWwt?=
 =?utf-8?q?ci=3A_Add_testdisplay_test_to_BAT_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0374160284=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Swati Sharma <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0374160284==
Content-Type: multipart/alternative;
 boundary="===============8967941517306442285=="

--===============8967941517306442285==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: intel-ci: Add testdisplay test to BAT (rev2)
URL   : https://patchwork.freedesktop.org/series/80338/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5761_full -> IGTPW_4858_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4858_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4858_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4858/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4858_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_vblank@pipe-a-wait-busy-hang:
    - shard-hsw:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-hsw1/igt@kms_vblank@pipe-a-wait-busy-hang.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4858/shard-hsw1/igt@kms_vblank@pipe-a-wait-busy-hang.html

  
#### Warnings ####

  * igt@perf@blocking-parameterized:
    - shard-hsw:          [FAIL][3] ([i915#1542]) -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-hsw4/igt@perf@blocking-parameterized.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4858/shard-hsw1/igt@perf@blocking-parameterized.html

  
Known issues
------------

  Here are the changes found in IGTPW_4858_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@preservation-s3@vcs0:
    - shard-kbl:          [PASS][5] -> [DMESG-WARN][6] ([i915#180]) +2 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@vcs0.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4858/shard-kbl4/igt@gem_ctx_isolation@preservation-s3@vcs0.html

  * igt@gem_exec_params@no-vebox:
    - shard-snb:          [PASS][7] -> [TIMEOUT][8] ([i915#1958]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-snb4/igt@gem_exec_params@no-vebox.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4858/shard-snb6/igt@gem_exec_params@no-vebox.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-0:
    - shard-glk:          [PASS][9] -> [FAIL][10] ([i915#1119])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-glk8/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4858/shard-glk7/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html

  * igt@kms_cursor_edge_walk@pipe-b-256x256-top-edge:
    - shard-glk:          [PASS][11] -> [DMESG-WARN][12] ([i915#1982])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-glk3/igt@kms_cursor_edge_walk@pipe-b-256x256-top-edge.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4858/shard-glk4/igt@kms_cursor_edge_walk@pipe-b-256x256-top-edge.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled:
    - shard-apl:          [PASS][13] -> [DMESG-WARN][14] ([i915#1635] / [i915#1982])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-apl3/igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4858/shard-apl4/igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
    - shard-iclb:         [PASS][15] -> [FAIL][16] ([i915#79])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-iclb4/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4858/shard-iclb6/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html

  * igt@kms_flip@plain-flip-ts-check-interruptible@c-hdmi-a2:
    - shard-glk:          [PASS][17] -> [FAIL][18] ([i915#2122])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-glk3/igt@kms_flip@plain-flip-ts-check-interruptible@c-hdmi-a2.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4858/shard-glk5/igt@kms_flip@plain-flip-ts-check-interruptible@c-hdmi-a2.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
    - shard-tglb:         [PASS][19] -> [DMESG-WARN][20] ([i915#1982]) +6 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-tglb6/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4858/shard-tglb3/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][21] -> [SKIP][22] ([fdo#109441]) +2 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4858/shard-iclb8/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_vblank@pipe-c-wait-forked-busy:
    - shard-kbl:          [PASS][23] -> [DMESG-WARN][24] ([i915#1982]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-kbl4/igt@kms_vblank@pipe-c-wait-forked-busy.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4858/shard-kbl4/igt@kms_vblank@pipe-c-wait-forked-busy.html

  * igt@perf@polling-parameterized:
    - shard-iclb:         [PASS][25] -> [FAIL][26] ([i915#1542])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-iclb2/igt@perf@polling-parameterized.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4858/shard-iclb7/igt@perf@polling-parameterized.html

  * igt@prime_busy@after-wait@vcs0:
    - shard-hsw:          [PASS][27] -> [FAIL][28] ([i915#2258]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-hsw7/igt@prime_busy@after-wait@vcs0.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4858/shard-hsw6/igt@prime_busy@after-wait@vcs0.html

  
#### Possible fixes ####

  * {igt@feature_discovery@psr2}:
    - shard-iclb:         [SKIP][29] ([i915#658]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-iclb3/igt@feature_discovery@psr2.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4858/shard-iclb2/igt@feature_discovery@psr2.html

  * igt@i915_pm_lpsp@screens-disabled:
    - shard-hsw:          [TIMEOUT][31] ([i915#1958]) -> [PASS][32] +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-hsw4/igt@i915_pm_lpsp@screens-disabled.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4858/shard-hsw4/igt@i915_pm_lpsp@screens-disabled.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen:
    - shard-apl:          [FAIL][33] ([i915#1635] / [i915#54]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4858/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html
    - shard-kbl:          [FAIL][35] ([i915#54]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4858/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html

  * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
    - shard-glk:          [FAIL][37] ([IGT#5]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-glk7/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4858/shard-glk1/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html

  * igt@kms_flip_tiling@flip-changes-tiling:
    - shard-iclb:         [DMESG-WARN][39] ([i915#1982]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-iclb8/igt@kms_flip_tiling@flip-changes-tiling.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4858/shard-iclb7/igt@kms_flip_tiling@flip-changes-tiling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc:
    - shard-kbl:          [DMESG-WARN][41] ([i915#1982]) -> [PASS][42] +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4858/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary:
    - shard-tglb:         [DMESG-WARN][43] ([i915#1982]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4858/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-kbl:          [INCOMPLETE][45] ([i915#155]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-kbl6/igt@kms_hdr@bpc-switch-suspend.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4858/shard-kbl6/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [DMESG-WARN][47] ([i915#180]) -> [PASS][48] +7 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4858/shard-kbl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [SKIP][49] ([fdo#109441]) -> [PASS][50] +3 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-iclb6/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4858/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@prime_busy@after@vecs0:
    - shard-hsw:          [FAIL][51] ([i915#2258]) -> [PASS][52] +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-hsw2/igt@prime_busy@after@vecs0.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4858/shard-hsw4/igt@prime_busy@after@vecs0.html

  
#### Warnings ####

  * igt@gem_exec_reloc@basic-concurrent16:
    - shard-snb:          [FAIL][53] ([i915#1930]) -> [TIMEOUT][54] ([i915#1958])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-snb6/igt@gem_exec_reloc@basic-concurrent16.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4858/shard-snb6/igt@gem_exec_reloc@basic-concurrent16.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack:
    - shard-hsw:          [TIMEOUT][55] ([i915#1958]) -> [SKIP][56] ([fdo#109271]) +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-hsw4/igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4858/shard-hsw2/igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack.html

  * igt@kms_vblank@pipe-d-query-forked-busy:
    - shard-snb:          [SKIP][57] ([fdo#109271]) -> [TIMEOUT][58] ([i915#1958]) +3 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-snb5/igt@kms_vblank@pipe-d-query-forked-busy.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4858/shard-snb6/igt@kms_vblank@pipe-d-query-forked-busy.html

  * igt@prime_nv_api@nv_i915_import_twice_check_flink_name:
    - shard-tglb:         [INCOMPLETE][59] ([i915#1686]) -> [SKIP][60] ([fdo#109291])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-tglb3/igt@prime_nv_api@nv_i915_import_twice_check_flink_name.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4858/shard-tglb3/igt@prime_nv_api@nv_i915_import_twice_check_flink_name.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#5]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/5
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1686]: https://gitlab.freedesktop.org/drm/intel/issues/1686
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#2258]: https://gitlab.freedesktop.org/drm/intel/issues/2258
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5761 -> IGTPW_4858

  CI-20190529: 20190529
  CI_DRM_8848: f39035176cb854c6d620af7614a60a485ee26818 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4858: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4858/index.html
  IGT_5761: dc048961c2f54a251b43b81ebf2a95d1bab490f2 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4858/index.html

--===============8967941517306442285==
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
<tr><td><b>Series:</b></td><td>intel-ci: Add testdisplay test to BAT (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/80338/">https://patchwork.freedesktop.org/series/80338/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4858/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4858/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_5761_full -&gt; IGTPW_4858_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_4858_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_4858_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4858/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_4858_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_vblank@pipe-a-wait-busy-hang:<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-hsw1/igt@kms_vblank@pipe-a-wait-busy-hang.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4858/shard-hsw1/igt@kms_vblank@pipe-a-wait-busy-hang.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@perf@blocking-parameterized:<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-hsw4/igt@perf@blocking-parameterized.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1542">i915#1542</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4858/shard-hsw1/igt@perf@blocking-parameterized.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_4858_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@vcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4858/shard-kbl4/igt@gem_ctx_isolation@preservation-s3@vcs0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@no-vebox:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-snb4/igt@gem_exec_params@no-vebox.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4858/shard-snb6/igt@gem_exec_params@no-vebox.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-glk8/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4858/shard-glk7/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1119">i915#1119</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-b-256x256-top-edge:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-glk3/igt@kms_cursor_edge_walk@pipe-b-256x256-top-edge.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4858/shard-glk4/igt@kms_cursor_edge_walk@pipe-b-256x256-top-edge.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-apl3/igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4858/shard-apl4/igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-iclb4/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4858/shard-iclb6/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@c-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-glk3/igt@kms_flip@plain-flip-ts-check-interruptible@c-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4858/shard-glk5/igt@kms_flip@plain-flip-ts-check-interruptible@c-hdmi-a2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2122">i915#2122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-tglb6/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4858/shard-tglb3/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4858/shard-iclb8/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-wait-forked-busy:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-kbl4/igt@kms_vblank@pipe-c-wait-forked-busy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4858/shard-kbl4/igt@kms_vblank@pipe-c-wait-forked-busy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@perf@polling-parameterized:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-iclb2/igt@perf@polling-parameterized.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4858/shard-iclb7/igt@perf@polling-parameterized.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1542">i915#1542</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_busy@after-wait@vcs0:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-hsw7/igt@prime_busy@after-wait@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4858/shard-hsw6/igt@prime_busy@after-wait@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2258">i915#2258</a>) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>{igt@feature_discovery@psr2}:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-iclb3/igt@feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4858/shard-iclb2/igt@feature_discovery@psr2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@screens-disabled:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-hsw4/igt@i915_pm_lpsp@screens-disabled.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4858/shard-hsw4/igt@i915_pm_lpsp@screens-disabled.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4858/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4858/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-varying-size:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-glk7/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/5">IGT#5</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4858/shard-glk1/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-changes-tiling:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-iclb8/igt@kms_flip_tiling@flip-changes-tiling.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4858/shard-iclb7/igt@kms_flip_tiling@flip-changes-tiling.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4858/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4858/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-kbl6/igt@kms_hdr@bpc-switch-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4858/shard-kbl6/igt@kms_hdr@bpc-switch-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4858/shard-kbl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">PASS</a> +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_gtt:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-iclb6/igt@kms_psr@psr2_sprite_mmap_gtt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4858/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_busy@after@vecs0:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-hsw2/igt@prime_busy@after@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2258">i915#2258</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4858/shard-hsw4/igt@prime_busy@after@vecs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_reloc@basic-concurrent16:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-snb6/igt@gem_exec_reloc@basic-concurrent16.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1930">i915#1930</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4858/shard-snb6/igt@gem_exec_reloc@basic-concurrent16.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-hsw4/igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4858/shard-hsw2/igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-query-forked-busy:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-snb5/igt@kms_vblank@pipe-d-query-forked-busy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4858/shard-snb6/igt@kms_vblank@pipe-d-query-forked-busy.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@nv_i915_import_twice_check_flink_name:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-tglb3/igt@prime_nv_api@nv_i915_import_twice_check_flink_name.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1686">i915#1686</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4858/shard-tglb3/igt@prime_nv_api@nv_i915_import_twice_check_flink_name.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109291">fdo#109291</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5761 -&gt; IGTPW_4858</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_8848: f39035176cb854c6d620af7614a60a485ee26818 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_4858: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4858/index.html<br />
  IGT_5761: dc048961c2f54a251b43b81ebf2a95d1bab490f2 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============8967941517306442285==--

--===============0374160284==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0374160284==--
