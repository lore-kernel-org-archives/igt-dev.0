Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 14 Jan 2020 22:36:47 -0000
Message-ID: <157904140766.24908.14203163698980441117@emeril.freedesktop.org>
References: <037121df1ee6fcf1fa92ea4a7fb6ba31b39e80ac.1578720512.git.ashutosh.dixit@intel.com>
In-Reply-To: <037121df1ee6fcf1fa92ea4a7fb6ba31b39e80ac.1578720512.git.ashutosh.dixit@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_lib/i915/gem=5Fmman=3A_Priorit?=
 =?utf-8?q?ize_GTT_mappings_over_WC?=
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
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,1/2] lib/i915/gem_mman: Prioritize GTT mappings over WC
URL   : https://patchwork.freedesktop.org/series/71916/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7721_full -> IGTPW_3916_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_3916_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_3916_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3916/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_3916_full:

### IGT changes ###

#### Possible regressions ####

  * igt@runner@aborted:
    - shard-hsw:          NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3916/shard-hsw7/igt@runner@aborted.html

  
Known issues
------------

  Here are the changes found in IGTPW_3916_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [PASS][2] -> [SKIP][3] ([fdo#112080]) +7 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7721/shard-iclb2/igt@gem_busy@busy-vcs1.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3916/shard-iclb3/igt@gem_busy@busy-vcs1.html

  * igt@gem_ctx_persistence@bcs0-mixed-process:
    - shard-glk:          [PASS][4] -> [FAIL][5] ([i915#679])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7721/shard-glk4/igt@gem_ctx_persistence@bcs0-mixed-process.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3916/shard-glk7/igt@gem_ctx_persistence@bcs0-mixed-process.html

  * igt@gem_ctx_persistence@vcs1-mixed-process:
    - shard-iclb:         [PASS][6] -> [SKIP][7] ([fdo#109276] / [fdo#112080]) +2 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7721/shard-iclb1/igt@gem_ctx_persistence@vcs1-mixed-process.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3916/shard-iclb3/igt@gem_ctx_persistence@vcs1-mixed-process.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [PASS][8] -> [SKIP][9] ([fdo#110841])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7721/shard-iclb5/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3916/shard-iclb4/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_ctx_shared@q-smoketest-all:
    - shard-tglb:         [PASS][10] -> [INCOMPLETE][11] ([fdo#111735])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7721/shard-tglb7/igt@gem_ctx_shared@q-smoketest-all.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3916/shard-tglb2/igt@gem_ctx_shared@q-smoketest-all.html

  * igt@gem_ctx_shared@q-smoketest-bsd:
    - shard-tglb:         [PASS][12] -> [INCOMPLETE][13] ([i915#461])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7721/shard-tglb7/igt@gem_ctx_shared@q-smoketest-bsd.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3916/shard-tglb6/igt@gem_ctx_shared@q-smoketest-bsd.html

  * igt@gem_exec_schedule@independent-bsd:
    - shard-iclb:         [PASS][14] -> [SKIP][15] ([fdo#112146]) +3 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7721/shard-iclb7/igt@gem_exec_schedule@independent-bsd.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3916/shard-iclb4/igt@gem_exec_schedule@independent-bsd.html

  * igt@gem_exec_schedule@pi-shared-iova-bsd:
    - shard-iclb:         [PASS][16] -> [SKIP][17] ([i915#677])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7721/shard-iclb5/igt@gem_exec_schedule@pi-shared-iova-bsd.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3916/shard-iclb2/igt@gem_exec_schedule@pi-shared-iova-bsd.html

  * igt@gem_exec_schedule@preempt-contexts-bsd2:
    - shard-iclb:         [PASS][18] -> [SKIP][19] ([fdo#109276]) +11 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7721/shard-iclb1/igt@gem_exec_schedule@preempt-contexts-bsd2.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3916/shard-iclb7/igt@gem_exec_schedule@preempt-contexts-bsd2.html

  * igt@gem_exec_schedule@preempt-queue-contexts-chain-blt:
    - shard-tglb:         [PASS][20] -> [INCOMPLETE][21] ([fdo#111606] / [fdo#111677] / [i915#472]) +1 similar issue
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7721/shard-tglb4/igt@gem_exec_schedule@preempt-queue-contexts-chain-blt.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3916/shard-tglb7/igt@gem_exec_schedule@preempt-queue-contexts-chain-blt.html

  * igt@gem_exec_schedule@preempt-queue-contexts-chain-bsd1:
    - shard-tglb:         [PASS][22] -> [INCOMPLETE][23] ([fdo#111677] / [i915#472])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7721/shard-tglb4/igt@gem_exec_schedule@preempt-queue-contexts-chain-bsd1.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3916/shard-tglb6/igt@gem_exec_schedule@preempt-queue-contexts-chain-bsd1.html

  * igt@gem_exec_schedule@smoketest-blt:
    - shard-tglb:         [PASS][24] -> [INCOMPLETE][25] ([i915#470] / [i915#472])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7721/shard-tglb8/igt@gem_exec_schedule@smoketest-blt.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3916/shard-tglb3/igt@gem_exec_schedule@smoketest-blt.html

  * igt@gem_persistent_relocs@forked-interruptible-thrash-inactive:
    - shard-apl:          [PASS][26] -> [TIMEOUT][27] ([fdo#112271])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7721/shard-apl1/igt@gem_persistent_relocs@forked-interruptible-thrash-inactive.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3916/shard-apl7/igt@gem_persistent_relocs@forked-interruptible-thrash-inactive.html

  * igt@gem_softpin@noreloc-s3:
    - shard-apl:          [PASS][28] -> [DMESG-WARN][29] ([i915#180]) +3 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7721/shard-apl3/igt@gem_softpin@noreloc-s3.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3916/shard-apl1/igt@gem_softpin@noreloc-s3.html

  * igt@gem_sync@basic-many-each:
    - shard-tglb:         [PASS][30] -> [INCOMPLETE][31] ([i915#472] / [i915#707])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7721/shard-tglb4/igt@gem_sync@basic-many-each.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3916/shard-tglb9/igt@gem_sync@basic-many-each.html

  * igt@gem_sync@basic-store-all:
    - shard-tglb:         [PASS][32] -> [INCOMPLETE][33] ([i915#472])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7721/shard-tglb4/igt@gem_sync@basic-store-all.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3916/shard-tglb3/igt@gem_sync@basic-store-all.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-kbl:          [PASS][34] -> [DMESG-WARN][35] ([fdo#111870]) +1 similar issue
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7721/shard-kbl7/igt@gem_userptr_blits@dmabuf-sync.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3916/shard-kbl3/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-iclb:         [PASS][36] -> [DMESG-WARN][37] ([fdo#111870]) +1 similar issue
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7721/shard-iclb8/igt@gem_userptr_blits@dmabuf-sync.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3916/shard-iclb5/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-tglb:         [PASS][38] -> [DMESG-WARN][39] ([fdo#111870])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7721/shard-tglb6/igt@gem_userptr_blits@dmabuf-unsync.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3916/shard-tglb4/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@sync-unmap:
    - shard-snb:          [PASS][40] -> [DMESG-WARN][41] ([fdo#111870])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7721/shard-snb1/igt@gem_userptr_blits@sync-unmap.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3916/shard-snb2/igt@gem_userptr_blits@sync-unmap.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [PASS][42] -> [FAIL][43] ([i915#454])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7721/shard-iclb8/igt@i915_pm_dc@dc6-dpms.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3916/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
    - shard-tglb:         [PASS][44] -> [FAIL][45] ([i915#49]) +2 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7721/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3916/shard-tglb9/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-kbl:          [PASS][46] -> [DMESG-WARN][47] ([i915#180]) +3 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7721/shard-kbl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3916/shard-kbl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_psr@psr2_primary_mmap_gtt:
    - shard-iclb:         [PASS][48] -> [SKIP][49] ([fdo#109441])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7721/shard-iclb2/igt@kms_psr@psr2_primary_mmap_gtt.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3916/shard-iclb7/igt@kms_psr@psr2_primary_mmap_gtt.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-apl:          [DMESG-WARN][50] ([i915#180]) -> [PASS][51] +2 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7721/shard-apl1/igt@gem_ctx_isolation@rcs0-s3.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3916/shard-apl8/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_ctx_isolation@vecs0-s3:
    - shard-iclb:         [DMESG-WARN][52] ([fdo#111764]) -> [PASS][53] +1 similar issue
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7721/shard-iclb5/igt@gem_ctx_isolation@vecs0-s3.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3916/shard-iclb1/igt@gem_ctx_isolation@vecs0-s3.html

  * igt@gem_ctx_persistence@vcs1-hostile-preempt:
    - shard-iclb:         [SKIP][54] ([fdo#109276] / [fdo#112080]) -> [PASS][55] +1 similar issue
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7721/shard-iclb6/igt@gem_ctx_persistence@vcs1-hostile-preempt.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3916/shard-iclb1/igt@gem_ctx_persistence@vcs1-hostile-preempt.html

  * igt@gem_ctx_shared@q-smoketest-bsd1:
    - shard-tglb:         [INCOMPLETE][56] ([fdo#111735]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7721/shard-tglb6/igt@gem_ctx_shared@q-smoketest-bsd1.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3916/shard-tglb5/igt@gem_ctx_shared@q-smoketest-bsd1.html

  * igt@gem_eio@in-flight-1us:
    - shard-snb:          [FAIL][58] ([i915#490]) -> [PASS][59] +1 similar issue
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7721/shard-snb4/igt@gem_eio@in-flight-1us.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3916/shard-snb5/igt@gem_eio@in-flight-1us.html

  * igt@gem_exec_await@wide-contexts:
    - shard-tglb:         [INCOMPLETE][60] ([fdo#111736] / [i915#472]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7721/shard-tglb3/igt@gem_exec_await@wide-contexts.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3916/shard-tglb4/igt@gem_exec_await@wide-contexts.html

  * igt@gem_exec_schedule@in-order-bsd:
    - shard-iclb:         [SKIP][62] ([fdo#112146]) -> [PASS][63] +5 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7721/shard-iclb1/igt@gem_exec_schedule@in-order-bsd.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3916/shard-iclb6/igt@gem_exec_schedule@in-order-bsd.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [SKIP][64] ([i915#677]) -> [PASS][65] +1 similar issue
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7721/shard-iclb2/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3916/shard-iclb8/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@preempt-queue-contexts-bsd2:
    - shard-tglb:         [INCOMPLETE][66] ([fdo#111606] / [fdo#111677] / [i915#472]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7721/shard-tglb8/igt@gem_exec_schedule@preempt-queue-contexts-bsd2.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3916/shard-tglb8/igt@gem_exec_schedule@preempt-queue-contexts-bsd2.html

  * igt@gem_exec_schedule@smoketest-bsd2:
    - shard-tglb:         [INCOMPLETE][68] ([i915#472] / [i915#707]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7721/shard-tglb9/igt@gem_exec_schedule@smoketest-bsd2.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3916/shard-tglb5/igt@gem_exec_schedule@smoketest-bsd2.html

  * igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing:
    - shard-apl:          [TIMEOUT][70] ([fdo#112271] / [i915#530]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7721/shard-apl3/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3916/shard-apl4/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html

  * igt@gem_persistent_relocs@forked-interruptible-thrashing:
    - shard-iclb:         [FAIL][72] ([i915#520]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7721/shard-iclb8/igt@gem_persistent_relocs@forked-interruptible-thrashing.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3916/shard-iclb7/igt@gem_persistent_relocs@forked-interruptible-thrashing.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [FAIL][74] ([i915#644]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7721/shard-glk3/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3916/shard-glk2/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_pwrite@self:
    - shard-snb:          [DMESG-WARN][76] ([i915#478]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7721/shard-snb1/igt@gem_pwrite@self.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3916/shard-snb6/igt@gem_pwrite@self.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy-gup:
    - shard-snb:          [DMESG-WARN][78] ([fdo#111870]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7721/shard-snb2/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3916/shard-snb5/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup.html

  * igt@gem_userptr_blits@process-exit-gtt:
    - shard-kbl:          [SKIP][80] ([fdo#109271]) -> [PASS][81] +1 similar issue
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7721/shard-kbl1/igt@gem_userptr_blits@process-exit-gtt.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3916/shard-kbl4/igt@gem_userptr_blits@process-exit-gtt.html

  * igt@gem_userptr_blits@process-exit-gtt-busy:
    - shard-snb:          [SKIP][82] ([fdo#109271]) -> [PASS][83] +1 similar issue
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7721/shard-snb1/igt@gem_userptr_blits@process-exit-gtt-busy.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3916/shard-snb1/igt@gem_userptr_blits@process-exit-gtt-busy.html
    - shard-iclb:         [SKIP][84] ([fdo#111890]) -> [PASS][85] +1 similar issue
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7721/shard-iclb2/igt@gem_userptr_blits@process-exit-gtt-busy.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3916/shard-iclb5/igt@gem_userptr_blits@process-exit-gtt-busy.html
    - shard-tglb:         [SKIP][86] ([fdo#112099]) -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7721/shard-tglb1/igt@gem_userptr_blits@process-exit-gtt-busy.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3916/shard-tglb6/igt@gem_userptr_blits@process-exit-gtt-busy.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-kbl:          [DMESG-WARN][88] ([i915#716]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7721/shard-kbl4/igt@gen9_exec_parse@allowed-single.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3916/shard-kbl4/igt@gen9_exec_parse@allowed-single.html

  * igt@i915_pm_rps@min-max-config-loaded:
    - shard-apl:          [FAIL][90] ([i915#39]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7721/shard-apl1/igt@i915_pm_rps@min-max-config-loaded.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3916/shard-apl2/igt@i915_pm_rps@min-max-config-loaded.html

  * igt@i915_pm_rps@waitboost:
    - shard-iclb:         [FAIL][92] ([i915#413]) -> [PASS][93]
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7721/shard-iclb6/igt@i915_pm_rps@waitboost.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3916/shard-iclb4/igt@i915_pm_rps@waitboost.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-random:
    - shard-hsw:          [INCOMPLETE][94] ([i915#61]) -> [PASS][95]
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7721/shard-hsw2/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3916/shard-hsw7/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][96] ([i915#180]) -> [PASS][97] +3 similar issues
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7721/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3916/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-tglb:         [INCOMPLETE][98] ([i915#456] / [i915#460] / [i915#474]) -> [PASS][99]
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7721/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3916/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-fullscreen:
    - shard-tglb:         [DMESG-FAIL][100] ([i915#402]) -> [PASS][101] +1 similar issue
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7721/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-fullscreen.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3916/shard-tglb9/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-pwrite:
    - shard-tglb:         [FAIL][102] ([i915#49]) -> [PASS][103] +1 similar issue
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7721/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-pwrite.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3916/shard-tglb9/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-pwrite.html

  * igt@kms_psr@primary_blt:
    - shard-tglb:         [DMESG-WARN][104] ([i915#402]) -> [PASS][105] +14 similar issues
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7721/shard-tglb7/igt@kms_psr@primary_blt.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3916/shard-tglb5/igt@kms_psr@primary_blt.html

  * igt@kms_psr@psr2_basic:
    - shard-iclb:         [SKIP][106] ([fdo#109441]) -> [PASS][107] +1 similar issue
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7721/shard-iclb6/igt@kms_psr@psr2_basic.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3916/shard-iclb2/igt@kms_psr@psr2_basic.html

  * igt@perf_pmu@init-busy-vcs1:
    - shard-iclb:         [SKIP][108] ([fdo#112080]) -> [PASS][109] +4 similar issues
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7721/shard-iclb6/igt@perf_pmu@init-busy-vcs1.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3916/shard-iclb2/igt@perf_pmu@init-busy-vcs1.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [SKIP][110] ([fdo#109276]) -> [PASS][111] +15 similar issues
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7721/shard-iclb6/igt@prime_busy@hang-bsd2.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3916/shard-iclb2/igt@prime_busy@hang-bsd2.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [SKIP][112] ([fdo#109276] / [fdo#112080]) -> [FAIL][113] ([IGT#28])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7721/shard-iclb8/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3916/shard-iclb2/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@gem_exec_create@forked:
    - shard-tglb:         [INCOMPLETE][114] ([fdo#108838] / [i915#472]) -> [INCOMPLETE][115] ([i915#472])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7721/shard-tglb3/igt@gem_exec_create@forked.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3916/shard-tglb9/igt@gem_exec_create@forked.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup:
    - shard-snb:          [DMESG-WARN][116] ([fdo#110789] / [fdo#111870]) -> [DMESG-WARN][117] ([fdo#111870])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7721/shard-snb2/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3916/shard-snb5/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [FAIL][118] ([i915#454]) -> [SKIP][119] ([i915#468])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7721/shard-tglb4/igt@i915_pm_dc@dc6-dpms.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3916/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-kbl:          [INCOMPLETE][120] ([fdo#103665]) -> [DMESG-WARN][121] ([i915#180])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7721/shard-kbl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3916/shard-kbl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][122], [FAIL][123]) ([i915#716] / [i915#974]) -> [FAIL][124] ([i915#974])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7721/shard-kbl4/igt@runner@aborted.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7721/shard-kbl2/igt@runner@aborted.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3916/shard-kbl2/igt@runner@aborted.html
    - shard-iclb:         ([FAIL][125], [FAIL][126], [FAIL][127]) ([fdo#110275] / [fdo#111093]) -> [FAIL][128] ([fdo#111093])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7721/shard-iclb2/igt@runner@aborted.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7721/shard-iclb5/igt@runner@aborted.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7721/shard-iclb4/igt@runner@aborted.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3916/shard-iclb3/igt@runner@aborted.html

  
  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#108838]: https://bugs.freedesktop.org/show_bug.cgi?id=108838
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110275]: https://bugs.freedesktop.org/show_bug.cgi?id=110275
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#111093]: https://bugs.freedesktop.org/show_bug.cgi?id=111093
  [fdo#111606]: https://bugs.freedesktop.org/show_bug.cgi?id=111606
  [fdo#111677]: https://bugs.freedesktop.org/show_bug.cgi?id=111677
  [fdo#111735]: https://bugs.freedesktop.org/show_bug.cgi?id=111735
  [fdo#111736]: https://bugs.freedesktop.org/show_bug.cgi?id=111736
  [fdo#111764]: https://bugs.freedesktop.org/show_bug.cgi?id=111764
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#111890]: https://bugs.freedesktop.org/show_bug.cgi?id=111890
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112099]: https://bugs.freedesktop.org/show_bug.cgi?id=112099
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#39]: https://gitlab.freedesktop.org/drm/intel/issues/39
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#460]: https://gitlab.freedesktop.org/drm/intel/issues/460
  [i915#461]: https://gitlab.freedesktop.org/drm/intel/issues/461
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#470]: https://gitlab.freedesktop.org/drm/intel/issues/470
  [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
  [i915#474]: https://gitlab.freedesktop.org/drm/intel/issues/474
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#490]: https://gitlab.freedesktop.org/drm/intel/issues/490
  [i915#520]: https://gitlab.freedesktop.org/drm/intel/issues/520
  [i915#530]: https://gitlab.freedesktop.org/drm/intel/issues/530
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#679]: https://gitlab.freedesktop.org/drm/intel/issues/679
  [i915#707]: https://gitlab.freedesktop.org/drm/intel/issues/707
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#974]: https://gitlab.freedesktop.org/drm/intel/issues/974


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-hsw-4770r 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5364 -> IGTPW_3916
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7721: 3a2436c56fcf2d133d701a112eb1e0dfce0b846d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3916: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3916/index.html
  IGT_5364: b7cb6ffdb65cbd233f5ddee2f2dabf97b34fa640 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3916/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
