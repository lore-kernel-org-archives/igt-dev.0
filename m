Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 28 Jan 2020 08:51:53 -0000
Message-ID: <158020151340.20534.14838089838918266629@emeril.freedesktop.org>
References: <20200127121818.2492460-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200127121818.2492460-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/5=5D_i915=3A_Start_putting_the_mmio?=
 =?utf-8?q?=5Fbase_to_wider_use?=
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

Series: series starting with [i-g-t,1/5] i915: Start putting the mmio_base to wider use
URL   : https://patchwork.freedesktop.org/series/72620/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5389_full -> IGTPW_4005_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4005_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4005_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4005/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4005_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_tiled_partial_pwrite_pread@reads:
    - shard-hsw:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/shard-hsw2/igt@gem_tiled_partial_pwrite_pread@reads.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4005/shard-hsw4/igt@gem_tiled_partial_pwrite_pread@reads.html

  * {igt@sysfs_heartbeat_interval@long} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][3] +15 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4005/shard-tglb7/igt@sysfs_heartbeat_interval@long.html

  * {igt@sysfs_timeslice_duration@off} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][4] +15 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4005/shard-iclb7/igt@sysfs_timeslice_duration@off.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@kms_color_chamelium@pipe-c-degamma}:
    - shard-tglb:         NOTRUN -> [SKIP][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4005/shard-tglb2/igt@kms_color_chamelium@pipe-c-degamma.html

  
New tests
---------

  New tests have been introduced between IGT_5389_full and IGTPW_4005_full:

### New IGT tests (16) ###

  * igt@sysfs_heartbeat_interval@idempotent:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@sysfs_heartbeat_interval@invalid:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@sysfs_heartbeat_interval@long:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@sysfs_heartbeat_interval@mixed:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@sysfs_heartbeat_interval@nopreempt:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@sysfs_heartbeat_interval@off:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@sysfs_heartbeat_interval@precise:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@sysfs_preempt_timeout@idempotent:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@sysfs_preempt_timeout@invalid:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@sysfs_preempt_timeout@off:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@sysfs_preempt_timeout@timeout:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@sysfs_timeslice_duration@duration:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@sysfs_timeslice_duration@idempotent:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@sysfs_timeslice_duration@invalid:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@sysfs_timeslice_duration@off:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@sysfs_timeslice_duration@timeout:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_4005_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@vcs1-cleanup:
    - shard-iclb:         [PASS][6] -> [SKIP][7] ([fdo#109276] / [fdo#112080]) +1 similar issue
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/shard-iclb2/igt@gem_ctx_persistence@vcs1-cleanup.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4005/shard-iclb3/igt@gem_ctx_persistence@vcs1-cleanup.html

  * igt@gem_ctx_shared@q-independent-blt:
    - shard-apl:          [PASS][8] -> [FAIL][9] ([fdo#112118])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/shard-apl7/igt@gem_ctx_shared@q-independent-blt.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4005/shard-apl3/igt@gem_ctx_shared@q-independent-blt.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [PASS][10] -> [SKIP][11] ([fdo#110854])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/shard-iclb2/igt@gem_exec_balancer@smoke.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4005/shard-iclb8/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [PASS][12] -> [SKIP][13] ([fdo#112080]) +10 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/shard-iclb4/igt@gem_exec_parallel@vcs1-fds.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4005/shard-iclb3/igt@gem_exec_parallel@vcs1-fds.html

  * igt@gem_exec_schedule@in-order-bsd:
    - shard-iclb:         [PASS][14] -> [SKIP][15] ([fdo#112146]) +5 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/shard-iclb8/igt@gem_exec_schedule@in-order-bsd.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4005/shard-iclb2/igt@gem_exec_schedule@in-order-bsd.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [PASS][16] -> [SKIP][17] ([i915#677])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/shard-iclb8/igt@gem_exec_schedule@pi-common-bsd.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4005/shard-iclb2/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_schedule@preempt-contexts-bsd2:
    - shard-iclb:         [PASS][18] -> [SKIP][19] ([fdo#109276]) +17 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/shard-iclb4/igt@gem_exec_schedule@preempt-contexts-bsd2.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4005/shard-iclb5/igt@gem_exec_schedule@preempt-contexts-bsd2.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [PASS][20] -> [FAIL][21] ([i915#644])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/shard-glk6/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4005/shard-glk5/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy-gup:
    - shard-snb:          [PASS][22] -> [DMESG-WARN][23] ([fdo#111870] / [i915#478])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/shard-snb5/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4005/shard-snb2/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup.html

  * igt@gem_workarounds@suspend-resume:
    - shard-apl:          [PASS][24] -> [DMESG-WARN][25] ([i915#180])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/shard-apl2/igt@gem_workarounds@suspend-resume.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4005/shard-apl1/igt@gem_workarounds@suspend-resume.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [PASS][26] -> [INCOMPLETE][27] ([i915#58] / [k.org#198133])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/shard-glk2/igt@gen9_exec_parse@allowed-all.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4005/shard-glk7/igt@gen9_exec_parse@allowed-all.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [PASS][28] -> [FAIL][29] ([i915#173])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/shard-iclb3/igt@kms_psr@no_drrs.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4005/shard-iclb1/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_basic:
    - shard-iclb:         [PASS][30] -> [SKIP][31] ([fdo#109441]) +2 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/shard-iclb2/igt@kms_psr@psr2_basic.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4005/shard-iclb8/igt@kms_psr@psr2_basic.html

  * igt@kms_psr@suspend:
    - shard-iclb:         [PASS][32] -> [INCOMPLETE][33] ([i915#140])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/shard-iclb1/igt@kms_psr@suspend.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4005/shard-iclb3/igt@kms_psr@suspend.html

  * igt@kms_sequence@get-idle:
    - shard-hsw:          [PASS][34] -> [DMESG-WARN][35] ([i915#44])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/shard-hsw8/igt@kms_sequence@get-idle.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4005/shard-hsw5/igt@kms_sequence@get-idle.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][36] -> [FAIL][37] ([i915#31])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/shard-apl4/igt@kms_setmode@basic.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4005/shard-apl8/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [PASS][38] -> [DMESG-WARN][39] ([i915#180]) +6 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/shard-kbl6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4005/shard-kbl2/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@prime_mmap_coherency@ioctl-errors:
    - shard-hsw:          [PASS][40] -> [FAIL][41] ([i915#831])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/shard-hsw6/igt@prime_mmap_coherency@ioctl-errors.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4005/shard-hsw5/igt@prime_mmap_coherency@ioctl-errors.html

  
#### Possible fixes ####

  * igt@gem_busy@extended-parallel-vcs1:
    - shard-iclb:         [SKIP][42] ([fdo#112080]) -> [PASS][43] +10 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/shard-iclb5/igt@gem_busy@extended-parallel-vcs1.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4005/shard-iclb2/igt@gem_busy@extended-parallel-vcs1.html

  * igt@gem_caching@reads:
    - shard-hsw:          [FAIL][44] -> [PASS][45]
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/shard-hsw5/igt@gem_caching@reads.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4005/shard-hsw2/igt@gem_caching@reads.html

  * igt@gem_ctx_isolation@vcs1-nonpriv-switch:
    - shard-tglb:         [FAIL][46] ([IGT#28]) -> [PASS][47]
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/shard-tglb1/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4005/shard-tglb5/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html
    - shard-iclb:         [FAIL][48] ([IGT#28]) -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/shard-iclb4/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4005/shard-iclb2/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html

  * igt@gem_ctx_persistence@rcs0-mixed-process:
    - shard-tglb:         [FAIL][50] ([i915#679]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/shard-tglb8/igt@gem_ctx_persistence@rcs0-mixed-process.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4005/shard-tglb6/igt@gem_ctx_persistence@rcs0-mixed-process.html

  * igt@gem_ctx_persistence@vcs1-mixed-process:
    - shard-iclb:         [SKIP][52] ([fdo#109276] / [fdo#112080]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/shard-iclb8/igt@gem_ctx_persistence@vcs1-mixed-process.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4005/shard-iclb1/igt@gem_ctx_persistence@vcs1-mixed-process.html

  * igt@gem_ctx_shared@q-independent-bsd1:
    - shard-apl:          [SKIP][54] ([fdo#109271]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/shard-apl1/igt@gem_ctx_shared@q-independent-bsd1.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4005/shard-apl2/igt@gem_ctx_shared@q-independent-bsd1.html
    - shard-glk:          [SKIP][56] ([fdo#109271]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/shard-glk2/igt@gem_ctx_shared@q-independent-bsd1.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4005/shard-glk1/igt@gem_ctx_shared@q-independent-bsd1.html
    - shard-kbl:          [SKIP][58] ([fdo#109271]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/shard-kbl6/igt@gem_ctx_shared@q-independent-bsd1.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4005/shard-kbl7/igt@gem_ctx_shared@q-independent-bsd1.html
    - shard-tglb:         [SKIP][60] ([IGT#32]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/shard-tglb6/igt@gem_ctx_shared@q-independent-bsd1.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4005/shard-tglb7/igt@gem_ctx_shared@q-independent-bsd1.html

  * igt@gem_eio@in-flight-contexts-1us:
    - shard-snb:          [FAIL][62] ([i915#490]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/shard-snb4/igt@gem_eio@in-flight-contexts-1us.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4005/shard-snb5/igt@gem_eio@in-flight-contexts-1us.html

  * igt@gem_exec_schedule@pi-shared-iova-bsd:
    - shard-iclb:         [SKIP][64] ([i915#677]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/shard-iclb2/igt@gem_exec_schedule@pi-shared-iova-bsd.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4005/shard-iclb6/igt@gem_exec_schedule@pi-shared-iova-bsd.html

  * igt@gem_exec_schedule@pi-shared-iova-bsd2:
    - shard-iclb:         [SKIP][66] ([fdo#109276]) -> [PASS][67] +14 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/shard-iclb6/igt@gem_exec_schedule@pi-shared-iova-bsd2.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4005/shard-iclb4/igt@gem_exec_schedule@pi-shared-iova-bsd2.html

  * igt@gem_exec_schedule@wide-bsd:
    - shard-iclb:         [SKIP][68] ([fdo#112146]) -> [PASS][69] +4 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/shard-iclb2/igt@gem_exec_schedule@wide-bsd.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4005/shard-iclb3/igt@gem_exec_schedule@wide-bsd.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-kbl:          [DMESG-WARN][70] ([i915#180]) -> [PASS][71] +4 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/shard-kbl3/igt@gem_exec_suspend@basic-s3.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4005/shard-kbl2/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_tiled_blits@normal:
    - shard-hsw:          [FAIL][72] ([i915#694]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/shard-hsw7/igt@gem_tiled_blits@normal.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4005/shard-hsw8/igt@gem_tiled_blits@normal.html

  * igt@gem_tiled_partial_pwrite_pread@writes:
    - shard-hsw:          [FAIL][74] ([i915#817]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/shard-hsw2/igt@gem_tiled_partial_pwrite_pread@writes.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4005/shard-hsw2/igt@gem_tiled_partial_pwrite_pread@writes.html

  * igt@i915_selftest@live_blt:
    - shard-hsw:          [DMESG-FAIL][76] ([i915#563]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/shard-hsw8/igt@i915_selftest@live_blt.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4005/shard-hsw5/igt@i915_selftest@live_blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render:
    - shard-snb:          [SKIP][78] ([fdo#109271]) -> [PASS][79] +2 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/shard-snb6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4005/shard-snb2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][80] ([fdo#109441]) -> [PASS][81] +2 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/shard-iclb5/igt@kms_psr@psr2_sprite_plane_move.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4005/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-apl:          [DMESG-WARN][82] ([i915#180]) -> [PASS][83] +1 similar issue
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/shard-apl1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4005/shard-apl8/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  
#### Warnings ####

  * igt@gem_tiled_blits@interruptible:
    - shard-hsw:          [FAIL][84] ([i915#694]) -> [FAIL][85] ([i915#818])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/shard-hsw7/igt@gem_tiled_blits@interruptible.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4005/shard-hsw8/igt@gem_tiled_blits@interruptible.html

  * igt@gem_userptr_blits@sync-unmap:
    - shard-snb:          [DMESG-WARN][86] ([fdo#111870] / [i915#478]) -> [DMESG-WARN][87] ([fdo#110789] / [fdo#111870] / [i915#478])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/shard-snb1/igt@gem_userptr_blits@sync-unmap.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4005/shard-snb4/igt@gem_userptr_blits@sync-unmap.html

  * igt@gem_userptr_blits@sync-unmap-after-close:
    - shard-snb:          [DMESG-WARN][88] ([fdo#110789] / [fdo#111870] / [i915#478]) -> [DMESG-WARN][89] ([fdo#111870] / [i915#478])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/shard-snb5/igt@gem_userptr_blits@sync-unmap-after-close.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4005/shard-snb6/igt@gem_userptr_blits@sync-unmap-after-close.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [IGT#32]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/32
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112118]: https://bugs.freedesktop.org/show_bug.cgi?id=112118
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#44]: https://gitlab.freedesktop.org/drm/intel/issues/44
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#490]: https://gitlab.freedesktop.org/drm/intel/issues/490
  [i915#563]: https://gitlab.freedesktop.org/drm/intel/issues/563
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#679]: https://gitlab.freedesktop.org/drm/intel/issues/679
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#817]: https://gitlab.freedesktop.org/drm/intel/issues/817
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#831]: https://gitlab.freedesktop.org/drm/intel/issues/831
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5389 -> IGTPW_4005

  CI-20190529: 20190529
  CI_DRM_7824: 43e5c192e3b36a8caef56e8d8f3c4e67433aa223 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4005: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4005/index.html
  IGT_5389: 966c58649dee31bb5bf2fad92f75ffd365968b81 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4005/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
