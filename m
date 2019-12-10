Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 10 Dec 2019 01:49:13 -0000
Message-ID: <157594255378.18784.4076820196243781306@emeril.freedesktop.org>
References: <20191001120429.32600-1-stanislav.lisovskiy@intel.com>
In-Reply-To: <20191001120429.32600-1-stanislav.lisovskiy@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaWd0L3Rl?=
 =?utf-8?q?sts=3A_Increase_chamelium_hotplug_timeout_=28rev3=29?=
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

Series: igt/tests: Increase chamelium hotplug timeout (rev3)
URL   : https://patchwork.freedesktop.org/series/67441/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7521_full -> IGTPW_3834_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_3834_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_3834_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3834/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_3834_full:

### IGT changes ###

#### Possible regressions ####

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-tglb:         NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3834/shard-tglb7/igt@perf@gen8-unprivileged-single-ctx-counters.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled}:
    - shard-iclb:         NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3834/shard-iclb2/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html

  * {igt@perf@gen12-unprivileged-single-ctx-counters}:
    - shard-tglb:         NOTRUN -> [INCOMPLETE][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3834/shard-tglb9/igt@perf@gen12-unprivileged-single-ctx-counters.html

  
Known issues
------------

  Here are the changes found in IGTPW_3834_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@vecs0-s3:
    - shard-tglb:         [PASS][4] -> [INCOMPLETE][5] ([i915#456])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-tglb1/igt@gem_ctx_isolation@vecs0-s3.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3834/shard-tglb8/igt@gem_ctx_isolation@vecs0-s3.html

  * igt@gem_ctx_shared@q-smoketest-bsd:
    - shard-tglb:         [PASS][6] -> [INCOMPLETE][7] ([i915#461])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-tglb8/igt@gem_ctx_shared@q-smoketest-bsd.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3834/shard-tglb6/igt@gem_ctx_shared@q-smoketest-bsd.html

  * igt@gem_eio@reset-stress:
    - shard-snb:          [PASS][8] -> [FAIL][9] ([i915#232])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-snb7/igt@gem_eio@reset-stress.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3834/shard-snb4/igt@gem_eio@reset-stress.html

  * igt@gem_exec_parse_blt@allowed-single:
    - shard-glk:          [PASS][10] -> [DMESG-WARN][11] ([i915#716])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-glk2/igt@gem_exec_parse_blt@allowed-single.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3834/shard-glk8/igt@gem_exec_parse_blt@allowed-single.html

  * igt@gem_exec_reuse@single:
    - shard-tglb:         [PASS][12] -> [INCOMPLETE][13] ([i915#435])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-tglb2/igt@gem_exec_reuse@single.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3834/shard-tglb6/igt@gem_exec_reuse@single.html

  * igt@gem_exec_schedule@independent-bsd:
    - shard-iclb:         [PASS][14] -> [SKIP][15] ([fdo#112146])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-iclb3/igt@gem_exec_schedule@independent-bsd.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3834/shard-iclb2/igt@gem_exec_schedule@independent-bsd.html

  * igt@gem_exec_schedule@promotion-bsd1:
    - shard-iclb:         [PASS][16] -> [SKIP][17] ([fdo#109276]) +3 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-iclb2/igt@gem_exec_schedule@promotion-bsd1.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3834/shard-iclb8/igt@gem_exec_schedule@promotion-bsd1.html

  * igt@gem_exec_schedule@smoketest-bsd1:
    - shard-tglb:         [PASS][18] -> [INCOMPLETE][19] ([i915#463])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-tglb7/igt@gem_exec_schedule@smoketest-bsd1.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3834/shard-tglb3/igt@gem_exec_schedule@smoketest-bsd1.html

  * igt@gem_persistent_relocs@forked-interruptible-thrash-inactive:
    - shard-hsw:          [PASS][20] -> [TIMEOUT][21] ([i915#530])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-hsw6/igt@gem_persistent_relocs@forked-interruptible-thrash-inactive.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3834/shard-hsw4/igt@gem_persistent_relocs@forked-interruptible-thrash-inactive.html

  * igt@gem_persistent_relocs@forked-interruptible-thrashing:
    - shard-hsw:          [PASS][22] -> [FAIL][23] ([i915#520])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-hsw8/igt@gem_persistent_relocs@forked-interruptible-thrashing.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3834/shard-hsw6/igt@gem_persistent_relocs@forked-interruptible-thrashing.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-snb:          [PASS][24] -> [DMESG-WARN][25] ([fdo#111870])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-snb6/igt@gem_userptr_blits@dmabuf-sync.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3834/shard-snb5/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@i915_suspend@sysfs-reader:
    - shard-tglb:         [PASS][26] -> [INCOMPLETE][27] ([i915#456] / [i915#460])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-tglb2/igt@i915_suspend@sysfs-reader.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3834/shard-tglb5/igt@i915_suspend@sysfs-reader.html

  * igt@kms_color@pipe-c-ctm-max:
    - shard-kbl:          [PASS][28] -> [FAIL][29] ([i915#168])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-kbl3/igt@kms_color@pipe-c-ctm-max.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3834/shard-kbl3/igt@kms_color@pipe-c-ctm-max.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [PASS][30] -> [DMESG-WARN][31] ([i915#180]) +2 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3834/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-hsw:          [PASS][32] -> [INCOMPLETE][33] ([i915#61])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-hsw4/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3834/shard-hsw7/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite:
    - shard-tglb:         [PASS][34] -> [FAIL][35] ([i915#49]) +1 similar issue
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3834/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-tglb:         [PASS][36] -> [INCOMPLETE][37] ([i915#456] / [i915#460] / [i915#474])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-tglb4/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3834/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_plane@pixel-format-pipe-b-planes:
    - shard-kbl:          [PASS][38] -> [INCOMPLETE][39] ([fdo#103665]) +1 similar issue
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-kbl6/igt@kms_plane@pixel-format-pipe-b-planes.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3834/shard-kbl6/igt@kms_plane@pixel-format-pipe-b-planes.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [PASS][40] -> [SKIP][41] ([fdo#109642] / [fdo#111068])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-iclb2/igt@kms_psr2_su@page_flip.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3834/shard-iclb8/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [PASS][42] -> [SKIP][43] ([fdo#109441]) +1 similar issue
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3834/shard-iclb5/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@perf_pmu@busy-no-semaphores-vcs1:
    - shard-iclb:         [PASS][44] -> [SKIP][45] ([fdo#112080]) +2 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-iclb2/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3834/shard-iclb6/igt@perf_pmu@busy-no-semaphores-vcs1.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@vcs1-mixed-process:
    - shard-iclb:         [SKIP][46] ([fdo#109276] / [fdo#112080]) -> [PASS][47]
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-iclb3/igt@gem_ctx_persistence@vcs1-mixed-process.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3834/shard-iclb2/igt@gem_ctx_persistence@vcs1-mixed-process.html

  * igt@gem_exec_gttfill@basic:
    - shard-tglb:         [INCOMPLETE][48] ([fdo#111593]) -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-tglb8/igt@gem_exec_gttfill@basic.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3834/shard-tglb9/igt@gem_exec_gttfill@basic.html

  * igt@gem_exec_parallel@contexts:
    - shard-tglb:         [INCOMPLETE][50] ([i915#470]) -> [PASS][51] +1 similar issue
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-tglb6/igt@gem_exec_parallel@contexts.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3834/shard-tglb4/igt@gem_exec_parallel@contexts.html

  * {igt@gem_exec_schedule@pi-shared-iova-bsd1}:
    - shard-iclb:         [SKIP][52] ([fdo#109276]) -> [PASS][53] +3 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-iclb3/igt@gem_exec_schedule@pi-shared-iova-bsd1.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3834/shard-iclb2/igt@gem_exec_schedule@pi-shared-iova-bsd1.html

  * igt@gem_exec_schedule@preempt-queue-contexts-bsd:
    - shard-iclb:         [SKIP][54] ([fdo#112146]) -> [PASS][55] +1 similar issue
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-iclb2/igt@gem_exec_schedule@preempt-queue-contexts-bsd.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3834/shard-iclb8/igt@gem_exec_schedule@preempt-queue-contexts-bsd.html

  * igt@gem_exec_schedule@smoketest-bsd2:
    - shard-tglb:         [INCOMPLETE][56] ([i915#707]) -> [PASS][57] +1 similar issue
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-tglb6/igt@gem_exec_schedule@smoketest-bsd2.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3834/shard-tglb4/igt@gem_exec_schedule@smoketest-bsd2.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [FAIL][58] ([i915#644]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-glk2/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3834/shard-glk6/igt@gem_ppgtt@flink-and-close-vma-leak.html
    - shard-apl:          [FAIL][60] ([i915#644]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-apl2/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3834/shard-apl1/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_sync@basic-store-each:
    - shard-tglb:         [INCOMPLETE][62] ([i915#435] / [i915#472]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-tglb6/igt@gem_sync@basic-store-each.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3834/shard-tglb4/igt@gem_sync@basic-store-each.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy:
    - shard-snb:          [DMESG-WARN][64] ([fdo#111870]) -> [PASS][65] +1 similar issue
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-snb5/igt@gem_userptr_blits@map-fixed-invalidate-busy.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3834/shard-snb1/igt@gem_userptr_blits@map-fixed-invalidate-busy.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-kbl:          [DMESG-WARN][66] ([i915#180]) -> [PASS][67] +4 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-kbl2/igt@gem_workarounds@suspend-resume-fd.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3834/shard-kbl3/igt@gem_workarounds@suspend-resume-fd.html

  * igt@i915_selftest@mock_sanitycheck:
    - shard-kbl:          [DMESG-WARN][68] ([i915#747]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-kbl1/igt@i915_selftest@mock_sanitycheck.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3834/shard-kbl1/igt@i915_selftest@mock_sanitycheck.html
    - shard-snb:          [DMESG-WARN][70] ([i915#747]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-snb1/igt@i915_selftest@mock_sanitycheck.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3834/shard-snb7/igt@i915_selftest@mock_sanitycheck.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-tglb:         [INCOMPLETE][72] ([i915#456] / [i915#460]) -> [PASS][73] +1 similar issue
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-tglb1/igt@i915_suspend@fence-restore-tiled2untiled.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3834/shard-tglb6/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_cursor_crc@pipe-c-cursor-64x21-random:
    - shard-kbl:          [FAIL][74] ([i915#54]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-kbl6/igt@kms_cursor_crc@pipe-c-cursor-64x21-random.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3834/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-64x21-random.html
    - shard-apl:          [FAIL][76] ([i915#54]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-apl4/igt@kms_cursor_crc@pipe-c-cursor-64x21-random.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3834/shard-apl8/igt@kms_cursor_crc@pipe-c-cursor-64x21-random.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-apl:          [DMESG-WARN][78] ([i915#180]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3834/shard-apl4/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [FAIL][80] ([i915#72]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-glk3/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3834/shard-glk4/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff:
    - shard-tglb:         [FAIL][82] ([i915#49]) -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3834/shard-tglb4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_plane@pixel-format-pipe-a-planes-source-clamping:
    - shard-kbl:          [INCOMPLETE][84] ([fdo#103665]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-kbl4/igt@kms_plane@pixel-format-pipe-a-planes-source-clamping.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3834/shard-kbl2/igt@kms_plane@pixel-format-pipe-a-planes-source-clamping.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [FAIL][86] ([i915#31]) -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-kbl1/igt@kms_setmode@basic.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3834/shard-kbl6/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-d-ts-continuation-suspend:
    - shard-tglb:         [INCOMPLETE][88] ([i915#460]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-tglb1/igt@kms_vblank@pipe-d-ts-continuation-suspend.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3834/shard-tglb4/igt@kms_vblank@pipe-d-ts-continuation-suspend.html

  * igt@perf_pmu@most-busy-idle-check-all-vcs1:
    - shard-iclb:         [SKIP][90] ([fdo#112080]) -> [PASS][91] +1 similar issue
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-iclb6/igt@perf_pmu@most-busy-idle-check-all-vcs1.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3834/shard-iclb2/igt@perf_pmu@most-busy-idle-check-all-vcs1.html

  
#### Warnings ####

  * igt@kms_atomic_transition@6x-modeset-transitions-nonblocking-fencing:
    - shard-tglb:         [SKIP][92] ([fdo#112016] / [fdo#112021]) -> [SKIP][93] ([fdo#112021])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-tglb5/igt@kms_atomic_transition@6x-modeset-transitions-nonblocking-fencing.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3834/shard-tglb9/igt@kms_atomic_transition@6x-modeset-transitions-nonblocking-fencing.html

  * igt@kms_content_protection@lic:
    - shard-kbl:          [INCOMPLETE][94] ([fdo#103665]) -> [FAIL][95] ([fdo#110321])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-kbl7/igt@kms_content_protection@lic.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3834/shard-kbl1/igt@kms_content_protection@lic.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-tglb:         [DMESG-WARN][96] ([i915#402]) -> [INCOMPLETE][97] ([fdo#112036] / [i915#402])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-tglb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3834/shard-tglb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111593]: https://bugs.freedesktop.org/show_bug.cgi?id=111593
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112016]: https://bugs.freedesktop.org/show_bug.cgi?id=112016
  [fdo#112021]: https://bugs.freedesktop.org/show_bug.cgi?id=112021
  [fdo#112036]: https://bugs.freedesktop.org/show_bug.cgi?id=112036
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#168]: https://gitlab.freedesktop.org/drm/intel/issues/168
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#232]: https://gitlab.freedesktop.org/drm/intel/issues/232
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#435]: https://gitlab.freedesktop.org/drm/intel/issues/435
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#460]: https://gitlab.freedesktop.org/drm/intel/issues/460
  [i915#461]: https://gitlab.freedesktop.org/drm/intel/issues/461
  [i915#463]: https://gitlab.freedesktop.org/drm/intel/issues/463
  [i915#470]: https://gitlab.freedesktop.org/drm/intel/issues/470
  [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
  [i915#474]: https://gitlab.freedesktop.org/drm/intel/issues/474
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#520]: https://gitlab.freedesktop.org/drm/intel/issues/520
  [i915#530]: https://gitlab.freedesktop.org/drm/intel/issues/530
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#707]: https://gitlab.freedesktop.org/drm/intel/issues/707
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#747]: https://gitlab.freedesktop.org/drm/intel/issues/747


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-hsw-4770r 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5341 -> IGTPW_3834
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7521: 9203f67985ebf27211aa1eabb77093302248c9fc @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3834: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3834/index.html
  IGT_5341: 5fe683cdebde2d77d16ffc42c9fdf29a9f95bb82 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3834/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
