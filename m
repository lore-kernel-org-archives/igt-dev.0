Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sat, 18 Jan 2020 02:21:55 -0000
Message-ID: <157931411581.11509.7344911957855671220@emeril.freedesktop.org>
References: <20200115143813.28958-1-mika.kahola@intel.com>
In-Reply-To: <20200115143813.28958-1-mika.kahola@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgQ0NTIENs?=
 =?utf-8?q?ear_Color_plane_content_check?=
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
To: "Kahola, Mika" <mika.kahola@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: CCS Clear Color plane content check
URL   : https://patchwork.freedesktop.org/series/72076/
State : success

== Summary ==

CI Bug Log - changes from IGT_5367_full -> IGTPW_3925_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3925/index.html

Known issues
------------

  Here are the changes found in IGTPW_3925_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@vcs1-dirty-create:
    - shard-iclb:         [PASS][1] -> [SKIP][2] ([fdo#109276] / [fdo#112080]) +3 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5367/shard-iclb2/igt@gem_ctx_isolation@vcs1-dirty-create.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3925/shard-iclb8/igt@gem_ctx_isolation@vcs1-dirty-create.html

  * igt@gem_ctx_shared@q-smoketest-bsd1:
    - shard-tglb:         [PASS][3] -> [INCOMPLETE][4] ([fdo#111735] / [i915#472])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5367/shard-tglb5/igt@gem_ctx_shared@q-smoketest-bsd1.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3925/shard-tglb6/igt@gem_ctx_shared@q-smoketest-bsd1.html

  * igt@gem_eio@reset-stress:
    - shard-snb:          [PASS][5] -> [FAIL][6] ([i915#232])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5367/shard-snb5/igt@gem_eio@reset-stress.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3925/shard-snb1/igt@gem_eio@reset-stress.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#110854])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5367/shard-iclb4/igt@gem_exec_balancer@smoke.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3925/shard-iclb5/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_schedule@fifo-bsd1:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#109276]) +16 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5367/shard-iclb1/igt@gem_exec_schedule@fifo-bsd1.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3925/shard-iclb6/igt@gem_exec_schedule@fifo-bsd1.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([i915#677]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5367/shard-iclb6/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3925/shard-iclb4/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@preempt-other-bsd1:
    - shard-tglb:         [PASS][13] -> [INCOMPLETE][14] ([i915#472])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5367/shard-tglb5/igt@gem_exec_schedule@preempt-other-bsd1.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3925/shard-tglb6/igt@gem_exec_schedule@preempt-other-bsd1.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [PASS][15] -> [SKIP][16] ([fdo#112146]) +8 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5367/shard-iclb5/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3925/shard-iclb4/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_exec_schedule@smoketest-all:
    - shard-tglb:         [PASS][17] -> [INCOMPLETE][18] ([i915#463] / [i915#472])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5367/shard-tglb5/igt@gem_exec_schedule@smoketest-all.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3925/shard-tglb4/igt@gem_exec_schedule@smoketest-all.html

  * igt@gem_mmap_gtt@basic-small-copy:
    - shard-snb:          [PASS][19] -> [DMESG-WARN][20] ([i915#478])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5367/shard-snb6/igt@gem_mmap_gtt@basic-small-copy.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3925/shard-snb6/igt@gem_mmap_gtt@basic-small-copy.html

  * igt@gem_persistent_relocs@forked-faulting-reloc-thrashing:
    - shard-hsw:          [PASS][21] -> [INCOMPLETE][22] ([i915#530] / [i915#61])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5367/shard-hsw2/igt@gem_persistent_relocs@forked-faulting-reloc-thrashing.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3925/shard-hsw5/igt@gem_persistent_relocs@forked-faulting-reloc-thrashing.html

  * igt@gem_persistent_relocs@forked-interruptible-thrashing:
    - shard-snb:          [PASS][23] -> [TIMEOUT][24] ([fdo#112271] / [i915#530])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5367/shard-snb1/igt@gem_persistent_relocs@forked-interruptible-thrashing.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3925/shard-snb2/igt@gem_persistent_relocs@forked-interruptible-thrashing.html
    - shard-iclb:         [PASS][25] -> [FAIL][26] ([i915#520])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5367/shard-iclb2/igt@gem_persistent_relocs@forked-interruptible-thrashing.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3925/shard-iclb1/igt@gem_persistent_relocs@forked-interruptible-thrashing.html
    - shard-kbl:          [PASS][27] -> [TIMEOUT][28] ([fdo#112271] / [i915#530])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5367/shard-kbl4/igt@gem_persistent_relocs@forked-interruptible-thrashing.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3925/shard-kbl2/igt@gem_persistent_relocs@forked-interruptible-thrashing.html

  * igt@gem_persistent_relocs@forked-thrashing:
    - shard-snb:          [PASS][29] -> [FAIL][30] ([i915#520])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5367/shard-snb7/igt@gem_persistent_relocs@forked-thrashing.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3925/shard-snb6/igt@gem_persistent_relocs@forked-thrashing.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup:
    - shard-snb:          [PASS][31] -> [DMESG-WARN][32] ([fdo#111870] / [i915#478])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5367/shard-snb4/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3925/shard-snb1/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup.html

  * igt@kms_cursor_crc@pipe-c-cursor-64x64-sliding:
    - shard-apl:          [PASS][33] -> [FAIL][34] ([i915#54])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5367/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-64x64-sliding.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3925/shard-apl1/igt@kms_cursor_crc@pipe-c-cursor-64x64-sliding.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [PASS][35] -> [DMESG-WARN][36] ([i915#180]) +8 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5367/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3925/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt:
    - shard-tglb:         [PASS][37] -> [FAIL][38] ([i915#49]) +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5367/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3925/shard-tglb8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_psr@psr2_sprite_blt:
    - shard-iclb:         [PASS][39] -> [SKIP][40] ([fdo#109441]) +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5367/shard-iclb2/igt@kms_psr@psr2_sprite_blt.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3925/shard-iclb1/igt@kms_psr@psr2_sprite_blt.html

  * igt@kms_vblank@pipe-b-ts-continuation-suspend:
    - shard-kbl:          [PASS][41] -> [INCOMPLETE][42] ([fdo#103665])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5367/shard-kbl3/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3925/shard-kbl1/igt@kms_vblank@pipe-b-ts-continuation-suspend.html

  * igt@perf_pmu@busy-check-all-vcs1:
    - shard-iclb:         [PASS][43] -> [SKIP][44] ([fdo#112080]) +7 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5367/shard-iclb4/igt@perf_pmu@busy-check-all-vcs1.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3925/shard-iclb6/igt@perf_pmu@busy-check-all-vcs1.html

  
#### Possible fixes ####

  * igt@gem_ctx_create@basic-files:
    - shard-tglb:         [INCOMPLETE][45] ([fdo#111735] / [i915#472]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5367/shard-tglb6/igt@gem_ctx_create@basic-files.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3925/shard-tglb3/igt@gem_ctx_create@basic-files.html

  * igt@gem_ctx_isolation@vcs1-clean:
    - shard-iclb:         [SKIP][47] ([fdo#109276] / [fdo#112080]) -> [PASS][48] +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5367/shard-iclb6/igt@gem_ctx_isolation@vcs1-clean.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3925/shard-iclb1/igt@gem_ctx_isolation@vcs1-clean.html

  * igt@gem_ctx_persistence@bcs0-mixed-process:
    - shard-glk:          [FAIL][49] ([i915#679]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5367/shard-glk3/igt@gem_ctx_persistence@bcs0-mixed-process.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3925/shard-glk9/igt@gem_ctx_persistence@bcs0-mixed-process.html

  * igt@gem_exec_parallel@fds:
    - shard-tglb:         [INCOMPLETE][51] ([i915#470] / [i915#472]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5367/shard-tglb3/igt@gem_exec_parallel@fds.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3925/shard-tglb6/igt@gem_exec_parallel@fds.html

  * igt@gem_exec_schedule@independent-bsd2:
    - shard-iclb:         [SKIP][53] ([fdo#109276]) -> [PASS][54] +20 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5367/shard-iclb8/igt@gem_exec_schedule@independent-bsd2.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3925/shard-iclb1/igt@gem_exec_schedule@independent-bsd2.html

  * igt@gem_exec_schedule@pi-shared-iova-bsd:
    - shard-iclb:         [SKIP][55] ([i915#677]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5367/shard-iclb4/igt@gem_exec_schedule@pi-shared-iova-bsd.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3925/shard-iclb8/igt@gem_exec_schedule@pi-shared-iova-bsd.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [SKIP][57] ([fdo#112146]) -> [PASS][58] +3 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5367/shard-iclb4/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3925/shard-iclb6/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_exec_schedule@preempt-queue-chain-vebox:
    - shard-tglb:         [INCOMPLETE][59] ([fdo#111677] / [i915#472]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5367/shard-tglb6/igt@gem_exec_schedule@preempt-queue-chain-vebox.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3925/shard-tglb1/igt@gem_exec_schedule@preempt-queue-chain-vebox.html

  * igt@gem_exec_schedule@preempt-queue-contexts-blt:
    - shard-tglb:         [INCOMPLETE][61] ([fdo#111606] / [fdo#111677] / [i915#472]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5367/shard-tglb6/igt@gem_exec_schedule@preempt-queue-contexts-blt.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3925/shard-tglb7/igt@gem_exec_schedule@preempt-queue-contexts-blt.html

  * igt@gem_exec_schedule@wide-vebox:
    - shard-tglb:         [INCOMPLETE][63] ([fdo#111736] / [i915#472]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5367/shard-tglb2/igt@gem_exec_schedule@wide-vebox.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3925/shard-tglb1/igt@gem_exec_schedule@wide-vebox.html

  * igt@gem_exec_suspend@basic-s0:
    - shard-tglb:         [INCOMPLETE][65] ([i915#472]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5367/shard-tglb4/igt@gem_exec_suspend@basic-s0.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3925/shard-tglb8/igt@gem_exec_suspend@basic-s0.html

  * igt@gem_fence_thrash@bo-copy:
    - shard-snb:          [DMESG-WARN][67] ([i915#478]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5367/shard-snb7/igt@gem_fence_thrash@bo-copy.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3925/shard-snb2/igt@gem_fence_thrash@bo-copy.html

  * igt@gem_persistent_relocs@forked-faulting-reloc-thrash-inactive:
    - shard-glk:          [TIMEOUT][69] ([fdo#112271] / [i915#530]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5367/shard-glk4/igt@gem_persistent_relocs@forked-faulting-reloc-thrash-inactive.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3925/shard-glk3/igt@gem_persistent_relocs@forked-faulting-reloc-thrash-inactive.html

  * igt@gem_persistent_relocs@forked-thrash-inactive:
    - shard-apl:          [TIMEOUT][71] ([fdo#112271] / [i915#530]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5367/shard-apl2/igt@gem_persistent_relocs@forked-thrash-inactive.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3925/shard-apl2/igt@gem_persistent_relocs@forked-thrash-inactive.html

  * igt@gem_pipe_control_store_loop@reused-buffer:
    - shard-tglb:         [INCOMPLETE][73] ([i915#472] / [i915#707] / [i915#796]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5367/shard-tglb3/igt@gem_pipe_control_store_loop@reused-buffer.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3925/shard-tglb7/igt@gem_pipe_control_store_loop@reused-buffer.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-apl:          [FAIL][75] ([i915#644]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5367/shard-apl1/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3925/shard-apl2/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-snb:          [DMESG-WARN][77] ([fdo#111870] / [i915#478]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5367/shard-snb7/igt@gem_userptr_blits@dmabuf-sync.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3925/shard-snb6/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][79] ([i915#454]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5367/shard-iclb4/igt@i915_pm_dc@dc6-psr.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3925/shard-iclb1/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rps@waitboost:
    - shard-iclb:         [FAIL][81] ([i915#413]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5367/shard-iclb2/igt@i915_pm_rps@waitboost.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3925/shard-iclb1/igt@i915_pm_rps@waitboost.html

  * igt@i915_suspend@sysfs-reader:
    - shard-apl:          [DMESG-WARN][83] ([i915#180]) -> [PASS][84] +4 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5367/shard-apl4/igt@i915_suspend@sysfs-reader.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3925/shard-apl8/igt@i915_suspend@sysfs-reader.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][85] ([i915#180]) -> [PASS][86] +4 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5367/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3925/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-glk:          [FAIL][87] ([i915#79]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5367/shard-glk1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3925/shard-glk4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:
    - shard-tglb:         [FAIL][89] ([i915#49]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5367/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3925/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb:
    - shard-tglb:         [DMESG-WARN][91] ([i915#667]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5367/shard-tglb2/igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3925/shard-tglb3/igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [FAIL][93] ([i915#173]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5367/shard-iclb1/igt@kms_psr@no_drrs.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3925/shard-iclb6/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_cursor_plane_onoff:
    - shard-iclb:         [SKIP][95] ([fdo#109441]) -> [PASS][96] +2 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5367/shard-iclb5/igt@kms_psr@psr2_cursor_plane_onoff.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3925/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html

  * igt@perf_pmu@busy-no-semaphores-vcs1:
    - shard-iclb:         [SKIP][97] ([fdo#112080]) -> [PASS][98] +10 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5367/shard-iclb5/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3925/shard-iclb2/igt@perf_pmu@busy-no-semaphores-vcs1.html

  * igt@prime_vgem@sync-render:
    - shard-iclb:         [INCOMPLETE][99] ([i915#140]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5367/shard-iclb2/igt@prime_vgem@sync-render.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3925/shard-iclb8/igt@prime_vgem@sync-render.html

  
#### Warnings ####

  * igt@gem_eio@kms:
    - shard-snb:          [DMESG-WARN][101] ([i915#444] / [i915#503]) -> [INCOMPLETE][102] ([i915#82])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5367/shard-snb6/igt@gem_eio@kms.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3925/shard-snb7/igt@gem_eio@kms.html

  * igt@gem_persistent_relocs@forked-interruptible-thrashing:
    - shard-apl:          [TIMEOUT][103] ([fdo#112271] / [i915#530]) -> [INCOMPLETE][104] ([CI#80] / [fdo#103927] / [i915#530])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5367/shard-apl8/igt@gem_persistent_relocs@forked-interruptible-thrashing.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3925/shard-apl2/igt@gem_persistent_relocs@forked-interruptible-thrashing.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-snb:          [DMESG-WARN][105] ([fdo#110789] / [fdo#111870] / [i915#478]) -> [DMESG-WARN][106] ([fdo#111870] / [i915#478])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5367/shard-snb1/igt@gem_userptr_blits@dmabuf-unsync.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3925/shard-snb7/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
    - shard-snb:          [DMESG-WARN][107] ([fdo#111870] / [i915#478]) -> [DMESG-WARN][108] ([fdo#110789] / [fdo#111870] / [i915#478])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5367/shard-snb4/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3925/shard-snb6/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [SKIP][109] ([i915#468]) -> [FAIL][110] ([i915#454])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5367/shard-tglb6/igt@i915_pm_dc@dc6-psr.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3925/shard-tglb4/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_selftest@live_blt:
    - shard-hsw:          [DMESG-FAIL][111] ([i915#563]) -> [DMESG-FAIL][112] ([i915#725])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5367/shard-hsw5/igt@i915_selftest@live_blt.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3925/shard-hsw2/igt@i915_selftest@live_blt.html

  
  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111606]: https://bugs.freedesktop.org/show_bug.cgi?id=111606
  [fdo#111677]: https://bugs.freedesktop.org/show_bug.cgi?id=111677
  [fdo#111735]: https://bugs.freedesktop.org/show_bug.cgi?id=111735
  [fdo#111736]: https://bugs.freedesktop.org/show_bug.cgi?id=111736
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#232]: https://gitlab.freedesktop.org/drm/intel/issues/232
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#444]: https://gitlab.freedesktop.org/drm/intel/issues/444
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#463]: https://gitlab.freedesktop.org/drm/intel/issues/463
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#470]: https://gitlab.freedesktop.org/drm/intel/issues/470
  [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#503]: https://gitlab.freedesktop.org/drm/intel/issues/503
  [i915#520]: https://gitlab.freedesktop.org/drm/intel/issues/520
  [i915#530]: https://gitlab.freedesktop.org/drm/intel/issues/530
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#563]: https://gitlab.freedesktop.org/drm/intel/issues/563
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#667]: https://gitlab.freedesktop.org/drm/intel/issues/667
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#679]: https://gitlab.freedesktop.org/drm/intel/issues/679
  [i915#707]: https://gitlab.freedesktop.org/drm/intel/issues/707
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#796]: https://gitlab.freedesktop.org/drm/intel/issues/796
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5367 -> IGTPW_3925

  CI-20190529: 20190529
  CI_DRM_7748: 1793de9a4215356790b87608fcfc9e99eeb6954d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3925: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3925/index.html
  IGT_5367: 94af6de4f07487b93c4f5008f3ed04b5fc045200 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3925/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
