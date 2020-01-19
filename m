Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sun, 19 Jan 2020 08:28:58 -0000
Message-ID: <157942253851.23913.18345981912039090471@emeril.freedesktop.org>
References: <20200116135546.14003-1-anna.karas@intel.com>
In-Reply-To: <20200116135546.14003-1-anna.karas@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgRGlzdGlu?=
 =?utf-8?q?guish_particular_engines_during_calculating_nop_calibration=2E?=
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
To: Anna Karas <anna.karas@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Distinguish particular engines during calculating nop calibration.
URL   : https://patchwork.freedesktop.org/series/72113/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7754_full -> IGTPW_3928_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3928/index.html

Known issues
------------

  Here are the changes found in IGTPW_3928_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [PASS][1] -> [SKIP][2] ([fdo#112080]) +11 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-iclb1/igt@gem_busy@busy-vcs1.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3928/shard-iclb5/igt@gem_busy@busy-vcs1.html

  * igt@gem_ctx_isolation@vcs1-clean:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#109276] / [fdo#112080]) +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-iclb4/igt@gem_ctx_isolation@vcs1-clean.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3928/shard-iclb5/igt@gem_ctx_isolation@vcs1-clean.html

  * igt@gem_ctx_shared@q-smoketest-bsd1:
    - shard-tglb:         [PASS][5] -> [INCOMPLETE][6] ([fdo#111735] / [i915#472])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-tglb8/igt@gem_ctx_shared@q-smoketest-bsd1.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3928/shard-tglb4/igt@gem_ctx_shared@q-smoketest-bsd1.html

  * igt@gem_eio@kms:
    - shard-tglb:         [PASS][7] -> [INCOMPLETE][8] ([i915#472] / [i915#476])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-tglb8/igt@gem_eio@kms.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3928/shard-tglb6/igt@gem_eio@kms.html

  * igt@gem_eio@reset-stress:
    - shard-tglb:         [PASS][9] -> [INCOMPLETE][10] ([i915#470] / [i915#472]) +2 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-tglb8/igt@gem_eio@reset-stress.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3928/shard-tglb1/igt@gem_eio@reset-stress.html

  * igt@gem_exec_schedule@pi-shared-iova-bsd:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([i915#677])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-iclb8/igt@gem_exec_schedule@pi-shared-iova-bsd.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3928/shard-iclb1/igt@gem_exec_schedule@pi-shared-iova-bsd.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [PASS][13] -> [SKIP][14] ([fdo#112146]) +5 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-iclb8/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3928/shard-iclb1/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_exec_suspend@basic-s4-devices:
    - shard-tglb:         [PASS][15] -> [INCOMPLETE][16] ([i915#460] / [i915#472])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-tglb1/igt@gem_exec_suspend@basic-s4-devices.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3928/shard-tglb3/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@gem_persistent_relocs@forked-faulting-reloc-thrashing:
    - shard-glk:          [PASS][17] -> [INCOMPLETE][18] ([i915#530] / [i915#58] / [k.org#198133])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-glk1/igt@gem_persistent_relocs@forked-faulting-reloc-thrashing.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3928/shard-glk9/igt@gem_persistent_relocs@forked-faulting-reloc-thrashing.html

  * igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing:
    - shard-apl:          [PASS][19] -> [TIMEOUT][20] ([fdo#112271] / [i915#530])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-apl4/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3928/shard-apl1/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html

  * igt@gem_persistent_relocs@forked-interruptible-thrashing:
    - shard-snb:          [PASS][21] -> [FAIL][22] ([i915#520])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-snb6/igt@gem_persistent_relocs@forked-interruptible-thrashing.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3928/shard-snb1/igt@gem_persistent_relocs@forked-interruptible-thrashing.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [PASS][23] -> [FAIL][24] ([i915#644])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-glk9/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3928/shard-glk3/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_sync@basic-each:
    - shard-tglb:         [PASS][25] -> [INCOMPLETE][26] ([i915#472] / [i915#707])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-tglb1/igt@gem_sync@basic-each.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3928/shard-tglb4/igt@gem_sync@basic-each.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-kbl:          [PASS][27] -> [DMESG-WARN][28] ([i915#716])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-kbl7/igt@gen9_exec_parse@allowed-all.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3928/shard-kbl6/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_rps@reset:
    - shard-iclb:         [PASS][29] -> [FAIL][30] ([i915#413])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-iclb1/igt@i915_pm_rps@reset.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3928/shard-iclb1/igt@i915_pm_rps@reset.html

  * igt@i915_suspend@forcewake:
    - shard-kbl:          [PASS][31] -> [DMESG-WARN][32] ([i915#180]) +4 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-kbl1/igt@i915_suspend@forcewake.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3928/shard-kbl7/igt@i915_suspend@forcewake.html

  * igt@kms_big_fb@x-tiled-addfb:
    - shard-kbl:          [PASS][33] -> [DMESG-WARN][34] ([i915#56] / [i915#62] / [i915#92]) +2 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-kbl2/igt@kms_big_fb@x-tiled-addfb.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3928/shard-kbl1/igt@kms_big_fb@x-tiled-addfb.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-kbl:          [PASS][35] -> [DMESG-FAIL][36] ([i915#54] / [i915#56] / [i915#62])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-kbl2/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3928/shard-kbl1/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-apl:          [PASS][37] -> [DMESG-WARN][38] ([i915#180]) +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-apl3/igt@kms_flip@flip-vs-suspend-interruptible.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3928/shard-apl6/igt@kms_flip@flip-vs-suspend-interruptible.html
    - shard-hsw:          [PASS][39] -> [INCOMPLETE][40] ([i915#61])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-hsw2/igt@kms_flip@flip-vs-suspend-interruptible.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3928/shard-hsw5/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-1p-rte:
    - shard-kbl:          [PASS][41] -> [DMESG-WARN][42] ([i915#56] / [i915#62])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-1p-rte.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3928/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-pwrite:
    - shard-tglb:         [PASS][43] -> [FAIL][44] ([i915#49])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-pwrite.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3928/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-pwrite.html

  * igt@kms_plane_lowres@pipe-c-tiling-none:
    - shard-hsw:          [PASS][45] -> [DMESG-WARN][46] ([i915#44])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-hsw2/igt@kms_plane_lowres@pipe-c-tiling-none.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3928/shard-hsw5/igt@kms_plane_lowres@pipe-c-tiling-none.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][47] -> [SKIP][48] ([fdo#109441]) +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3928/shard-iclb5/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@prime_mmap_coherency@ioctl-errors:
    - shard-hsw:          [PASS][49] -> [FAIL][50] ([i915#831])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-hsw5/igt@prime_mmap_coherency@ioctl-errors.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3928/shard-hsw2/igt@prime_mmap_coherency@ioctl-errors.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [PASS][51] -> [SKIP][52] ([fdo#109276]) +19 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-iclb1/igt@prime_vgem@fence-wait-bsd2.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3928/shard-iclb5/igt@prime_vgem@fence-wait-bsd2.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@vcs1-mixed-process:
    - shard-iclb:         [SKIP][53] ([fdo#109276] / [fdo#112080]) -> [PASS][54] +2 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-iclb5/igt@gem_ctx_persistence@vcs1-mixed-process.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3928/shard-iclb4/igt@gem_ctx_persistence@vcs1-mixed-process.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [SKIP][55] ([fdo#110841]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-iclb1/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3928/shard-iclb5/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [SKIP][57] ([fdo#110854]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-iclb5/igt@gem_exec_balancer@smoke.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3928/shard-iclb2/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_create@madvise:
    - shard-tglb:         [INCOMPLETE][59] ([i915#472]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-tglb1/igt@gem_exec_create@madvise.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3928/shard-tglb8/igt@gem_exec_create@madvise.html

  * igt@gem_exec_schedule@preempt-queue-bsd:
    - shard-iclb:         [SKIP][61] ([fdo#112146]) -> [PASS][62] +4 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-iclb2/igt@gem_exec_schedule@preempt-queue-bsd.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3928/shard-iclb6/igt@gem_exec_schedule@preempt-queue-bsd.html

  * igt@gem_exec_schedule@preempt-queue-contexts-bsd1:
    - shard-iclb:         [SKIP][63] ([fdo#109276]) -> [PASS][64] +16 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-iclb6/igt@gem_exec_schedule@preempt-queue-contexts-bsd1.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3928/shard-iclb1/igt@gem_exec_schedule@preempt-queue-contexts-bsd1.html

  * igt@gem_exec_schedule@smoketest-all:
    - shard-tglb:         [INCOMPLETE][65] ([i915#463] / [i915#472]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-tglb4/igt@gem_exec_schedule@smoketest-all.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3928/shard-tglb1/igt@gem_exec_schedule@smoketest-all.html

  * igt@gem_persistent_relocs@forked-faulting-reloc-thrash-inactive:
    - shard-tglb:         [TIMEOUT][67] ([fdo#112271] / [i915#530]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-tglb7/igt@gem_persistent_relocs@forked-faulting-reloc-thrash-inactive.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3928/shard-tglb6/igt@gem_persistent_relocs@forked-faulting-reloc-thrash-inactive.html

  * igt@gem_persistent_relocs@forked-faulting-reloc-thrashing:
    - shard-hsw:          [INCOMPLETE][69] ([i915#530] / [i915#61]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-hsw4/igt@gem_persistent_relocs@forked-faulting-reloc-thrashing.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3928/shard-hsw2/igt@gem_persistent_relocs@forked-faulting-reloc-thrashing.html

  * igt@gem_persistent_relocs@forked-interruptible-thrashing:
    - shard-apl:          [TIMEOUT][71] ([fdo#112271] / [i915#530]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-apl6/igt@gem_persistent_relocs@forked-interruptible-thrashing.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3928/shard-apl3/igt@gem_persistent_relocs@forked-interruptible-thrashing.html

  * igt@gem_persistent_relocs@forked-thrashing:
    - shard-kbl:          [INCOMPLETE][73] ([fdo#103665] / [i915#530]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-kbl1/igt@gem_persistent_relocs@forked-thrashing.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3928/shard-kbl4/igt@gem_persistent_relocs@forked-thrashing.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy-gup:
    - shard-snb:          [DMESG-WARN][75] ([fdo#110789] / [fdo#111870] / [i915#478]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-snb4/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3928/shard-snb4/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup.html

  * igt@i915_selftest@live_gt_timelines:
    - shard-tglb:         [INCOMPLETE][77] ([i915#455] / [i915#472]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-tglb3/igt@i915_selftest@live_gt_timelines.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3928/shard-tglb3/igt@i915_selftest@live_gt_timelines.html

  * igt@i915_suspend@debugfs-reader:
    - shard-iclb:         [DMESG-WARN][79] ([fdo#111764]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-iclb6/igt@i915_suspend@debugfs-reader.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3928/shard-iclb2/igt@i915_suspend@debugfs-reader.html
    - shard-snb:          [DMESG-WARN][81] ([i915#42]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-snb5/igt@i915_suspend@debugfs-reader.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3928/shard-snb2/igt@i915_suspend@debugfs-reader.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding:
    - shard-kbl:          [FAIL][83] ([i915#54]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3928/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding.html
    - shard-apl:          [FAIL][85] ([i915#54]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3928/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-apl:          [DMESG-WARN][87] ([i915#180]) -> [PASS][88] +2 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-apl2/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3928/shard-apl8/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite:
    - shard-tglb:         [FAIL][89] ([i915#49]) -> [PASS][90] +2 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-tglb6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3928/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [DMESG-WARN][91] ([i915#180]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3928/shard-kbl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [SKIP][93] ([fdo#109441]) -> [PASS][94] +3 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-iclb5/igt@kms_psr@psr2_primary_mmap_cpu.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3928/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_universal_plane@universal-plane-pipe-b-functional:
    - shard-apl:          [FAIL][95] ([i915#331]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-apl7/igt@kms_universal_plane@universal-plane-pipe-b-functional.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3928/shard-apl8/igt@kms_universal_plane@universal-plane-pipe-b-functional.html
    - shard-kbl:          [FAIL][97] ([i915#331]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-kbl1/igt@kms_universal_plane@universal-plane-pipe-b-functional.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3928/shard-kbl6/igt@kms_universal_plane@universal-plane-pipe-b-functional.html

  * igt@perf_pmu@busy-no-semaphores-vcs1:
    - shard-iclb:         [SKIP][99] ([fdo#112080]) -> [PASS][100] +5 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-iclb5/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3928/shard-iclb4/igt@perf_pmu@busy-no-semaphores-vcs1.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv-switch:
    - shard-iclb:         [SKIP][101] ([fdo#109276] / [fdo#112080]) -> [FAIL][102] ([IGT#28])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-iclb5/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3928/shard-iclb1/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html

  * igt@gem_eio@kms:
    - shard-snb:          [INCOMPLETE][103] ([i915#82]) -> [DMESG-WARN][104] ([i915#443] / [i915#444])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-snb6/igt@gem_eio@kms.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3928/shard-snb6/igt@gem_eio@kms.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
    - shard-snb:          [DMESG-WARN][105] ([fdo#111870] / [i915#478]) -> [DMESG-WARN][106] ([fdo#110789] / [fdo#111870] / [i915#478]) +1 similar issue
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-snb2/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3928/shard-snb6/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html

  * igt@gem_userptr_blits@sync-unmap-after-close:
    - shard-snb:          [DMESG-WARN][107] ([fdo#110789] / [fdo#111870] / [i915#478]) -> [DMESG-WARN][108] ([fdo#111870] / [i915#478])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-snb5/igt@gem_userptr_blits@sync-unmap-after-close.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3928/shard-snb4/igt@gem_userptr_blits@sync-unmap-after-close.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [SKIP][109] ([i915#468]) -> [FAIL][110] ([i915#454])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-tglb6/igt@i915_pm_dc@dc6-psr.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3928/shard-tglb4/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [SKIP][111] ([fdo#109349]) -> [DMESG-WARN][112] ([fdo#107724])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-iclb6/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3928/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-kbl:          [DMESG-WARN][113] ([i915#180] / [i915#391]) -> [DMESG-WARN][114] ([i915#180])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3928/shard-kbl2/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@runner@aborted:
    - shard-kbl:          [FAIL][115] ([fdo#109383]) -> [FAIL][116] ([i915#716])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-kbl7/igt@runner@aborted.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3928/shard-kbl6/igt@runner@aborted.html

  
  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#107724]: https://bugs.freedesktop.org/show_bug.cgi?id=107724
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109383]: https://bugs.freedesktop.org/show_bug.cgi?id=109383
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111735]: https://bugs.freedesktop.org/show_bug.cgi?id=111735
  [fdo#111764]: https://bugs.freedesktop.org/show_bug.cgi?id=111764
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#331]: https://gitlab.freedesktop.org/drm/intel/issues/331
  [i915#391]: https://gitlab.freedesktop.org/drm/intel/issues/391
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#42]: https://gitlab.freedesktop.org/drm/intel/issues/42
  [i915#44]: https://gitlab.freedesktop.org/drm/intel/issues/44
  [i915#443]: https://gitlab.freedesktop.org/drm/intel/issues/443
  [i915#444]: https://gitlab.freedesktop.org/drm/intel/issues/444
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#455]: https://gitlab.freedesktop.org/drm/intel/issues/455
  [i915#460]: https://gitlab.freedesktop.org/drm/intel/issues/460
  [i915#463]: https://gitlab.freedesktop.org/drm/intel/issues/463
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#470]: https://gitlab.freedesktop.org/drm/intel/issues/470
  [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
  [i915#476]: https://gitlab.freedesktop.org/drm/intel/issues/476
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#520]: https://gitlab.freedesktop.org/drm/intel/issues/520
  [i915#530]: https://gitlab.freedesktop.org/drm/intel/issues/530
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#56]: https://gitlab.freedesktop.org/drm/intel/issues/56
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#707]: https://gitlab.freedesktop.org/drm/intel/issues/707
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#831]: https://gitlab.freedesktop.org/drm/intel/issues/831
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5370 -> IGTPW_3928
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7754: 4db14301dfa813d24cd2ad46552af83d493c5d12 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3928: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3928/index.html
  IGT_5370: a98fb02cc2816a48eec374392d9b6941abb6af2c @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3928/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
