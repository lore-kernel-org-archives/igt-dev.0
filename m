Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 17 Dec 2019 19:46:07 -0000
Message-ID: <157661196797.21848.8590348812928297796@emeril.freedesktop.org>
References: <20191217112746.1172-1-petri.latvala@intel.com>
In-Reply-To: <20191217112746.1172-1-petri.latvala@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/1=5D_intel-ci=3A_Blacklist_panfrost?=
 =?utf-8?q?_tests_from_shards?=
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

Series: series starting with [i-g-t,1/1] intel-ci: Blacklist panfrost tests from shards
URL   : https://patchwork.freedesktop.org/series/71047/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7580_full -> IGTPW_3872_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3872/index.html

Known issues
------------

  Here are the changes found in IGTPW_3872_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@vcs1-reset:
    - shard-iclb:         [PASS][1] -> [SKIP][2] ([fdo#109276] / [fdo#112080])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7580/shard-iclb1/igt@gem_ctx_isolation@vcs1-reset.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3872/shard-iclb5/igt@gem_ctx_isolation@vcs1-reset.html

  * igt@gem_ctx_shared@exec-shared-gtt-default:
    - shard-hsw:          [PASS][3] -> [INCOMPLETE][4] ([i915#61])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7580/shard-hsw1/igt@gem_ctx_shared@exec-shared-gtt-default.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3872/shard-hsw5/igt@gem_ctx_shared@exec-shared-gtt-default.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd1:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#109276]) +6 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7580/shard-iclb2/igt@gem_ctx_shared@exec-single-timeline-bsd1.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3872/shard-iclb8/igt@gem_ctx_shared@exec-single-timeline-bsd1.html

  * igt@gem_ctx_shared@q-smoketest-bsd:
    - shard-tglb:         [PASS][7] -> [INCOMPLETE][8] ([i915#461])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7580/shard-tglb8/igt@gem_ctx_shared@q-smoketest-bsd.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3872/shard-tglb4/igt@gem_ctx_shared@q-smoketest-bsd.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#110854])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7580/shard-iclb1/igt@gem_exec_balancer@smoke.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3872/shard-iclb6/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_schedule@preempt-queue-bsd:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([fdo#112146])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7580/shard-iclb6/igt@gem_exec_schedule@preempt-queue-bsd.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3872/shard-iclb2/igt@gem_exec_schedule@preempt-queue-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd2:
    - shard-tglb:         [PASS][13] -> [INCOMPLETE][14] ([fdo#111606] / [fdo#111677])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7580/shard-tglb7/igt@gem_exec_schedule@preempt-queue-bsd2.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3872/shard-tglb6/igt@gem_exec_schedule@preempt-queue-bsd2.html

  * igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing:
    - shard-tglb:         [PASS][15] -> [TIMEOUT][16] ([fdo#112126] / [i915#530])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7580/shard-tglb4/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3872/shard-tglb1/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-kbl:          [PASS][17] -> [FAIL][18] ([i915#644])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7580/shard-kbl3/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3872/shard-kbl1/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_softpin@noreloc-s3:
    - shard-glk:          [PASS][19] -> [INCOMPLETE][20] ([i915#58] / [k.org#198133])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7580/shard-glk9/igt@gem_softpin@noreloc-s3.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3872/shard-glk9/igt@gem_softpin@noreloc-s3.html

  * igt@gem_sync@basic-store-all:
    - shard-tglb:         [PASS][21] -> [INCOMPLETE][22] ([i915#472])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7580/shard-tglb1/igt@gem_sync@basic-store-all.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3872/shard-tglb9/igt@gem_sync@basic-store-all.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy-gup:
    - shard-snb:          [PASS][23] -> [DMESG-WARN][24] ([fdo#111870]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7580/shard-snb5/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3872/shard-snb7/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup.html

  * igt@i915_selftest@mock_sanitycheck:
    - shard-kbl:          [PASS][25] -> [DMESG-WARN][26] ([i915#747])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7580/shard-kbl7/igt@i915_selftest@mock_sanitycheck.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3872/shard-kbl6/igt@i915_selftest@mock_sanitycheck.html

  * igt@i915_suspend@debugfs-reader:
    - shard-kbl:          [PASS][27] -> [DMESG-WARN][28] ([i915#180]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7580/shard-kbl1/igt@i915_suspend@debugfs-reader.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3872/shard-kbl7/igt@i915_suspend@debugfs-reader.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding:
    - shard-apl:          [PASS][29] -> [DMESG-WARN][30] ([IGT#6])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7580/shard-apl1/igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3872/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding.html

  * igt@kms_cursor_crc@pipe-b-cursor-128x128-random:
    - shard-hsw:          [PASS][31] -> [DMESG-WARN][32] ([IGT#6])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7580/shard-hsw2/igt@kms_cursor_crc@pipe-b-cursor-128x128-random.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3872/shard-hsw6/igt@kms_cursor_crc@pipe-b-cursor-128x128-random.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-tglb:         [PASS][33] -> [FAIL][34] ([i915#79])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7580/shard-tglb8/igt@kms_flip@flip-vs-expired-vblank.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3872/shard-tglb6/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-cpu:
    - shard-iclb:         [PASS][35] -> [INCOMPLETE][36] ([i915#140])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7580/shard-iclb6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-cpu.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3872/shard-iclb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-glk:          [PASS][37] -> [FAIL][38] ([i915#49])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7580/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3872/shard-glk6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite:
    - shard-iclb:         [PASS][39] -> [INCOMPLETE][40] ([i915#123] / [i915#140])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7580/shard-iclb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3872/shard-iclb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_plane@pixel-format-pipe-a-planes:
    - shard-kbl:          [PASS][41] -> [INCOMPLETE][42] ([fdo#103665] / [i915#648] / [i915#667]) +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7580/shard-kbl1/igt@kms_plane@pixel-format-pipe-a-planes.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3872/shard-kbl3/igt@kms_plane@pixel-format-pipe-a-planes.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-apl:          [PASS][43] -> [DMESG-WARN][44] ([i915#180]) +2 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7580/shard-apl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3872/shard-apl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-tglb:         [PASS][45] -> [FAIL][46] ([fdo#111842] / [i915#608])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7580/shard-tglb3/igt@kms_psr2_su@frontbuffer.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3872/shard-tglb6/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_primary_blt:
    - shard-iclb:         [PASS][47] -> [SKIP][48] ([fdo#109441])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7580/shard-iclb2/igt@kms_psr@psr2_primary_blt.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3872/shard-iclb6/igt@kms_psr@psr2_primary_blt.html

  * igt@perf_pmu@busy-accuracy-98-vcs1:
    - shard-iclb:         [PASS][49] -> [SKIP][50] ([fdo#112080]) +3 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7580/shard-iclb1/igt@perf_pmu@busy-accuracy-98-vcs1.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3872/shard-iclb8/igt@perf_pmu@busy-accuracy-98-vcs1.html

  * igt@prime_mmap_coherency@ioctl-errors:
    - shard-hsw:          [PASS][51] -> [FAIL][52] ([i915#831])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7580/shard-hsw5/igt@prime_mmap_coherency@ioctl-errors.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3872/shard-hsw4/igt@prime_mmap_coherency@ioctl-errors.html

  
#### Possible fixes ####

  * igt@gem_busy@close-race:
    - shard-tglb:         [INCOMPLETE][53] ([i915#435]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7580/shard-tglb6/igt@gem_busy@close-race.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3872/shard-tglb9/igt@gem_busy@close-race.html

  * igt@gem_ctx_persistence@vcs1-mixed:
    - shard-iclb:         [SKIP][55] ([fdo#109276] / [fdo#112080]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7580/shard-iclb3/igt@gem_ctx_persistence@vcs1-mixed.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3872/shard-iclb4/igt@gem_ctx_persistence@vcs1-mixed.html

  * igt@gem_eio@suspend:
    - shard-tglb:         [INCOMPLETE][57] ([i915#460]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7580/shard-tglb4/igt@gem_eio@suspend.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3872/shard-tglb9/igt@gem_eio@suspend.html

  * igt@gem_exec_schedule@reorder-wide-bsd:
    - shard-iclb:         [SKIP][59] ([fdo#112146]) -> [PASS][60] +2 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7580/shard-iclb2/igt@gem_exec_schedule@reorder-wide-bsd.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3872/shard-iclb6/igt@gem_exec_schedule@reorder-wide-bsd.html

  * igt@gem_exec_schedule@smoketest-all:
    - shard-tglb:         [INCOMPLETE][61] ([i915#463]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7580/shard-tglb7/igt@gem_exec_schedule@smoketest-all.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3872/shard-tglb7/igt@gem_exec_schedule@smoketest-all.html

  * igt@gem_persistent_relocs@forked-interruptible-thrashing:
    - shard-hsw:          [FAIL][63] ([i915#520]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7580/shard-hsw6/igt@gem_persistent_relocs@forked-interruptible-thrashing.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3872/shard-hsw2/igt@gem_persistent_relocs@forked-interruptible-thrashing.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [FAIL][65] ([i915#644]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7580/shard-glk7/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3872/shard-glk7/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy:
    - shard-snb:          [DMESG-WARN][67] ([fdo#111870]) -> [PASS][68] +2 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7580/shard-snb7/igt@gem_userptr_blits@map-fixed-invalidate-busy.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3872/shard-snb1/igt@gem_userptr_blits@map-fixed-invalidate-busy.html

  * igt@gem_userptr_blits@sync-unmap:
    - shard-snb:          [DMESG-WARN][69] ([fdo#110789] / [fdo#111870]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7580/shard-snb1/igt@gem_userptr_blits@sync-unmap.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3872/shard-snb7/igt@gem_userptr_blits@sync-unmap.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-kbl:          [DMESG-WARN][71] ([i915#56]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7580/shard-kbl6/igt@gem_workarounds@suspend-resume-fd.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3872/shard-kbl7/igt@gem_workarounds@suspend-resume-fd.html

  * {igt@gen9_exec_parse@allowed-single}:
    - shard-apl:          [DMESG-WARN][73] ([i915#716]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7580/shard-apl4/igt@gen9_exec_parse@allowed-single.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3872/shard-apl3/igt@gen9_exec_parse@allowed-single.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-kbl:          [FAIL][75] ([i915#79]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7580/shard-kbl7/igt@kms_flip@flip-vs-expired-vblank.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3872/shard-kbl2/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-glk:          [FAIL][77] ([i915#49]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7580/shard-glk2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3872/shard-glk6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [DMESG-WARN][79] ([i915#180]) -> [PASS][80] +4 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7580/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3872/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move:
    - shard-iclb:         [INCOMPLETE][81] ([i915#123] / [i915#140]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7580/shard-iclb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3872/shard-iclb6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary:
    - shard-tglb:         [FAIL][83] ([i915#49]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7580/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3872/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render:
    - shard-tglb:         [INCOMPLETE][85] ([i915#667]) -> [PASS][86] +1 similar issue
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7580/shard-tglb2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3872/shard-tglb1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-apl:          [DMESG-WARN][87] ([i915#180]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7580/shard-apl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3872/shard-apl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-tglb:         [INCOMPLETE][89] ([i915#456] / [i915#460]) -> [PASS][90] +1 similar issue
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7580/shard-tglb2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3872/shard-tglb9/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_plane_scaling@pipe-d-scaler-with-rotation:
    - shard-tglb:         [INCOMPLETE][91] ([i915#470]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7580/shard-tglb6/igt@kms_plane_scaling@pipe-d-scaler-with-rotation.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3872/shard-tglb9/igt@kms_plane_scaling@pipe-d-scaler-with-rotation.html

  * igt@perf_pmu@busy-check-all-vcs1:
    - shard-iclb:         [SKIP][93] ([fdo#112080]) -> [PASS][94] +3 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7580/shard-iclb6/igt@perf_pmu@busy-check-all-vcs1.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3872/shard-iclb4/igt@perf_pmu@busy-check-all-vcs1.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [SKIP][95] ([fdo#109276]) -> [PASS][96] +7 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7580/shard-iclb3/igt@prime_vgem@fence-wait-bsd2.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3872/shard-iclb2/igt@prime_vgem@fence-wait-bsd2.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-s3:
    - shard-kbl:          [DMESG-WARN][97] ([i915#180]) -> [INCOMPLETE][98] ([fdo#103665])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7580/shard-kbl3/igt@gem_ctx_isolation@vcs1-s3.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3872/shard-kbl6/igt@gem_ctx_isolation@vcs1-s3.html

  * igt@gem_tiled_blits@normal:
    - shard-hsw:          [FAIL][99] ([i915#832]) -> [FAIL][100] ([i915#818])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7580/shard-hsw4/igt@gem_tiled_blits@normal.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3872/shard-hsw8/igt@gem_tiled_blits@normal.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#6]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/6
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111606]: https://bugs.freedesktop.org/show_bug.cgi?id=111606
  [fdo#111677]: https://bugs.freedesktop.org/show_bug.cgi?id=111677
  [fdo#111842]: https://bugs.freedesktop.org/show_bug.cgi?id=111842
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112126]: https://bugs.freedesktop.org/show_bug.cgi?id=112126
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#123]: https://gitlab.freedesktop.org/drm/intel/issues/123
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#435]: https://gitlab.freedesktop.org/drm/intel/issues/435
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#460]: https://gitlab.freedesktop.org/drm/intel/issues/460
  [i915#461]: https://gitlab.freedesktop.org/drm/intel/issues/461
  [i915#463]: https://gitlab.freedesktop.org/drm/intel/issues/463
  [i915#470]: https://gitlab.freedesktop.org/drm/intel/issues/470
  [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#520]: https://gitlab.freedesktop.org/drm/intel/issues/520
  [i915#530]: https://gitlab.freedesktop.org/drm/intel/issues/530
  [i915#56]: https://gitlab.freedesktop.org/drm/intel/issues/56
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#608]: https://gitlab.freedesktop.org/drm/intel/issues/608
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#648]: https://gitlab.freedesktop.org/drm/intel/issues/648
  [i915#667]: https://gitlab.freedesktop.org/drm/intel/issues/667
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#747]: https://gitlab.freedesktop.org/drm/intel/issues/747
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#831]: https://gitlab.freedesktop.org/drm/intel/issues/831
  [i915#832]: https://gitlab.freedesktop.org/drm/intel/issues/832
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5349 -> IGTPW_3872
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7580: 4154d505504bd58e3cc90d27f7221c3d29045b51 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3872: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3872/index.html
  IGT_5349: 048f58513d8b8ec6bb307a939f0ac959bc0f0e10 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3872/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
