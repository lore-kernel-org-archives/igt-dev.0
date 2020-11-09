Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 09 Nov 2020 17:11:37 -0000
Message-ID: <160494189751.18042.14154120179204455@emeril.freedesktop.org>
References: <20201109120632.389212-1-imre.deak@intel.com>
In-Reply-To: <20201109120632.389212-1-imre.deak@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliL2lu?=
 =?utf-8?q?tel=5Fbatchbuffer=3A_Fix_relocs_across_the_4GB_address_boundary?=
 =?utf-8?q?_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1223176303=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Imre Deak <imre.deak@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1223176303==
Content-Type: multipart/alternative;
 boundary="===============0391751712465166598=="

--===============0391751712465166598==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/intel_batchbuffer: Fix relocs across the 4GB address boundary (rev2)
URL   : https://patchwork.freedesktop.org/series/83644/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9296_full -> IGTPW_5146_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5146_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5146_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5146_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_plane_cursor@pipe-c-primary-size-128:
    - shard-glk:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-glk8/igt@kms_plane_cursor@pipe-c-primary-size-128.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-glk9/igt@kms_plane_cursor@pipe-c-primary-size-128.html

  
Known issues
------------

  Here are the changes found in IGTPW_5146_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@close-race:
    - shard-snb:          [PASS][3] -> [INCOMPLETE][4] ([i915#2650])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-snb7/igt@gem_busy@close-race.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-snb4/igt@gem_busy@close-race.html
    - shard-hsw:          [PASS][5] -> [FAIL][6] ([i915#1888])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-hsw5/igt@gem_busy@close-race.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-hsw4/igt@gem_busy@close-race.html

  * igt@gem_mmap_gtt@pf-nonblock:
    - shard-tglb:         [PASS][7] -> [DMESG-WARN][8] ([i915#1982]) +3 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-tglb7/igt@gem_mmap_gtt@pf-nonblock.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-tglb7/igt@gem_mmap_gtt@pf-nonblock.html

  * igt@gem_partial_pwrite_pread@reads:
    - shard-hsw:          [PASS][9] -> [FAIL][10] ([i915#1888] / [i915#2261])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-hsw5/igt@gem_partial_pwrite_pread@reads.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-hsw4/igt@gem_partial_pwrite_pread@reads.html

  * igt@gem_ppgtt@blt-vs-render-ctx0:
    - shard-snb:          [PASS][11] -> [INCOMPLETE][12] ([i915#2651])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-snb4/igt@gem_ppgtt@blt-vs-render-ctx0.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-snb2/igt@gem_ppgtt@blt-vs-render-ctx0.html

  * igt@gem_render_tiled_blits@basic:
    - shard-snb:          [PASS][13] -> [FAIL][14] ([i915#2656])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-snb5/igt@gem_render_tiled_blits@basic.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-snb2/igt@gem_render_tiled_blits@basic.html

  * igt@i915_pm_rpm@dpms-non-lpsp:
    - shard-kbl:          [PASS][15] -> [SKIP][16] ([fdo#109271])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-kbl7/igt@i915_pm_rpm@dpms-non-lpsp.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-kbl3/igt@i915_pm_rpm@dpms-non-lpsp.html
    - shard-apl:          [PASS][17] -> [SKIP][18] ([fdo#109271] / [i915#1635])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-apl4/igt@i915_pm_rpm@dpms-non-lpsp.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-apl8/igt@i915_pm_rpm@dpms-non-lpsp.html
    - shard-glk:          [PASS][19] -> [SKIP][20] ([fdo#109271])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-glk1/igt@i915_pm_rpm@dpms-non-lpsp.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-glk7/igt@i915_pm_rpm@dpms-non-lpsp.html

  * igt@kms_3d:
    - shard-tglb:         [PASS][21] -> [DMESG-WARN][22] ([i915#402])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-tglb1/igt@kms_3d.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-tglb6/igt@kms_3d.html

  * igt@kms_cursor_edge_walk@pipe-b-256x256-left-edge:
    - shard-glk:          [PASS][23] -> [DMESG-WARN][24] ([i915#1982]) +3 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-glk7/igt@kms_cursor_edge_walk@pipe-b-256x256-left-edge.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-glk3/igt@kms_cursor_edge_walk@pipe-b-256x256-left-edge.html

  * igt@kms_cursor_edge_walk@pipe-c-256x256-bottom-edge:
    - shard-apl:          [PASS][25] -> [DMESG-WARN][26] ([i915#1635] / [i915#1982]) +4 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-apl2/igt@kms_cursor_edge_walk@pipe-c-256x256-bottom-edge.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-apl7/igt@kms_cursor_edge_walk@pipe-c-256x256-bottom-edge.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-hsw:          [PASS][27] -> [FAIL][28] ([i915#96])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-hsw7/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-hsw6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_flip@2x-flip-vs-wf_vblank@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][29] -> [DMESG-WARN][30] ([i915#118] / [i915#95]) +3 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-glk4/igt@kms_flip@2x-flip-vs-wf_vblank@ab-hdmi-a1-hdmi-a2.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-glk9/igt@kms_flip@2x-flip-vs-wf_vblank@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@dpms-vs-vblank-race-interruptible@a-dp1:
    - shard-kbl:          [PASS][31] -> [DMESG-WARN][32] ([i915#1982]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-kbl1/igt@kms_flip@dpms-vs-vblank-race-interruptible@a-dp1.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-kbl4/igt@kms_flip@dpms-vs-vblank-race-interruptible@a-dp1.html

  * igt@kms_plane@plane-panning-bottom-right-pipe-a-planes:
    - shard-glk:          [PASS][33] -> [FAIL][34] ([i915#1036])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-glk4/igt@kms_plane@plane-panning-bottom-right-pipe-a-planes.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-glk9/igt@kms_plane@plane-panning-bottom-right-pipe-a-planes.html

  * igt@kms_plane_cursor@pipe-b-overlay-size-128:
    - shard-glk:          [PASS][35] -> [FAIL][36] ([i915#2657])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-glk4/igt@kms_plane_cursor@pipe-b-overlay-size-128.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-glk9/igt@kms_plane_cursor@pipe-b-overlay-size-128.html

  * igt@kms_properties@connector-properties-legacy:
    - shard-kbl:          [PASS][37] -> [DMESG-WARN][38] ([i915#165] / [i915#78])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-kbl3/igt@kms_properties@connector-properties-legacy.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-kbl2/igt@kms_properties@connector-properties-legacy.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [PASS][39] -> [SKIP][40] ([fdo#109642] / [fdo#111068])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-iclb2/igt@kms_psr2_su@page_flip.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-iclb8/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][41] -> [SKIP][42] ([fdo#109441]) +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-iclb8/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_setmode@basic:
    - shard-hsw:          [PASS][43] -> [FAIL][44] ([i915#31])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-hsw6/igt@kms_setmode@basic.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-hsw4/igt@kms_setmode@basic.html

  * igt@perf@enable-disable:
    - shard-iclb:         [PASS][45] -> [SKIP][46] ([i915#1354]) +2 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-iclb4/igt@perf@enable-disable.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-iclb1/igt@perf@enable-disable.html
    - shard-hsw:          [PASS][47] -> [SKIP][48] ([fdo#109271]) +3 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-hsw5/igt@perf@enable-disable.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-hsw6/igt@perf@enable-disable.html
    - shard-kbl:          [PASS][49] -> [SKIP][50] ([fdo#109271] / [i915#1354]) +2 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-kbl1/igt@perf@enable-disable.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-kbl3/igt@perf@enable-disable.html
    - shard-apl:          [PASS][51] -> [SKIP][52] ([fdo#109271] / [i915#1354] / [i915#1635]) +2 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-apl4/igt@perf@enable-disable.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-apl1/igt@perf@enable-disable.html

  * igt@perf@oa-exponents:
    - shard-tglb:         [PASS][53] -> [SKIP][54] ([i915#1354]) +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-tglb7/igt@perf@oa-exponents.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-tglb8/igt@perf@oa-exponents.html
    - shard-glk:          [PASS][55] -> [SKIP][56] ([fdo#109271] / [i915#1354]) +2 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-glk2/igt@perf@oa-exponents.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-glk2/igt@perf@oa-exponents.html

  
#### Possible fixes ####

  * {igt@core_hotunplug@hotrebind}:
    - shard-tglb:         [DMESG-WARN][57] ([i915#1982]) -> [PASS][58] +5 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-tglb6/igt@core_hotunplug@hotrebind.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-tglb8/igt@core_hotunplug@hotrebind.html

  * igt@gem_partial_pwrite_pread@reads-display:
    - shard-snb:          [INCOMPLETE][59] -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-snb5/igt@gem_partial_pwrite_pread@reads-display.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-snb7/igt@gem_partial_pwrite_pread@reads-display.html

  * igt@i915_pm_rpm@system-suspend-modeset:
    - shard-glk:          [SKIP][61] ([fdo#109271]) -> [PASS][62] +4 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-glk2/igt@i915_pm_rpm@system-suspend-modeset.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-glk7/igt@i915_pm_rpm@system-suspend-modeset.html
    - shard-iclb:         [SKIP][63] ([i915#579]) -> [PASS][64] +2 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-iclb2/igt@i915_pm_rpm@system-suspend-modeset.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-iclb5/igt@i915_pm_rpm@system-suspend-modeset.html
    - shard-apl:          [SKIP][65] ([fdo#109271] / [i915#1635]) -> [PASS][66] +4 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-apl8/igt@i915_pm_rpm@system-suspend-modeset.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-apl8/igt@i915_pm_rpm@system-suspend-modeset.html

  * igt@i915_suspend@forcewake:
    - shard-apl:          [INCOMPLETE][67] ([i915#1635]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-apl2/igt@i915_suspend@forcewake.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-apl2/igt@i915_suspend@forcewake.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-snb:          [FAIL][69] -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-snb5/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-snb2/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-apl:          [INCOMPLETE][71] ([i915#1635] / [i915#2635]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-apl8/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-apl7/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
    - shard-iclb:         [INCOMPLETE][73] ([i915#1185]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-iclb2/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-iclb6/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
    - shard-glk:          [INCOMPLETE][75] ([i915#2635]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-glk2/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-glk8/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
    - shard-hsw:          [INCOMPLETE][77] ([i915#2637]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-hsw1/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-hsw8/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
    - shard-kbl:          [INCOMPLETE][79] ([i915#155]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-kbl3/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-kbl4/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_cursor_edge_walk@pipe-a-256x256-left-edge:
    - shard-glk:          [DMESG-WARN][81] ([i915#1982]) -> [PASS][82] +4 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-glk5/igt@kms_cursor_edge_walk@pipe-a-256x256-left-edge.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-glk8/igt@kms_cursor_edge_walk@pipe-a-256x256-left-edge.html

  * igt@kms_cursor_edge_walk@pipe-c-256x256-right-edge:
    - shard-apl:          [DMESG-WARN][83] ([i915#1635] / [i915#1982]) -> [PASS][84] +4 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-apl2/igt@kms_cursor_edge_walk@pipe-c-256x256-right-edge.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-apl2/igt@kms_cursor_edge_walk@pipe-c-256x256-right-edge.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-legacy:
    - shard-hsw:          [INCOMPLETE][85] -> [PASS][86] +1 similar issue
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-hsw5/igt@kms_cursor_legacy@cursora-vs-flipa-legacy.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-hsw8/igt@kms_cursor_legacy@cursora-vs-flipa-legacy.html

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible@ab-vga1-hdmi-a1:
    - shard-hsw:          [DMESG-WARN][87] ([i915#1982]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-hsw1/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible@ab-vga1-hdmi-a1.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-hsw6/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible@ab-vga1-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:
    - shard-iclb:         [DMESG-WARN][89] ([i915#1982]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-iclb4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-badstride:
    - shard-snb:          [FAIL][91] ([i915#2546]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-snb5/igt@kms_frontbuffer_tracking@fbc-badstride.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-snb4/igt@kms_frontbuffer_tracking@fbc-badstride.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [SKIP][93] ([fdo#109441]) -> [PASS][94] +3 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-iclb5/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-glk:          [INCOMPLETE][95] -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-glk6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-glk3/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@kms_vblank@pipe-b-query-forked-busy-hang:
    - shard-hsw:          [DMESG-WARN][97] ([i915#44]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-hsw5/igt@kms_vblank@pipe-b-query-forked-busy-hang.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-hsw8/igt@kms_vblank@pipe-b-query-forked-busy-hang.html

  * igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm:
    - shard-hsw:          [SKIP][99] ([fdo#109271]) -> [PASS][100] +6 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-hsw1/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-hsw1/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html
    - shard-kbl:          [SKIP][101] ([fdo#109271]) -> [PASS][102] +4 similar issues
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-kbl3/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-kbl1/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html
    - shard-iclb:         [SKIP][103] ([fdo#109278]) -> [PASS][104] +1 similar issue
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-iclb2/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-iclb7/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html

  * igt@kms_vblank@pipe-c-wait-idle:
    - shard-kbl:          [DMESG-WARN][105] ([i915#1982]) -> [PASS][106] +5 similar issues
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-kbl6/igt@kms_vblank@pipe-c-wait-idle.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-kbl2/igt@kms_vblank@pipe-c-wait-idle.html

  * igt@perf@disabled-read-error:
    - shard-glk:          [SKIP][107] ([fdo#109271] / [i915#1354]) -> [PASS][108] +1 similar issue
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-glk9/igt@perf@disabled-read-error.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-glk6/igt@perf@disabled-read-error.html
    - shard-apl:          [SKIP][109] ([fdo#109271] / [i915#1354] / [i915#1635]) -> [PASS][110] +1 similar issue
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-apl3/igt@perf@disabled-read-error.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-apl3/igt@perf@disabled-read-error.html
    - shard-kbl:          [SKIP][111] ([fdo#109271] / [i915#1354]) -> [PASS][112] +1 similar issue
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-kbl2/igt@perf@disabled-read-error.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-kbl7/igt@perf@disabled-read-error.html
    - shard-tglb:         [SKIP][113] ([i915#1354]) -> [PASS][114] +1 similar issue
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-tglb6/igt@perf@disabled-read-error.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-tglb1/igt@perf@disabled-read-error.html

  * igt@perf@invalid-remove-userspace-config:
    - shard-iclb:         [SKIP][115] ([i915#1354]) -> [PASS][116] +1 similar issue
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-iclb6/igt@perf@invalid-remove-userspace-config.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-iclb5/igt@perf@invalid-remove-userspace-config.html

  
#### Warnings ####

  * igt@i915_pm_rpm@dpms-non-lpsp:
    - shard-tglb:         [SKIP][117] ([fdo#111644] / [i915#1397] / [i915#2411]) -> [SKIP][118] ([i915#579])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-tglb2/igt@i915_pm_rpm@dpms-non-lpsp.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-tglb6/igt@i915_pm_rpm@dpms-non-lpsp.html
    - shard-iclb:         [SKIP][119] ([fdo#110892]) -> [SKIP][120] ([i915#579])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-iclb3/igt@i915_pm_rpm@dpms-non-lpsp.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-iclb5/igt@i915_pm_rpm@dpms-non-lpsp.html

  * igt@i915_pm_rpm@gem-pread:
    - shard-tglb:         [SKIP][121] ([i915#579]) -> [DMESG-WARN][122] ([i915#2411]) +2 similar issues
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-tglb5/igt@i915_pm_rpm@gem-pread.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-tglb6/igt@i915_pm_rpm@gem-pread.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-tglb:         [INCOMPLETE][123] ([i915#1436] / [i915#1798] / [i915#1982] / [i915#456]) -> [DMESG-WARN][124] ([i915#2411])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-tglb7/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-tglb6/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [DMESG-WARN][125] ([i915#1226]) -> [SKIP][126] ([fdo#109349])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-iclb7/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-basic:
    - shard-apl:          [FAIL][127] ([fdo#108145] / [i915#1635] / [i915#265]) -> [DMESG-FAIL][128] ([fdo#108145] / [i915#1635] / [i915#1982])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-apl2/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-apl1/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html

  * igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm:
    - shard-tglb:         [SKIP][129] -> [DMESG-WARN][130] ([i915#2411]) +1 similar issue
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-tglb5/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-tglb1/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-tglb:         [INCOMPLETE][131] ([i915#1436] / [i915#456]) -> [DMESG-WARN][132] ([i915#2411])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-tglb8/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-tglb1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@perf@mi-rpc:
    - shard-tglb:         [SKIP][133] ([fdo#109289]) -> [SKIP][134] ([i915#1354])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-tglb1/igt@perf@mi-rpc.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-tglb3/igt@perf@mi-rpc.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110892]: https://bugs.freedesktop.org/show_bug.cgi?id=110892
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [i915#1036]: https://gitlab.freedesktop.org/drm/intel/issues/1036
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1185]: https://gitlab.freedesktop.org/drm/intel/issues/1185
  [i915#1226]: https://gitlab.freedesktop.org/drm/intel/issues/1226
  [i915#1354]: https://gitlab.freedesktop.org/drm/intel/issues/1354
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#165]: https://gitlab.freedesktop.org/drm/intel/issues/165
  [i915#1798]: https://gitlab.freedesktop.org/drm/intel/issues/1798
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2261]: https://gitlab.freedesktop.org/drm/intel/issues/2261
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2521]: https://gitlab.freedesktop.org/drm/intel/issues/2521
  [i915#2546]: https://gitlab.freedesktop.org/drm/intel/issues/2546
  [i915#2597]: https://gitlab.freedesktop.org/drm/intel/issues/2597
  [i915#2635]: https://gitlab.freedesktop.org/drm/intel/issues/2635
  [i915#2637]: https://gitlab.freedesktop.org/drm/intel/issues/2637
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#2650]: https://gitlab.freedesktop.org/drm/intel/issues/2650
  [i915#2651]: https://gitlab.freedesktop.org/drm/intel/issues/2651
  [i915#2656]: https://gitlab.freedesktop.org/drm/intel/issues/2656
  [i915#2657]: https://gitlab.freedesktop.org/drm/intel/issues/2657
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#44]: https://gitlab.freedesktop.org/drm/intel/issues/44
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#78]: https://gitlab.freedesktop.org/drm/intel/issues/78
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [i915#96]: https://gitlab.freedesktop.org/drm/intel/issues/96


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5839 -> IGTPW_5146
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_9296: 275f92f65fdb0df603309149a164b52611f64ce4 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5146: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/index.html
  IGT_5839: 2dbd64a6301e36eb432bc50ad7021fabaeebd1f4 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/index.html

--===============0391751712465166598==
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
<tr><td><b>Series:</b></td><td>lib/intel_batchbuffer: Fix relocs across the 4GB address boundary (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/83644/">https://patchwork.freedesktop.org/series/83644/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9296_full -&gt; IGTPW_5146_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5146_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5146_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5146_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_plane_cursor@pipe-c-primary-size-128:<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-glk8/igt@kms_plane_cursor@pipe-c-primary-size-128.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-glk9/igt@kms_plane_cursor@pipe-c-primary-size-128.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5146_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_busy@close-race:</p>
<ul>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-snb7/igt@gem_busy@close-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-snb4/igt@gem_busy@close-race.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2650">i915#2650</a>)</p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-hsw5/igt@gem_busy@close-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-hsw4/igt@gem_busy@close-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@pf-nonblock:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-tglb7/igt@gem_mmap_gtt@pf-nonblock.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-tglb7/igt@gem_mmap_gtt@pf-nonblock.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-hsw5/igt@gem_partial_pwrite_pread@reads.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-hsw4/igt@gem_partial_pwrite_pread@reads.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2261">i915#2261</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ppgtt@blt-vs-render-ctx0:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-snb4/igt@gem_ppgtt@blt-vs-render-ctx0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-snb2/igt@gem_ppgtt@blt-vs-render-ctx0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2651">i915#2651</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_tiled_blits@basic:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-snb5/igt@gem_render_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-snb2/igt@gem_render_tiled_blits@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2656">i915#2656</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-kbl7/igt@i915_pm_rpm@dpms-non-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-kbl3/igt@i915_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-apl4/igt@i915_pm_rpm@dpms-non-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-apl8/igt@i915_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-glk1/igt@i915_pm_rpm@dpms-non-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-glk7/igt@i915_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_3d:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-tglb1/igt@kms_3d.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-tglb6/igt@kms_3d.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-b-256x256-left-edge:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-glk7/igt@kms_cursor_edge_walk@pipe-b-256x256-left-edge.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-glk3/igt@kms_cursor_edge_walk@pipe-b-256x256-left-edge.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-c-256x256-bottom-edge:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-apl2/igt@kms_cursor_edge_walk@pipe-c-256x256-bottom-edge.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-apl7/igt@kms_cursor_edge_walk@pipe-c-256x256-bottom-edge.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-hsw7/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-hsw6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/96">i915#96</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-glk4/igt@kms_flip@2x-flip-vs-wf_vblank@ab-hdmi-a1-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-glk9/igt@kms_flip@2x-flip-vs-wf_vblank@ab-hdmi-a1-hdmi-a2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race-interruptible@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-kbl1/igt@kms_flip@dpms-vs-vblank-race-interruptible@a-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-kbl4/igt@kms_flip@dpms-vs-vblank-race-interruptible@a-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-pipe-a-planes:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-glk4/igt@kms_plane@plane-panning-bottom-right-pipe-a-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-glk9/igt@kms_plane@plane-panning-bottom-right-pipe-a-planes.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1036">i915#1036</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@pipe-b-overlay-size-128:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-glk4/igt@kms_plane_cursor@pipe-b-overlay-size-128.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-glk9/igt@kms_plane_cursor@pipe-b-overlay-size-128.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2657">i915#2657</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-legacy:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-kbl3/igt@kms_properties@connector-properties-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-kbl2/igt@kms_properties@connector-properties-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/165">i915#165</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/78">i915#78</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-iclb2/igt@kms_psr2_su@page_flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-iclb8/igt@kms_psr2_su@page_flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109642">fdo#109642</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111068">fdo#111068</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-iclb8/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-hsw6/igt@kms_setmode@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-hsw4/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/31">i915#31</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@enable-disable:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-iclb4/igt@perf@enable-disable.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-iclb1/igt@perf@enable-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) +2 similar issues</p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-hsw5/igt@perf@enable-disable.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-hsw6/igt@perf@enable-disable.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-kbl1/igt@perf@enable-disable.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-kbl3/igt@perf@enable-disable.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) +2 similar issues</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-apl4/igt@perf@enable-disable.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-apl1/igt@perf@enable-disable.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@perf@oa-exponents:</p>
<ul>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-tglb7/igt@perf@oa-exponents.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-tglb8/igt@perf@oa-exponents.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-glk2/igt@perf@oa-exponents.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-glk2/igt@perf@oa-exponents.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) +2 similar issues</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>{igt@core_hotunplug@hotrebind}:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-tglb6/igt@core_hotunplug@hotrebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-tglb8/igt@core_hotunplug@hotrebind.html">PASS</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads-display:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-snb5/igt@gem_partial_pwrite_pread@reads-display.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-snb7/igt@gem_partial_pwrite_pread@reads-display.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-glk2/igt@i915_pm_rpm@system-suspend-modeset.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-glk7/igt@i915_pm_rpm@system-suspend-modeset.html">PASS</a> +4 similar issues</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-iclb2/igt@i915_pm_rpm@system-suspend-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-iclb5/igt@i915_pm_rpm@system-suspend-modeset.html">PASS</a> +2 similar issues</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-apl8/igt@i915_pm_rpm@system-suspend-modeset.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-apl8/igt@i915_pm_rpm@system-suspend-modeset.html">PASS</a> +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-apl2/igt@i915_suspend@forcewake.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-apl2/igt@i915_suspend@forcewake.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-snb5/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-snb2/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-suspend:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-apl8/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2635">i915#2635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-apl7/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-iclb2/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1185">i915#1185</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-iclb6/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-glk2/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2635">i915#2635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-glk8/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-hsw1/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2637">i915#2637</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-hsw8/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-kbl3/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-kbl4/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-a-256x256-left-edge:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-glk5/igt@kms_cursor_edge_walk@pipe-a-256x256-left-edge.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-glk8/igt@kms_cursor_edge_walk@pipe-a-256x256-left-edge.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-c-256x256-right-edge:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-apl2/igt@kms_cursor_edge_walk@pipe-c-256x256-right-edge.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-apl2/igt@kms_cursor_edge_walk@pipe-c-256x256-right-edge.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipa-legacy:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-hsw5/igt@kms_cursor_legacy@cursora-vs-flipa-legacy.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-hsw8/igt@kms_cursor_legacy@cursora-vs-flipa-legacy.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race-interruptible@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-hsw1/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible@ab-vga1-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-hsw6/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible@ab-vga1-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-iclb4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-badstride:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-snb5/igt@kms_frontbuffer_tracking@fbc-badstride.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2546">i915#2546</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-snb4/igt@kms_frontbuffer_tracking@fbc-badstride.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-iclb5/igt@kms_psr@psr2_cursor_mmap_cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-suspend:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-glk6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-glk3/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-query-forked-busy-hang:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-hsw5/igt@kms_vblank@pipe-b-query-forked-busy-hang.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/44">i915#44</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-hsw8/igt@kms_vblank@pipe-b-query-forked-busy-hang.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-hsw1/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-hsw1/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html">PASS</a> +6 similar issues</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-kbl3/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-kbl1/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html">PASS</a> +4 similar issues</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-iclb2/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-iclb7/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html">PASS</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-wait-idle:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-kbl6/igt@kms_vblank@pipe-c-wait-idle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-kbl2/igt@kms_vblank@pipe-c-wait-idle.html">PASS</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf@disabled-read-error:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-glk9/igt@perf@disabled-read-error.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-glk6/igt@perf@disabled-read-error.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-apl3/igt@perf@disabled-read-error.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-apl3/igt@perf@disabled-read-error.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-kbl2/igt@perf@disabled-read-error.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-kbl7/igt@perf@disabled-read-error.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-tglb6/igt@perf@disabled-read-error.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-tglb1/igt@perf@disabled-read-error.html">PASS</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@perf@invalid-remove-userspace-config:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-iclb6/igt@perf@invalid-remove-userspace-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-iclb5/igt@perf@invalid-remove-userspace-config.html">PASS</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-tglb2/igt@i915_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111644">fdo#111644</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-tglb6/igt@i915_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-iclb3/igt@i915_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110892">fdo#110892</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-iclb5/igt@i915_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-pread:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-tglb5/igt@i915_pm_rpm@gem-pread.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-tglb6/igt@i915_pm_rpm@gem-pread.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-suspend:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-tglb7/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1798">i915#1798</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/456">i915#456</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-tglb6/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_dsc@basic-dsc-enable-edp:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1226">i915#1226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-iclb7/igt@kms_dp_dsc@basic-dsc-enable-edp.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109349">fdo#109349</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-basic:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-apl2/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=108145">fdo#108145</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/265">i915#265</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-apl1/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html">DMESG-FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=108145">fdo#108145</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-tglb5/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-tglb1/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-suspend:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-tglb8/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/456">i915#456</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-tglb1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@mi-rpc:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9296/shard-tglb1/igt@perf@mi-rpc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/shard-tglb3/igt@perf@mi-rpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>)</li>
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
<li>IGT: IGT_5839 -&gt; IGTPW_5146</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9296: 275f92f65fdb0df603309149a164b52611f64ce4 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5146: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5146/index.html<br />
  IGT_5839: 2dbd64a6301e36eb432bc50ad7021fabaeebd1f4 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============0391751712465166598==--

--===============1223176303==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1223176303==--
