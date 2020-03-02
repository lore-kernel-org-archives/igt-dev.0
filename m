Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 02 Mar 2020 23:31:55 -0000
Message-ID: <158319191568.30644.15594568056175423841@emeril.freedesktop.org>
References: <20200302103152.1780202-1-lionel.g.landwerlin@intel.com>
In-Reply-To: <20200302103152.1780202-1-lionel.g.landwerlin@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?perf=3A_add_global_sseu_parameter_tests_=28rev2=29?=
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
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/perf: add global sseu parameter tests (rev2)
URL   : https://patchwork.freedesktop.org/series/74111/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8042_full -> IGTPW_4244_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4244/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4244_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@perf@global-sseu-config} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][1] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4244/shard-iclb5/igt@perf@global-sseu-config.html
    - shard-tglb:         NOTRUN -> [SKIP][2] +1 similar issue
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4244/shard-tglb6/igt@perf@global-sseu-config.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8042_full and IGTPW_4244_full:

### New IGT tests (2) ###

  * igt@perf@global-sseu-config:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@perf@global-sseu-config-invalid:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_4244_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@close-race:
    - shard-tglb:         [PASS][3] -> [INCOMPLETE][4] ([i915#977])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8042/shard-tglb8/igt@gem_busy@close-race.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4244/shard-tglb6/igt@gem_busy@close-race.html

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#112080]) +14 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8042/shard-iclb4/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4244/shard-iclb8/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#110841])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8042/shard-iclb7/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4244/shard-iclb4/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_schedule@implicit-write-read-bsd1:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#109276] / [i915#677]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8042/shard-iclb2/igt@gem_exec_schedule@implicit-write-read-bsd1.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4244/shard-iclb6/igt@gem_exec_schedule@implicit-write-read-bsd1.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([i915#677]) +2 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8042/shard-iclb7/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4244/shard-iclb1/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@preempt-contexts-bsd2:
    - shard-iclb:         [PASS][13] -> [SKIP][14] ([fdo#109276]) +18 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8042/shard-iclb2/igt@gem_exec_schedule@preempt-contexts-bsd2.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4244/shard-iclb6/igt@gem_exec_schedule@preempt-contexts-bsd2.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [PASS][15] -> [SKIP][16] ([fdo#112146]) +5 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8042/shard-iclb6/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4244/shard-iclb1/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@i915_pm_rps@reset:
    - shard-iclb:         [PASS][17] -> [FAIL][18] ([i915#413])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8042/shard-iclb5/igt@i915_pm_rps@reset.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4244/shard-iclb2/igt@i915_pm_rps@reset.html

  * igt@i915_suspend@sysfs-reader:
    - shard-apl:          [PASS][19] -> [DMESG-WARN][20] ([i915#180]) +2 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8042/shard-apl1/igt@i915_suspend@sysfs-reader.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4244/shard-apl6/igt@i915_suspend@sysfs-reader.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [PASS][21] -> [FAIL][22] ([i915#72])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8042/shard-glk6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4244/shard-glk8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-glk:          [PASS][23] -> [FAIL][24] ([i915#978])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8042/shard-glk1/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4244/shard-glk2/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-tglb:         [PASS][25] -> [SKIP][26] ([i915#668]) +2 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8042/shard-tglb2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4244/shard-tglb5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:
    - shard-kbl:          [PASS][27] -> [DMESG-WARN][28] ([i915#180]) +2 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8042/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4244/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [PASS][29] -> [SKIP][30] ([fdo#109642] / [fdo#111068])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8042/shard-iclb2/igt@kms_psr2_su@page_flip.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4244/shard-iclb6/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [PASS][31] -> [SKIP][32] ([fdo#109441]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8042/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4244/shard-iclb7/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm:
    - shard-tglb:         [PASS][33] -> [SKIP][34] ([fdo#112015])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8042/shard-tglb6/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4244/shard-tglb2/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html
    - shard-iclb:         [PASS][35] -> [SKIP][36] ([fdo#109278])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8042/shard-iclb6/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4244/shard-iclb2/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html
    - shard-glk:          [PASS][37] -> [SKIP][38] ([fdo#109271])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8042/shard-glk9/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4244/shard-glk8/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html

  
#### Possible fixes ####

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [SKIP][39] ([i915#677]) -> [PASS][40] +2 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8042/shard-iclb2/igt@gem_exec_schedule@pi-common-bsd.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4244/shard-iclb8/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_schedule@reorder-wide-bsd:
    - shard-iclb:         [SKIP][41] ([fdo#112146]) -> [PASS][42] +7 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8042/shard-iclb4/igt@gem_exec_schedule@reorder-wide-bsd.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4244/shard-iclb6/igt@gem_exec_schedule@reorder-wide-bsd.html

  * igt@gem_exec_whisper@basic-queues-forked:
    - shard-tglb:         [INCOMPLETE][43] ([i915#750]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8042/shard-tglb7/igt@gem_exec_whisper@basic-queues-forked.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4244/shard-tglb6/igt@gem_exec_whisper@basic-queues-forked.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-apl:          [FAIL][45] ([i915#644]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8042/shard-apl3/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4244/shard-apl7/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [DMESG-WARN][47] ([i915#716]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8042/shard-glk2/igt@gen9_exec_parse@allowed-all.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4244/shard-glk8/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_rpm@debugfs-forcewake-user:
    - shard-hsw:          [SKIP][49] ([fdo#109271]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8042/shard-hsw5/igt@i915_pm_rpm@debugfs-forcewake-user.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4244/shard-hsw6/igt@i915_pm_rpm@debugfs-forcewake-user.html
    - shard-iclb:         [SKIP][51] ([i915#1316]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8042/shard-iclb8/igt@i915_pm_rpm@debugfs-forcewake-user.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4244/shard-iclb8/igt@i915_pm_rpm@debugfs-forcewake-user.html
    - shard-tglb:         [SKIP][53] ([i915#1316]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8042/shard-tglb2/igt@i915_pm_rpm@debugfs-forcewake-user.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4244/shard-tglb2/igt@i915_pm_rpm@debugfs-forcewake-user.html
    - shard-glk:          [SKIP][55] ([fdo#109271]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8042/shard-glk6/igt@i915_pm_rpm@debugfs-forcewake-user.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4244/shard-glk5/igt@i915_pm_rpm@debugfs-forcewake-user.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][57] ([i915#180]) -> [PASS][58] +3 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8042/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4244/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-b-cursor-128x42-sliding:
    - shard-apl:          [FAIL][59] ([i915#54]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8042/shard-apl8/igt@kms_cursor_crc@pipe-b-cursor-128x42-sliding.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4244/shard-apl6/igt@kms_cursor_crc@pipe-b-cursor-128x42-sliding.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-apl:          [DMESG-WARN][61] ([i915#180]) -> [PASS][62] +2 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8042/shard-apl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4244/shard-apl3/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-pwrite:
    - shard-glk:          [FAIL][63] ([i915#49]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8042/shard-glk4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-pwrite.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4244/shard-glk3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [FAIL][65] ([i915#173]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8042/shard-iclb1/igt@kms_psr@no_drrs.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4244/shard-iclb5/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [SKIP][67] ([fdo#109441]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8042/shard-iclb8/igt@kms_psr@psr2_no_drrs.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4244/shard-iclb2/igt@kms_psr@psr2_no_drrs.html

  * {igt@perf@stress-open-close}:
    - shard-glk:          [INCOMPLETE][69] ([i915#1356] / [i915#58] / [k.org#198133]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8042/shard-glk8/igt@perf@stress-open-close.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4244/shard-glk4/igt@perf@stress-open-close.html

  * igt@perf_pmu@busy-no-semaphores-vcs1:
    - shard-iclb:         [SKIP][71] ([fdo#112080]) -> [PASS][72] +9 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8042/shard-iclb7/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4244/shard-iclb4/igt@perf_pmu@busy-no-semaphores-vcs1.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [SKIP][73] ([fdo#109276]) -> [PASS][74] +16 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8042/shard-iclb5/igt@prime_vgem@fence-wait-bsd2.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4244/shard-iclb2/igt@prime_vgem@fence-wait-bsd2.html

  
#### Warnings ####

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
    - shard-snb:          [DMESG-WARN][75] ([fdo#110789] / [fdo#111870] / [i915#478]) -> [DMESG-WARN][76] ([fdo#111870] / [i915#478])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8042/shard-snb2/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4244/shard-snb2/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html
    - shard-hsw:          [DMESG-WARN][77] ([fdo#110789] / [fdo#111870]) -> [DMESG-WARN][78] ([fdo#111870])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8042/shard-hsw6/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4244/shard-hsw6/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-kbl:          [INCOMPLETE][79] ([fdo#103665]) -> [DMESG-WARN][80] ([i915#180])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8042/shard-kbl6/igt@i915_suspend@fence-restore-untiled.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4244/shard-kbl3/igt@i915_suspend@fence-restore-untiled.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [SKIP][81] ([fdo#109349]) -> [DMESG-WARN][82] ([i915#1226])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8042/shard-iclb8/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4244/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@runner@aborted:
    - shard-hsw:          ([FAIL][83], [FAIL][84], [FAIL][85], [FAIL][86], [FAIL][87], [FAIL][88], [FAIL][89], [FAIL][90], [FAIL][91]) ([fdo#111870] / [i915#1356]) -> ([FAIL][92], [FAIL][93], [FAIL][94], [FAIL][95], [FAIL][96], [FAIL][97], [FAIL][98], [FAIL][99], [FAIL][100]) ([fdo#111870])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8042/shard-hsw1/igt@runner@aborted.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8042/shard-hsw6/igt@runner@aborted.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8042/shard-hsw1/igt@runner@aborted.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8042/shard-hsw4/igt@runner@aborted.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8042/shard-hsw4/igt@runner@aborted.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8042/shard-hsw5/igt@runner@aborted.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8042/shard-hsw6/igt@runner@aborted.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8042/shard-hsw6/igt@runner@aborted.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8042/shard-hsw6/igt@runner@aborted.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4244/shard-hsw6/igt@runner@aborted.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4244/shard-hsw6/igt@runner@aborted.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4244/shard-hsw6/igt@runner@aborted.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4244/shard-hsw1/igt@runner@aborted.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4244/shard-hsw6/igt@runner@aborted.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4244/shard-hsw1/igt@runner@aborted.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4244/shard-hsw1/igt@runner@aborted.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4244/shard-hsw6/igt@runner@aborted.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4244/shard-hsw1/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112015]: https://bugs.freedesktop.org/show_bug.cgi?id=112015
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1226]: https://gitlab.freedesktop.org/drm/intel/issues/1226
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1356]: https://gitlab.freedesktop.org/drm/intel/issues/1356
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#750]: https://gitlab.freedesktop.org/drm/intel/issues/750
  [i915#977]: https://gitlab.freedesktop.org/drm/intel/issues/977
  [i915#978]: https://gitlab.freedesktop.org/drm/intel/issues/978
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5483 -> IGTPW_4244
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8042: d8191f679bee7619af0f3ec5b1848376a4cdab40 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4244: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4244/index.html
  IGT_5483: 1707153df224ffb6333c6c660a792b7f334eb3d3 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4244/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
