Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 27 Feb 2020 03:06:33 -0000
Message-ID: <158277279371.29657.11744721169822423527@emeril.freedesktop.org>
References: <20200226125746.12249-1-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20200226125746.12249-1-janusz.krzysztofik@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?gem=5Fuserptr=5Fblits=3A_Refresh_map-fixed-invalidate*_subtests?=
 =?utf-8?q?_=28rev3=29?=
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
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/gem_userptr_blits: Refresh map-fixed-invalidate* subtests (rev3)
URL   : https://patchwork.freedesktop.org/series/73405/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8007_full -> IGTPW_4227_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4227_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4227_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4227/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4227_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_mmap_offset@basic-uaf:
    - shard-hsw:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-hsw4/igt@gem_mmap_offset@basic-uaf.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4227/shard-hsw1/igt@gem_mmap_offset@basic-uaf.html

  * {igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup@gtt} (NEW):
    - shard-hsw:          NOTRUN -> [DMESG-WARN][3] +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4227/shard-hsw1/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup@gtt.html

  * igt@perf_pmu@busy-hang-bcs0:
    - shard-iclb:         [PASS][4] -> [FAIL][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-iclb7/igt@perf_pmu@busy-hang-bcs0.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4227/shard-iclb7/igt@perf_pmu@busy-hang-bcs0.html

  * igt@sw_sync@sync_multi_producer_single_consumer:
    - shard-snb:          [PASS][6] -> [TIMEOUT][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-snb2/igt@sw_sync@sync_multi_producer_single_consumer.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4227/shard-snb4/igt@sw_sync@sync_multi_producer_single_consumer.html
    - shard-apl:          [PASS][8] -> [TIMEOUT][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-apl6/igt@sw_sync@sync_multi_producer_single_consumer.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4227/shard-apl2/igt@sw_sync@sync_multi_producer_single_consumer.html

  
#### Warnings ####

  * igt@runner@aborted:
    - shard-hsw:          ([FAIL][10], [FAIL][11], [FAIL][12], [FAIL][13], [FAIL][14], [FAIL][15], [FAIL][16], [FAIL][17]) ([fdo#111870] / [i915#226]) -> ([FAIL][18], [FAIL][19], [FAIL][20], [FAIL][21], [FAIL][22], [FAIL][23], [FAIL][24]) ([fdo#111870])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-hsw7/igt@runner@aborted.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-hsw7/igt@runner@aborted.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-hsw7/igt@runner@aborted.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-hsw5/igt@runner@aborted.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-hsw1/igt@runner@aborted.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-hsw6/igt@runner@aborted.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-hsw5/igt@runner@aborted.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-hsw5/igt@runner@aborted.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4227/shard-hsw1/igt@runner@aborted.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4227/shard-hsw1/igt@runner@aborted.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4227/shard-hsw1/igt@runner@aborted.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4227/shard-hsw7/igt@runner@aborted.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4227/shard-hsw1/igt@runner@aborted.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4227/shard-hsw5/igt@runner@aborted.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4227/shard-hsw4/igt@runner@aborted.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8007_full and IGTPW_4227_full:

### New IGT tests (32) ###

  * igt@gem_userptr_blits@map-fixed-invalidate-busy-gup@gtt:
    - Statuses : 2 dmesg-warn(s) 5 pass(s)
    - Exec time: [0.44, 2.15] s

  * igt@gem_userptr_blits@map-fixed-invalidate-busy-gup@uc:
    - Statuses : 7 pass(s)
    - Exec time: [0.45, 2.16] s

  * igt@gem_userptr_blits@map-fixed-invalidate-busy-gup@wb:
    - Statuses : 7 pass(s)
    - Exec time: [0.41, 2.09] s

  * igt@gem_userptr_blits@map-fixed-invalidate-busy-gup@wc:
    - Statuses : 7 pass(s)
    - Exec time: [0.41, 2.09] s

  * igt@gem_userptr_blits@map-fixed-invalidate-busy@gtt:
    - Statuses : 5 pass(s)
    - Exec time: [0.60, 2.12] s

  * igt@gem_userptr_blits@map-fixed-invalidate-busy@uc:
    - Statuses : 5 pass(s)
    - Exec time: [0.60, 2.26] s

  * igt@gem_userptr_blits@map-fixed-invalidate-busy@wb:
    - Statuses : 5 pass(s)
    - Exec time: [0.58, 2.35] s

  * igt@gem_userptr_blits@map-fixed-invalidate-busy@wc:
    - Statuses : 5 pass(s)
    - Exec time: [0.60, 2.43] s

  * igt@gem_userptr_blits@map-fixed-invalidate-gup@gtt:
    - Statuses : 7 pass(s)
    - Exec time: [0.44, 1.70] s

  * igt@gem_userptr_blits@map-fixed-invalidate-gup@uc:
    - Statuses : 7 pass(s)
    - Exec time: [0.46, 1.70] s

  * igt@gem_userptr_blits@map-fixed-invalidate-gup@wb:
    - Statuses : 7 pass(s)
    - Exec time: [0.43, 1.66] s

  * igt@gem_userptr_blits@map-fixed-invalidate-gup@wc:
    - Statuses : 7 pass(s)
    - Exec time: [0.44, 1.66] s

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup@gtt:
    - Statuses : 2 dmesg-warn(s) 5 pass(s)
    - Exec time: [0.38, 2.14] s

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup@uc:
    - Statuses : 7 pass(s)
    - Exec time: [0.45, 2.15] s

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup@wb:
    - Statuses : 7 pass(s)
    - Exec time: [0.38, 2.08] s

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup@wc:
    - Statuses : 7 pass(s)
    - Exec time: [0.41, 2.09] s

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy@gtt:
    - Statuses : 2 dmesg-warn(s) 5 pass(s)
    - Exec time: [0.46, 2.44] s

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy@uc:
    - Statuses : 7 pass(s)
    - Exec time: [0.55, 2.44] s

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy@wb:
    - Statuses : 7 pass(s)
    - Exec time: [0.54, 2.41] s

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy@wc:
    - Statuses : 7 pass(s)
    - Exec time: [0.55, 2.45] s

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-gup@gtt:
    - Statuses : 7 pass(s)
    - Exec time: [0.47, 1.72] s

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-gup@uc:
    - Statuses : 7 pass(s)
    - Exec time: [0.48, 1.72] s

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-gup@wb:
    - Statuses : 7 pass(s)
    - Exec time: [0.45, 1.66] s

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-gup@wc:
    - Statuses : 7 pass(s)
    - Exec time: [0.50, 1.66] s

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap@gtt:
    - Statuses : 6 pass(s)
    - Exec time: [0.03, 0.14] s

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap@uc:
    - Statuses : 6 pass(s)
    - Exec time: [0.03, 0.11] s

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap@wb:
    - Statuses : 6 pass(s)
    - Exec time: [0.03, 0.11] s

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap@wc:
    - Statuses : 6 pass(s)
    - Exec time: [0.03, 0.11] s

  * igt@gem_userptr_blits@map-fixed-invalidate@gtt:
    - Statuses : 7 pass(s)
    - Exec time: [0.03, 0.14] s

  * igt@gem_userptr_blits@map-fixed-invalidate@uc:
    - Statuses : 7 pass(s)
    - Exec time: [0.02, 0.11] s

  * igt@gem_userptr_blits@map-fixed-invalidate@wb:
    - Statuses : 7 pass(s)
    - Exec time: [0.03, 0.11] s

  * igt@gem_userptr_blits@map-fixed-invalidate@wc:
    - Statuses : 7 pass(s)
    - Exec time: [0.03, 0.11] s

  

Known issues
------------

  Here are the changes found in IGTPW_4227_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [PASS][25] -> [SKIP][26] ([i915#677])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-iclb3/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4227/shard-iclb4/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@reorder-wide-bsd:
    - shard-iclb:         [PASS][27] -> [SKIP][28] ([fdo#112146]) +7 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-iclb5/igt@gem_exec_schedule@reorder-wide-bsd.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4227/shard-iclb2/igt@gem_exec_schedule@reorder-wide-bsd.html

  * igt@gem_mmap_offset@basic-uaf:
    - shard-snb:          [PASS][29] -> [DMESG-WARN][30] ([i915#478])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-snb4/igt@gem_mmap_offset@basic-uaf.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4227/shard-snb2/igt@gem_mmap_offset@basic-uaf.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [PASS][31] -> [FAIL][32] ([i915#644])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-glk8/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4227/shard-glk8/igt@gem_ppgtt@flink-and-close-vma-leak.html
    - shard-apl:          [PASS][33] -> [FAIL][34] ([i915#644])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-apl6/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4227/shard-apl4/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-snb:          [PASS][35] -> [DMESG-WARN][36] ([fdo#111870] / [i915#478]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-snb2/igt@gem_userptr_blits@dmabuf-sync.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4227/shard-snb5/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@sync-unmap-after-close:
    - shard-hsw:          [PASS][37] -> [DMESG-WARN][38] ([fdo#111870]) +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-hsw5/igt@gem_userptr_blits@sync-unmap-after-close.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4227/shard-hsw1/igt@gem_userptr_blits@sync-unmap-after-close.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][39] -> [FAIL][40] ([i915#454])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-iclb4/igt@i915_pm_dc@dc6-psr.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4227/shard-iclb6/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_suspend@forcewake:
    - shard-kbl:          [PASS][41] -> [DMESG-WARN][42] ([i915#180]) +6 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-kbl4/igt@i915_suspend@forcewake.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4227/shard-kbl4/igt@i915_suspend@forcewake.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-apl:          [PASS][43] -> [FAIL][44] ([i915#54])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4227/shard-apl6/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
    - shard-kbl:          [PASS][45] -> [FAIL][46] ([i915#54])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-kbl1/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4227/shard-kbl2/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
    - shard-tglb:         [PASS][47] -> [FAIL][48] ([i915#488])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-tglb2/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4227/shard-tglb7/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [PASS][49] -> [FAIL][50] ([i915#899]) +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-glk7/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4227/shard-glk6/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr@psr2_cursor_blt:
    - shard-iclb:         [PASS][51] -> [SKIP][52] ([fdo#109441]) +2 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4227/shard-iclb6/igt@kms_psr@psr2_cursor_blt.html

  * igt@kms_sequence@get-forked-busy:
    - shard-snb:          [PASS][53] -> [SKIP][54] ([fdo#109271])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-snb5/igt@kms_sequence@get-forked-busy.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4227/shard-snb6/igt@kms_sequence@get-forked-busy.html

  * igt@perf@create-destroy-userspace-config:
    - shard-glk:          [PASS][55] -> [SKIP][56] ([fdo#109271])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-glk8/igt@perf@create-destroy-userspace-config.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4227/shard-glk9/igt@perf@create-destroy-userspace-config.html
    - shard-apl:          [PASS][57] -> [SKIP][58] ([fdo#109271])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-apl6/igt@perf@create-destroy-userspace-config.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4227/shard-apl7/igt@perf@create-destroy-userspace-config.html
    - shard-tglb:         [PASS][59] -> [SKIP][60] ([i915#405])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-tglb5/igt@perf@create-destroy-userspace-config.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4227/shard-tglb7/igt@perf@create-destroy-userspace-config.html
    - shard-kbl:          [PASS][61] -> [SKIP][62] ([fdo#109271])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-kbl4/igt@perf@create-destroy-userspace-config.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4227/shard-kbl3/igt@perf@create-destroy-userspace-config.html
    - shard-iclb:         [PASS][63] -> [SKIP][64] ([i915#405])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-iclb1/igt@perf@create-destroy-userspace-config.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4227/shard-iclb4/igt@perf@create-destroy-userspace-config.html

  * igt@perf_pmu@busy-vcs1:
    - shard-iclb:         [PASS][65] -> [SKIP][66] ([fdo#112080]) +15 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-iclb4/igt@perf_pmu@busy-vcs1.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4227/shard-iclb5/igt@perf_pmu@busy-vcs1.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [PASS][67] -> [SKIP][68] ([fdo#109276]) +17 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-iclb2/igt@prime_busy@hang-bsd2.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4227/shard-iclb7/igt@prime_busy@hang-bsd2.html

  
#### Possible fixes ####

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [SKIP][69] ([fdo#110841]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-iclb1/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4227/shard-iclb6/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * {igt@gem_exec_schedule@implicit-read-write-bsd1}:
    - shard-iclb:         [SKIP][71] ([fdo#109276] / [i915#677]) -> [PASS][72] +1 similar issue
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-iclb3/igt@gem_exec_schedule@implicit-read-write-bsd1.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4227/shard-iclb1/igt@gem_exec_schedule@implicit-read-write-bsd1.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [SKIP][73] ([i915#677]) -> [PASS][74] +2 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-iclb2/igt@gem_exec_schedule@pi-common-bsd.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4227/shard-iclb7/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd1:
    - shard-iclb:         [SKIP][75] ([fdo#109276]) -> [PASS][76] +11 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-iclb7/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4227/shard-iclb1/igt@gem_exec_schedule@preempt-queue-bsd1.html

  * igt@gem_exec_schedule@preempt-self-bsd:
    - shard-iclb:         [SKIP][77] ([fdo#112146]) -> [PASS][78] +3 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-iclb1/igt@gem_exec_schedule@preempt-self-bsd.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4227/shard-iclb3/igt@gem_exec_schedule@preempt-self-bsd.html

  * {igt@gem_mmap_wc@write-wc-read-gtt}:
    - shard-snb:          [DMESG-WARN][79] ([i915#478]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-snb6/igt@gem_mmap_wc@write-wc-read-gtt.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4227/shard-snb2/igt@gem_mmap_wc@write-wc-read-gtt.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-kbl:          [FAIL][81] ([i915#644]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-kbl4/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4227/shard-kbl4/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_softpin@noreloc-s3:
    - shard-kbl:          [INCOMPLETE][83] ([fdo#103665]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-kbl2/igt@gem_softpin@noreloc-s3.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4227/shard-kbl6/igt@gem_softpin@noreloc-s3.html

  * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-hsw:          [SKIP][85] ([fdo#109271]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-hsw1/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4227/shard-hsw1/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
    - shard-glk:          [SKIP][87] ([fdo#109271]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-glk7/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4227/shard-glk2/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html

  * {igt@i915_pm_rpm@gem-mmap-type@wb}:
    - shard-hsw:          [DMESG-WARN][89] -> [PASS][90] +2 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-hsw7/igt@i915_pm_rpm@gem-mmap-type@wb.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4227/shard-hsw6/igt@i915_pm_rpm@gem-mmap-type@wb.html

  * igt@i915_pm_rpm@system-suspend-modeset:
    - shard-kbl:          [FAIL][91] ([fdo#103375]) -> [PASS][92] +1 similar issue
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-kbl4/igt@i915_pm_rpm@system-suspend-modeset.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4227/shard-kbl1/igt@i915_pm_rpm@system-suspend-modeset.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding:
    - shard-apl:          [FAIL][93] ([i915#54]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4227/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][95] ([i915#180]) -> [PASS][96] +5 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4227/shard-kbl6/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-glk:          [FAIL][97] ([i915#79]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4227/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:
    - shard-glk:          [FAIL][99] ([i915#49]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-glk3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4227/shard-glk6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-apl:          [DMESG-WARN][101] ([i915#180]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-apl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4227/shard-apl8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [SKIP][103] ([fdo#109642] / [fdo#111068]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-iclb5/igt@kms_psr2_su@page_flip.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4227/shard-iclb2/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@primary_mmap_gtt:
    - shard-tglb:         [SKIP][105] ([i915#668]) -> [PASS][106] +8 similar issues
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-tglb3/igt@kms_psr@primary_mmap_gtt.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4227/shard-tglb3/igt@kms_psr@primary_mmap_gtt.html

  * igt@kms_psr@psr2_cursor_mmap_gtt:
    - shard-iclb:         [SKIP][107] ([fdo#109441]) -> [PASS][108]
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-iclb4/igt@kms_psr@psr2_cursor_mmap_gtt.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4227/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_gtt.html

  * igt@perf_pmu@init-busy-vcs1:
    - shard-iclb:         [SKIP][109] ([fdo#112080]) -> [PASS][110] +10 similar issues
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-iclb7/igt@perf_pmu@init-busy-vcs1.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4227/shard-iclb4/igt@perf_pmu@init-busy-vcs1.html

  * igt@sw_sync@sync_multi_producer_single_consumer:
    - shard-iclb:         [TIMEOUT][111] -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-iclb3/igt@sw_sync@sync_multi_producer_single_consumer.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4227/shard-iclb6/igt@sw_sync@sync_multi_producer_single_consumer.html
    - shard-glk:          [TIMEOUT][113] -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-glk4/igt@sw_sync@sync_multi_producer_single_consumer.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4227/shard-glk7/igt@sw_sync@sync_multi_producer_single_consumer.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [FAIL][115] ([IGT#28]) -> [SKIP][116] ([fdo#112080])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-iclb2/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4227/shard-iclb7/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@gem_userptr_blits@sync-unmap:
    - shard-hsw:          [DMESG-WARN][117] ([fdo#111870]) -> [DMESG-WARN][118] ([fdo#110789] / [fdo#111870])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-hsw5/igt@gem_userptr_blits@sync-unmap.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4227/shard-hsw5/igt@gem_userptr_blits@sync-unmap.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [FAIL][119] ([i915#454]) -> [SKIP][120] ([i915#468])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-tglb6/igt@i915_pm_dc@dc6-dpms.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4227/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-tglb:         [SKIP][121] -> [SKIP][122] ([fdo#111644])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-tglb6/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4227/shard-tglb6/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
    - shard-iclb:         [SKIP][123] -> [SKIP][124] ([fdo#110892])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-iclb2/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4227/shard-iclb5/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@i915_pm_rpm@modeset-pc8-residency-stress:
    - shard-snb:          [INCOMPLETE][125] ([i915#82]) -> [SKIP][126] ([fdo#109271])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-snb2/igt@i915_pm_rpm@modeset-pc8-residency-stress.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4227/shard-snb6/igt@i915_pm_rpm@modeset-pc8-residency-stress.html

  * igt@kms_content_protection@atomic:
    - shard-kbl:          [TIMEOUT][127] ([i915#1319] / [i915#727]) -> [TIMEOUT][128] ([i915#1319])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-kbl2/igt@kms_content_protection@atomic.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4227/shard-kbl3/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@legacy:
    - shard-kbl:          [TIMEOUT][129] ([i915#1319]) -> [TIMEOUT][130] ([i915#1319] / [i915#727]) +1 similar issue
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-kbl1/igt@kms_content_protection@legacy.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4227/shard-kbl2/igt@kms_content_protection@legacy.html

  * igt@runner@aborted:
    - shard-snb:          ([FAIL][131], [FAIL][132], [FAIL][133], [FAIL][134], [FAIL][135], [FAIL][136], [FAIL][137], [FAIL][138]) ([fdo#111870] / [i915#1077] / [i915#698]) -> ([FAIL][139], [FAIL][140], [FAIL][141], [FAIL][142], [FAIL][143], [FAIL][144], [FAIL][145]) ([fdo#111870] / [i915#1077])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-snb2/igt@runner@aborted.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-snb2/igt@runner@aborted.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-snb4/igt@runner@aborted.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-snb6/igt@runner@aborted.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-snb2/igt@runner@aborted.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-snb6/igt@runner@aborted.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-snb6/igt@runner@aborted.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-snb4/igt@runner@aborted.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4227/shard-snb6/igt@runner@aborted.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4227/shard-snb5/igt@runner@aborted.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4227/shard-snb5/igt@runner@aborted.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4227/shard-snb4/igt@runner@aborted.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4227/shard-snb4/igt@runner@aborted.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4227/shard-snb2/igt@runner@aborted.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4227/shard-snb5/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#110892]: https://bugs.freedesktop.org/show_bug.cgi?id=110892
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1077]: https://gitlab.freedesktop.org/drm/intel/issues/1077
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#226]: https://gitlab.freedesktop.org/drm/intel/issues/226
  [i915#405]: https://gitlab.freedesktop.org/drm/intel/issues/405
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i91

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4227/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
