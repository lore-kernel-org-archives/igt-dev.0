Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 03 Apr 2020 21:43:31 -0000
Message-ID: <158595021171.13349.6990417235205584888@emeril.freedesktop.org>
References: <20200403130306.1272436-1-arkadiusz.hiler@intel.com>
In-Reply-To: <20200403130306.1272436-1-arkadiusz.hiler@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/6=5D_tests/kms=5Fvblank=3A_Make_sur?=
 =?utf-8?q?e_that_we_have_a_mode_set?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,1/6] tests/kms_vblank: Make sure that we have a mode set
URL   : https://patchwork.freedesktop.org/series/75461/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5562_full -> IGTPW_4403_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4403_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4403_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4403/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4403_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_mmap_gtt@cpuset-basic-small-copy-xy:
    - shard-hsw:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/shard-hsw1/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4403/shard-hsw2/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html

  * igt@gem_mmap_gtt@cpuset-medium-copy-xy:
    - shard-apl:          [PASS][3] -> [FAIL][4] +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/shard-apl6/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4403/shard-apl2/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-tglb:         [PASS][5] -> [SKIP][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/shard-tglb7/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4403/shard-tglb1/igt@i915_pm_dc@dc3co-vpb-simulation.html

  
New tests
---------

  New tests have been introduced between IGT_5562_full and IGTPW_4403_full:

### New IGT tests (15) ###

  * igt@kms_chamelium@dp-hpd-enable-disable-mode:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_chamelium@dp-hpd-with-enabled-mode:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_chamelium@hdmi-hpd-enable-disable-mode:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_chamelium@hdmi-hpd-with-enabled-mode:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_chamelium@vga-hpd-enable-disable-mode:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_chamelium@vga-hpd-with-enabled-mode:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@perf_pmu@faulting-read:
    - Statuses :
    - Exec time: [None] s

  * igt@prime_busy@after:
    - Statuses :
    - Exec time: [None] s

  * igt@prime_busy@after-wait:
    - Statuses :
    - Exec time: [None] s

  * igt@prime_busy@before:
    - Statuses :
    - Exec time: [None] s

  * igt@prime_busy@hang:
    - Statuses :
    - Exec time: [None] s

  * igt@prime_busy@hang-wait:
    - Statuses :
    - Exec time: [None] s

  * igt@prime_vgem@busy:
    - Statuses :
    - Exec time: [None] s

  * igt@prime_vgem@fence-wait:
    - Statuses :
    - Exec time: [None] s

  * igt@prime_vgem@sync:
    - Statuses :
    - Exec time: [None] s

  

Known issues
------------

  Here are the changes found in IGTPW_4403_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_tiled_swapping@non-threaded:
    - shard-iclb:         [PASS][7] -> [FAIL][8] ([i915#1618])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/shard-iclb1/igt@gem_tiled_swapping@non-threaded.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4403/shard-iclb7/igt@gem_tiled_swapping@non-threaded.html
    - shard-glk:          [PASS][9] -> [FAIL][10] ([i915#1618])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/shard-glk4/igt@gem_tiled_swapping@non-threaded.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4403/shard-glk3/igt@gem_tiled_swapping@non-threaded.html
    - shard-hsw:          [PASS][11] -> [FAIL][12] ([i915#1618])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/shard-hsw2/igt@gem_tiled_swapping@non-threaded.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4403/shard-hsw2/igt@gem_tiled_swapping@non-threaded.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][13] -> [FAIL][14] ([i915#454])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/shard-iclb6/igt@i915_pm_dc@dc6-psr.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4403/shard-iclb4/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_suspend@sysfs-reader:
    - shard-apl:          [PASS][15] -> [DMESG-WARN][16] ([i915#180]) +4 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/shard-apl6/igt@i915_suspend@sysfs-reader.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4403/shard-apl3/igt@i915_suspend@sysfs-reader.html

  * igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque:
    - shard-hsw:          [PASS][17] -> [FAIL][18] ([i915#54])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/shard-hsw2/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4403/shard-hsw4/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html

  * igt@kms_cursor_crc@pipe-b-cursor-dpms:
    - shard-snb:          [PASS][19] -> [SKIP][20] ([fdo#109271]) +4 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/shard-snb1/igt@kms_cursor_crc@pipe-b-cursor-dpms.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4403/shard-snb2/igt@kms_cursor_crc@pipe-b-cursor-dpms.html

  * igt@kms_cursor_crc@pipe-c-cursor-256x85-sliding:
    - shard-hsw:          [PASS][21] -> [INCOMPLETE][22] ([i915#61])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/shard-hsw4/igt@kms_cursor_crc@pipe-c-cursor-256x85-sliding.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4403/shard-hsw4/igt@kms_cursor_crc@pipe-c-cursor-256x85-sliding.html

  * igt@kms_draw_crc@draw-method-rgb565-render-untiled:
    - shard-glk:          [PASS][23] -> [FAIL][24] ([i915#52] / [i915#54]) +3 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/shard-glk6/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4403/shard-glk8/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-glk:          [PASS][25] -> [FAIL][26] ([i915#79])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/shard-glk6/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4403/shard-glk8/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-glk:          [PASS][27] -> [FAIL][28] ([i915#46])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/shard-glk6/igt@kms_flip@flip-vs-expired-vblank.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4403/shard-glk6/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-kbl:          [PASS][29] -> [DMESG-WARN][30] ([i915#180] / [i915#93] / [i915#95])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/shard-kbl6/igt@kms_flip@flip-vs-suspend.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4403/shard-kbl3/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-kbl:          [PASS][31] -> [DMESG-WARN][32] ([i915#180]) +6 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4403/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@plain-flip-ts-check-interruptible:
    - shard-glk:          [PASS][33] -> [FAIL][34] ([i915#34])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/shard-glk4/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4403/shard-glk6/igt@kms_flip@plain-flip-ts-check-interruptible.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [PASS][35] -> [SKIP][36] ([i915#433])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/shard-tglb7/igt@kms_hdmi_inject@inject-audio.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4403/shard-tglb7/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-kbl:          [PASS][37] -> [INCOMPLETE][38] ([i915#155])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/shard-kbl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4403/shard-kbl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_psr@psr2_primary_render:
    - shard-iclb:         [PASS][39] -> [SKIP][40] ([fdo#109441])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/shard-iclb2/igt@kms_psr@psr2_primary_render.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4403/shard-iclb3/igt@kms_psr@psr2_primary_render.html

  
#### Possible fixes ####

  * {igt@gem_ctx_isolation@preservation-s3@bcs0}:
    - shard-kbl:          [DMESG-WARN][41] ([i915#180]) -> [PASS][42] +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@bcs0.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4403/shard-kbl3/igt@gem_ctx_isolation@preservation-s3@bcs0.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [SKIP][43] ([fdo#110854]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/shard-iclb5/igt@gem_exec_balancer@smoke.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4403/shard-iclb1/igt@gem_exec_balancer@smoke.html

  * igt@gem_mmap_gtt@cpuset-big-copy-xy:
    - shard-tglb:         [FAIL][45] -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/shard-tglb8/igt@gem_mmap_gtt@cpuset-big-copy-xy.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4403/shard-tglb2/igt@gem_mmap_gtt@cpuset-big-copy-xy.html

  * igt@gem_mmap_gtt@hang:
    - shard-iclb:         [FAIL][47] -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/shard-iclb4/igt@gem_mmap_gtt@hang.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4403/shard-iclb2/igt@gem_mmap_gtt@hang.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-snb:          [FAIL][49] ([i915#1618]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/shard-snb4/igt@gem_tiled_swapping@non-threaded.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4403/shard-snb4/igt@gem_tiled_swapping@non-threaded.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-apl:          [DMESG-WARN][51] ([i915#180]) -> [PASS][52] +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/shard-apl8/igt@i915_suspend@fence-restore-tiled2untiled.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4403/shard-apl1/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_concurrent@pipe-b:
    - shard-hsw:          [FAIL][53] ([i915#1539]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/shard-hsw2/igt@kms_concurrent@pipe-b.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4403/shard-hsw1/igt@kms_concurrent@pipe-b.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-offscreen:
    - shard-kbl:          [FAIL][55] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-256x256-offscreen.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4403/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-256x256-offscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding:
    - shard-kbl:          [FAIL][57] ([i915#54]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4403/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding.html
    - shard-apl:          [FAIL][59] ([i915#54]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4403/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-untiled:
    - shard-glk:          [FAIL][61] ([i915#52] / [i915#54]) -> [PASS][62] +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/shard-glk3/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-untiled.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4403/shard-glk7/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled:
    - shard-kbl:          [FAIL][63] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/shard-kbl4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4403/shard-kbl6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
    - shard-apl:          [FAIL][65] ([i915#52] / [i915#54] / [i915#95]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/shard-apl8/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4403/shard-apl8/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-cpu:
    - shard-glk:          [FAIL][67] ([i915#49]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/shard-glk7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-cpu.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4403/shard-glk7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [FAIL][69] ([i915#173]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/shard-iclb1/igt@kms_psr@no_drrs.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4403/shard-iclb2/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_primary_mmap_gtt:
    - shard-iclb:         [SKIP][71] ([fdo#109441]) -> [PASS][72] +1 similar issue
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/shard-iclb8/igt@kms_psr@psr2_primary_mmap_gtt.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4403/shard-iclb2/igt@kms_psr@psr2_primary_mmap_gtt.html

  * igt@kms_universal_plane@universal-plane-pipe-c-functional:
    - shard-glk:          [FAIL][73] ([i915#331]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/shard-glk3/igt@kms_universal_plane@universal-plane-pipe-c-functional.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4403/shard-glk1/igt@kms_universal_plane@universal-plane-pipe-c-functional.html
    - shard-kbl:          [FAIL][75] ([i915#331]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/shard-kbl3/igt@kms_universal_plane@universal-plane-pipe-c-functional.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4403/shard-kbl2/igt@kms_universal_plane@universal-plane-pipe-c-functional.html
    - shard-apl:          [FAIL][77] ([i915#331]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/shard-apl1/igt@kms_universal_plane@universal-plane-pipe-c-functional.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4403/shard-apl7/igt@kms_universal_plane@universal-plane-pipe-c-functional.html

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [FAIL][79] ([i915#1085]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/shard-tglb7/igt@perf@gen12-mi-rpc.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4403/shard-tglb8/igt@perf@gen12-mi-rpc.html

  * {igt@perf@polling-parameterized}:
    - shard-hsw:          [FAIL][81] ([i915#1542]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/shard-hsw1/igt@perf@polling-parameterized.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4403/shard-hsw2/igt@perf@polling-parameterized.html

  
#### Warnings ####

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [SKIP][83] ([fdo#109642] / [fdo#111068]) -> [FAIL][84] ([i915#608])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/shard-iclb3/igt@kms_psr2_su@page_flip.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4403/shard-iclb2/igt@kms_psr2_su@page_flip.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
  [i915#1539]: https://gitlab.freedesktop.org/drm/intel/issues/1539
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1618]: https://gitlab.freedesktop.org/drm/intel/issues/1618
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#331]: https://gitlab.freedesktop.org/drm/intel/issues/331
  [i915#34]: https://gitlab.freedesktop.org/drm/intel/issues/34
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#46]: https://gitlab.freedesktop.org/drm/intel/issues/46
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#608]: https://gitlab.freedesktop.org/drm/intel/issues/608
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5562 -> IGTPW_4403

  CI-20190529: 20190529
  CI_DRM_8244: 55348aac86bd6f0c4ce4d3d8a0e227f6a20a72f9 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4403: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4403/index.html
  IGT_5562: 4770480c8c1f105ff9225e8eb07b652ca954e06a @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4403/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
