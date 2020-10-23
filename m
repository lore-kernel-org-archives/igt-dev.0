Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 23 Oct 2020 14:43:26 -0000
Message-ID: <160346420633.1407.16723777101160888016@emeril.freedesktop.org>
References: <20201023092203.1411-1-dominik.grzegorzek@intel.com>
In-Reply-To: <20201023092203.1411-1-dominik.grzegorzek@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHM6?=
 =?utf-8?q?_Remove_libdrm_dependency_=28rev5=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1625681650=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1625681650==
Content-Type: multipart/alternative;
 boundary="===============6306140301118202901=="

--===============6306140301118202901==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests: Remove libdrm dependency (rev5)
URL   : https://patchwork.freedesktop.org/series/82203/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5823_full -> IGTPW_5091_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5091_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5091_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5091/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5091_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_create@forked:
    - shard-tglb:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-tglb7/igt@gem_exec_create@forked.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5091/shard-tglb1/igt@gem_exec_create@forked.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@core_hotunplug@hotrebind}:
    - shard-hsw:          NOTRUN -> [WARN][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5091/shard-hsw7/igt@core_hotunplug@hotrebind.html

  * {igt@gem_exec_parallel@userptr@vcs0}:
    - shard-hsw:          [PASS][4] -> [FAIL][5] +2 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-hsw5/igt@gem_exec_parallel@userptr@vcs0.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5091/shard-hsw7/igt@gem_exec_parallel@userptr@vcs0.html

  
Known issues
------------

  Here are the changes found in IGTPW_5091_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_eio@kms:
    - shard-snb:          [PASS][6] -> [DMESG-WARN][7] ([i915#1982])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-snb4/igt@gem_eio@kms.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5091/shard-snb7/igt@gem_eio@kms.html

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-hsw:          [PASS][8] -> [FAIL][9] ([i915#2389])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-hsw8/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5091/shard-hsw5/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@kms_cursor_edge_walk@pipe-c-256x256-right-edge:
    - shard-apl:          [PASS][10] -> [DMESG-WARN][11] ([i915#1635] / [i915#1982])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-apl2/igt@kms_cursor_edge_walk@pipe-c-256x256-right-edge.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5091/shard-apl2/igt@kms_cursor_edge_walk@pipe-c-256x256-right-edge.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-glk:          [PASS][12] -> [DMESG-FAIL][13] ([i915#118] / [i915#95])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-glk2/igt@kms_fbcon_fbt@fbc-suspend.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5091/shard-glk2/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1:
    - shard-hsw:          [PASS][14] -> [INCOMPLETE][15] ([i915#2055])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-hsw8/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5091/shard-hsw6/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:
    - shard-tglb:         [PASS][16] -> [DMESG-WARN][17] ([i915#1982]) +3 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5091/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [PASS][18] -> [SKIP][19] ([i915#433])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-tglb7/igt@kms_hdmi_inject@inject-audio.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5091/shard-tglb6/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [PASS][20] -> [SKIP][21] ([fdo#109441]) +2 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-iclb2/igt@kms_psr@psr2_cursor_render.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5091/shard-iclb3/igt@kms_psr@psr2_cursor_render.html

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [PASS][22] -> [SKIP][23] ([i915#1354])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-tglb5/igt@perf@gen12-mi-rpc.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5091/shard-tglb3/igt@perf@gen12-mi-rpc.html

  * igt@perf@mi-rpc:
    - shard-kbl:          [PASS][24] -> [SKIP][25] ([fdo#109271] / [i915#1354])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-kbl6/igt@perf@mi-rpc.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5091/shard-kbl4/igt@perf@mi-rpc.html
    - shard-iclb:         [PASS][26] -> [SKIP][27] ([i915#1354])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-iclb8/igt@perf@mi-rpc.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5091/shard-iclb1/igt@perf@mi-rpc.html
    - shard-hsw:          [PASS][28] -> [SKIP][29] ([fdo#109271])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-hsw1/igt@perf@mi-rpc.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5091/shard-hsw7/igt@perf@mi-rpc.html
    - shard-glk:          [PASS][30] -> [SKIP][31] ([fdo#109271] / [i915#1354])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-glk2/igt@perf@mi-rpc.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5091/shard-glk3/igt@perf@mi-rpc.html
    - shard-apl:          [PASS][32] -> [SKIP][33] ([fdo#109271] / [i915#1354] / [i915#1635])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-apl1/igt@perf@mi-rpc.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5091/shard-apl6/igt@perf@mi-rpc.html

  
#### Possible fixes ####

  * igt@gem_exec_create@madvise:
    - shard-glk:          [DMESG-WARN][34] ([i915#118] / [i915#95]) -> [PASS][35] +1 similar issue
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-glk5/igt@gem_exec_create@madvise.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5091/shard-glk1/igt@gem_exec_create@madvise.html

  * igt@gem_exec_fence@long-history:
    - shard-kbl:          [INCOMPLETE][36] ([CI#80]) -> [PASS][37]
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-kbl7/igt@gem_exec_fence@long-history.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5091/shard-kbl4/igt@gem_exec_fence@long-history.html

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-apl:          [FAIL][38] ([i915#1635] / [i915#2389]) -> [PASS][39]
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-apl3/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5091/shard-apl2/igt@gem_exec_reloc@basic-many-active@rcs0.html
    - shard-glk:          [FAIL][40] ([i915#2389]) -> [PASS][41]
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-glk6/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5091/shard-glk2/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][42] ([i915#454]) -> [PASS][43]
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-iclb8/igt@i915_pm_dc@dc6-psr.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5091/shard-iclb3/igt@i915_pm_dc@dc6-psr.html

  * {igt@kms_async_flips@async-flip-with-page-flip-events}:
    - shard-kbl:          [FAIL][44] ([i915#2521]) -> [PASS][45]
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-kbl4/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5091/shard-kbl7/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_cursor_edge_walk@pipe-c-64x64-right-edge:
    - shard-glk:          [DMESG-WARN][46] ([i915#1982]) -> [PASS][47] +1 similar issue
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-glk6/igt@kms_cursor_edge_walk@pipe-c-64x64-right-edge.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5091/shard-glk6/igt@kms_cursor_edge_walk@pipe-c-64x64-right-edge.html

  * igt@kms_draw_crc@draw-method-rgb565-render-xtiled:
    - shard-apl:          [DMESG-WARN][48] ([i915#1635] / [i915#1982]) -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-apl2/igt@kms_draw_crc@draw-method-rgb565-render-xtiled.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5091/shard-apl4/igt@kms_draw_crc@draw-method-rgb565-render-xtiled.html

  * igt@kms_flip@flip-vs-suspend@c-hdmi-a1:
    - shard-hsw:          [INCOMPLETE][50] ([i915#2055]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-hsw6/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5091/shard-hsw8/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-cpu:
    - shard-glk:          [FAIL][52] ([i915#49]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-cpu.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5091/shard-glk6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy:
    - shard-tglb:         [DMESG-WARN][54] ([i915#1982]) -> [PASS][55] +3 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5091/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [SKIP][56] ([fdo#109441]) -> [PASS][57] +2 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-iclb8/igt@kms_psr@psr2_no_drrs.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5091/shard-iclb2/igt@kms_psr@psr2_no_drrs.html

  
#### Warnings ####

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         [WARN][58] ([i915#1515]) -> [FAIL][59] ([i915#1515])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-iclb4/igt@i915_pm_rc6_residency@rc6-idle.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5091/shard-iclb8/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@kms_content_protection@lic:
    - shard-apl:          [FAIL][60] ([fdo#110321] / [i915#1635]) -> [TIMEOUT][61] ([i915#1319] / [i915#1635])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-apl1/igt@kms_content_protection@lic.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5091/shard-apl2/igt@kms_content_protection@lic.html

  * igt@perf@gen12-mi-rpc:
    - shard-kbl:          [SKIP][62] ([fdo#109271]) -> [SKIP][63] ([fdo#109271] / [i915#1354])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-kbl7/igt@perf@gen12-mi-rpc.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5091/shard-kbl4/igt@perf@gen12-mi-rpc.html
    - shard-iclb:         [SKIP][64] ([fdo#109289]) -> [SKIP][65] ([i915#1354])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-iclb1/igt@perf@gen12-mi-rpc.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5091/shard-iclb1/igt@perf@gen12-mi-rpc.html
    - shard-glk:          [SKIP][66] ([fdo#109271]) -> [SKIP][67] ([fdo#109271] / [i915#1354])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-glk3/igt@perf@gen12-mi-rpc.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5091/shard-glk3/igt@perf@gen12-mi-rpc.html
    - shard-apl:          [SKIP][68] ([fdo#109271] / [i915#1635]) -> [SKIP][69] ([fdo#109271] / [i915#1354] / [i915#1635])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-apl4/igt@perf@gen12-mi-rpc.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5091/shard-apl6/igt@perf@gen12-mi-rpc.html

  * igt@perf@mi-rpc:
    - shard-tglb:         [SKIP][70] ([fdo#109289]) -> [SKIP][71] ([i915#1354])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-tglb2/igt@perf@mi-rpc.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5091/shard-tglb3/igt@perf@mi-rpc.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1354]: https://gitlab.freedesktop.org/drm/intel/issues/1354
  [i915#1515]: https://gitlab.freedesktop.org/drm/intel/issues/1515
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2055]: https://gitlab.freedesktop.org/drm/intel/issues/2055
  [i915#2389]: https://gitlab.freedesktop.org/drm/intel/issues/2389
  [i915#2521]: https://gitlab.freedesktop.org/drm/intel/issues/2521
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5823 -> IGTPW_5091

  CI-20190529: 20190529
  CI_DRM_9190: a3d535579dd93942862b867b4452ba11e4f6bbb1 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5091: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5091/index.html
  IGT_5823: 7dd2fe99bd9dde00456cc5abf7e5ef0c8d7d6118 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5091/index.html

--===============6306140301118202901==
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
<tr><td><b>Series:</b></td><td>tests: Remove libdrm dependency (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/82203/">https://patchwork.freedesktop.org/series/82203/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5091/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5091/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_5823_full -&gt; IGTPW_5091_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5091_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5091_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5091/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5091_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@gem_exec_create@forked:<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-tglb7/igt@gem_exec_create@forked.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5091/shard-tglb1/igt@gem_exec_create@forked.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@core_hotunplug@hotrebind}:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5091/shard-hsw7/igt@core_hotunplug@hotrebind.html">WARN</a></li>
</ul>
</li>
<li>
<p>{igt@gem_exec_parallel@userptr@vcs0}:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-hsw5/igt@gem_exec_parallel@userptr@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5091/shard-hsw7/igt@gem_exec_parallel@userptr@vcs0.html">FAIL</a> +2 similar issues</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5091_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-snb4/igt@gem_eio@kms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5091/shard-snb7/igt@gem_eio@kms.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-hsw8/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5091/shard-hsw5/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-c-256x256-right-edge:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-apl2/igt@kms_cursor_edge_walk@pipe-c-256x256-right-edge.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5091/shard-apl2/igt@kms_cursor_edge_walk@pipe-c-256x256-right-edge.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-glk2/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5091/shard-glk2/igt@kms_fbcon_fbt@fbc-suspend.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-hsw8/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5091/shard-hsw6/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2055">i915#2055</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5091/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-tglb7/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5091/shard-tglb6/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/433">i915#433</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_render:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-iclb2/igt@kms_psr@psr2_cursor_render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5091/shard-iclb3/igt@kms_psr@psr2_cursor_render.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf@gen12-mi-rpc:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-tglb5/igt@perf@gen12-mi-rpc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5091/shard-tglb3/igt@perf@gen12-mi-rpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@mi-rpc:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-kbl6/igt@perf@mi-rpc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5091/shard-kbl4/igt@perf@mi-rpc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-iclb8/igt@perf@mi-rpc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5091/shard-iclb1/igt@perf@mi-rpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>)</p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-hsw1/igt@perf@mi-rpc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5091/shard-hsw7/igt@perf@mi-rpc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-glk2/igt@perf@mi-rpc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5091/shard-glk3/igt@perf@mi-rpc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>)</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-apl1/igt@perf@mi-rpc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5091/shard-apl6/igt@perf@mi-rpc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_create@madvise:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-glk5/igt@gem_exec_create@madvise.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5091/shard-glk1/igt@gem_exec_create@madvise.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@long-history:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-kbl7/igt@gem_exec_fence@long-history.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80">CI#80</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5091/shard-kbl4/igt@gem_exec_fence@long-history.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-apl3/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5091/shard-apl2/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-glk6/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5091/shard-glk2/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-iclb8/igt@i915_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5091/shard-iclb3/igt@i915_pm_dc@dc6-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_async_flips@async-flip-with-page-flip-events}:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-kbl4/igt@kms_async_flips@async-flip-with-page-flip-events.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2521">i915#2521</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5091/shard-kbl7/igt@kms_async_flips@async-flip-with-page-flip-events.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-c-64x64-right-edge:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-glk6/igt@kms_cursor_edge_walk@pipe-c-64x64-right-edge.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5091/shard-glk6/igt@kms_cursor_edge_walk@pipe-c-64x64-right-edge.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-render-xtiled:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-apl2/igt@kms_draw_crc@draw-method-rgb565-render-xtiled.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5091/shard-apl4/igt@kms_draw_crc@draw-method-rgb565-render-xtiled.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-hsw6/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2055">i915#2055</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5091/shard-hsw8/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-cpu.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/49">i915#49</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5091/shard-glk6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-cpu.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5091/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_no_drrs:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-iclb8/igt@kms_psr@psr2_no_drrs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5091/shard-iclb2/igt@kms_psr@psr2_no_drrs.html">PASS</a> +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-iclb4/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1515">i915#1515</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5091/shard-iclb8/igt@i915_pm_rc6_residency@rc6-idle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1515">i915#1515</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-apl1/igt@kms_content_protection@lic.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110321">fdo#110321</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5091/shard-apl2/igt@kms_content_protection@lic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1319">i915#1319</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@gen12-mi-rpc:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-kbl7/igt@perf@gen12-mi-rpc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5091/shard-kbl4/igt@perf@gen12-mi-rpc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-iclb1/igt@perf@gen12-mi-rpc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5091/shard-iclb1/igt@perf@gen12-mi-rpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>)</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-glk3/igt@perf@gen12-mi-rpc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5091/shard-glk3/igt@perf@gen12-mi-rpc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>)</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-apl4/igt@perf@gen12-mi-rpc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5091/shard-apl6/igt@perf@gen12-mi-rpc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@perf@mi-rpc:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-tglb2/igt@perf@mi-rpc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5091/shard-tglb3/igt@perf@mi-rpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>)</li>
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
<li>IGT: IGT_5823 -&gt; IGTPW_5091</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9190: a3d535579dd93942862b867b4452ba11e4f6bbb1 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5091: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5091/index.html<br />
  IGT_5823: 7dd2fe99bd9dde00456cc5abf7e5ef0c8d7d6118 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============6306140301118202901==--

--===============1625681650==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1625681650==--
