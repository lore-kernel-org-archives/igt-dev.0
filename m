Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 27 Feb 2020 03:52:06 -0000
Message-ID: <158277552682.29658.4184137833368183527@emeril.freedesktop.org>
References: <20200226130241.31558-1-sai.gowtham.ch@intel.com>
In-Reply-To: <20200226130241.31558-1-sai.gowtham.ch@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fsync=2Ec_=3AAdded_=5F=5Ffor=5Feach=5Fphysical=5Fengi?=
 =?utf-8?q?ne_to_utilize_all_available_engines=2E?=
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
To: sai gowtham <sai.gowtham.ch@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/i915/gem_sync.c :Added __for_each_physical_engine to utilize all available engines.
URL   : https://patchwork.freedesktop.org/series/73955/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8007_full -> IGTPW_4228_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4228_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4228_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4228/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4228_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_pwrite@huge-cpu-fbr:
    - shard-hsw:          [PASS][1] -> [TIMEOUT][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-hsw1/igt@gem_pwrite@huge-cpu-fbr.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4228/shard-hsw5/igt@gem_pwrite@huge-cpu-fbr.html

  * igt@gem_sync@basic-many-each:
    - shard-snb:          [PASS][3] -> [CRASH][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-snb4/igt@gem_sync@basic-many-each.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4228/shard-snb5/igt@gem_sync@basic-many-each.html
    - shard-hsw:          [PASS][5] -> [CRASH][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-hsw7/igt@gem_sync@basic-many-each.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4228/shard-hsw4/igt@gem_sync@basic-many-each.html
    - shard-kbl:          [PASS][7] -> [CRASH][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-kbl6/igt@gem_sync@basic-many-each.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4228/shard-kbl4/igt@gem_sync@basic-many-each.html
    - shard-iclb:         [PASS][9] -> [CRASH][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-iclb2/igt@gem_sync@basic-many-each.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4228/shard-iclb5/igt@gem_sync@basic-many-each.html
    - shard-apl:          [PASS][11] -> [CRASH][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-apl3/igt@gem_sync@basic-many-each.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4228/shard-apl6/igt@gem_sync@basic-many-each.html
    - shard-glk:          [PASS][13] -> [CRASH][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-glk7/igt@gem_sync@basic-many-each.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4228/shard-glk7/igt@gem_sync@basic-many-each.html
    - shard-tglb:         [PASS][15] -> [CRASH][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-tglb7/igt@gem_sync@basic-many-each.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4228/shard-tglb6/igt@gem_sync@basic-many-each.html

  * igt@sw_sync@sync_multi_producer_single_consumer:
    - shard-apl:          [PASS][17] -> [TIMEOUT][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-apl6/igt@sw_sync@sync_multi_producer_single_consumer.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4228/shard-apl4/igt@sw_sync@sync_multi_producer_single_consumer.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8007_full and IGTPW_4228_full:

### New IGT tests (6) ###

  * igt@gem_sync@basic_sync_ring:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_sync@basic_sync_ring@bcs0:
    - Statuses : 7 pass(s)
    - Exec time: [20.04, 20.45] s

  * igt@gem_sync@basic_sync_ring@rcs0:
    - Statuses : 7 pass(s)
    - Exec time: [20.02, 20.28] s

  * igt@gem_sync@basic_sync_ring@vcs0:
    - Statuses : 7 pass(s)
    - Exec time: [20.03, 20.22] s

  * igt@gem_sync@basic_sync_ring@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [20.05, 20.06] s

  * igt@gem_sync@basic_sync_ring@vecs0:
    - Statuses : 6 pass(s)
    - Exec time: [20.02, 20.17] s

  

Known issues
------------

  Here are the changes found in IGTPW_4228_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_eio@in-flight-suspend:
    - shard-apl:          [PASS][19] -> [DMESG-WARN][20] ([i915#180])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-apl3/igt@gem_eio@in-flight-suspend.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4228/shard-apl6/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [PASS][21] -> [SKIP][22] ([fdo#110854])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-iclb2/igt@gem_exec_balancer@smoke.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4228/shard-iclb8/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [PASS][23] -> [SKIP][24] ([i915#677])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-iclb3/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4228/shard-iclb1/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd:
    - shard-iclb:         [PASS][25] -> [SKIP][26] ([fdo#112146]) +3 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-iclb3/igt@gem_exec_schedule@preempt-queue-bsd.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4228/shard-iclb2/igt@gem_exec_schedule@preempt-queue-bsd.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [PASS][27] -> [FAIL][28] ([i915#644])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-glk8/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4228/shard-glk3/igt@gem_ppgtt@flink-and-close-vma-leak.html
    - shard-tglb:         [PASS][29] -> [FAIL][30] ([i915#644])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-tglb5/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4228/shard-tglb6/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_userptr_blits@sync-unmap-after-close:
    - shard-hsw:          [PASS][31] -> [DMESG-WARN][32] ([fdo#110789] / [fdo#111870]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-hsw5/igt@gem_userptr_blits@sync-unmap-after-close.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4228/shard-hsw1/igt@gem_userptr_blits@sync-unmap-after-close.html
    - shard-snb:          [PASS][33] -> [DMESG-WARN][34] ([fdo#110789] / [fdo#111870] / [i915#478]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-snb6/igt@gem_userptr_blits@sync-unmap-after-close.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4228/shard-snb2/igt@gem_userptr_blits@sync-unmap-after-close.html

  * igt@i915_pm_rps@waitboost:
    - shard-iclb:         [PASS][35] -> [FAIL][36] ([i915#413])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-iclb6/igt@i915_pm_rps@waitboost.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4228/shard-iclb6/igt@i915_pm_rps@waitboost.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
    - shard-tglb:         [PASS][37] -> [FAIL][38] ([i915#488])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-tglb2/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4228/shard-tglb8/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [PASS][39] -> [FAIL][40] ([i915#899])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-glk7/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4228/shard-glk6/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [PASS][41] -> [FAIL][42] ([i915#173])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-iclb3/igt@kms_psr@no_drrs.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4228/shard-iclb1/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_basic:
    - shard-iclb:         [PASS][43] -> [SKIP][44] ([fdo#109441]) +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-iclb2/igt@kms_psr@psr2_basic.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4228/shard-iclb5/igt@kms_psr@psr2_basic.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [PASS][45] -> [DMESG-WARN][46] ([i915#180]) +2 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4228/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@perf_pmu@busy-vcs1:
    - shard-iclb:         [PASS][47] -> [SKIP][48] ([fdo#112080]) +9 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-iclb4/igt@perf_pmu@busy-vcs1.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4228/shard-iclb7/igt@perf_pmu@busy-vcs1.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [PASS][49] -> [SKIP][50] ([fdo#109276]) +22 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-iclb4/igt@prime_vgem@fence-wait-bsd2.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4228/shard-iclb3/igt@prime_vgem@fence-wait-bsd2.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-kbl:          [DMESG-WARN][51] ([i915#180]) -> [PASS][52] +5 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-kbl4/igt@gem_ctx_isolation@rcs0-s3.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4228/shard-kbl7/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [SKIP][53] ([fdo#112080]) -> [PASS][54] +12 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-iclb7/igt@gem_exec_parallel@vcs1-fds.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4228/shard-iclb1/igt@gem_exec_parallel@vcs1-fds.html

  * {igt@gem_exec_schedule@implicit-read-write-bsd1}:
    - shard-iclb:         [SKIP][55] ([fdo#109276] / [i915#677]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-iclb3/igt@gem_exec_schedule@implicit-read-write-bsd1.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4228/shard-iclb4/igt@gem_exec_schedule@implicit-read-write-bsd1.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [SKIP][57] ([i915#677]) -> [PASS][58] +3 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-iclb2/igt@gem_exec_schedule@pi-common-bsd.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4228/shard-iclb5/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_schedule@preempt-bsd:
    - shard-iclb:         [SKIP][59] ([fdo#112146]) -> [PASS][60] +5 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-iclb1/igt@gem_exec_schedule@preempt-bsd.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4228/shard-iclb3/igt@gem_exec_schedule@preempt-bsd.html

  * igt@gem_exec_schedule@preempt-contexts-bsd2:
    - shard-iclb:         [SKIP][61] ([fdo#109276]) -> [PASS][62] +18 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-iclb8/igt@gem_exec_schedule@preempt-contexts-bsd2.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4228/shard-iclb4/igt@gem_exec_schedule@preempt-contexts-bsd2.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-kbl:          [FAIL][63] ([i915#644]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-kbl4/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4228/shard-kbl4/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_softpin@noreloc-s3:
    - shard-kbl:          [INCOMPLETE][65] ([fdo#103665]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-kbl2/igt@gem_softpin@noreloc-s3.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4228/shard-kbl4/igt@gem_softpin@noreloc-s3.html

  * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-hsw:          [SKIP][67] ([fdo#109271]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-hsw1/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4228/shard-hsw6/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
    - shard-glk:          [SKIP][69] ([fdo#109271]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-glk7/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4228/shard-glk1/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html

  * {igt@i915_pm_rpm@gem-mmap-type@wb}:
    - shard-hsw:          [DMESG-WARN][71] -> [PASS][72] +2 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-hsw7/igt@i915_pm_rpm@gem-mmap-type@wb.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4228/shard-hsw4/igt@i915_pm_rpm@gem-mmap-type@wb.html

  * igt@i915_pm_rpm@system-suspend-modeset:
    - shard-kbl:          [FAIL][73] ([fdo#103375]) -> [PASS][74] +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-kbl4/igt@i915_pm_rpm@system-suspend-modeset.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4228/shard-kbl7/igt@i915_pm_rpm@system-suspend-modeset.html

  * igt@i915_pm_rps@reset:
    - shard-iclb:         [FAIL][75] ([i915#413]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-iclb2/igt@i915_pm_rps@reset.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4228/shard-iclb6/igt@i915_pm_rps@reset.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding:
    - shard-apl:          [FAIL][77] ([i915#54]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4228/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-glk:          [FAIL][79] ([i915#79]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4228/shard-glk8/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render:
    - shard-snb:          [DMESG-WARN][81] ([i915#478]) -> [PASS][82] +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-snb6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4228/shard-snb5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:
    - shard-glk:          [FAIL][83] ([i915#49]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-glk3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4228/shard-glk3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-apl:          [DMESG-WARN][85] ([i915#180]) -> [PASS][86] +1 similar issue
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-apl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4228/shard-apl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_psr@primary_mmap_gtt:
    - shard-tglb:         [SKIP][87] ([i915#668]) -> [PASS][88] +8 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-tglb3/igt@kms_psr@primary_mmap_gtt.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4228/shard-tglb6/igt@kms_psr@primary_mmap_gtt.html

  * igt@kms_psr@psr2_sprite_render:
    - shard-iclb:         [SKIP][89] ([fdo#109441]) -> [PASS][90] +2 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-iclb5/igt@kms_psr@psr2_sprite_render.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4228/shard-iclb2/igt@kms_psr@psr2_sprite_render.html

  * igt@sw_sync@sync_multi_producer_single_consumer:
    - shard-tglb:         [TIMEOUT][91] -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-tglb7/igt@sw_sync@sync_multi_producer_single_consumer.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4228/shard-tglb1/igt@sw_sync@sync_multi_producer_single_consumer.html
    - shard-iclb:         [TIMEOUT][93] -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-iclb3/igt@sw_sync@sync_multi_producer_single_consumer.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4228/shard-iclb3/igt@sw_sync@sync_multi_producer_single_consumer.html

  
#### Warnings ####

  * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-tglb:         [SKIP][95] -> [SKIP][96] ([fdo#111644])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-tglb6/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4228/shard-tglb2/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
    - shard-iclb:         [SKIP][97] -> [SKIP][98] ([fdo#110892])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-iclb2/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4228/shard-iclb1/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [SKIP][99] ([fdo#109349]) -> [DMESG-WARN][100] ([i915#1226])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-iclb5/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4228/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@runner@aborted:
    - shard-hsw:          ([FAIL][101], [FAIL][102], [FAIL][103], [FAIL][104], [FAIL][105], [FAIL][106], [FAIL][107], [FAIL][108]) ([fdo#111870] / [i915#226]) -> ([FAIL][109], [FAIL][110], [FAIL][111], [FAIL][112], [FAIL][113], [FAIL][114], [FAIL][115], [FAIL][116]) ([fdo#111870])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-hsw5/igt@runner@aborted.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-hsw7/igt@runner@aborted.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-hsw7/igt@runner@aborted.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-hsw5/igt@runner@aborted.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-hsw6/igt@runner@aborted.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-hsw7/igt@runner@aborted.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-hsw1/igt@runner@aborted.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-hsw5/igt@runner@aborted.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4228/shard-hsw1/igt@runner@aborted.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4228/shard-hsw4/igt@runner@aborted.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4228/shard-hsw7/igt@runner@aborted.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4228/shard-hsw1/igt@runner@aborted.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4228/shard-hsw1/igt@runner@aborted.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4228/shard-hsw7/igt@runner@aborted.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4228/shard-hsw7/igt@runner@aborted.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4228/shard-hsw1/igt@runner@aborted.html
    - shard-snb:          ([FAIL][117], [FAIL][118], [FAIL][119], [FAIL][120], [FAIL][121], [FAIL][122], [FAIL][123], [FAIL][124]) ([fdo#111870] / [i915#1077] / [i915#698]) -> ([FAIL][125], [FAIL][126], [FAIL][127], [FAIL][128], [FAIL][129], [FAIL][130], [FAIL][131], [FAIL][132]) ([fdo#111870] / [i915#1077])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-snb4/igt@runner@aborted.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-snb6/igt@runner@aborted.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-snb2/igt@runner@aborted.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-snb4/igt@runner@aborted.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-snb6/igt@runner@aborted.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-snb2/igt@runner@aborted.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-snb6/igt@runner@aborted.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-snb2/igt@runner@aborted.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4228/shard-snb5/igt@runner@aborted.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4228/shard-snb6/igt@runner@aborted.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4228/shard-snb5/igt@runner@aborted.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4228/shard-snb6/igt@runner@aborted.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4228/shard-snb6/igt@runner@aborted.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4228/shard-snb4/igt@runner@aborted.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4228/shard-snb2/igt@runner@aborted.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4228/shard-snb2/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#110892]: https://bugs.freedesktop.org/show_bug.cgi?id=110892
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1077]: https://gitlab.freedesktop.org/drm/intel/issues/1077
  [i915#1226]: https://gitlab.freedesktop.org/drm/intel/issues/1226
  [i915#1291]: https://gitlab.freedesktop.org/drm/intel/issues/1291
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#226]: https://gitlab.freedesktop.org/drm/intel/issues/226
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#488]: https://gitlab.freedesktop.org/drm/intel/issues/488
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#698]: https://gitlab.freedesktop.org/drm/intel/issues/698
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5469 -> IGTPW_4228
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8007: 8dbfb8dcfb623026de73fdb617785f507064af89 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4228: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4228/index.html
  IGT_5469: 4f875016eb1ebc211b8aadb280ae16c7e6cdc8ba @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4228/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
