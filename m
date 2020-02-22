Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sat, 22 Feb 2020 09:59:46 -0000
Message-ID: <158236558623.32576.13363573906478734720@emeril.freedesktop.org>
References: <20200220051432.21898-1-priyanka.dandamudi@intel.com>
In-Reply-To: <20200220051432.21898-1-priyanka.dandamudi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Frequest=5Fretire=3A_Removal_of_test?=
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
To: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: i915/gem_request_retire: Removal of test
URL   : https://patchwork.freedesktop.org/series/73689/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7970_full -> IGTPW_4190_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4190/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4190_full:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@gem_exec_whisper@basic-contexts-forked}:
    - shard-tglb:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7970/shard-tglb8/igt@gem_exec_whisper@basic-contexts-forked.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4190/shard-tglb7/igt@gem_exec_whisper@basic-contexts-forked.html

  
Known issues
------------

  Here are the changes found in IGTPW_4190_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_schedule@pi-shared-iova-bsd:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([i915#677])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7970/shard-iclb3/igt@gem_exec_schedule@pi-shared-iova-bsd.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4190/shard-iclb1/igt@gem_exec_schedule@pi-shared-iova-bsd.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#112146]) +6 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7970/shard-iclb3/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4190/shard-iclb2/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_partial_pwrite_pread@reads:
    - shard-hsw:          [PASS][7] -> [FAIL][8] ([i915#694])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7970/shard-hsw7/igt@gem_partial_pwrite_pread@reads.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4190/shard-hsw2/igt@gem_partial_pwrite_pread@reads.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-tglb:         [PASS][9] -> [FAIL][10] ([i915#644])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7970/shard-tglb2/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4190/shard-tglb6/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@i915_pm_dc@dc5-dpms:
    - shard-iclb:         [PASS][11] -> [FAIL][12] ([i915#447])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7970/shard-iclb2/igt@i915_pm_dc@dc5-dpms.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4190/shard-iclb3/igt@i915_pm_dc@dc5-dpms.html

  * igt@i915_suspend@debugfs-reader:
    - shard-apl:          [PASS][13] -> [DMESG-WARN][14] ([i915#180]) +3 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7970/shard-apl3/igt@i915_suspend@debugfs-reader.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4190/shard-apl6/igt@i915_suspend@debugfs-reader.html

  * igt@kms_cursor_crc@pipe-c-cursor-64x21-random:
    - shard-kbl:          [PASS][15] -> [FAIL][16] ([i915#54])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7970/shard-kbl6/igt@kms_cursor_crc@pipe-c-cursor-64x21-random.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4190/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-64x21-random.html
    - shard-apl:          [PASS][17] -> [FAIL][18] ([i915#54])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7970/shard-apl8/igt@kms_cursor_crc@pipe-c-cursor-64x21-random.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4190/shard-apl1/igt@kms_cursor_crc@pipe-c-cursor-64x21-random.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-glk:          [PASS][19] -> [FAIL][20] ([i915#79])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7970/shard-glk7/igt@kms_flip@flip-vs-expired-vblank.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4190/shard-glk8/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-kbl:          [PASS][21] -> [INCOMPLETE][22] ([fdo#103665] / [i915#600])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7970/shard-kbl6/igt@kms_flip@flip-vs-suspend-interruptible.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4190/shard-kbl2/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:
    - shard-glk:          [PASS][23] -> [FAIL][24] ([i915#49]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7970/shard-glk8/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4190/shard-glk6/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [PASS][25] -> [DMESG-WARN][26] ([i915#180]) +2 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7970/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4190/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_lease@cursor_implicit_plane:
    - shard-snb:          [PASS][27] -> [SKIP][28] ([fdo#109271]) +6 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7970/shard-snb5/igt@kms_lease@cursor_implicit_plane.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4190/shard-snb2/igt@kms_lease@cursor_implicit_plane.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [PASS][29] -> [SKIP][30] ([fdo#109441]) +3 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7970/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4190/shard-iclb7/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@perf_pmu@busy-no-semaphores-vcs1:
    - shard-iclb:         [PASS][31] -> [SKIP][32] ([fdo#112080]) +11 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7970/shard-iclb1/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4190/shard-iclb8/igt@perf_pmu@busy-no-semaphores-vcs1.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [PASS][33] -> [SKIP][34] ([fdo#109276]) +13 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7970/shard-iclb1/igt@prime_vgem@fence-wait-bsd2.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4190/shard-iclb6/igt@prime_vgem@fence-wait-bsd2.html

  
#### Possible fixes ####

  * igt@gem_busy@close-race:
    - shard-tglb:         [INCOMPLETE][35] ([i915#977]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7970/shard-tglb3/igt@gem_busy@close-race.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4190/shard-tglb3/igt@gem_busy@close-race.html

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-kbl:          [DMESG-WARN][37] ([i915#180]) -> [PASS][38] +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7970/shard-kbl3/igt@gem_ctx_isolation@rcs0-s3.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4190/shard-kbl6/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [SKIP][39] ([fdo#110841]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7970/shard-iclb2/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4190/shard-iclb7/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_reuse@baggage:
    - shard-apl:          [TIMEOUT][41] ([fdo#112271]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7970/shard-apl7/igt@gem_exec_reuse@baggage.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4190/shard-apl2/igt@gem_exec_reuse@baggage.html

  * {igt@gem_exec_schedule@implicit-both-bsd2}:
    - shard-iclb:         [SKIP][43] ([fdo#109276] / [i915#677]) -> [PASS][44] +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7970/shard-iclb8/igt@gem_exec_schedule@implicit-both-bsd2.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4190/shard-iclb2/igt@gem_exec_schedule@implicit-both-bsd2.html

  * igt@gem_exec_schedule@out-order-bsd2:
    - shard-iclb:         [SKIP][45] ([fdo#109276]) -> [PASS][46] +23 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7970/shard-iclb5/igt@gem_exec_schedule@out-order-bsd2.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4190/shard-iclb2/igt@gem_exec_schedule@out-order-bsd2.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [SKIP][47] ([i915#677]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7970/shard-iclb1/igt@gem_exec_schedule@pi-common-bsd.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4190/shard-iclb3/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_schedule@wide-bsd:
    - shard-iclb:         [SKIP][49] ([fdo#112146]) -> [PASS][50] +6 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7970/shard-iclb4/igt@gem_exec_schedule@wide-bsd.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4190/shard-iclb3/igt@gem_exec_schedule@wide-bsd.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-apl:          [FAIL][51] ([i915#644]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7970/shard-apl1/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4190/shard-apl1/igt@gem_ppgtt@flink-and-close-vma-leak.html
    - shard-kbl:          [FAIL][53] ([i915#644]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7970/shard-kbl7/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4190/shard-kbl4/igt@gem_ppgtt@flink-and-close-vma-leak.html
    - shard-hsw:          [FAIL][55] ([i915#644]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7970/shard-hsw1/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4190/shard-hsw7/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_tiled_blits@normal:
    - shard-hsw:          [FAIL][57] ([i915#694]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7970/shard-hsw2/igt@gem_tiled_blits@normal.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4190/shard-hsw5/igt@gem_tiled_blits@normal.html

  * igt@kms_cursor_crc@pipe-b-cursor-256x85-sliding:
    - shard-hsw:          [INCOMPLETE][59] ([CI#80] / [i915#61]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7970/shard-hsw8/igt@kms_cursor_crc@pipe-b-cursor-256x85-sliding.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4190/shard-hsw8/igt@kms_cursor_crc@pipe-b-cursor-256x85-sliding.html

  * igt@kms_flip@flip-vs-dpms-interruptible:
    - shard-apl:          [DMESG-WARN][61] -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7970/shard-apl4/igt@kms_flip@flip-vs-dpms-interruptible.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4190/shard-apl3/igt@kms_flip@flip-vs-dpms-interruptible.html
    - shard-kbl:          [DMESG-WARN][63] -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7970/shard-kbl2/igt@kms_flip@flip-vs-dpms-interruptible.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4190/shard-kbl4/igt@kms_flip@flip-vs-dpms-interruptible.html

  * igt@kms_flip@flip-vs-modeset-vs-hang-interruptible:
    - shard-glk:          [TIMEOUT][65] ([fdo#112271]) -> [PASS][66] +1 similar issue
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7970/shard-glk5/igt@kms_flip@flip-vs-modeset-vs-hang-interruptible.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4190/shard-glk9/igt@kms_flip@flip-vs-modeset-vs-hang-interruptible.html
    - shard-tglb:         [TIMEOUT][67] ([fdo#112271] / [i915#561]) -> [PASS][68] +1 similar issue
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7970/shard-tglb5/igt@kms_flip@flip-vs-modeset-vs-hang-interruptible.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4190/shard-tglb2/igt@kms_flip@flip-vs-modeset-vs-hang-interruptible.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-hsw:          [INCOMPLETE][69] ([i915#61]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7970/shard-hsw5/igt@kms_flip@flip-vs-suspend.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4190/shard-hsw1/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-tilingchange:
    - shard-apl:          [FAIL][71] ([i915#49]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7970/shard-apl8/igt@kms_frontbuffer_tracking@fbc-tilingchange.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4190/shard-apl1/igt@kms_frontbuffer_tracking@fbc-tilingchange.html
    - shard-kbl:          [FAIL][73] ([i915#49]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7970/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-tilingchange.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4190/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-tilingchange.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-apl:          [DMESG-WARN][75] ([i915#180]) -> [PASS][76] +2 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7970/shard-apl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4190/shard-apl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [SKIP][77] ([fdo#109441]) -> [PASS][78] +1 similar issue
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7970/shard-iclb5/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4190/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [TIMEOUT][79] ([fdo#112271] / [i915#1085]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7970/shard-tglb7/igt@perf@gen12-mi-rpc.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4190/shard-tglb6/igt@perf@gen12-mi-rpc.html

  * igt@perf@oa-exponents:
    - shard-glk:          [FAIL][81] ([i915#84]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7970/shard-glk1/igt@perf@oa-exponents.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4190/shard-glk1/igt@perf@oa-exponents.html

  * igt@perf_pmu@init-busy-vcs1:
    - shard-iclb:         [SKIP][83] ([fdo#112080]) -> [PASS][84] +7 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7970/shard-iclb6/igt@perf_pmu@init-busy-vcs1.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4190/shard-iclb2/igt@perf_pmu@init-busy-vcs1.html

  * igt@prime_mmap_coherency@ioctl-errors:
    - shard-hsw:          [FAIL][85] ([i915#831]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7970/shard-hsw8/igt@prime_mmap_coherency@ioctl-errors.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4190/shard-hsw7/igt@prime_mmap_coherency@ioctl-errors.html

  
#### Warnings ####

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-snb:          [DMESG-WARN][87] ([fdo#110789] / [fdo#111870] / [i915#478]) -> [DMESG-WARN][88] ([fdo#111870] / [i915#478])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7970/shard-snb6/igt@gem_userptr_blits@dmabuf-sync.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4190/shard-snb5/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [SKIP][89] ([i915#468]) -> [FAIL][90] ([i915#454])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7970/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4190/shard-tglb8/igt@i915_pm_dc@dc6-dpms.html

  * igt@kms_content_protection@legacy:
    - shard-kbl:          [TIMEOUT][91] ([fdo#112271]) -> [TIMEOUT][92] ([fdo#112271] / [i915#727])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7970/shard-kbl1/igt@kms_content_protection@legacy.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4190/shard-kbl2/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic:
    - shard-kbl:          [TIMEOUT][93] ([fdo#112271] / [i915#727]) -> [TIMEOUT][94] ([fdo#112271])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7970/shard-kbl2/igt@kms_content_protection@lic.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4190/shard-kbl6/igt@kms_content_protection@lic.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [SKIP][95] ([fdo#109349]) -> [DMESG-WARN][96] ([i915#1226])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7970/shard-iclb6/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4190/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
  [i915#1226]: https://gitlab.freedesktop.org/drm/intel/issues/1226
  [i915#1291]: https://gitlab.freedesktop.org/drm/intel/issues/1291
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#447]: https://gitlab.freedesktop.org/drm/intel/issues/447
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#561]: https://gitlab.freedesktop.org/drm/intel/issues/561
  [i915#600]: https://gitlab.freedesktop.org/drm/intel/issues/600
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#727]: https://gitlab.freedesktop.org/drm/intel/issues/727
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#831]: https://gitlab.freedesktop.org/drm/intel/issues/831
  [i915#84]: https://gitlab.freedesktop.org/drm/intel/issues/84
  [i915#977]: https://gitlab.freedesktop.org/drm/intel/issues/977


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5452 -> IGTPW_4190
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7970: 6b8b833350142345f4b1a6af9486db7d316a7ff1 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4190: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4190/index.html
  IGT_5452: c05dc6cd816feb1cc518ce777ab3fd6c81893113 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4190/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
