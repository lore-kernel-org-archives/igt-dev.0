Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 17 Mar 2020 13:54:59 -0000
Message-ID: <158445329942.5179.533120865857583392@emeril.freedesktop.org>
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

CI Bug Log - changes from IGT_5510_full -> IGTPW_4307_full
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
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb8/igt@gem_userptr_blits@process-exit-mmap-busy@gtt.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb3/igt@gem_userptr_blits@process-exit-mmap-busy@gtt.html

  * {igt@gem_userptr_blits@process-exit-mmap-busy@uc} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][3] +11 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-tglb5/igt@gem_userptr_blits@process-exit-mmap-busy@uc.html

  * {igt@gem_userptr_blits@process-exit-mmap@wc} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][4] +3 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb1/igt@gem_userptr_blits@process-exit-mmap@wc.html

  
#### Warnings ####

  * igt@gem_exec_reloc@basic-spin-bsd:
    - shard-snb:          [FAIL][5] ([i915#757]) -> [TIMEOUT][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5510/shard-snb2/igt@gem_exec_reloc@basic-spin-bsd.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-snb6/igt@gem_exec_reloc@basic-spin-bsd.html

  
New tests
---------

  New tests have been introduced between IGT_5510_full and IGTPW_4307_full:

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

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [PASS][7] -> ([SKIP][8], [SKIP][9]) ([fdo#112080]) +4 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5510/shard-iclb2/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb8/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb7/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [PASS][10] -> ([SKIP][11], [SKIP][12]) ([fdo#110841])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5510/shard-iclb8/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb1/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb4/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_async@concurrent-writes-bsd2:
    - shard-iclb:         [PASS][13] -> [SKIP][14] ([fdo#109276]) +3 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5510/shard-iclb1/igt@gem_exec_async@concurrent-writes-bsd2.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb6/igt@gem_exec_async@concurrent-writes-bsd2.html

  * igt@gem_exec_fence@basic-await@vcs0:
    - shard-kbl:          [PASS][15] -> [FAIL][16] ([i915#1472]) +3 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5510/shard-kbl4/igt@gem_exec_fence@basic-await@vcs0.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-kbl7/igt@gem_exec_fence@basic-await@vcs0.html
    - shard-iclb:         [PASS][17] -> ([FAIL][18], [FAIL][19]) ([i915#1472])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5510/shard-iclb1/igt@gem_exec_fence@basic-await@vcs0.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb5/igt@gem_exec_fence@basic-await@vcs0.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb7/igt@gem_exec_fence@basic-await@vcs0.html
    - shard-apl:          [PASS][20] -> [FAIL][21] ([i915#1472]) +2 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5510/shard-apl7/igt@gem_exec_fence@basic-await@vcs0.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-apl4/igt@gem_exec_fence@basic-await@vcs0.html
    - shard-glk:          [PASS][22] -> ([FAIL][23], [FAIL][24]) ([i915#1472]) +2 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5510/shard-glk4/igt@gem_exec_fence@basic-await@vcs0.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-glk4/igt@gem_exec_fence@basic-await@vcs0.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-glk5/igt@gem_exec_fence@basic-await@vcs0.html
    - shard-tglb:         [PASS][25] -> [FAIL][26] ([i915#1472]) +2 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5510/shard-tglb3/igt@gem_exec_fence@basic-await@vcs0.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-tglb5/igt@gem_exec_fence@basic-await@vcs0.html

  * igt@gem_exec_schedule@implicit-write-read-bsd1:
    - shard-iclb:         [PASS][27] -> ([SKIP][28], [PASS][29]) ([fdo#109276] / [i915#677]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5510/shard-iclb4/igt@gem_exec_schedule@implicit-write-read-bsd1.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb7/igt@gem_exec_schedule@implicit-write-read-bsd1.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb1/igt@gem_exec_schedule@implicit-write-read-bsd1.html

  * igt@gem_exec_schedule@independent-bsd2:
    - shard-iclb:         [PASS][30] -> ([SKIP][31], [PASS][32]) ([fdo#109276]) +9 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5510/shard-iclb4/igt@gem_exec_schedule@independent-bsd2.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb8/igt@gem_exec_schedule@independent-bsd2.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb4/igt@gem_exec_schedule@independent-bsd2.html

  * igt@gem_exec_schedule@preempt-contexts-bsd:
    - shard-iclb:         [PASS][33] -> ([SKIP][34], [SKIP][35]) ([fdo#112146])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5510/shard-iclb5/igt@gem_exec_schedule@preempt-contexts-bsd.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb2/igt@gem_exec_schedule@preempt-contexts-bsd.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb4/igt@gem_exec_schedule@preempt-contexts-bsd.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [PASS][36] -> ([PASS][37], [SKIP][38]) ([fdo#112146]) +6 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5510/shard-iclb5/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb8/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb4/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd1:
    - shard-iclb:         [PASS][39] -> ([SKIP][40], [SKIP][41]) ([fdo#109276]) +5 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5510/shard-iclb1/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb6/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb5/igt@gem_exec_schedule@preempt-queue-bsd1.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-kbl:          [PASS][42] -> [INCOMPLETE][43] ([i915#155])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5510/shard-kbl2/igt@gem_exec_suspend@basic-s3.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-kbl6/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [PASS][44] -> ([PASS][45], [FAIL][46]) ([i915#644])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5510/shard-glk8/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-glk5/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-glk1/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_wait@wait-rcs0:
    - shard-hsw:          [PASS][47] -> [FAIL][48] ([i915#1462])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5510/shard-hsw7/igt@gem_wait@wait-rcs0.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-hsw2/igt@gem_wait@wait-rcs0.html
    - shard-snb:          [PASS][49] -> [FAIL][50] ([i915#1462])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5510/shard-snb2/igt@gem_wait@wait-rcs0.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-snb5/igt@gem_wait@wait-rcs0.html

  * igt@i915_pm_dc@dc5-dpms:
    - shard-iclb:         [PASS][51] -> ([FAIL][52], [PASS][53]) ([i915#447])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5510/shard-iclb7/igt@i915_pm_dc@dc5-dpms.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb3/igt@i915_pm_dc@dc5-dpms.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb1/igt@i915_pm_dc@dc5-dpms.html

  * igt@i915_pm_rps@waitboost:
    - shard-tglb:         [PASS][54] -> [FAIL][55] ([i915#413])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5510/shard-tglb1/igt@i915_pm_rps@waitboost.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-tglb2/igt@i915_pm_rps@waitboost.html
    - shard-iclb:         [PASS][56] -> ([PASS][57], [FAIL][58]) ([i915#413])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5510/shard-iclb2/igt@i915_pm_rps@waitboost.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb1/igt@i915_pm_rps@waitboost.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb4/igt@i915_pm_rps@waitboost.html

  * igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic:
    - shard-snb:          [PASS][59] -> [FAIL][60] ([i915#1471])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5510/shard-snb6/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-snb5/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-iclb:         [PASS][61] -> ([INCOMPLETE][62], [PASS][63]) ([i915#1185])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5510/shard-iclb7/igt@kms_fbcon_fbt@psr-suspend.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb3/igt@kms_fbcon_fbt@psr-suspend.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb1/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-kbl:          [PASS][64] -> [DMESG-WARN][65] ([i915#1297])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5510/shard-kbl1/igt@kms_flip@flip-vs-expired-vblank.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-kbl1/igt@kms_flip@flip-vs-expired-vblank.html
    - shard-apl:          [PASS][66] -> ([DMESG-WARN][67], [DMESG-WARN][68]) ([i915#1297])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5510/shard-apl8/igt@kms_flip@flip-vs-expired-vblank.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-apl4/igt@kms_flip@flip-vs-expired-vblank.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-apl1/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-apl:          [PASS][69] -> ([PASS][70], [DMESG-WARN][71]) ([i915#180]) +3 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5510/shard-apl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-apl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-apl8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-kbl:          [PASS][72] -> [DMESG-WARN][73] ([i915#180]) +3 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5510/shard-kbl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-kbl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_plane_lowres@pipe-c-tiling-x:
    - shard-hsw:          [PASS][74] -> [DMESG-WARN][75] ([i915#478])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5510/shard-hsw7/igt@kms_plane_lowres@pipe-c-tiling-x.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-hsw2/igt@kms_plane_lowres@pipe-c-tiling-x.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-iclb:         [PASS][76] -> ([SKIP][77], [SKIP][78]) ([fdo#109441])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5510/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb5/igt@kms_psr@psr2_cursor_plane_move.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb7/igt@kms_psr@psr2_cursor_plane_move.html

  * igt@kms_psr@psr2_primary_render:
    - shard-iclb:         [PASS][79] -> [SKIP][80] ([fdo#109441])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5510/shard-iclb2/igt@kms_psr@psr2_primary_render.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb1/igt@kms_psr@psr2_primary_render.html

  * igt@perf_pmu@busy-no-semaphores-vcs1:
    - shard-iclb:         [PASS][81] -> ([SKIP][82], [PASS][83]) ([fdo#112080]) +8 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5510/shard-iclb4/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb8/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb2/igt@perf_pmu@busy-no-semaphores-vcs1.html

  * igt@perf_pmu@busy-start-vcs1:
    - shard-iclb:         [PASS][84] -> [SKIP][85] ([fdo#112080]) +1 similar issue
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5510/shard-iclb4/igt@perf_pmu@busy-start-vcs1.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb6/igt@perf_pmu@busy-start-vcs1.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-snb:          [FAIL][86] ([i915#1462]) -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5510/shard-snb6/igt@gem_ctx_isolation@rcs0-s3.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-snb4/igt@gem_ctx_isolation@rcs0-s3.html
    - shard-hsw:          [FAIL][88] ([i915#1462]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5510/shard-hsw2/igt@gem_ctx_isolation@rcs0-s3.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-hsw6/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-tglb:         [INCOMPLETE][90] ([i915#1402]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5510/shard-tglb8/igt@gem_ctx_persistence@close-replace-race.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-tglb8/igt@gem_ctx_persistence@close-replace-race.html
    - shard-iclb:         [TIMEOUT][92] ([i915#1340]) -> ([PASS][93], [PASS][94])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5510/shard-iclb3/igt@gem_ctx_persistence@close-replace-race.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb7/igt@gem_ctx_persistence@close-replace-race.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb1/igt@gem_ctx_persistence@close-replace-race.html
    - shard-apl:          [INCOMPLETE][95] ([fdo#103927]) -> ([PASS][96], [PASS][97])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5510/shard-apl2/igt@gem_ctx_persistence@close-replace-race.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-apl6/igt@gem_ctx_persistence@close-replace-race.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-apl2/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_eio@in-flight-contexts-1us:
    - shard-hsw:          [TIMEOUT][98] -> [PASS][99]
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5510/shard-hsw7/igt@gem_eio@in-flight-contexts-1us.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-hsw5/igt@gem_eio@in-flight-contexts-1us.html

  * igt@gem_exec_balancer@hang:
    - shard-tglb:         [FAIL][100] ([i915#1277]) -> [PASS][101]
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5510/shard-tglb3/igt@gem_exec_balancer@hang.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-tglb1/igt@gem_exec_balancer@hang.html

  * igt@gem_exec_parallel@bcs0-fds:
    - shard-apl:          [FAIL][102] ([i915#1470]) -> [PASS][103]
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5510/shard-apl2/igt@gem_exec_parallel@bcs0-fds.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-apl6/igt@gem_exec_parallel@bcs0-fds.html
    - shard-kbl:          [FAIL][104] ([i915#1470]) -> [PASS][105]
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5510/shard-kbl7/igt@gem_exec_parallel@bcs0-fds.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-kbl7/igt@gem_exec_parallel@bcs0-fds.html

  * igt@gem_exec_schedule@out-order-bsd2:
    - shard-iclb:         [SKIP][106] ([fdo#109276]) -> [PASS][107] +3 similar issues
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5510/shard-iclb7/igt@gem_exec_schedule@out-order-bsd2.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb1/igt@gem_exec_schedule@out-order-bsd2.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [SKIP][108] ([i915#677]) -> ([PASS][109], [PASS][110]) +1 similar issue
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5510/shard-iclb2/igt@gem_exec_schedule@pi-common-bsd.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb8/igt@gem_exec_schedule@pi-common-bsd.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb6/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_schedule@preempt-contexts-bsd2:
    - shard-iclb:         [SKIP][111] ([fdo#109276]) -> ([PASS][112], [PASS][113]) +4 similar issues
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5510/shard-iclb3/igt@gem_exec_schedule@preempt-contexts-bsd2.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb4/igt@gem_exec_schedule@preempt-contexts-bsd2.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb2/igt@gem_exec_schedule@preempt-contexts-bsd2.html

  * igt@gem_exec_schedule@preempt-hang-render:
    - shard-apl:          [SKIP][114] ([fdo#109271]) -> [PASS][115]
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5510/shard-apl2/igt@gem_exec_schedule@preempt-hang-render.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-apl3/igt@gem_exec_schedule@preempt-hang-render.html
    - shard-glk:          [SKIP][116] ([fdo#109271]) -> ([PASS][117], [PASS][118]) +1 similar issue
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5510/shard-glk9/igt@gem_exec_schedule@preempt-hang-render.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-glk2/igt@gem_exec_schedule@preempt-hang-render.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-glk3/igt@gem_exec_schedule@preempt-hang-render.html
    - shard-iclb:         [SKIP][119] ([i915#1467]) -> ([PASS][120], [PASS][121])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5510/shard-iclb4/igt@gem_exec_schedule@preempt-hang-render.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb4/igt@gem_exec_schedule@preempt-hang-render.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb8/igt@gem_exec_schedule@preempt-hang-render.html
    - shard-tglb:         [SKIP][122] ([i915#1467]) -> [PASS][123]
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5510/shard-tglb5/igt@gem_exec_schedule@preempt-hang-render.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-tglb1/igt@gem_exec_schedule@preempt-hang-render.html
    - shard-kbl:          [SKIP][124] ([fdo#109271]) -> [PASS][125]
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5510/shard-kbl7/igt@gem_exec_schedule@preempt-hang-render.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-kbl1/igt@gem_exec_schedule@preempt-hang-render.html

  * igt@gem_exec_schedule@reorder-wide-bsd:
    - shard-iclb:         [SKIP][126] ([fdo#112146]) -> ([PASS][127], [PASS][128]) +2 similar issues
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5510/shard-iclb4/igt@gem_exec_schedule@reorder-wide-bsd.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb7/igt@gem_exec_schedule@reorder-wide-bsd.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb5/igt@gem_exec_schedule@reorder-wide-bsd.html

  * igt@gem_exec_store@cachelines-vcs1:
    - shard-iclb:         [SKIP][129] ([fdo#112080]) -> [PASS][130] +1 similar issue
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5510/shard-iclb6/igt@gem_exec_store@cachelines-vcs1.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb2/igt@gem_exec_store@cachelines-vcs1.html

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-snb:          [DMESG-WARN][131] ([fdo#111870] / [i915#478]) -> [PASS][132] +1 similar issue
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5510/shard-snb6/igt@gem_userptr_blits@sync-unmap-cycles.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-snb2/igt@gem_userptr_blits@sync-unmap-cycles.html
    - shard-hsw:          [DMESG-WARN][133] ([fdo#111870]) -> [PASS][134]
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5510/shard-hsw1/igt@gem_userptr_blits@sync-unmap-cycles.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-hsw2/igt@gem_userptr_blits@sync-unmap-cycles.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [DMESG-WARN][135] ([i915#716]) -> ([PASS][136], [PASS][137])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5510/shard-glk1/igt@gen9_exec_parse@allowed-all.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-glk9/igt@gen9_exec_parse@allowed-all.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-glk7/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [FAIL][138] ([i915#454]) -> ([PASS][139], [PASS][140])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5510/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb7/igt@i915_pm_dc@dc6-dpms.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb1/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rpm@system-suspend-devices:
    - shard-iclb:         [SKIP][141] ([i915#1316]) -> ([PASS][142], [PASS][143])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5510/shard-iclb6/igt@i915_pm_rpm@system-suspend-devices.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb5/igt@i915_pm_rpm@system-suspend-devices.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb7/igt@i915_pm_rpm@system-suspend-devices.html
    - shard-tglb:         [SKIP][144] ([i915#1316]) -> [PASS][145]
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5510/shard-tglb7/igt@i915_pm_rpm@system-suspend-devices.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-tglb5/igt@i915_pm_rpm@system-suspend-devices.html

  * igt@i915_pm_rps@reset:
    - shard-iclb:         [FAIL][146] ([i915#413]) -> ([PASS][147], [PASS][148])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5510/shard-iclb8/igt@i915_pm_rps@reset.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb4/igt@i915_pm_rps@reset.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-iclb2/igt@i915_pm_rps@reset.html

  * igt@i915_selftest@live@execlists:
    - shard-kbl:          [INCOMPLETE][149] ([fdo#112259] / [i915#656]) -> [PASS][150]
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5510/shard-kbl7/igt@i915_selftest@live@execlists.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-kbl4/igt@i915_selftest@live@execlists.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [FAIL][151] ([i915#72]) -> ([PASS][152], [PASS][153])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5510/shard-glk8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-glk9/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-glk3/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-hsw:          [INCOMPLETE][154] ([i915#61]) -> [PASS][155]
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5510/shard-hsw2/igt@kms_flip@flip-vs-suspend.html
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-hsw1/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-apl:          [DMESG-WARN][156] ([i915#180]) -> ([PASS][157], [PASS][158])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5510/shard-apl6/igt@kms_flip@flip-vs-suspend-interruptible.html
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-apl3/igt@kms_flip@flip-vs-suspend-interruptible.html
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render:
    - shard-kbl:          [FAIL][159] ([i915#49]) -> [PASS][160]
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5510/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html
    - shard-glk:          [FAIL][161] ([i915#49]) -> ([PASS][162], [PASS][163])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5510/shard-glk3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-glk1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-glk5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html
    - shard-apl:          [FAIL][164] ([i915#49]) -> ([PASS][165], [PASS][166])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5510/shard-apl8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-apl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/shard-apl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite:
    - shard-snb:          [DMESG-WARN][167] ([i915#478]) -> [PASS][168]
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5510/shard-snb4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4307/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
