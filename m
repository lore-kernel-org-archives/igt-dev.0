Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 06 Aug 2020 13:12:59 -0000
Message-ID: <159671957982.5530.15049635083286626268@emeril.freedesktop.org>
References: <20200806180749.31464-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20200806180749.31464-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fpipe=5Fcrc=5Fbasic=3A_Sanity_check_for_CRC_mismatches_=28?=
 =?utf-8?q?rev7=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1682912783=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1682912783==
Content-Type: multipart/alternative;
 boundary="===============3406962794093813718=="

--===============3406962794093813718==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_pipe_crc_basic: Sanity check for CRC mismatches (rev7)
URL   : https://patchwork.freedesktop.org/series/80040/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5761_full -> IGTPW_4856_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4856_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4856_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4856/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4856_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@flip-vs-suspend@c-edp1:
    - shard-iclb:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-iclb5/igt@kms_flip@flip-vs-suspend@c-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4856/shard-iclb3/igt@kms_flip@flip-vs-suspend@c-edp1.html

  
New tests
---------

  New tests have been introduced between IGT_5761_full and IGTPW_4856_full:

### New IGT tests (4) ###

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-a:
    - Statuses : 7 pass(s)
    - Exec time: [0.28, 0.70] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b:
    - Statuses : 7 pass(s)
    - Exec time: [0.36, 1.74] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.72] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
    - Statuses : 1 pass(s) 6 skip(s)
    - Exec time: [0.0, 1.59] s

  

Known issues
------------

  Here are the changes found in IGTPW_4856_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_whisper@basic-contexts-forked-all:
    - shard-glk:          [PASS][3] -> [DMESG-WARN][4] ([i915#118] / [i915#95])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-glk2/igt@gem_exec_whisper@basic-contexts-forked-all.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4856/shard-glk3/igt@gem_exec_whisper@basic-contexts-forked-all.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-kbl:          [PASS][5] -> [DMESG-WARN][6] ([i915#1436] / [i915#716])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-kbl7/igt@gen9_exec_parse@allowed-all.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4856/shard-kbl4/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-hsw:          [PASS][7] -> [WARN][8] ([i915#1519])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-hsw6/igt@i915_pm_rc6_residency@rc6-fence.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4856/shard-hsw1/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [PASS][9] -> [DMESG-WARN][10] ([i915#180]) +4 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4856/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-kbl:          [PASS][11] -> [DMESG-WARN][12] ([i915#1982])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4856/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt:
    - shard-tglb:         [PASS][13] -> [SKIP][14] ([i915#668]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-tglb1/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4856/shard-tglb6/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-pwrite:
    - shard-tglb:         [PASS][15] -> [DMESG-WARN][16] ([i915#1982]) +3 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-tglb3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-pwrite.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4856/shard-tglb7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-iclb:         [PASS][17] -> [FAIL][18] ([i915#83])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-iclb8/igt@kms_panel_fitting@atomic-fastset.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4856/shard-iclb5/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane_cursor@pipe-a-primary-size-64:
    - shard-glk:          [PASS][19] -> [DMESG-WARN][20] ([i915#1982]) +2 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-glk7/igt@kms_plane_cursor@pipe-a-primary-size-64.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4856/shard-glk9/igt@kms_plane_cursor@pipe-a-primary-size-64.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][21] -> [SKIP][22] ([fdo#109441]) +2 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4856/shard-iclb5/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_vblank@pipe-c-ts-continuation-idle:
    - shard-hsw:          [PASS][23] -> [TIMEOUT][24] ([i915#1958])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-hsw1/igt@kms_vblank@pipe-c-ts-continuation-idle.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4856/shard-hsw2/igt@kms_vblank@pipe-c-ts-continuation-idle.html

  * igt@perf_pmu@module-unload:
    - shard-iclb:         [PASS][25] -> [DMESG-WARN][26] ([i915#1982]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-iclb2/igt@perf_pmu@module-unload.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4856/shard-iclb2/igt@perf_pmu@module-unload.html

  * igt@prime_busy@after-wait@vcs0:
    - shard-hsw:          [PASS][27] -> [FAIL][28] ([i915#2258]) +3 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-hsw7/igt@prime_busy@after-wait@vcs0.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4856/shard-hsw4/igt@prime_busy@after-wait@vcs0.html

  
#### Possible fixes ####

  * igt@i915_pm_lpsp@screens-disabled:
    - shard-hsw:          [TIMEOUT][29] ([i915#1958]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-hsw4/igt@i915_pm_lpsp@screens-disabled.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4856/shard-hsw6/igt@i915_pm_lpsp@screens-disabled.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen:
    - shard-apl:          [FAIL][31] ([i915#1635] / [i915#54]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4856/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html
    - shard-kbl:          [FAIL][33] ([i915#54]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4856/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html

  * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
    - shard-glk:          [FAIL][35] ([IGT#5]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-glk7/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4856/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html

  * igt@kms_flip_tiling@flip-changes-tiling:
    - shard-iclb:         [DMESG-WARN][37] ([i915#1982]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-iclb8/igt@kms_flip_tiling@flip-changes-tiling.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4856/shard-iclb5/igt@kms_flip_tiling@flip-changes-tiling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc:
    - shard-kbl:          [DMESG-WARN][39] ([i915#1982]) -> [PASS][40] +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4856/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary:
    - shard-tglb:         [DMESG-WARN][41] ([i915#1982]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4856/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-kbl:          [INCOMPLETE][43] ([i915#155]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-kbl6/igt@kms_hdr@bpc-switch-suspend.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4856/shard-kbl2/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [DMESG-WARN][45] ([i915#180]) -> [PASS][46] +5 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4856/shard-kbl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-iclb:         [SKIP][47] ([fdo#109441]) -> [PASS][48] +2 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-iclb4/igt@kms_psr@psr2_cursor_plane_move.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4856/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html

  * igt@perf@blocking-parameterized:
    - shard-iclb:         [FAIL][49] ([i915#1542]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-iclb5/igt@perf@blocking-parameterized.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4856/shard-iclb2/igt@perf@blocking-parameterized.html

  * igt@prime_busy@hang-wait@bcs0:
    - shard-hsw:          [FAIL][51] ([i915#2258]) -> [PASS][52] +4 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-hsw4/igt@prime_busy@hang-wait@bcs0.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4856/shard-hsw7/igt@prime_busy@hang-wait@bcs0.html

  
#### Warnings ####

  * igt@gem_render_copy@y-tiled-to-vebox-linear:
    - shard-hsw:          [SKIP][53] ([fdo#109271]) -> [TIMEOUT][54] ([i915#1958])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-hsw4/igt@gem_render_copy@y-tiled-to-vebox-linear.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4856/shard-hsw2/igt@gem_render_copy@y-tiled-to-vebox-linear.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack:
    - shard-hsw:          [TIMEOUT][55] ([i915#1958]) -> [SKIP][56] ([fdo#109271]) +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-hsw4/igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4856/shard-hsw7/igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack.html

  * igt@prime_nv_api@nv_i915_import_twice_check_flink_name:
    - shard-tglb:         [INCOMPLETE][57] ([i915#1686]) -> [SKIP][58] ([fdo#109291])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-tglb3/igt@prime_nv_api@nv_i915_import_twice_check_flink_name.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4856/shard-tglb1/igt@prime_nv_api@nv_i915_import_twice_check_flink_name.html

  
  [IGT#5]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/5
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1519]: https://gitlab.freedesktop.org/drm/intel/issues/1519
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1686]: https://gitlab.freedesktop.org/drm/intel/issues/1686
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2258]: https://gitlab.freedesktop.org/drm/intel/issues/2258
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#83]: https://gitlab.freedesktop.org/drm/intel/issues/83
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5761 -> IGTPW_4856

  CI-20190529: 20190529
  CI_DRM_8848: f39035176cb854c6d620af7614a60a485ee26818 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4856: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4856/index.html
  IGT_5761: dc048961c2f54a251b43b81ebf2a95d1bab490f2 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4856/index.html

--===============3406962794093813718==
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
<tr><td><b>Series:</b></td><td>tests/kms_pipe_crc_basic: Sanity check for CRC mismatches (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/80040/">https://patchwork.freedesktop.org/series/80040/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4856/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4856/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_5761_full -&gt; IGTPW_4856_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_4856_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_4856_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4856/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_4856_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_flip@flip-vs-suspend@c-edp1:<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-iclb5/igt@kms_flip@flip-vs-suspend@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4856/shard-iclb3/igt@kms_flip@flip-vs-suspend@c-edp1.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_5761_full and IGTPW_4856_full:</p>
<h3>New IGT tests (4)</h3>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-a:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.28, 0.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.36, 1.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c:</p>
<ul>
<li>Statuses : 6 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 1.59] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_4856_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_whisper@basic-contexts-forked-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-glk2/igt@gem_exec_whisper@basic-contexts-forked-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4856/shard-glk3/igt@gem_exec_whisper@basic-contexts-forked-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-kbl7/igt@gen9_exec_parse@allowed-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4856/shard-kbl4/igt@gen9_exec_parse@allowed-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/716">i915#716</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-hsw6/igt@i915_pm_rc6_residency@rc6-fence.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4856/shard-hsw1/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1519">i915#1519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4856/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4856/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-tglb1/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4856/shard-tglb6/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/668">i915#668</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-tglb3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-pwrite.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4856/shard-tglb7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-pwrite.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-iclb8/igt@kms_panel_fitting@atomic-fastset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4856/shard-iclb5/igt@kms_panel_fitting@atomic-fastset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/83">i915#83</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@pipe-a-primary-size-64:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-glk7/igt@kms_plane_cursor@pipe-a-primary-size-64.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4856/shard-glk9/igt@kms_plane_cursor@pipe-a-primary-size-64.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4856/shard-iclb5/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-ts-continuation-idle:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-hsw1/igt@kms_vblank@pipe-c-ts-continuation-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4856/shard-hsw2/igt@kms_vblank@pipe-c-ts-continuation-idle.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-iclb2/igt@perf_pmu@module-unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4856/shard-iclb2/igt@perf_pmu@module-unload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_busy@after-wait@vcs0:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-hsw7/igt@prime_busy@after-wait@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4856/shard-hsw4/igt@prime_busy@after-wait@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2258">i915#2258</a>) +3 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_pm_lpsp@screens-disabled:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-hsw4/igt@i915_pm_lpsp@screens-disabled.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4856/shard-hsw6/igt@i915_pm_lpsp@screens-disabled.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4856/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4856/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-varying-size:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-glk7/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/5">IGT#5</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4856/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-changes-tiling:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-iclb8/igt@kms_flip_tiling@flip-changes-tiling.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4856/shard-iclb5/igt@kms_flip_tiling@flip-changes-tiling.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4856/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4856/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-kbl6/igt@kms_hdr@bpc-switch-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4856/shard-kbl2/igt@kms_hdr@bpc-switch-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4856/shard-kbl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">PASS</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_move:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-iclb4/igt@kms_psr@psr2_cursor_plane_move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4856/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf@blocking-parameterized:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-iclb5/igt@perf@blocking-parameterized.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1542">i915#1542</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4856/shard-iclb2/igt@perf@blocking-parameterized.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@prime_busy@hang-wait@bcs0:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-hsw4/igt@prime_busy@hang-wait@bcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2258">i915#2258</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4856/shard-hsw7/igt@prime_busy@hang-wait@bcs0.html">PASS</a> +4 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_render_copy@y-tiled-to-vebox-linear:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-hsw4/igt@gem_render_copy@y-tiled-to-vebox-linear.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4856/shard-hsw2/igt@gem_render_copy@y-tiled-to-vebox-linear.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-hsw4/igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4856/shard-hsw7/igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@nv_i915_import_twice_check_flink_name:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5761/shard-tglb3/igt@prime_nv_api@nv_i915_import_twice_check_flink_name.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1686">i915#1686</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4856/shard-tglb1/igt@prime_nv_api@nv_i915_import_twice_check_flink_name.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109291">fdo#109291</a>)</li>
</ul>
</li>
</ul>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5761 -&gt; IGTPW_4856</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_8848: f39035176cb854c6d620af7614a60a485ee26818 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_4856: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4856/index.html<br />
  IGT_5761: dc048961c2f54a251b43b81ebf2a95d1bab490f2 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============3406962794093813718==--

--===============1682912783==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1682912783==--
