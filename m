Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 13 Feb 2020 23:51:08 -0000
Message-ID: <158163786857.17960.15993248201165306233@emeril.freedesktop.org>
References: <20200212091401.26642-1-dominik.grzegorzek@intel.com>
In-Reply-To: <20200212091401.26642-1-dominik.grzegorzek@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?gem=5Fexec=5Falignment=2Ec=3A_Update_to_be_completable_in_a_rat?=
 =?utf-8?q?ional_time=2E?=
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
To: "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/gem_exec_alignment.c: Update to be completable in a rational time.
URL   : https://patchwork.freedesktop.org/series/73325/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7917_full -> IGTPW_4132_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4132_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4132_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4132/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4132_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_universal_plane@universal-plane-pipe-a-functional:
    - shard-tglb:         [PASS][1] -> [FAIL][2] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7917/shard-tglb8/igt@kms_universal_plane@universal-plane-pipe-a-functional.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4132/shard-tglb3/igt@kms_universal_plane@universal-plane-pipe-a-functional.html

  
Known issues
------------

  Here are the changes found in IGTPW_4132_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#112146]) +9 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7917/shard-iclb6/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4132/shard-iclb4/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-snb:          [PASS][5] -> [DMESG-WARN][6] ([fdo#111870] / [i915#478])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7917/shard-snb4/igt@gem_userptr_blits@dmabuf-unsync.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4132/shard-snb4/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-kbl:          [PASS][7] -> [DMESG-WARN][8] ([i915#716])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7917/shard-kbl7/igt@gen9_exec_parse@allowed-all.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4132/shard-kbl3/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_suspend@sysfs-reader:
    - shard-kbl:          [PASS][9] -> [DMESG-WARN][10] ([i915#180]) +4 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7917/shard-kbl3/igt@i915_suspend@sysfs-reader.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4132/shard-kbl2/igt@i915_suspend@sysfs-reader.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [PASS][11] -> [INCOMPLETE][12] ([fdo#103665])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7917/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4132/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-apl:          [PASS][13] -> [DMESG-WARN][14] ([i915#180])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7917/shard-apl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4132/shard-apl4/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_cursor_edge_walk@pipe-a-256x256-bottom-edge:
    - shard-tglb:         [PASS][15] -> [FAIL][16] ([i915#70])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7917/shard-tglb5/igt@kms_cursor_edge_walk@pipe-a-256x256-bottom-edge.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4132/shard-tglb6/igt@kms_cursor_edge_walk@pipe-a-256x256-bottom-edge.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic:
    - shard-tglb:         [PASS][17] -> [FAIL][18] ([i915#1173])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7917/shard-tglb2/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4132/shard-tglb3/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html

  * igt@kms_flip_tiling@flip-y-tiled:
    - shard-tglb:         [PASS][19] -> [DMESG-FAIL][20] ([i915#402]) +2 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7917/shard-tglb3/igt@kms_flip_tiling@flip-y-tiled.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4132/shard-tglb2/igt@kms_flip_tiling@flip-y-tiled.html

  * igt@kms_plane_cursor@pipe-a-primary-size-64:
    - shard-tglb:         [PASS][21] -> [FAIL][22] ([i915#1139]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7917/shard-tglb7/igt@kms_plane_cursor@pipe-a-primary-size-64.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4132/shard-tglb7/igt@kms_plane_cursor@pipe-a-primary-size-64.html

  * igt@kms_plane_lowres@pipe-c-tiling-none:
    - shard-hsw:          [PASS][23] -> [INCOMPLETE][24] ([i915#61])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7917/shard-hsw2/igt@kms_plane_lowres@pipe-c-tiling-none.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4132/shard-hsw8/igt@kms_plane_lowres@pipe-c-tiling-none.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [PASS][25] -> [FAIL][26] ([i915#173])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7917/shard-iclb2/igt@kms_psr@no_drrs.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4132/shard-iclb1/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][27] -> [SKIP][28] ([fdo#109441]) +2 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7917/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4132/shard-iclb4/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@perf_pmu@busy-accuracy-2-vcs1:
    - shard-iclb:         [PASS][29] -> [SKIP][30] ([fdo#112080]) +8 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7917/shard-iclb2/igt@perf_pmu@busy-accuracy-2-vcs1.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4132/shard-iclb7/igt@perf_pmu@busy-accuracy-2-vcs1.html

  * igt@prime_mmap_coherency@write:
    - shard-hsw:          [PASS][31] -> [FAIL][32] ([i915#914])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7917/shard-hsw5/igt@prime_mmap_coherency@write.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4132/shard-hsw5/igt@prime_mmap_coherency@write.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [PASS][33] -> [SKIP][34] ([fdo#109276]) +11 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7917/shard-iclb1/igt@prime_vgem@fence-wait-bsd2.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4132/shard-iclb3/igt@prime_vgem@fence-wait-bsd2.html

  
#### Possible fixes ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [SKIP][35] ([fdo#112080]) -> [PASS][36] +16 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7917/shard-iclb7/igt@gem_busy@busy-vcs1.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4132/shard-iclb1/igt@gem_busy@busy-vcs1.html

  * igt@gem_exec_async@concurrent-writes-bsd:
    - shard-iclb:         [SKIP][37] ([fdo#112146]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7917/shard-iclb2/igt@gem_exec_async@concurrent-writes-bsd.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4132/shard-iclb3/igt@gem_exec_async@concurrent-writes-bsd.html

  * igt@gem_exec_balancer@hang:
    - shard-iclb:         [TIMEOUT][39] ([fdo#112271]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7917/shard-iclb2/igt@gem_exec_balancer@hang.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4132/shard-iclb3/igt@gem_exec_balancer@hang.html

  * igt@gem_exec_schedule@pi-shared-iova-bsd:
    - shard-iclb:         [SKIP][41] ([i915#677]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7917/shard-iclb4/igt@gem_exec_schedule@pi-shared-iova-bsd.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4132/shard-iclb8/igt@gem_exec_schedule@pi-shared-iova-bsd.html

  * igt@gem_tiled_partial_pwrite_pread@writes-after-reads:
    - shard-hsw:          [FAIL][43] ([i915#817]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7917/shard-hsw6/igt@gem_tiled_partial_pwrite_pread@writes-after-reads.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4132/shard-hsw5/igt@gem_tiled_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_userptr_blits@sync-unmap-after-close:
    - shard-snb:          [DMESG-WARN][45] ([fdo#111870] / [i915#478]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7917/shard-snb2/igt@gem_userptr_blits@sync-unmap-after-close.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4132/shard-snb5/igt@gem_userptr_blits@sync-unmap-after-close.html

  * igt@i915_pm_rps@reset:
    - shard-iclb:         [FAIL][47] ([i915#413]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7917/shard-iclb8/igt@i915_pm_rps@reset.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4132/shard-iclb8/igt@i915_pm_rps@reset.html

  * igt@kms_color@pipe-a-degamma:
    - shard-tglb:         [FAIL][49] ([i915#1149]) -> [PASS][50] +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7917/shard-tglb3/igt@kms_color@pipe-a-degamma.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4132/shard-tglb3/igt@kms_color@pipe-a-degamma.html

  * igt@kms_color@pipe-c-ctm-max:
    - shard-kbl:          [FAIL][51] ([i915#168]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7917/shard-kbl2/igt@kms_color@pipe-c-ctm-max.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4132/shard-kbl6/igt@kms_color@pipe-c-ctm-max.html
    - shard-apl:          [FAIL][53] ([i915#168]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7917/shard-apl2/igt@kms_color@pipe-c-ctm-max.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4132/shard-apl6/igt@kms_color@pipe-c-ctm-max.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen:
    - shard-tglb:         [FAIL][55] ([fdo#111703]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7917/shard-tglb5/igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4132/shard-tglb8/igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-64x64-sliding:
    - shard-apl:          [FAIL][57] ([i915#54]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7917/shard-apl3/igt@kms_cursor_crc@pipe-b-cursor-64x64-sliding.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4132/shard-apl3/igt@kms_cursor_crc@pipe-b-cursor-64x64-sliding.html

  * igt@kms_draw_crc@draw-method-rgb565-blt-ytiled:
    - shard-tglb:         [DMESG-FAIL][59] ([i915#402]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7917/shard-tglb2/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4132/shard-tglb2/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled:
    - shard-tglb:         [FAIL][61] ([i915#559]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7917/shard-tglb5/igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4132/shard-tglb3/igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-glk:          [FAIL][63] ([i915#34]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7917/shard-glk6/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4132/shard-glk7/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-apl:          [DMESG-WARN][65] ([i915#180]) -> [PASS][66] +5 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7917/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4132/shard-apl3/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render:
    - shard-snb:          [DMESG-WARN][67] ([i915#478]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7917/shard-snb4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4132/shard-snb5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [FAIL][69] ([i915#899]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7917/shard-glk1/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4132/shard-glk6/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [SKIP][71] ([fdo#109441]) -> [PASS][72] +1 similar issue
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7917/shard-iclb3/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4132/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@perf@rc6-disable:
    - shard-iclb:         [SKIP][73] ([i915#405]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7917/shard-iclb4/igt@perf@rc6-disable.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4132/shard-iclb7/igt@perf@rc6-disable.html
    - shard-hsw:          [SKIP][75] ([fdo#109271]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7917/shard-hsw1/igt@perf@rc6-disable.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4132/shard-hsw6/igt@perf@rc6-disable.html
    - shard-kbl:          [SKIP][77] ([fdo#109271]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7917/shard-kbl2/igt@perf@rc6-disable.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4132/shard-kbl3/igt@perf@rc6-disable.html
    - shard-apl:          [SKIP][79] ([fdo#109271]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7917/shard-apl2/igt@perf@rc6-disable.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4132/shard-apl4/igt@perf@rc6-disable.html
    - shard-tglb:         [SKIP][81] ([fdo#111719] / [i915#405]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7917/shard-tglb8/igt@perf@rc6-disable.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4132/shard-tglb6/igt@perf@rc6-disable.html
    - shard-glk:          [SKIP][83] ([fdo#109271]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7917/shard-glk8/igt@perf@rc6-disable.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4132/shard-glk6/igt@perf@rc6-disable.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [SKIP][85] ([fdo#109276]) -> [PASS][86] +17 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7917/shard-iclb3/igt@prime_busy@hang-bsd2.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4132/shard-iclb4/igt@prime_busy@hang-bsd2.html

  
#### Warnings ####

  * igt@gem_tiled_blits@interruptible:
    - shard-hsw:          [FAIL][87] ([i915#818]) -> [FAIL][88] ([i915#694])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7917/shard-hsw1/igt@gem_tiled_blits@interruptible.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4132/shard-hsw5/igt@gem_tiled_blits@interruptible.html

  * igt@gem_tiled_blits@normal:
    - shard-hsw:          [FAIL][89] ([i915#694]) -> [FAIL][90] ([i915#818])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7917/shard-hsw1/igt@gem_tiled_blits@normal.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4132/shard-hsw8/igt@gem_tiled_blits@normal.html

  * igt@i915_pm_rpm@universal-planes:
    - shard-snb:          [INCOMPLETE][91] ([i915#82]) -> [SKIP][92] ([fdo#109271])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7917/shard-snb5/igt@i915_pm_rpm@universal-planes.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4132/shard-snb6/igt@i915_pm_rpm@universal-planes.html

  * igt@runner@aborted:
    - shard-snb:          ([FAIL][93], [FAIL][94], [FAIL][95], [FAIL][96], [FAIL][97], [FAIL][98], [FAIL][99], [FAIL][100]) ([fdo#111870] / [i915#1077] / [i915#698]) -> ([FAIL][101], [FAIL][102], [FAIL][103], [FAIL][104], [FAIL][105], [FAIL][106], [FAIL][107], [FAIL][108]) ([fdo#111870] / [i915#1077])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7917/shard-snb6/igt@runner@aborted.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7917/shard-snb6/igt@runner@aborted.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7917/shard-snb2/igt@runner@aborted.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7917/shard-snb2/igt@runner@aborted.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7917/shard-snb4/igt@runner@aborted.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7917/shard-snb5/igt@runner@aborted.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7917/shard-snb4/igt@runner@aborted.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7917/shard-snb2/igt@runner@aborted.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4132/shard-snb4/igt@runner@aborted.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4132/shard-snb6/igt@runner@aborted.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4132/shard-snb6/igt@runner@aborted.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4132/shard-snb5/igt@runner@aborted.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4132/shard-snb4/igt@runner@aborted.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4132/shard-snb4/igt@runner@aborted.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4132/shard-snb5/igt@runner@aborted.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4132/shard-snb5/igt@runner@aborted.html

  
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#111703]: https://bugs.freedesktop.org/show_bug.cgi?id=111703
  [fdo#111719]: https://bugs.freedesktop.org/show_bug.cgi?id=111719
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1077]: https://gitlab.freedesktop.org/drm/intel/issues/1077
  [i915#1139]: https://gitlab.freedesktop.org/drm/intel/issues/1139
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#1173]: https://gitlab.freedesktop.org/drm/intel/issues/1173
  [i915#168]: https://gitlab.freedesktop.org/drm/intel/issues/168
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#34]: https://gitlab.freedesktop.org/drm/intel/issues/34
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#405]: https://gitlab.freedesktop.org/drm/intel/issues/405
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#559]: https://gitlab.freedesktop.org/drm/intel/issues/559
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#698]: https://gitlab.freedesktop.org/drm/intel/issues/698
  [i915#70]: https://gitlab.freedesktop.org/drm/intel/issues/70
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#817]: https://gitlab.freedesktop.org/drm/intel/issues/817
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [i915#914]: https://gitlab.freedesktop.org/drm/intel/issues/914


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5435 -> IGTPW_4132
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7917: 57a1e61c216bb9ef9dcd9dca1681266510a837f6 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4132: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4132/index.html
  IGT_5435: 2b6d4476dde53c363b8808ed9f0dd5547ac78641 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4132/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
