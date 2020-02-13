Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 13 Feb 2020 06:17:48 -0000
Message-ID: <158157466814.17961.6976170337426160669@emeril.freedesktop.org>
References: <20200211141820.29114-1-petri.latvala@intel.com>
In-Reply-To: <20200211141820.29114-1-petri.latvala@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgaW50ZWwt?=
 =?utf-8?q?ci=3A_Remove_blacklist_entries_for_removed_tests?=
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
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: intel-ci: Remove blacklist entries for removed tests
URL   : https://patchwork.freedesktop.org/series/73303/
State : success

== Summary ==

CI Bug Log - changes from IGT_5435_full -> IGTPW_4127_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4127/index.html

Known issues
------------

  Here are the changes found in IGTPW_4127_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@extended-parallel-vcs1:
    - shard-iclb:         [PASS][1] -> [SKIP][2] ([fdo#112080]) +10 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-iclb1/igt@gem_busy@extended-parallel-vcs1.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4127/shard-iclb3/igt@gem_busy@extended-parallel-vcs1.html

  * igt@gem_exec_schedule@fifo-bsd1:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#109276]) +18 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-iclb1/igt@gem_exec_schedule@fifo-bsd1.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4127/shard-iclb6/igt@gem_exec_schedule@fifo-bsd1.html

  * igt@gem_exec_schedule@pi-shared-iova-bsd:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([i915#677]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-iclb6/igt@gem_exec_schedule@pi-shared-iova-bsd.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4127/shard-iclb1/igt@gem_exec_schedule@pi-shared-iova-bsd.html

  * igt@gem_exec_schedule@reorder-wide-bsd:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#112146]) +4 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-iclb5/igt@gem_exec_schedule@reorder-wide-bsd.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4127/shard-iclb4/igt@gem_exec_schedule@reorder-wide-bsd.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-display:
    - shard-hsw:          [PASS][9] -> [FAIL][10] ([i915#694])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-hsw7/igt@gem_partial_pwrite_pread@writes-after-reads-display.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4127/shard-hsw2/igt@gem_partial_pwrite_pread@writes-after-reads-display.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-snb:          [PASS][11] -> [DMESG-WARN][12] ([fdo#111870] / [i915#478])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-snb4/igt@gem_userptr_blits@dmabuf-unsync.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4127/shard-snb6/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [PASS][13] -> [DMESG-WARN][14] ([i915#716])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-glk7/igt@gen9_exec_parse@allowed-all.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4127/shard-glk6/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_rps@reset:
    - shard-iclb:         [PASS][15] -> [FAIL][16] ([i915#413])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-iclb1/igt@i915_pm_rps@reset.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4127/shard-iclb6/igt@i915_pm_rps@reset.html

  * igt@i915_selftest@live_gtt:
    - shard-apl:          [PASS][17] -> [TIMEOUT][18] ([fdo#112271])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-apl3/igt@i915_selftest@live_gtt.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4127/shard-apl8/igt@i915_selftest@live_gtt.html

  * igt@kms_ccs@pipe-a-crc-primary-rotation-180:
    - shard-tglb:         [PASS][19] -> [DMESG-FAIL][20] ([i915#402]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-tglb1/igt@kms_ccs@pipe-a-crc-primary-rotation-180.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4127/shard-tglb5/igt@kms_ccs@pipe-a-crc-primary-rotation-180.html

  * igt@kms_cursor_crc@pipe-c-cursor-128x128-random:
    - shard-apl:          [PASS][21] -> [FAIL][22] ([i915#54])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-128x128-random.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4127/shard-apl3/igt@kms_cursor_crc@pipe-c-cursor-128x128-random.html

  * igt@kms_cursor_edge_walk@pipe-a-256x256-right-edge:
    - shard-tglb:         [PASS][23] -> [FAIL][24] ([i915#70])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-tglb8/igt@kms_cursor_edge_walk@pipe-a-256x256-right-edge.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4127/shard-tglb5/igt@kms_cursor_edge_walk@pipe-a-256x256-right-edge.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-ytiled:
    - shard-tglb:         [PASS][25] -> [FAIL][26] ([i915#559]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-tglb2/igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-ytiled.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4127/shard-tglb1/igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-ytiled.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-glk:          [PASS][27] -> [FAIL][28] ([i915#49])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-glk3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4127/shard-glk4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc.html
    - shard-kbl:          [PASS][29] -> [FAIL][30] ([i915#49])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4127/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc.html
    - shard-apl:          [PASS][31] -> [FAIL][32] ([i915#49])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-apl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4127/shard-apl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-tglb:         [PASS][33] -> [SKIP][34] ([i915#668]) +8 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-tglb7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4127/shard-tglb6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-kbl:          [PASS][35] -> [DMESG-WARN][36] ([i915#180]) +2 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-kbl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4127/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-tglb:         [PASS][37] -> [FAIL][38] ([fdo#111842] / [i915#608])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-tglb8/igt@kms_psr2_su@frontbuffer.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4127/shard-tglb2/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_cursor_mmap_gtt:
    - shard-iclb:         [PASS][39] -> [SKIP][40] ([fdo#109441])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_gtt.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4127/shard-iclb4/igt@kms_psr@psr2_cursor_mmap_gtt.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-tglb:         [PASS][41] -> [DMESG-WARN][42] ([i915#402]) +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-tglb1/igt@kms_rotation_crc@bad-tiling.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4127/shard-tglb2/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@multiplane-rotation-cropping-top:
    - shard-tglb:         [PASS][43] -> [FAIL][44] ([i915#199])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-tglb3/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4127/shard-tglb2/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][45] -> [FAIL][46] ([i915#31])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-apl3/igt@kms_setmode@basic.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4127/shard-apl2/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-c-ts-continuation-suspend:
    - shard-apl:          [PASS][47] -> [DMESG-WARN][48] ([i915#180]) +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-apl6/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4127/shard-apl6/igt@kms_vblank@pipe-c-ts-continuation-suspend.html

  * igt@perf@short-reads:
    - shard-kbl:          [PASS][49] -> [TIMEOUT][50] ([fdo#112271] / [i915#51])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-kbl6/igt@perf@short-reads.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4127/shard-kbl6/igt@perf@short-reads.html

  * igt@prime_mmap_coherency@read:
    - shard-hsw:          [PASS][51] -> [FAIL][52] ([i915#914])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-hsw2/igt@prime_mmap_coherency@read.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4127/shard-hsw1/igt@prime_mmap_coherency@read.html

  
#### Possible fixes ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [SKIP][53] ([fdo#112080]) -> [PASS][54] +12 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-iclb8/igt@gem_busy@busy-vcs1.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4127/shard-iclb2/igt@gem_busy@busy-vcs1.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [SKIP][55] ([fdo#110841]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-iclb1/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4127/shard-iclb5/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [SKIP][57] ([i915#677]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-iclb1/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4127/shard-iclb8/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@pi-shared-iova-bsd2:
    - shard-iclb:         [SKIP][59] ([fdo#109276]) -> [PASS][60] +17 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-iclb5/igt@gem_exec_schedule@pi-shared-iova-bsd2.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4127/shard-iclb4/igt@gem_exec_schedule@pi-shared-iova-bsd2.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [SKIP][61] ([fdo#112146]) -> [PASS][62] +4 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-iclb4/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4127/shard-iclb3/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-snb:          [DMESG-WARN][63] ([fdo#111870] / [i915#478]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-snb4/igt@gem_userptr_blits@dmabuf-sync.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4127/shard-snb2/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-kbl:          [FAIL][65] ([fdo#103375]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-kbl4/igt@gem_workarounds@suspend-resume-context.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4127/shard-kbl3/igt@gem_workarounds@suspend-resume-context.html

  * igt@gen7_exec_parse@basic-allocation:
    - shard-hsw:          [FAIL][67] ([i915#694]) -> [PASS][68] +1 similar issue
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-hsw1/igt@gen7_exec_parse@basic-allocation.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4127/shard-hsw1/igt@gen7_exec_parse@basic-allocation.html

  * igt@i915_pm_rps@waitboost:
    - shard-iclb:         [FAIL][69] ([i915#413]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-iclb6/igt@i915_pm_rps@waitboost.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4127/shard-iclb4/igt@i915_pm_rps@waitboost.html

  * igt@kms_color@pipe-a-ctm-negative:
    - shard-tglb:         [FAIL][71] ([i915#1149]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-tglb8/igt@kms_color@pipe-a-ctm-negative.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4127/shard-tglb7/igt@kms_color@pipe-a-ctm-negative.html

  * igt@kms_color@pipe-c-ctm-max:
    - shard-kbl:          [FAIL][73] ([i915#168]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-kbl4/igt@kms_color@pipe-c-ctm-max.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4127/shard-kbl7/igt@kms_color@pipe-c-ctm-max.html
    - shard-apl:          [FAIL][75] ([i915#168]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-apl6/igt@kms_color@pipe-c-ctm-max.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4127/shard-apl2/igt@kms_color@pipe-c-ctm-max.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen:
    - shard-tglb:         [FAIL][77] ([fdo#111703]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-tglb2/igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4127/shard-tglb1/igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][79] ([i915#180]) -> [PASS][80] +5 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4127/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-apl:          [DMESG-WARN][81] ([i915#180]) -> [PASS][82] +2 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-apl1/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4127/shard-apl1/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-glk:          [FAIL][83] ([fdo#103375]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-glk5/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4127/shard-glk2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_draw_crc@draw-method-rgb565-blt-ytiled:
    - shard-tglb:         [DMESG-FAIL][85] ([i915#402]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-tglb2/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4127/shard-tglb2/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled:
    - shard-tglb:         [FAIL][87] ([i915#559]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-tglb6/igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4127/shard-tglb1/igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-glk:          [FAIL][89] ([i915#79]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-glk4/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4127/shard-glk6/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-glk:          [FAIL][91] ([i915#34]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-glk8/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4127/shard-glk3/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render:
    - shard-snb:          [DMESG-WARN][93] ([i915#478]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-snb4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4127/shard-snb5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [FAIL][95] ([i915#899]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-glk4/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4127/shard-glk5/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@perf@rc6-disable:
    - shard-iclb:         [SKIP][97] ([i915#405]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-iclb2/igt@perf@rc6-disable.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4127/shard-iclb1/igt@perf@rc6-disable.html
    - shard-hsw:          [SKIP][99] ([fdo#109271]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-hsw6/igt@perf@rc6-disable.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4127/shard-hsw7/igt@perf@rc6-disable.html
    - shard-kbl:          [SKIP][101] ([fdo#109271]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-kbl1/igt@perf@rc6-disable.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4127/shard-kbl3/igt@perf@rc6-disable.html
    - shard-apl:          [SKIP][103] ([fdo#109271]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-apl6/igt@perf@rc6-disable.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4127/shard-apl8/igt@perf@rc6-disable.html
    - shard-tglb:         [SKIP][105] ([fdo#111719] / [i915#405]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-tglb8/igt@perf@rc6-disable.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4127/shard-tglb8/igt@perf@rc6-disable.html
    - shard-glk:          [SKIP][107] ([fdo#109271]) -> [PASS][108]
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-glk5/igt@perf@rc6-disable.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4127/shard-glk9/igt@perf@rc6-disable.html

  * igt@prime_mmap_coherency@ioctl-errors:
    - shard-hsw:          [FAIL][109] ([i915#831]) -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-hsw6/igt@prime_mmap_coherency@ioctl-errors.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4127/shard-hsw1/igt@prime_mmap_coherency@ioctl-errors.html

  
#### Warnings ####

  * igt@gem_tiled_blits@interruptible:
    - shard-hsw:          [FAIL][111] ([i915#818]) -> [FAIL][112] ([i915#694])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-hsw5/igt@gem_tiled_blits@interruptible.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4127/shard-hsw7/igt@gem_tiled_blits@interruptible.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy-gup:
    - shard-snb:          [DMESG-WARN][113] ([fdo#111870] / [i915#478]) -> [DMESG-WARN][114] ([fdo#110789] / [fdo#111870] / [i915#478]) +1 similar issue
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-snb4/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4127/shard-snb5/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup.html

  * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-snb:          [SKIP][115] ([fdo#109271]) -> [INCOMPLETE][116] ([i915#82])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-snb6/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4127/shard-snb6/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [DMESG-WARN][117] ([fdo#107724]) -> [SKIP][118] ([fdo#109349])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4127/shard-iclb3/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@runner@aborted:
    - shard-snb:          ([FAIL][119], [FAIL][120], [FAIL][121], [FAIL][122], [FAIL][123], [FAIL][124], [FAIL][125], [FAIL][126], [FAIL][127]) ([fdo#111870] / [i915#1077] / [i915#698]) -> ([FAIL][128], [FAIL][129], [FAIL][130], [FAIL][131], [FAIL][132], [FAIL][133], [FAIL][134], [FAIL][135]) ([fdo#111870] / [i915#1077])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-snb4/igt@runner@aborted.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-snb4/igt@runner@aborted.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-snb4/igt@runner@aborted.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-snb4/igt@runner@aborted.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-snb4/igt@runner@aborted.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-snb4/igt@runner@aborted.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-snb6/igt@runner@aborted.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-snb6/igt@runner@aborted.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5435/shard-snb5/igt@runner@aborted.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4127/shard-snb2/igt@runner@aborted.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4127/shard-snb2/igt@runner@aborted.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4127/shard-snb4/igt@runner@aborted.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4127/shard-snb6/igt@runner@aborted.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4127/shard-snb5/igt@runner@aborted.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4127/shard-snb6/igt@runner@aborted.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4127/shard-snb6/igt@runner@aborted.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4127/shard-snb4/igt@runner@aborted.html

  
  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#107724]: https://bugs.freedesktop.org/show_bug.cgi?id=107724
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#111703]: https://bugs.freedesktop.org/show_bug.cgi?id=111703
  [fdo#111719]: https://bugs.freedesktop.org/show_bug.cgi?id=111719
  [fdo#111842]: https://bugs.freedesktop.org/show_bug.cgi?id=111842
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1077]: https://gitlab.freedesktop.org/drm/intel/issues/1077
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#168]: https://gitlab.freedesktop.org/drm/intel/issues/168
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#199]: https://gitlab.freedesktop.org/drm/intel/issues/199
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#34]: https://gitlab.freedesktop.org/drm/intel/issues/34
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#405]: https://gitlab.freedesktop.org/drm/intel/issues/405
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#51]: https://gitlab.freedesktop.org/drm/intel/issues/51
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#559]: https://gitlab.freedesktop.org/drm/intel/issues/559
  [i915#608]: https://gitlab.freedesktop.org/drm/intel/issues/608
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#698]: https://gitlab.freedesktop.org/drm/intel/issues/698
  [i915#70]: https://gitlab.freedesktop.org/drm/intel/issues/70
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#831]: https://gitlab.freedesktop.org/drm/intel/issues/831
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [i915#914]: https://gitlab.freedesktop.org/drm/intel/issues/914


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5435 -> IGTPW_4127
  * Linux: CI_DRM_7908 -> CI_DRM_7911

  CI-20190529: 20190529
  CI_DRM_7908: a485616028300ec76e3afbc7a9926f2df18e7246 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_7911: 5d64e9f8063c7649404c3182c1fd38499ee03059 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4127: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4127/index.html
  IGT_5435: 2b6d4476dde53c363b8808ed9f0dd5547ac78641 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4127/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
