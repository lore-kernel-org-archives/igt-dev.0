Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 10 Dec 2019 20:14:57 -0000
Message-ID: <157600889768.23232.6176880247312829061@emeril.freedesktop.org>
References: <20191210101519.29171-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20191210101519.29171-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fmmap=5Foffset=3A_add_new_tests_to_extend_coverage_?=
 =?utf-8?b?KHJldjQp?=
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

Series: tests/i915/gem_mmap_offset: add new tests to extend coverage (rev4)
URL   : https://patchwork.freedesktop.org/series/70549/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7528_full -> IGTPW_3837_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_3837_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_3837_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3837/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_3837_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_persistent_relocs@forked-faulting-reloc:
    - shard-iclb:         [PASS][1] -> [TIMEOUT][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-iclb3/igt@gem_persistent_relocs@forked-faulting-reloc.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3837/shard-iclb7/igt@gem_persistent_relocs@forked-faulting-reloc.html

  
New tests
---------

  New tests have been introduced between CI_DRM_7528_full and IGTPW_3837_full:

### New IGT tests (1) ###

  * igt@gem_mmap_offset@coherency:
    - Statuses : 6 pass(s)
    - Exec time: [0.02, 0.03] s

  

Known issues
------------

  Here are the changes found in IGTPW_3837_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@bcs0-s3:
    - shard-apl:          [PASS][3] -> [DMESG-WARN][4] ([i915#180]) +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-apl1/igt@gem_ctx_isolation@bcs0-s3.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3837/shard-apl4/igt@gem_ctx_isolation@bcs0-s3.html

  * igt@gem_exec_parallel@contexts:
    - shard-tglb:         [PASS][5] -> [INCOMPLETE][6] ([i915#470])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-tglb5/igt@gem_exec_parallel@contexts.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3837/shard-tglb6/igt@gem_exec_parallel@contexts.html

  * igt@gem_exec_schedule@preempt-queue-contexts-bsd:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#112146])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-iclb8/igt@gem_exec_schedule@preempt-queue-contexts-bsd.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3837/shard-iclb2/igt@gem_exec_schedule@preempt-queue-contexts-bsd.html

  * igt@gem_exec_schedule@smoketest-bsd1:
    - shard-tglb:         [PASS][9] -> [INCOMPLETE][10] ([i915#463])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-tglb6/igt@gem_exec_schedule@smoketest-bsd1.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3837/shard-tglb3/igt@gem_exec_schedule@smoketest-bsd1.html

  * igt@gem_persistent_relocs@forked-faulting-reloc-thrashing:
    - shard-hsw:          [PASS][11] -> [INCOMPLETE][12] ([i915#61])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-hsw4/igt@gem_persistent_relocs@forked-faulting-reloc-thrashing.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3837/shard-hsw6/igt@gem_persistent_relocs@forked-faulting-reloc-thrashing.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-kbl:          [PASS][13] -> [FAIL][14] ([i915#644])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-kbl3/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3837/shard-kbl6/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_sync@basic-store-each:
    - shard-tglb:         [PASS][15] -> [INCOMPLETE][16] ([i915#435] / [i915#472])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-tglb4/igt@gem_sync@basic-store-each.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3837/shard-tglb7/igt@gem_sync@basic-store-each.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-snb:          [PASS][17] -> [DMESG-WARN][18] ([fdo#111870]) +2 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-snb5/igt@gem_userptr_blits@dmabuf-sync.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3837/shard-snb1/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@i915_pm_rpm@system-suspend-devices:
    - shard-tglb:         [PASS][19] -> [INCOMPLETE][20] ([i915#456] / [i915#460]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-tglb6/igt@i915_pm_rpm@system-suspend-devices.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3837/shard-tglb5/igt@i915_pm_rpm@system-suspend-devices.html

  * igt@i915_selftest@mock_sanitycheck:
    - shard-kbl:          [PASS][21] -> [DMESG-WARN][22] ([i915#747])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-kbl3/igt@i915_selftest@mock_sanitycheck.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3837/shard-kbl4/igt@i915_selftest@mock_sanitycheck.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [PASS][23] -> [DMESG-WARN][24] ([i915#180]) +4 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3837/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_cursor_legacy@cursor-vs-flip-legacy:
    - shard-hsw:          [PASS][25] -> [FAIL][26] ([i915#57])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-hsw8/igt@kms_cursor_legacy@cursor-vs-flip-legacy.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3837/shard-hsw6/igt@kms_cursor_legacy@cursor-vs-flip-legacy.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-glk:          [PASS][27] -> [FAIL][28] ([i915#79])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-glk7/igt@kms_flip@flip-vs-expired-vblank.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3837/shard-glk6/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt:
    - shard-tglb:         [PASS][29] -> [INCOMPLETE][30] ([i915#474] / [i915#667])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-tglb4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3837/shard-tglb4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt:
    - shard-tglb:         [PASS][31] -> [FAIL][32] ([i915#49]) +2 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3837/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [PASS][33] -> [SKIP][34] ([fdo#109642] / [fdo#111068])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-iclb2/igt@kms_psr2_su@page_flip.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3837/shard-iclb5/igt@kms_psr2_su@page_flip.html

  * igt@kms_universal_plane@universal-plane-pipe-c-functional:
    - shard-glk:          [PASS][35] -> [FAIL][36] ([i915#331])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-glk2/igt@kms_universal_plane@universal-plane-pipe-c-functional.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3837/shard-glk3/igt@kms_universal_plane@universal-plane-pipe-c-functional.html
    - shard-kbl:          [PASS][37] -> [FAIL][38] ([i915#331])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-kbl1/igt@kms_universal_plane@universal-plane-pipe-c-functional.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3837/shard-kbl1/igt@kms_universal_plane@universal-plane-pipe-c-functional.html
    - shard-apl:          [PASS][39] -> [FAIL][40] ([i915#331])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-apl7/igt@kms_universal_plane@universal-plane-pipe-c-functional.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3837/shard-apl2/igt@kms_universal_plane@universal-plane-pipe-c-functional.html

  * igt@perf_pmu@cpu-hotplug:
    - shard-glk:          [PASS][41] -> [TIMEOUT][42] ([i915#449])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-glk5/igt@perf_pmu@cpu-hotplug.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3837/shard-glk1/igt@perf_pmu@cpu-hotplug.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-kbl:          [DMESG-WARN][43] ([i915#180]) -> [PASS][44] +7 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-kbl3/igt@gem_ctx_isolation@rcs0-s3.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3837/shard-kbl3/igt@gem_ctx_isolation@rcs0-s3.html
    - shard-tglb:         [INCOMPLETE][45] ([i915#456]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-tglb8/igt@gem_ctx_isolation@rcs0-s3.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3837/shard-tglb7/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_ctx_persistence@vcs1-mixed:
    - shard-iclb:         [SKIP][47] ([fdo#109276] / [fdo#112080]) -> [PASS][48] +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-iclb6/igt@gem_ctx_persistence@vcs1-mixed.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3837/shard-iclb1/igt@gem_ctx_persistence@vcs1-mixed.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd1:
    - shard-iclb:         [SKIP][49] ([fdo#109276]) -> [PASS][50] +4 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-iclb3/igt@gem_ctx_shared@exec-single-timeline-bsd1.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3837/shard-iclb4/igt@gem_ctx_shared@exec-single-timeline-bsd1.html

  * igt@gem_exec_parallel@vcs1:
    - shard-tglb:         [INCOMPLETE][51] ([fdo#111593]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-tglb1/igt@gem_exec_parallel@vcs1.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3837/shard-tglb3/igt@gem_exec_parallel@vcs1.html

  * igt@gem_exec_schedule@pi-ringfull-bsd:
    - shard-iclb:         [SKIP][53] ([fdo#112146]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-iclb2/igt@gem_exec_schedule@pi-ringfull-bsd.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3837/shard-iclb5/igt@gem_exec_schedule@pi-ringfull-bsd.html

  * igt@gem_exec_schedule@preempt-queue-vebox:
    - shard-tglb:         [INCOMPLETE][55] ([fdo#111677]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-tglb6/igt@gem_exec_schedule@preempt-queue-vebox.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3837/shard-tglb4/igt@gem_exec_schedule@preempt-queue-vebox.html

  * igt@gem_exec_schedule@smoketest-all:
    - shard-tglb:         [INCOMPLETE][57] ([i915#463]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-tglb9/igt@gem_exec_schedule@smoketest-all.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3837/shard-tglb5/igt@gem_exec_schedule@smoketest-all.html

  * igt@gem_exec_schedule@smoketest-vebox:
    - shard-tglb:         [INCOMPLETE][59] ([i915#707]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-tglb9/igt@gem_exec_schedule@smoketest-vebox.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3837/shard-tglb5/igt@gem_exec_schedule@smoketest-vebox.html

  * igt@gem_exec_store@cachelines-vcs1:
    - shard-iclb:         [SKIP][61] ([fdo#112080]) -> [PASS][62] +3 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-iclb3/igt@gem_exec_store@cachelines-vcs1.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3837/shard-iclb4/igt@gem_exec_store@cachelines-vcs1.html

  * igt@gem_persistent_relocs@forked-faulting-reloc-thrash-inactive:
    - shard-tglb:         [INCOMPLETE][63] ([i915#530]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-tglb8/igt@gem_persistent_relocs@forked-faulting-reloc-thrash-inactive.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3837/shard-tglb1/igt@gem_persistent_relocs@forked-faulting-reloc-thrash-inactive.html

  * igt@gem_persistent_relocs@forked-interruptible-thrashing:
    - shard-snb:          [FAIL][65] ([i915#520]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-snb6/igt@gem_persistent_relocs@forked-interruptible-thrashing.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3837/shard-snb1/igt@gem_persistent_relocs@forked-interruptible-thrashing.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [FAIL][67] ([i915#644]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-glk4/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3837/shard-glk5/igt@gem_ppgtt@flink-and-close-vma-leak.html
    - shard-apl:          [FAIL][69] ([i915#644]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-apl1/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3837/shard-apl7/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy:
    - shard-snb:          [DMESG-WARN][71] ([fdo#111870]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-snb6/igt@gem_userptr_blits@map-fixed-invalidate-busy.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3837/shard-snb2/igt@gem_userptr_blits@map-fixed-invalidate-busy.html

  * igt@kms_cursor_crc@pipe-b-cursor-64x21-offscreen:
    - shard-iclb:         [DMESG-WARN][73] ([IGT#6]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-iclb3/igt@kms_cursor_crc@pipe-b-cursor-64x21-offscreen.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3837/shard-iclb2/igt@kms_cursor_crc@pipe-b-cursor-64x21-offscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-apl:          [DMESG-WARN][75] ([i915#180]) -> [PASS][76] +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3837/shard-apl2/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-c-cursor-64x21-random:
    - shard-kbl:          [FAIL][77] ([i915#54]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-kbl6/igt@kms_cursor_crc@pipe-c-cursor-64x21-random.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3837/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-64x21-random.html
    - shard-apl:          [FAIL][79] ([i915#54]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-apl4/igt@kms_cursor_crc@pipe-c-cursor-64x21-random.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3837/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-64x21-random.html

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - shard-hsw:          [FAIL][81] ([i915#57]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-hsw6/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3837/shard-hsw4/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-tglb:         [INCOMPLETE][83] ([i915#460] / [i915#516]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-tglb7/igt@kms_flip@flip-vs-suspend.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3837/shard-tglb6/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-pwrite:
    - shard-tglb:         [FAIL][85] ([i915#49]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-pwrite.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3837/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-pwrite.html

  * igt@kms_plane@pixel-format-pipe-a-planes:
    - shard-kbl:          [INCOMPLETE][87] ([fdo#103665]) -> [PASS][88] +1 similar issue
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-kbl3/igt@kms_plane@pixel-format-pipe-a-planes.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3837/shard-kbl2/igt@kms_plane@pixel-format-pipe-a-planes.html

  * igt@kms_plane@pixel-format-pipe-b-planes-source-clamping:
    - shard-kbl:          [INCOMPLETE][89] ([fdo#103665] / [i915#435]) -> [PASS][90] +1 similar issue
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-kbl4/igt@kms_plane@pixel-format-pipe-b-planes-source-clamping.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3837/shard-kbl7/igt@kms_plane@pixel-format-pipe-b-planes-source-clamping.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [SKIP][91] ([fdo#109441]) -> [PASS][92] +1 similar issue
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-iclb7/igt@kms_psr@psr2_cursor_render.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3837/shard-iclb2/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_psr@psr2_suspend:
    - shard-tglb:         [DMESG-WARN][93] ([i915#402]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-tglb3/igt@kms_psr@psr2_suspend.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3837/shard-tglb3/igt@kms_psr@psr2_suspend.html

  * igt@perf@disabled-read-error:
    - shard-hsw:          [INCOMPLETE][95] ([i915#61]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-hsw6/igt@perf@disabled-read-error.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3837/shard-hsw7/igt@perf@disabled-read-error.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs2-nonpriv:
    - shard-tglb:         [SKIP][97] ([fdo#112080]) -> [SKIP][98] ([fdo#111912] / [fdo#112080])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-tglb9/igt@gem_ctx_isolation@vcs2-nonpriv.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3837/shard-tglb4/igt@gem_ctx_isolation@vcs2-nonpriv.html

  * igt@gem_eio@kms:
    - shard-snb:          [DMESG-WARN][99] ([i915#444]) -> [INCOMPLETE][100] ([i915#82])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-snb2/igt@gem_eio@kms.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3837/shard-snb1/igt@gem_eio@kms.html

  * igt@gem_exec_create@forked:
    - shard-tglb:         [INCOMPLETE][101] ([fdo#108838] / [i915#435]) -> [INCOMPLETE][102] ([i915#435])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-tglb5/igt@gem_exec_create@forked.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3837/shard-tglb9/igt@gem_exec_create@forked.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [SKIP][103] ([i915#468]) -> [FAIL][104] ([i915#454])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-tglb6/igt@i915_pm_dc@dc6-psr.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3837/shard-tglb4/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - shard-glk:          [SKIP][105] ([fdo#109271]) -> [INCOMPLETE][106] ([i915#58] / [k.org#198133])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-glk4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3837/shard-glk1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@runner@aborted:
    - shard-snb:          ([FAIL][107], [FAIL][108]) ([fdo#111249] / [i915#436] / [k.org#204565]) -> [FAIL][109] ([fdo#111249] / [k.org#204565])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-snb4/igt@runner@aborted.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-snb2/igt@runner@aborted.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3837/shard-snb6/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#6]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/6
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#108838]: https://bugs.freedesktop.org/show_bug.cgi?id=108838
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111249]: https://bugs.freedesktop.org/show_bug.cgi?id=111249
  [fdo#111593]: https://bugs.freedesktop.org/show_bug.cgi?id=111593
  [fdo#111677]: https://bugs.freedesktop.org/show_bug.cgi?id=111677
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#111912]: https://bugs.freedesktop.org/show_bug.cgi?id=111912
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#331]: https://gitlab.freedesktop.org/drm/intel/issues/331
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#435]: https://gitlab.freedesktop.org/drm/intel/issues/435
  [i915#436]: https://gitlab.freedesktop.org/drm/intel/issues/436
  [i915#444]: https://gitlab.freedesktop.org/drm/intel/issues/444
  [i915#449]: https://gitlab.freedesktop.org/drm/intel/issues/449
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#460]: https://gitlab.freedesktop.org/drm/intel/issues/460
  [i915#463]: https://gitlab.freedesktop.org/drm/intel/issues/463
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#470]: https://gitlab.freedesktop.org/drm/intel/issues/470
  [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
  [i915#474]: https://gitlab.freedesktop.org/drm/intel/issues/474
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#516]: https://gitlab.freedesktop.org/drm/intel/issues/516
  [i915#520]: https://gitlab.freedesktop.org/drm/intel/issues/520
  [i915#530]: https://gitlab.freedesktop.org/drm/intel/issues/530
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#57]: https://gitlab.freedesktop.org/drm/intel/issues/57
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#667]: https://gitlab.freedesktop.org/drm/intel/issues/667
  [i915#669]: https://gitlab.freedesktop.org/drm/intel/issues/669
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#707]: https://gitlab.freedesktop.org/drm/intel/issues/707
  [i915#747]: https://gitlab.freedesktop.org/drm/intel/issues/747
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133
  [k.org#204565]: https://bugzilla.kernel.org/show_bug.cgi?id=204565


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-hsw-4770r 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5341 -> IGTPW_3837
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7528: 1f2c18c105263727ef41dfc7fd8c72012aafaefb @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3837: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3837/index.html
  IGT_5341: 5fe683cdebde2d77d16ffc42c9fdf29a9f95bb82 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3837/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
