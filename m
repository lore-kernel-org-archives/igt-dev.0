Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 21 Feb 2020 06:33:26 -0000
Message-ID: <158226680655.7919.2581680322887137019@emeril.freedesktop.org>
References: <20200219133855.67829-1-emil.l.velikov@gmail.com>
In-Reply-To: <20200219133855.67829-1-emil.l.velikov@gmail.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdHMvY29y?=
 =?utf-8?q?e=5Fsetmaster=3A_new_test_for_drop/set_master_semantics?=
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
To: Emil Velikov <emil.l.velikov@gmail.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: ts/core_setmaster: new test for drop/set master semantics
URL   : https://patchwork.freedesktop.org/series/73650/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7964_full -> IGTPW_4185_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4185_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4185_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4185/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4185_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@core_setmaster@master-drop-set-user} (NEW):
    - shard-iclb:         NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4185/shard-iclb1/igt@core_setmaster@master-drop-set-user.html
    - shard-kbl:          NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4185/shard-kbl6/igt@core_setmaster@master-drop-set-user.html
    - shard-snb:          NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4185/shard-snb1/igt@core_setmaster@master-drop-set-user.html
    - shard-tglb:         NOTRUN -> [FAIL][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4185/shard-tglb2/igt@core_setmaster@master-drop-set-user.html
    - shard-apl:          NOTRUN -> [FAIL][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4185/shard-apl2/igt@core_setmaster@master-drop-set-user.html
    - shard-glk:          NOTRUN -> [FAIL][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4185/shard-glk7/igt@core_setmaster@master-drop-set-user.html
    - shard-hsw:          NOTRUN -> [FAIL][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4185/shard-hsw2/igt@core_setmaster@master-drop-set-user.html

  * igt@gem_exec_balancer@hang:
    - shard-iclb:         [PASS][8] -> [FAIL][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7964/shard-iclb4/igt@gem_exec_balancer@hang.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4185/shard-iclb4/igt@gem_exec_balancer@hang.html

  
#### Warnings ####

  * igt@gem_exec_async@concurrent-writes-bsd:
    - shard-tglb:         [SKIP][10] ([fdo#112146]) -> [INCOMPLETE][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7964/shard-tglb3/igt@gem_exec_async@concurrent-writes-bsd.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4185/shard-tglb6/igt@gem_exec_async@concurrent-writes-bsd.html

  
New tests
---------

  New tests have been introduced between CI_DRM_7964_full and IGTPW_4185_full:

### New IGT tests (3) ###

  * igt@core_setmaster@master-drop-set-root:
    - Statuses : 7 pass(s)
    - Exec time: [0.01, 0.02] s

  * igt@core_setmaster@master-drop-set-shared-fd:
    - Statuses : 7 pass(s)
    - Exec time: [0.01, 0.03] s

  * igt@core_setmaster@master-drop-set-user:
    - Statuses : 7 fail(s)
    - Exec time: [0.01, 0.07] s

  

Known issues
------------

  Here are the changes found in IGTPW_4185_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [PASS][12] -> [SKIP][13] ([fdo#110854])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7964/shard-iclb1/igt@gem_exec_balancer@smoke.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4185/shard-iclb7/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_schedule@in-order-bsd:
    - shard-iclb:         [PASS][14] -> [SKIP][15] ([fdo#112146]) +5 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7964/shard-iclb6/igt@gem_exec_schedule@in-order-bsd.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4185/shard-iclb1/igt@gem_exec_schedule@in-order-bsd.html

  * igt@gem_exec_schedule@promotion-bsd1:
    - shard-iclb:         [PASS][16] -> [SKIP][17] ([fdo#109276]) +15 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7964/shard-iclb4/igt@gem_exec_schedule@promotion-bsd1.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4185/shard-iclb3/igt@gem_exec_schedule@promotion-bsd1.html

  * igt@gem_partial_pwrite_pread@write:
    - shard-hsw:          [PASS][18] -> [FAIL][19] ([i915#694])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7964/shard-hsw2/igt@gem_partial_pwrite_pread@write.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4185/shard-hsw7/igt@gem_partial_pwrite_pread@write.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-kbl:          [PASS][20] -> [FAIL][21] ([i915#644])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7964/shard-kbl7/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4185/shard-kbl2/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@i915_pm_dc@dc5-dpms:
    - shard-iclb:         [PASS][22] -> [FAIL][23] ([i915#447])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7964/shard-iclb4/igt@i915_pm_dc@dc5-dpms.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4185/shard-iclb3/igt@i915_pm_dc@dc5-dpms.html

  * igt@i915_pm_rps@reset:
    - shard-iclb:         [PASS][24] -> [FAIL][25] ([i915#413]) +1 similar issue
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7964/shard-iclb1/igt@i915_pm_rps@reset.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4185/shard-iclb1/igt@i915_pm_rps@reset.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-snb:          [PASS][26] -> [DMESG-WARN][27] ([i915#478])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7964/shard-snb4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4185/shard-snb4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [PASS][28] -> [DMESG-WARN][29] ([i915#180]) +3 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7964/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4185/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-suspend.html
    - shard-apl:          [PASS][30] -> [DMESG-WARN][31] ([i915#180]) +2 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7964/shard-apl7/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4185/shard-apl4/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_psr@no_drrs:
    - shard-tglb:         [PASS][32] -> [SKIP][33] ([i915#668]) +2 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7964/shard-tglb8/igt@kms_psr@no_drrs.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4185/shard-tglb2/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_cursor_plane_onoff:
    - shard-iclb:         [PASS][34] -> [SKIP][35] ([fdo#109441]) +2 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7964/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4185/shard-iclb5/igt@kms_psr@psr2_cursor_plane_onoff.html

  * igt@perf_pmu@busy-check-all-vcs1:
    - shard-iclb:         [PASS][36] -> [SKIP][37] ([fdo#112080]) +11 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7964/shard-iclb4/igt@perf_pmu@busy-check-all-vcs1.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4185/shard-iclb7/igt@perf_pmu@busy-check-all-vcs1.html

  
#### Possible fixes ####

  * igt@gem_busy@close-race:
    - shard-hsw:          [TIMEOUT][38] ([fdo#112271] / [i915#1084]) -> [PASS][39]
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7964/shard-hsw1/igt@gem_busy@close-race.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4185/shard-hsw7/igt@gem_busy@close-race.html

  * {igt@gem_ctx_persistence@close-replace-race}:
    - shard-tglb:         [FAIL][40] ([i915#1241]) -> [PASS][41]
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7964/shard-tglb8/igt@gem_ctx_persistence@close-replace-race.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4185/shard-tglb2/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [SKIP][42] ([fdo#110841]) -> [PASS][43]
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7964/shard-iclb2/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4185/shard-iclb6/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [SKIP][44] ([fdo#112080]) -> [PASS][45] +12 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7964/shard-iclb7/igt@gem_exec_parallel@vcs1-fds.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4185/shard-iclb2/igt@gem_exec_parallel@vcs1-fds.html

  * {igt@gem_exec_schedule@implicit-both-bsd1}:
    - shard-iclb:         [SKIP][46] ([fdo#109276] / [i915#677]) -> [PASS][47] +1 similar issue
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7964/shard-iclb8/igt@gem_exec_schedule@implicit-both-bsd1.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4185/shard-iclb4/igt@gem_exec_schedule@implicit-both-bsd1.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [SKIP][48] ([i915#677]) -> [PASS][49] +2 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7964/shard-iclb2/igt@gem_exec_schedule@pi-common-bsd.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4185/shard-iclb8/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_schedule@preempt-contexts-bsd2:
    - shard-iclb:         [SKIP][50] ([fdo#109276]) -> [PASS][51] +17 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7964/shard-iclb6/igt@gem_exec_schedule@preempt-contexts-bsd2.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4185/shard-iclb1/igt@gem_exec_schedule@preempt-contexts-bsd2.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [SKIP][52] ([fdo#112146]) -> [PASS][53] +3 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7964/shard-iclb1/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4185/shard-iclb8/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_userptr_blits@sync-unmap-after-close:
    - shard-snb:          [DMESG-WARN][54] ([fdo#111870] / [i915#478]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7964/shard-snb1/igt@gem_userptr_blits@sync-unmap-after-close.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4185/shard-snb4/igt@gem_userptr_blits@sync-unmap-after-close.html

  * igt@i915_selftest@live_gt_lrc:
    - shard-tglb:         [INCOMPLETE][56] ([i915#1233]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7964/shard-tglb1/igt@i915_selftest@live_gt_lrc.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4185/shard-tglb6/igt@i915_selftest@live_gt_lrc.html

  * igt@i915_suspend@sysfs-reader:
    - shard-apl:          [DMESG-WARN][58] ([i915#180]) -> [PASS][59] +5 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7964/shard-apl6/igt@i915_suspend@sysfs-reader.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4185/shard-apl7/igt@i915_suspend@sysfs-reader.html

  * igt@kms_cursor_crc@pipe-b-cursor-128x42-sliding:
    - shard-kbl:          [FAIL][60] ([i915#54]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7964/shard-kbl1/igt@kms_cursor_crc@pipe-b-cursor-128x42-sliding.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4185/shard-kbl2/igt@kms_cursor_crc@pipe-b-cursor-128x42-sliding.html
    - shard-apl:          [FAIL][62] ([i915#54]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7964/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-128x42-sliding.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4185/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-128x42-sliding.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:
    - shard-kbl:          [DMESG-WARN][64] ([i915#180]) -> [PASS][65] +2 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7964/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4185/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [SKIP][66] ([fdo#109441]) -> [PASS][67] +1 similar issue
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7964/shard-iclb5/igt@kms_psr@psr2_primary_mmap_cpu.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4185/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@perf_pmu@cpu-hotplug:
    - shard-hsw:          [INCOMPLETE][68] ([i915#61]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7964/shard-hsw5/igt@perf_pmu@cpu-hotplug.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4185/shard-hsw2/igt@perf_pmu@cpu-hotplug.html

  
#### Warnings ####

  * igt@gem_userptr_blits@map-fixed-invalidate-busy:
    - shard-snb:          [DMESG-WARN][70] ([fdo#111870] / [i915#478]) -> [DMESG-WARN][71] ([fdo#110789] / [fdo#111870] / [i915#478])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7964/shard-snb1/igt@gem_userptr_blits@map-fixed-invalidate-busy.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4185/shard-snb1/igt@gem_userptr_blits@map-fixed-invalidate-busy.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [FAIL][72] ([i915#454]) -> [SKIP][73] ([i915#468])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7964/shard-tglb5/igt@i915_pm_dc@dc6-psr.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4185/shard-tglb2/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@sysfs-read:
    - shard-snb:          [SKIP][74] ([fdo#109271]) -> [INCOMPLETE][75] ([i915#82])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7964/shard-snb4/igt@i915_pm_rpm@sysfs-read.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4185/shard-snb2/igt@i915_pm_rpm@sysfs-read.html

  * igt@runner@aborted:
    - shard-snb:          ([FAIL][76], [FAIL][77], [FAIL][78], [FAIL][79], [FAIL][80], [FAIL][81], [FAIL][82], [FAIL][83]) ([fdo#111870] / [i915#1077]) -> ([FAIL][84], [FAIL][85], [FAIL][86], [FAIL][87], [FAIL][88], [FAIL][89], [FAIL][90], [FAIL][91]) ([fdo#111870] / [i915#1077] / [i915#698])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7964/shard-snb6/igt@runner@aborted.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7964/shard-snb1/igt@runner@aborted.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7964/shard-snb2/igt@runner@aborted.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7964/shard-snb2/igt@runner@aborted.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7964/shard-snb4/igt@runner@aborted.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7964/shard-snb1/igt@runner@aborted.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7964/shard-snb2/igt@runner@aborted.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7964/shard-snb4/igt@runner@aborted.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4185/shard-snb1/igt@runner@aborted.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4185/shard-snb1/igt@runner@aborted.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4185/shard-snb1/igt@runner@aborted.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4185/shard-snb4/igt@runner@aborted.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4185/shard-snb5/igt@runner@aborted.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4185/shard-snb5/igt@runner@aborted.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4185/shard-snb5/igt@runner@aborted.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4185/shard-snb5/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1077]: https://gitlab.freedesktop.org/drm/intel/issues/1077
  [i915#1084]: https://gitlab.freedesktop.org/drm/intel/issues/1084
  [i915#1233]: https://gitlab.freedesktop.org/drm/intel/issues/1233
  [i915#1241]: https://gitlab.freedesktop.org/drm/intel/issues/1241
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#447]: https://gitlab.freedesktop.org/drm/intel/issues/447
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#698]: https://gitlab.freedesktop.org/drm/intel/issues/698
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5450 -> IGTPW_4185
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7964: af0d76d734234d537d1ed6bebfc2f55c88ea2a49 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4185: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4185/index.html
  IGT_5450: dfba090e720ed4e043158887f1ba6a76059491e8 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4185/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
