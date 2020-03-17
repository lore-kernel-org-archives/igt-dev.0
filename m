Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 17 Mar 2020 17:18:25 -0000
Message-ID: <158446550531.5179.4666005416542237901@emeril.freedesktop.org>
References: <20200316084543.15421-1-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20200316084543.15421-1-janusz.krzysztofik@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
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
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8137_full -> IGTPW_4307_full
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with IGTPW_4307_full need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4307_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4307_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_userptr_blits@process-exit-mmap-busy@gtt} (NEW):
    - shard-iclb:         NOTRUN -> ([SKIP][1], [SKIP][2]) +7 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb3/igt@gem_userptr_blits@process-exit-mmap-busy@gtt.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb8/igt@gem_userptr_blits@process-exit-mmap-busy@gtt.html

  * {igt@gem_userptr_blits@process-exit-mmap-busy@uc} (NEW):
    - shard-tglb:         NOTRUN -> ([SKIP][3], [SKIP][4]) +11 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-tglb5/igt@gem_userptr_blits@process-exit-mmap-busy@uc.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-tglb3/igt@gem_userptr_blits@process-exit-mmap-busy@uc.html

  * {igt@gem_userptr_blits@process-exit-mmap@wc} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][5] +3 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb1/igt@gem_userptr_blits@process-exit-mmap@wc.html

  
#### Warnings ####

  * igt@gem_exec_reloc@basic-spin-bsd:
    - shard-snb:          [FAIL][6] ([i915#757]) -> [TIMEOUT][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-snb4/igt@gem_exec_reloc@basic-spin-bsd.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-snb6/igt@gem_exec_reloc@basic-spin-bsd.html

  
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
    - Statuses : 13 skip(s)
    - Exec time: [0.0] s

  * igt@gem_userptr_blits@process-exit-mmap-busy@uc:
    - Statuses : 13 skip(s)
    - Exec time: [0.0] s

  * igt@gem_userptr_blits@process-exit-mmap-busy@wb:
    - Statuses : 13 skip(s)
    - Exec time: [0.0] s

  * igt@gem_userptr_blits@process-exit-mmap-busy@wc:
    - Statuses : 13 skip(s)
    - Exec time: [0.0] s

  * igt@gem_userptr_blits@process-exit-mmap@gtt:
    - Statuses : 12 skip(s)
    - Exec time: [0.0] s

  * igt@gem_userptr_blits@process-exit-mmap@uc:
    - Statuses : 12 skip(s)
    - Exec time: [0.0] s

  * igt@gem_userptr_blits@process-exit-mmap@wb:
    - Statuses : 12 skip(s)
    - Exec time: [0.0] s

  * igt@gem_userptr_blits@process-exit-mmap@wc:
    - Statuses : 12 skip(s)
    - Exec time: [0.0] s

  * igt@gem_userptr_blits@readonly-mmap-unsync@gtt:
    - Statuses : 6 pass(s) 7 skip(s)
    - Exec time: [0.01] s

  * igt@gem_userptr_blits@readonly-mmap-unsync@uc:
    - Statuses : 6 pass(s) 7 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@gem_userptr_blits@readonly-mmap-unsync@wb:
    - Statuses : 6 pass(s) 7 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@gem_userptr_blits@readonly-mmap-unsync@wc:
    - Statuses : 6 pass(s) 7 skip(s)
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
    - shard-kbl:          [PASS][8] -> ([INCOMPLETE][9], [INCOMPLETE][10]) ([i915#1402])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-kbl6/igt@gem_ctx_persistence@close-replace-race.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-kbl6/igt@gem_ctx_persistence@close-replace-race.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-kbl2/igt@gem_ctx_persistence@close-replace-race.html
    - shard-glk:          [PASS][11] -> ([TIMEOUT][12], [INCOMPLETE][13]) ([i915#1340] / [i915#1402] / [i915#58] / [k.org#198133])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-glk3/igt@gem_ctx_persistence@close-replace-race.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-glk8/igt@gem_ctx_persistence@close-replace-race.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-glk2/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [PASS][14] -> ([SKIP][15], [SKIP][16]) ([fdo#110841])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb5/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb1/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb4/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_fence@basic-await@vcs0:
    - shard-kbl:          [PASS][17] -> [FAIL][18] ([i915#1472]) +3 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-kbl1/igt@gem_exec_fence@basic-await@vcs0.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-kbl7/igt@gem_exec_fence@basic-await@vcs0.html
    - shard-iclb:         [PASS][19] -> ([FAIL][20], [FAIL][21]) ([i915#1472])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb1/igt@gem_exec_fence@basic-await@vcs0.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb5/igt@gem_exec_fence@basic-await@vcs0.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb7/igt@gem_exec_fence@basic-await@vcs0.html
    - shard-apl:          [PASS][22] -> ([FAIL][23], [FAIL][24]) ([i915#1472]) +2 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-apl4/igt@gem_exec_fence@basic-await@vcs0.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-apl6/igt@gem_exec_fence@basic-await@vcs0.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-apl4/igt@gem_exec_fence@basic-await@vcs0.html
    - shard-glk:          [PASS][25] -> ([FAIL][26], [FAIL][27]) ([i915#1472]) +2 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-glk6/igt@gem_exec_fence@basic-await@vcs0.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-glk4/igt@gem_exec_fence@basic-await@vcs0.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-glk5/igt@gem_exec_fence@basic-await@vcs0.html
    - shard-tglb:         [PASS][28] -> ([FAIL][29], [PASS][30]) ([i915#1472])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-tglb6/igt@gem_exec_fence@basic-await@vcs0.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-tglb5/igt@gem_exec_fence@basic-await@vcs0.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-tglb3/igt@gem_exec_fence@basic-await@vcs0.html

  * igt@gem_exec_fence@basic-await@vcs1:
    - shard-tglb:         [PASS][31] -> ([FAIL][32], [FAIL][33]) ([i915#1472]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-tglb6/igt@gem_exec_fence@basic-await@vcs1.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-tglb5/igt@gem_exec_fence@basic-await@vcs1.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-tglb3/igt@gem_exec_fence@basic-await@vcs1.html

  * igt@gem_exec_schedule@implicit-both-bsd:
    - shard-iclb:         [PASS][34] -> ([SKIP][35], [PASS][36]) ([i915#677])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb6/igt@gem_exec_schedule@implicit-both-bsd.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb1/igt@gem_exec_schedule@implicit-both-bsd.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb3/igt@gem_exec_schedule@implicit-both-bsd.html

  * igt@gem_exec_schedule@implicit-write-read-bsd1:
    - shard-iclb:         [PASS][37] -> ([SKIP][38], [PASS][39]) ([fdo#109276] / [i915#677])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb2/igt@gem_exec_schedule@implicit-write-read-bsd1.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb7/igt@gem_exec_schedule@implicit-write-read-bsd1.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb1/igt@gem_exec_schedule@implicit-write-read-bsd1.html

  * igt@gem_exec_schedule@preempt-contexts-bsd:
    - shard-iclb:         [PASS][40] -> ([SKIP][41], [SKIP][42]) ([fdo#112146])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb6/igt@gem_exec_schedule@preempt-contexts-bsd.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb2/igt@gem_exec_schedule@preempt-contexts-bsd.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb4/igt@gem_exec_schedule@preempt-contexts-bsd.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [PASS][43] -> ([SKIP][44], [PASS][45]) ([fdo#112146]) +6 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb6/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb4/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb8/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd1:
    - shard-iclb:         [PASS][46] -> ([SKIP][47], [SKIP][48]) ([fdo#109276]) +5 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb4/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb5/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb6/igt@gem_exec_schedule@preempt-queue-bsd1.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-kbl:          [PASS][49] -> ([INCOMPLETE][50], [INCOMPLETE][51]) ([i915#155])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-kbl2/igt@gem_exec_suspend@basic-s3.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-kbl6/igt@gem_exec_suspend@basic-s3.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-kbl2/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [PASS][52] -> ([PASS][53], [FAIL][54]) ([i915#644])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-glk9/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-glk5/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-glk1/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_tiled_wb:
    - shard-hsw:          [PASS][55] -> ([PASS][56], [INCOMPLETE][57]) ([i915#61])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-hsw7/igt@gem_tiled_wb.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-hsw5/igt@gem_tiled_wb.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-hsw1/igt@gem_tiled_wb.html

  * igt@gem_wait@wait-rcs0:
    - shard-hsw:          [PASS][58] -> ([FAIL][59], [FAIL][60]) ([i915#1462])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-hsw2/igt@gem_wait@wait-rcs0.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-hsw2/igt@gem_wait@wait-rcs0.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-hsw6/igt@gem_wait@wait-rcs0.html
    - shard-snb:          [PASS][61] -> ([FAIL][62], [FAIL][63]) ([i915#1462])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-snb4/igt@gem_wait@wait-rcs0.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-snb5/igt@gem_wait@wait-rcs0.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-snb4/igt@gem_wait@wait-rcs0.html

  * igt@i915_pm_rps@waitboost:
    - shard-iclb:         [PASS][64] -> ([FAIL][65], [PASS][66]) ([i915#413])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb4/igt@i915_pm_rps@waitboost.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb4/igt@i915_pm_rps@waitboost.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb1/igt@i915_pm_rps@waitboost.html

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - shard-hsw:          [PASS][67] -> ([PASS][68], [FAIL][69]) ([i915#57])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-hsw1/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-hsw4/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-hsw5/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  * igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic:
    - shard-snb:          [PASS][70] -> ([FAIL][71], [FAIL][72]) ([i915#1471])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-snb2/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-snb4/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-snb5/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-iclb:         [PASS][73] -> ([INCOMPLETE][74], [PASS][75]) ([i915#1185])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb5/igt@kms_fbcon_fbt@psr-suspend.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb3/igt@kms_fbcon_fbt@psr-suspend.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb1/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-kbl:          [PASS][76] -> ([DMESG-WARN][77], [DMESG-WARN][78]) ([i915#1297])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-kbl2/igt@kms_flip@flip-vs-expired-vblank.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-kbl1/igt@kms_flip@flip-vs-expired-vblank.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-kbl7/igt@kms_flip@flip-vs-expired-vblank.html
    - shard-apl:          [PASS][79] -> ([DMESG-WARN][80], [DMESG-WARN][81]) ([i915#1297])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-apl6/igt@kms_flip@flip-vs-expired-vblank.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-apl4/igt@kms_flip@flip-vs-expired-vblank.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-apl1/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-kbl:          [PASS][82] -> ([DMESG-WARN][83], [DMESG-WARN][84]) ([i915#180]) +1 similar issue
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-apl:          [PASS][85] -> ([PASS][86], [DMESG-WARN][87]) ([i915#180]) +4 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-apl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-apl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-apl8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-kbl:          [PASS][88] -> ([PASS][89], [DMESG-WARN][90]) ([i915#180]) +3 similar issues
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-kbl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-kbl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-kbl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_plane_lowres@pipe-c-tiling-x:
    - shard-hsw:          [PASS][91] -> ([DMESG-WARN][92], [DMESG-WARN][93]) ([i915#478])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-hsw7/igt@kms_plane_lowres@pipe-c-tiling-x.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-hsw2/igt@kms_plane_lowres@pipe-c-tiling-x.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-hsw4/igt@kms_plane_lowres@pipe-c-tiling-x.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [PASS][94] -> ([SKIP][95], [SKIP][96]) ([fdo#109441]) +1 similar issue
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb2/igt@kms_psr@psr2_cursor_render.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb4/igt@kms_psr@psr2_cursor_render.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb8/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][97] -> ([SKIP][98], [PASS][99]) ([fdo#109441]) +1 similar issue
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb1/igt@kms_psr@psr2_sprite_plane_move.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][100] -> ([FAIL][101], [PASS][102]) ([i915#31])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-apl2/igt@kms_setmode@basic.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-apl7/igt@kms_setmode@basic.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-apl4/igt@kms_setmode@basic.html
    - shard-glk:          [PASS][103] -> ([FAIL][104], [FAIL][105]) ([i915#31])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-glk2/igt@kms_setmode@basic.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-glk1/igt@kms_setmode@basic.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-glk5/igt@kms_setmode@basic.html
    - shard-kbl:          [PASS][106] -> ([FAIL][107], [FAIL][108]) ([i915#31])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-kbl7/igt@kms_setmode@basic.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-kbl6/igt@kms_setmode@basic.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-kbl4/igt@kms_setmode@basic.html

  * igt@perf_pmu@busy-no-semaphores-vcs1:
    - shard-iclb:         [PASS][109] -> ([PASS][110], [SKIP][111]) ([fdo#112080]) +5 similar issues
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb2/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb2/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb8/igt@perf_pmu@busy-no-semaphores-vcs1.html

  * igt@perf_pmu@busy-start-vcs1:
    - shard-iclb:         [PASS][112] -> [SKIP][113] ([fdo#112080]) +1 similar issue
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb2/igt@perf_pmu@busy-start-vcs1.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb6/igt@perf_pmu@busy-start-vcs1.html

  * igt@perf_pmu@init-busy-vcs1:
    - shard-iclb:         [PASS][114] -> ([SKIP][115], [SKIP][116]) ([fdo#112080]) +4 similar issues
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb1/igt@perf_pmu@init-busy-vcs1.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb5/igt@perf_pmu@init-busy-vcs1.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb3/igt@perf_pmu@init-busy-vcs1.html

  * igt@prime_busy@wait-after-bsd2:
    - shard-iclb:         [PASS][117] -> [SKIP][118] ([fdo#109276]) +3 similar issues
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb1/igt@prime_busy@wait-after-bsd2.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb6/igt@prime_busy@wait-after-bsd2.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [PASS][119] -> ([SKIP][120], [PASS][121]) ([fdo#109276]) +12 similar issues
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb1/igt@prime_vgem@fence-wait-bsd2.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb3/igt@prime_vgem@fence-wait-bsd2.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb2/igt@prime_vgem@fence-wait-bsd2.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-snb:          [FAIL][122] ([i915#1462]) -> ([PASS][123], [PASS][124])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-snb4/igt@gem_ctx_isolation@rcs0-s3.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-snb4/igt@gem_ctx_isolation@rcs0-s3.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-snb5/igt@gem_ctx_isolation@rcs0-s3.html
    - shard-hsw:          [FAIL][125] ([i915#1462]) -> ([PASS][126], [PASS][127])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-hsw5/igt@gem_ctx_isolation@rcs0-s3.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-hsw1/igt@gem_ctx_isolation@rcs0-s3.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-hsw6/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-apl:          [INCOMPLETE][128] ([fdo#103927] / [i915#1402]) -> ([PASS][129], [PASS][130])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-apl1/igt@gem_ctx_persistence@close-replace-race.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-apl6/igt@gem_ctx_persistence@close-replace-race.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-apl2/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_eio@in-flight-contexts-1us:
    - shard-hsw:          [TIMEOUT][131] -> [PASS][132]
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-hsw1/igt@gem_eio@in-flight-contexts-1us.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-hsw5/igt@gem_eio@in-flight-contexts-1us.html

  * igt@gem_exec_parallel@bcs0-fds:
    - shard-apl:          [FAIL][133] ([i915#1470]) -> ([PASS][134], [PASS][135])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-apl6/igt@gem_exec_parallel@bcs0-fds.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-apl6/igt@gem_exec_parallel@bcs0-fds.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-apl2/igt@gem_exec_parallel@bcs0-fds.html
    - shard-iclb:         [FAIL][136] ([i915#1470]) -> ([PASS][137], [PASS][138])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb2/igt@gem_exec_parallel@bcs0-fds.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb3/igt@gem_exec_parallel@bcs0-fds.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb1/igt@gem_exec_parallel@bcs0-fds.html
    - shard-tglb:         [FAIL][139] ([i915#1470]) -> [PASS][140]
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-tglb3/igt@gem_exec_parallel@bcs0-fds.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-tglb6/igt@gem_exec_parallel@bcs0-fds.html
    - shard-glk:          [FAIL][141] ([i915#1470]) -> ([PASS][142], [PASS][143])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-glk8/igt@gem_exec_parallel@bcs0-fds.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-glk6/igt@gem_exec_parallel@bcs0-fds.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-glk3/igt@gem_exec_parallel@bcs0-fds.html

  * igt@gem_exec_parallel@vcs1:
    - shard-iclb:         [SKIP][144] ([fdo#112080]) -> [PASS][145]
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb5/igt@gem_exec_parallel@vcs1.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb1/igt@gem_exec_parallel@vcs1.html

  * igt@gem_exec_schedule@out-order-bsd2:
    - shard-iclb:         [SKIP][146] ([fdo#109276]) -> [PASS][147] +1 similar issue
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb5/igt@gem_exec_schedule@out-order-bsd2.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb1/igt@gem_exec_schedule@out-order-bsd2.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [SKIP][148] ([i915#677]) -> ([PASS][149], [PASS][150]) +1 similar issue
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb1/igt@gem_exec_schedule@pi-common-bsd.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb8/igt@gem_exec_schedule@pi-common-bsd.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb6/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_schedule@preempt-contexts-bsd2:
    - shard-iclb:         [SKIP][151] ([fdo#109276]) -> ([PASS][152], [PASS][153]) +10 similar issues
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb8/igt@gem_exec_schedule@preempt-contexts-bsd2.html
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb4/igt@gem_exec_schedule@preempt-contexts-bsd2.html
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb2/igt@gem_exec_schedule@preempt-contexts-bsd2.html

  * igt@gem_exec_schedule@preempt-hang-render:
    - shard-apl:          [SKIP][154] ([fdo#109271]) -> [PASS][155]
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-apl6/igt@gem_exec_schedule@preempt-hang-render.html
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-apl3/igt@gem_exec_schedule@preempt-hang-render.html
    - shard-glk:          [SKIP][156] ([fdo#109271]) -> ([PASS][157], [PASS][158]) +1 similar issue
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-glk8/igt@gem_exec_schedule@preempt-hang-render.html
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-glk2/igt@gem_exec_schedule@preempt-hang-render.html
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-glk3/igt@gem_exec_schedule@preempt-hang-render.html
    - shard-iclb:         [SKIP][159] ([i915#1467]) -> ([PASS][160], [PASS][161])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb2/igt@gem_exec_schedule@preempt-hang-render.html
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb4/igt@gem_exec_schedule@preempt-hang-render.html
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb8/igt@gem_exec_schedule@preempt-hang-render.html
    - shard-tglb:         [SKIP][162] ([i915#1467]) -> ([PASS][163], [PASS][164])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-tglb3/igt@gem_exec_schedule@preempt-hang-render.html
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-tglb1/igt@gem_exec_schedule@preempt-hang-render.html
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-tglb6/igt@gem_exec_schedule@preempt-hang-render.html
    - shard-kbl:          [SKIP][165] ([fdo#109271]) -> ([PASS][166], [PASS][167])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-kbl7/igt@gem_exec_schedule@preempt-hang-render.html
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-kbl1/igt@gem_exec_schedule@preempt-hang-render.html
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-kbl4/igt@gem_exec_schedule@preempt-hang-render.html

  * igt@gem_exec_schedule@reorder-wide-bsd:
    - shard-iclb:         [SKIP][168] ([fdo#112146]) -> ([PASS][169], [PASS][170]) +3 similar issues
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb2/igt@gem_exec_schedule@reorder-wide-bsd.html
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb7/igt@gem_exec_schedule@reorder-wide-bsd.html
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb5/igt@gem_exec_schedule@reorder-wide-bsd.html

  * igt@gem_userptr_blits@sync-unmap:
    - shard-snb:          [DMESG-WARN][171] ([fdo#111870] / [i915#478]) -> [PASS][172]
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-snb4/igt@gem_userptr_blits@sync-unmap.html
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-snb2/igt@gem_userptr_blits@sync-unmap.html

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-snb:          [DME

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
