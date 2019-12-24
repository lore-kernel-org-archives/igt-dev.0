Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 24 Dec 2019 23:11:06 -0000
Message-ID: <157722906680.26088.5089844757830255846@emeril.freedesktop.org>
References: <20191223155848.16208-1-stanislav.lisovskiy@intel.com>
In-Reply-To: <20191223155848.16208-1-stanislav.lisovskiy@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdG9vbHM6?=
 =?utf-8?q?_Add_an_intel=5Fdbuf=5Fmap_tool_=28rev3=29?=
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
To: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tools: Add an intel_dbuf_map tool (rev3)
URL   : https://patchwork.freedesktop.org/series/70493/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7628_full -> IGTPW_3883_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_3883_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_3883_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3883/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_3883_full:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-tglb:         NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3883/shard-tglb3/igt@i915_pm_dc@dc3co-vpb-simulation.html

  
Known issues
------------

  Here are the changes found in IGTPW_3883_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@vecs0-s3:
    - shard-apl:          [PASS][2] -> [DMESG-WARN][3] ([i915#180]) +2 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7628/shard-apl7/igt@gem_ctx_isolation@vecs0-s3.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3883/shard-apl1/igt@gem_ctx_isolation@vecs0-s3.html

  * igt@gem_ctx_shared@q-smoketest-bsd1:
    - shard-tglb:         [PASS][4] -> [INCOMPLETE][5] ([fdo#111735])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7628/shard-tglb9/igt@gem_ctx_shared@q-smoketest-bsd1.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3883/shard-tglb3/igt@gem_ctx_shared@q-smoketest-bsd1.html

  * igt@gem_exec_schedule@preempt-queue-bsd2:
    - shard-tglb:         [PASS][6] -> [INCOMPLETE][7] ([fdo#111606] / [fdo#111677])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7628/shard-tglb5/igt@gem_exec_schedule@preempt-queue-bsd2.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3883/shard-tglb6/igt@gem_exec_schedule@preempt-queue-bsd2.html

  * igt@gem_exec_schedule@preempt-queue-contexts-chain-bsd2:
    - shard-tglb:         [PASS][8] -> [INCOMPLETE][9] ([fdo#111677])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7628/shard-tglb4/igt@gem_exec_schedule@preempt-queue-contexts-chain-bsd2.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3883/shard-tglb6/igt@gem_exec_schedule@preempt-queue-contexts-chain-bsd2.html

  * igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrash-inactive:
    - shard-snb:          [PASS][10] -> [TIMEOUT][11] ([i915#530])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7628/shard-snb5/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrash-inactive.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3883/shard-snb6/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrash-inactive.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-kbl:          [PASS][12] -> [DMESG-WARN][13] ([i915#180]) +2 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7628/shard-kbl3/igt@gem_workarounds@suspend-resume-fd.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3883/shard-kbl4/igt@gem_workarounds@suspend-resume-fd.html

  * igt@i915_pm_rps@waitboost:
    - shard-iclb:         [PASS][14] -> [FAIL][15] ([i915#413])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7628/shard-iclb2/igt@i915_pm_rps@waitboost.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3883/shard-iclb2/igt@i915_pm_rps@waitboost.html

  * igt@i915_selftest@live_gt_timelines:
    - shard-tglb:         [PASS][16] -> [INCOMPLETE][17] ([i915#455])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7628/shard-tglb1/igt@i915_selftest@live_gt_timelines.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3883/shard-tglb8/igt@i915_selftest@live_gt_timelines.html

  * igt@i915_selftest@mock_requests:
    - shard-apl:          [PASS][18] -> [INCOMPLETE][19] ([fdo#103927])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7628/shard-apl1/igt@i915_selftest@mock_requests.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3883/shard-apl2/igt@i915_selftest@mock_requests.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-tglb:         [PASS][20] -> [INCOMPLETE][21] ([i915#456] / [i915#460])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7628/shard-tglb4/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3883/shard-tglb4/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-d-cursor-suspend:
    - shard-tglb:         [PASS][22] -> [INCOMPLETE][23] ([i915#460])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7628/shard-tglb4/igt@kms_cursor_crc@pipe-d-cursor-suspend.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3883/shard-tglb1/igt@kms_cursor_crc@pipe-d-cursor-suspend.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-glk:          [PASS][24] -> [FAIL][25] ([i915#117] / [i915#133])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7628/shard-glk9/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3883/shard-glk7/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_flip@plain-flip-ts-check-interruptible:
    - shard-glk:          [PASS][26] -> [FAIL][27] ([i915#34])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7628/shard-glk2/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3883/shard-glk2/igt@kms_flip@plain-flip-ts-check-interruptible.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt:
    - shard-tglb:         [PASS][28] -> [FAIL][29] ([i915#49])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7628/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3883/shard-tglb4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt.html

  
#### Possible fixes ####

  * igt@gem_eio@in-flight-contexts-1us:
    - shard-snb:          [FAIL][30] ([i915#490]) -> [PASS][31]
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7628/shard-snb7/igt@gem_eio@in-flight-contexts-1us.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3883/shard-snb7/igt@gem_eio@in-flight-contexts-1us.html

  * igt@gem_exec_nop@basic-parallel:
    - shard-tglb:         [INCOMPLETE][32] ([i915#435]) -> [PASS][33] +1 similar issue
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7628/shard-tglb5/igt@gem_exec_nop@basic-parallel.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3883/shard-tglb1/igt@gem_exec_nop@basic-parallel.html

  * igt@gem_exec_parallel@vcs0:
    - shard-tglb:         [INCOMPLETE][34] ([fdo#111593]) -> [PASS][35]
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7628/shard-tglb4/igt@gem_exec_parallel@vcs0.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3883/shard-tglb8/igt@gem_exec_parallel@vcs0.html

  * igt@gem_exec_schedule@preempt-queue-chain-bsd1:
    - shard-tglb:         [INCOMPLETE][36] ([fdo#111606] / [fdo#111677]) -> [PASS][37]
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7628/shard-tglb6/igt@gem_exec_schedule@preempt-queue-chain-bsd1.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3883/shard-tglb5/igt@gem_exec_schedule@preempt-queue-chain-bsd1.html

  * igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing:
    - shard-glk:          [TIMEOUT][38] ([i915#530]) -> [PASS][39]
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7628/shard-glk1/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3883/shard-glk9/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html

  * igt@gem_persistent_relocs@forked-interruptible-thrashing:
    - shard-kbl:          [FAIL][40] ([i915#520]) -> [PASS][41]
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7628/shard-kbl6/igt@gem_persistent_relocs@forked-interruptible-thrashing.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3883/shard-kbl7/igt@gem_persistent_relocs@forked-interruptible-thrashing.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [FAIL][42] ([i915#644]) -> [PASS][43]
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7628/shard-glk9/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3883/shard-glk5/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_softpin@noreloc-s3:
    - shard-tglb:         [INCOMPLETE][44] ([i915#456]) -> [PASS][45]
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7628/shard-tglb7/igt@gem_softpin@noreloc-s3.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3883/shard-tglb9/igt@gem_softpin@noreloc-s3.html

  * igt@gem_sync@basic-store-all:
    - shard-tglb:         [INCOMPLETE][46] ([i915#472]) -> [PASS][47]
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7628/shard-tglb3/igt@gem_sync@basic-store-all.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3883/shard-tglb1/igt@gem_sync@basic-store-all.html

  * {igt@gen7_exec_parse@basic-offset}:
    - shard-hsw:          [FAIL][48] ([i915#819]) -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7628/shard-hsw5/igt@gen7_exec_parse@basic-offset.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3883/shard-hsw5/igt@gen7_exec_parse@basic-offset.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][50] ([i915#454]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7628/shard-iclb2/igt@i915_pm_dc@dc6-psr.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3883/shard-iclb2/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_selftest@live_blt:
    - shard-hsw:          [DMESG-FAIL][52] ([i915#725]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7628/shard-hsw5/igt@i915_selftest@live_blt.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3883/shard-hsw5/igt@i915_selftest@live_blt.html

  * igt@i915_selftest@mock_requests:
    - shard-iclb:         [INCOMPLETE][54] ([i915#140]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7628/shard-iclb2/igt@i915_selftest@mock_requests.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3883/shard-iclb2/igt@i915_selftest@mock_requests.html

  * igt@i915_suspend@sysfs-reader:
    - shard-tglb:         [INCOMPLETE][56] ([i915#456] / [i915#460]) -> [PASS][57] +2 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7628/shard-tglb2/igt@i915_suspend@sysfs-reader.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3883/shard-tglb2/igt@i915_suspend@sysfs-reader.html
    - shard-apl:          [DMESG-WARN][58] ([i915#180]) -> [PASS][59] +2 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7628/shard-apl6/igt@i915_suspend@sysfs-reader.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3883/shard-apl7/igt@i915_suspend@sysfs-reader.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen:
    - shard-kbl:          [FAIL][60] ([i915#54]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7628/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3883/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen.html
    - shard-apl:          [FAIL][62] ([i915#54]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7628/shard-apl1/igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3883/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen.html

  * igt@kms_flip@plain-flip-fb-recreate:
    - shard-glk:          [FAIL][64] ([i915#34]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7628/shard-glk3/igt@kms_flip@plain-flip-fb-recreate.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3883/shard-glk6/igt@kms_flip@plain-flip-fb-recreate.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:
    - shard-glk:          [FAIL][66] ([i915#49]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7628/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3883/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-pwrite:
    - shard-tglb:         [FAIL][68] ([i915#49]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7628/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-pwrite.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3883/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-tglb:         [FAIL][70] ([fdo#111842] / [i915#608]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7628/shard-tglb6/igt@kms_psr2_su@frontbuffer.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3883/shard-tglb2/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:
    - shard-glk:          [DMESG-FAIL][72] ([i915#118] / [i915#95]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7628/shard-glk3/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3883/shard-glk2/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [DMESG-WARN][74] ([i915#180]) -> [PASS][75] +7 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7628/shard-kbl7/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3883/shard-kbl7/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@kms_vblank@pipe-d-ts-continuation-suspend:
    - shard-tglb:         [INCOMPLETE][76] ([i915#460]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7628/shard-tglb5/igt@kms_vblank@pipe-d-ts-continuation-suspend.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3883/shard-tglb8/igt@kms_vblank@pipe-d-ts-continuation-suspend.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs2-s3:
    - shard-tglb:         [SKIP][78] ([fdo#111912] / [fdo#112080]) -> [SKIP][79] ([fdo#112080])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7628/shard-tglb8/igt@gem_ctx_isolation@vcs2-s3.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3883/shard-tglb9/igt@gem_ctx_isolation@vcs2-s3.html

  * igt@gem_tiled_blits@interruptible:
    - shard-hsw:          [FAIL][80] ([i915#832]) -> [INCOMPLETE][81] ([i915#61])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7628/shard-hsw2/igt@gem_tiled_blits@interruptible.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3883/shard-hsw2/igt@gem_tiled_blits@interruptible.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-kbl:          [DMESG-WARN][82] ([i915#180]) -> [DMESG-WARN][83] ([i915#180] / [i915#56])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7628/shard-kbl7/igt@kms_flip@flip-vs-suspend.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3883/shard-kbl6/igt@kms_flip@flip-vs-suspend.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#111593]: https://bugs.freedesktop.org/show_bug.cgi?id=111593
  [fdo#111606]: https://bugs.freedesktop.org/show_bug.cgi?id=111606
  [fdo#111677]: https://bugs.freedesktop.org/show_bug.cgi?id=111677
  [fdo#111735]: https://bugs.freedesktop.org/show_bug.cgi?id=111735
  [fdo#111842]: https://bugs.freedesktop.org/show_bug.cgi?id=111842
  [fdo#111912]: https://bugs.freedesktop.org/show_bug.cgi?id=111912
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [i915#117]: https://gitlab.freedesktop.org/drm/intel/issues/117
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#133]: https://gitlab.freedesktop.org/drm/intel/issues/133
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#34]: https://gitlab.freedesktop.org/drm/intel/issues/34
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#435]: https://gitlab.freedesktop.org/drm/intel/issues/435
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#455]: https://gitlab.freedesktop.org/drm/intel/issues/455
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#460]: https://gitlab.freedesktop.org/drm/intel/issues/460
  [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#490]: https://gitlab.freedesktop.org/drm/intel/issues/490
  [i915#520]: https://gitlab.freedesktop.org/drm/intel/issues/520
  [i915#530]: https://gitlab.freedesktop.org/drm/intel/issues/530
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#56]: https://gitlab.freedesktop.org/drm/intel/issues/56
  [i915#608]: https://gitlab.freedesktop.org/drm/intel/issues/608
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#819]: https://gitlab.freedesktop.org/drm/intel/issues/819
  [i915#832]: https://gitlab.freedesktop.org/drm/intel/issues/832
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-hsw-4770r 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5352 -> IGTPW_3883
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7628: 22f0a3a9b0f332ef75988890b7f1d5881588a1dd @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3883: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3883/index.html
  IGT_5352: 0586d205f651674e575351c2d5a7d0760716c9f1 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3883/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
