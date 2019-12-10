Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 10 Dec 2019 21:18:31 -0000
Message-ID: <157601271162.23230.14158349218586699604@emeril.freedesktop.org>
References: <20191210121934.3845438-1-chris@chris-wilson.co.uk>
In-Reply-To: <20191210121934.3845438-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaTkxNS9w?=
 =?utf-8?q?erf=5Fpmu=3A_Cap_target_number_of_interrupts?=
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

Series: i915/perf_pmu: Cap target number of interrupts
URL   : https://patchwork.freedesktop.org/series/70684/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7528_full -> IGTPW_3838_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_3838_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_3838_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3838/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_3838_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_ctx_persistence@vcs0-mixed-process:
    - shard-iclb:         [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-iclb5/igt@gem_ctx_persistence@vcs0-mixed-process.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3838/shard-iclb2/igt@gem_ctx_persistence@vcs0-mixed-process.html

  
Known issues
------------

  Here are the changes found in IGTPW_3838_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-apl:          [PASS][3] -> [DMESG-WARN][4] ([i915#180]) +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-apl7/igt@gem_ctx_isolation@rcs0-s3.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3838/shard-apl6/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_ctx_shared@q-smoketest-bsd:
    - shard-tglb:         [PASS][5] -> [INCOMPLETE][6] ([i915#461])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-tglb8/igt@gem_ctx_shared@q-smoketest-bsd.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3838/shard-tglb4/igt@gem_ctx_shared@q-smoketest-bsd.html

  * igt@gem_ctx_shared@q-smoketest-bsd1:
    - shard-tglb:         [PASS][7] -> [INCOMPLETE][8] ([fdo#111735])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-tglb7/igt@gem_ctx_shared@q-smoketest-bsd1.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3838/shard-tglb4/igt@gem_ctx_shared@q-smoketest-bsd1.html

  * igt@gem_eio@unwedge-stress:
    - shard-snb:          [PASS][9] -> [FAIL][10] ([i915#232])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-snb2/igt@gem_eio@unwedge-stress.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3838/shard-snb4/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_await@wide-contexts:
    - shard-tglb:         [PASS][11] -> [INCOMPLETE][12] ([fdo#111736])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-tglb7/igt@gem_exec_await@wide-contexts.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3838/shard-tglb6/igt@gem_exec_await@wide-contexts.html

  * igt@gem_exec_schedule@preempt-queue-contexts-chain-bsd:
    - shard-iclb:         [PASS][13] -> [SKIP][14] ([fdo#112146]) +2 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-iclb3/igt@gem_exec_schedule@preempt-queue-contexts-chain-bsd.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3838/shard-iclb4/igt@gem_exec_schedule@preempt-queue-contexts-chain-bsd.html

  * igt@gem_persistent_relocs@forked-interruptible-thrashing:
    - shard-iclb:         [PASS][15] -> [FAIL][16] ([i915#520])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-iclb6/igt@gem_persistent_relocs@forked-interruptible-thrashing.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3838/shard-iclb1/igt@gem_persistent_relocs@forked-interruptible-thrashing.html

  * igt@gem_sync@basic-store-each:
    - shard-tglb:         [PASS][17] -> [INCOMPLETE][18] ([i915#435] / [i915#472])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-tglb4/igt@gem_sync@basic-store-each.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3838/shard-tglb8/igt@gem_sync@basic-store-each.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-snb:          [PASS][19] -> [DMESG-WARN][20] ([fdo#110789] / [fdo#111870])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-snb5/igt@gem_userptr_blits@dmabuf-sync.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3838/shard-snb2/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy-gup:
    - shard-snb:          [PASS][21] -> [DMESG-WARN][22] ([fdo#111870]) +2 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-snb5/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3838/shard-snb6/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup.html

  * igt@i915_selftest@mock_sanitycheck:
    - shard-kbl:          [PASS][23] -> [DMESG-WARN][24] ([i915#747])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-kbl3/igt@i915_selftest@mock_sanitycheck.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3838/shard-kbl4/igt@i915_selftest@mock_sanitycheck.html

  * igt@i915_suspend@sysfs-reader:
    - shard-tglb:         [PASS][25] -> [INCOMPLETE][26] ([i915#456] / [i915#460]) +2 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-tglb5/igt@i915_suspend@sysfs-reader.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3838/shard-tglb4/igt@i915_suspend@sysfs-reader.html

  * igt@kms_color@pipe-a-ctm-blue-to-red:
    - shard-kbl:          [PASS][27] -> [FAIL][28] ([i915#129])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-kbl2/igt@kms_color@pipe-a-ctm-blue-to-red.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3838/shard-kbl4/igt@kms_color@pipe-a-ctm-blue-to-red.html
    - shard-apl:          [PASS][29] -> [FAIL][30] ([i915#129])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-apl4/igt@kms_color@pipe-a-ctm-blue-to-red.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3838/shard-apl1/igt@kms_color@pipe-a-ctm-blue-to-red.html

  * igt@kms_cursor_crc@pipe-b-cursor-128x128-random:
    - shard-apl:          [PASS][31] -> [FAIL][32] ([i915#54])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-apl2/igt@kms_cursor_crc@pipe-b-cursor-128x128-random.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3838/shard-apl2/igt@kms_cursor_crc@pipe-b-cursor-128x128-random.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-pwrite:
    - shard-glk:          [PASS][33] -> [FAIL][34] ([i915#49])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-glk3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-pwrite.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3838/shard-glk5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
    - shard-tglb:         [PASS][35] -> [FAIL][36] ([i915#49])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3838/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt:
    - shard-tglb:         [PASS][37] -> [INCOMPLETE][38] ([i915#474] / [i915#667])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-tglb4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3838/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite:
    - shard-tglb:         [PASS][39] -> [INCOMPLETE][40] ([i915#435] / [i915#474] / [i915#667])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-tglb9/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3838/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-suspend:
    - shard-tglb:         [PASS][41] -> [INCOMPLETE][42] ([i915#456] / [i915#460] / [i915#474])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-tglb9/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3838/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html

  * igt@kms_plane@pixel-format-pipe-a-planes:
    - shard-snb:          [PASS][43] -> [SKIP][44] ([fdo#109271])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-snb6/igt@kms_plane@pixel-format-pipe-a-planes.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3838/shard-snb1/igt@kms_plane@pixel-format-pipe-a-planes.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [PASS][45] -> [SKIP][46] ([fdo#109642] / [fdo#111068])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-iclb2/igt@kms_psr2_su@page_flip.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3838/shard-iclb5/igt@kms_psr2_su@page_flip.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][47] -> [FAIL][48] ([i915#31])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-apl2/igt@kms_setmode@basic.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3838/shard-apl1/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [PASS][49] -> [DMESG-WARN][50] ([i915#180]) +6 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3838/shard-kbl7/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@perf_pmu@multi-client-vcs1:
    - shard-iclb:         [PASS][51] -> [SKIP][52] ([fdo#112080])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-iclb1/igt@perf_pmu@multi-client-vcs1.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3838/shard-iclb8/igt@perf_pmu@multi-client-vcs1.html

  * igt@prime_busy@after-bsd2:
    - shard-iclb:         [PASS][53] -> [SKIP][54] ([fdo#109276])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-iclb1/igt@prime_busy@after-bsd2.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3838/shard-iclb8/igt@prime_busy@after-bsd2.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-kbl:          [DMESG-WARN][55] ([i915#180]) -> [PASS][56] +5 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-kbl3/igt@gem_ctx_isolation@rcs0-s3.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3838/shard-kbl1/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_exec_create@forked:
    - shard-tglb:         [INCOMPLETE][57] ([fdo#108838] / [i915#435]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-tglb5/igt@gem_exec_create@forked.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3838/shard-tglb5/igt@gem_exec_create@forked.html

  * igt@gem_exec_schedule@pi-ringfull-bsd:
    - shard-iclb:         [SKIP][59] ([fdo#112146]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-iclb2/igt@gem_exec_schedule@pi-ringfull-bsd.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3838/shard-iclb5/igt@gem_exec_schedule@pi-ringfull-bsd.html

  * igt@gem_exec_schedule@promotion-bsd1:
    - shard-iclb:         [SKIP][61] ([fdo#109276]) -> [PASS][62] +11 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-iclb8/igt@gem_exec_schedule@promotion-bsd1.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3838/shard-iclb1/igt@gem_exec_schedule@promotion-bsd1.html

  * igt@gem_persistent_relocs@forked-faulting-reloc-thrash-inactive:
    - shard-tglb:         [INCOMPLETE][63] ([i915#530]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-tglb8/igt@gem_persistent_relocs@forked-faulting-reloc-thrash-inactive.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3838/shard-tglb6/igt@gem_persistent_relocs@forked-faulting-reloc-thrash-inactive.html

  * igt@gem_persistent_relocs@forked-interruptible-thrashing:
    - shard-snb:          [FAIL][65] ([i915#520]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-snb6/igt@gem_persistent_relocs@forked-interruptible-thrashing.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3838/shard-snb5/igt@gem_persistent_relocs@forked-interruptible-thrashing.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy:
    - shard-snb:          [DMESG-WARN][67] ([fdo#111870]) -> [PASS][68] +1 similar issue
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-snb6/igt@gem_userptr_blits@map-fixed-invalidate-busy.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3838/shard-snb7/igt@gem_userptr_blits@map-fixed-invalidate-busy.html

  * igt@i915_selftest@live_gt_timelines:
    - shard-tglb:         [INCOMPLETE][69] ([i915#455]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-tglb8/igt@i915_selftest@live_gt_timelines.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3838/shard-tglb6/igt@i915_selftest@live_gt_timelines.html

  * igt@i915_suspend@sysfs-reader:
    - shard-kbl:          [INCOMPLETE][71] ([fdo#103665] / [i915#435]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-kbl4/igt@i915_suspend@sysfs-reader.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3838/shard-kbl1/igt@i915_suspend@sysfs-reader.html

  * igt@kms_cursor_crc@pipe-b-cursor-64x21-offscreen:
    - shard-iclb:         [DMESG-WARN][73] ([IGT#6]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-iclb3/igt@kms_cursor_crc@pipe-b-cursor-64x21-offscreen.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3838/shard-iclb7/igt@kms_cursor_crc@pipe-b-cursor-64x21-offscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-apl:          [DMESG-WARN][75] ([i915#180]) -> [PASS][76] +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3838/shard-apl1/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-c-cursor-64x21-random:
    - shard-kbl:          [FAIL][77] ([i915#54]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-kbl6/igt@kms_cursor_crc@pipe-c-cursor-64x21-random.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3838/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-64x21-random.html
    - shard-apl:          [FAIL][79] ([i915#54]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-apl4/igt@kms_cursor_crc@pipe-c-cursor-64x21-random.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3838/shard-apl1/igt@kms_cursor_crc@pipe-c-cursor-64x21-random.html

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - shard-hsw:          [FAIL][81] ([i915#57]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-hsw6/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3838/shard-hsw1/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b:
    - shard-tglb:         [INCOMPLETE][83] ([i915#456] / [i915#460]) -> [PASS][84] +1 similar issue
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-tglb5/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3838/shard-tglb8/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html

  * igt@kms_plane@pixel-format-pipe-a-planes-source-clamping:
    - shard-kbl:          [INCOMPLETE][85] ([fdo#103665]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-kbl7/igt@kms_plane@pixel-format-pipe-a-planes-source-clamping.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3838/shard-kbl7/igt@kms_plane@pixel-format-pipe-a-planes-source-clamping.html

  * igt@perf@disabled-read-error:
    - shard-hsw:          [INCOMPLETE][87] ([i915#61]) -> [PASS][88] +1 similar issue
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-hsw6/igt@perf@disabled-read-error.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3838/shard-hsw6/igt@perf@disabled-read-error.html

  * igt@perf_pmu@init-busy-vcs1:
    - shard-iclb:         [SKIP][89] ([fdo#112080]) -> [PASS][90] +3 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-iclb7/igt@perf_pmu@init-busy-vcs1.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3838/shard-iclb2/igt@perf_pmu@init-busy-vcs1.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv-switch:
    - shard-iclb:         [SKIP][91] ([fdo#109276] / [fdo#112080]) -> [FAIL][92] ([IGT#28])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-iclb5/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3838/shard-iclb1/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html

  * igt@gem_eio@kms:
    - shard-snb:          [DMESG-WARN][93] ([i915#444]) -> [INCOMPLETE][94] ([i915#82])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-snb2/igt@gem_eio@kms.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3838/shard-snb2/igt@gem_eio@kms.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [SKIP][95] ([i915#468]) -> [FAIL][96] ([i915#454])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-tglb6/igt@i915_pm_dc@dc6-psr.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3838/shard-tglb4/igt@i915_pm_dc@dc6-psr.html

  * igt@runner@aborted:
    - shard-snb:          ([FAIL][97], [FAIL][98]) ([fdo#111249] / [i915#436] / [k.org#204565]) -> [FAIL][99] ([fdo#111249] / [k.org#204565])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-snb4/igt@runner@aborted.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7528/shard-snb2/igt@runner@aborted.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3838/shard-snb5/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [IGT#6]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/6
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#108838]: https://bugs.freedesktop.org/show_bug.cgi?id=108838
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111249]: https://bugs.freedesktop.org/show_bug.cgi?id=111249
  [fdo#111735]: https://bugs.freedesktop.org/show_bug.cgi?id=111735
  [fdo#111736]: https://bugs.freedesktop.org/show_bug.cgi?id=111736
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#129]: https://gitlab.freedesktop.org/drm/intel/issues/129
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#232]: https://gitlab.freedesktop.org/drm/intel/issues/232
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#435]: https://gitlab.freedesktop.org/drm/intel/issues/435
  [i915#436]: https://gitlab.freedesktop.org/drm/intel/issues/436
  [i915#444]: https://gitlab.freedesktop.org/drm/intel/issues/444
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#455]: https://gitlab.freedesktop.org/drm/intel/issues/455
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#460]: https://gitlab.freedesktop.org/drm/intel/issues/460
  [i915#461]: https://gitlab.freedesktop.org/drm/intel/issues/461
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
  [i915#474]: https://gitlab.freedesktop.org/drm/intel/issues/474
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#520]: https://gitlab.freedesktop.org/drm/intel/issues/520
  [i915#530]: https://gitlab.freedesktop.org/drm/intel/issues/530
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#57]: https://gitlab.freedesktop.org/drm/intel/issues/57
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#667]: https://gitlab.freedesktop.org/drm/intel/issues/667
  [i915#669]: https://gitlab.freedesktop.org/drm/intel/issues/669
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#747]: https://gitlab.freedesktop.org/drm/intel/issues/747
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [k.org#204565]: https://bugzilla.kernel.org/show_bug.cgi?id=204565


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-hsw-4770r 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5341 -> IGTPW_3838
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7528: 1f2c18c105263727ef41dfc7fd8c72012aafaefb @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3838: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3838/index.html
  IGT_5341: 5fe683cdebde2d77d16ffc42c9fdf29a9f95bb82 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3838/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
