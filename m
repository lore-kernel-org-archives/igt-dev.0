Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 16 Jan 2020 09:18:37 -0000
Message-ID: <157916631733.12913.7096608609294039495@emeril.freedesktop.org>
References: <20200114052728.13313-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20200114052728.13313-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgbGliL2k5?=
 =?utf-8?q?15/gem=5Fmman=2Ec=3A_add_cpu_coherency_mapping_wrapper?=
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
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: lib/i915/gem_mman.c: add cpu coherency mapping wrapper
URL   : https://patchwork.freedesktop.org/series/71988/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7737_full -> IGTPW_3920_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3920/index.html

Known issues
------------

  Here are the changes found in IGTPW_3920_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-kbl:          [PASS][1] -> [DMESG-WARN][2] ([i915#180]) +3 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-kbl6/igt@gem_ctx_isolation@rcs0-s3.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3920/shard-kbl1/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_ctx_persistence@vcs1-mixed-process:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#109276] / [fdo#112080]) +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-iclb4/igt@gem_ctx_persistence@vcs1-mixed-process.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3920/shard-iclb3/igt@gem_ctx_persistence@vcs1-mixed-process.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#110841])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-iclb6/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3920/shard-iclb1/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_ctx_shared@q-smoketest-bsd:
    - shard-tglb:         [PASS][7] -> [INCOMPLETE][8] ([i915#461]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-tglb5/igt@gem_ctx_shared@q-smoketest-bsd.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3920/shard-tglb6/igt@gem_ctx_shared@q-smoketest-bsd.html

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#112080]) +8 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-iclb1/igt@gem_exec_parallel@vcs1-fds.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3920/shard-iclb5/igt@gem_exec_parallel@vcs1-fds.html

  * igt@gem_exec_parallel@vecs0-contexts:
    - shard-tglb:         [PASS][11] -> [INCOMPLETE][12] ([i915#472])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-tglb2/igt@gem_exec_parallel@vecs0-contexts.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3920/shard-tglb3/igt@gem_exec_parallel@vecs0-contexts.html

  * igt@gem_exec_schedule@preempt-queue-bsd1:
    - shard-iclb:         [PASS][13] -> [SKIP][14] ([fdo#109276]) +17 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-iclb2/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3920/shard-iclb3/igt@gem_exec_schedule@preempt-queue-bsd1.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [PASS][15] -> [SKIP][16] ([fdo#112146]) +9 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-iclb3/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3920/shard-iclb4/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [PASS][17] -> [DMESG-WARN][18] ([i915#716])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-glk4/igt@gen9_exec_parse@allowed-all.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3920/shard-glk7/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [PASS][19] -> [FAIL][20] ([i915#454])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-iclb1/igt@i915_pm_dc@dc6-dpms.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3920/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-apl:          [PASS][21] -> [DMESG-WARN][22] ([i915#180]) +2 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-apl2/igt@i915_suspend@fence-restore-tiled2untiled.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3920/shard-apl1/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-pwrite:
    - shard-tglb:         [PASS][23] -> [FAIL][24] ([i915#49])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-tglb4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-pwrite.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3920/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [PASS][25] -> [SKIP][26] ([fdo#109642] / [fdo#111068])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3920/shard-iclb6/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [PASS][27] -> [SKIP][28] ([fdo#109441])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3920/shard-iclb1/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_setmode@basic:
    - shard-hsw:          [PASS][29] -> [FAIL][30] ([i915#31])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-hsw2/igt@kms_setmode@basic.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3920/shard-hsw1/igt@kms_setmode@basic.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@bcs0-s3:
    - shard-apl:          [DMESG-WARN][31] ([i915#180]) -> [PASS][32] +2 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-apl1/igt@gem_ctx_isolation@bcs0-s3.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3920/shard-apl7/igt@gem_ctx_isolation@bcs0-s3.html

  * igt@gem_ctx_isolation@vecs0-s3:
    - shard-iclb:         [DMESG-WARN][33] ([fdo#111764]) -> [PASS][34] +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-iclb8/igt@gem_ctx_isolation@vecs0-s3.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3920/shard-iclb8/igt@gem_ctx_isolation@vecs0-s3.html

  * igt@gem_ctx_persistence@vcs1-queued:
    - shard-iclb:         [SKIP][35] ([fdo#109276] / [fdo#112080]) -> [PASS][36] +2 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-iclb8/igt@gem_ctx_persistence@vcs1-queued.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3920/shard-iclb4/igt@gem_ctx_persistence@vcs1-queued.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [SKIP][37] ([fdo#110854]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-iclb5/igt@gem_exec_balancer@smoke.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3920/shard-iclb4/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_create@madvise:
    - shard-tglb:         [INCOMPLETE][39] ([i915#472]) -> [PASS][40] +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-tglb8/igt@gem_exec_create@madvise.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3920/shard-tglb7/igt@gem_exec_create@madvise.html

  * igt@gem_exec_schedule@independent-bsd2:
    - shard-iclb:         [SKIP][41] ([fdo#109276]) -> [PASS][42] +13 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-iclb3/igt@gem_exec_schedule@independent-bsd2.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3920/shard-iclb4/igt@gem_exec_schedule@independent-bsd2.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [SKIP][43] ([i915#677]) -> [PASS][44] +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-iclb2/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3920/shard-iclb6/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@preempt-queue-contexts-chain-bsd:
    - shard-iclb:         [SKIP][45] ([fdo#112146]) -> [PASS][46] +2 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-iclb1/igt@gem_exec_schedule@preempt-queue-contexts-chain-bsd.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3920/shard-iclb6/igt@gem_exec_schedule@preempt-queue-contexts-chain-bsd.html

  * igt@gem_exec_schedule@smoketest-bsd1:
    - shard-tglb:         [INCOMPLETE][47] ([i915#463] / [i915#472]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-tglb6/igt@gem_exec_schedule@smoketest-bsd1.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3920/shard-tglb4/igt@gem_exec_schedule@smoketest-bsd1.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-tglb:         [INCOMPLETE][49] ([fdo#111736] / [i915#460] / [i915#472]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-tglb3/igt@gem_exec_suspend@basic-s3.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3920/shard-tglb1/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrash-inactive:
    - shard-glk:          [TIMEOUT][51] ([fdo#112271] / [i915#530]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-glk9/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrash-inactive.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3920/shard-glk2/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrash-inactive.html

  * igt@gem_pwrite@self:
    - shard-snb:          [DMESG-WARN][53] ([i915#478]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-snb1/igt@gem_pwrite@self.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3920/shard-snb2/igt@gem_pwrite@self.html

  * igt@gem_sync@basic-many-each:
    - shard-tglb:         [INCOMPLETE][55] ([i915#472] / [i915#707]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-tglb3/igt@gem_sync@basic-many-each.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3920/shard-tglb1/igt@gem_sync@basic-many-each.html

  * igt@gem_tiled_blits@normal:
    - shard-tglb:         [INCOMPLETE][57] -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-tglb2/igt@gem_tiled_blits@normal.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3920/shard-tglb8/igt@gem_tiled_blits@normal.html

  * {igt@i915_pm_rc6_residency@rc6-idle}:
    - shard-snb:          [FAIL][59] ([i915#973]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-snb2/igt@i915_pm_rc6_residency@rc6-idle.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3920/shard-snb6/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rps@reset:
    - shard-iclb:         [FAIL][61] ([i915#413]) -> [PASS][62] +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-iclb6/igt@i915_pm_rps@reset.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3920/shard-iclb6/igt@i915_pm_rps@reset.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][63] ([i915#180]) -> [PASS][64] +8 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3920/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render:
    - shard-tglb:         [FAIL][65] ([i915#49]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-tglb4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3920/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-fullscreen:
    - shard-tglb:         [DMESG-FAIL][67] ([i915#402]) -> [PASS][68] +2 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-fullscreen.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3920/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-pipe-b:
    - shard-snb:          [SKIP][69] ([fdo#109271]) -> [PASS][70] +2 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-snb2/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-b.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3920/shard-snb1/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-b.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-kbl:          [INCOMPLETE][71] ([fdo#103665]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-kbl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3920/shard-kbl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_psr@primary_blt:
    - shard-tglb:         [DMESG-WARN][73] ([i915#402]) -> [PASS][74] +16 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-tglb5/igt@kms_psr@primary_blt.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3920/shard-tglb8/igt@kms_psr@primary_blt.html

  * igt@kms_psr@psr2_cursor_plane_onoff:
    - shard-iclb:         [SKIP][75] ([fdo#109441]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-iclb1/igt@kms_psr@psr2_cursor_plane_onoff.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3920/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html

  * igt@perf_pmu@busy-no-semaphores-vcs1:
    - shard-iclb:         [SKIP][77] ([fdo#112080]) -> [PASS][78] +15 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-iclb6/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3920/shard-iclb4/igt@perf_pmu@busy-no-semaphores-vcs1.html

  
#### Warnings ####

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-snb:          [DMESG-WARN][79] ([fdo#111870]) -> [DMESG-WARN][80] ([fdo#110789] / [fdo#111870])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-snb6/igt@gem_userptr_blits@dmabuf-unsync.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3920/shard-snb1/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy:
    - shard-snb:          [DMESG-WARN][81] ([fdo#110789] / [fdo#111870]) -> [DMESG-WARN][82] ([fdo#111870]) +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-snb4/igt@gem_userptr_blits@map-fixed-invalidate-busy.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3920/shard-snb5/igt@gem_userptr_blits@map-fixed-invalidate-busy.html

  * igt@kms_atomic_transition@3x-modeset-transitions-nonblocking:
    - shard-snb:          [SKIP][83] ([fdo#109271]) -> [SKIP][84] ([fdo#109271] / [i915#439])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-snb2/igt@kms_atomic_transition@3x-modeset-transitions-nonblocking.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3920/shard-snb4/igt@kms_atomic_transition@3x-modeset-transitions-nonblocking.html

  * igt@runner@aborted:
    - shard-iclb:         ([FAIL][85], [FAIL][86], [FAIL][87]) ([fdo#110275] / [fdo#111093]) -> ([FAIL][88], [FAIL][89]) ([fdo#111093])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-iclb8/igt@runner@aborted.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-iclb8/igt@runner@aborted.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-iclb2/igt@runner@aborted.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3920/shard-iclb8/igt@runner@aborted.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3920/shard-iclb8/igt@runner@aborted.html
    - shard-snb:          ([FAIL][90], [FAIL][91]) ([i915#436] / [i915#974]) -> [FAIL][92] ([i915#974])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-snb1/igt@runner@aborted.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-snb5/igt@runner@aborted.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3920/shard-snb5/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110275]: https://bugs.freedesktop.org/show_bug.cgi?id=110275
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111093]: https://bugs.freedesktop.org/show_bug.cgi?id=111093
  [fdo#111736]: https://bugs.freedesktop.org/show_bug.cgi?id=111736
  [fdo#111764]: https://bugs.freedesktop.org/show_bug.cgi?id=111764
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#436]: https://gitlab.freedesktop.org/drm/intel/issues/436
  [i915#439]: https://gitlab.freedesktop.org/drm/intel/issues/439
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#460]: https://gitlab.freedesktop.org/drm/intel/issues/460
  [i915#461]: https://gitlab.freedesktop.org/drm/intel/issues/461
  [i915#463]: https://gitlab.freedesktop.org/drm/intel/issues/463
  [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#530]: https://gitlab.freedesktop.org/drm/intel/issues/530
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#707]: https://gitlab.freedesktop.org/drm/intel/issues/707
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#973]: https://gitlab.freedesktop.org/drm/intel/issues/973
  [i915#974]: https://gitlab.freedesktop.org/drm/intel/issues/974


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-hsw-4770r 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5364 -> IGTPW_3920
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7737: 2a331333791d2e499ac843e1dc25cd8ea5bdc81f @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3920: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3920/index.html
  IGT_5364: b7cb6ffdb65cbd233f5ddee2f2dabf97b34fa640 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3920/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
