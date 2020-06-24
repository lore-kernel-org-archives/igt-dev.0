Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 24 Jun 2020 02:00:56 -0000
Message-ID: <159296405696.19235.4208663156977730123@emeril.freedesktop.org>
References: <20200623142142.26229-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20200623142142.26229-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgQWRkIGFw?=
 =?utf-8?q?i=5Fintel=5Fbb_test_=28rev3=29?=
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
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Add api_intel_bb test (rev3)
URL   : https://patchwork.freedesktop.org/series/78719/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8658_full -> IGTPW_4696_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4696/index.html

New tests
---------

  New tests have been introduced between CI_DRM_8658_full and IGTPW_4696_full:

### New IGT tests (8) ###

  * igt@api_intel_bb@blit-noreloc-keep-cache:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@api_intel_bb@blit-noreloc-purge-cache:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@api_intel_bb@blit-reloc-keep-cache:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@api_intel_bb@intel-bb-blit:
    - Statuses : 7 pass(s)
    - Exec time: [0.06, 0.19] s

  * igt@api_intel_bb@offset-control:
    - Statuses : 6 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@api_intel_bb@simple-bb:
    - Statuses : 7 pass(s)
    - Exec time: [0.00] s

  * igt@api_intel_bb@simple-bb-ctx:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  

Known issues
------------

  Here are the changes found in IGTPW_4696_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_balancer@bonded-early:
    - shard-kbl:          [PASS][1] -> [FAIL][2] ([i915#2079])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-kbl1/igt@gem_exec_balancer@bonded-early.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4696/shard-kbl6/igt@gem_exec_balancer@bonded-early.html

  * igt@gem_exec_flush@basic-uc-set-default:
    - shard-kbl:          [PASS][3] -> [DMESG-WARN][4] ([i915#93] / [i915#95]) +42 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-kbl3/igt@gem_exec_flush@basic-uc-set-default.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4696/shard-kbl7/igt@gem_exec_flush@basic-uc-set-default.html

  * igt@gem_exec_store@basic:
    - shard-hsw:          [PASS][5] -> [TIMEOUT][6] ([i915#1958]) +2 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-hsw1/igt@gem_exec_store@basic.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4696/shard-hsw4/igt@gem_exec_store@basic.html

  * igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs:
    - shard-tglb:         [PASS][7] -> [DMESG-WARN][8] ([i915#402]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-tglb2/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4696/shard-tglb3/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-apl:          [PASS][9] -> [DMESG-WARN][10] ([i915#183])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-apl8/igt@gem_tiled_swapping@non-threaded.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4696/shard-apl4/igt@gem_tiled_swapping@non-threaded.html

  * igt@kms_color@pipe-a-degamma:
    - shard-apl:          [PASS][11] -> [FAIL][12] ([fdo#108145] / [i915#71])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-apl6/igt@kms_color@pipe-a-degamma.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4696/shard-apl4/igt@kms_color@pipe-a-degamma.html
    - shard-kbl:          [PASS][13] -> [FAIL][14] ([fdo#108145] / [i915#71])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-kbl7/igt@kms_color@pipe-a-degamma.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4696/shard-kbl6/igt@kms_color@pipe-a-degamma.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-random:
    - shard-kbl:          [PASS][15] -> [DMESG-FAIL][16] ([i915#54] / [i915#95])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4696/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding:
    - shard-apl:          [PASS][17] -> [DMESG-WARN][18] ([i915#1635] / [i915#95]) +30 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4696/shard-apl1/igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-tglb:         [PASS][19] -> [INCOMPLETE][20] ([i915#1602] / [i915#456])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-tglb3/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4696/shard-tglb5/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_edge_walk@pipe-c-256x256-left-edge:
    - shard-glk:          [PASS][21] -> [DMESG-WARN][22] ([i915#1982])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-glk4/igt@kms_cursor_edge_walk@pipe-c-256x256-left-edge.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4696/shard-glk2/igt@kms_cursor_edge_walk@pipe-c-256x256-left-edge.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1:
    - shard-hsw:          [PASS][23] -> [INCOMPLETE][24] ([i915#2055])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-hsw4/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4696/shard-hsw4/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@basic:
    - shard-snb:          [PASS][25] -> [TIMEOUT][26] ([i915#1958]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-snb2/igt@kms_frontbuffer_tracking@basic.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4696/shard-snb1/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-glk:          [PASS][27] -> [FAIL][28] ([i915#49])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4696/shard-glk5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-gtt:
    - shard-tglb:         [PASS][29] -> [DMESG-WARN][30] ([i915#1982])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-gtt.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4696/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-pwrite:
    - shard-tglb:         [PASS][31] -> [SKIP][32] ([i915#668]) +3 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-tglb6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-pwrite.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4696/shard-tglb6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-pwrite.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-7efc:
    - shard-apl:          [PASS][33] -> [DMESG-FAIL][34] ([fdo#108145] / [i915#1635] / [i915#95])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4696/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html

  * igt@kms_sysfs_edid_timing:
    - shard-apl:          [PASS][35] -> [FAIL][36] ([IGT#2])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-apl4/igt@kms_sysfs_edid_timing.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4696/shard-apl1/igt@kms_sysfs_edid_timing.html
    - shard-kbl:          [PASS][37] -> [FAIL][38] ([IGT#2])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-kbl3/igt@kms_sysfs_edid_timing.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4696/shard-kbl6/igt@kms_sysfs_edid_timing.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [PASS][39] -> [DMESG-WARN][40] ([i915#180]) +2 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4696/shard-kbl6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@perf@blocking-parameterized:
    - shard-iclb:         [PASS][41] -> [FAIL][42] ([i915#1542])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-iclb5/igt@perf@blocking-parameterized.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4696/shard-iclb1/igt@perf@blocking-parameterized.html

  * igt@perf@non-sampling-read-error:
    - shard-tglb:         [PASS][43] -> [SKIP][44] ([i915#405])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-tglb2/igt@perf@non-sampling-read-error.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4696/shard-tglb2/igt@perf@non-sampling-read-error.html
    - shard-apl:          [PASS][45] -> [SKIP][46] ([fdo#109271])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-apl1/igt@perf@non-sampling-read-error.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4696/shard-apl1/igt@perf@non-sampling-read-error.html
    - shard-glk:          [PASS][47] -> [SKIP][48] ([fdo#109271])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-glk4/igt@perf@non-sampling-read-error.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4696/shard-glk7/igt@perf@non-sampling-read-error.html
    - shard-hsw:          [PASS][49] -> [SKIP][50] ([fdo#109271])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-hsw1/igt@perf@non-sampling-read-error.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4696/shard-hsw4/igt@perf@non-sampling-read-error.html
    - shard-kbl:          [PASS][51] -> [SKIP][52] ([fdo#109271])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-kbl6/igt@perf@non-sampling-read-error.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4696/shard-kbl7/igt@perf@non-sampling-read-error.html
    - shard-iclb:         [PASS][53] -> [SKIP][54] ([i915#405])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-iclb1/igt@perf@non-sampling-read-error.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4696/shard-iclb4/igt@perf@non-sampling-read-error.html

  
#### Possible fixes ####

  * igt@gem_exec_create@madvise:
    - shard-glk:          [DMESG-WARN][55] ([i915#118] / [i915#95]) -> [PASS][56] +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-glk1/igt@gem_exec_create@madvise.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4696/shard-glk7/igt@gem_exec_create@madvise.html

  * igt@gem_shrink@reclaim:
    - shard-hsw:          [SKIP][57] ([fdo#109271]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-hsw1/igt@gem_shrink@reclaim.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4696/shard-hsw4/igt@gem_shrink@reclaim.html

  * igt@gem_userptr_blits@create-destroy-sync:
    - shard-hsw:          [TIMEOUT][59] ([i915#1958]) -> [PASS][60] +3 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-hsw1/igt@gem_userptr_blits@create-destroy-sync.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4696/shard-hsw1/igt@gem_userptr_blits@create-destroy-sync.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-tglb:         [SKIP][61] ([i915#1904]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-tglb6/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4696/shard-tglb8/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-kbl:          [INCOMPLETE][63] ([i915#151] / [i915#155]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-kbl4/igt@i915_pm_rpm@system-suspend-execbuf.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4696/shard-kbl6/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-glk:          [DMESG-FAIL][65] ([i915#118] / [i915#95]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-glk8/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4696/shard-glk6/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - shard-kbl:          [DMESG-FAIL][67] ([i915#54] / [i915#95]) -> [PASS][68] +1 similar issue
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4696/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_flip@modeset-vs-vblank-race-interruptible@a-hdmi-a1:
    - shard-glk:          [FAIL][69] ([i915#407]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-glk9/igt@kms_flip@modeset-vs-vblank-race-interruptible@a-hdmi-a1.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4696/shard-glk6/igt@kms_flip@modeset-vs-vblank-race-interruptible@a-hdmi-a1.html

  * igt@kms_flip_tiling@flip-changes-tiling-yf:
    - shard-kbl:          [DMESG-FAIL][71] ([i915#95]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-kbl4/igt@kms_flip_tiling@flip-changes-tiling-yf.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4696/shard-kbl4/igt@kms_flip_tiling@flip-changes-tiling-yf.html
    - shard-apl:          [DMESG-FAIL][73] ([i915#1635] / [i915#95]) -> [PASS][74] +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-apl7/igt@kms_flip_tiling@flip-changes-tiling-yf.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4696/shard-apl4/igt@kms_flip_tiling@flip-changes-tiling-yf.html

  * igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:
    - shard-iclb:         [DMESG-WARN][75] ([i915#1982]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-iclb3/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4696/shard-iclb4/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [DMESG-WARN][77] ([i915#180]) -> [PASS][78] +3 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-kbl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4696/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid:
    - shard-kbl:          [DMESG-FAIL][79] ([fdo#108145] / [i915#95]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-kbl4/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4696/shard-kbl3/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
    - shard-apl:          [DMESG-FAIL][81] ([fdo#108145] / [i915#1635] / [i915#95]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4696/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html

  * igt@kms_universal_plane@universal-plane-gen9-features-pipe-b:
    - shard-tglb:         [DMESG-WARN][83] ([i915#1982]) -> [PASS][84] +1 similar issue
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-tglb8/igt@kms_universal_plane@universal-plane-gen9-features-pipe-b.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4696/shard-tglb8/igt@kms_universal_plane@universal-plane-gen9-features-pipe-b.html

  * igt@kms_vblank@pipe-b-ts-continuation-dpms-rpm:
    - shard-apl:          [DMESG-WARN][85] ([i915#1635] / [i915#95]) -> [PASS][86] +27 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-apl1/igt@kms_vblank@pipe-b-ts-continuation-dpms-rpm.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4696/shard-apl3/igt@kms_vblank@pipe-b-ts-continuation-dpms-rpm.html

  * igt@perf_pmu@semaphore-busy@rcs0:
    - shard-kbl:          [FAIL][87] ([i915#1820]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-kbl4/igt@perf_pmu@semaphore-busy@rcs0.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4696/shard-kbl6/igt@perf_pmu@semaphore-busy@rcs0.html

  * igt@syncobj_wait@multi-wait-submitted-signaled:
    - shard-kbl:          [DMESG-WARN][89] ([i915#93] / [i915#95]) -> [PASS][90] +36 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-kbl4/igt@syncobj_wait@multi-wait-submitted-signaled.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4696/shard-kbl6/igt@syncobj_wait@multi-wait-submitted-signaled.html

  
#### Warnings ####

  * igt@gem_exec_reloc@basic-concurrent16:
    - shard-snb:          [FAIL][91] ([i915#1930]) -> [TIMEOUT][92] ([i915#1958])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-snb2/igt@gem_exec_reloc@basic-concurrent16.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4696/shard-snb1/igt@gem_exec_reloc@basic-concurrent16.html

  * igt@gem_exec_whisper@basic-queues:
    - shard-hsw:          [SKIP][93] ([fdo#109271]) -> [TIMEOUT][94] ([i915#1958])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-hsw1/igt@gem_exec_whisper@basic-queues.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4696/shard-hsw4/igt@gem_exec_whisper@basic-queues.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-90:
    - shard-hsw:          [TIMEOUT][95] ([i915#1958]) -> [SKIP][96] ([fdo#109271]) +1 similar issue
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-hsw1/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4696/shard-hsw1/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html

  * igt@kms_color@pipe-c-ctm-0-75:
    - shard-tglb:         [FAIL][97] ([i915#1149] / [i915#315]) -> [DMESG-FAIL][98] ([i915#1149] / [i915#402])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-tglb3/igt@kms_color@pipe-c-ctm-0-75.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4696/shard-tglb2/igt@kms_color@pipe-c-ctm-0-75.html

  * igt@kms_color_chamelium@pipe-a-ctm-limited-range:
    - shard-apl:          [SKIP][99] ([fdo#109271] / [fdo#111827] / [i915#1635]) -> [SKIP][100] ([fdo#109271] / [fdo#111827]) +2 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-apl6/igt@kms_color_chamelium@pipe-a-ctm-limited-range.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4696/shard-apl7/igt@kms_color_chamelium@pipe-a-ctm-limited-range.html

  * igt@kms_color_chamelium@pipe-b-ctm-0-5:
    - shard-hsw:          [SKIP][101] ([fdo#109271] / [fdo#111827]) -> [TIMEOUT][102] ([i915#1958])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-hsw4/igt@kms_color_chamelium@pipe-b-ctm-0-5.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4696/shard-hsw4/igt@kms_color_chamelium@pipe-b-ctm-0-5.html
    - shard-snb:          [SKIP][103] ([fdo#109271] / [fdo#111827]) -> [TIMEOUT][104] ([i915#1958])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-snb1/igt@kms_color_chamelium@pipe-b-ctm-0-5.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4696/shard-snb1/igt@kms_color_chamelium@pipe-b-ctm-0-5.html

  * igt@kms_color_chamelium@pipe-d-ctm-green-to-red:
    - shard-apl:          [SKIP][105] ([fdo#109271] / [fdo#111827]) -> [SKIP][106] ([fdo#109271] / [fdo#111827] / [i915#1635]) +1 similar issue
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-apl2/igt@kms_color_chamelium@pipe-d-ctm-green-to-red.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4696/shard-apl7/igt@kms_color_chamelium@pipe-d-ctm-green-to-red.html

  * igt@kms_content_protection@uevent:
    - shard-kbl:          [FAIL][107] ([i915#357]) -> [DMESG-FAIL][108] ([i915#357] / [i915#95])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-kbl7/igt@kms_content_protection@uevent.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4696/shard-kbl4/igt@kms_content_protection@uevent.html
    - shard-apl:          [FAIL][109] ([i915#357]) -> [DMESG-FAIL][110] ([i915#1635] / [i915#357] / [i915#95])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-apl8/igt@kms_content_protection@uevent.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4696/shard-apl4/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-apl:          [SKIP][111] ([fdo#109271]) -> [SKIP][112] ([fdo#109271] / [i915#1635]) +11 similar issues
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-apl2/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4696/shard-apl4/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-7efc:
    - shard-apl:          [FAIL][113] ([fdo#108145] / [i915#265]) -> [DMESG-FAIL][114] ([fdo#108145] / [i915#1635] / [i915#95])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-apl6/igt@kms_plane_alpha_blend@pipe-b-alpha-7efc.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4696/shard-apl1/igt@kms_plane_alpha_blend@pipe-b-alpha-7efc.html
    - shard-kbl:          [FAIL][115] ([fdo#108145] / [i915#265]) -> [DMESG-FAIL][116] ([fdo#108145] / [i915#95])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-kbl1/igt@kms_plane_alpha_blend@pipe-b-alpha-7efc.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4696/shard-kbl6/igt@kms_plane_alpha_blend@pipe-b-alpha-7efc.html

  * igt@perf@gen12-unprivileged-single-ctx-counters:
    - shard-apl:          [SKIP][117] ([fdo#109271] / [i915#1635]) -> [SKIP][118] ([fdo#109271]) +9 similar issues
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-apl7/igt@perf@gen12-unprivileged-single-ctx-counters.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4696/shard-apl1/igt@perf@gen12-unprivileged-single-ctx-counters.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-snb:          [SKIP][119] ([fdo#109271]) -> [TIMEOUT][120] ([i915#1958]) +2 similar issues
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-snb5/igt@tools_test@sysfs_l3_parity.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4696/shard-snb1/igt@tools_test@sysfs_l3_parity.html

  
  [IGT#2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#151]: https://gitlab.freedesktop.org/drm/intel/issues/151
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1820]: https://gitlab.freedesktop.org/drm/intel/issues/1820
  [i915#183]: https://gitlab.freedesktop.org/drm/intel/issues/183
  [i915#1904]: https://gitlab.freedesktop.org/drm/intel/issues/1904
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2055]: https://gitlab.freedesktop.org/drm/intel/issues/2055
  [i915#2079]: https://gitlab.freedesktop.org/drm/intel/issues/2079
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#315]: https://gitlab.freedesktop.org/drm/intel/issues/315
  [i915#357]: https://gitlab.freedesktop.org/drm/intel/issues/357
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#405]: https://gitlab.freedesktop.org/drm/intel/issues/405
  [i915#407]: https://gitlab.freedesktop.org/drm/intel/issues/407
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#71]: https://gitlab.freedesktop.org/drm/intel/issues/71
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5717 -> IGTPW_4696
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8658: c86979e2fe3c106d95b5fcf2075709afa40f0f95 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4696: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4696/index.html
  IGT_5717: 725bf2dae51f0087eaa64f1931a2ef9d22f070dd @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4696/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
