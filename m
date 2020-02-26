Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 26 Feb 2020 19:37:24 -0000
Message-ID: <158274584401.21011.1860990923724686396@emeril.freedesktop.org>
References: <20200225230548.1330092-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200225230548.1330092-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?sw=5Fsync=3A_Fix_race_condition_for_multi-producer_termination?=
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/sw_sync: Fix race condition for multi-producer termination
URL   : https://patchwork.freedesktop.org/series/73931/
State : success

== Summary ==

CI Bug Log - changes from IGT_5467_full -> IGTPW_4224_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4224/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4224_full:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@gem_ctx_ringsize@active@vecs0}:
    - shard-tglb:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-tglb6/igt@gem_ctx_ringsize@active@vecs0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4224/shard-tglb8/igt@gem_ctx_ringsize@active@vecs0.html

  
Known issues
------------

  Here are the changes found in IGTPW_4224_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-kbl:          [PASS][3] -> [INCOMPLETE][4] ([fdo#103665]) +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-kbl6/igt@gem_ctx_isolation@rcs0-s3.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4224/shard-kbl6/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_ctx_shared@exec-shared-gtt-bsd1:
    - shard-tglb:         [PASS][5] -> [FAIL][6] ([i915#616])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-tglb8/igt@gem_ctx_shared@exec-shared-gtt-bsd1.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4224/shard-tglb3/igt@gem_ctx_shared@exec-shared-gtt-bsd1.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#110854])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-iclb4/igt@gem_exec_balancer@smoke.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4224/shard-iclb5/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_schedule@in-order-bsd:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#112146]) +8 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-iclb3/igt@gem_exec_schedule@in-order-bsd.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4224/shard-iclb2/igt@gem_exec_schedule@in-order-bsd.html

  * igt@gem_softpin@noreloc-s3:
    - shard-apl:          [PASS][11] -> [DMESG-WARN][12] ([i915#180])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-apl3/igt@gem_softpin@noreloc-s3.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4224/shard-apl1/igt@gem_softpin@noreloc-s3.html

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-snb:          [PASS][13] -> [DMESG-WARN][14] ([fdo#111870] / [i915#478]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-snb2/igt@gem_userptr_blits@sync-unmap-cycles.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4224/shard-snb5/igt@gem_userptr_blits@sync-unmap-cycles.html
    - shard-hsw:          [PASS][15] -> [DMESG-WARN][16] ([fdo#111870]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-hsw6/igt@gem_userptr_blits@sync-unmap-cycles.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4224/shard-hsw7/igt@gem_userptr_blits@sync-unmap-cycles.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-kbl:          [PASS][17] -> [DMESG-WARN][18] ([i915#716])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-kbl4/igt@gen9_exec_parse@allowed-all.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4224/shard-kbl7/igt@gen9_exec_parse@allowed-all.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [PASS][19] -> [DMESG-WARN][20] ([i915#180]) +6 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4224/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-pwrite:
    - shard-glk:          [PASS][21] -> [FAIL][22] ([i915#49])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-glk4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-pwrite.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4224/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:
    - shard-tglb:         [PASS][23] -> [SKIP][24] ([i915#668])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4224/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_plane_lowres@pipe-a-tiling-y:
    - shard-glk:          [PASS][25] -> [FAIL][26] ([i915#899])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-glk3/igt@kms_plane_lowres@pipe-a-tiling-y.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4224/shard-glk9/igt@kms_plane_lowres@pipe-a-tiling-y.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [PASS][27] -> [SKIP][28] ([fdo#109441])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4224/shard-iclb1/igt@kms_psr@psr2_primary_page_flip.html

  * igt@perf_pmu@busy-check-all-vcs1:
    - shard-iclb:         [PASS][29] -> [SKIP][30] ([fdo#112080]) +12 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-iclb1/igt@perf_pmu@busy-check-all-vcs1.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4224/shard-iclb6/igt@perf_pmu@busy-check-all-vcs1.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [PASS][31] -> [SKIP][32] ([fdo#109276]) +15 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-iclb1/igt@prime_vgem@fence-wait-bsd2.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4224/shard-iclb3/igt@prime_vgem@fence-wait-bsd2.html

  
#### Possible fixes ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [SKIP][33] ([fdo#112080]) -> [PASS][34] +11 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-iclb5/igt@gem_busy@busy-vcs1.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4224/shard-iclb1/igt@gem_busy@busy-vcs1.html

  * {igt@gem_ctx_persistence@close-replace-race}:
    - shard-tglb:         [INCOMPLETE][35] ([i915#1291]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-tglb6/igt@gem_ctx_persistence@close-replace-race.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4224/shard-tglb2/igt@gem_ctx_persistence@close-replace-race.html

  * {igt@gem_exec_schedule@implicit-write-read-bsd}:
    - shard-iclb:         [SKIP][37] ([i915#677]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-iclb1/igt@gem_exec_schedule@implicit-write-read-bsd.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4224/shard-iclb8/igt@gem_exec_schedule@implicit-write-read-bsd.html

  * {igt@gem_exec_schedule@implicit-write-read-bsd2}:
    - shard-iclb:         [SKIP][39] ([fdo#109276] / [i915#677]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-iclb6/igt@gem_exec_schedule@implicit-write-read-bsd2.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4224/shard-iclb4/igt@gem_exec_schedule@implicit-write-read-bsd2.html

  * igt@gem_exec_schedule@preempt-bsd:
    - shard-iclb:         [SKIP][41] ([fdo#112146]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-iclb2/igt@gem_exec_schedule@preempt-bsd.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4224/shard-iclb7/igt@gem_exec_schedule@preempt-bsd.html

  * igt@gem_mmap_offset@pf-nonblock:
    - shard-hsw:          [DMESG-WARN][43] -> [PASS][44] +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-hsw6/igt@gem_mmap_offset@pf-nonblock.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4224/shard-hsw6/igt@gem_mmap_offset@pf-nonblock.html
    - shard-snb:          [DMESG-WARN][45] ([i915#478]) -> [PASS][46] +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-snb2/igt@gem_mmap_offset@pf-nonblock.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4224/shard-snb2/igt@gem_mmap_offset@pf-nonblock.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [FAIL][47] ([i915#644]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-glk1/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4224/shard-glk6/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-180:
    - shard-kbl:          [DMESG-FAIL][49] ([i915#95]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-kbl6/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4224/shard-kbl7/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html

  * igt@kms_color@pipe-c-degamma:
    - shard-apl:          [FAIL][51] ([i915#71]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-apl1/igt@kms_color@pipe-c-degamma.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4224/shard-apl6/igt@kms_color@pipe-c-degamma.html
    - shard-kbl:          [FAIL][53] ([i915#71]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-kbl4/igt@kms_color@pipe-c-degamma.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4224/shard-kbl6/igt@kms_color@pipe-c-degamma.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-apl:          [DMESG-WARN][55] ([i915#180]) -> [PASS][56] +5 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-apl6/igt@kms_flip@flip-vs-suspend-interruptible.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4224/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack:
    - shard-glk:          [FAIL][57] ([i915#49]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4224/shard-glk6/igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:
    - shard-kbl:          [DMESG-WARN][59] ([i915#180]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4224/shard-kbl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [SKIP][61] ([fdo#109441]) -> [PASS][62] +3 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-iclb7/igt@kms_psr@psr2_primary_mmap_cpu.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4224/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][63] ([i915#31]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-apl7/igt@kms_setmode@basic.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4224/shard-apl7/igt@kms_setmode@basic.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [SKIP][65] ([fdo#109276]) -> [PASS][66] +21 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-iclb6/igt@prime_busy@hang-bsd2.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4224/shard-iclb4/igt@prime_busy@hang-bsd2.html

  * igt@sw_sync@sync_multi_producer_single_consumer:
    - shard-kbl:          [TIMEOUT][67] -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-kbl6/igt@sw_sync@sync_multi_producer_single_consumer.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4224/shard-kbl6/igt@sw_sync@sync_multi_producer_single_consumer.html
    - shard-glk:          [TIMEOUT][69] -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-glk7/igt@sw_sync@sync_multi_producer_single_consumer.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4224/shard-glk9/igt@sw_sync@sync_multi_producer_single_consumer.html
    - shard-apl:          [TIMEOUT][71] -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-apl1/igt@sw_sync@sync_multi_producer_single_consumer.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4224/shard-apl2/igt@sw_sync@sync_multi_producer_single_consumer.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [SKIP][73] ([fdo#112080]) -> [FAIL][74] ([IGT#28]) +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-iclb7/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4224/shard-iclb1/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-snb:          [DMESG-WARN][75] ([fdo#110789] / [fdo#111870] / [i915#478]) -> [DMESG-WARN][76] ([fdo#111870] / [i915#478]) +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-snb6/igt@gem_userptr_blits@dmabuf-sync.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4224/shard-snb6/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy-gup:
    - shard-hsw:          [DMESG-WARN][77] ([fdo#110789] / [fdo#111870]) -> [DMESG-WARN][78] ([fdo#111870]) +1 similar issue
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-hsw6/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4224/shard-hsw4/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [FAIL][79] ([i915#454]) -> [SKIP][80] ([i915#468])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-tglb8/igt@i915_pm_dc@dc6-psr.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4224/shard-tglb2/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_content_protection@atomic:
    - shard-kbl:          [TIMEOUT][81] ([i915#1319]) -> [TIMEOUT][82] ([i915#1319] / [i915#727])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-kbl3/igt@kms_content_protection@atomic.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4224/shard-kbl4/igt@kms_content_protection@atomic.html

  * igt@runner@aborted:
    - shard-kbl:          [FAIL][83] ([i915#92]) -> ([FAIL][84], [FAIL][85]) ([i915#716] / [i915#92])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-kbl2/igt@runner@aborted.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4224/shard-kbl3/igt@runner@aborted.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4224/shard-kbl7/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1291]: https://gitlab.freedesktop.org/drm/intel/issues/1291
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#616]: https://gitlab.freedesktop.org/drm/intel/issues/616
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#71]: https://gitlab.freedesktop.org/drm/intel/issues/71
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#727]: https://gitlab.freedesktop.org/drm/intel/issues/727
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5467 -> IGTPW_4224

  CI-20190529: 20190529
  CI_DRM_8005: 81f641f60edbfa1ccb169689206f0af360a06e31 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4224: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4224/index.html
  IGT_5467: 2684f182424582c66e67bcbbda77cd60901627b8 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4224/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
