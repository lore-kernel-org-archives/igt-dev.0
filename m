Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 08 Jan 2020 17:06:43 -0000
Message-ID: <157850320337.23226.8646134144920356374@emeril.freedesktop.org>
References: <20200108053437.6268-1-petri.latvala@intel.com>
In-Reply-To: <20200108053437.6268-1-petri.latvala@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fexec=5Fbasic=3A_Use_dynamic_subtests?=
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

Series: i915/gem_exec_basic: Use dynamic subtests
URL   : https://patchwork.freedesktop.org/series/71733/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7699_full -> IGTPW_3904_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_3904_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_3904_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3904/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_3904_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_busy@close-race:
    - shard-hsw:          NOTRUN -> [TIMEOUT][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3904/shard-hsw1/igt@gem_busy@close-race.html

  * igt@gem_eio@kms:
    - shard-hsw:          [PASS][2] -> [DMESG-WARN][3]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7699/shard-hsw2/igt@gem_eio@kms.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3904/shard-hsw5/igt@gem_eio@kms.html

  
New tests
---------

  New tests have been introduced between CI_DRM_7699_full and IGTPW_3904_full:

### New IGT tests (18) ###

  * igt@gem_exec_basic@basic:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@gem_exec_basic@basic@bcs0:
    - Statuses : 7 pass(s)
    - Exec time: [0.0, 0.00] s

  * igt@gem_exec_basic@basic@rcs0:
    - Statuses : 7 pass(s)
    - Exec time: [0.0, 0.00] s

  * igt@gem_exec_basic@basic@vcs0:
    - Statuses : 7 pass(s)
    - Exec time: [0.0, 0.00] s

  * igt@gem_exec_basic@basic@vcs1:
    - Statuses : 3 pass(s)
    - Exec time: [0.0, 0.00] s

  * igt@gem_exec_basic@basic@vecs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.0, 0.00] s

  * igt@gem_exec_basic@gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_basic@gtt@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.00] s

  * igt@gem_exec_basic@gtt@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@gem_exec_basic@gtt@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.00] s

  * igt@gem_exec_basic@gtt@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@gem_exec_basic@gtt@vecs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.00] s

  * igt@gem_exec_basic@readonly:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_basic@readonly@bcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.0, 0.00] s

  * igt@gem_exec_basic@readonly@rcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.00] s

  * igt@gem_exec_basic@readonly@vcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.0, 0.00] s

  * igt@gem_exec_basic@readonly@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0, 0.00] s

  * igt@gem_exec_basic@readonly@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.0, 0.00] s

  

Known issues
------------

  Here are the changes found in IGTPW_3904_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-kbl:          [PASS][4] -> [DMESG-WARN][5] ([i915#180]) +8 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7699/shard-kbl1/igt@gem_ctx_isolation@rcs0-s3.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3904/shard-kbl7/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_ctx_isolation@vcs1-dirty-create:
    - shard-iclb:         [PASS][6] -> [SKIP][7] ([fdo#109276] / [fdo#112080]) +2 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7699/shard-iclb1/igt@gem_ctx_isolation@vcs1-dirty-create.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3904/shard-iclb3/igt@gem_ctx_isolation@vcs1-dirty-create.html

  * igt@gem_ctx_shared@q-smoketest-all:
    - shard-tglb:         [PASS][8] -> [INCOMPLETE][9] ([fdo#111735]) +1 similar issue
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7699/shard-tglb5/igt@gem_ctx_shared@q-smoketest-all.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3904/shard-tglb3/igt@gem_ctx_shared@q-smoketest-all.html

  * igt@gem_exec_async@concurrent-writes-bsd:
    - shard-iclb:         [PASS][10] -> [SKIP][11] ([fdo#112146]) +3 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7699/shard-iclb8/igt@gem_exec_async@concurrent-writes-bsd.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3904/shard-iclb2/igt@gem_exec_async@concurrent-writes-bsd.html

  * igt@gem_exec_schedule@pi-shared-iova-bsd:
    - shard-iclb:         [PASS][12] -> [SKIP][13] ([i915#677]) +1 similar issue
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7699/shard-iclb7/igt@gem_exec_schedule@pi-shared-iova-bsd.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3904/shard-iclb1/igt@gem_exec_schedule@pi-shared-iova-bsd.html

  * igt@gem_exec_schedule@preempt-queue-contexts-blt:
    - shard-tglb:         [PASS][14] -> [INCOMPLETE][15] ([fdo#111606] / [fdo#111677] / [i915#472])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7699/shard-tglb8/igt@gem_exec_schedule@preempt-queue-contexts-blt.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3904/shard-tglb6/igt@gem_exec_schedule@preempt-queue-contexts-blt.html

  * igt@gem_persistent_relocs@forked-faulting-reloc-thrashing:
    - shard-snb:          [PASS][16] -> [DMESG-WARN][17] ([fdo#110789] / [i915#478]) +1 similar issue
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7699/shard-snb6/igt@gem_persistent_relocs@forked-faulting-reloc-thrashing.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3904/shard-snb4/igt@gem_persistent_relocs@forked-faulting-reloc-thrashing.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-apl:          [PASS][18] -> [DMESG-WARN][19] ([i915#180]) +3 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7699/shard-apl4/igt@gem_workarounds@suspend-resume-context.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3904/shard-apl1/igt@gem_workarounds@suspend-resume-context.html

  * igt@gen7_exec_parse@basic-offset:
    - shard-hsw:          [PASS][20] -> [FAIL][21] ([i915#694])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7699/shard-hsw2/igt@gen7_exec_parse@basic-offset.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3904/shard-hsw7/igt@gen7_exec_parse@basic-offset.html

  * igt@i915_selftest@live_gt_timelines:
    - shard-tglb:         [PASS][22] -> [INCOMPLETE][23] ([i915#455])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7699/shard-tglb1/igt@i915_selftest@live_gt_timelines.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3904/shard-tglb3/igt@i915_selftest@live_gt_timelines.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-glk:          [PASS][24] -> [FAIL][25] ([i915#79])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7699/shard-glk9/igt@kms_flip@flip-vs-expired-vblank.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3904/shard-glk3/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-pwrite:
    - shard-tglb:         [PASS][26] -> [FAIL][27] ([i915#49])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7699/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-pwrite.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3904/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-pwrite.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [PASS][28] -> [SKIP][29] ([fdo#109441])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7699/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3904/shard-iclb7/igt@kms_psr@psr2_primary_page_flip.html

  * igt@perf_pmu@busy-vcs1:
    - shard-iclb:         [PASS][30] -> [SKIP][31] ([fdo#112080]) +6 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7699/shard-iclb4/igt@perf_pmu@busy-vcs1.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3904/shard-iclb6/igt@perf_pmu@busy-vcs1.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [PASS][32] -> [SKIP][33] ([fdo#109276]) +26 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7699/shard-iclb1/igt@prime_vgem@fence-wait-bsd2.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3904/shard-iclb7/igt@prime_vgem@fence-wait-bsd2.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@vcs1-mixed-process:
    - shard-iclb:         [SKIP][34] ([fdo#109276] / [fdo#112080]) -> [PASS][35] +2 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7699/shard-iclb8/igt@gem_ctx_persistence@vcs1-mixed-process.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3904/shard-iclb1/igt@gem_ctx_persistence@vcs1-mixed-process.html

  * igt@gem_exec_await@wide-all:
    - shard-tglb:         [INCOMPLETE][36] ([fdo#111736] / [i915#472]) -> [PASS][37]
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7699/shard-tglb4/igt@gem_exec_await@wide-all.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3904/shard-tglb3/igt@gem_exec_await@wide-all.html

  * igt@gem_exec_nop@basic-series:
    - shard-tglb:         [INCOMPLETE][38] ([i915#435] / [i915#472]) -> [PASS][39]
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7699/shard-tglb9/igt@gem_exec_nop@basic-series.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3904/shard-tglb7/igt@gem_exec_nop@basic-series.html

  * igt@gem_exec_parallel@basic:
    - shard-tglb:         [INCOMPLETE][40] ([i915#472] / [i915#476]) -> [PASS][41]
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7699/shard-tglb9/igt@gem_exec_parallel@basic.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3904/shard-tglb2/igt@gem_exec_parallel@basic.html

  * igt@gem_exec_schedule@preempt-queue-contexts-bsd2:
    - shard-tglb:         [INCOMPLETE][42] ([fdo#111606] / [fdo#111677] / [i915#472]) -> [PASS][43]
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7699/shard-tglb9/igt@gem_exec_schedule@preempt-queue-contexts-bsd2.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3904/shard-tglb8/igt@gem_exec_schedule@preempt-queue-contexts-bsd2.html

  * igt@gem_exec_schedule@reorder-wide-bsd:
    - shard-iclb:         [SKIP][44] ([fdo#112146]) -> [PASS][45] +5 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7699/shard-iclb1/igt@gem_exec_schedule@reorder-wide-bsd.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3904/shard-iclb3/igt@gem_exec_schedule@reorder-wide-bsd.html

  * igt@gem_exec_suspend@basic-s4-devices:
    - shard-tglb:         [INCOMPLETE][46] ([i915#460] / [i915#472]) -> [PASS][47]
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7699/shard-tglb6/igt@gem_exec_suspend@basic-s4-devices.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3904/shard-tglb6/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@gem_persistent_relocs@forked-interruptible-thrashing:
    - shard-snb:          [FAIL][48] ([i915#520]) -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7699/shard-snb5/igt@gem_persistent_relocs@forked-interruptible-thrashing.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3904/shard-snb1/igt@gem_persistent_relocs@forked-interruptible-thrashing.html

  * igt@gem_softpin@noreloc-s3:
    - shard-apl:          [DMESG-WARN][50] ([i915#180]) -> [PASS][51] +2 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7699/shard-apl1/igt@gem_softpin@noreloc-s3.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3904/shard-apl2/igt@gem_softpin@noreloc-s3.html

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-snb:          [DMESG-WARN][52] ([fdo#111870]) -> [PASS][53] +1 similar issue
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7699/shard-snb4/igt@gem_userptr_blits@sync-unmap-cycles.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3904/shard-snb2/igt@gem_userptr_blits@sync-unmap-cycles.html

  * igt@i915_hangman@error-state-capture-vcs1:
    - shard-iclb:         [SKIP][54] ([fdo#112080]) -> [PASS][55] +14 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7699/shard-iclb8/igt@i915_hangman@error-state-capture-vcs1.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3904/shard-iclb4/igt@i915_hangman@error-state-capture-vcs1.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-snb:          [INCOMPLETE][56] ([i915#82]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7699/shard-snb1/igt@kms_flip@flip-vs-suspend-interruptible.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3904/shard-snb4/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-kbl:          [DMESG-WARN][58] ([i915#180]) -> [PASS][59] +4 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7699/shard-kbl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3904/shard-kbl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [SKIP][60] ([fdo#109441]) -> [PASS][61] +1 similar issue
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7699/shard-iclb3/igt@kms_psr@psr2_cursor_render.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3904/shard-iclb2/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend:
    - shard-kbl:          [INCOMPLETE][62] ([fdo#103665]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7699/shard-kbl6/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3904/shard-kbl3/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [SKIP][64] ([fdo#109276]) -> [PASS][65] +19 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7699/shard-iclb5/igt@prime_busy@hang-bsd2.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3904/shard-iclb2/igt@prime_busy@hang-bsd2.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [FAIL][66] ([IGT#28]) -> [SKIP][67] ([fdo#109276] / [fdo#112080])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7699/shard-iclb2/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3904/shard-iclb8/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@gem_ctx_isolation@vcs1-nonpriv-switch:
    - shard-iclb:         [SKIP][68] ([fdo#109276] / [fdo#112080]) -> [FAIL][69] ([IGT#28])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7699/shard-iclb7/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3904/shard-iclb2/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html

  * igt@gem_ctx_isolation@vcs2-nonpriv-switch:
    - shard-tglb:         [SKIP][70] ([fdo#111912] / [fdo#112080]) -> [SKIP][71] ([fdo#112080])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7699/shard-tglb6/igt@gem_ctx_isolation@vcs2-nonpriv-switch.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3904/shard-tglb9/igt@gem_ctx_isolation@vcs2-nonpriv-switch.html

  * igt@gem_ctx_isolation@vcs2-reset:
    - shard-tglb:         [SKIP][72] ([fdo#112080]) -> [SKIP][73] ([fdo#111912] / [fdo#112080])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7699/shard-tglb9/igt@gem_ctx_isolation@vcs2-reset.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3904/shard-tglb3/igt@gem_ctx_isolation@vcs2-reset.html

  * igt@i915_pm_rpm@drm-resources-equal:
    - shard-snb:          [INCOMPLETE][74] ([i915#82]) -> [SKIP][75] ([fdo#109271])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7699/shard-snb2/igt@i915_pm_rpm@drm-resources-equal.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3904/shard-snb1/igt@i915_pm_rpm@drm-resources-equal.html

  
  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#111606]: https://bugs.freedesktop.org/show_bug.cgi?id=111606
  [fdo#111677]: https://bugs.freedesktop.org/show_bug.cgi?id=111677
  [fdo#111735]: https://bugs.freedesktop.org/show_bug.cgi?id=111735
  [fdo#111736]: https://bugs.freedesktop.org/show_bug.cgi?id=111736
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#111912]: https://bugs.freedesktop.org/show_bug.cgi?id=111912
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#435]: https://gitlab.freedesktop.org/drm/intel/issues/435
  [i915#455]: https://gitlab.freedesktop.org/drm/intel/issues/455
  [i915#460]: https://gitlab.freedesktop.org/drm/intel/issues/460
  [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
  [i915#476]: https://gitlab.freedesktop.org/drm/intel/issues/476
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#520]: https://gitlab.freedesktop.org/drm/intel/issues/520
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-hsw-4770r 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5358 -> IGTPW_3904
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7699: 9aa67e1d77888cf258597d5009a6ab1762418ef6 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3904: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3904/index.html
  IGT_5358: c6fc013f414b806175dc4143c58ab445e5235ea5 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3904/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
