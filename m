Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 24 Feb 2020 09:27:09 -0000
Message-ID: <158253642914.28363.10739775535434005099@emeril.freedesktop.org>
References: <20200221103829.28470-1-petri.latvala@intel.com>
In-Reply-To: <20200221103829.28470-1-petri.latvala@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdG9vbHMv?=
 =?utf-8?q?i915-perf=3A_Fix_compiler_warning_=28rev2=29?=
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

Series: tools/i915-perf: Fix compiler warning (rev2)
URL   : https://patchwork.freedesktop.org/series/73714/
State : success

== Summary ==

CI Bug Log - changes from IGT_5457_full -> IGTPW_4207_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4207/index.html

Known issues
------------

  Here are the changes found in IGTPW_4207_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [PASS][1] -> [SKIP][2] ([fdo#112080]) +10 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-iclb4/igt@gem_exec_parallel@vcs1-fds.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4207/shard-iclb7/igt@gem_exec_parallel@vcs1-fds.html

  * igt@gem_exec_schedule@independent-bsd2:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#109276]) +15 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-iclb2/igt@gem_exec_schedule@independent-bsd2.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4207/shard-iclb6/igt@gem_exec_schedule@independent-bsd2.html

  * igt@gem_exec_schedule@pi-shared-iova-bsd:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([i915#677])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-iclb8/igt@gem_exec_schedule@pi-shared-iova-bsd.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4207/shard-iclb1/igt@gem_exec_schedule@pi-shared-iova-bsd.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#112146]) +4 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-iclb3/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4207/shard-iclb2/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-kbl:          [PASS][9] -> [FAIL][10] ([i915#644])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-kbl3/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4207/shard-kbl6/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-snb:          [PASS][11] -> [DMESG-WARN][12] ([fdo#111870] / [i915#478])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-snb6/igt@gem_userptr_blits@dmabuf-sync.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4207/shard-snb5/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [PASS][13] -> [DMESG-WARN][14] ([i915#716])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-glk2/igt@gen9_exec_parse@allowed-all.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4207/shard-glk2/igt@gen9_exec_parse@allowed-all.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-xtiled:
    - shard-snb:          [PASS][15] -> [DMESG-WARN][16] ([i915#478])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-snb4/igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-xtiled.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4207/shard-snb1/igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-xtiled.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-glk:          [PASS][17] -> [FAIL][18] ([i915#79])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4207/shard-glk1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-modeset-vs-hang-interruptible:
    - shard-glk:          [PASS][19] -> [TIMEOUT][20] ([fdo#112271]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-glk8/igt@kms_flip@flip-vs-modeset-vs-hang-interruptible.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4207/shard-glk6/igt@kms_flip@flip-vs-modeset-vs-hang-interruptible.html

  * igt@kms_flip@flip-vs-panning-vs-hang-interruptible:
    - shard-tglb:         [PASS][21] -> [TIMEOUT][22] ([fdo#112271] / [i915#561]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-tglb5/igt@kms_flip@flip-vs-panning-vs-hang-interruptible.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4207/shard-tglb6/igt@kms_flip@flip-vs-panning-vs-hang-interruptible.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-fullscreen:
    - shard-tglb:         [PASS][23] -> [SKIP][24] ([i915#668]) +5 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-tglb8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-fullscreen.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4207/shard-tglb5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [PASS][25] -> [FAIL][26] ([i915#899])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-glk5/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4207/shard-glk7/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [PASS][27] -> [SKIP][28] ([fdo#109642] / [fdo#111068])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4207/shard-iclb3/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_primary_mmap_gtt:
    - shard-iclb:         [PASS][29] -> [SKIP][30] ([fdo#109441]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-iclb2/igt@kms_psr@psr2_primary_mmap_gtt.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4207/shard-iclb4/igt@kms_psr@psr2_primary_mmap_gtt.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [PASS][31] -> [DMESG-WARN][32] ([i915#180]) +4 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4207/shard-kbl1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@kms_vblank@pipe-c-ts-continuation-suspend:
    - shard-kbl:          [PASS][33] -> [INCOMPLETE][34] ([fdo#103665])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-kbl1/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4207/shard-kbl2/igt@kms_vblank@pipe-c-ts-continuation-suspend.html

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [PASS][35] -> [TIMEOUT][36] ([fdo#112271] / [i915#1085])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-tglb3/igt@perf@gen12-mi-rpc.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4207/shard-tglb3/igt@perf@gen12-mi-rpc.html

  * igt@perf@short-reads:
    - shard-apl:          [PASS][37] -> [TIMEOUT][38] ([fdo#112271] / [i915#51])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-apl8/igt@perf@short-reads.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4207/shard-apl8/igt@perf@short-reads.html

  * igt@sw_sync@sync_multi_producer_single_consumer:
    - shard-snb:          [PASS][39] -> [TIMEOUT][40] ([fdo#112271])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-snb4/igt@sw_sync@sync_multi_producer_single_consumer.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4207/shard-snb2/igt@sw_sync@sync_multi_producer_single_consumer.html

  
#### Possible fixes ####

  * {igt@gem_ctx_persistence@legacy-engines-hostile@default}:
    - shard-glk:          [FAIL][41] -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-glk4/igt@gem_ctx_persistence@legacy-engines-hostile@default.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4207/shard-glk6/igt@gem_ctx_persistence@legacy-engines-hostile@default.html

  * igt@gem_exec_balancer@hang:
    - shard-tglb:         [FAIL][43] ([i915#1277]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-tglb6/igt@gem_exec_balancer@hang.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4207/shard-tglb6/igt@gem_exec_balancer@hang.html

  * {igt@gem_exec_schedule@implicit-read-write-bsd1}:
    - shard-iclb:         [SKIP][45] ([fdo#109276] / [i915#677]) -> [PASS][46] +2 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-iclb8/igt@gem_exec_schedule@implicit-read-write-bsd1.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4207/shard-iclb4/igt@gem_exec_schedule@implicit-read-write-bsd1.html

  * igt@gem_exec_schedule@out-order-bsd2:
    - shard-iclb:         [SKIP][47] ([fdo#109276]) -> [PASS][48] +21 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-iclb5/igt@gem_exec_schedule@out-order-bsd2.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4207/shard-iclb2/igt@gem_exec_schedule@out-order-bsd2.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [SKIP][49] ([i915#677]) -> [PASS][50] +3 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-iclb4/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4207/shard-iclb8/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@wide-bsd:
    - shard-iclb:         [SKIP][51] ([fdo#112146]) -> [PASS][52] +2 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-iclb4/igt@gem_exec_schedule@wide-bsd.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4207/shard-iclb3/igt@gem_exec_schedule@wide-bsd.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [FAIL][53] ([i915#644]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-glk5/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4207/shard-glk9/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_userptr_blits@sync-unmap:
    - shard-snb:          [DMESG-WARN][55] ([fdo#111870] / [i915#478]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-snb2/igt@gem_userptr_blits@sync-unmap.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4207/shard-snb1/igt@gem_userptr_blits@sync-unmap.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][57] ([i915#454]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-iclb8/igt@i915_pm_dc@dc6-psr.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4207/shard-iclb1/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_selftest@live_gt_lrc:
    - shard-tglb:         [DMESG-FAIL][59] ([i915#1233]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-tglb2/igt@i915_selftest@live_gt_lrc.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4207/shard-tglb2/igt@i915_selftest@live_gt_lrc.html

  * igt@i915_selftest@live_gtt:
    - shard-apl:          [TIMEOUT][61] ([fdo#112271]) -> [PASS][62] +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-apl1/igt@i915_selftest@live_gtt.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4207/shard-apl4/igt@i915_selftest@live_gtt.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-apl:          [DMESG-WARN][63] ([i915#180]) -> [PASS][64] +3 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-apl8/igt@i915_suspend@fence-restore-tiled2untiled.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4207/shard-apl7/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_cursor_crc@pipe-c-cursor-256x85-onscreen:
    - shard-apl:          [FAIL][65] ([i915#54]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-256x85-onscreen.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4207/shard-apl4/igt@kms_cursor_crc@pipe-c-cursor-256x85-onscreen.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt:
    - shard-kbl:          [FAIL][67] ([i915#49]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4207/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html
    - shard-apl:          [FAIL][69] ([i915#49]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-apl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4207/shard-apl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html
    - shard-glk:          [FAIL][71] ([i915#49]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-glk1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4207/shard-glk5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [DMESG-WARN][73] ([i915#180]) -> [PASS][74] +2 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4207/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:
    - shard-tglb:         [SKIP][75] ([i915#668]) -> [PASS][76] +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4207/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-kbl:          [INCOMPLETE][77] ([fdo#103665]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-kbl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4207/shard-kbl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [FAIL][79] ([i915#31]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-kbl4/igt@kms_setmode@basic.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4207/shard-kbl7/igt@kms_setmode@basic.html

  * igt@perf_pmu@busy-no-semaphores-vcs1:
    - shard-iclb:         [SKIP][81] ([fdo#112080]) -> [PASS][82] +16 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-iclb7/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4207/shard-iclb1/igt@perf_pmu@busy-no-semaphores-vcs1.html

  * igt@sw_sync@sync_multi_producer_single_consumer:
    - shard-iclb:         [TIMEOUT][83] ([fdo#112271]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-iclb3/igt@sw_sync@sync_multi_producer_single_consumer.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4207/shard-iclb6/igt@sw_sync@sync_multi_producer_single_consumer.html

  
#### Warnings ####

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
    - shard-snb:          [DMESG-WARN][85] ([fdo#110789] / [fdo#111870] / [i915#478]) -> [DMESG-WARN][86] ([fdo#111870] / [i915#478])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-snb1/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4207/shard-snb4/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html

  * igt@kms_content_protection@atomic:
    - shard-kbl:          [TIMEOUT][87] ([fdo#112271] / [i915#727]) -> [TIMEOUT][88] ([fdo#112271])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-kbl7/igt@kms_content_protection@atomic.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4207/shard-kbl2/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@lic:
    - shard-kbl:          [TIMEOUT][89] ([fdo#112271]) -> [TIMEOUT][90] ([fdo#112271] / [i915#727])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-kbl1/igt@kms_content_protection@lic.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4207/shard-kbl1/igt@kms_content_protection@lic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
  [i915#1233]: https://gitlab.freedesktop.org/drm/intel/issues/1233
  [i915#1277]: https://gitlab.freedesktop.org/drm/intel/issues/1277
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#51]: https://gitlab.freedesktop.org/drm/intel/issues/51
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#561]: https://gitlab.freedesktop.org/drm/intel/issues/561
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#727]: https://gitlab.freedesktop.org/drm/intel/issues/727
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5457 -> IGTPW_4207

  CI-20190529: 20190529
  CI_DRM_7980: 27a7d60b2dd30ef9901b912893835949fd369432 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4207: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4207/index.html
  IGT_5457: 3e686098d928aa928f668e00fa01e92234e173ff @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4207/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
