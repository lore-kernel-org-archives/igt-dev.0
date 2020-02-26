Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 26 Feb 2020 18:49:09 -0000
Message-ID: <158274294908.21009.12060059967662355748@emeril.freedesktop.org>
References: <20200225165246.213606-1-arkadiusz.hiler@intel.com>
In-Reply-To: <20200225165246.213606-1-arkadiusz.hiler@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/9=5D_lib/tests=3A_Extract_fork_help?=
 =?utf-8?q?ers?=
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
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,1/9] lib/tests: Extract fork helpers
URL   : https://patchwork.freedesktop.org/series/73920/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5467_full -> IGTPW_4223_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4223_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4223_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4223/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4223_full:

### IGT changes ###

#### Possible regressions ####

  * igt@sw_sync@sync_multi_producer_single_consumer:
    - shard-tglb:         NOTRUN -> [TIMEOUT][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4223/shard-tglb1/igt@sw_sync@sync_multi_producer_single_consumer.html

  
#### Warnings ####

  * igt@i915_pm_rpm@modeset-non-lpsp-stress:
    - shard-tglb:         [SKIP][2] ([fdo#111644]) -> [SKIP][3]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-tglb3/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4223/shard-tglb2/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
    - shard-iclb:         [SKIP][4] ([fdo#110892]) -> [SKIP][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-iclb5/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4223/shard-iclb5/igt@i915_pm_rpm@modeset-non-lpsp-stress.html

  
Known issues
------------

  Here are the changes found in IGTPW_4223_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-kbl:          [PASS][6] -> [DMESG-WARN][7] ([i915#180]) +3 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-kbl6/igt@gem_ctx_isolation@rcs0-s3.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4223/shard-kbl7/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [PASS][8] -> [SKIP][9] ([fdo#110854])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-iclb4/igt@gem_exec_balancer@smoke.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4223/shard-iclb8/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_schedule@pi-userfault-bsd:
    - shard-iclb:         [PASS][10] -> [SKIP][11] ([i915#677])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-iclb7/igt@gem_exec_schedule@pi-userfault-bsd.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4223/shard-iclb1/igt@gem_exec_schedule@pi-userfault-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd1:
    - shard-iclb:         [PASS][12] -> [SKIP][13] ([fdo#109276]) +16 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-iclb4/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4223/shard-iclb8/igt@gem_exec_schedule@preempt-queue-bsd1.html

  * igt@gem_exec_schedule@reorder-wide-bsd:
    - shard-iclb:         [PASS][14] -> [SKIP][15] ([fdo#112146]) +4 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-iclb3/igt@gem_exec_schedule@reorder-wide-bsd.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4223/shard-iclb1/igt@gem_exec_schedule@reorder-wide-bsd.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-kbl:          [PASS][16] -> [FAIL][17] ([i915#644])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-kbl4/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4223/shard-kbl1/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-snb:          [PASS][18] -> [DMESG-WARN][19] ([fdo#111870] / [i915#478]) +1 similar issue
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-snb2/igt@gem_userptr_blits@sync-unmap-cycles.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4223/shard-snb2/igt@gem_userptr_blits@sync-unmap-cycles.html
    - shard-hsw:          [PASS][20] -> [DMESG-WARN][21] ([fdo#111870]) +1 similar issue
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-hsw6/igt@gem_userptr_blits@sync-unmap-cycles.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4223/shard-hsw4/igt@gem_userptr_blits@sync-unmap-cycles.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress:
    - shard-hsw:          [PASS][22] -> [SKIP][23] ([fdo#109271]) +2 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-hsw5/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4223/shard-hsw4/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
    - shard-glk:          [PASS][24] -> [SKIP][25] ([fdo#109271]) +2 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-glk5/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4223/shard-glk9/igt@i915_pm_rpm@modeset-non-lpsp-stress.html

  * igt@i915_pm_rps@waitboost:
    - shard-iclb:         [PASS][26] -> [FAIL][27] ([i915#413])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-iclb8/igt@i915_pm_rps@waitboost.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4223/shard-iclb5/igt@i915_pm_rps@waitboost.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-apl:          [PASS][28] -> [DMESG-WARN][29] ([i915#180]) +1 similar issue
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-apl4/igt@i915_suspend@fence-restore-tiled2untiled.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4223/shard-apl6/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-kbl:          [PASS][30] -> [INCOMPLETE][31] ([fdo#103665] / [i915#600])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-kbl3/igt@kms_flip@flip-vs-suspend.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4223/shard-kbl7/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_plane_lowres@pipe-a-tiling-y:
    - shard-glk:          [PASS][32] -> [FAIL][33] ([i915#899])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-glk3/igt@kms_plane_lowres@pipe-a-tiling-y.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4223/shard-glk1/igt@kms_plane_lowres@pipe-a-tiling-y.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [PASS][34] -> [SKIP][35] ([fdo#109441])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4223/shard-iclb3/igt@kms_psr@psr2_primary_page_flip.html

  * igt@perf_pmu@busy-check-all-vcs1:
    - shard-iclb:         [PASS][36] -> [SKIP][37] ([fdo#112080]) +9 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-iclb1/igt@perf_pmu@busy-check-all-vcs1.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4223/shard-iclb3/igt@perf_pmu@busy-check-all-vcs1.html

  * igt@perf_pmu@rc6-runtime-pm-long:
    - shard-iclb:         [PASS][38] -> [SKIP][39] ([i915#293])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-iclb3/igt@perf_pmu@rc6-runtime-pm-long.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4223/shard-iclb5/igt@perf_pmu@rc6-runtime-pm-long.html
    - shard-tglb:         [PASS][40] -> [SKIP][41] ([fdo#111719])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-tglb3/igt@perf_pmu@rc6-runtime-pm-long.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4223/shard-tglb2/igt@perf_pmu@rc6-runtime-pm-long.html

  
#### Possible fixes ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [SKIP][42] ([fdo#112080]) -> [PASS][43] +9 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-iclb5/igt@gem_busy@busy-vcs1.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4223/shard-iclb2/igt@gem_busy@busy-vcs1.html

  * {igt@gem_ctx_persistence@close-replace-race}:
    - shard-tglb:         [INCOMPLETE][44] ([i915#1291]) -> [PASS][45]
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-tglb6/igt@gem_ctx_persistence@close-replace-race.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4223/shard-tglb2/igt@gem_ctx_persistence@close-replace-race.html

  * {igt@gem_exec_schedule@implicit-read-write-bsd1}:
    - shard-iclb:         [SKIP][46] ([fdo#109276] / [i915#677]) -> [PASS][47] +1 similar issue
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-iclb5/igt@gem_exec_schedule@implicit-read-write-bsd1.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4223/shard-iclb2/igt@gem_exec_schedule@implicit-read-write-bsd1.html

  * igt@gem_exec_schedule@pi-common-bsd1:
    - shard-iclb:         [SKIP][48] ([fdo#109276]) -> [PASS][49] +19 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-iclb8/igt@gem_exec_schedule@pi-common-bsd1.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4223/shard-iclb1/igt@gem_exec_schedule@pi-common-bsd1.html

  * igt@gem_exec_schedule@pi-shared-iova-bsd:
    - shard-iclb:         [SKIP][50] ([i915#677]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-iclb2/igt@gem_exec_schedule@pi-shared-iova-bsd.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4223/shard-iclb7/igt@gem_exec_schedule@pi-shared-iova-bsd.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [SKIP][52] ([fdo#112146]) -> [PASS][53] +2 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-iclb4/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4223/shard-iclb8/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_mmap_offset@pf-nonblock:
    - shard-hsw:          [DMESG-WARN][54] -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-hsw6/igt@gem_mmap_offset@pf-nonblock.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4223/shard-hsw7/igt@gem_mmap_offset@pf-nonblock.html
    - shard-snb:          [DMESG-WARN][56] ([i915#478]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-snb2/igt@gem_mmap_offset@pf-nonblock.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4223/shard-snb2/igt@gem_mmap_offset@pf-nonblock.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [FAIL][58] ([i915#644]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-glk1/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4223/shard-glk2/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-kbl:          [DMESG-WARN][60] ([i915#180]) -> [PASS][61] +2 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-kbl3/igt@gem_workarounds@suspend-resume-fd.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4223/shard-kbl1/igt@gem_workarounds@suspend-resume-fd.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-180:
    - shard-kbl:          [DMESG-FAIL][62] ([i915#95]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-kbl6/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4223/shard-kbl7/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-apl:          [DMESG-WARN][64] ([i915#180]) -> [PASS][65] +2 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4223/shard-apl7/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-glk:          [FAIL][66] ([IGT#5] / [i915#697]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4223/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack:
    - shard-glk:          [FAIL][68] ([i915#49]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4223/shard-glk4/igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [SKIP][70] ([fdo#109441]) -> [PASS][71] +2 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-iclb7/igt@kms_psr@psr2_primary_mmap_cpu.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4223/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [FAIL][72] -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-tglb1/igt@perf@gen12-mi-rpc.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4223/shard-tglb1/igt@perf@gen12-mi-rpc.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [SKIP][74] ([fdo#112080]) -> [FAIL][75] ([IGT#28])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-iclb7/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4223/shard-iclb4/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy-gup:
    - shard-hsw:          [DMESG-WARN][76] ([fdo#110789] / [fdo#111870]) -> [DMESG-WARN][77] ([fdo#111870])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-hsw6/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4223/shard-hsw7/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup.html
    - shard-snb:          [DMESG-WARN][78] ([fdo#110789] / [fdo#111870] / [i915#478]) -> [DMESG-WARN][79] ([fdo#111870] / [i915#478])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-snb5/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4223/shard-snb2/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup.html

  * igt@i915_pm_rpm@dpms-non-lpsp:
    - shard-tglb:         [SKIP][80] ([fdo#111644]) -> [SKIP][81] ([i915#1316])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-tglb8/igt@i915_pm_rpm@dpms-non-lpsp.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4223/shard-tglb2/igt@i915_pm_rpm@dpms-non-lpsp.html
    - shard-iclb:         [SKIP][82] ([fdo#110892]) -> [SKIP][83] ([i915#1316])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-iclb7/igt@i915_pm_rpm@dpms-non-lpsp.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4223/shard-iclb5/igt@i915_pm_rpm@dpms-non-lpsp.html

  * igt@i915_selftest@live_gt_lrc:
    - shard-tglb:         [INCOMPLETE][84] ([i915#1233]) -> [DMESG-FAIL][85] ([i915#1233])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-tglb7/igt@i915_selftest@live_gt_lrc.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4223/shard-tglb3/igt@i915_selftest@live_gt_lrc.html

  * igt@kms_content_protection@srm:
    - shard-kbl:          [TIMEOUT][86] ([i915#1319]) -> [TIMEOUT][87] ([i915#1319] / [i915#727])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-kbl3/igt@kms_content_protection@srm.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4223/shard-kbl1/igt@kms_content_protection@srm.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-apl:          [DMESG-WARN][88] ([i915#180]) -> [INCOMPLETE][89] ([fdo#103927])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5467/shard-apl1/igt@kms_flip@flip-vs-suspend.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4223/shard-apl4/igt@kms_flip@flip-vs-suspend.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [IGT#5]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/5
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#110892]: https://bugs.freedesktop.org/show_bug.cgi?id=110892
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111719]: https://bugs.freedesktop.org/show_bug.cgi?id=111719
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1233]: https://gitlab.freedesktop.org/drm/intel/issues/1233
  [i915#1291]: https://gitlab.freedesktop.org/drm/intel/issues/1291
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#293]: https://gitlab.freedesktop.org/drm/intel/issues/293
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#600]: https://gitlab.freedesktop.org/drm/intel/issues/600
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#697]: https://gitlab.freedesktop.org/drm/intel/issues/697
  [i915#727]: https://gitlab.freedesktop.org/drm/intel/issues/727
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5467 -> IGTPW_4223

  CI-20190529: 20190529
  CI_DRM_8005: 81f641f60edbfa1ccb169689206f0af360a06e31 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4223: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4223/index.html
  IGT_5467: 2684f182424582c66e67bcbbda77cd60901627b8 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4223/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
