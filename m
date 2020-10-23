Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 23 Oct 2020 16:22:06 -0000
Message-ID: <160347012685.1406.7591020603868471734@emeril.freedesktop.org>
References: <20201023130526.3983076-1-mika.kahola@intel.com>
In-Reply-To: <20201023130526.3983076-1-mika.kahola@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fccs=3A_CCS_Clear_Color_test_=28rev8=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1979702132=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mika Kahola <mika.kahola@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1979702132==
Content-Type: multipart/alternative;
 boundary="===============5990051839088652213=="

--===============5990051839088652213==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_ccs: CCS Clear Color test (rev8)
URL   : https://patchwork.freedesktop.org/series/76536/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5823_full -> IGTPW_5093_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5093_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5093_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5093/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5093_full:

### IGT changes ###

#### Possible regressions ####

  * igt@api_intel_bb@render-ccs:
    - shard-iclb:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-iclb3/igt@api_intel_bb@render-ccs.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5093/shard-iclb6/igt@api_intel_bb@render-ccs.html

  * igt@kms_plane_lowres@pipe-c-tiling-none:
    - shard-hsw:          [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-hsw2/igt@kms_plane_lowres@pipe-c-tiling-none.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5093/shard-hsw5/igt@kms_plane_lowres@pipe-c-tiling-none.html

  
#### Warnings ####

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-hsw:          [WARN][5] ([i915#2283]) -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-hsw4/igt@core_hotunplug@hotrebind-lateclose.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5093/shard-hsw7/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@kms_content_protection@uevent:
    - shard-kbl:          [FAIL][7] ([i915#2105]) -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-kbl6/igt@kms_content_protection@uevent.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5093/shard-kbl7/igt@kms_content_protection@uevent.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@core_hotunplug@hotrebind}:
    - shard-hsw:          NOTRUN -> [WARN][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5093/shard-hsw6/igt@core_hotunplug@hotrebind.html

  
Known issues
------------

  Here are the changes found in IGTPW_5093_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-hsw:          [PASS][10] -> [FAIL][11] ([i915#2389])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-hsw8/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5093/shard-hsw6/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gem_exec_reloc@basic-many-active@vecs0:
    - shard-glk:          [PASS][12] -> [FAIL][13] ([i915#2389]) +2 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-glk6/igt@gem_exec_reloc@basic-many-active@vecs0.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5093/shard-glk1/igt@gem_exec_reloc@basic-many-active@vecs0.html

  * igt@gem_exec_whisper@basic-queues-forked:
    - shard-glk:          [PASS][14] -> [DMESG-WARN][15] ([i915#118] / [i915#95])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-glk4/igt@gem_exec_whisper@basic-queues-forked.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5093/shard-glk6/igt@gem_exec_whisper@basic-queues-forked.html

  * igt@i915_pm_rpm@system-suspend:
    - shard-kbl:          [PASS][16] -> [INCOMPLETE][17] ([i915#151] / [i915#155])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-kbl1/igt@i915_pm_rpm@system-suspend.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5093/shard-kbl1/igt@i915_pm_rpm@system-suspend.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-iclb:         [PASS][18] -> [DMESG-WARN][19] ([i915#1982])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-iclb7/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5093/shard-iclb3/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-b-cursor-256x85-sliding:
    - shard-kbl:          [PASS][20] -> [FAIL][21] ([i915#54])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-kbl1/igt@kms_cursor_crc@pipe-b-cursor-256x85-sliding.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5093/shard-kbl7/igt@kms_cursor_crc@pipe-b-cursor-256x85-sliding.html
    - shard-apl:          [PASS][22] -> [FAIL][23] ([i915#1635] / [i915#54])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-apl6/igt@kms_cursor_crc@pipe-b-cursor-256x85-sliding.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5093/shard-apl8/igt@kms_cursor_crc@pipe-b-cursor-256x85-sliding.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-hsw:          [PASS][24] -> [FAIL][25] ([i915#96])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-hsw5/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5093/shard-hsw6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-render-ytiled:
    - shard-apl:          [PASS][26] -> [DMESG-WARN][27] ([i915#1635] / [i915#1982])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-apl4/igt@kms_draw_crc@draw-method-xrgb2101010-render-ytiled.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5093/shard-apl8/igt@kms_draw_crc@draw-method-xrgb2101010-render-ytiled.html

  * igt@kms_flip@2x-dpms-vs-vblank-race@ab-vga1-hdmi-a1:
    - shard-hsw:          [PASS][28] -> [DMESG-WARN][29] ([i915#1982])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-hsw4/igt@kms_flip@2x-dpms-vs-vblank-race@ab-vga1-hdmi-a1.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5093/shard-hsw1/igt@kms_flip@2x-dpms-vs-vblank-race@ab-vga1-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-cpu:
    - shard-snb:          [PASS][30] -> [FAIL][31] ([i915#2546]) +1 similar issue
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-snb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-cpu.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5093/shard-snb5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt:
    - shard-tglb:         [PASS][32] -> [DMESG-WARN][33] ([i915#1982]) +3 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-tglb7/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5093/shard-tglb7/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt.html

  * igt@kms_plane_lowres@pipe-b-tiling-y:
    - shard-kbl:          [PASS][34] -> [DMESG-WARN][35] ([i915#165] / [i915#78])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-kbl7/igt@kms_plane_lowres@pipe-b-tiling-y.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5093/shard-kbl2/igt@kms_plane_lowres@pipe-b-tiling-y.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [PASS][36] -> [SKIP][37] ([fdo#109441]) +1 similar issue
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-iclb2/igt@kms_psr@psr2_cursor_render.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5093/shard-iclb8/igt@kms_psr@psr2_cursor_render.html

  * igt@perf@buffer-fill:
    - shard-kbl:          [PASS][38] -> [SKIP][39] ([fdo#109271] / [i915#1354])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-kbl4/igt@perf@buffer-fill.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5093/shard-kbl1/igt@perf@buffer-fill.html
    - shard-tglb:         [PASS][40] -> [SKIP][41] ([i915#1354])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-tglb1/igt@perf@buffer-fill.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5093/shard-tglb7/igt@perf@buffer-fill.html
    - shard-apl:          [PASS][42] -> [SKIP][43] ([fdo#109271] / [i915#1354] / [i915#1635])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-apl6/igt@perf@buffer-fill.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5093/shard-apl4/igt@perf@buffer-fill.html
    - shard-glk:          [PASS][44] -> [SKIP][45] ([fdo#109271] / [i915#1354])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-glk4/igt@perf@buffer-fill.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5093/shard-glk5/igt@perf@buffer-fill.html
    - shard-iclb:         [PASS][46] -> [SKIP][47] ([i915#1354])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-iclb4/igt@perf@buffer-fill.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5093/shard-iclb7/igt@perf@buffer-fill.html

  
#### Possible fixes ####

  * igt@gem_exec_fence@long-history:
    - shard-kbl:          [INCOMPLETE][48] ([CI#80]) -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-kbl7/igt@gem_exec_fence@long-history.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5093/shard-kbl2/igt@gem_exec_fence@long-history.html

  * igt@gem_exec_whisper@basic-contexts-all:
    - shard-glk:          [DMESG-WARN][50] ([i915#118] / [i915#95]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-glk9/igt@gem_exec_whisper@basic-contexts-all.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5093/shard-glk1/igt@gem_exec_whisper@basic-contexts-all.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][52] ([i915#454]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-iclb8/igt@i915_pm_dc@dc6-psr.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5093/shard-iclb5/igt@i915_pm_dc@dc6-psr.html

  * {igt@kms_async_flips@async-flip-with-page-flip-events}:
    - shard-kbl:          [FAIL][54] ([i915#2521]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-kbl4/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5093/shard-kbl2/igt@kms_async_flips@async-flip-with-page-flip-events.html
    - shard-tglb:         [FAIL][56] ([i915#2521]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-tglb1/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5093/shard-tglb8/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_cursor_edge_walk@pipe-c-64x64-right-edge:
    - shard-glk:          [DMESG-WARN][58] ([i915#1982]) -> [PASS][59] +1 similar issue
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-glk6/igt@kms_cursor_edge_walk@pipe-c-64x64-right-edge.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5093/shard-glk7/igt@kms_cursor_edge_walk@pipe-c-64x64-right-edge.html

  * igt@kms_draw_crc@draw-method-rgb565-render-xtiled:
    - shard-apl:          [DMESG-WARN][60] ([i915#1635] / [i915#1982]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-apl2/igt@kms_draw_crc@draw-method-rgb565-render-xtiled.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5093/shard-apl6/igt@kms_draw_crc@draw-method-rgb565-render-xtiled.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-cpu:
    - shard-glk:          [FAIL][62] ([i915#49]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-cpu.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5093/shard-glk3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy:
    - shard-tglb:         [DMESG-WARN][64] ([i915#1982]) -> [PASS][65] +4 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5093/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy.html

  * igt@kms_psr@psr2_cursor_blt:
    - shard-iclb:         [SKIP][66] ([fdo#109441]) -> [PASS][67] +2 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-iclb3/igt@kms_psr@psr2_cursor_blt.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5093/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-snb:          [SKIP][68] ([fdo#109271]) -> [INCOMPLETE][69] ([i915#82])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-snb4/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5093/shard-snb4/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_content_protection@lic:
    - shard-apl:          [FAIL][70] ([fdo#110321] / [i915#1635]) -> [TIMEOUT][71] ([i915#1319] / [i915#1635])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-apl1/igt@kms_content_protection@lic.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5093/shard-apl7/igt@kms_content_protection@lic.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [SKIP][72] ([fdo#109349]) -> [DMESG-WARN][73] ([i915#1226])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-iclb4/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5093/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1226]: https://gitlab.freedesktop.org/drm/intel/issues/1226
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1354]: https://gitlab.freedesktop.org/drm/intel/issues/1354
  [i915#151]: https://gitlab.freedesktop.org/drm/intel/issues/151
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#165]: https://gitlab.freedesktop.org/drm/intel/issues/165
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2105]: https://gitlab.freedesktop.org/drm/intel/issues/2105
  [i915#2283]: https://gitlab.freedesktop.org/drm/intel/issues/2283
  [i915#2389]: https://gitlab.freedesktop.org/drm/intel/issues/2389
  [i915#2521]: https://gitlab.freedesktop.org/drm/intel/issues/2521
  [i915#2546]: https://gitlab.freedesktop.org/drm/intel/issues/2546
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#78]: https://gitlab.freedesktop.org/drm/intel/issues/78
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [i915#96]: https://gitlab.freedesktop.org/drm/intel/issues/96


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5823 -> IGTPW_5093

  CI-20190529: 20190529
  CI_DRM_9190: a3d535579dd93942862b867b4452ba11e4f6bbb1 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5093: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5093/index.html
  IGT_5823: 7dd2fe99bd9dde00456cc5abf7e5ef0c8d7d6118 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5093/index.html

--===============5990051839088652213==
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
<tr><td><b>Series:</b></td><td>tests/kms_ccs: CCS Clear Color test (rev8)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/76536/">https://patchwork.freedesktop.org/series/76536/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5093/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5093/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_5823_full -&gt; IGTPW_5093_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5093_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5093_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5093/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5093_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@api_intel_bb@render-ccs:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-iclb3/igt@api_intel_bb@render-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5093/shard-iclb6/igt@api_intel_bb@render-ccs.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-c-tiling-none:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-hsw2/igt@kms_plane_lowres@pipe-c-tiling-none.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5093/shard-hsw5/igt@kms_plane_lowres@pipe-c-tiling-none.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-hsw4/igt@core_hotunplug@hotrebind-lateclose.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2283">i915#2283</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5093/shard-hsw7/igt@core_hotunplug@hotrebind-lateclose.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-kbl6/igt@kms_content_protection@uevent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2105">i915#2105</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5093/shard-kbl7/igt@kms_content_protection@uevent.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@core_hotunplug@hotrebind}:<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5093/shard-hsw6/igt@core_hotunplug@hotrebind.html">WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5093_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-hsw8/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5093/shard-hsw6/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@vecs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-glk6/igt@gem_exec_reloc@basic-many-active@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5093/shard-glk1/igt@gem_exec_reloc@basic-many-active@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-forked:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-glk4/igt@gem_exec_whisper@basic-queues-forked.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5093/shard-glk6/igt@gem_exec_whisper@basic-queues-forked.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-kbl1/igt@i915_pm_rpm@system-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5093/shard-kbl1/igt@i915_pm_rpm@system-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/151">i915#151</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-iclb7/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5093/shard-iclb3/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-256x85-sliding:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-kbl1/igt@kms_cursor_crc@pipe-b-cursor-256x85-sliding.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5093/shard-kbl7/igt@kms_cursor_crc@pipe-b-cursor-256x85-sliding.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>)</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-apl6/igt@kms_cursor_crc@pipe-b-cursor-256x85-sliding.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5093/shard-apl8/igt@kms_cursor_crc@pipe-b-cursor-256x85-sliding.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-hsw5/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5093/shard-hsw6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/96">i915#96</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-render-ytiled:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-apl4/igt@kms_draw_crc@draw-method-xrgb2101010-render-ytiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5093/shard-apl8/igt@kms_draw_crc@draw-method-xrgb2101010-render-ytiled.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-hsw4/igt@kms_flip@2x-dpms-vs-vblank-race@ab-vga1-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5093/shard-hsw1/igt@kms_flip@2x-dpms-vs-vblank-race@ab-vga1-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-snb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-cpu.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5093/shard-snb5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-cpu.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2546">i915#2546</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-tglb7/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5093/shard-tglb7/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-b-tiling-y:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-kbl7/igt@kms_plane_lowres@pipe-b-tiling-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5093/shard-kbl2/igt@kms_plane_lowres@pipe-b-tiling-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/165">i915#165</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/78">i915#78</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_render:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-iclb2/igt@kms_psr@psr2_cursor_render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5093/shard-iclb8/igt@kms_psr@psr2_cursor_render.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@perf@buffer-fill:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-kbl4/igt@perf@buffer-fill.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5093/shard-kbl1/igt@perf@buffer-fill.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-tglb1/igt@perf@buffer-fill.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5093/shard-tglb7/igt@perf@buffer-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>)</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-apl6/igt@perf@buffer-fill.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5093/shard-apl4/igt@perf@buffer-fill.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-glk4/igt@perf@buffer-fill.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5093/shard-glk5/igt@perf@buffer-fill.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-iclb4/igt@perf@buffer-fill.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5093/shard-iclb7/igt@perf@buffer-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_fence@long-history:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-kbl7/igt@gem_exec_fence@long-history.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80">CI#80</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5093/shard-kbl2/igt@gem_exec_fence@long-history.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-glk9/igt@gem_exec_whisper@basic-contexts-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5093/shard-glk1/igt@gem_exec_whisper@basic-contexts-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-iclb8/igt@i915_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5093/shard-iclb5/igt@i915_pm_dc@dc6-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_async_flips@async-flip-with-page-flip-events}:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-kbl4/igt@kms_async_flips@async-flip-with-page-flip-events.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2521">i915#2521</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5093/shard-kbl2/igt@kms_async_flips@async-flip-with-page-flip-events.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-tglb1/igt@kms_async_flips@async-flip-with-page-flip-events.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2521">i915#2521</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5093/shard-tglb8/igt@kms_async_flips@async-flip-with-page-flip-events.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-c-64x64-right-edge:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-glk6/igt@kms_cursor_edge_walk@pipe-c-64x64-right-edge.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5093/shard-glk7/igt@kms_cursor_edge_walk@pipe-c-64x64-right-edge.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-render-xtiled:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-apl2/igt@kms_draw_crc@draw-method-rgb565-render-xtiled.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5093/shard-apl6/igt@kms_draw_crc@draw-method-rgb565-render-xtiled.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-cpu.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/49">i915#49</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5093/shard-glk3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-cpu.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5093/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_blt:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-iclb3/igt@kms_psr@psr2_cursor_blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5093/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html">PASS</a> +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-snb4/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5093/shard-snb4/igt@i915_pm_dc@dc3co-vpb-simulation.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/82">i915#82</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-apl1/igt@kms_content_protection@lic.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110321">fdo#110321</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5093/shard-apl7/igt@kms_content_protection@lic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1319">i915#1319</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_dsc@basic-dsc-enable-edp:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5823/shard-iclb4/igt@kms_dp_dsc@basic-dsc-enable-edp.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109349">fdo#109349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5093/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1226">i915#1226</a>)</li>
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
<li>IGT: IGT_5823 -&gt; IGTPW_5093</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9190: a3d535579dd93942862b867b4452ba11e4f6bbb1 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5093: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5093/index.html<br />
  IGT_5823: 7dd2fe99bd9dde00456cc5abf7e5ef0c8d7d6118 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============5990051839088652213==--

--===============1979702132==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1979702132==--
