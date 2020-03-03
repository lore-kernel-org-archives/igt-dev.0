Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 03 Mar 2020 08:03:34 -0000
Message-ID: <158322261423.15377.10460713131544971853@emeril.freedesktop.org>
References: <20200302173314.378918-1-emil.l.velikov@gmail.com>
In-Reply-To: <20200302173314.378918-1-emil.l.velikov@gmail.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdHMvY29y?=
 =?utf-8?q?e=5Fsetmaster=3A_new_test_for_drop/set_master_semantics_=28rev3?=
 =?utf-8?q?=29?=
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

Series: ts/core_setmaster: new test for drop/set master semantics (rev3)
URL   : https://patchwork.freedesktop.org/series/73650/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8046_full -> IGTPW_4245_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4245_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4245_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4245/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4245_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@core_setmaster@master-drop-set-user} (NEW):
    - shard-iclb:         NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4245/shard-iclb8/igt@core_setmaster@master-drop-set-user.html
    - shard-kbl:          NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4245/shard-kbl6/igt@core_setmaster@master-drop-set-user.html
    - shard-snb:          NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4245/shard-snb2/igt@core_setmaster@master-drop-set-user.html
    - shard-tglb:         NOTRUN -> [FAIL][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4245/shard-tglb7/igt@core_setmaster@master-drop-set-user.html
    - shard-apl:          NOTRUN -> [FAIL][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4245/shard-apl8/igt@core_setmaster@master-drop-set-user.html
    - shard-glk:          NOTRUN -> [FAIL][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4245/shard-glk9/igt@core_setmaster@master-drop-set-user.html
    - shard-hsw:          NOTRUN -> [FAIL][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4245/shard-hsw5/igt@core_setmaster@master-drop-set-user.html

  * igt@perf@enable-disable:
    - shard-hsw:          [PASS][8] -> [FAIL][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8046/shard-hsw1/igt@perf@enable-disable.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4245/shard-hsw5/igt@perf@enable-disable.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8046_full and IGTPW_4245_full:

### New IGT tests (3) ###

  * igt@core_setmaster@master-drop-set-root:
    - Statuses : 5 pass(s)
    - Exec time: [0.01, 0.02] s

  * igt@core_setmaster@master-drop-set-shared-fd:
    - Statuses : 7 pass(s)
    - Exec time: [0.01, 0.03] s

  * igt@core_setmaster@master-drop-set-user:
    - Statuses : 7 fail(s)
    - Exec time: [0.01, 0.06] s

  

Known issues
------------

  Here are the changes found in IGTPW_4245_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-kbl:          [PASS][10] -> [DMESG-WARN][11] ([i915#180]) +6 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8046/shard-kbl7/igt@gem_ctx_isolation@rcs0-s3.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4245/shard-kbl1/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_ctx_isolation@vecs0-s3:
    - shard-apl:          [PASS][12] -> [DMESG-WARN][13] ([i915#180])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8046/shard-apl6/igt@gem_ctx_isolation@vecs0-s3.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4245/shard-apl4/igt@gem_ctx_isolation@vecs0-s3.html

  * igt@gem_exec_schedule@implicit-both-bsd:
    - shard-iclb:         [PASS][14] -> [SKIP][15] ([i915#677]) +1 similar issue
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8046/shard-iclb7/igt@gem_exec_schedule@implicit-both-bsd.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4245/shard-iclb4/igt@gem_exec_schedule@implicit-both-bsd.html

  * igt@gem_exec_schedule@preempt-bsd:
    - shard-iclb:         [PASS][16] -> [SKIP][17] ([fdo#112146]) +2 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8046/shard-iclb3/igt@gem_exec_schedule@preempt-bsd.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4245/shard-iclb4/igt@gem_exec_schedule@preempt-bsd.html

  * igt@gem_exec_whisper@basic-queues-priority-all:
    - shard-glk:          [PASS][18] -> [DMESG-WARN][19] ([i915#118] / [i915#95])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8046/shard-glk2/igt@gem_exec_whisper@basic-queues-priority-all.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4245/shard-glk3/igt@gem_exec_whisper@basic-queues-priority-all.html

  * igt@gem_userptr_blits@sync-unmap-after-close:
    - shard-apl:          [PASS][20] -> [DMESG-WARN][21] ([fdo#111870] / [i915#211] / [i915#836])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8046/shard-apl3/igt@gem_userptr_blits@sync-unmap-after-close.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4245/shard-apl7/igt@gem_userptr_blits@sync-unmap-after-close.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [PASS][22] -> [FAIL][23] ([i915#454])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8046/shard-iclb2/igt@i915_pm_dc@dc6-dpms.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4245/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rpm@pm-tiling:
    - shard-hsw:          [PASS][24] -> [SKIP][25] ([fdo#109271]) +1 similar issue
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8046/shard-hsw6/igt@i915_pm_rpm@pm-tiling.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4245/shard-hsw5/igt@i915_pm_rpm@pm-tiling.html
    - shard-tglb:         [PASS][26] -> [SKIP][27] ([i915#1316])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8046/shard-tglb3/igt@i915_pm_rpm@pm-tiling.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4245/shard-tglb8/igt@i915_pm_rpm@pm-tiling.html
    - shard-glk:          [PASS][28] -> [SKIP][29] ([fdo#109271]) +1 similar issue
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8046/shard-glk4/igt@i915_pm_rpm@pm-tiling.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4245/shard-glk6/igt@i915_pm_rpm@pm-tiling.html
    - shard-iclb:         [PASS][30] -> [SKIP][31] ([i915#1316])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8046/shard-iclb7/igt@i915_pm_rpm@pm-tiling.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4245/shard-iclb1/igt@i915_pm_rpm@pm-tiling.html

  * igt@i915_pm_rps@waitboost:
    - shard-iclb:         [PASS][32] -> [FAIL][33] ([i915#413])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8046/shard-iclb2/igt@i915_pm_rps@waitboost.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4245/shard-iclb6/igt@i915_pm_rps@waitboost.html

  * igt@kms_color@pipe-c-legacy-gamma:
    - shard-kbl:          [PASS][34] -> [FAIL][35] ([i915#71])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8046/shard-kbl3/igt@kms_color@pipe-c-legacy-gamma.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4245/shard-kbl3/igt@kms_color@pipe-c-legacy-gamma.html
    - shard-apl:          [PASS][36] -> [FAIL][37] ([i915#71])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8046/shard-apl4/igt@kms_color@pipe-c-legacy-gamma.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4245/shard-apl7/igt@kms_color@pipe-c-legacy-gamma.html

  * igt@kms_plane_lowres@pipe-a-tiling-y:
    - shard-glk:          [PASS][38] -> [FAIL][39] ([i915#899])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8046/shard-glk9/igt@kms_plane_lowres@pipe-a-tiling-y.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4245/shard-glk2/igt@kms_plane_lowres@pipe-a-tiling-y.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [PASS][40] -> [SKIP][41] ([fdo#109441]) +6 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8046/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4245/shard-iclb5/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_vblank@pipe-a-accuracy-idle:
    - shard-glk:          [PASS][42] -> [FAIL][43] ([i915#43])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8046/shard-glk3/igt@kms_vblank@pipe-a-accuracy-idle.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4245/shard-glk2/igt@kms_vblank@pipe-a-accuracy-idle.html

  * igt@kms_vblank@pipe-b-ts-continuation-dpms-rpm:
    - shard-iclb:         [PASS][44] -> [SKIP][45] ([fdo#109278])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8046/shard-iclb8/igt@kms_vblank@pipe-b-ts-continuation-dpms-rpm.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4245/shard-iclb1/igt@kms_vblank@pipe-b-ts-continuation-dpms-rpm.html
    - shard-tglb:         [PASS][46] -> [SKIP][47] ([fdo#112015])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8046/shard-tglb5/igt@kms_vblank@pipe-b-ts-continuation-dpms-rpm.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4245/shard-tglb8/igt@kms_vblank@pipe-b-ts-continuation-dpms-rpm.html

  * igt@perf_pmu@busy-no-semaphores-vcs1:
    - shard-iclb:         [PASS][48] -> [SKIP][49] ([fdo#112080]) +13 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8046/shard-iclb4/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4245/shard-iclb3/igt@perf_pmu@busy-no-semaphores-vcs1.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [PASS][50] -> [SKIP][51] ([fdo#109276]) +21 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8046/shard-iclb2/igt@prime_busy@hang-bsd2.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4245/shard-iclb8/igt@prime_busy@hang-bsd2.html

  
#### Possible fixes ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [SKIP][52] ([fdo#112080]) -> [PASS][53] +10 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8046/shard-iclb7/igt@gem_busy@busy-vcs1.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4245/shard-iclb2/igt@gem_busy@busy-vcs1.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [SKIP][54] ([fdo#110841]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8046/shard-iclb4/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4245/shard-iclb6/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_schedule@implicit-write-read-bsd1:
    - shard-iclb:         [SKIP][56] ([fdo#109276] / [i915#677]) -> [PASS][57] +1 similar issue
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8046/shard-iclb6/igt@gem_exec_schedule@implicit-write-read-bsd1.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4245/shard-iclb4/igt@gem_exec_schedule@implicit-write-read-bsd1.html

  * igt@gem_exec_schedule@independent-bsd2:
    - shard-iclb:         [SKIP][58] ([fdo#109276]) -> [PASS][59] +12 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8046/shard-iclb3/igt@gem_exec_schedule@independent-bsd2.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4245/shard-iclb4/igt@gem_exec_schedule@independent-bsd2.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [SKIP][60] ([i915#677]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8046/shard-iclb4/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4245/shard-iclb7/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@reorder-wide-bsd:
    - shard-iclb:         [SKIP][62] ([fdo#112146]) -> [PASS][63] +5 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8046/shard-iclb2/igt@gem_exec_schedule@reorder-wide-bsd.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4245/shard-iclb8/igt@gem_exec_schedule@reorder-wide-bsd.html

  * igt@gem_exec_whisper@basic-queues-forked:
    - shard-apl:          [INCOMPLETE][64] ([fdo#103927]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8046/shard-apl4/igt@gem_exec_whisper@basic-queues-forked.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4245/shard-apl8/igt@gem_exec_whisper@basic-queues-forked.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-tglb:         [FAIL][66] ([i915#644]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8046/shard-tglb6/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4245/shard-tglb1/igt@gem_ppgtt@flink-and-close-vma-leak.html
    - shard-kbl:          [FAIL][68] ([i915#644]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8046/shard-kbl1/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4245/shard-kbl1/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [DMESG-WARN][70] ([i915#716]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8046/shard-glk9/igt@gen9_exec_parse@allowed-all.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4245/shard-glk2/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_rpm@debugfs-forcewake-user:
    - shard-hsw:          [SKIP][72] ([fdo#109271]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8046/shard-hsw6/igt@i915_pm_rpm@debugfs-forcewake-user.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4245/shard-hsw6/igt@i915_pm_rpm@debugfs-forcewake-user.html
    - shard-iclb:         [SKIP][74] ([i915#1316]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8046/shard-iclb2/igt@i915_pm_rpm@debugfs-forcewake-user.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4245/shard-iclb2/igt@i915_pm_rpm@debugfs-forcewake-user.html
    - shard-tglb:         [SKIP][76] ([i915#1316]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8046/shard-tglb7/igt@i915_pm_rpm@debugfs-forcewake-user.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4245/shard-tglb7/igt@i915_pm_rpm@debugfs-forcewake-user.html
    - shard-glk:          [SKIP][78] ([fdo#109271]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8046/shard-glk3/igt@i915_pm_rpm@debugfs-forcewake-user.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4245/shard-glk3/igt@i915_pm_rpm@debugfs-forcewake-user.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-kbl:          [INCOMPLETE][80] ([fdo#103665]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8046/shard-kbl1/igt@i915_suspend@fence-restore-untiled.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4245/shard-kbl6/igt@i915_suspend@fence-restore-untiled.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][82] ([i915#180]) -> [PASS][83] +1 similar issue
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8046/shard-kbl1/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4245/shard-kbl4/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-iclb:         [FAIL][84] ([IGT#5]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8046/shard-iclb2/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4245/shard-iclb5/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [DMESG-WARN][86] ([i915#180]) -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8046/shard-apl1/igt@kms_fbcon_fbt@fbc-suspend.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4245/shard-apl4/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-glk:          [FAIL][88] ([i915#79]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8046/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4245/shard-glk5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc:
    - shard-snb:          [SKIP][90] ([fdo#109271]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8046/shard-snb6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4245/shard-snb2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-pwrite:
    - shard-glk:          [FAIL][92] ([i915#49]) -> [PASS][93]
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8046/shard-glk5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-pwrite.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4245/shard-glk2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render:
    - shard-tglb:         [SKIP][94] ([i915#668]) -> [PASS][95] +6 similar issues
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8046/shard-tglb2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4245/shard-tglb2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_psr@psr2_basic:
    - shard-iclb:         [SKIP][96] ([fdo#109441]) -> [PASS][97] +1 similar issue
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8046/shard-iclb6/igt@kms_psr@psr2_basic.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4245/shard-iclb2/igt@kms_psr@psr2_basic.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [FAIL][98] ([i915#31]) -> [PASS][99]
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8046/shard-kbl7/igt@kms_setmode@basic.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4245/shard-kbl7/igt@kms_setmode@basic.html

  * igt@perf@oa-exponents:
    - shard-glk:          [FAIL][100] ([i915#84]) -> [PASS][101]
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8046/shard-glk5/igt@perf@oa-exponents.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4245/shard-glk2/igt@perf@oa-exponents.html

  * igt@perf@short-reads:
    - shard-hsw:          [FAIL][102] ([i915#51]) -> [PASS][103]
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8046/shard-hsw6/igt@perf@short-reads.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4245/shard-hsw6/igt@perf@short-reads.html

  
#### Warnings ####

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
    - shard-snb:          [DMESG-WARN][104] ([fdo#110789] / [fdo#111870] / [i915#478]) -> [DMESG-WARN][105] ([fdo#111870] / [i915#478])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8046/shard-snb5/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4245/shard-snb2/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html
    - shard-hsw:          [DMESG-WARN][106] ([fdo#110789] / [fdo#111870]) -> [DMESG-WARN][107] ([fdo#111870])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8046/shard-hsw5/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4245/shard-hsw1/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html

  * igt@i915_pm_rpm@drm-resources-equal:
    - shard-snb:          [SKIP][108] ([fdo#109271]) -> [INCOMPLETE][109] ([i915#82])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8046/shard-snb2/igt@i915_pm_rpm@drm-resources-equal.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4245/shard-snb5/igt@i915_pm_rpm@drm-resources-equal.html

  * igt@runner@aborted:
    - shard-apl:          [FAIL][110] ([fdo#103927]) -> ([FAIL][111], [FAIL][112]) ([fdo#103927] / [fdo#111870] / [i915#211] / [i915#771])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8046/shard-apl6/igt@runner@aborted.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4245/shard-apl2/igt@runner@aborted.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4245/shard-apl7/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#5]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/5
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112015]: https://bugs.freedesktop.org/show_bug.cgi?id=112015
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1356]: https://gitlab.freedesktop.org/drm/intel/issues/1356
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#211]: https://gitlab.freedesktop.org/drm/intel/issues/211
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#43]: https://gitlab.freedesktop.org/drm/intel/issues/43
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#51]: https://gitlab.freedesktop.org/drm/intel/issues/51
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#71]: https://gitlab.freedesktop.org/drm/intel/issues/71
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#771]: https://gitlab.freedesktop.org/drm/intel/issues/771
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#836]: https://gitlab.freedesktop.org/drm/intel/issues/836
  [i915#84]: https://gitlab.freedesktop.org/drm/intel/issues/84
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5483 -> IGTPW_4245
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8046: be13ba469987146d8e75f7c07103c0a087a3b520 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4245: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4245/index.html
  IGT_5483: 1707153df224ffb6333c6c660a792b7f334eb3d3 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4245/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
