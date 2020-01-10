Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 10 Jan 2020 05:44:37 -0000
Message-ID: <157863507792.30837.18313951494212919104@emeril.freedesktop.org>
References: <20200109140125.18483-1-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20200109140125.18483-1-janusz.krzysztofik@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?prime=5Fvgem=3A_Examine_blitter_access_path?=
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

Series: tests/prime_vgem: Examine blitter access path
URL   : https://patchwork.freedesktop.org/series/71823/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7707_full -> IGTPW_3910_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3910/index.html

New tests
---------

  New tests have been introduced between CI_DRM_7707_full and IGTPW_3910_full:

### New IGT tests (3) ###

  * igt@prime_vgem@basic-blt:
    - Statuses : 6 pass(s)
    - Exec time: [0.02, 0.05] s

  * igt@prime_vgem@basic-fence-blt:
    - Statuses : 6 pass(s)
    - Exec time: [0.02, 0.06] s

  * igt@prime_vgem@coherency-blt:
    - Statuses : 6 pass(s)
    - Exec time: [0.37, 1.89] s

  

Known issues
------------

  Here are the changes found in IGTPW_3910_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@vcs0-mixed-process:
    - shard-apl:          [PASS][1] -> [FAIL][2] ([i915#679])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7707/shard-apl7/igt@gem_ctx_persistence@vcs0-mixed-process.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3910/shard-apl6/igt@gem_ctx_persistence@vcs0-mixed-process.html

  * igt@gem_ctx_persistence@vcs1-mixed-process:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#109276] / [fdo#112080]) +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7707/shard-iclb2/igt@gem_ctx_persistence@vcs1-mixed-process.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3910/shard-iclb7/igt@gem_ctx_persistence@vcs1-mixed-process.html

  * igt@gem_exec_await@wide-contexts:
    - shard-tglb:         [PASS][5] -> [INCOMPLETE][6] ([fdo#111736] / [i915#472])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7707/shard-tglb8/igt@gem_exec_await@wide-contexts.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3910/shard-tglb3/igt@gem_exec_await@wide-contexts.html

  * igt@gem_exec_nop@basic-parallel:
    - shard-tglb:         [PASS][7] -> [INCOMPLETE][8] ([CI#80] / [i915#472])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7707/shard-tglb5/igt@gem_exec_nop@basic-parallel.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3910/shard-tglb6/igt@gem_exec_nop@basic-parallel.html

  * igt@gem_exec_parallel@contexts:
    - shard-tglb:         [PASS][9] -> [INCOMPLETE][10] ([i915#470] / [i915#472])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7707/shard-tglb5/igt@gem_exec_parallel@contexts.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3910/shard-tglb6/igt@gem_exec_parallel@contexts.html

  * igt@gem_exec_schedule@pi-shared-iova-bsd:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([i915#677]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7707/shard-iclb8/igt@gem_exec_schedule@pi-shared-iova-bsd.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3910/shard-iclb1/igt@gem_exec_schedule@pi-shared-iova-bsd.html

  * igt@gem_exec_schedule@preempt-contexts-bsd2:
    - shard-iclb:         [PASS][13] -> [SKIP][14] ([fdo#109276]) +17 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7707/shard-iclb4/igt@gem_exec_schedule@preempt-contexts-bsd2.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3910/shard-iclb6/igt@gem_exec_schedule@preempt-contexts-bsd2.html

  * igt@gem_exec_schedule@preempt-queue-chain-bsd2:
    - shard-tglb:         [PASS][15] -> [INCOMPLETE][16] ([fdo#111677] / [i915#472])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7707/shard-tglb5/igt@gem_exec_schedule@preempt-queue-chain-bsd2.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3910/shard-tglb8/igt@gem_exec_schedule@preempt-queue-chain-bsd2.html

  * igt@gem_exec_schedule@smoketest-all:
    - shard-tglb:         [PASS][17] -> [INCOMPLETE][18] ([i915#463] / [i915#472])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7707/shard-tglb7/igt@gem_exec_schedule@smoketest-all.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3910/shard-tglb2/igt@gem_exec_schedule@smoketest-all.html

  * igt@gem_exec_schedule@wide-bsd:
    - shard-iclb:         [PASS][19] -> [SKIP][20] ([fdo#112146]) +3 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7707/shard-iclb5/igt@gem_exec_schedule@wide-bsd.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3910/shard-iclb2/igt@gem_exec_schedule@wide-bsd.html

  * igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing:
    - shard-snb:          [PASS][21] -> [TIMEOUT][22] ([i915#530])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7707/shard-snb5/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3910/shard-snb6/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html

  * igt@gem_pipe_control_store_loop@reused-buffer:
    - shard-tglb:         [PASS][23] -> [INCOMPLETE][24] ([i915#707] / [i915#796])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7707/shard-tglb7/igt@gem_pipe_control_store_loop@reused-buffer.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3910/shard-tglb3/igt@gem_pipe_control_store_loop@reused-buffer.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-apl:          [PASS][25] -> [FAIL][26] ([i915#644])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7707/shard-apl2/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3910/shard-apl4/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_softpin@noreloc-s3:
    - shard-apl:          [PASS][27] -> [DMESG-WARN][28] ([i915#180]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7707/shard-apl1/igt@gem_softpin@noreloc-s3.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3910/shard-apl4/igt@gem_softpin@noreloc-s3.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][29] -> [FAIL][30] ([i915#454])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7707/shard-iclb2/igt@i915_pm_dc@dc6-psr.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3910/shard-iclb8/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@fences-dpms:
    - shard-iclb:         [PASS][31] -> [INCOMPLETE][32] ([i915#140] / [i915#189])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7707/shard-iclb8/igt@i915_pm_rpm@fences-dpms.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3910/shard-iclb2/igt@i915_pm_rpm@fences-dpms.html

  * igt@i915_pm_rps@reset:
    - shard-iclb:         [PASS][33] -> [FAIL][34] ([i915#413]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7707/shard-iclb7/igt@i915_pm_rps@reset.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3910/shard-iclb2/igt@i915_pm_rps@reset.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [PASS][35] -> [DMESG-WARN][36] ([i915#180]) +3 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7707/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3910/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-hsw:          [PASS][37] -> [DMESG-WARN][38] ([i915#44])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7707/shard-hsw7/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3910/shard-hsw5/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr@psr2_cursor_mmap_gtt:
    - shard-iclb:         [PASS][39] -> [SKIP][40] ([fdo#109441])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7707/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_gtt.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3910/shard-iclb1/igt@kms_psr@psr2_cursor_mmap_gtt.html

  * igt@kms_setmode@basic:
    - shard-tglb:         [PASS][41] -> [FAIL][42] ([i915#31])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7707/shard-tglb8/igt@kms_setmode@basic.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3910/shard-tglb5/igt@kms_setmode@basic.html
    - shard-glk:          [PASS][43] -> [FAIL][44] ([i915#31])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7707/shard-glk2/igt@kms_setmode@basic.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3910/shard-glk4/igt@kms_setmode@basic.html

  * igt@perf_pmu@busy-no-semaphores-vcs1:
    - shard-iclb:         [PASS][45] -> [SKIP][46] ([fdo#112080]) +8 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7707/shard-iclb2/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3910/shard-iclb5/igt@perf_pmu@busy-no-semaphores-vcs1.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-kbl:          [DMESG-WARN][47] ([i915#180]) -> [PASS][48] +3 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7707/shard-kbl7/igt@gem_ctx_isolation@rcs0-s3.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3910/shard-kbl2/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_ctx_isolation@vecs0-s3:
    - shard-kbl:          [INCOMPLETE][49] ([fdo#103665]) -> [PASS][50] +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7707/shard-kbl3/igt@gem_ctx_isolation@vecs0-s3.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3910/shard-kbl6/igt@gem_ctx_isolation@vecs0-s3.html

  * igt@gem_ctx_persistence@vcs1-queued:
    - shard-iclb:         [SKIP][51] ([fdo#109276] / [fdo#112080]) -> [PASS][52] +2 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7707/shard-iclb6/igt@gem_ctx_persistence@vcs1-queued.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3910/shard-iclb1/igt@gem_ctx_persistence@vcs1-queued.html

  * igt@gem_ctx_shared@q-smoketest-bsd:
    - shard-tglb:         [INCOMPLETE][53] ([i915#461]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7707/shard-tglb3/igt@gem_ctx_shared@q-smoketest-bsd.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3910/shard-tglb7/igt@gem_ctx_shared@q-smoketest-bsd.html

  * igt@gem_ctx_shared@q-smoketest-vebox:
    - shard-tglb:         [INCOMPLETE][55] ([fdo#111735]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7707/shard-tglb3/igt@gem_ctx_shared@q-smoketest-vebox.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3910/shard-tglb2/igt@gem_ctx_shared@q-smoketest-vebox.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [SKIP][57] ([i915#677]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7707/shard-iclb1/igt@gem_exec_schedule@pi-common-bsd.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3910/shard-iclb8/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd1:
    - shard-iclb:         [SKIP][59] ([fdo#109276]) -> [PASS][60] +16 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7707/shard-iclb6/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3910/shard-iclb1/igt@gem_exec_schedule@preempt-queue-bsd1.html

  * igt@gem_exec_schedule@preempt-queue-contexts-chain-blt:
    - shard-tglb:         [INCOMPLETE][61] ([fdo#111606] / [fdo#111677] / [i915#472]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7707/shard-tglb8/igt@gem_exec_schedule@preempt-queue-contexts-chain-blt.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3910/shard-tglb3/igt@gem_exec_schedule@preempt-queue-contexts-chain-blt.html

  * igt@gem_exec_schedule@preempt-queue-contexts-chain-bsd:
    - shard-iclb:         [SKIP][63] ([fdo#112146]) -> [PASS][64] +7 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7707/shard-iclb2/igt@gem_exec_schedule@preempt-queue-contexts-chain-bsd.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3910/shard-iclb6/igt@gem_exec_schedule@preempt-queue-contexts-chain-bsd.html

  * igt@gem_exec_schedule@preempt-queue-contexts-chain-render:
    - shard-tglb:         [INCOMPLETE][65] ([fdo#111677] / [i915#472]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7707/shard-tglb8/igt@gem_exec_schedule@preempt-queue-contexts-chain-render.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3910/shard-tglb2/igt@gem_exec_schedule@preempt-queue-contexts-chain-render.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [FAIL][67] ([i915#644]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7707/shard-glk2/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3910/shard-glk5/igt@gem_ppgtt@flink-and-close-vma-leak.html
    - shard-kbl:          [FAIL][69] ([i915#644]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7707/shard-kbl1/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3910/shard-kbl7/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@i915_selftest@live_requests:
    - shard-tglb:         [INCOMPLETE][71] ([i915#472]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7707/shard-tglb2/igt@i915_selftest@live_requests.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3910/shard-tglb1/igt@i915_selftest@live_requests.html

  * igt@i915_suspend@debugfs-reader:
    - shard-apl:          [DMESG-WARN][73] ([i915#180]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7707/shard-apl6/igt@i915_suspend@debugfs-reader.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3910/shard-apl6/igt@i915_suspend@debugfs-reader.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
    - shard-snb:          [SKIP][75] ([fdo#109271]) -> [PASS][76] +3 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7707/shard-snb6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3910/shard-snb4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [SKIP][77] ([fdo#109642] / [fdo#111068]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7707/shard-iclb8/igt@kms_psr2_su@frontbuffer.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3910/shard-iclb2/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [SKIP][79] ([fdo#109441]) -> [PASS][80] +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7707/shard-iclb6/igt@kms_psr@psr2_primary_page_flip.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3910/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html

  * igt@perf_pmu@busy-check-all-vcs1:
    - shard-iclb:         [SKIP][81] ([fdo#112080]) -> [PASS][82] +9 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7707/shard-iclb5/igt@perf_pmu@busy-check-all-vcs1.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3910/shard-iclb4/igt@perf_pmu@busy-check-all-vcs1.html

  * igt@perf_pmu@enable-race-vcs0:
    - shard-tglb:         [INCOMPLETE][83] ([i915#472] / [i915#480]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7707/shard-tglb1/igt@perf_pmu@enable-race-vcs0.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3910/shard-tglb7/igt@perf_pmu@enable-race-vcs0.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [SKIP][85] ([fdo#109276] / [fdo#112080]) -> [FAIL][86] ([IGT#28])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7707/shard-iclb3/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3910/shard-iclb2/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@gem_tiled_blits@normal:
    - shard-hsw:          [FAIL][87] ([i915#694]) -> [FAIL][88] ([i915#818])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7707/shard-hsw5/igt@gem_tiled_blits@normal.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3910/shard-hsw5/igt@gem_tiled_blits@normal.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [SKIP][89] ([i915#468]) -> [FAIL][90] ([i915#454])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7707/shard-tglb6/igt@i915_pm_dc@dc6-dpms.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3910/shard-tglb5/igt@i915_pm_dc@dc6-dpms.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [DMESG-WARN][91] ([fdo#107724]) -> [SKIP][92] ([fdo#109349])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7707/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3910/shard-iclb5/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  
  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#107724]: https://bugs.freedesktop.org/show_bug.cgi?id=107724
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111606]: https://bugs.freedesktop.org/show_bug.cgi?id=111606
  [fdo#111677]: https://bugs.freedesktop.org/show_bug.cgi?id=111677
  [fdo#111735]: https://bugs.freedesktop.org/show_bug.cgi?id=111735
  [fdo#111736]: https://bugs.freedesktop.org/show_bug.cgi?id=111736
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#189]: https://gitlab.freedesktop.org/drm/intel/issues/189
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#44]: https://gitlab.freedesktop.org/drm/intel/issues/44
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#461]: https://gitlab.freedesktop.org/drm/intel/issues/461
  [i915#463]: https://gitlab.freedesktop.org/drm/intel/issues/463
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#470]: https://gitlab.freedesktop.org/drm/intel/issues/470
  [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
  [i915#480]: https://gitlab.freedesktop.org/drm/intel/issues/480
  [i915#530]: https://gitlab.freedesktop.org/drm/intel/issues/530
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#679]: https://gitlab.freedesktop.org/drm/intel/issues/679
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#707]: https://gitlab.freedesktop.org/drm/intel/issues/707
  [i915#796]: https://gitlab.freedesktop.org/drm/intel/issues/796
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-hsw-4770r 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5358 -> IGTPW_3910
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7707: da71b641781b27a1511274d2c7ca40f879cc66ee @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3910: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3910/index.html
  IGT_5358: c6fc013f414b806175dc4143c58ab445e5235ea5 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3910/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
