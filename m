Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 17 Mar 2020 10:50:33 -0000
Message-ID: <158444223328.5177.1066652597143718918@emeril.freedesktop.org>
References: <20200316084543.15421-1-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20200316084543.15421-1-janusz.krzysztofik@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?gem=5Fuserptr=5Fblits=3A_Refresh_other_now_MMAP=5FGTT_dependent?=
 =?utf-8?q?_subtests_=28rev2=29?=
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
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/gem_userptr_blits: Refresh other now MMAP_GTT dependent subtests (rev2)
URL   : https://patchwork.freedesktop.org/series/74201/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8137_full -> IGTPW_4307_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4307_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4307_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4307_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_fence@basic-await@vcs0:
    - shard-kbl:          [PASS][1] -> [FAIL][2] +3 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-kbl1/igt@gem_exec_fence@basic-await@vcs0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-kbl7/igt@gem_exec_fence@basic-await@vcs0.html
    - shard-iclb:         [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb1/igt@gem_exec_fence@basic-await@vcs0.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb5/igt@gem_exec_fence@basic-await@vcs0.html
    - shard-apl:          [PASS][5] -> [FAIL][6] +2 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-apl4/igt@gem_exec_fence@basic-await@vcs0.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-apl4/igt@gem_exec_fence@basic-await@vcs0.html
    - shard-glk:          [PASS][7] -> [FAIL][8] +2 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-glk6/igt@gem_exec_fence@basic-await@vcs0.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-glk4/igt@gem_exec_fence@basic-await@vcs0.html
    - shard-tglb:         [PASS][9] -> [FAIL][10] +2 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-tglb6/igt@gem_exec_fence@basic-await@vcs0.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-tglb5/igt@gem_exec_fence@basic-await@vcs0.html

  * igt@gem_exec_whisper@basic-fds-forked-all:
    - shard-hsw:          NOTRUN -> [FAIL][11]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-hsw2/igt@gem_exec_whisper@basic-fds-forked-all.html

  * {igt@gem_userptr_blits@process-exit-mmap-busy@gtt} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][12] +7 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb3/igt@gem_userptr_blits@process-exit-mmap-busy@gtt.html

  * {igt@gem_userptr_blits@process-exit-mmap-busy@uc} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][13] +11 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-tglb5/igt@gem_userptr_blits@process-exit-mmap-busy@uc.html

  * igt@gem_wait@wait-rcs0:
    - shard-hsw:          [PASS][14] -> [FAIL][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-hsw2/igt@gem_wait@wait-rcs0.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-hsw2/igt@gem_wait@wait-rcs0.html

  * igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic:
    - shard-snb:          [PASS][16] -> [FAIL][17] +1 similar issue
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-snb2/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-snb5/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic.html

  
#### Warnings ####

  * igt@gem_exec_reloc@basic-spin-bsd:
    - shard-snb:          [FAIL][18] ([i915#757]) -> [TIMEOUT][19]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-snb4/igt@gem_exec_reloc@basic-spin-bsd.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-snb6/igt@gem_exec_reloc@basic-spin-bsd.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8137_full and IGTPW_4307_full:

### New IGT tests (17) ###

  * igt@gem_userptr_blits@process-exit-mmap:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_userptr_blits@process-exit-mmap-busy:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_userptr_blits@process-exit-mmap-busy@gtt:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@gem_userptr_blits@process-exit-mmap-busy@uc:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@gem_userptr_blits@process-exit-mmap-busy@wb:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@gem_userptr_blits@process-exit-mmap-busy@wc:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@gem_userptr_blits@process-exit-mmap@gtt:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@gem_userptr_blits@process-exit-mmap@uc:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@gem_userptr_blits@process-exit-mmap@wb:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@gem_userptr_blits@process-exit-mmap@wc:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@gem_userptr_blits@readonly-mmap-unsync@gtt:
    - Statuses : 3 pass(s) 4 skip(s)
    - Exec time: [0.01] s

  * igt@gem_userptr_blits@readonly-mmap-unsync@uc:
    - Statuses : 3 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@gem_userptr_blits@readonly-mmap-unsync@wb:
    - Statuses : 3 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@gem_userptr_blits@readonly-mmap-unsync@wc:
    - Statuses : 3 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@sysfs_heartbeat_interval@off:
    - Statuses :
    - Exec time: [None] s

  * igt@sysfs_heartbeat_interval@precise:
    - Statuses :
    - Exec time: [None] s

  * igt@sysfs_preempt_timeout@idempotent:
    - Statuses :
    - Exec time: [None] s

  

Known issues
------------

  Here are the changes found in IGTPW_4307_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-kbl:          [PASS][20] -> [INCOMPLETE][21] ([i915#1402])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-kbl6/igt@gem_ctx_persistence@close-replace-race.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-kbl6/igt@gem_ctx_persistence@close-replace-race.html
    - shard-glk:          [PASS][22] -> [TIMEOUT][23] ([i915#1340])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-glk3/igt@gem_ctx_persistence@close-replace-race.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-glk8/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [PASS][24] -> [SKIP][25] ([fdo#110841])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb5/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb1/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_schedule@implicit-write-read-bsd1:
    - shard-iclb:         [PASS][26] -> [SKIP][27] ([fdo#109276] / [i915#677])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb2/igt@gem_exec_schedule@implicit-write-read-bsd1.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb7/igt@gem_exec_schedule@implicit-write-read-bsd1.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [PASS][28] -> [SKIP][29] ([fdo#112146]) +4 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb6/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb4/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd1:
    - shard-iclb:         [PASS][30] -> [SKIP][31] ([fdo#109276]) +13 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb4/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb5/igt@gem_exec_schedule@preempt-queue-bsd1.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-kbl:          [PASS][32] -> [INCOMPLETE][33] ([i915#155])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-kbl2/igt@gem_exec_suspend@basic-s3.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-kbl6/igt@gem_exec_suspend@basic-s3.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-iclb:         [PASS][34] -> [INCOMPLETE][35] ([i915#1185])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb5/igt@kms_fbcon_fbt@psr-suspend.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb3/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-kbl:          [PASS][36] -> [DMESG-WARN][37] ([i915#1297])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-kbl2/igt@kms_flip@flip-vs-expired-vblank.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-kbl1/igt@kms_flip@flip-vs-expired-vblank.html
    - shard-apl:          [PASS][38] -> [DMESG-WARN][39] ([i915#1297])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-apl6/igt@kms_flip@flip-vs-expired-vblank.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-apl4/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-apl:          [PASS][40] -> [DMESG-WARN][41] ([i915#180])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-apl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-apl8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-kbl:          [PASS][42] -> [DMESG-WARN][43] ([i915#180]) +3 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-kbl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-kbl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_plane_lowres@pipe-c-tiling-x:
    - shard-hsw:          [PASS][44] -> [DMESG-WARN][45] ([i915#478])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-hsw7/igt@kms_plane_lowres@pipe-c-tiling-x.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-hsw2/igt@kms_plane_lowres@pipe-c-tiling-x.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][46] -> [SKIP][47] ([fdo#109441]) +2 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb1/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][48] -> [FAIL][49] ([i915#31])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-apl2/igt@kms_setmode@basic.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-apl7/igt@kms_setmode@basic.html
    - shard-glk:          [PASS][50] -> [FAIL][51] ([i915#31])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-glk2/igt@kms_setmode@basic.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-glk5/igt@kms_setmode@basic.html
    - shard-kbl:          [PASS][52] -> [FAIL][53] ([i915#31])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-kbl7/igt@kms_setmode@basic.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-kbl4/igt@kms_setmode@basic.html

  * igt@perf_pmu@busy-no-semaphores-vcs1:
    - shard-iclb:         [PASS][54] -> [SKIP][55] ([fdo#112080]) +11 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb2/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb8/igt@perf_pmu@busy-no-semaphores-vcs1.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-snb:          [FAIL][56] -> [PASS][57] +1 similar issue
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-snb4/igt@gem_ctx_isolation@rcs0-s3.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-snb4/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-tglb:         [INCOMPLETE][58] ([i915#1402]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-tglb2/igt@gem_ctx_persistence@close-replace-race.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-tglb8/igt@gem_ctx_persistence@close-replace-race.html
    - shard-apl:          [INCOMPLETE][60] ([fdo#103927] / [i915#1402]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-apl1/igt@gem_ctx_persistence@close-replace-race.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-apl2/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_eio@in-flight-contexts-1us:
    - shard-hsw:          [TIMEOUT][62] -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-hsw1/igt@gem_eio@in-flight-contexts-1us.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-hsw5/igt@gem_eio@in-flight-contexts-1us.html

  * igt@gem_exec_parallel@bcs0-fds:
    - shard-apl:          [FAIL][64] -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-apl6/igt@gem_exec_parallel@bcs0-fds.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-apl6/igt@gem_exec_parallel@bcs0-fds.html
    - shard-iclb:         [FAIL][66] -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb2/igt@gem_exec_parallel@bcs0-fds.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb1/igt@gem_exec_parallel@bcs0-fds.html
    - shard-tglb:         [FAIL][68] -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-tglb3/igt@gem_exec_parallel@bcs0-fds.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-tglb6/igt@gem_exec_parallel@bcs0-fds.html
    - shard-glk:          [FAIL][70] -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-glk8/igt@gem_exec_parallel@bcs0-fds.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-glk3/igt@gem_exec_parallel@bcs0-fds.html

  * igt@gem_exec_schedule@implicit-read-write-bsd2:
    - shard-iclb:         [SKIP][72] ([fdo#109276] / [i915#677]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb8/igt@gem_exec_schedule@implicit-read-write-bsd2.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb4/igt@gem_exec_schedule@implicit-read-write-bsd2.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [SKIP][74] ([i915#677]) -> [PASS][75] +1 similar issue
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb1/igt@gem_exec_schedule@pi-common-bsd.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb6/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_schedule@preempt-hang-render:
    - shard-apl:          [SKIP][76] ([fdo#109271]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-apl6/igt@gem_exec_schedule@preempt-hang-render.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-apl3/igt@gem_exec_schedule@preempt-hang-render.html
    - shard-glk:          [SKIP][78] ([fdo#109271]) -> [PASS][79] +1 similar issue
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-glk8/igt@gem_exec_schedule@preempt-hang-render.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-glk2/igt@gem_exec_schedule@preempt-hang-render.html
    - shard-iclb:         [SKIP][80] ([i915#1467]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb2/igt@gem_exec_schedule@preempt-hang-render.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb4/igt@gem_exec_schedule@preempt-hang-render.html
    - shard-tglb:         [SKIP][82] ([i915#1467]) -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-tglb3/igt@gem_exec_schedule@preempt-hang-render.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-tglb1/igt@gem_exec_schedule@preempt-hang-render.html
    - shard-kbl:          [SKIP][84] ([fdo#109271]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-kbl7/igt@gem_exec_schedule@preempt-hang-render.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-kbl1/igt@gem_exec_schedule@preempt-hang-render.html

  * igt@gem_exec_schedule@reorder-wide-bsd:
    - shard-iclb:         [SKIP][86] ([fdo#112146]) -> [PASS][87] +5 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb2/igt@gem_exec_schedule@reorder-wide-bsd.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb5/igt@gem_exec_schedule@reorder-wide-bsd.html

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-snb:          [DMESG-WARN][88] ([fdo#111870] / [i915#478]) -> [PASS][89] +1 similar issue
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-snb5/igt@gem_userptr_blits@sync-unmap-cycles.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-snb2/igt@gem_userptr_blits@sync-unmap-cycles.html
    - shard-hsw:          [DMESG-WARN][90] ([fdo#111870]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-hsw1/igt@gem_userptr_blits@sync-unmap-cycles.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-hsw2/igt@gem_userptr_blits@sync-unmap-cycles.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-kbl:          [DMESG-WARN][92] ([i915#180]) -> [PASS][93]
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-kbl2/igt@gem_workarounds@suspend-resume-fd.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-kbl2/igt@gem_workarounds@suspend-resume-fd.html

  * igt@i915_pm_dc@dc5-dpms:
    - shard-iclb:         [FAIL][94] ([i915#447]) -> [PASS][95]
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb3/igt@i915_pm_dc@dc5-dpms.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb1/igt@i915_pm_dc@dc5-dpms.html

  * igt@i915_pm_rpm@system-suspend-devices:
    - shard-iclb:         [SKIP][96] ([i915#1316]) -> [PASS][97]
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb1/igt@i915_pm_rpm@system-suspend-devices.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb5/igt@i915_pm_rpm@system-suspend-devices.html
    - shard-tglb:         [SKIP][98] ([i915#1316]) -> [PASS][99]
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-tglb6/igt@i915_pm_rpm@system-suspend-devices.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-tglb5/igt@i915_pm_rpm@system-suspend-devices.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [FAIL][100] ([i915#72]) -> [PASS][101]
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-glk1/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-glk9/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-hsw:          [INCOMPLETE][102] ([i915#61]) -> [PASS][103]
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-hsw4/igt@kms_flip@flip-vs-suspend.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-hsw1/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render:
    - shard-kbl:          [FAIL][104] ([i915#49]) -> [PASS][105]
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html
    - shard-glk:          [FAIL][106] ([i915#49]) -> [PASS][107]
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-glk2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-glk5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html
    - shard-apl:          [FAIL][108] ([i915#49]) -> [PASS][109]
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-apl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-apl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite:
    - shard-snb:          [DMESG-WARN][110] ([i915#478]) -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-snb6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-snb6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-apl:          [DMESG-WARN][112] ([i915#180]) -> [PASS][113]
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-apl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-apl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [SKIP][114] ([fdo#109441]) -> [PASS][115] +1 similar issue
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb3/igt@kms_psr@psr2_primary_page_flip.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html

  * igt@kms_vblank@pipe-d-ts-continuation-modeset-hang:
    - shard-tglb:         [SKIP][116] ([fdo#112015]) -> [PASS][117]
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-tglb3/igt@kms_vblank@pipe-d-ts-continuation-modeset-hang.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-tglb1/igt@kms_vblank@pipe-d-ts-continuation-modeset-hang.html

  * igt@perf_pmu@busy-vcs1:
    - shard-iclb:         [SKIP][118] ([fdo#112080]) -> [PASS][119] +15 similar issues
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb6/igt@perf_pmu@busy-vcs1.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb1/igt@perf_pmu@busy-vcs1.html

  * igt@perf_pmu@most-busy-idle-check-all-bcs0:
    - shard-hsw:          [FAIL][120] -> [PASS][121] +1 similar issue
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-hsw5/igt@perf_pmu@most-busy-idle-check-all-bcs0.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-hsw6/igt@perf_pmu@most-busy-idle-check-all-bcs0.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [SKIP][122] ([fdo#109276]) -> [PASS][123] +20 similar issues
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb8/igt@prime_busy@hang-bsd2.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb2/igt@prime_busy@hang-bsd2.html

  
#### Warnings ####

  * igt@gem_userptr_blits@map-fixed-invalidate-busy@gtt:
    - shard-hsw:          [DMESG-WARN][124] ([fdo#110789] / [i915#478]) -> [DMESG-WARN][125] ([i915#478])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-hsw5/igt@gem_userptr_blits@map-fixed-invalidate-busy@gtt.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-hsw5/igt@gem_userptr_blits@map-fixed-invalidate-busy@gtt.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup@gtt:
    - shard-hsw:          [DMESG-WARN][126] ([i915#478]) -> [DMESG-WARN][127] ([fdo#110789] / [i915#478])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-hsw2/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup@gtt.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-hsw2/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup@gtt.html
    - shard-snb:          [DMESG-WARN][128] ([i915#478]) -> [DMESG-WARN][129] ([fdo#110789] / [i915#478])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-snb2/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup@gtt.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-snb4/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup@gtt.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [SKIP][130] ([i915#468]) -> [FAIL][131] ([i915#454])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-tglb8/igt@i915_pm_dc@dc6-dpms.html

  * igt@runner@aborted:
    - shard-kbl:          [FAIL][132] ([i915#92]) -> ([FAIL][133], [FAIL][134]) ([i915#1389] / [i915#1402] / [i915#92])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-kbl3/igt@runner@aborted.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-kbl6/igt@runner@aborted.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-kbl6/igt@runner@aborted.html
    - shard-apl:          ([FAIL][135], [FAIL][136]) ([fdo#103927] / [i915#1402]) -> [FAIL][137] ([fdo#103927])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-apl3/igt@runner@aborted.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-apl1/igt@runner@aborted.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-apl1/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112015]: https://bugs.freedesktop.org/show_bug.cgi?id=112015
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1185]: https://gitlab.freedesktop.org/drm/intel/issues/1185
  [i915#1297]: https://gitlab.freedesktop.org/drm/intel/issues/1297
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1340]: https://gitlab.freedesktop.org/drm/intel/issues/1340
  [i915#1389]: https://gitlab.freedesktop.org/drm/intel/issues/1389
  [i915#1402]: https://gitlab.freedesktop.org/drm/intel/issues/1402
  [i915#1467]: https://gitlab.freedesktop.org/drm/intel/issues/1467
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#447]: https://gitlab.freedesktop.org/drm/intel/issues/447
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#757]: https://gitlab.freedesktop.org/drm/intel/issues/757
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5510 -> IGTPW_4307
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8137: 5786b5e77cc17a1b494b9bdf3c3f29eedc2e2e7d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4307: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/index.html
  IGT_5510: e100092d50105463f58db531fa953c70cc58bb10 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
