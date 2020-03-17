Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 17 Mar 2020 13:01:50 -0000
Message-ID: <158445011068.5177.1378051527330633641@emeril.freedesktop.org>
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

  * igt@gem_exec_fence@basic-await@rcs0:
    - shard-kbl:          [PASS][1] -> [FAIL][2] +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-kbl1/igt@gem_exec_fence@basic-await@rcs0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-kbl7/igt@gem_exec_fence@basic-await@rcs0.html

  * igt@gem_exec_fence@basic-await@vcs1:
    - shard-tglb:         [PASS][3] -> [FAIL][4] +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-tglb6/igt@gem_exec_fence@basic-await@vcs1.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-tglb5/igt@gem_exec_fence@basic-await@vcs1.html

  * igt@gem_exec_fence@basic-await@vecs0:
    - shard-glk:          [PASS][5] -> ([FAIL][6], [FAIL][7]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-glk6/igt@gem_exec_fence@basic-await@vecs0.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-glk5/igt@gem_exec_fence@basic-await@vecs0.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-glk4/igt@gem_exec_fence@basic-await@vecs0.html
    - shard-apl:          [PASS][8] -> [FAIL][9] +1 similar issue
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-apl4/igt@gem_exec_fence@basic-await@vecs0.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-apl4/igt@gem_exec_fence@basic-await@vecs0.html

  * {igt@gem_userptr_blits@process-exit-mmap-busy@gtt} (NEW):
    - shard-iclb:         NOTRUN -> ([SKIP][10], [SKIP][11]) +7 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb8/igt@gem_userptr_blits@process-exit-mmap-busy@gtt.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb3/igt@gem_userptr_blits@process-exit-mmap-busy@gtt.html

  * {igt@gem_userptr_blits@process-exit-mmap-busy@uc} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][12] +11 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-tglb5/igt@gem_userptr_blits@process-exit-mmap-busy@uc.html

  * {igt@gem_userptr_blits@process-exit-mmap@wc} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][13] +3 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb1/igt@gem_userptr_blits@process-exit-mmap@wc.html

  
#### Warnings ####

  * igt@gem_exec_reloc@basic-spin-bsd:
    - shard-snb:          [FAIL][14] ([i915#757]) -> [TIMEOUT][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-snb4/igt@gem_exec_reloc@basic-spin-bsd.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-snb6/igt@gem_exec_reloc@basic-spin-bsd.html

  
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
    - Statuses : 10 skip(s)
    - Exec time: [0.0] s

  * igt@gem_userptr_blits@process-exit-mmap-busy@uc:
    - Statuses : 10 skip(s)
    - Exec time: [0.0] s

  * igt@gem_userptr_blits@process-exit-mmap-busy@wb:
    - Statuses : 10 skip(s)
    - Exec time: [0.0] s

  * igt@gem_userptr_blits@process-exit-mmap-busy@wc:
    - Statuses : 10 skip(s)
    - Exec time: [0.0] s

  * igt@gem_userptr_blits@process-exit-mmap@gtt:
    - Statuses : 9 skip(s)
    - Exec time: [0.0] s

  * igt@gem_userptr_blits@process-exit-mmap@uc:
    - Statuses : 9 skip(s)
    - Exec time: [0.0] s

  * igt@gem_userptr_blits@process-exit-mmap@wb:
    - Statuses : 9 skip(s)
    - Exec time: [0.0] s

  * igt@gem_userptr_blits@process-exit-mmap@wc:
    - Statuses : 9 skip(s)
    - Exec time: [0.0] s

  * igt@gem_userptr_blits@readonly-mmap-unsync@gtt:
    - Statuses : 5 pass(s) 5 skip(s)
    - Exec time: [0.01] s

  * igt@gem_userptr_blits@readonly-mmap-unsync@uc:
    - Statuses : 5 pass(s) 5 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@gem_userptr_blits@readonly-mmap-unsync@wb:
    - Statuses : 5 pass(s) 5 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@gem_userptr_blits@readonly-mmap-unsync@wc:
    - Statuses : 5 pass(s) 5 skip(s)
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
    - shard-kbl:          [PASS][16] -> [INCOMPLETE][17] ([i915#1402])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-kbl6/igt@gem_ctx_persistence@close-replace-race.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-kbl6/igt@gem_ctx_persistence@close-replace-race.html
    - shard-glk:          [PASS][18] -> ([INCOMPLETE][19], [TIMEOUT][20]) ([i915#1340] / [i915#1402] / [i915#58] / [k.org#198133])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-glk3/igt@gem_ctx_persistence@close-replace-race.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-glk2/igt@gem_ctx_persistence@close-replace-race.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-glk8/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [PASS][21] -> ([SKIP][22], [SKIP][23]) ([fdo#110841])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb5/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb1/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb4/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_fence@basic-await@vcs0:
    - shard-kbl:          [PASS][24] -> [FAIL][25] ([i915#1472])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-kbl1/igt@gem_exec_fence@basic-await@vcs0.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-kbl7/igt@gem_exec_fence@basic-await@vcs0.html
    - shard-iclb:         [PASS][26] -> ([FAIL][27], [FAIL][28]) ([i915#1472])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb1/igt@gem_exec_fence@basic-await@vcs0.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb5/igt@gem_exec_fence@basic-await@vcs0.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb7/igt@gem_exec_fence@basic-await@vcs0.html
    - shard-apl:          [PASS][29] -> [FAIL][30] ([i915#1472])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-apl4/igt@gem_exec_fence@basic-await@vcs0.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-apl4/igt@gem_exec_fence@basic-await@vcs0.html
    - shard-glk:          [PASS][31] -> ([FAIL][32], [FAIL][33]) ([i915#1472])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-glk6/igt@gem_exec_fence@basic-await@vcs0.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-glk4/igt@gem_exec_fence@basic-await@vcs0.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-glk5/igt@gem_exec_fence@basic-await@vcs0.html
    - shard-tglb:         [PASS][34] -> [FAIL][35] ([i915#1472])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-tglb6/igt@gem_exec_fence@basic-await@vcs0.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-tglb5/igt@gem_exec_fence@basic-await@vcs0.html

  * igt@gem_exec_schedule@implicit-both-bsd:
    - shard-iclb:         [PASS][36] -> ([SKIP][37], [PASS][38]) ([i915#677])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb6/igt@gem_exec_schedule@implicit-both-bsd.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb1/igt@gem_exec_schedule@implicit-both-bsd.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb3/igt@gem_exec_schedule@implicit-both-bsd.html

  * igt@gem_exec_schedule@implicit-write-read-bsd1:
    - shard-iclb:         [PASS][39] -> ([SKIP][40], [PASS][41]) ([fdo#109276] / [i915#677])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb2/igt@gem_exec_schedule@implicit-write-read-bsd1.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb7/igt@gem_exec_schedule@implicit-write-read-bsd1.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb1/igt@gem_exec_schedule@implicit-write-read-bsd1.html

  * igt@gem_exec_schedule@preempt-contexts-bsd:
    - shard-iclb:         [PASS][42] -> ([SKIP][43], [SKIP][44]) ([fdo#112146])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb6/igt@gem_exec_schedule@preempt-contexts-bsd.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb2/igt@gem_exec_schedule@preempt-contexts-bsd.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb4/igt@gem_exec_schedule@preempt-contexts-bsd.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [PASS][45] -> ([PASS][46], [SKIP][47]) ([fdo#112146]) +6 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb6/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb8/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb4/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd1:
    - shard-iclb:         [PASS][48] -> ([SKIP][49], [SKIP][50]) ([fdo#109276]) +5 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb4/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb6/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb5/igt@gem_exec_schedule@preempt-queue-bsd1.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-kbl:          [PASS][51] -> [INCOMPLETE][52] ([i915#155])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-kbl2/igt@gem_exec_suspend@basic-s3.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-kbl6/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [PASS][53] -> ([PASS][54], [FAIL][55]) ([i915#644])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-glk9/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-glk5/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-glk1/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_wait@wait-rcs0:
    - shard-hsw:          [PASS][56] -> [FAIL][57] ([i915#1462])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-hsw2/igt@gem_wait@wait-rcs0.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-hsw2/igt@gem_wait@wait-rcs0.html
    - shard-snb:          [PASS][58] -> [FAIL][59] ([i915#1462])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-snb4/igt@gem_wait@wait-rcs0.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-snb5/igt@gem_wait@wait-rcs0.html

  * igt@i915_pm_rps@waitboost:
    - shard-iclb:         [PASS][60] -> ([PASS][61], [FAIL][62]) ([i915#413])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb4/igt@i915_pm_rps@waitboost.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb1/igt@i915_pm_rps@waitboost.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb4/igt@i915_pm_rps@waitboost.html

  * igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic:
    - shard-snb:          [PASS][63] -> [FAIL][64] ([i915#1471])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-snb2/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-snb5/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-iclb:         [PASS][65] -> ([INCOMPLETE][66], [PASS][67]) ([i915#1185])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb5/igt@kms_fbcon_fbt@psr-suspend.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb3/igt@kms_fbcon_fbt@psr-suspend.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb1/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-kbl:          [PASS][68] -> [DMESG-WARN][69] ([i915#1297])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-kbl2/igt@kms_flip@flip-vs-expired-vblank.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-kbl1/igt@kms_flip@flip-vs-expired-vblank.html
    - shard-apl:          [PASS][70] -> ([DMESG-WARN][71], [DMESG-WARN][72]) ([i915#1297])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-apl6/igt@kms_flip@flip-vs-expired-vblank.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-apl4/igt@kms_flip@flip-vs-expired-vblank.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-apl1/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-apl:          [PASS][73] -> ([PASS][74], [DMESG-WARN][75]) ([i915#180]) +3 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-apl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-apl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-apl8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-kbl:          [PASS][76] -> [DMESG-WARN][77] ([i915#180]) +3 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-kbl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-kbl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_plane_lowres@pipe-c-tiling-x:
    - shard-hsw:          [PASS][78] -> [DMESG-WARN][79] ([i915#478])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-hsw7/igt@kms_plane_lowres@pipe-c-tiling-x.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-hsw2/igt@kms_plane_lowres@pipe-c-tiling-x.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [PASS][80] -> ([SKIP][81], [SKIP][82]) ([fdo#109441]) +1 similar issue
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb2/igt@kms_psr@psr2_cursor_render.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb4/igt@kms_psr@psr2_cursor_render.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb8/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][83] -> ([PASS][84], [SKIP][85]) ([fdo#109441]) +1 similar issue
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb1/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][86] -> ([FAIL][87], [PASS][88]) ([i915#31])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-apl2/igt@kms_setmode@basic.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-apl7/igt@kms_setmode@basic.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-apl4/igt@kms_setmode@basic.html
    - shard-glk:          [PASS][89] -> ([FAIL][90], [FAIL][91]) ([i915#31])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-glk2/igt@kms_setmode@basic.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-glk1/igt@kms_setmode@basic.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-glk5/igt@kms_setmode@basic.html
    - shard-kbl:          [PASS][92] -> [FAIL][93] ([i915#31])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-kbl7/igt@kms_setmode@basic.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-kbl4/igt@kms_setmode@basic.html

  * igt@perf_pmu@busy-no-semaphores-vcs1:
    - shard-iclb:         [PASS][94] -> ([SKIP][95], [PASS][96]) ([fdo#112080]) +5 similar issues
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb2/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb8/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb2/igt@perf_pmu@busy-no-semaphores-vcs1.html

  * igt@perf_pmu@busy-start-vcs1:
    - shard-iclb:         [PASS][97] -> [SKIP][98] ([fdo#112080]) +1 similar issue
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb2/igt@perf_pmu@busy-start-vcs1.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb6/igt@perf_pmu@busy-start-vcs1.html

  * igt@perf_pmu@init-busy-vcs1:
    - shard-iclb:         [PASS][99] -> ([SKIP][100], [SKIP][101]) ([fdo#112080]) +4 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb1/igt@perf_pmu@init-busy-vcs1.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb3/igt@perf_pmu@init-busy-vcs1.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb5/igt@perf_pmu@init-busy-vcs1.html

  * igt@prime_busy@wait-after-bsd2:
    - shard-iclb:         [PASS][102] -> [SKIP][103] ([fdo#109276]) +3 similar issues
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb1/igt@prime_busy@wait-after-bsd2.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb6/igt@prime_busy@wait-after-bsd2.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [PASS][104] -> ([PASS][105], [SKIP][106]) ([fdo#109276]) +12 similar issues
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb1/igt@prime_vgem@fence-wait-bsd2.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb2/igt@prime_vgem@fence-wait-bsd2.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb3/igt@prime_vgem@fence-wait-bsd2.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-snb:          [FAIL][107] ([i915#1462]) -> [PASS][108]
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-snb4/igt@gem_ctx_isolation@rcs0-s3.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-snb4/igt@gem_ctx_isolation@rcs0-s3.html
    - shard-hsw:          [FAIL][109] ([i915#1462]) -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-hsw5/igt@gem_ctx_isolation@rcs0-s3.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-hsw6/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-tglb:         [INCOMPLETE][111] ([i915#1402]) -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-tglb2/igt@gem_ctx_persistence@close-replace-race.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-tglb8/igt@gem_ctx_persistence@close-replace-race.html
    - shard-apl:          [INCOMPLETE][113] ([fdo#103927] / [i915#1402]) -> ([PASS][114], [PASS][115])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-apl1/igt@gem_ctx_persistence@close-replace-race.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-apl6/igt@gem_ctx_persistence@close-replace-race.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-apl2/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_eio@in-flight-contexts-1us:
    - shard-hsw:          [TIMEOUT][116] -> [PASS][117]
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-hsw1/igt@gem_eio@in-flight-contexts-1us.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-hsw5/igt@gem_eio@in-flight-contexts-1us.html

  * igt@gem_exec_parallel@bcs0-fds:
    - shard-apl:          [FAIL][118] ([i915#1470]) -> [PASS][119]
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-apl6/igt@gem_exec_parallel@bcs0-fds.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-apl6/igt@gem_exec_parallel@bcs0-fds.html
    - shard-iclb:         [FAIL][120] ([i915#1470]) -> ([PASS][121], [PASS][122])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb2/igt@gem_exec_parallel@bcs0-fds.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb3/igt@gem_exec_parallel@bcs0-fds.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb1/igt@gem_exec_parallel@bcs0-fds.html
    - shard-tglb:         [FAIL][123] ([i915#1470]) -> [PASS][124]
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-tglb3/igt@gem_exec_parallel@bcs0-fds.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-tglb6/igt@gem_exec_parallel@bcs0-fds.html
    - shard-glk:          [FAIL][125] ([i915#1470]) -> ([PASS][126], [PASS][127])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-glk8/igt@gem_exec_parallel@bcs0-fds.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-glk6/igt@gem_exec_parallel@bcs0-fds.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-glk3/igt@gem_exec_parallel@bcs0-fds.html

  * igt@gem_exec_parallel@vcs1:
    - shard-iclb:         [SKIP][128] ([fdo#112080]) -> [PASS][129]
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb5/igt@gem_exec_parallel@vcs1.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb1/igt@gem_exec_parallel@vcs1.html

  * igt@gem_exec_schedule@out-order-bsd2:
    - shard-iclb:         [SKIP][130] ([fdo#109276]) -> [PASS][131] +5 similar issues
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb5/igt@gem_exec_schedule@out-order-bsd2.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb1/igt@gem_exec_schedule@out-order-bsd2.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [SKIP][132] ([i915#677]) -> ([PASS][133], [PASS][134]) +1 similar issue
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb1/igt@gem_exec_schedule@pi-common-bsd.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb8/igt@gem_exec_schedule@pi-common-bsd.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb6/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_schedule@preempt-contexts-bsd2:
    - shard-iclb:         [SKIP][135] ([fdo#109276]) -> ([PASS][136], [PASS][137]) +6 similar issues
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb8/igt@gem_exec_schedule@preempt-contexts-bsd2.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb4/igt@gem_exec_schedule@preempt-contexts-bsd2.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb2/igt@gem_exec_schedule@preempt-contexts-bsd2.html

  * igt@gem_exec_schedule@preempt-hang-render:
    - shard-apl:          [SKIP][138] ([fdo#109271]) -> [PASS][139]
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-apl6/igt@gem_exec_schedule@preempt-hang-render.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-apl3/igt@gem_exec_schedule@preempt-hang-render.html
    - shard-glk:          [SKIP][140] ([fdo#109271]) -> ([PASS][141], [PASS][142]) +1 similar issue
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-glk8/igt@gem_exec_schedule@preempt-hang-render.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-glk2/igt@gem_exec_schedule@preempt-hang-render.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-glk3/igt@gem_exec_schedule@preempt-hang-render.html
    - shard-iclb:         [SKIP][143] ([i915#1467]) -> ([PASS][144], [PASS][145])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb2/igt@gem_exec_schedule@preempt-hang-render.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb4/igt@gem_exec_schedule@preempt-hang-render.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb8/igt@gem_exec_schedule@preempt-hang-render.html
    - shard-tglb:         [SKIP][146] ([i915#1467]) -> [PASS][147]
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-tglb3/igt@gem_exec_schedule@preempt-hang-render.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-tglb1/igt@gem_exec_schedule@preempt-hang-render.html
    - shard-kbl:          [SKIP][148] ([fdo#109271]) -> [PASS][149]
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-kbl7/igt@gem_exec_schedule@preempt-hang-render.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-kbl1/igt@gem_exec_schedule@preempt-hang-render.html

  * igt@gem_exec_schedule@reorder-wide-bsd:
    - shard-iclb:         [SKIP][150] ([fdo#112146]) -> ([PASS][151], [PASS][152]) +3 similar issues
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb2/igt@gem_exec_schedule@reorder-wide-bsd.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb7/igt@gem_exec_schedule@reorder-wide-bsd.html
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb5/igt@gem_exec_schedule@reorder-wide-bsd.html

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-snb:          [DMESG-WARN][153] ([fdo#111870] / [i915#478]) -> [PASS][154] +1 similar issue
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-snb5/igt@gem_userptr_blits@sync-unmap-cycles.html
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-snb2/igt@gem_userptr_blits@sync-unmap-cycles.html
    - shard-hsw:          [DMESG-WARN][155] ([fdo#111870]) -> [PASS][156]
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-hsw1/igt@gem_userptr_blits@sync-unmap-cycles.html
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-hsw2/igt@gem_userptr_blits@sync-unmap-cycles.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-kbl:          [DMESG-WARN][157] ([i915#180]) -> [PASS][158]
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-kbl2/igt@gem_workarounds@suspend-resume-fd.html
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-kbl2/igt@gem_workarounds@suspend-resume-fd.html

  * igt@i915_pm_rpm@system-suspend-devices:
    - shard-iclb:         [SKIP][159] ([i915#1316]) -> ([PASS][160], [PASS][161])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb1/igt@i915_pm_rpm@system-suspend-devices.html
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb5/igt@i915_pm_rpm@system-suspend-devices.html
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb7/igt@i915_pm_rpm@system-suspend-devices.html
    - shard-tglb:         [SKIP][162] ([i915#1316]) -> [PASS][163]
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-tglb6/igt@i915_pm_rpm@system-suspend-devices.html
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-tglb5/igt@i915_pm_rpm@system-suspend-devices.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [FAIL][164] ([i915#72]) -> ([PASS][165], [PASS][166])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-glk1/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-glk9/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-glk3/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-hsw:          [INCOMPLETE][167] ([i915#61]) -> [PASS][168]
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-hsw4/igt@kms_flip@flip-vs-suspend.html
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-hsw1/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render:
    - shard-kbl:          [FAIL][169] ([i915#49]) -> [PASS][170]
   [16

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
