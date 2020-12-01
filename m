Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 01 Dec 2020 03:26:43 -0000
Message-ID: <160679320376.6992.13781380257784286614@emeril.freedesktop.org>
References: <20201130020302.24843-1-arjun.melkaveri@intel.com>
In-Reply-To: <20201130020302.24843-1-arjun.melkaveri@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgZ2VtX2V4?=
 =?utf-8?q?ec=5Freloc_=26_gem=5Fshrink=3A_Added_gem=5Frequire=5Fmappable?=
 =?utf-8?q?=5Fggtt_to_check_mappable_aperture?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0274942523=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Arjun Melkaveri <arjun.melkaveri@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0274942523==
Content-Type: multipart/alternative;
 boundary="===============6258024088797503965=="

--===============6258024088797503965==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: gem_exec_reloc & gem_shrink: Added gem_require_mappable_ggtt to check mappable aperture
URL   : https://patchwork.freedesktop.org/series/84387/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9404_full -> IGTPW_5238_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5238_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5238_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5238/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5238_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_reloc@basic-wide-active@bcs0:
    - shard-glk:          NOTRUN -> [FAIL][1] +3 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5238/shard-glk5/igt@gem_exec_reloc@basic-wide-active@bcs0.html

  
Known issues
------------

  Here are the changes found in IGTPW_5238_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_gttfill@all:
    - shard-glk:          [PASS][2] -> [DMESG-WARN][3] ([i915#118] / [i915#95])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9404/shard-glk1/igt@gem_exec_gttfill@all.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5238/shard-glk7/igt@gem_exec_gttfill@all.html

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-hsw:          [PASS][4] -> [FAIL][5] ([i915#2389])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9404/shard-hsw6/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5238/shard-hsw4/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglb:         [PASS][6] -> [SKIP][7] ([i915#2190])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9404/shard-tglb3/igt@gem_huc_copy@huc-copy.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5238/shard-tglb6/igt@gem_huc_copy@huc-copy.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-tglb:         [PASS][8] -> [INCOMPLETE][9] ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2411] / [i915#456])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9404/shard-tglb3/igt@i915_suspend@fence-restore-tiled2untiled.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5238/shard-tglb3/igt@i915_suspend@fence-restore-tiled2untiled.html
    - shard-apl:          [PASS][10] -> [INCOMPLETE][11] ([i915#2635])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9404/shard-apl2/igt@i915_suspend@fence-restore-tiled2untiled.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5238/shard-apl6/igt@i915_suspend@fence-restore-tiled2untiled.html
    - shard-iclb:         [PASS][12] -> [INCOMPLETE][13] ([i915#1185])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9404/shard-iclb8/igt@i915_suspend@fence-restore-tiled2untiled.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5238/shard-iclb2/igt@i915_suspend@fence-restore-tiled2untiled.html
    - shard-kbl:          [PASS][14] -> [INCOMPLETE][15] ([i915#155] / [i915#794])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9404/shard-kbl2/igt@i915_suspend@fence-restore-tiled2untiled.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5238/shard-kbl4/igt@i915_suspend@fence-restore-tiled2untiled.html
    - shard-hsw:          [PASS][16] -> [INCOMPLETE][17] ([i915#2055] / [i915#2637])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9404/shard-hsw4/igt@i915_suspend@fence-restore-tiled2untiled.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5238/shard-hsw6/igt@i915_suspend@fence-restore-tiled2untiled.html
    - shard-glk:          [PASS][18] -> [INCOMPLETE][19] ([i915#2199] / [i915#2635])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9404/shard-glk3/igt@i915_suspend@fence-restore-tiled2untiled.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5238/shard-glk1/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-iclb:         [PASS][20] -> [FAIL][21] ([i915#1119])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9404/shard-iclb8/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5238/shard-iclb5/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_cursor_edge_walk@pipe-b-64x64-left-edge:
    - shard-apl:          [PASS][22] -> [DMESG-WARN][23] ([i915#1982]) +5 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9404/shard-apl1/igt@kms_cursor_edge_walk@pipe-b-64x64-left-edge.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5238/shard-apl3/igt@kms_cursor_edge_walk@pipe-b-64x64-left-edge.html
    - shard-glk:          [PASS][24] -> [DMESG-WARN][25] ([i915#1982]) +2 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9404/shard-glk5/igt@kms_cursor_edge_walk@pipe-b-64x64-left-edge.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5238/shard-glk6/igt@kms_cursor_edge_walk@pipe-b-64x64-left-edge.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [PASS][26] -> [FAIL][27] ([i915#72])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9404/shard-glk9/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5238/shard-glk8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
    - shard-tglb:         [PASS][28] -> [FAIL][29] ([i915#2346])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9404/shard-tglb2/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5238/shard-tglb6/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1:
    - shard-tglb:         [PASS][30] -> [FAIL][31] ([i915#2122])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9404/shard-tglb2/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5238/shard-tglb6/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc:
    - shard-kbl:          [PASS][32] -> [DMESG-WARN][33] ([i915#1982]) +1 similar issue
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9404/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5238/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-wc:
    - shard-tglb:         [PASS][34] -> [DMESG-WARN][35] ([i915#1982])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9404/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-wc.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5238/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-cpu:
    - shard-iclb:         [PASS][36] -> [DMESG-WARN][37] ([i915#1982]) +1 similar issue
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9404/shard-iclb7/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-cpu.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5238/shard-iclb1/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-cpu.html

  * igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-c:
    - shard-hsw:          [PASS][38] -> [DMESG-WARN][39] ([i915#1982]) +1 similar issue
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9404/shard-hsw6/igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-c.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5238/shard-hsw6/igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-c.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [PASS][40] -> [SKIP][41] ([fdo#109441])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9404/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5238/shard-iclb1/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@testdisplay:
    - shard-kbl:          [PASS][42] -> [DMESG-WARN][43] ([i915#165] / [i915#78]) +1 similar issue
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9404/shard-kbl4/igt@testdisplay.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5238/shard-kbl2/igt@testdisplay.html

  
#### Possible fixes ####

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-glk:          [FAIL][44] ([i915#2389]) -> [PASS][45]
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9404/shard-glk8/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5238/shard-glk6/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-hsw:          [WARN][46] ([i915#1519]) -> [PASS][47]
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9404/shard-hsw4/igt@i915_pm_rc6_residency@rc6-idle.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5238/shard-hsw4/igt@i915_pm_rc6_residency@rc6-idle.html

  * {igt@kms_async_flips@alternate-sync-async-flip}:
    - shard-tglb:         [FAIL][48] ([i915#2521]) -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9404/shard-tglb3/igt@kms_async_flips@alternate-sync-async-flip.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5238/shard-tglb3/igt@kms_async_flips@alternate-sync-async-flip.html

  * {igt@kms_async_flips@test-time-stamp}:
    - shard-tglb:         [FAIL][50] ([i915#2597]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9404/shard-tglb8/igt@kms_async_flips@test-time-stamp.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5238/shard-tglb6/igt@kms_async_flips@test-time-stamp.html

  * igt@kms_big_fb@linear-8bpp-rotate-180:
    - shard-apl:          [DMESG-WARN][52] ([i915#1982]) -> [PASS][53] +5 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9404/shard-apl6/igt@kms_big_fb@linear-8bpp-rotate-180.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5238/shard-apl6/igt@kms_big_fb@linear-8bpp-rotate-180.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ac-vga1-hdmi-a1:
    - shard-hsw:          [FAIL][54] ([i915#2122]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9404/shard-hsw6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ac-vga1-hdmi-a1.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5238/shard-hsw4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ac-vga1-hdmi-a1.html

  * igt@kms_flip@2x-plain-flip@ab-vga1-hdmi-a1:
    - shard-hsw:          [DMESG-WARN][56] ([i915#1982]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9404/shard-hsw6/igt@kms_flip@2x-plain-flip@ab-vga1-hdmi-a1.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5238/shard-hsw6/igt@kms_flip@2x-plain-flip@ab-vga1-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-badstride:
    - shard-glk:          [DMESG-WARN][58] ([i915#1982]) -> [PASS][59] +5 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9404/shard-glk9/igt@kms_frontbuffer_tracking@fbc-badstride.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5238/shard-glk1/igt@kms_frontbuffer_tracking@fbc-badstride.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-tglb:         [DMESG-WARN][60] ([i915#1982]) -> [PASS][61] +4 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9404/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5238/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt:
    - shard-iclb:         [DMESG-WARN][62] ([i915#1982]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9404/shard-iclb3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5238/shard-iclb2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][64] ([fdo#109441]) -> [PASS][65] +1 similar issue
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9404/shard-iclb6/igt@kms_psr@psr2_sprite_plane_move.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5238/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_vblank@pipe-b-wait-forked-busy:
    - shard-kbl:          [DMESG-WARN][66] ([i915#1982]) -> [PASS][67] +3 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9404/shard-kbl1/igt@kms_vblank@pipe-b-wait-forked-busy.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5238/shard-kbl2/igt@kms_vblank@pipe-b-wait-forked-busy.html

  * igt@perf_pmu@module-unload:
    - shard-apl:          [DMESG-WARN][68] ([i915#1982] / [i915#262]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9404/shard-apl6/igt@perf_pmu@module-unload.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5238/shard-apl3/igt@perf_pmu@module-unload.html

  
#### Warnings ####

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-iclb:         [WARN][70] ([i915#1804] / [i915#2684]) -> [WARN][71] ([i915#2681] / [i915#2684])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9404/shard-iclb3/igt@i915_pm_rc6_residency@rc6-fence.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5238/shard-iclb1/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:
    - shard-apl:          [DMESG-FAIL][72] ([fdo#108145] / [i915#1982]) -> [FAIL][73] ([fdo#108145] / [i915#265])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9404/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5238/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html

  * igt@runner@aborted:
    - shard-iclb:         [FAIL][74] ([i915#2295] / [i915#2722]) -> ([FAIL][75], [FAIL][76]) ([i915#2295] / [i915#2722] / [i915#483])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9404/shard-iclb4/igt@runner@aborted.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5238/shard-iclb7/igt@runner@aborted.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5238/shard-iclb2/igt@runner@aborted.html
    - shard-glk:          ([FAIL][77], [FAIL][78]) ([i915#1814] / [i915#2295] / [i915#2722] / [k.org#202321]) -> ([FAIL][79], [FAIL][80]) ([i915#2295] / [i915#2722] / [k.org#202321])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9404/shard-glk8/igt@runner@aborted.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9404/shard-glk2/igt@runner@aborted.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5238/shard-glk1/igt@runner@aborted.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5238/shard-glk8/igt@runner@aborted.html
    - shard-tglb:         [FAIL][81] ([i915#2295] / [i915#2722]) -> ([FAIL][82], [FAIL][83]) ([i915#1602] / [i915#2295] / [i915#2722])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9404/shard-tglb6/igt@runner@aborted.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5238/shard-tglb3/igt@runner@aborted.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5238/shard-tglb3/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1185]: https://gitlab.freedesktop.org/drm/intel/issues/1185
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1519]: https://gitlab.freedesktop.org/drm/intel/issues/1519
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#165]: https://gitlab.freedesktop.org/drm/intel/issues/165
  [i915#1804]: https://gitlab.freedesktop.org/drm/intel/issues/1804
  [i915#1814]: https://gitlab.freedesktop.org/drm/intel/issues/1814
  [i915#1887]: https://gitlab.freedesktop.org/drm/intel/issues/1887
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2055]: https://gitlab.freedesktop.org/drm/intel/issues/2055
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2199]: https://gitlab.freedesktop.org/drm/intel/issues/2199
  [i915#2295]: https://gitlab.freedesktop.org/drm/intel/issues/2295
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2389]: https://gitlab.freedesktop.org/drm/intel/issues/2389
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2521]: https://gitlab.freedesktop.org/drm/intel/issues/2521
  [i915#2597]: https://gitlab.freedesktop.org/drm/intel/issues/2597
  [i915#262]: https://gitlab.freedesktop.org/drm/intel/issues/262
  [i915#2635]: https://gitlab.freedesktop.org/drm/intel/issues/2635
  [i915#2637]: https://gitlab.freedesktop.org/drm/intel/issues/2637
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2684]: https://gitlab.freedesktop.org/drm/intel/issues/2684
  [i915#2722]: https://gitlab.freedesktop.org/drm/intel/issues/2722
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#483]: https://gitlab.freedesktop.org/drm/intel/issues/483
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#78]: https://gitlab.freedesktop.org/drm/intel/issues/78
  [i915#794]: https://gitlab.freedesktop.org/drm/intel/issues/794
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [k.org#202321]: https://bugzilla.kernel.org/show_bug.cgi?id=202321


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5876 -> IGTPW_5238
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_9404: f515fa81d87ef367735d3a57a002fc72c8e55909 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5238: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5238/index.html
  IGT_5876: cf2f41b3d3dfabaf3a4837062f996f3491a350b1 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5238/index.html

--===============6258024088797503965==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


<!DOCTYPE html>
<html xmlns=3D"http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8"/>
  <title>Project List - Patchwork</title>
  <style id=3D"css-table-select" type=3D"text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>gem_exec_reloc &amp; gem_shrink: Added gem_r=
equire_mappable_ggtt to check mappable aperture</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/84387/">https://patchwork.freedesktop.org/series/84387/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5238/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5238/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9404_full -&gt; IGTPW_5238_full</h=
1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5238_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_5238_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5238/index.=
html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5238=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@gem_exec_reloc@basic-wide-active@bcs0:<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5238/shard-glk5/igt@gem_exec_reloc@basic-wide-active@bc=
s0.html">FAIL</a> +3 similar issues</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5238_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_gttfill@all:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9404/shard-glk1/igt@gem_exec_gttfill@all.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5238/shard-glk7/igt@ge=
m_exec_gttfill@all.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/118">i915#118</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/95">i915#95</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9404/shard-hsw6/igt@gem_exec_reloc@basic-many-active@rcs0.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5238/=
shard-hsw4/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>)</=
li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9404/shard-tglb3/igt@gem_huc_copy@huc-copy.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5238/shard-tglb6/igt=
@gem_huc_copy@huc-copy.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-tiled2untiled:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9404/shard-tglb3/igt@i915_suspend@fence-restore-tiled2untiled.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_52=
38/shard-tglb3/igt@i915_suspend@fence-restore-tiled2untiled.html">INCOMPLET=
E</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1436">i91=
5#1436</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/160=
2">i915#1602</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/1887">i915#1887</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/2411">i915#2411</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/456">i915#456</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9404/shard-apl2/igt@i915_suspend@fence-restore-tiled2untiled.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_523=
8/shard-apl6/igt@i915_suspend@fence-restore-tiled2untiled.html">INCOMPLETE<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2635">i915#=
2635</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9404/shard-iclb8/igt@i915_suspend@fence-restore-tiled2untiled.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_52=
38/shard-iclb2/igt@i915_suspend@fence-restore-tiled2untiled.html">INCOMPLET=
E</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1185">i91=
5#1185</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9404/shard-kbl2/igt@i915_suspend@fence-restore-tiled2untiled.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_523=
8/shard-kbl4/igt@i915_suspend@fence-restore-tiled2untiled.html">INCOMPLETE<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/155">i915#1=
55</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/794">i9=
15#794</a>)</p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9404/shard-hsw4/igt@i915_suspend@fence-restore-tiled2untiled.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_523=
8/shard-hsw6/igt@i915_suspend@fence-restore-tiled2untiled.html">INCOMPLETE<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2055">i915#=
2055</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2637"=
>i915#2637</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9404/shard-glk3/igt@i915_suspend@fence-restore-tiled2untiled.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_523=
8/shard-glk1/igt@i915_suspend@fence-restore-tiled2untiled.html">INCOMPLETE<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2199">i915#=
2199</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2635"=
>i915#2635</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9404/shard-iclb8/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5238/=
shard-iclb5/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/1119">i915#1119</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-b-64x64-left-edge:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9404/shard-apl1/igt@kms_cursor_edge_walk@pipe-b-64x64-left-edge.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5238/shard-apl3/igt@kms_cursor_edge_walk@pipe-b-64x64-left-edge.html">DMESG=
-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982"=
>i915#1982</a>) +5 similar issues</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9404/shard-glk5/igt@kms_cursor_edge_walk@pipe-b-64x64-left-edge.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5238/shard-glk6/igt@kms_cursor_edge_walk@pipe-b-64x64-left-edge.html">DMESG=
-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982"=
>i915#1982</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9404/shard-glk9/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_5238/shard-glk8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/72=
">i915#72</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-varying-size:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9404/shard-tglb2/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_5238/shard-tglb6/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2346=
">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9404/shard-tglb2/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5238/shard-tglb6/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2122">i915=
#2122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9404/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-sh=
rfb-draw-mmap-wc.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_5238/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-1p-of=
fscren-pri-shrfb-draw-mmap-wc.html">DMESG-WARN</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +1 similar issue</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9404/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pr=
i-indfb-draw-mmap-wc.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_5238/shard-tglb1/igt@kms_frontbuffer_tracking@fbcp=
sr-1p-offscren-pri-indfb-draw-mmap-wc.html">DMESG-WARN</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-cpu:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9404/shard-iclb7/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw=
-mmap-cpu.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_5238/shard-iclb1/igt@kms_frontbuffer_tracking@fbcpsr-rgb10101=
0-draw-mmap-cpu.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/1982">i915#1982</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-c:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9404/shard-hsw6/igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-=
c.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_5238/shard-hsw6/igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-c.=
html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/1982">i915#1982</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9404/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5238/shard-i=
clb1/igt@kms_psr@psr2_primary_mmap_cpu.html">SKIP</a> (<a href=3D"https://b=
ugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>)</li>
</ul>
</li>
<li>
<p>igt@testdisplay:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9404/shard-kbl4/igt@testdisplay.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5238/shard-kbl2/igt@testdisplay=
.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/165">i915#165</a> / <a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/78">i915#78</a>) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9404/shard-glk8/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2389">i91=
5#2389</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5238/shard-glk6/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9404/shard-hsw4/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1519">i915#1519<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5238/s=
hard-hsw4/igt@i915_pm_rc6_residency@rc6-idle.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_async_flips@alternate-sync-async-flip}:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9404/shard-tglb3/igt@kms_async_flips@alternate-sync-async-flip.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2521=
">i915#2521</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_5238/shard-tglb3/igt@kms_async_flips@alternate-sync-async-flip.html">=
PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_async_flips@test-time-stamp}:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9404/shard-tglb8/igt@kms_async_flips@test-time-stamp.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2597">i915#259=
7</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5238=
/shard-tglb6/igt@kms_async_flips@test-time-stamp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-180:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9404/shard-apl6/igt@kms_big_fb@linear-8bpp-rotate-180.html">DMESG-W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982">i=
915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5238/shard-apl6/igt@kms_big_fb@linear-8bpp-rotate-180.html">PASS</a> +5 =
similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ac-vga1-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9404/shard-hsw6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptibl=
e@ac-vga1-hdmi-a1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/2122">i915#2122</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_5238/shard-hsw4/igt@kms_flip@2x-plain-flip-fb-r=
ecreate-interruptible@ac-vga1-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9404/shard-hsw6/igt@kms_flip@2x-plain-flip@ab-vga1-hdmi-a1.html">DM=
ESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/19=
82">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5238/shard-hsw6/igt@kms_flip@2x-plain-flip@ab-vga1-hdmi-a1.html">PA=
SS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-badstride:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9404/shard-glk9/igt@kms_frontbuffer_tracking@fbc-badstride.html">DM=
ESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/19=
82">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5238/shard-glk1/igt@kms_frontbuffer_tracking@fbc-badstride.html">PA=
SS</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9404/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pr=
i-indfb-draw-mmap-wc.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_5238/shard-tglb1/igt@kms_frontbuffer_t=
racking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc.html">PASS</a> +4 similar=
 issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9404/shard-iclb3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb=
-pgflip-blt.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_5238/shard-iclb2/igt@kms_frontbuffer_tracking@p=
sr-1p-primscrn-indfb-pgflip-blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9404/shard-iclb6/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a> =
(<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#1094=
41</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_523=
8/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html">PASS</a> +1 similar =
issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-wait-forked-busy:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9404/shard-kbl1/igt@kms_vblank@pipe-b-wait-forked-busy.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982">=
i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_5238/shard-kbl2/igt@kms_vblank@pipe-b-wait-forked-busy.html">PASS</a> +=
3 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9404/shard-apl6/igt@perf_pmu@module-unload.html">DMESG-WARN</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/262">i915#26=
2</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5238=
/shard-apl3/igt@perf_pmu@module-unload.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9404/shard-iclb3/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1804">i915#180=
4</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i9=
15#2684</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5238/shard-iclb1/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/2681">i915#2681</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#268=
4</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9404/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html">D=
MESG-FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
8145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_5238/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-alpha-7ef=
c.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/265">i915#265</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9404/shard-iclb4/igt@runner@aborted.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/2722">i915#2722</a>) -&gt;=
 (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5238/shard-iclb=
7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5238/shard-iclb2/igt@runner@aborted.html">FAIL</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2722">i915#2=
722</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/483">i=
915#483</a>)</p>
</li>
<li>
<p>shard-glk:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9404/shard-glk8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9404/shard-glk2/igt@runner@abort=
ed.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/1814">i915#1814</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/2722">i915#2722</a> / <a href=3D"https://bugzilla.kernel.or=
g/show_bug.cgi?id=3D202321">k.org#202321</a>) -&gt; (<a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_5238/shard-glk1/igt@runner@aborted.html=
">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5238/=
shard-glk8/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/2722">i915#2722</a> / <a href=3D"https=
://bugzilla.kernel.org/show_bug.cgi?id=3D202321">k.org#202321</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9404/shard-tglb6/igt@runner@aborted.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/2722">i915#2722</a>) -&gt;=
 (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5238/shard-tglb=
3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5238/shard-tglb3/igt@runner@aborted.html">FAIL</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2=
295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2722">=
i915#2722</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (10 -&gt; 8)</h2>
<p>Missing    (2): pig-skl-6260u pig-glk-j5005 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5876 -&gt; IGTPW_5238</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9404: f515fa81d87ef367735d3a57a002fc72c8e55909 @ git://anongit.fre=
edesktop.org/gfx-ci/linux<br />
  IGTPW_5238: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5238/index.htm=
l<br />
  IGT_5876: cf2f41b3d3dfabaf3a4837062f996f3491a350b1 @ git://anongit.freede=
sktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============6258024088797503965==--

--===============0274942523==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0274942523==--
