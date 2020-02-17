Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 17 Feb 2020 15:57:27 -0000
Message-ID: <158195504769.16571.674311016765434549@emeril.freedesktop.org>
References: <20200214004037.5847-1-antonio.argenziano@intel.com>
In-Reply-To: <20200214004037.5847-1-antonio.argenziano@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fthreaded=5Faccess=5Ftiled=3A_Require_fences?=
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
To: Antonio Argenziano <antonio.argenziano@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/i915/gem_threaded_access_tiled: Require fences
URL   : https://patchwork.freedesktop.org/series/73435/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7935_full -> IGTPW_4151_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4151/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4151_full:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@gem_ctx_persistence@close-replace-race}:
    - shard-iclb:         [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7935/shard-iclb8/igt@gem_ctx_persistence@close-replace-race.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4151/shard-iclb2/igt@gem_ctx_persistence@close-replace-race.html
    - shard-apl:          [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7935/shard-apl4/igt@gem_ctx_persistence@close-replace-race.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4151/shard-apl3/igt@gem_ctx_persistence@close-replace-race.html
    - shard-glk:          [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7935/shard-glk6/igt@gem_ctx_persistence@close-replace-race.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4151/shard-glk6/igt@gem_ctx_persistence@close-replace-race.html

  
Known issues
------------

  Here are the changes found in IGTPW_4151_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([i915#677])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7935/shard-iclb5/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4151/shard-iclb1/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd1:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#109276]) +16 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7935/shard-iclb2/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4151/shard-iclb7/igt@gem_exec_schedule@preempt-queue-bsd1.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([fdo#112146]) +2 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7935/shard-iclb3/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4151/shard-iclb4/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_softpin@noreloc-s3:
    - shard-apl:          [PASS][13] -> [DMESG-WARN][14] ([i915#180]) +3 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7935/shard-apl4/igt@gem_softpin@noreloc-s3.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4151/shard-apl2/igt@gem_softpin@noreloc-s3.html

  * igt@i915_pm_rpm@system-suspend-devices:
    - shard-iclb:         [PASS][15] -> [INCOMPLETE][16] ([i915#189])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7935/shard-iclb5/igt@i915_pm_rpm@system-suspend-devices.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4151/shard-iclb4/igt@i915_pm_rpm@system-suspend-devices.html

  * igt@i915_pm_rps@waitboost:
    - shard-iclb:         [PASS][17] -> [FAIL][18] ([i915#413])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7935/shard-iclb8/igt@i915_pm_rps@waitboost.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4151/shard-iclb1/igt@i915_pm_rps@waitboost.html

  * igt@kms_big_fb@linear-8bpp-rotate-180:
    - shard-tglb:         [PASS][19] -> [FAIL][20] ([i915#1172]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7935/shard-tglb3/igt@kms_big_fb@linear-8bpp-rotate-180.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4151/shard-tglb7/igt@kms_big_fb@linear-8bpp-rotate-180.html

  * igt@kms_ccs@pipe-a-crc-primary-rotation-180:
    - shard-tglb:         [PASS][21] -> [DMESG-FAIL][22] ([i915#402]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7935/shard-tglb7/igt@kms_ccs@pipe-a-crc-primary-rotation-180.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4151/shard-tglb2/igt@kms_ccs@pipe-a-crc-primary-rotation-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-random:
    - shard-apl:          [PASS][23] -> [FAIL][24] ([i915#54])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7935/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4151/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html

  * igt@kms_cursor_edge_walk@pipe-a-256x256-left-edge:
    - shard-tglb:         [PASS][25] -> [FAIL][26] ([i915#70])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7935/shard-tglb8/igt@kms_cursor_edge_walk@pipe-a-256x256-left-edge.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4151/shard-tglb7/igt@kms_cursor_edge_walk@pipe-a-256x256-left-edge.html

  * igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy:
    - shard-tglb:         [PASS][27] -> [FAIL][28] ([i915#1173])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7935/shard-tglb2/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4151/shard-tglb2/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-kbl:          [PASS][29] -> [DMESG-WARN][30] ([i915#180]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7935/shard-kbl2/igt@kms_flip@flip-vs-suspend.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4151/shard-kbl6/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-pwrite:
    - shard-glk:          [PASS][31] -> [FAIL][32] ([i915#49])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7935/shard-glk4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-pwrite.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4151/shard-glk6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-pwrite.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-kbl:          [PASS][33] -> [INCOMPLETE][34] ([fdo#103665])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7935/shard-kbl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4151/shard-kbl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_plane_cursor@pipe-a-primary-size-256:
    - shard-tglb:         [PASS][35] -> [FAIL][36] ([i915#1139]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7935/shard-tglb5/igt@kms_plane_cursor@pipe-a-primary-size-256.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4151/shard-tglb7/igt@kms_plane_cursor@pipe-a-primary-size-256.html

  * igt@kms_psr@psr2_suspend:
    - shard-iclb:         [PASS][37] -> [SKIP][38] ([fdo#109441]) +3 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7935/shard-iclb2/igt@kms_psr@psr2_suspend.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4151/shard-iclb8/igt@kms_psr@psr2_suspend.html

  * igt@kms_rotation_crc@multiplane-rotation:
    - shard-tglb:         [PASS][39] -> [FAIL][40] ([i915#199])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7935/shard-tglb2/igt@kms_rotation_crc@multiplane-rotation.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4151/shard-tglb8/igt@kms_rotation_crc@multiplane-rotation.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-tglb:         [PASS][41] -> [DMESG-FAIL][42] ([i915#402] / [i915#65])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7935/shard-tglb1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4151/shard-tglb7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@perf_pmu@busy-vcs1:
    - shard-iclb:         [PASS][43] -> [SKIP][44] ([fdo#112080]) +10 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7935/shard-iclb2/igt@perf_pmu@busy-vcs1.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4151/shard-iclb7/igt@perf_pmu@busy-vcs1.html

  
#### Possible fixes ####

  * igt@gem_eio@unwedge-stress:
    - shard-glk:          [FAIL][45] ([i915#232]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7935/shard-glk8/igt@gem_eio@unwedge-stress.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4151/shard-glk1/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_schedule@promotion-bsd1:
    - shard-iclb:         [SKIP][47] ([fdo#109276]) -> [PASS][48] +11 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7935/shard-iclb3/igt@gem_exec_schedule@promotion-bsd1.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4151/shard-iclb2/igt@gem_exec_schedule@promotion-bsd1.html

  * igt@gem_exec_schedule@wide-bsd:
    - shard-iclb:         [SKIP][49] ([fdo#112146]) -> [PASS][50] +3 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7935/shard-iclb4/igt@gem_exec_schedule@wide-bsd.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4151/shard-iclb8/igt@gem_exec_schedule@wide-bsd.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [FAIL][51] ([i915#644]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7935/shard-glk5/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4151/shard-glk3/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@i915_pm_rps@waitboost:
    - shard-tglb:         [FAIL][53] ([i915#413]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7935/shard-tglb2/igt@i915_pm_rps@waitboost.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4151/shard-tglb5/igt@i915_pm_rps@waitboost.html

  * igt@i915_suspend@sysfs-reader:
    - shard-apl:          [DMESG-WARN][55] ([i915#180]) -> [PASS][56] +3 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7935/shard-apl6/igt@i915_suspend@sysfs-reader.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4151/shard-apl8/igt@i915_suspend@sysfs-reader.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-90:
    - shard-tglb:         [FAIL][57] ([i915#1172]) -> [PASS][58] +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7935/shard-tglb5/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4151/shard-tglb5/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html

  * igt@kms_color@pipe-a-ctm-blue-to-red:
    - shard-tglb:         [FAIL][59] ([i915#1149]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7935/shard-tglb7/igt@kms_color@pipe-a-ctm-blue-to-red.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4151/shard-tglb5/igt@kms_color@pipe-a-ctm-blue-to-red.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-random:
    - shard-tglb:         [FAIL][61] ([fdo#111703]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7935/shard-tglb7/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4151/shard-tglb3/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html

  * igt@kms_cursor_crc@pipe-b-cursor-256x256-onscreen:
    - shard-apl:          [FAIL][63] ([i915#54]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7935/shard-apl8/igt@kms_cursor_crc@pipe-b-cursor-256x256-onscreen.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4151/shard-apl3/igt@kms_cursor_crc@pipe-b-cursor-256x256-onscreen.html
    - shard-glk:          [FAIL][65] ([i915#54]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7935/shard-glk2/igt@kms_cursor_crc@pipe-b-cursor-256x256-onscreen.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4151/shard-glk2/igt@kms_cursor_crc@pipe-b-cursor-256x256-onscreen.html
    - shard-kbl:          [FAIL][67] ([i915#54]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7935/shard-kbl6/igt@kms_cursor_crc@pipe-b-cursor-256x256-onscreen.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4151/shard-kbl1/igt@kms_cursor_crc@pipe-b-cursor-256x256-onscreen.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-ytiled:
    - shard-tglb:         [FAIL][69] ([i915#559]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7935/shard-tglb2/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-ytiled.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4151/shard-tglb1/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-ytiled.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-glk:          [FAIL][71] ([i915#46]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7935/shard-glk1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4151/shard-glk3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-glk:          [FAIL][73] ([i915#49]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7935/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4151/shard-glk5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt:
    - shard-snb:          [DMESG-WARN][75] ([i915#478]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7935/shard-snb2/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4151/shard-snb6/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt:
    - shard-tglb:         [SKIP][77] ([i915#668]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7935/shard-tglb1/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4151/shard-tglb5/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:
    - shard-tglb:         [FAIL][79] ([i915#49]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7935/shard-tglb5/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4151/shard-tglb8/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-a:
    - shard-tglb:         [FAIL][81] ([i915#1183]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7935/shard-tglb5/igt@kms_pipe_crc_basic@read-crc-pipe-a.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4151/shard-tglb3/igt@kms_pipe_crc_basic@read-crc-pipe-a.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [DMESG-WARN][83] ([i915#180]) -> [PASS][84] +4 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7935/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4151/shard-kbl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:
    - shard-tglb:         [FAIL][85] ([i915#1184]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7935/shard-tglb5/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4151/shard-tglb1/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [FAIL][87] ([i915#173]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7935/shard-iclb1/igt@kms_psr@no_drrs.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4151/shard-iclb2/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_cursor_blt:
    - shard-iclb:         [SKIP][89] ([fdo#109441]) -> [PASS][90] +1 similar issue
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7935/shard-iclb3/igt@kms_psr@psr2_cursor_blt.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4151/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html

  * igt@kms_pwrite_crc:
    - shard-tglb:         [FAIL][91] -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7935/shard-tglb3/igt@kms_pwrite_crc.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4151/shard-tglb7/igt@kms_pwrite_crc.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-tglb:         [FAIL][93] ([i915#65]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7935/shard-tglb3/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4151/shard-tglb5/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@perf_pmu@init-busy-vcs1:
    - shard-iclb:         [SKIP][95] ([fdo#112080]) -> [PASS][96] +10 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7935/shard-iclb6/igt@perf_pmu@init-busy-vcs1.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4151/shard-iclb2/igt@perf_pmu@init-busy-vcs1.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv-switch:
    - shard-iclb:         [FAIL][97] ([IGT#28]) -> [SKIP][98] ([fdo#112080])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7935/shard-iclb1/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4151/shard-iclb6/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy:
    - shard-snb:          [DMESG-WARN][99] ([fdo#110789] / [fdo#111870] / [i915#478]) -> [DMESG-WARN][100] ([fdo#111870] / [i915#478])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7935/shard-snb6/igt@gem_userptr_blits@map-fixed-invalidate-busy.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4151/shard-snb5/igt@gem_userptr_blits@map-fixed-invalidate-busy.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [FAIL][101] ([i915#454]) -> [SKIP][102] ([i915#468])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7935/shard-tglb5/igt@i915_pm_dc@dc6-dpms.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4151/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [SKIP][103] ([i915#468]) -> [FAIL][104] ([i915#454])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7935/shard-tglb2/igt@i915_pm_dc@dc6-psr.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4151/shard-tglb7/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@gem-execbuf:
    - shard-snb:          [INCOMPLETE][105] ([i915#82]) -> [SKIP][106] ([fdo#109271])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7935/shard-snb4/igt@i915_pm_rpm@gem-execbuf.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4151/shard-snb4/igt@i915_pm_rpm@gem-execbuf.html

  * igt@runner@aborted:
    - shard-snb:          ([FAIL][107], [FAIL][108], [FAIL][109], [FAIL][110], [FAIL][111], [FAIL][112], [FAIL][113], [FAIL][114], [FAIL][115]) ([fdo#111870] / [i915#1077] / [i915#698] / [i915#974]) -> ([FAIL][116], [FAIL][117], [FAIL][118], [FAIL][119], [FAIL][120], [FAIL][121], [FAIL][122], [FAIL][123], [FAIL][124]) ([fdo#111870] / [i915#1077] / [i915#974])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7935/shard-snb6/igt@runner@aborted.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7935/shard-snb2/igt@runner@aborted.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7935/shard-snb6/igt@runner@aborted.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7935/shard-snb2/igt@runner@aborted.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7935/shard-snb2/igt@runner@aborted.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7935/shard-snb5/igt@runner@aborted.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7935/shard-snb6/igt@runner@aborted.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7935/shard-snb4/igt@runner@aborted.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7935/shard-snb5/igt@runner@aborted.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4151/shard-snb5/igt@runner@aborted.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4151/shard-snb2/igt@runner@aborted.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4151/shard-snb6/igt@runner@aborted.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4151/shard-snb5/igt@runner@aborted.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4151/shard-snb6/igt@runner@aborted.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4151/shard-snb5/igt@runner@aborted.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4151/shard-snb4/igt@runner@aborted.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4151/shard-snb5/igt@runner@aborted.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4151/shard-snb4/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#111703]: https://bugs.freedesktop.org/show_bug.cgi?id=111703
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1077]: https://gitlab.freedesktop.org/drm/intel/issues/1077
  [i915#1139]: https://gitlab.freedesktop.org/drm/intel/issues/1139
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#1172]: https://gitlab.freedesktop.org/drm/intel/issues/1172
  [i915#1173]: https://gitlab.freedesktop.org/drm/intel/issues/1173
  [i915#1183]: https://gitlab.freedesktop.org/drm/intel/issues/1183
  [i915#1184]: https://gitlab.freedesktop.org/drm/intel/issues/1184
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#189]: https://gitlab.freedesktop.org/drm/intel/issues/189
  [i915#199]: https://gitlab.freedesktop.org/drm/intel/issues/199
  [i915#232]: https://gitlab.freedesktop.org/drm/intel/issues/232
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#46]: https://gitlab.freedesktop.org/drm/intel/issues/46
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#559]: https://gitlab.freedesktop.org/drm/intel/issues/559
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#65]: https://gitlab.freedesktop.org/drm/intel/issues/65
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#698]: https://gitlab.freedesktop.org/drm/intel/issues/698
  [i915#70]: https://gitlab.freedesktop.org/drm/intel/issues/70
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#974]: https://gitlab.freedesktop.org/drm/intel/issues/974


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5441 -> IGTPW_4151
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7935: 4bce2388b13d8b487dbfec353a2cb0131b6b9582 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4151: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4151/index.html
  IGT_5441: 534ca091fe4ffed916752165bc5becd7ff56cd84 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4151/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
