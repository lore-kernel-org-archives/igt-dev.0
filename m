Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 20 Jan 2020 18:25:19 -0000
Message-ID: <157954471999.679.16697802592469866288@emeril.freedesktop.org>
References: <20200117211129.3303428-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200117211129.3303428-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fmmap=5Foffset=3A_Exercise_many=2C_many_mmap=5Foffset?=
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: i915/gem_mmap_offset: Exercise many, many mmap_offset
URL   : https://patchwork.freedesktop.org/series/72217/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7768_full -> IGTPW_3939_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3939/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_3939_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_mmap_offset@open-flood} (NEW):
    - shard-iclb:         NOTRUN -> [DMESG-FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3939/shard-iclb2/igt@gem_mmap_offset@open-flood.html

  
New tests
---------

  New tests have been introduced between CI_DRM_7768_full and IGTPW_3939_full:

### New IGT tests (1) ###

  * igt@gem_mmap_offset@open-flood:
    - Statuses : 1 dmesg-fail(s) 2 incomplete(s) 2 pass(s)
    - Exec time: [0.0, 40.76] s

  

Known issues
------------

  Here are the changes found in IGTPW_3939_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@bcs0-s3:
    - shard-apl:          [PASS][2] -> [DMESG-WARN][3] ([i915#180]) +3 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7768/shard-apl1/igt@gem_ctx_isolation@bcs0-s3.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3939/shard-apl4/igt@gem_ctx_isolation@bcs0-s3.html

  * igt@gem_ctx_isolation@vcs1-reset:
    - shard-iclb:         [PASS][4] -> [SKIP][5] ([fdo#109276] / [fdo#112080]) +2 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7768/shard-iclb1/igt@gem_ctx_isolation@vcs1-reset.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3939/shard-iclb8/igt@gem_ctx_isolation@vcs1-reset.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [PASS][6] -> [SKIP][7] ([fdo#110841])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7768/shard-iclb6/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3939/shard-iclb4/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [PASS][8] -> [SKIP][9] ([i915#677]) +1 similar issue
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7768/shard-iclb6/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3939/shard-iclb1/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [PASS][10] -> [SKIP][11] ([fdo#112146]) +1 similar issue
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7768/shard-iclb6/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3939/shard-iclb2/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_persistent_relocs@forked-interruptible-thrashing:
    - shard-snb:          [PASS][12] -> [FAIL][13] ([i915#520])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7768/shard-snb2/igt@gem_persistent_relocs@forked-interruptible-thrashing.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3939/shard-snb4/igt@gem_persistent_relocs@forked-interruptible-thrashing.html
    - shard-kbl:          [PASS][14] -> [TIMEOUT][15] ([fdo#112271] / [i915#530]) +1 similar issue
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7768/shard-kbl6/igt@gem_persistent_relocs@forked-interruptible-thrashing.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3939/shard-kbl2/igt@gem_persistent_relocs@forked-interruptible-thrashing.html

  * igt@gem_persistent_relocs@forked-thrash-inactive:
    - shard-kbl:          [PASS][16] -> [INCOMPLETE][17] ([fdo#103665] / [i915#530])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7768/shard-kbl3/igt@gem_persistent_relocs@forked-thrash-inactive.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3939/shard-kbl3/igt@gem_persistent_relocs@forked-thrash-inactive.html

  * igt@i915_pm_rps@reset:
    - shard-iclb:         [PASS][18] -> [FAIL][19] ([i915#413]) +1 similar issue
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7768/shard-iclb2/igt@i915_pm_rps@reset.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3939/shard-iclb5/igt@i915_pm_rps@reset.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-glk:          [PASS][20] -> [FAIL][21] ([i915#46])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7768/shard-glk2/igt@kms_flip@flip-vs-expired-vblank.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3939/shard-glk9/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [PASS][22] -> [DMESG-WARN][23] ([i915#180]) +7 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7768/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3939/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [PASS][24] -> [SKIP][25] ([fdo#109642] / [fdo#111068]) +1 similar issue
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7768/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3939/shard-iclb4/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [PASS][26] -> [SKIP][27] ([fdo#109441]) +3 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7768/shard-iclb2/igt@kms_psr@psr2_no_drrs.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3939/shard-iclb1/igt@kms_psr@psr2_no_drrs.html

  * igt@perf_pmu@busy-idle-check-all-vcs1:
    - shard-kbl:          [PASS][28] -> [TIMEOUT][29] ([fdo#112271])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7768/shard-kbl4/igt@perf_pmu@busy-idle-check-all-vcs1.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3939/shard-kbl2/igt@perf_pmu@busy-idle-check-all-vcs1.html

  * igt@perf_pmu@busy-no-semaphores-vcs1:
    - shard-iclb:         [PASS][30] -> [SKIP][31] ([fdo#112080]) +14 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7768/shard-iclb1/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3939/shard-iclb6/igt@perf_pmu@busy-no-semaphores-vcs1.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [PASS][32] -> [SKIP][33] ([fdo#109276]) +20 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7768/shard-iclb1/igt@prime_busy@hang-bsd2.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3939/shard-iclb5/igt@prime_busy@hang-bsd2.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-kbl:          [DMESG-WARN][34] ([i915#180]) -> [PASS][35] +1 similar issue
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7768/shard-kbl2/igt@gem_ctx_isolation@rcs0-s3.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3939/shard-kbl4/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_ctx_persistence@vcs1-queued:
    - shard-iclb:         [SKIP][36] ([fdo#109276] / [fdo#112080]) -> [PASS][37] +2 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7768/shard-iclb6/igt@gem_ctx_persistence@vcs1-queued.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3939/shard-iclb4/igt@gem_ctx_persistence@vcs1-queued.html

  * igt@gem_eio@reset-stress:
    - shard-snb:          [FAIL][38] ([i915#232]) -> [PASS][39]
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7768/shard-snb1/igt@gem_eio@reset-stress.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3939/shard-snb6/igt@gem_eio@reset-stress.html

  * igt@gem_exec_async@concurrent-writes-bsd:
    - shard-iclb:         [SKIP][40] ([fdo#112146]) -> [PASS][41] +4 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7768/shard-iclb1/igt@gem_exec_async@concurrent-writes-bsd.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3939/shard-iclb8/igt@gem_exec_async@concurrent-writes-bsd.html

  * igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing:
    - shard-kbl:          [TIMEOUT][42] ([fdo#112271] / [i915#530]) -> [PASS][43]
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7768/shard-kbl3/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3939/shard-kbl2/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-snb:          [DMESG-WARN][44] ([fdo#110789] / [fdo#111870] / [i915#478]) -> [PASS][45]
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7768/shard-snb5/igt@gem_userptr_blits@dmabuf-unsync.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3939/shard-snb1/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@sync-unmap:
    - shard-snb:          [DMESG-WARN][46] ([fdo#111870] / [i915#478]) -> [PASS][47]
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7768/shard-snb6/igt@gem_userptr_blits@sync-unmap.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3939/shard-snb1/igt@gem_userptr_blits@sync-unmap.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-glk:          [DMESG-WARN][48] ([i915#716]) -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7768/shard-glk2/igt@gen9_exec_parse@allowed-single.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3939/shard-glk7/igt@gen9_exec_parse@allowed-single.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][50] ([i915#454]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7768/shard-iclb8/igt@i915_pm_dc@dc6-psr.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3939/shard-iclb4/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-iclb:         [DMESG-WARN][52] ([fdo#111764]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7768/shard-iclb4/igt@i915_pm_rpm@system-suspend-execbuf.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3939/shard-iclb8/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [FAIL][54] ([i915#72]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7768/shard-glk9/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3939/shard-glk1/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-glk:          [FAIL][56] ([i915#34]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7768/shard-glk7/igt@kms_flip@2x-plain-flip-ts-check.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3939/shard-glk7/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-apl:          [DMESG-WARN][58] ([i915#180]) -> [PASS][59] +2 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7768/shard-apl1/igt@kms_flip@flip-vs-suspend-interruptible.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3939/shard-apl7/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-kbl:          [FAIL][60] ([i915#49]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7768/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3939/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
    - shard-apl:          [FAIL][62] ([i915#49]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7768/shard-apl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3939/shard-apl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_plane_scaling@pipe-b-scaler-with-rotation:
    - shard-glk:          [DMESG-WARN][64] ([i915#118] / [i915#95]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7768/shard-glk4/igt@kms_plane_scaling@pipe-b-scaler-with-rotation.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3939/shard-glk8/igt@kms_plane_scaling@pipe-b-scaler-with-rotation.html

  * igt@kms_psr@psr2_suspend:
    - shard-iclb:         [SKIP][66] ([fdo#109441]) -> [PASS][67] +4 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7768/shard-iclb5/igt@kms_psr@psr2_suspend.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3939/shard-iclb2/igt@kms_psr@psr2_suspend.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][68] ([i915#31]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7768/shard-apl8/igt@kms_setmode@basic.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3939/shard-apl7/igt@kms_setmode@basic.html

  * igt@perf@oa-exponents:
    - shard-iclb:         [INCOMPLETE][70] ([i915#140]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7768/shard-iclb4/igt@perf@oa-exponents.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3939/shard-iclb6/igt@perf@oa-exponents.html

  * igt@perf_pmu@busy-check-all-vcs1:
    - shard-iclb:         [SKIP][72] ([fdo#112080]) -> [PASS][73] +11 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7768/shard-iclb6/igt@perf_pmu@busy-check-all-vcs1.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3939/shard-iclb2/igt@perf_pmu@busy-check-all-vcs1.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [SKIP][74] ([fdo#109276]) -> [PASS][75] +22 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7768/shard-iclb6/igt@prime_vgem@fence-wait-bsd2.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3939/shard-iclb2/igt@prime_vgem@fence-wait-bsd2.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv-switch:
    - shard-iclb:         [FAIL][76] ([IGT#28]) -> [SKIP][77] ([fdo#109276] / [fdo#112080])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7768/shard-iclb4/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3939/shard-iclb8/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html

  * igt@gem_persistent_relocs@forked-interruptible-thrashing:
    - shard-apl:          [TIMEOUT][78] ([fdo#112271] / [i915#530]) -> [INCOMPLETE][79] ([CI#80] / [fdo#103927] / [i915#530])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7768/shard-apl2/igt@gem_persistent_relocs@forked-interruptible-thrashing.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3939/shard-apl2/igt@gem_persistent_relocs@forked-interruptible-thrashing.html

  * igt@runner@aborted:
    - shard-glk:          [FAIL][80] ([k.org#202321]) -> [FAIL][81] ([i915#997] / [k.org#202321])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7768/shard-glk2/igt@runner@aborted.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3939/shard-glk5/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111764]: https://bugs.freedesktop.org/show_bug.cgi?id=111764
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#232]: https://gitlab.freedesktop.org/drm/intel/issues/232
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#34]: https://gitlab.freedesktop.org/drm/intel/issues/34
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#46]: https://gitlab.freedesktop.org/drm/intel/issues/46
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#520]: https://gitlab.freedesktop.org/drm/intel/issues/520
  [i915#530]: https://gitlab.freedesktop.org/drm/intel/issues/530
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [i915#997]: https://gitlab.freedesktop.org/drm/intel/issues/997
  [k.org#202321]: https://bugzilla.kernel.org/show_bug.cgi?id=202321


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5372 -> IGTPW_3939
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7768: 7db45c7ebc9f6ce2c31c543f26ebdb385a7a52a0 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3939: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3939/index.html
  IGT_5372: 0d00a27fbbd4d4a77d24499ea9811e07e65eb0ac @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3939/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
