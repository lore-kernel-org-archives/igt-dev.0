Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 05 Mar 2020 07:01:36 -0000
Message-ID: <158339169644.17236.556818533199367251@emeril.freedesktop.org>
References: <20200304121044.26908-1-petri.latvala@intel.com>
In-Reply-To: <20200304121044.26908-1-petri.latvala@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3Igc2NyaXB0?=
 =?utf-8?q?s/verify-blacklist=3A_Script_for_checking_blacklist_files?=
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
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: scripts/verify-blacklist: Script for checking blacklist files
URL   : https://patchwork.freedesktop.org/series/74263/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8063_full -> IGTPW_4256_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4256/index.html

Known issues
------------

  Here are the changes found in IGTPW_4256_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [PASS][1] -> [SKIP][2] ([fdo#112080]) +11 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8063/shard-iclb1/igt@gem_busy@busy-vcs1.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4256/shard-iclb5/igt@gem_busy@busy-vcs1.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#110854])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8063/shard-iclb1/igt@gem_exec_balancer@smoke.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4256/shard-iclb6/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_schedule@fifo-bsd:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#112146]) +3 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8063/shard-iclb7/igt@gem_exec_schedule@fifo-bsd.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4256/shard-iclb1/igt@gem_exec_schedule@fifo-bsd.html

  * igt@gem_exec_schedule@implicit-both-bsd1:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#109276] / [i915#677]) +2 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8063/shard-iclb4/igt@gem_exec_schedule@implicit-both-bsd1.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4256/shard-iclb7/igt@gem_exec_schedule@implicit-both-bsd1.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([i915#677])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8063/shard-iclb5/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4256/shard-iclb4/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [PASS][11] -> [FAIL][12] ([i915#644])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8063/shard-glk1/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4256/shard-glk7/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_set_tiling_vs_blt@untiled-to-tiled:
    - shard-hsw:          [PASS][13] -> [DMESG-WARN][14] ([i915#478])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8063/shard-hsw5/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4256/shard-hsw8/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html

  * igt@i915_pm_rpm@dpms-non-lpsp:
    - shard-glk:          [PASS][15] -> [SKIP][16] ([fdo#109271])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8063/shard-glk3/igt@i915_pm_rpm@dpms-non-lpsp.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4256/shard-glk1/igt@i915_pm_rpm@dpms-non-lpsp.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [PASS][17] -> [DMESG-WARN][18] ([i915#180]) +3 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8063/shard-kbl6/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4256/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-apl:          [PASS][19] -> [INCOMPLETE][20] ([fdo#103927])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8063/shard-apl3/igt@kms_flip@flip-vs-suspend.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4256/shard-apl6/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-render:
    - shard-snb:          [PASS][21] -> [DMESG-WARN][22] ([i915#478])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8063/shard-snb2/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-render.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4256/shard-snb4/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-render.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [PASS][23] -> [SKIP][24] ([fdo#109642] / [fdo#111068])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8063/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4256/shard-iclb7/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][25] -> [SKIP][26] ([fdo#109441]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8063/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4256/shard-iclb3/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-apl:          [PASS][27] -> [DMESG-WARN][28] ([i915#180]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8063/shard-apl3/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4256/shard-apl6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [PASS][29] -> [FAIL][30] ([i915#1085])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8063/shard-tglb7/igt@perf@gen12-mi-rpc.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4256/shard-tglb7/igt@perf@gen12-mi-rpc.html

  * igt@perf_pmu@busy-idle-bcs0:
    - shard-kbl:          [PASS][31] -> [INCOMPLETE][32] ([fdo#103665])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8063/shard-kbl3/igt@perf_pmu@busy-idle-bcs0.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4256/shard-kbl3/igt@perf_pmu@busy-idle-bcs0.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [PASS][33] -> [SKIP][34] ([fdo#109276]) +17 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8063/shard-iclb4/igt@prime_busy@hang-bsd2.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4256/shard-iclb3/igt@prime_busy@hang-bsd2.html

  
#### Possible fixes ####

  * igt@gem_exec_schedule@pi-shared-iova-bsd:
    - shard-iclb:         [SKIP][35] ([i915#677]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8063/shard-iclb2/igt@gem_exec_schedule@pi-shared-iova-bsd.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4256/shard-iclb6/igt@gem_exec_schedule@pi-shared-iova-bsd.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [SKIP][37] ([fdo#112146]) -> [PASS][38] +8 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8063/shard-iclb4/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4256/shard-iclb6/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-tglb:         [FAIL][39] ([i915#644]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8063/shard-tglb1/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4256/shard-tglb5/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@i915_pm_rpm@fences:
    - shard-hsw:          [DMESG-WARN][41] ([i915#478]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8063/shard-hsw5/igt@i915_pm_rpm@fences.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4256/shard-hsw1/igt@i915_pm_rpm@fences.html

  * igt@i915_pm_rps@reset:
    - shard-iclb:         [FAIL][43] ([i915#413]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8063/shard-iclb1/igt@i915_pm_rps@reset.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4256/shard-iclb1/igt@i915_pm_rps@reset.html

  * igt@i915_suspend@sysfs-reader:
    - shard-apl:          [DMESG-WARN][45] ([i915#180]) -> [PASS][46] +3 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8063/shard-apl1/igt@i915_suspend@sysfs-reader.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4256/shard-apl7/igt@i915_suspend@sysfs-reader.html
    - shard-kbl:          [DMESG-WARN][47] ([i915#180]) -> [PASS][48] +2 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8063/shard-kbl2/igt@i915_suspend@sysfs-reader.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4256/shard-kbl7/igt@i915_suspend@sysfs-reader.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-glk:          [FAIL][49] ([i915#72]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8063/shard-glk6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4256/shard-glk5/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-glk:          [FAIL][51] ([i915#79]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8063/shard-glk4/igt@kms_flip@flip-vs-expired-vblank.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4256/shard-glk5/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-snb:          [DMESG-WARN][53] ([i915#42]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8063/shard-snb6/igt@kms_flip@flip-vs-suspend.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4256/shard-snb4/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-cpu:
    - shard-snb:          [DMESG-WARN][55] ([i915#478]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8063/shard-snb6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-cpu.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4256/shard-snb5/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_psr@psr2_dpms:
    - shard-iclb:         [SKIP][57] ([fdo#109441]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8063/shard-iclb1/igt@kms_psr@psr2_dpms.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4256/shard-iclb2/igt@kms_psr@psr2_dpms.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][59] ([i915#31]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8063/shard-apl2/igt@kms_setmode@basic.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4256/shard-apl7/igt@kms_setmode@basic.html

  * igt@perf_pmu@busy-no-semaphores-vcs1:
    - shard-iclb:         [SKIP][61] ([fdo#112080]) -> [PASS][62] +10 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8063/shard-iclb6/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4256/shard-iclb2/igt@perf_pmu@busy-no-semaphores-vcs1.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [SKIP][63] ([fdo#109276]) -> [PASS][64] +9 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8063/shard-iclb7/igt@prime_vgem@fence-wait-bsd2.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4256/shard-iclb2/igt@prime_vgem@fence-wait-bsd2.html

  
#### Warnings ####

  * igt@gem_userptr_blits@sync-unmap:
    - shard-snb:          [DMESG-WARN][65] ([fdo#111870] / [i915#478]) -> [DMESG-WARN][66] ([fdo#110789] / [fdo#111870] / [i915#478])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8063/shard-snb5/igt@gem_userptr_blits@sync-unmap.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4256/shard-snb4/igt@gem_userptr_blits@sync-unmap.html
    - shard-hsw:          [DMESG-WARN][67] ([fdo#111870]) -> [DMESG-WARN][68] ([fdo#110789] / [fdo#111870])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8063/shard-hsw7/igt@gem_userptr_blits@sync-unmap.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4256/shard-hsw6/igt@gem_userptr_blits@sync-unmap.html

  * igt@i915_pm_rpm@dpms-non-lpsp:
    - shard-tglb:         [SKIP][69] ([fdo#111644]) -> [SKIP][70] ([i915#1316])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8063/shard-tglb1/igt@i915_pm_rpm@dpms-non-lpsp.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4256/shard-tglb3/igt@i915_pm_rpm@dpms-non-lpsp.html
    - shard-iclb:         [SKIP][71] ([fdo#110892]) -> [SKIP][72] ([i915#1316])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8063/shard-iclb6/igt@i915_pm_rpm@dpms-non-lpsp.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4256/shard-iclb3/igt@i915_pm_rpm@dpms-non-lpsp.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-kbl:          [DMESG-WARN][73] ([i915#180]) -> [TIMEOUT][74] ([i915#1284])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8063/shard-kbl6/igt@kms_flip@flip-vs-suspend.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4256/shard-kbl3/igt@kms_flip@flip-vs-suspend.html

  * igt@runner@aborted:
    - shard-hsw:          ([FAIL][75], [FAIL][76], [FAIL][77], [FAIL][78], [FAIL][79], [FAIL][80]) ([fdo#111870] / [i915#226]) -> ([FAIL][81], [FAIL][82], [FAIL][83], [FAIL][84], [FAIL][85], [FAIL][86], [FAIL][87], [FAIL][88], [FAIL][89]) ([fdo#111870] / [i915#478])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8063/shard-hsw7/igt@runner@aborted.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8063/shard-hsw5/igt@runner@aborted.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8063/shard-hsw1/igt@runner@aborted.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8063/shard-hsw7/igt@runner@aborted.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8063/shard-hsw1/igt@runner@aborted.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8063/shard-hsw5/igt@runner@aborted.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4256/shard-hsw7/igt@runner@aborted.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4256/shard-hsw7/igt@runner@aborted.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4256/shard-hsw7/igt@runner@aborted.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4256/shard-hsw8/igt@runner@aborted.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4256/shard-hsw6/igt@runner@aborted.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4256/shard-hsw8/igt@runner@aborted.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4256/shard-hsw6/igt@runner@aborted.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4256/shard-hsw8/igt@runner@aborted.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4256/shard-hsw8/igt@runner@aborted.html

  
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#110892]: https://bugs.freedesktop.org/show_bug.cgi?id=110892
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
  [i915#1284]: https://gitlab.freedesktop.org/drm/intel/issues/1284
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#226]: https://gitlab.freedesktop.org/drm/intel/issues/226
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#42]: https://gitlab.freedesktop.org/drm/intel/issues/42
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5490 -> IGTPW_4256
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8063: cbce60ed8bb473eb6cdbdba9fc4e005a39a6926e @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4256: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4256/index.html
  IGT_5490: f98b33cbd5b57bae52b8e2fae2039e89ac877822 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4256/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
