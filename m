Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 27 Feb 2020 04:49:29 -0000
Message-ID: <158277896947.29656.1073668867469899343@emeril.freedesktop.org>
References: <20200226134508.3374-1-swati2.sharma@intel.com>
In-Reply-To: <20200226134508.3374-1-swati2.sharma@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fatomic=3A_add_test_to_validate_immutable_zpos?=
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
To: Swati Sharma <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_atomic: add test to validate immutable zpos
URL   : https://patchwork.freedesktop.org/series/73956/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8007_full -> IGTPW_4229_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4229_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4229_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4229/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4229_full:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_pm_rpm@gem-idle:
    - shard-iclb:         [PASS][1] -> [SKIP][2] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-iclb1/igt@i915_pm_rpm@gem-idle.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4229/shard-iclb8/igt@i915_pm_rpm@gem-idle.html
    - shard-tglb:         [PASS][3] -> [SKIP][4] +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-tglb2/igt@i915_pm_rpm@gem-idle.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4229/shard-tglb5/igt@i915_pm_rpm@gem-idle.html

  * {igt@kms_atomic@plane_immutable_zpos} (NEW):
    - shard-snb:          NOTRUN -> [FAIL][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4229/shard-snb4/igt@kms_atomic@plane_immutable_zpos.html
    - shard-hsw:          NOTRUN -> [FAIL][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4229/shard-hsw6/igt@kms_atomic@plane_immutable_zpos.html

  * {igt@kms_atomic@plane_primary_overlay_mutable_zpos} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4229/shard-iclb3/igt@kms_atomic@plane_primary_overlay_mutable_zpos.html
    - shard-tglb:         NOTRUN -> [SKIP][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4229/shard-tglb8/igt@kms_atomic@plane_primary_overlay_mutable_zpos.html

  * igt@sw_sync@sync_multi_producer_single_consumer:
    - shard-apl:          [PASS][9] -> [TIMEOUT][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-apl6/igt@sw_sync@sync_multi_producer_single_consumer.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4229/shard-apl4/igt@sw_sync@sync_multi_producer_single_consumer.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8007_full and IGTPW_4229_full:

### New IGT tests (2) ###

  * igt@kms_atomic@plane_immutable_zpos:
    - Statuses : 2 fail(s) 5 pass(s)
    - Exec time: [0.09, 0.99] s

  * igt@kms_atomic@plane_primary_overlay_mutable_zpos:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_4229_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@vcs1-dirty-create:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([fdo#112080]) +9 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-iclb2/igt@gem_ctx_isolation@vcs1-dirty-create.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4229/shard-iclb7/igt@gem_ctx_isolation@vcs1-dirty-create.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [PASS][13] -> [SKIP][14] ([fdo#110854])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-iclb2/igt@gem_exec_balancer@smoke.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4229/shard-iclb6/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [PASS][15] -> [SKIP][16] ([i915#677])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-iclb3/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4229/shard-iclb2/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@reorder-wide-bsd:
    - shard-iclb:         [PASS][17] -> [SKIP][18] ([fdo#112146]) +4 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-iclb5/igt@gem_exec_schedule@reorder-wide-bsd.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4229/shard-iclb2/igt@gem_exec_schedule@reorder-wide-bsd.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [PASS][19] -> [FAIL][20] ([i915#644])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-glk8/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4229/shard-glk7/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-hsw:          [PASS][21] -> [INCOMPLETE][22] ([CI#80] / [i915#61])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-hsw5/igt@gem_tiled_swapping@non-threaded.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4229/shard-hsw7/igt@gem_tiled_swapping@non-threaded.html

  * igt@gem_userptr_blits@sync-unmap-after-close:
    - shard-hsw:          [PASS][23] -> [DMESG-WARN][24] ([fdo#111870]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-hsw5/igt@gem_userptr_blits@sync-unmap-after-close.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4229/shard-hsw1/igt@gem_userptr_blits@sync-unmap-after-close.html
    - shard-snb:          [PASS][25] -> [DMESG-WARN][26] ([fdo#111870] / [i915#478]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-snb6/igt@gem_userptr_blits@sync-unmap-after-close.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4229/shard-snb5/igt@gem_userptr_blits@sync-unmap-after-close.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-apl:          [PASS][27] -> [DMESG-WARN][28] ([i915#180]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-apl4/igt@gem_workarounds@suspend-resume-context.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4229/shard-apl1/igt@gem_workarounds@suspend-resume-context.html

  * igt@i915_pm_rpm@gem-idle:
    - shard-glk:          [PASS][29] -> [SKIP][30] ([fdo#109271])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-glk9/igt@i915_pm_rpm@gem-idle.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4229/shard-glk8/igt@i915_pm_rpm@gem-idle.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-hsw:          [PASS][31] -> [SKIP][32] ([fdo#109271]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-hsw5/igt@i915_pm_rpm@system-suspend-execbuf.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4229/shard-hsw1/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@kms_color@pipe-a-ctm-blue-to-red:
    - shard-kbl:          [PASS][33] -> [FAIL][34] ([i915#129])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-kbl7/igt@kms_color@pipe-a-ctm-blue-to-red.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4229/shard-kbl7/igt@kms_color@pipe-a-ctm-blue-to-red.html
    - shard-apl:          [PASS][35] -> [FAIL][36] ([i915#129])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-apl4/igt@kms_color@pipe-a-ctm-blue-to-red.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4229/shard-apl4/igt@kms_color@pipe-a-ctm-blue-to-red.html

  * igt@kms_cursor_crc@pipe-b-cursor-128x42-sliding:
    - shard-kbl:          [PASS][37] -> [FAIL][38] ([i915#54])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-kbl4/igt@kms_cursor_crc@pipe-b-cursor-128x42-sliding.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4229/shard-kbl3/igt@kms_cursor_crc@pipe-b-cursor-128x42-sliding.html
    - shard-apl:          [PASS][39] -> [FAIL][40] ([i915#54])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-apl2/igt@kms_cursor_crc@pipe-b-cursor-128x42-sliding.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4229/shard-apl7/igt@kms_cursor_crc@pipe-b-cursor-128x42-sliding.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-glk:          [PASS][41] -> [FAIL][42] ([i915#34])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-glk2/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4229/shard-glk2/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
    - shard-tglb:         [PASS][43] -> [FAIL][44] ([i915#488])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-tglb2/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4229/shard-tglb7/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-kbl:          [PASS][45] -> [DMESG-WARN][46] ([i915#180]) +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-kbl3/igt@kms_flip@flip-vs-suspend.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4229/shard-kbl7/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
    - shard-tglb:         [PASS][47] -> [SKIP][48] ([i915#668]) +8 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4229/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [PASS][49] -> [FAIL][50] ([i915#899])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-glk7/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4229/shard-glk8/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr@psr2_basic:
    - shard-iclb:         [PASS][51] -> [SKIP][52] ([fdo#109441]) +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-iclb2/igt@kms_psr@psr2_basic.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4229/shard-iclb8/igt@kms_psr@psr2_basic.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [PASS][53] -> [SKIP][54] ([fdo#109276]) +16 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-iclb2/igt@prime_busy@hang-bsd2.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4229/shard-iclb3/igt@prime_busy@hang-bsd2.html

  
#### Possible fixes ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [SKIP][55] ([fdo#112080]) -> [PASS][56] +10 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-iclb3/igt@gem_busy@busy-vcs1.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4229/shard-iclb2/igt@gem_busy@busy-vcs1.html

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-kbl:          [DMESG-WARN][57] ([i915#180]) -> [PASS][58] +5 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-kbl4/igt@gem_ctx_isolation@rcs0-s3.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4229/shard-kbl6/igt@gem_ctx_isolation@rcs0-s3.html

  * {igt@gem_exec_schedule@implicit-both-bsd1}:
    - shard-iclb:         [SKIP][59] ([fdo#109276] / [i915#677]) -> [PASS][60] +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-iclb7/igt@gem_exec_schedule@implicit-both-bsd1.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4229/shard-iclb1/igt@gem_exec_schedule@implicit-both-bsd1.html

  * igt@gem_exec_schedule@pi-shared-iova-bsd:
    - shard-iclb:         [SKIP][61] ([i915#677]) -> [PASS][62] +2 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-iclb1/igt@gem_exec_schedule@pi-shared-iova-bsd.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4229/shard-iclb8/igt@gem_exec_schedule@pi-shared-iova-bsd.html

  * igt@gem_exec_schedule@preempt-bsd:
    - shard-iclb:         [SKIP][63] ([fdo#112146]) -> [PASS][64] +5 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-iclb1/igt@gem_exec_schedule@preempt-bsd.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4229/shard-iclb8/igt@gem_exec_schedule@preempt-bsd.html

  * igt@gem_exec_schedule@preempt-contexts-bsd2:
    - shard-iclb:         [SKIP][65] ([fdo#109276]) -> [PASS][66] +6 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-iclb8/igt@gem_exec_schedule@preempt-contexts-bsd2.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4229/shard-iclb4/igt@gem_exec_schedule@preempt-contexts-bsd2.html

  * {igt@gem_mmap_wc@write-wc-read-gtt}:
    - shard-hsw:          [DMESG-WARN][67] -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-hsw5/igt@gem_mmap_wc@write-wc-read-gtt.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4229/shard-hsw1/igt@gem_mmap_wc@write-wc-read-gtt.html

  * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-hsw:          [SKIP][69] ([fdo#109271]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-hsw1/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4229/shard-hsw4/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
    - shard-glk:          [SKIP][71] ([fdo#109271]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-glk7/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4229/shard-glk6/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@i915_pm_rpm@system-suspend-modeset:
    - shard-kbl:          [FAIL][73] ([fdo#103375]) -> [PASS][74] +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-kbl4/igt@i915_pm_rpm@system-suspend-modeset.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4229/shard-kbl2/igt@i915_pm_rpm@system-suspend-modeset.html

  * igt@i915_pm_rps@reset:
    - shard-iclb:         [FAIL][75] ([i915#413]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-iclb2/igt@i915_pm_rps@reset.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4229/shard-iclb2/igt@i915_pm_rps@reset.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding:
    - shard-apl:          [FAIL][77] ([i915#54]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4229/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-glk:          [FAIL][79] ([i915#79]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4229/shard-glk1/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render:
    - shard-snb:          [DMESG-WARN][81] ([i915#478]) -> [PASS][82] +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-snb6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4229/shard-snb4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:
    - shard-glk:          [FAIL][83] ([i915#49]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-glk3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4229/shard-glk7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-apl:          [DMESG-WARN][85] ([i915#180]) -> [PASS][86] +1 similar issue
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-apl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4229/shard-apl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_psr@primary_mmap_gtt:
    - shard-tglb:         [SKIP][87] ([i915#668]) -> [PASS][88] +8 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-tglb3/igt@kms_psr@primary_mmap_gtt.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4229/shard-tglb5/igt@kms_psr@primary_mmap_gtt.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [SKIP][89] ([fdo#109441]) -> [PASS][90] +2 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-iclb8/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4229/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@sw_sync@sync_multi_producer_single_consumer:
    - shard-tglb:         [TIMEOUT][91] -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-tglb7/igt@sw_sync@sync_multi_producer_single_consumer.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4229/shard-tglb5/igt@sw_sync@sync_multi_producer_single_consumer.html

  
#### Warnings ####

  * igt@gem_softpin@noreloc-s3:
    - shard-kbl:          [INCOMPLETE][93] ([fdo#103665]) -> [DMESG-WARN][94] ([i915#180])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-kbl2/igt@gem_softpin@noreloc-s3.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4229/shard-kbl7/igt@gem_softpin@noreloc-s3.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [FAIL][95] ([i915#454]) -> [SKIP][96] ([i915#468])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-tglb6/igt@i915_pm_dc@dc6-dpms.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4229/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-tglb:         [SKIP][97] -> [SKIP][98] ([fdo#111644])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-tglb6/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4229/shard-tglb1/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
    - shard-iclb:         [SKIP][99] -> [SKIP][100] ([fdo#110892])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-iclb2/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4229/shard-iclb8/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@i915_pm_rpm@modeset-pc8-residency-stress:
    - shard-snb:          [INCOMPLETE][101] ([i915#82]) -> [SKIP][102] ([fdo#109271])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-snb2/igt@i915_pm_rpm@modeset-pc8-residency-stress.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4229/shard-snb2/igt@i915_pm_rpm@modeset-pc8-residency-stress.html

  * igt@kms_content_protection@atomic:
    - shard-kbl:          [TIMEOUT][103] ([i915#1319] / [i915#727]) -> [TIMEOUT][104] ([i915#1319])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-kbl2/igt@kms_content_protection@atomic.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4229/shard-kbl3/igt@kms_content_protection@atomic.html

  * igt@runner@aborted:
    - shard-hsw:          ([FAIL][105], [FAIL][106], [FAIL][107], [FAIL][108], [FAIL][109], [FAIL][110], [FAIL][111], [FAIL][112]) ([fdo#111870] / [i915#226]) -> ([FAIL][113], [FAIL][114], [FAIL][115], [FAIL][116], [FAIL][117], [FAIL][118]) ([fdo#111870])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-hsw5/igt@runner@aborted.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-hsw7/igt@runner@aborted.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-hsw7/igt@runner@aborted.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-hsw5/igt@runner@aborted.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-hsw6/igt@runner@aborted.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-hsw7/igt@runner@aborted.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-hsw1/igt@runner@aborted.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-hsw5/igt@runner@aborted.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4229/shard-hsw1/igt@runner@aborted.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4229/shard-hsw1/igt@runner@aborted.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4229/shard-hsw1/igt@runner@aborted.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4229/shard-hsw1/igt@runner@aborted.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4229/shard-hsw6/igt@runner@aborted.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4229/shard-hsw5/igt@runner@aborted.html
    - shard-snb:          ([FAIL][119], [FAIL][120], [FAIL][121], [FAIL][122], [FAIL][123], [FAIL][124], [FAIL][125], [FAIL][126]) ([fdo#111870] / [i915#1077] / [i915#698]) -> ([FAIL][127], [FAIL][128], [FAIL][129], [FAIL][130], [FAIL][131], [FAIL][132]) ([fdo#111870] / [i915#1077])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-snb2/igt@runner@aborted.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-snb4/igt@runner@aborted.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-snb2/igt@runner@aborted.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-snb6/igt@runner@aborted.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-snb4/igt@runner@aborted.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-snb6/igt@runner@aborted.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-snb6/igt@runner@aborted.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8007/shard-snb2/igt@runner@aborted.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4229/shard-snb2/igt@runner@aborted.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4229/shard-snb5/igt@runner@aborted.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4229/shard-snb5/igt@runner@aborted.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4229/shard-snb2/igt@runner@aborted.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4229/shard-snb4/igt@runner@aborted.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4229/shard-snb5/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#110892]: https://bugs.freedesktop.org/show_bug.cgi?id=110892
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1077]: https://gitlab.freedesktop.org/drm/intel/issues/1077
  [i915#129]: https://gitlab.freedesktop.org/drm/intel/issues/129
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#226]: https://gitlab.freedesktop.org/drm/intel/issues/226
  [i915#34]: https://gitlab.freedesktop.org/drm/intel/issues/34
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#488]: https://gitlab.freedesktop.org/drm/intel/issues/488
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#698]: https://gitlab.freedesktop.org/drm/intel/issues/698
  [i915#727]: https://gitlab.freedesktop.org/drm/intel/issues/727
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5469 -> IGTPW_4229
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8007: 8dbfb8dcfb623026de73fdb617785f507064af89 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4229: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4229/index.html
  IGT_5469: 4f875016eb1ebc211b8aadb280ae16c7e6cdc8ba @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4229/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
