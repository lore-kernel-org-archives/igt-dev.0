Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sun, 23 Feb 2020 21:58:17 -0000
Message-ID: <158249509759.14520.14882568434632974547@emeril.freedesktop.org>
References: <20200220225137.18687-1-akeem.g.abodunrin@intel.com>
In-Reply-To: <20200220225137.18687-1-akeem.g.abodunrin@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgU3VwcG9y?=
 =?utf-8?q?t_to_assemble_CB_kernel_for_gen7_=28rev2=29?=
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
To: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Support to assemble CB kernel for gen7 (rev2)
URL   : https://patchwork.freedesktop.org/series/73684/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7979_full -> IGTPW_4204_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4204/index.html

Known issues
------------

  Here are the changes found in IGTPW_4204_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_shared@q-independent-vebox:
    - shard-apl:          [PASS][1] -> [FAIL][2] ([i915#935])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7979/shard-apl2/igt@gem_ctx_shared@q-independent-vebox.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4204/shard-apl1/igt@gem_ctx_shared@q-independent-vebox.html

  * igt@gem_exec_schedule@pi-shared-iova-bsd:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([i915#677]) +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7979/shard-iclb8/igt@gem_exec_schedule@pi-shared-iova-bsd.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4204/shard-iclb4/igt@gem_exec_schedule@pi-shared-iova-bsd.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#112146]) +8 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7979/shard-iclb7/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4204/shard-iclb1/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_partial_pwrite_pread@write-uncached:
    - shard-hsw:          [PASS][7] -> [FAIL][8] ([i915#694]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7979/shard-hsw6/igt@gem_partial_pwrite_pread@write-uncached.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4204/shard-hsw1/igt@gem_partial_pwrite_pread@write-uncached.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-hsw:          [PASS][9] -> [FAIL][10] ([i915#644])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7979/shard-hsw7/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4204/shard-hsw5/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@i915_pm_rps@waitboost:
    - shard-iclb:         [PASS][11] -> [FAIL][12] ([i915#413])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7979/shard-iclb7/igt@i915_pm_rps@waitboost.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4204/shard-iclb4/igt@i915_pm_rps@waitboost.html

  * igt@i915_selftest@live_gtt:
    - shard-kbl:          [PASS][13] -> [TIMEOUT][14] ([fdo#112271])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7979/shard-kbl6/igt@i915_selftest@live_gtt.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4204/shard-kbl1/igt@i915_selftest@live_gtt.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [PASS][15] -> [DMESG-WARN][16] ([i915#180]) +4 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7979/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4204/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-c-cursor-256x256-random:
    - shard-kbl:          [PASS][17] -> [FAIL][18] ([i915#54])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7979/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-256x256-random.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4204/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-256x256-random.html
    - shard-apl:          [PASS][19] -> [FAIL][20] ([i915#54])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7979/shard-apl8/igt@kms_cursor_crc@pipe-c-cursor-256x256-random.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4204/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-256x256-random.html
    - shard-glk:          [PASS][21] -> [FAIL][22] ([i915#54])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7979/shard-glk5/igt@kms_cursor_crc@pipe-c-cursor-256x256-random.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4204/shard-glk5/igt@kms_cursor_crc@pipe-c-cursor-256x256-random.html

  * igt@kms_flip@flip-vs-modeset-vs-hang-interruptible:
    - shard-glk:          [PASS][23] -> [TIMEOUT][24] ([fdo#112271]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7979/shard-glk4/igt@kms_flip@flip-vs-modeset-vs-hang-interruptible.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4204/shard-glk8/igt@kms_flip@flip-vs-modeset-vs-hang-interruptible.html
    - shard-tglb:         [PASS][25] -> [TIMEOUT][26] ([fdo#112271] / [i915#561])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7979/shard-tglb7/igt@kms_flip@flip-vs-modeset-vs-hang-interruptible.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4204/shard-tglb3/igt@kms_flip@flip-vs-modeset-vs-hang-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-hsw:          [PASS][27] -> [INCOMPLETE][28] ([i915#61])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7979/shard-hsw2/igt@kms_flip@flip-vs-suspend-interruptible.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4204/shard-hsw5/igt@kms_flip@flip-vs-suspend-interruptible.html
    - shard-snb:          [PASS][29] -> [INCOMPLETE][30] ([i915#82])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7979/shard-snb4/igt@kms_flip@flip-vs-suspend-interruptible.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4204/shard-snb1/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-1p-rte:
    - shard-kbl:          [PASS][31] -> [FAIL][32] ([fdo#110378] / [i915#49])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7979/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-rte.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4204/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-1p-rte.html
    - shard-apl:          [PASS][33] -> [FAIL][34] ([fdo#110378] / [i915#49])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7979/shard-apl8/igt@kms_frontbuffer_tracking@fbc-1p-rte.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4204/shard-apl7/igt@kms_frontbuffer_tracking@fbc-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render:
    - shard-tglb:         [PASS][35] -> [SKIP][36] ([i915#668]) +2 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7979/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4204/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [PASS][37] -> [FAIL][38] ([i915#899])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7979/shard-glk7/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4204/shard-glk3/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [PASS][39] -> [SKIP][40] ([fdo#109642] / [fdo#111068])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7979/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4204/shard-iclb6/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_cursor_mmap_gtt:
    - shard-iclb:         [PASS][41] -> [SKIP][42] ([fdo#109441])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7979/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_gtt.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4204/shard-iclb3/igt@kms_psr@psr2_cursor_mmap_gtt.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [PASS][43] -> [FAIL][44] ([i915#31])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7979/shard-kbl7/igt@kms_setmode@basic.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4204/shard-kbl4/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-apl:          [PASS][45] -> [DMESG-WARN][46] ([i915#180]) +4 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7979/shard-apl1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4204/shard-apl6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [PASS][47] -> [TIMEOUT][48] ([fdo#112271] / [i915#1085])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7979/shard-tglb1/igt@perf@gen12-mi-rpc.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4204/shard-tglb7/igt@perf@gen12-mi-rpc.html

  * igt@perf_pmu@busy-no-semaphores-vcs1:
    - shard-iclb:         [PASS][49] -> [SKIP][50] ([fdo#112080]) +13 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7979/shard-iclb4/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4204/shard-iclb6/igt@perf_pmu@busy-no-semaphores-vcs1.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [PASS][51] -> [SKIP][52] ([fdo#109276]) +10 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7979/shard-iclb4/igt@prime_busy@hang-bsd2.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4204/shard-iclb5/igt@prime_busy@hang-bsd2.html

  * igt@prime_mmap_coherency@ioctl-errors:
    - shard-hsw:          [PASS][53] -> [FAIL][54] ([i915#831])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7979/shard-hsw7/igt@prime_mmap_coherency@ioctl-errors.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4204/shard-hsw7/igt@prime_mmap_coherency@ioctl-errors.html

  * igt@prime_mmap_coherency@write:
    - shard-hsw:          [PASS][55] -> [FAIL][56] ([i915#914])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7979/shard-hsw1/igt@prime_mmap_coherency@write.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4204/shard-hsw1/igt@prime_mmap_coherency@write.html

  
#### Possible fixes ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [SKIP][57] ([fdo#112080]) -> [PASS][58] +10 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7979/shard-iclb5/igt@gem_busy@busy-vcs1.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4204/shard-iclb1/igt@gem_busy@busy-vcs1.html

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-kbl:          [DMESG-WARN][59] ([i915#180]) -> [PASS][60] +4 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7979/shard-kbl4/igt@gem_ctx_isolation@rcs0-s3.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4204/shard-kbl7/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_exec_async@concurrent-writes-bsd:
    - shard-iclb:         [SKIP][61] ([fdo#112146]) -> [PASS][62] +2 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7979/shard-iclb1/igt@gem_exec_async@concurrent-writes-bsd.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4204/shard-iclb8/igt@gem_exec_async@concurrent-writes-bsd.html

  * {igt@gem_exec_schedule@implicit-both-bsd2}:
    - shard-iclb:         [SKIP][63] ([fdo#109276] / [i915#677]) -> [PASS][64] +2 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7979/shard-iclb6/igt@gem_exec_schedule@implicit-both-bsd2.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4204/shard-iclb4/igt@gem_exec_schedule@implicit-both-bsd2.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [SKIP][65] ([i915#677]) -> [PASS][66] +3 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7979/shard-iclb2/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4204/shard-iclb8/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
    - shard-hsw:          [FAIL][67] ([i915#694]) -> [PASS][68] +1 similar issue
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7979/shard-hsw5/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4204/shard-hsw5/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html

  * igt@i915_pm_rpm@debugfs-read:
    - shard-hsw:          [INCOMPLETE][69] ([i915#151] / [i915#61]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7979/shard-hsw5/igt@i915_pm_rpm@debugfs-read.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4204/shard-hsw7/igt@i915_pm_rpm@debugfs-read.html

  * igt@i915_selftest@live_gt_lrc:
    - shard-tglb:         [DMESG-FAIL][71] ([i915#1233]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7979/shard-tglb6/igt@i915_selftest@live_gt_lrc.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4204/shard-tglb6/igt@i915_selftest@live_gt_lrc.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-apl:          [DMESG-WARN][73] ([i915#180]) -> [PASS][74] +3 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7979/shard-apl6/igt@i915_suspend@fence-restore-tiled2untiled.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4204/shard-apl3/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_color@pipe-a-ctm-blue-to-red:
    - shard-kbl:          [FAIL][75] ([i915#129]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7979/shard-kbl7/igt@kms_color@pipe-a-ctm-blue-to-red.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4204/shard-kbl7/igt@kms_color@pipe-a-ctm-blue-to-red.html
    - shard-apl:          [FAIL][77] ([i915#129]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7979/shard-apl8/igt@kms_color@pipe-a-ctm-blue-to-red.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4204/shard-apl4/igt@kms_color@pipe-a-ctm-blue-to-red.html

  * igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque:
    - shard-apl:          [FAIL][79] ([i915#54]) -> [PASS][80] +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7979/shard-apl1/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4204/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html
    - shard-glk:          [FAIL][81] ([i915#54]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7979/shard-glk8/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4204/shard-glk6/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html

  * igt@kms_cursor_crc@pipe-c-cursor-256x85-sliding:
    - shard-kbl:          [FAIL][83] ([i915#54]) -> [PASS][84] +1 similar issue
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7979/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-256x85-sliding.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4204/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-256x85-sliding.html

  * igt@kms_flip@flip-vs-panning:
    - shard-kbl:          [DMESG-WARN][85] -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7979/shard-kbl1/igt@kms_flip@flip-vs-panning.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4204/shard-kbl7/igt@kms_flip@flip-vs-panning.html
    - shard-apl:          [DMESG-WARN][87] -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7979/shard-apl6/igt@kms_flip@flip-vs-panning.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4204/shard-apl6/igt@kms_flip@flip-vs-panning.html

  * igt@kms_flip@flip-vs-panning-vs-hang-interruptible:
    - shard-tglb:         [TIMEOUT][89] ([fdo#112271] / [i915#561]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7979/shard-tglb2/igt@kms_flip@flip-vs-panning-vs-hang-interruptible.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4204/shard-tglb2/igt@kms_flip@flip-vs-panning-vs-hang-interruptible.html
    - shard-glk:          [TIMEOUT][91] ([fdo#112271]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7979/shard-glk5/igt@kms_flip@flip-vs-panning-vs-hang-interruptible.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4204/shard-glk7/igt@kms_flip@flip-vs-panning-vs-hang-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-glk:          [FAIL][93] ([i915#49]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7979/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4204/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [SKIP][95] ([fdo#109642] / [fdo#111068]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7979/shard-iclb3/igt@kms_psr2_su@page_flip.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4204/shard-iclb2/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [SKIP][97] ([fdo#109441]) -> [PASS][98] +1 similar issue
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7979/shard-iclb8/igt@kms_psr@psr2_cursor_render.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4204/shard-iclb2/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_psr@psr2_sprite_plane_onoff:
    - shard-tglb:         [SKIP][99] ([i915#668]) -> [PASS][100] +4 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7979/shard-tglb2/igt@kms_psr@psr2_sprite_plane_onoff.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4204/shard-tglb3/igt@kms_psr@psr2_sprite_plane_onoff.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][101] ([i915#31]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7979/shard-apl1/igt@kms_setmode@basic.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4204/shard-apl7/igt@kms_setmode@basic.html

  * igt@perf@disabled-read-error:
    - shard-iclb:         [DMESG-WARN][103] ([i915#645]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7979/shard-iclb4/igt@perf@disabled-read-error.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4204/shard-iclb7/igt@perf@disabled-read-error.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [SKIP][105] ([fdo#109276]) -> [PASS][106] +18 similar issues
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7979/shard-iclb6/igt@prime_vgem@fence-wait-bsd2.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4204/shard-iclb2/igt@prime_vgem@fence-wait-bsd2.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [SKIP][107] ([fdo#112080]) -> [FAIL][108] ([IGT#28])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7979/shard-iclb7/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4204/shard-iclb2/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-kbl:          [INCOMPLETE][109] ([fdo#103665]) -> [DMESG-WARN][110] ([i915#180])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7979/shard-kbl4/igt@gem_workarounds@suspend-resume-context.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4204/shard-kbl7/igt@gem_workarounds@suspend-resume-context.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [SKIP][111] ([i915#468]) -> [FAIL][112] ([i915#454])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7979/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4204/shard-tglb3/igt@i915_pm_dc@dc6-dpms.html

  * igt@kms_content_protection@atomic:
    - shard-kbl:          [TIMEOUT][113] ([fdo#112271] / [i915#727]) -> [TIMEOUT][114] ([fdo#112271])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7979/shard-kbl2/igt@kms_content_protection@atomic.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4204/shard-kbl6/igt@kms_content_protection@atomic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110378]: https://bugs.freedesktop.org/show_bug.cgi?id=110378
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
  [i915#1233]: https://gitlab.freedesktop.org/drm/intel/issues/1233
  [i915#129]: https://gitlab.freedesktop.org/drm/intel/issues/129
  [i915#151]: https://gitlab.freedesktop.org/drm/intel/issues/151
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#561]: https://gitlab.freedesktop.org/drm/intel/issues/561
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#645]: https://gitlab.freedesktop.org/drm/intel/issues/645
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#679]: https://gitlab.freedesktop.org/drm/intel/issues/679
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#727]: https://gitlab.freedesktop.org/drm/intel/issues/727
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#831]: https://gitlab.freedesktop.org/drm/intel/issues/831
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [i915#914]: https://gitlab.freedesktop.org/drm/intel/issues/914
  [i915#935]: https://gitlab.freedesktop.org/drm/intel/issues/935


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5453 -> IGTPW_4204
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7979: 45d61ea8faa5bdb50719bed2de3dd2ef8e6f5a12 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4204: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4204/index.html
  IGT_5453: cae9a5881ed2c5be2c2518a255740b612a927f9a @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4204/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
