Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 21 Jan 2020 07:14:06 -0000
Message-ID: <157959084656.11481.6597288826867281568@emeril.freedesktop.org>
References: <20200120123923.11822-1-stanislav.lisovskiy@intel.com>
In-Reply-To: <20200120123923.11822-1-stanislav.lisovskiy@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdG9vbHM6?=
 =?utf-8?q?_Add_an_intel=5Fdbuf=5Fmap_tool_=28rev5=29?=
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

Series: tools: Add an intel_dbuf_map tool (rev5)
URL   : https://patchwork.freedesktop.org/series/70493/
State : success

== Summary ==

CI Bug Log - changes from IGT_5373_full -> IGTPW_3953_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3953/index.html

Known issues
------------

  Here are the changes found in IGTPW_3953_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [PASS][1] -> [SKIP][2] ([fdo#112080]) +7 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-iclb4/igt@gem_busy@busy-vcs1.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3953/shard-iclb6/igt@gem_busy@busy-vcs1.html

  * igt@gem_ctx_persistence@processes:
    - shard-apl:          [PASS][3] -> [FAIL][4] ([i915#570])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-apl2/igt@gem_ctx_persistence@processes.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3953/shard-apl7/igt@gem_ctx_persistence@processes.html

  * igt@gem_ctx_persistence@vcs1-mixed-process:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#109276] / [fdo#112080]) +2 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-iclb1/igt@gem_ctx_persistence@vcs1-mixed-process.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3953/shard-iclb8/igt@gem_ctx_persistence@vcs1-mixed-process.html

  * igt@gem_ctx_shared@q-smoketest-blt:
    - shard-tglb:         [PASS][7] -> [INCOMPLETE][8] ([fdo#111735] / [i915#472])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-tglb7/igt@gem_ctx_shared@q-smoketest-blt.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3953/shard-tglb2/igt@gem_ctx_shared@q-smoketest-blt.html

  * igt@gem_exec_balancer@hang:
    - shard-iclb:         [PASS][9] -> [INCOMPLETE][10] ([i915#140])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-iclb8/igt@gem_exec_balancer@hang.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3953/shard-iclb1/igt@gem_exec_balancer@hang.html

  * igt@gem_exec_create@forked:
    - shard-apl:          [PASS][11] -> [TIMEOUT][12] ([fdo#112271] / [i915#940])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-apl4/igt@gem_exec_create@forked.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3953/shard-apl2/igt@gem_exec_create@forked.html

  * igt@gem_exec_schedule@pi-userfault-bsd:
    - shard-iclb:         [PASS][13] -> [SKIP][14] ([i915#677])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-iclb8/igt@gem_exec_schedule@pi-userfault-bsd.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3953/shard-iclb1/igt@gem_exec_schedule@pi-userfault-bsd.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [PASS][15] -> [SKIP][16] ([fdo#112146]) +4 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-iclb8/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3953/shard-iclb2/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_exec_schedule@preempt-queue-contexts-chain-vebox:
    - shard-tglb:         [PASS][17] -> [INCOMPLETE][18] ([fdo#111606] / [fdo#111677] / [i915#472])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-tglb1/igt@gem_exec_schedule@preempt-queue-contexts-chain-vebox.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3953/shard-tglb3/igt@gem_exec_schedule@preempt-queue-contexts-chain-vebox.html

  * igt@gem_exec_schedule@promotion-bsd1:
    - shard-iclb:         [PASS][19] -> [SKIP][20] ([fdo#109276]) +21 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-iclb2/igt@gem_exec_schedule@promotion-bsd1.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3953/shard-iclb8/igt@gem_exec_schedule@promotion-bsd1.html

  * igt@gem_exec_schedule@smoketest-bsd2:
    - shard-tglb:         [PASS][21] -> [INCOMPLETE][22] ([i915#472] / [i915#707])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-tglb8/igt@gem_exec_schedule@smoketest-bsd2.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3953/shard-tglb6/igt@gem_exec_schedule@smoketest-bsd2.html

  * igt@gem_exec_suspend@basic-s3-devices:
    - shard-tglb:         [PASS][23] -> [INCOMPLETE][24] ([i915#460] / [i915#472])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-tglb2/igt@gem_exec_suspend@basic-s3-devices.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3953/shard-tglb6/igt@gem_exec_suspend@basic-s3-devices.html

  * igt@gem_persistent_relocs@forked-faulting-reloc-thrashing:
    - shard-kbl:          [PASS][25] -> [INCOMPLETE][26] ([fdo#103665] / [i915#530])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-kbl7/igt@gem_persistent_relocs@forked-faulting-reloc-thrashing.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3953/shard-kbl6/igt@gem_persistent_relocs@forked-faulting-reloc-thrashing.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [PASS][27] -> [FAIL][28] ([i915#644])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-glk8/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3953/shard-glk5/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@i915_pm_rps@reset:
    - shard-iclb:         [PASS][29] -> [FAIL][30] ([i915#413])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-iclb1/igt@i915_pm_rps@reset.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3953/shard-iclb4/igt@i915_pm_rps@reset.html

  * igt@i915_selftest@mock_requests:
    - shard-snb:          [PASS][31] -> [INCOMPLETE][32] ([i915#82])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-snb4/igt@i915_selftest@mock_requests.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3953/shard-snb2/igt@i915_selftest@mock_requests.html
    - shard-tglb:         [PASS][33] -> [INCOMPLETE][34] ([i915#472])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-tglb8/igt@i915_selftest@mock_requests.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3953/shard-tglb7/igt@i915_selftest@mock_requests.html
    - shard-hsw:          [PASS][35] -> [INCOMPLETE][36] ([i915#61])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-hsw2/igt@i915_selftest@mock_requests.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3953/shard-hsw4/igt@i915_selftest@mock_requests.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-kbl:          [PASS][37] -> [DMESG-WARN][38] ([i915#180]) +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-kbl6/igt@i915_suspend@fence-restore-tiled2untiled.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3953/shard-kbl2/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-apl:          [PASS][39] -> [DMESG-WARN][40] ([i915#180]) +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-apl2/igt@i915_suspend@fence-restore-untiled.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3953/shard-apl6/igt@i915_suspend@fence-restore-untiled.html

  * igt@kms_addfb_basic@small-bo:
    - shard-kbl:          [PASS][41] -> [SKIP][42] ([fdo#109271])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-kbl4/igt@kms_addfb_basic@small-bo.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3953/shard-kbl3/igt@kms_addfb_basic@small-bo.html
    - shard-hsw:          [PASS][43] -> [INCOMPLETE][44] ([CI#80] / [i915#61])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-hsw7/igt@kms_addfb_basic@small-bo.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3953/shard-hsw2/igt@kms_addfb_basic@small-bo.html
    - shard-snb:          [PASS][45] -> [INCOMPLETE][46] ([CI#80] / [i915#82])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-snb2/igt@kms_addfb_basic@small-bo.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3953/shard-snb4/igt@kms_addfb_basic@small-bo.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-cpu:
    - shard-tglb:         [PASS][47] -> [INCOMPLETE][48] ([i915#472] / [i915#474])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-cpu.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3953/shard-tglb4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-pwrite:
    - shard-tglb:         [PASS][49] -> [FAIL][50] ([i915#49]) +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-pwrite.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3953/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-pwrite.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [PASS][51] -> [SKIP][52] ([fdo#109642] / [fdo#111068])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3953/shard-iclb8/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [PASS][53] -> [SKIP][54] ([fdo#109441]) +2 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3953/shard-iclb6/igt@kms_psr@psr2_sprite_mmap_gtt.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@vcs1-none:
    - shard-iclb:         [SKIP][55] ([fdo#109276] / [fdo#112080]) -> [PASS][56] +4 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-iclb8/igt@gem_ctx_isolation@vcs1-none.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3953/shard-iclb4/igt@gem_ctx_isolation@vcs1-none.html

  * igt@gem_ctx_persistence@vecs0-mixed-process:
    - shard-apl:          [FAIL][57] ([i915#679]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-apl4/igt@gem_ctx_persistence@vecs0-mixed-process.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3953/shard-apl6/igt@gem_ctx_persistence@vecs0-mixed-process.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [SKIP][59] ([fdo#110841]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-iclb4/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3953/shard-iclb7/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_ctx_shared@q-smoketest-bsd:
    - shard-tglb:         [INCOMPLETE][61] ([i915#461] / [i915#472]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-tglb6/igt@gem_ctx_shared@q-smoketest-bsd.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3953/shard-tglb7/igt@gem_ctx_shared@q-smoketest-bsd.html

  * igt@gem_exec_create@basic:
    - shard-tglb:         [INCOMPLETE][63] ([fdo#111736] / [i915#472]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-tglb3/igt@gem_exec_create@basic.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3953/shard-tglb1/igt@gem_exec_create@basic.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [SKIP][65] ([i915#677]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-iclb1/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3953/shard-iclb8/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@reorder-wide-bsd:
    - shard-iclb:         [SKIP][67] ([fdo#112146]) -> [PASS][68] +5 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-iclb1/igt@gem_exec_schedule@reorder-wide-bsd.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3953/shard-iclb6/igt@gem_exec_schedule@reorder-wide-bsd.html

  * {igt@gem_mmap_offset@open-flood}:
    - shard-tglb:         [DMESG-FAIL][69] -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-tglb8/igt@gem_mmap_offset@open-flood.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3953/shard-tglb1/igt@gem_mmap_offset@open-flood.html

  * igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing:
    - shard-hsw:          [TIMEOUT][71] ([fdo#112271] / [i915#530]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-hsw4/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3953/shard-hsw2/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html

  * igt@gem_persistent_relocs@forked-interruptible-thrashing:
    - shard-apl:          [INCOMPLETE][73] ([CI#80] / [fdo#103927] / [i915#530]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-apl8/igt@gem_persistent_relocs@forked-interruptible-thrashing.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3953/shard-apl1/igt@gem_persistent_relocs@forked-interruptible-thrashing.html

  * igt@gem_persistent_relocs@forked-thrashing:
    - shard-hsw:          [INCOMPLETE][75] ([i915#530] / [i915#61]) -> [PASS][76] +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-hsw2/igt@gem_persistent_relocs@forked-thrashing.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3953/shard-hsw5/igt@gem_persistent_relocs@forked-thrashing.html

  * igt@gem_softpin@noreloc-s3:
    - shard-hsw:          [DMESG-WARN][77] -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-hsw6/igt@gem_softpin@noreloc-s3.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3953/shard-hsw1/igt@gem_softpin@noreloc-s3.html

  * igt@gem_sync@basic-store-all:
    - shard-tglb:         [INCOMPLETE][79] ([i915#472]) -> [PASS][80] +2 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-tglb1/igt@gem_sync@basic-store-all.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3953/shard-tglb8/igt@gem_sync@basic-store-all.html

  * igt@gem_tiled_partial_pwrite_pread@reads:
    - shard-hsw:          [FAIL][81] -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-hsw1/igt@gem_tiled_partial_pwrite_pread@reads.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3953/shard-hsw1/igt@gem_tiled_partial_pwrite_pread@reads.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [DMESG-WARN][83] ([i915#716]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-glk9/igt@gen9_exec_parse@allowed-all.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3953/shard-glk1/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_selftest@mock_requests:
    - shard-apl:          [INCOMPLETE][85] ([fdo#103927]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-apl6/igt@i915_selftest@mock_requests.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3953/shard-apl2/igt@i915_selftest@mock_requests.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-apl:          [DMESG-WARN][87] ([i915#180]) -> [PASS][88] +1 similar issue
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-apl3/igt@i915_suspend@fence-restore-tiled2untiled.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3953/shard-apl6/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-random:
    - shard-kbl:          [INCOMPLETE][89] ([CI#80] / [fdo#103665]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3953/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html
    - shard-snb:          [INCOMPLETE][91] ([CI#80] / [i915#82]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-snb6/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3953/shard-snb4/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][93] ([i915#180]) -> [PASS][94] +4 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3953/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-b-cursor-128x128-sliding:
    - shard-apl:          [FAIL][95] ([i915#54]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-apl7/igt@kms_cursor_crc@pipe-b-cursor-128x128-sliding.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3953/shard-apl7/igt@kms_cursor_crc@pipe-b-cursor-128x128-sliding.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:
    - shard-tglb:         [FAIL][97] ([i915#49]) -> [PASS][98] +5 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-tglb1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3953/shard-tglb8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_psr@psr2_basic:
    - shard-iclb:         [SKIP][99] ([fdo#109441]) -> [PASS][100] +2 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-iclb1/igt@kms_psr@psr2_basic.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3953/shard-iclb2/igt@kms_psr@psr2_basic.html

  * igt@perf_pmu@busy-no-semaphores-vcs1:
    - shard-iclb:         [SKIP][101] ([fdo#112080]) -> [PASS][102] +10 similar issues
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-iclb8/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3953/shard-iclb4/igt@perf_pmu@busy-no-semaphores-vcs1.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [SKIP][103] ([fdo#109276]) -> [PASS][104] +14 similar issues
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-iclb8/igt@prime_busy@hang-bsd2.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3953/shard-iclb4/igt@prime_busy@hang-bsd2.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [SKIP][105] ([fdo#109276] / [fdo#112080]) -> [FAIL][106] ([IGT#28])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-iclb6/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3953/shard-iclb2/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@gem_eio@kms:
    - shard-snb:          [DMESG-WARN][107] ([i915#444]) -> [INCOMPLETE][108] ([i915#82])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-snb5/igt@gem_eio@kms.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3953/shard-snb4/igt@gem_eio@kms.html

  * igt@gem_tiled_blits@interruptible:
    - shard-hsw:          [FAIL][109] ([i915#818]) -> [FAIL][110] ([i915#694])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-hsw2/igt@gem_tiled_blits@interruptible.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3953/shard-hsw2/igt@gem_tiled_blits@interruptible.html

  * igt@gem_userptr_blits@sync-unmap-after-close:
    - shard-snb:          [DMESG-WARN][111] ([fdo#110789] / [fdo#111870] / [i915#478]) -> [DMESG-WARN][112] ([fdo#111870] / [i915#478])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-snb2/igt@gem_userptr_blits@sync-unmap-after-close.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3953/shard-snb2/igt@gem_userptr_blits@sync-unmap-after-close.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [SKIP][113] ([fdo#109349]) -> [DMESG-WARN][114] ([fdo#107724])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-iclb7/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3953/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-kbl:          [DMESG-WARN][115] ([i915#180]) -> [DMESG-WARN][116] ([i915#56])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3953/shard-kbl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@runner@aborted:
    - shard-hsw:          [FAIL][117] -> [FAIL][118] ([i915#873])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-hsw6/igt@runner@aborted.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3953/shard-hsw4/igt@runner@aborted.html
    - shard-apl:          ([FAIL][119], [FAIL][120]) ([i915#873] / [i915#997]) -> ([FAIL][121], [FAIL][122]) ([i915#997])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-apl6/igt@runner@aborted.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5373/shard-apl8/igt@runner@aborted.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3953/shard-apl8/igt@runner@aborted.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3953/shard-apl7/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#107724]: https://bugs.freedesktop.org/show_bug.cgi?id=107724
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111606]: https://bugs.freedesktop.org/show_bug.cgi?id=111606
  [fdo#111677]: https://bugs.freedesktop.org/show_bug.cgi?id=111677
  [fdo#111735]: https://bugs.freedesktop.org/show_bug.cgi?id=111735
  [fdo#111736]: https://bugs.freedesktop.org/show_bug.cgi?id=111736
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#444]: https://gitlab.freedesktop.org/drm/intel/issues/444
  [i915#460]: https://gitlab.freedesktop.org/drm/intel/issues/460
  [i915#461]: https://gitlab.freedesktop.org/drm/intel/issues/461
  [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
  [i915#474]: https://gitlab.freedesktop.org/drm/intel/issues/474
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#530]: https://gitlab.freedesktop.org/drm/intel/issues/530
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#56]: https://gitlab.freedesktop.org/drm/intel/issues/56
  [i915#570]: https://gitlab.freedesktop.org/drm/intel/issues/570
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#679]: https://gitlab.freedesktop.org/drm/intel/issues/679
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#707]: https://gitlab.freedesktop.org/drm/intel/issues/707
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#873]: https://gitlab.freedesktop.org/drm/intel/issues/873
  [i915#940]: https://gitlab.freedesktop.org/drm/intel/issues/940
  [i915#997]: https://gitlab.freedesktop.org/drm/intel/issues/997


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5373 -> IGTPW_3953

  CI-20190529: 20190529
  CI_DRM_7778: 8442e59b2b3aa0f081ee31fc13dcd0f31e5981e5 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3953: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3953/index.html
  IGT_5373: 224e565df36693ab8ae8f58eb6ae42600c2464e2 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3953/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
