Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 30 Jan 2020 02:32:35 -0000
Message-ID: <158035155554.21035.15504160308347215877@emeril.freedesktop.org>
References: <20200128143054.23907-1-mika.kahola@intel.com>
In-Reply-To: <20200128143054.23907-1-mika.kahola@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fccs=3A_Select_highest_resolution?=
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
To: Mika Kahola <mika.kahola@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_ccs: Select highest resolution
URL   : https://patchwork.freedesktop.org/series/72667/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7833_full -> IGTPW_4019_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4019/index.html

Known issues
------------

  Here are the changes found in IGTPW_4019_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@vcs1-mixed-process:
    - shard-iclb:         [PASS][1] -> [SKIP][2] ([fdo#109276] / [fdo#112080]) +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-iclb1/igt@gem_ctx_persistence@vcs1-mixed-process.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4019/shard-iclb8/igt@gem_ctx_persistence@vcs1-mixed-process.html

  * igt@gem_exec_schedule@independent-bsd2:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#109276]) +16 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-iclb2/igt@gem_exec_schedule@independent-bsd2.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4019/shard-iclb7/igt@gem_exec_schedule@independent-bsd2.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([i915#677])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-iclb5/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4019/shard-iclb2/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@preempt-bsd:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#112146]) +6 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-iclb3/igt@gem_exec_schedule@preempt-bsd.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4019/shard-iclb4/igt@gem_exec_schedule@preempt-bsd.html

  * igt@gem_exec_store@cachelines-vcs1:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#112080]) +11 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-iclb1/igt@gem_exec_store@cachelines-vcs1.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4019/shard-iclb8/igt@gem_exec_store@cachelines-vcs1.html

  * igt@gem_partial_pwrite_pread@reads-display:
    - shard-hsw:          [PASS][11] -> [FAIL][12] ([i915#694])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-hsw4/igt@gem_partial_pwrite_pread@reads-display.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4019/shard-hsw1/igt@gem_partial_pwrite_pread@reads-display.html

  * igt@gem_persistent_relocs@forked-thrashing:
    - shard-snb:          [PASS][13] -> [DMESG-WARN][14] ([fdo#110789] / [i915#478])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-snb6/igt@gem_persistent_relocs@forked-thrashing.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4019/shard-snb6/igt@gem_persistent_relocs@forked-thrashing.html

  * igt@gem_tiled_blits@interruptible:
    - shard-hsw:          [PASS][15] -> [FAIL][16] ([i915#818])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-hsw8/igt@gem_tiled_blits@interruptible.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4019/shard-hsw8/igt@gem_tiled_blits@interruptible.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-snb:          [PASS][17] -> [DMESG-WARN][18] ([fdo#111870] / [i915#478])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-snb4/igt@gem_userptr_blits@dmabuf-unsync.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4019/shard-snb5/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [PASS][19] -> [INCOMPLETE][20] ([i915#58] / [k.org#198133])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-glk7/igt@gen9_exec_parse@allowed-all.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4019/shard-glk4/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [PASS][21] -> [FAIL][22] ([i915#454])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-iclb5/igt@i915_pm_dc@dc6-dpms.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4019/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html

  * igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack:
    - shard-glk:          [PASS][23] -> [FAIL][24] ([i915#49])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-glk2/igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4019/shard-glk4/igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [PASS][25] -> [DMESG-WARN][26] ([i915#180]) +6 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4019/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:
    - shard-apl:          [PASS][27] -> [DMESG-WARN][28] ([i915#180]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-apl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4019/shard-apl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [PASS][29] -> [SKIP][30] ([fdo#109642] / [fdo#111068])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4019/shard-iclb1/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_sprite_render:
    - shard-iclb:         [PASS][31] -> [SKIP][32] ([fdo#109441]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-iclb2/igt@kms_psr@psr2_sprite_render.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4019/shard-iclb4/igt@kms_psr@psr2_sprite_render.html

  * igt@prime_busy@hang-blt:
    - shard-kbl:          [PASS][33] -> [SKIP][34] ([fdo#109271])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-kbl3/igt@prime_busy@hang-blt.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4019/shard-kbl6/igt@prime_busy@hang-blt.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@vcs1-none:
    - shard-iclb:         [SKIP][35] ([fdo#109276] / [fdo#112080]) -> [PASS][36] +3 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-iclb5/igt@gem_ctx_isolation@vcs1-none.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4019/shard-iclb2/igt@gem_ctx_isolation@vcs1-none.html

  * {igt@gem_ctx_persistence@hostile}:
    - shard-iclb:         [FAIL][37] -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-iclb4/igt@gem_ctx_persistence@hostile.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4019/shard-iclb7/igt@gem_ctx_persistence@hostile.html

  * igt@gem_ctx_persistence@vcs0-queued:
    - shard-tglb:         [INCOMPLETE][39] ([i915#472]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-tglb6/igt@gem_ctx_persistence@vcs0-queued.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4019/shard-tglb7/igt@gem_ctx_persistence@vcs0-queued.html

  * igt@gem_ctx_shared@q-independent-default:
    - shard-kbl:          [FAIL][41] -> [PASS][42] +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-kbl6/igt@gem_ctx_shared@q-independent-default.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4019/shard-kbl6/igt@gem_ctx_shared@q-independent-default.html

  * igt@gem_ctx_shared@q-promotion-vebox:
    - shard-kbl:          [FAIL][43] ([fdo#112118]) -> [PASS][44] +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-kbl6/igt@gem_ctx_shared@q-promotion-vebox.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4019/shard-kbl4/igt@gem_ctx_shared@q-promotion-vebox.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [SKIP][45] ([fdo#112146]) -> [PASS][46] +9 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-iclb1/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4019/shard-iclb8/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_partial_pwrite_pread@writes-after-reads:
    - shard-hsw:          [FAIL][47] -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-hsw2/igt@gem_partial_pwrite_pread@writes-after-reads.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4019/shard-hsw2/igt@gem_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_pwrite@big-cpu-fbr:
    - shard-glk:          [INCOMPLETE][49] ([CI#80] / [i915#58] / [k.org#198133]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-glk2/igt@gem_pwrite@big-cpu-fbr.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4019/shard-glk5/igt@gem_pwrite@big-cpu-fbr.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-random:
    - shard-kbl:          [FAIL][51] ([i915#54]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4019/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][53] ([i915#180]) -> [PASS][54] +5 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4019/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding:
    - shard-apl:          [FAIL][55] ([i915#54]) -> [PASS][56] +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-apl1/igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4019/shard-apl6/igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding.html

  * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
    - shard-tglb:         [FAIL][57] ([IGT#5]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-tglb3/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4019/shard-tglb2/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled:
    - shard-snb:          [DMESG-WARN][59] ([i915#478]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-snb4/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4019/shard-snb6/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-glk:          [FAIL][61] ([i915#79]) -> [PASS][62] +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-glk9/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4019/shard-glk9/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-panning-vs-hang-interruptible:
    - shard-iclb:         [SKIP][63] -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-iclb4/igt@kms_flip@flip-vs-panning-vs-hang-interruptible.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4019/shard-iclb5/igt@kms_flip@flip-vs-panning-vs-hang-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-badstride:
    - shard-glk:          [FAIL][65] ([i915#49]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-glk8/igt@kms_frontbuffer_tracking@fbc-badstride.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4019/shard-glk4/igt@kms_frontbuffer_tracking@fbc-badstride.html
    - shard-apl:          [FAIL][67] ([i915#49]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-apl4/igt@kms_frontbuffer_tracking@fbc-badstride.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4019/shard-apl3/igt@kms_frontbuffer_tracking@fbc-badstride.html
    - shard-kbl:          [FAIL][69] ([i915#49]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-badstride.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4019/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-badstride.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu:
    - shard-tglb:         [SKIP][71] ([i915#668]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4019/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_psr@psr2_cursor_blt:
    - shard-iclb:         [SKIP][73] ([fdo#109441]) -> [PASS][74] +4 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-iclb1/igt@kms_psr@psr2_cursor_blt.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4019/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html

  * igt@kms_setmode@basic:
    - shard-glk:          [FAIL][75] ([i915#31]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-glk1/igt@kms_setmode@basic.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4019/shard-glk8/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-a-wait-busy-hang:
    - shard-kbl:          [SKIP][77] ([fdo#109271]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-kbl6/igt@kms_vblank@pipe-a-wait-busy-hang.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4019/shard-kbl6/igt@kms_vblank@pipe-a-wait-busy-hang.html

  * igt@perf_pmu@busy-hang-vcs1:
    - shard-kbl:          [SKIP][79] ([fdo#109271] / [fdo#112080]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-kbl6/igt@perf_pmu@busy-hang-vcs1.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4019/shard-kbl7/igt@perf_pmu@busy-hang-vcs1.html

  * igt@perf_pmu@busy-vcs1:
    - shard-iclb:         [SKIP][81] ([fdo#112080]) -> [PASS][82] +7 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-iclb7/igt@perf_pmu@busy-vcs1.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4019/shard-iclb1/igt@perf_pmu@busy-vcs1.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [SKIP][83] ([fdo#109276]) -> [PASS][84] +23 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-iclb8/igt@prime_busy@hang-bsd2.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4019/shard-iclb2/igt@prime_busy@hang-bsd2.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [FAIL][85] ([IGT#28]) -> [SKIP][86] ([fdo#109276] / [fdo#112080]) +1 similar issue
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-iclb1/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4019/shard-iclb5/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@gem_tiled_blits@normal:
    - shard-hsw:          [FAIL][87] ([i915#694]) -> [FAIL][88] ([i915#818])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-hsw8/igt@gem_tiled_blits@normal.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4019/shard-hsw6/igt@gem_tiled_blits@normal.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [SKIP][89] ([i915#468]) -> [FAIL][90] ([i915#454])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4019/shard-tglb6/igt@i915_pm_dc@dc6-dpms.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [IGT#5]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/5
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112118]: https://bugs.freedesktop.org/show_bug.cgi?id=112118
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5394 -> IGTPW_4019
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7833: 8210f0f999e2d396a8611e0cabc2f6c6a52468de @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4019: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4019/index.html
  IGT_5394: 991fd07bcd7add7a5beca2c95b72a994e62fbb75 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4019/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
