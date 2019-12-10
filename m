Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 10 Dec 2019 14:34:41 -0000
Message-ID: <157598848119.23232.6986288098535751164@emeril.freedesktop.org>
References: <20191209133441.25851-1-stanislav.lisovskiy@intel.com>
In-Reply-To: <20191209133441.25851-1-stanislav.lisovskiy@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaWd0L3Rl?=
 =?utf-8?q?sts=3A_kms=5Fplane=5Fstress=3A_Add_plane_stress_test_=28rev20?=
 =?utf-8?q?=29?=
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

Series: igt/tests: kms_plane_stress: Add plane stress test (rev20)
URL   : https://patchwork.freedesktop.org/series/58524/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7521_full -> IGTPW_3833_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_3833_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_3833_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3833/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_3833_full:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live_gtt:
    - shard-apl:          [PASS][1] -> [TIMEOUT][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-apl6/igt@i915_selftest@live_gtt.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3833/shard-apl3/igt@i915_selftest@live_gtt.html

  * {igt@kms_plane_stress@stress-xrgb8888-untiled} (NEW):
    - shard-hsw:          NOTRUN -> [FAIL][3] +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3833/shard-hsw8/igt@kms_plane_stress@stress-xrgb8888-untiled.html
    - shard-kbl:          NOTRUN -> [FAIL][4] +2 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3833/shard-kbl3/igt@kms_plane_stress@stress-xrgb8888-untiled.html
    - shard-tglb:         NOTRUN -> [FAIL][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3833/shard-tglb6/igt@kms_plane_stress@stress-xrgb8888-untiled.html

  * {igt@kms_plane_stress@stress-xrgb8888-xtiled} (NEW):
    - shard-apl:          NOTRUN -> [FAIL][6] +2 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3833/shard-apl4/igt@kms_plane_stress@stress-xrgb8888-xtiled.html
    - shard-glk:          NOTRUN -> [FAIL][7] +2 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3833/shard-glk2/igt@kms_plane_stress@stress-xrgb8888-xtiled.html

  * {igt@kms_plane_stress@stress-xrgb8888-ytiled} (NEW):
    - shard-snb:          NOTRUN -> [FAIL][8] +2 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3833/shard-snb7/igt@kms_plane_stress@stress-xrgb8888-ytiled.html

  
New tests
---------

  New tests have been introduced between CI_DRM_7521_full and IGTPW_3833_full:

### New IGT tests (3) ###

  * igt@kms_plane_stress@stress-xrgb8888-untiled:
    - Statuses : 6 fail(s) 1 pass(s)
    - Exec time: [0.0, 44.89] s

  * igt@kms_plane_stress@stress-xrgb8888-xtiled:
    - Statuses : 5 fail(s) 1 pass(s)
    - Exec time: [0.0, 10.19] s

  * igt@kms_plane_stress@stress-xrgb8888-ytiled:
    - Statuses : 5 fail(s) 1 pass(s)
    - Exec time: [0.0, 10.20] s

  

Known issues
------------

  Here are the changes found in IGTPW_3833_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_shared@q-smoketest-bsd2:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#109276]) +2 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-iclb2/igt@gem_ctx_shared@q-smoketest-bsd2.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3833/shard-iclb8/igt@gem_ctx_shared@q-smoketest-bsd2.html

  * igt@gem_exec_parallel@basic:
    - shard-tglb:         [PASS][11] -> [INCOMPLETE][12] ([i915#476])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-tglb4/igt@gem_exec_parallel@basic.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3833/shard-tglb6/igt@gem_exec_parallel@basic.html

  * igt@gem_exec_schedule@independent-bsd:
    - shard-iclb:         [PASS][13] -> [SKIP][14] ([fdo#112146]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-iclb3/igt@gem_exec_schedule@independent-bsd.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3833/shard-iclb4/igt@gem_exec_schedule@independent-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd2:
    - shard-tglb:         [PASS][15] -> [INCOMPLETE][16] ([fdo#111606] / [fdo#111677])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-tglb2/igt@gem_exec_schedule@preempt-queue-bsd2.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3833/shard-tglb6/igt@gem_exec_schedule@preempt-queue-bsd2.html

  * igt@gem_persistent_relocs@forked-thrash-inactive:
    - shard-iclb:         [PASS][17] -> [TIMEOUT][18] ([i915#530])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-iclb3/igt@gem_persistent_relocs@forked-thrash-inactive.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3833/shard-iclb8/igt@gem_persistent_relocs@forked-thrash-inactive.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-tglb:         [PASS][19] -> [FAIL][20] ([i915#644])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-tglb5/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3833/shard-tglb1/igt@gem_ppgtt@flink-and-close-vma-leak.html
    - shard-kbl:          [PASS][21] -> [FAIL][22] ([i915#644])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-kbl7/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3833/shard-kbl3/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-snb:          [PASS][23] -> [DMESG-WARN][24] ([fdo#110789] / [fdo#111870])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-snb6/igt@gem_userptr_blits@dmabuf-sync.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3833/shard-snb4/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-apl:          [PASS][25] -> [DMESG-WARN][26] ([i915#180]) +2 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-apl4/igt@gem_workarounds@suspend-resume-context.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3833/shard-apl4/igt@gem_workarounds@suspend-resume-context.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][27] -> [FAIL][28] ([i915#454])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-iclb2/igt@i915_pm_dc@dc6-psr.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3833/shard-iclb2/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [PASS][29] -> [DMESG-WARN][30] ([i915#180]) +5 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3833/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-hsw:          [PASS][31] -> [FAIL][32] ([i915#96])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-hsw7/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3833/shard-hsw5/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-cpu:
    - shard-kbl:          [PASS][33] -> [FAIL][34] ([i915#49])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-cpu.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3833/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-cpu.html
    - shard-apl:          [PASS][35] -> [FAIL][36] ([i915#49])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-apl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-cpu.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3833/shard-apl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-snb:          [PASS][37] -> [SKIP][38] ([fdo#109271]) +2 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-snb5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-cpu.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3833/shard-snb5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-tglb:         [PASS][39] -> [INCOMPLETE][40] ([i915#456] / [i915#460] / [i915#474]) +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-tglb4/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3833/shard-tglb1/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu:
    - shard-iclb:         [PASS][41] -> [INCOMPLETE][42] ([i915#123] / [i915#140])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-iclb3/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3833/shard-iclb7/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-stridechange:
    - shard-tglb:         [PASS][43] -> [FAIL][44] ([i915#49]) +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-tglb9/igt@kms_frontbuffer_tracking@fbcpsr-stridechange.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3833/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-stridechange.html

  * igt@kms_plane@pixel-format-pipe-b-planes:
    - shard-kbl:          [PASS][45] -> [INCOMPLETE][46] ([fdo#103665])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-kbl6/igt@kms_plane@pixel-format-pipe-b-planes.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3833/shard-kbl1/igt@kms_plane@pixel-format-pipe-b-planes.html
    - shard-iclb:         [PASS][47] -> [INCOMPLETE][48] ([i915#140] / [i915#246])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-iclb2/igt@kms_plane@pixel-format-pipe-b-planes.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3833/shard-iclb8/igt@kms_plane@pixel-format-pipe-b-planes.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-tglb:         [PASS][49] -> [INCOMPLETE][50] ([i915#456] / [i915#460]) +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-tglb1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3833/shard-tglb8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [PASS][51] -> [SKIP][52] ([fdo#109441]) +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-iclb2/igt@kms_psr@psr2_no_drrs.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3833/shard-iclb1/igt@kms_psr@psr2_no_drrs.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@vcs1-clean:
    - shard-iclb:         [SKIP][53] ([fdo#109276] / [fdo#112080]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-iclb3/igt@gem_ctx_isolation@vcs1-clean.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3833/shard-iclb1/igt@gem_ctx_isolation@vcs1-clean.html

  * igt@gem_ctx_shared@q-smoketest-bsd1:
    - shard-tglb:         [INCOMPLETE][55] ([fdo#111735]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-tglb9/igt@gem_ctx_shared@q-smoketest-bsd1.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3833/shard-tglb6/igt@gem_ctx_shared@q-smoketest-bsd1.html

  * igt@gem_exec_gttfill@basic:
    - shard-tglb:         [INCOMPLETE][57] ([fdo#111593]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-tglb8/igt@gem_exec_gttfill@basic.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3833/shard-tglb3/igt@gem_exec_gttfill@basic.html

  * igt@gem_exec_parallel@contexts:
    - shard-tglb:         [INCOMPLETE][59] ([i915#470]) -> [PASS][60] +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-tglb6/igt@gem_exec_parallel@contexts.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3833/shard-tglb4/igt@gem_exec_parallel@contexts.html

  * igt@gem_exec_schedule@deep-bsd:
    - shard-iclb:         [SKIP][61] ([fdo#112146]) -> [PASS][62] +2 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-iclb2/igt@gem_exec_schedule@deep-bsd.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3833/shard-iclb8/igt@gem_exec_schedule@deep-bsd.html

  * igt@gem_exec_schedule@smoketest-bsd2:
    - shard-tglb:         [INCOMPLETE][63] ([i915#707]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-tglb6/igt@gem_exec_schedule@smoketest-bsd2.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3833/shard-tglb7/igt@gem_exec_schedule@smoketest-bsd2.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [FAIL][65] ([i915#644]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-glk2/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3833/shard-glk9/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_sync@basic-store-each:
    - shard-tglb:         [INCOMPLETE][67] ([i915#435] / [i915#472]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-tglb6/igt@gem_sync@basic-store-each.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3833/shard-tglb3/igt@gem_sync@basic-store-each.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy:
    - shard-snb:          [DMESG-WARN][69] ([fdo#111870]) -> [PASS][70] +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-snb5/igt@gem_userptr_blits@map-fixed-invalidate-busy.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3833/shard-snb4/igt@gem_userptr_blits@map-fixed-invalidate-busy.html

  * igt@gem_wait@busy-vcs1:
    - shard-iclb:         [SKIP][71] ([fdo#112080]) -> [PASS][72] +4 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-iclb3/igt@gem_wait@busy-vcs1.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3833/shard-iclb2/igt@gem_wait@busy-vcs1.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-kbl:          [DMESG-WARN][73] ([i915#180]) -> [PASS][74] +6 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-kbl2/igt@gem_workarounds@suspend-resume-fd.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3833/shard-kbl3/igt@gem_workarounds@suspend-resume-fd.html

  * igt@i915_selftest@mock_sanitycheck:
    - shard-hsw:          [DMESG-WARN][75] ([i915#747]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-hsw5/igt@i915_selftest@mock_sanitycheck.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3833/shard-hsw7/igt@i915_selftest@mock_sanitycheck.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-tglb:         [INCOMPLETE][77] ([i915#456] / [i915#460]) -> [PASS][78] +2 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-tglb1/igt@i915_suspend@fence-restore-tiled2untiled.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3833/shard-tglb4/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_cursor_crc@pipe-c-cursor-64x21-random:
    - shard-kbl:          [FAIL][79] ([i915#54]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-kbl6/igt@kms_cursor_crc@pipe-c-cursor-64x21-random.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3833/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-64x21-random.html
    - shard-apl:          [FAIL][81] ([i915#54]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-apl4/igt@kms_cursor_crc@pipe-c-cursor-64x21-random.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3833/shard-apl7/igt@kms_cursor_crc@pipe-c-cursor-64x21-random.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [FAIL][83] ([i915#72]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-glk3/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3833/shard-glk4/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-render-untiled:
    - shard-tglb:         [INCOMPLETE][85] ([fdo#112393] / [i915#667]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-tglb7/igt@kms_draw_crc@draw-method-xrgb2101010-render-untiled.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3833/shard-tglb9/igt@kms_draw_crc@draw-method-xrgb2101010-render-untiled.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-apl:          [DMESG-WARN][87] ([i915#180]) -> [PASS][88] +1 similar issue
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3833/shard-apl7/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff:
    - shard-tglb:         [FAIL][89] ([i915#49]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3833/shard-tglb8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_psr@psr2_primary_mmap_gtt:
    - shard-iclb:         [SKIP][91] ([fdo#109441]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-iclb8/igt@kms_psr@psr2_primary_mmap_gtt.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3833/shard-iclb2/igt@kms_psr@psr2_primary_mmap_gtt.html

  * igt@kms_setmode@basic:
    - shard-hsw:          [FAIL][93] ([i915#31]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-hsw2/igt@kms_setmode@basic.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3833/shard-hsw5/igt@kms_setmode@basic.html

  * igt@prime_busy@after-bsd2:
    - shard-iclb:         [SKIP][95] ([fdo#109276]) -> [PASS][96] +5 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-iclb3/igt@prime_busy@after-bsd2.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3833/shard-iclb4/igt@prime_busy@after-bsd2.html

  
#### Warnings ####

  * igt@gem_exec_reloc@basic-spin-bsd:
    - shard-snb:          [FAIL][97] ([i915#611]) -> [FAIL][98] ([i915#757]) +1 similar issue
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-snb5/igt@gem_exec_reloc@basic-spin-bsd.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3833/shard-snb5/igt@gem_exec_reloc@basic-spin-bsd.html

  * igt@kms_content_protection@lic:
    - shard-kbl:          [INCOMPLETE][99] ([fdo#103665]) -> [FAIL][100] ([fdo#110321])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7521/shard-kbl7/igt@kms_content_protection@lic.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3833/shard-kbl4/igt@kms_content_protection@lic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#111593]: https://bugs.freedesktop.org/show_bug.cgi?id=111593
  [fdo#111606]: https://bugs.freedesktop.org/show_bug.cgi?id=111606
  [fdo#111677]: https://bugs.freedesktop.org/show_bug.cgi?id=111677
  [fdo#111735]: https://bugs.freedesktop.org/show_bug.cgi?id=111735
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112393]: https://bugs.freedesktop.org/show_bug.cgi?id=112393
  [i915#123]: https://gitlab.freedesktop.org/drm/intel/issues/123
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#246]: https://gitlab.freedesktop.org/drm/intel/issues/246
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#435]: https://gitlab.freedesktop.org/drm/intel/issues/435
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#460]: https://gitlab.freedesktop.org/drm/intel/issues/460
  [i915#470]: https://gitlab.freedesktop.org/drm/intel/issues/470
  [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
  [i915#474]: https://gitlab.freedesktop.org/drm/intel/issues/474
  [i915#476]: https://gitlab.freedesktop.org/drm/intel/issues/476
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#530]: https://gitlab.freedesktop.org/drm/intel/issues/530
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#611]: https://gitlab.freedesktop.org/drm/intel/issues/611
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#667]: https://gitlab.freedesktop.org/drm/intel/issues/667
  [i915#707]: https://gitlab.freedesktop.org/drm/intel/issues/707
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#747]: https://gitlab.freedesktop.org/drm/intel/issues/747
  [i915#757]: https://gitlab.freedesktop.org/drm/intel/issues/757
  [i915#758]: https://gitlab.freedesktop.org/drm/intel/issues/758
  [i915#96]: https://gitlab.freedesktop.org/drm/intel/issues/96


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-hsw-4770r 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5341 -> IGTPW_3833
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7521: 9203f67985ebf27211aa1eabb77093302248c9fc @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3833: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3833/index.html
  IGT_5341: 5fe683cdebde2d77d16ffc42c9fdf29a9f95bb82 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3833/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
