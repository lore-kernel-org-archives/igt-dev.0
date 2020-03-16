Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 16 Mar 2020 17:56:29 -0000
Message-ID: <158438138954.18993.1036393998130310822@emeril.freedesktop.org>
References: <20200313195316.7494-1-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20200313195316.7494-1-umesh.nerlige.ramappa@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgVGVzdCBj?=
 =?utf-8?q?onfigurable_poll_delay_in_perf_OA_=28rev2=29?=
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
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Test configurable poll delay in perf OA (rev2)
URL   : https://patchwork.freedesktop.org/series/74655/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8137_full -> IGTPW_4304_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4304_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4304_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4304/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4304_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_ctx_shared@single-timeline:
    - shard-snb:          NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4304/shard-snb2/igt@gem_ctx_shared@single-timeline.html
    - shard-hsw:          NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4304/shard-hsw2/igt@gem_ctx_shared@single-timeline.html

  * {igt@perf@blocking-parameterized} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][3] +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4304/shard-iclb1/igt@perf@blocking-parameterized.html

  * {igt@perf@polling-parameterized} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][4] +1 similar issue
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4304/shard-tglb7/igt@perf@polling-parameterized.html

  * igt@perf_pmu@busy-no-semaphores-vcs0:
    - shard-apl:          [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-apl4/igt@perf_pmu@busy-no-semaphores-vcs0.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4304/shard-apl4/igt@perf_pmu@busy-no-semaphores-vcs0.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8137_full and IGTPW_4304_full:

### New IGT tests (12) ###

  * igt@perf@blocking-parameterized:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@perf@polling-parameterized:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@sysfs_heartbeat_interval@idempotent:
    - Statuses :
    - Exec time: [None] s

  * igt@sysfs_heartbeat_interval@invalid:
    - Statuses :
    - Exec time: [None] s

  * igt@sysfs_heartbeat_interval@nopreempt:
    - Statuses :
    - Exec time: [None] s

  * igt@sysfs_heartbeat_interval@off:
    - Statuses :
    - Exec time: [None] s

  * igt@sysfs_heartbeat_interval@precise:
    - Statuses :
    - Exec time: [None] s

  * igt@sysfs_preempt_timeout@idempotent:
    - Statuses :
    - Exec time: [None] s

  * igt@sysfs_preempt_timeout@invalid:
    - Statuses :
    - Exec time: [None] s

  * igt@sysfs_timeslice_duration@duration:
    - Statuses :
    - Exec time: [None] s

  * igt@sysfs_timeslice_duration@idempotent:
    - Statuses :
    - Exec time: [None] s

  * igt@sysfs_timeslice_duration@timeout:
    - Statuses :
    - Exec time: [None] s

  

Known issues
------------

  Here are the changes found in IGTPW_4304_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-kbl:          [PASS][7] -> [INCOMPLETE][8] ([i915#1402])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-kbl6/igt@gem_ctx_persistence@close-replace-race.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4304/shard-kbl2/igt@gem_ctx_persistence@close-replace-race.html
    - shard-glk:          [PASS][9] -> [INCOMPLETE][10] ([i915#1402] / [i915#58] / [k.org#198133])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-glk3/igt@gem_ctx_persistence@close-replace-race.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4304/shard-glk5/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([fdo#110841])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb5/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4304/shard-iclb1/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_schedule@implicit-both-bsd1:
    - shard-iclb:         [PASS][13] -> [SKIP][14] ([fdo#109276] / [i915#677])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb4/igt@gem_exec_schedule@implicit-both-bsd1.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4304/shard-iclb6/igt@gem_exec_schedule@implicit-both-bsd1.html

  * igt@gem_exec_schedule@pi-userfault-bsd:
    - shard-iclb:         [PASS][15] -> [SKIP][16] ([i915#677])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb7/igt@gem_exec_schedule@pi-userfault-bsd.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4304/shard-iclb2/igt@gem_exec_schedule@pi-userfault-bsd.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [PASS][17] -> [SKIP][18] ([fdo#112146]) +3 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb6/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4304/shard-iclb2/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-snb:          [PASS][19] -> [DMESG-WARN][20] ([fdo#111870] / [i915#478])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-snb6/igt@gem_userptr_blits@dmabuf-unsync.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4304/shard-snb5/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-apl:          [PASS][21] -> [DMESG-WARN][22] ([i915#180])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-apl6/igt@gem_workarounds@suspend-resume-fd.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4304/shard-apl6/igt@gem_workarounds@suspend-resume-fd.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt:
    - shard-snb:          [PASS][23] -> [SKIP][24] ([fdo#109271]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-snb5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4304/shard-snb6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt:
    - shard-glk:          [PASS][25] -> [FAIL][26] ([i915#49])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-glk1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4304/shard-glk2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-kbl:          [PASS][27] -> [DMESG-WARN][28] ([i915#180]) +2 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-kbl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4304/shard-kbl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [PASS][29] -> [FAIL][30] ([i915#899])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-glk6/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4304/shard-glk3/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][31] -> [SKIP][32] ([fdo#109441]) +2 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4304/shard-iclb4/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_setmode@basic:
    - shard-glk:          [PASS][33] -> [FAIL][34] ([i915#31])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-glk2/igt@kms_setmode@basic.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4304/shard-glk1/igt@kms_setmode@basic.html
    - shard-kbl:          [PASS][35] -> [FAIL][36] ([i915#31])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-kbl7/igt@kms_setmode@basic.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4304/shard-kbl6/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-d-ts-continuation-dpms-rpm:
    - shard-tglb:         [PASS][37] -> [SKIP][38] ([fdo#112015])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-tglb8/igt@kms_vblank@pipe-d-ts-continuation-dpms-rpm.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4304/shard-tglb7/igt@kms_vblank@pipe-d-ts-continuation-dpms-rpm.html

  * igt@perf_pmu@init-busy-vcs1:
    - shard-iclb:         [PASS][39] -> [SKIP][40] ([fdo#112080]) +6 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb1/igt@perf_pmu@init-busy-vcs1.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4304/shard-iclb5/igt@perf_pmu@init-busy-vcs1.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [PASS][41] -> [SKIP][42] ([fdo#109276]) +16 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb1/igt@prime_vgem@fence-wait-bsd2.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4304/shard-iclb3/igt@prime_vgem@fence-wait-bsd2.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-snb:          [FAIL][43] -> [PASS][44] +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-snb4/igt@gem_ctx_isolation@rcs0-s3.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4304/shard-snb2/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_ctx_isolation@vcs1-dirty-create:
    - shard-iclb:         [SKIP][45] ([fdo#112080]) -> [PASS][46] +11 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb6/igt@gem_ctx_isolation@vcs1-dirty-create.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4304/shard-iclb4/igt@gem_ctx_isolation@vcs1-dirty-create.html

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-tglb:         [INCOMPLETE][47] ([i915#1402]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-tglb2/igt@gem_ctx_persistence@close-replace-race.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4304/shard-tglb6/igt@gem_ctx_persistence@close-replace-race.html
    - shard-apl:          [INCOMPLETE][49] ([fdo#103927] / [i915#1402]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-apl1/igt@gem_ctx_persistence@close-replace-race.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4304/shard-apl2/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [SKIP][51] ([fdo#110854]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb8/igt@gem_exec_balancer@smoke.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4304/shard-iclb1/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_parallel@bcs0-fds:
    - shard-apl:          [FAIL][53] -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-apl6/igt@gem_exec_parallel@bcs0-fds.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4304/shard-apl8/igt@gem_exec_parallel@bcs0-fds.html
    - shard-iclb:         [FAIL][55] -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb2/igt@gem_exec_parallel@bcs0-fds.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4304/shard-iclb1/igt@gem_exec_parallel@bcs0-fds.html
    - shard-tglb:         [FAIL][57] -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-tglb3/igt@gem_exec_parallel@bcs0-fds.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4304/shard-tglb1/igt@gem_exec_parallel@bcs0-fds.html
    - shard-glk:          [FAIL][59] -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-glk8/igt@gem_exec_parallel@bcs0-fds.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4304/shard-glk9/igt@gem_exec_parallel@bcs0-fds.html

  * igt@gem_exec_schedule@implicit-read-write-bsd1:
    - shard-iclb:         [SKIP][61] ([fdo#109276] / [i915#677]) -> [PASS][62] +2 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb5/igt@gem_exec_schedule@implicit-read-write-bsd1.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4304/shard-iclb2/igt@gem_exec_schedule@implicit-read-write-bsd1.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [SKIP][63] ([i915#677]) -> [PASS][64] +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb1/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4304/shard-iclb3/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@preempt-contexts-bsd2:
    - shard-iclb:         [SKIP][65] ([fdo#109276]) -> [PASS][66] +17 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb8/igt@gem_exec_schedule@preempt-contexts-bsd2.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4304/shard-iclb1/igt@gem_exec_schedule@preempt-contexts-bsd2.html

  * igt@gem_exec_schedule@preempt-hang-render:
    - shard-apl:          [SKIP][67] ([fdo#109271]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-apl6/igt@gem_exec_schedule@preempt-hang-render.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4304/shard-apl8/igt@gem_exec_schedule@preempt-hang-render.html
    - shard-glk:          [SKIP][69] ([fdo#109271]) -> [PASS][70] +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-glk8/igt@gem_exec_schedule@preempt-hang-render.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4304/shard-glk1/igt@gem_exec_schedule@preempt-hang-render.html
    - shard-iclb:         [SKIP][71] -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb2/igt@gem_exec_schedule@preempt-hang-render.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4304/shard-iclb4/igt@gem_exec_schedule@preempt-hang-render.html
    - shard-tglb:         [SKIP][73] -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-tglb3/igt@gem_exec_schedule@preempt-hang-render.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4304/shard-tglb3/igt@gem_exec_schedule@preempt-hang-render.html
    - shard-kbl:          [SKIP][75] ([fdo#109271]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-kbl7/igt@gem_exec_schedule@preempt-hang-render.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4304/shard-kbl3/igt@gem_exec_schedule@preempt-hang-render.html

  * igt@gem_exec_schedule@reorder-wide-bsd:
    - shard-iclb:         [SKIP][77] ([fdo#112146]) -> [PASS][78] +4 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb2/igt@gem_exec_schedule@reorder-wide-bsd.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4304/shard-iclb8/igt@gem_exec_schedule@reorder-wide-bsd.html

  * igt@gem_userptr_blits@sync-unmap-after-close:
    - shard-snb:          [DMESG-WARN][79] ([fdo#111870] / [i915#478]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-snb5/igt@gem_userptr_blits@sync-unmap-after-close.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4304/shard-snb4/igt@gem_userptr_blits@sync-unmap-after-close.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-kbl:          [DMESG-WARN][81] ([i915#180]) -> [PASS][82] +2 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-kbl2/igt@gem_workarounds@suspend-resume-fd.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4304/shard-kbl4/igt@gem_workarounds@suspend-resume-fd.html

  * igt@i915_pm_dc@dc5-dpms:
    - shard-iclb:         [FAIL][83] ([i915#447]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb3/igt@i915_pm_dc@dc5-dpms.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4304/shard-iclb1/igt@i915_pm_dc@dc5-dpms.html

  * igt@i915_pm_rpm@system-suspend-devices:
    - shard-iclb:         [SKIP][85] ([i915#1316]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb1/igt@i915_pm_rpm@system-suspend-devices.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4304/shard-iclb6/igt@i915_pm_rpm@system-suspend-devices.html
    - shard-hsw:          [SKIP][87] ([fdo#109271]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-hsw4/igt@i915_pm_rpm@system-suspend-devices.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4304/shard-hsw7/igt@i915_pm_rpm@system-suspend-devices.html
    - shard-tglb:         [SKIP][89] ([i915#1316]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-tglb6/igt@i915_pm_rpm@system-suspend-devices.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4304/shard-tglb5/igt@i915_pm_rpm@system-suspend-devices.html

  * igt@i915_pm_rps@waitboost:
    - shard-tglb:         [FAIL][91] ([i915#413]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-tglb7/igt@i915_pm_rps@waitboost.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4304/shard-tglb6/igt@i915_pm_rps@waitboost.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [FAIL][93] ([i915#72]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-glk1/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4304/shard-glk4/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render:
    - shard-kbl:          [FAIL][95] ([i915#49]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4304/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html
    - shard-glk:          [FAIL][97] ([i915#49]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-glk2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4304/shard-glk9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html
    - shard-apl:          [FAIL][99] ([i915#49]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-apl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4304/shard-apl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite:
    - shard-snb:          [DMESG-WARN][101] ([i915#478]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-snb6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4304/shard-snb4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [SKIP][103] ([fdo#109441]) -> [PASS][104] +1 similar issue
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb8/igt@kms_psr@psr2_no_drrs.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4304/shard-iclb2/igt@kms_psr@psr2_no_drrs.html

  * igt@kms_vblank@pipe-d-ts-continuation-modeset-hang:
    - shard-tglb:         [SKIP][105] ([fdo#112015]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-tglb3/igt@kms_vblank@pipe-d-ts-continuation-modeset-hang.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4304/shard-tglb3/igt@kms_vblank@pipe-d-ts-continuation-modeset-hang.html

  * igt@perf_pmu@most-busy-idle-check-all-bcs0:
    - shard-hsw:          [FAIL][107] -> [PASS][108] +1 similar issue
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-hsw5/igt@perf_pmu@most-busy-idle-check-all-bcs0.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4304/shard-hsw7/igt@perf_pmu@most-busy-idle-check-all-bcs0.html

  
#### Warnings ####

  * igt@gem_userptr_blits@map-fixed-invalidate-busy@gtt:
    - shard-hsw:          [DMESG-WARN][109] ([fdo#110789] / [i915#478]) -> [DMESG-WARN][110] ([i915#478])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-hsw5/igt@gem_userptr_blits@map-fixed-invalidate-busy@gtt.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4304/shard-hsw2/igt@gem_userptr_blits@map-fixed-invalidate-busy@gtt.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [SKIP][111] ([i915#468]) -> [FAIL][112] ([i915#454])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4304/shard-tglb1/igt@i915_pm_dc@dc6-dpms.html

  * igt@runner@aborted:
    - shard-hsw:          ([FAIL][113], [FAIL][114], [FAIL][115], [FAIL][116], [FAIL][117], [FAIL][118], [FAIL][119], [FAIL][120]) ([fdo#111870]) -> ([FAIL][121], [FAIL][122], [FAIL][123], [FAIL][124], [FAIL][125], [FAIL][126], [FAIL][127]) ([fdo#109271] / [fdo#111870])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-hsw6/igt@runner@aborted.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-hsw7/igt@runner@aborted.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-hsw6/igt@runner@aborted.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-hsw2/igt@runner@aborted.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-hsw1/igt@runner@aborted.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-hsw5/igt@runner@aborted.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-hsw5/igt@runner@aborted.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-hsw2/igt@runner@aborted.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4304/shard-hsw6/igt@runner@aborted.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4304/shard-hsw2/igt@runner@aborted.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4304/shard-hsw5/igt@runner@aborted.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4304/shard-hsw2/igt@runner@aborted.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4304/shard-hsw7/igt@runner@aborted.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4304/shard-hsw1/igt@runner@aborted.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4304/shard-hsw4/igt@runner@aborted.html
    - shard-kbl:          [FAIL][128] ([i915#92]) -> ([FAIL][129], [FAIL][130]) ([i915#1389] / [i915#1402] / [i915#92])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-kbl3/igt@runner@aborted.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4304/shard-kbl7/igt@runner@aborted.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4304/shard-kbl2/igt@runner@aborted.html
    - shard-apl:          ([FAIL][131], [FAIL][132]) ([fdo#103927] / [i915#1402]) -> [FAIL][133] ([fdo#103927])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-apl3/igt@runner@aborted.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-apl1/igt@runner@aborted.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4304/shard-apl4/igt@runner@aborted.html
    - shard-snb:          ([FAIL][134], [FAIL][135], [FAIL][136], [FAIL][137], [FAIL][138], [FAIL][139], [FAIL][140], [FAIL][141], [FAIL][142]) ([fdo#111870] / [i915#1077] / [i915#698]) -> ([FAIL][143], [FAIL][144], [FAIL][145], [FAIL][146], [FAIL][147], [FAIL][148], [FAIL][149], [FAIL][150]) ([fdo#111870] / [i915#1077])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-snb4/igt@runner@aborted.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-snb5/igt@runner@aborted.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-snb4/igt@runner@aborted.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-snb4/igt@runner@aborted.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-snb4/igt@runner@aborted.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-snb5/igt@runner@aborted.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-snb2/igt@runner@aborted.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-snb5/igt@runner@aborted.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-snb6/igt@runner@aborted.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4304/shard-snb6/igt@runner@aborted.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4304/shard-snb5/igt@runner@aborted.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4304/shard-snb4/igt@runner@aborted.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4304/shard-snb5/igt@runner@aborted.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4304/shard-snb4/igt@runner@aborted.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4304/shard-snb2/igt@runner@aborted.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4304/shard-snb6/igt@runner@aborted.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4304/shard-snb4/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112015]: https://bugs.freedesktop.org/show_bug.cgi?id=112015
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1077]: https://gitlab.freedesktop.org/drm/intel/issues/1077
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1389]: https://gitlab.freedesktop.org/drm/intel/issues/1389
  [i915#1402]: https://gitlab.freedesktop.org/drm/intel/issues/1402
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#447]: https://gitlab.freedesktop.org/drm/intel/issues/447
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#698]: https://gitlab.freedesktop.org/drm/intel/issues/698
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5510 -> IGTPW_4304
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8137: 5786b5e77cc17a1b494b9bdf3c3f29eedc2e2e7d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4304: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4304/index.html
  IGT_5510: e100092d50105463f58db531fa953c70cc58bb10 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4304/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
