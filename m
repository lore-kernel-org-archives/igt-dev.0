Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sun, 01 Mar 2020 01:09:21 -0000
Message-ID: <158302496122.22448.15311502850628853717@emeril.freedesktop.org>
References: <20200228104340.2895082-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200228104340.2895082-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
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
URL   : https://patchwork.freedesktop.org/series/74073/
State : success

== Summary ==

CI Bug Log - changes from IGT_5475_full -> IGTPW_4238_full
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with IGTPW_4238_full need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4238_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4238/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4238_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@sysfs_heartbeat_interval@long} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][1] +14 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4238/shard-tglb7/igt@sysfs_heartbeat_interval@long.html

  * {igt@sysfs_timeslice_duration@duration} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][2] +14 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4238/shard-iclb1/igt@sysfs_timeslice_duration@duration.html

  
#### Warnings ####

  * igt@gem_ctx_shared@exec-single-timeline-vebox:
    - shard-hsw:          [SKIP][3] ([fdo#109271]) -> [FAIL][4] +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-hsw4/igt@gem_ctx_shared@exec-single-timeline-vebox.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4238/shard-hsw1/igt@gem_ctx_shared@exec-single-timeline-vebox.html

  * igt@gem_ctx_shared@single-timeline:
    - shard-snb:          [SKIP][5] ([fdo#109271]) -> [FAIL][6] +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-snb4/igt@gem_ctx_shared@single-timeline.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4238/shard-snb6/igt@gem_ctx_shared@single-timeline.html

  
New tests
---------

  New tests have been introduced between IGT_5475_full and IGTPW_4238_full:

### New IGT tests (15) ###

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
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@sysfs_timeslice_duration@duration:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@sysfs_timeslice_duration@idempotent:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@sysfs_timeslice_duration@invalid:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@sysfs_timeslice_duration@timeout:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_4238_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@legacy-engines-mixed-process@default:
    - shard-iclb:         [PASS][7] -> [FAIL][8] ([i915#679])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-iclb8/igt@gem_ctx_persistence@legacy-engines-mixed-process@default.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4238/shard-iclb4/igt@gem_ctx_persistence@legacy-engines-mixed-process@default.html

  * igt@gem_ctx_persistence@legacy-engines-mixed-process@render:
    - shard-iclb:         [PASS][9] -> [INCOMPLETE][10] ([i915#1239])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-iclb8/igt@gem_ctx_persistence@legacy-engines-mixed-process@render.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4238/shard-iclb4/igt@gem_ctx_persistence@legacy-engines-mixed-process@render.html

  * igt@gem_exec_schedule@implicit-read-write-bsd2:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([fdo#109276] / [i915#677])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-iclb1/igt@gem_exec_schedule@implicit-read-write-bsd2.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4238/shard-iclb8/igt@gem_exec_schedule@implicit-read-write-bsd2.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [PASS][13] -> [SKIP][14] ([i915#677])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-iclb5/igt@gem_exec_schedule@pi-common-bsd.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4238/shard-iclb4/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [PASS][15] -> [SKIP][16] ([fdo#112146]) +6 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-iclb3/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4238/shard-iclb2/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_softpin@noreloc-s3:
    - shard-apl:          [PASS][17] -> [DMESG-WARN][18] ([i915#180])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-apl3/igt@gem_softpin@noreloc-s3.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4238/shard-apl4/igt@gem_softpin@noreloc-s3.html

  * igt@gem_userptr_blits@sync-unmap-after-close:
    - shard-hsw:          [PASS][19] -> [DMESG-WARN][20] ([fdo#111870]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-hsw7/igt@gem_userptr_blits@sync-unmap-after-close.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4238/shard-hsw6/igt@gem_userptr_blits@sync-unmap-after-close.html
    - shard-snb:          [PASS][21] -> [DMESG-WARN][22] ([fdo#111870] / [i915#478]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-snb6/igt@gem_userptr_blits@sync-unmap-after-close.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4238/shard-snb5/igt@gem_userptr_blits@sync-unmap-after-close.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [PASS][23] -> [DMESG-WARN][24] ([i915#180]) +2 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4238/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding:
    - shard-apl:          [PASS][25] -> [FAIL][26] ([i915#54])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-apl7/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4238/shard-apl8/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html
    - shard-kbl:          [PASS][27] -> [FAIL][28] ([i915#54])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4238/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - shard-hsw:          [PASS][29] -> [INCOMPLETE][30] ([i915#61]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-hsw1/igt@kms_flip@2x-blocking-absolute-wf_vblank.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4238/shard-hsw7/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-apl:          [PASS][31] -> [INCOMPLETE][32] ([fdo#103927])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-apl2/igt@kms_flip@flip-vs-suspend-interruptible.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4238/shard-apl2/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [PASS][33] -> [FAIL][34] ([i915#899])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-glk7/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4238/shard-glk4/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr@psr2_suspend:
    - shard-iclb:         [PASS][35] -> [SKIP][36] ([fdo#109441]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-iclb2/igt@kms_psr@psr2_suspend.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4238/shard-iclb6/igt@kms_psr@psr2_suspend.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][37] -> [FAIL][38] ([i915#31])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-apl7/igt@kms_setmode@basic.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4238/shard-apl7/igt@kms_setmode@basic.html
    - shard-kbl:          [PASS][39] -> [FAIL][40] ([i915#31])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-kbl7/igt@kms_setmode@basic.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4238/shard-kbl4/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm:
    - shard-tglb:         [PASS][41] -> [SKIP][42] ([fdo#112015])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-tglb2/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4238/shard-tglb2/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html
    - shard-hsw:          [PASS][43] -> [SKIP][44] ([fdo#109271])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-hsw5/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4238/shard-hsw6/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html
    - shard-iclb:         [PASS][45] -> [SKIP][46] ([fdo#109278])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-iclb8/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4238/shard-iclb1/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html
    - shard-glk:          [PASS][47] -> [SKIP][48] ([fdo#109271])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-glk4/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4238/shard-glk4/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html

  * igt@perf_pmu@busy-no-semaphores-vcs1:
    - shard-iclb:         [PASS][49] -> [SKIP][50] ([fdo#112080]) +15 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-iclb2/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4238/shard-iclb3/igt@perf_pmu@busy-no-semaphores-vcs1.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [PASS][51] -> [SKIP][52] ([fdo#109276]) +12 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-iclb4/igt@prime_vgem@fence-wait-bsd2.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4238/shard-iclb8/igt@prime_vgem@fence-wait-bsd2.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [FAIL][53] ([IGT#28]) -> [PASS][54] +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-iclb4/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4238/shard-iclb2/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@gem_ctx_isolation@vcs1-nonpriv-switch:
    - shard-tglb:         [FAIL][55] ([IGT#28]) -> [PASS][56] +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-tglb8/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4238/shard-tglb3/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html

  * igt@gem_ctx_shared@q-independent-bsd1:
    - shard-apl:          [SKIP][57] ([fdo#109271]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-apl3/igt@gem_ctx_shared@q-independent-bsd1.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4238/shard-apl8/igt@gem_ctx_shared@q-independent-bsd1.html
    - shard-glk:          [SKIP][59] ([fdo#109271]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-glk9/igt@gem_ctx_shared@q-independent-bsd1.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4238/shard-glk1/igt@gem_ctx_shared@q-independent-bsd1.html
    - shard-kbl:          [SKIP][61] ([fdo#109271]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-kbl2/igt@gem_ctx_shared@q-independent-bsd1.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4238/shard-kbl2/igt@gem_ctx_shared@q-independent-bsd1.html
    - shard-tglb:         [SKIP][63] ([IGT#32]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-tglb8/igt@gem_ctx_shared@q-independent-bsd1.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4238/shard-tglb3/igt@gem_ctx_shared@q-independent-bsd1.html

  * igt@gem_exec_balancer@hang:
    - shard-tglb:         [FAIL][65] ([i915#1277]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-tglb6/igt@gem_exec_balancer@hang.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4238/shard-tglb5/igt@gem_exec_balancer@hang.html

  * igt@gem_exec_reloc@basic-gtt-cpu-active:
    - shard-snb:          [DMESG-WARN][67] ([i915#478]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-snb2/igt@gem_exec_reloc@basic-gtt-cpu-active.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4238/shard-snb5/igt@gem_exec_reloc@basic-gtt-cpu-active.html
    - shard-hsw:          [DMESG-WARN][69] ([i915#478]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-hsw5/igt@gem_exec_reloc@basic-gtt-cpu-active.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4238/shard-hsw5/igt@gem_exec_reloc@basic-gtt-cpu-active.html

  * igt@gem_exec_schedule@implicit-both-bsd1:
    - shard-iclb:         [SKIP][71] ([fdo#109276] / [i915#677]) -> [PASS][72] +1 similar issue
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-iclb8/igt@gem_exec_schedule@implicit-both-bsd1.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4238/shard-iclb4/igt@gem_exec_schedule@implicit-both-bsd1.html

  * igt@gem_exec_schedule@implicit-write-read-bsd:
    - shard-iclb:         [SKIP][73] ([i915#677]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-iclb1/igt@gem_exec_schedule@implicit-write-read-bsd.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4238/shard-iclb3/igt@gem_exec_schedule@implicit-write-read-bsd.html

  * igt@gem_exec_schedule@pi-shared-iova-bsd2:
    - shard-iclb:         [SKIP][75] ([fdo#109276]) -> [PASS][76] +23 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-iclb8/igt@gem_exec_schedule@pi-shared-iova-bsd2.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4238/shard-iclb1/igt@gem_exec_schedule@pi-shared-iova-bsd2.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [SKIP][77] ([fdo#112146]) -> [PASS][78] +5 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-iclb4/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4238/shard-iclb3/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [FAIL][79] ([i915#644]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-glk4/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4238/shard-glk7/igt@gem_ppgtt@flink-and-close-vma-leak.html
    - shard-tglb:         [FAIL][81] ([i915#644]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-tglb2/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4238/shard-tglb3/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [DMESG-WARN][83] ([i915#716]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-glk8/igt@gen9_exec_parse@allowed-all.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4238/shard-glk5/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_dc@dc5-dpms:
    - shard-iclb:         [FAIL][85] ([i915#447]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-iclb3/igt@i915_pm_dc@dc5-dpms.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4238/shard-iclb7/igt@i915_pm_dc@dc5-dpms.html

  * igt@i915_pm_rps@waitboost:
    - shard-tglb:         [FAIL][87] ([i915#413]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-tglb5/igt@i915_pm_rps@waitboost.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4238/shard-tglb7/igt@i915_pm_rps@waitboost.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-glk:          [FAIL][89] ([i915#72]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-glk2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4238/shard-glk1/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-glk:          [FAIL][91] ([i915#79]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-glk1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4238/shard-glk5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-glk:          [FAIL][93] ([i915#34]) -> [PASS][94] +1 similar issue
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-glk2/igt@kms_flip@2x-plain-flip-ts-check.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4238/shard-glk2/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-kbl:          [DMESG-WARN][95] ([i915#180]) -> [PASS][96] +4 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4238/shard-kbl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_plane_lowres@pipe-a-tiling-y:
    - shard-glk:          [FAIL][97] ([i915#899]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-glk5/igt@kms_plane_lowres@pipe-a-tiling-y.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4238/shard-glk3/igt@kms_plane_lowres@pipe-a-tiling-y.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [SKIP][99] ([fdo#109441]) -> [PASS][100] +1 similar issue
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-iclb6/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4238/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-apl:          [DMESG-WARN][101] ([i915#180]) -> [PASS][102] +1 similar issue
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-apl4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4238/shard-apl2/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@perf_pmu@idle-vcs1:
    - shard-iclb:         [SKIP][103] ([fdo#112080]) -> [PASS][104] +10 similar issues
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-iclb6/igt@perf_pmu@idle-vcs1.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4238/shard-iclb1/igt@perf_pmu@idle-vcs1.html

  
#### Warnings ####

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-snb:          [DMESG-WARN][105] ([fdo#111870] / [i915#478]) -> [DMESG-WARN][106] ([fdo#110789] / [fdo#111870] / [i915#478])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-snb4/igt@gem_userptr_blits@dmabuf-sync.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4238/shard-snb5/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [SKIP][107] ([i915#468]) -> [FAIL][108] ([i915#454])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4238/shard-tglb8/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_selftest@live@gt_lrc:
    - shard-tglb:         [INCOMPLETE][109] ([i915#1233]) -> [DMESG-FAIL][110] ([i915#1233])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-tglb5/igt@i915_selftest@live@gt_lrc.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4238/shard-tglb8/igt@i915_selftest@live@gt_lrc.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [SKIP][111] ([fdo#109349]) -> [DMESG-WARN][112] ([i915#1226])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-iclb7/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4238/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-kbl:          [DMESG-WARN][113] ([i915#180]) -> [INCOMPLETE][114] ([fdo#103665] / [i915#600])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4238/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@runner@aborted:
    - shard-hsw:          ([FAIL][115], [FAIL][116], [FAIL][117], [FAIL][118], [FAIL][119], [FAIL][120], [FAIL][121]) ([fdo#111870] / [i915#478]) -> ([FAIL][122], [FAIL][123], [FAIL][124], [FAIL][125], [FAIL][126], [FAIL][127], [FAIL][128]) ([fdo#111870])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-hsw5/igt@runner@aborted.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-hsw7/igt@runner@aborted.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-hsw6/igt@runner@aborted.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-hsw6/igt@runner@aborted.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-hsw1/igt@runner@aborted.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-hsw6/igt@runner@aborted.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-hsw4/igt@runner@aborted.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4238/shard-hsw5/igt@runner@aborted.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4238/shard-hsw4/igt@runner@aborted.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4238/shard-hsw7/igt@runner@aborted.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4238/shard-hsw6/igt@runner@aborted.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4238/shard-hsw6/igt@runner@aborted.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4238/shard-hsw1/igt@runner@aborted.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4238/shard-hsw4/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [IGT#32]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/32
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112015]: https://bugs.freedesktop.org/show_bug.cgi?id=112015
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1226]: https://gitlab.freedesktop.org/drm/intel/issues/1226
  [i915#1233]: https://gitlab.freedesktop.org/drm/intel/issues/1233
  [i915#1239]: https://gitlab.freedesktop.org/drm/intel/issues/1239
  [i915#1277]: https://gitlab.freedesktop.org/drm/intel/issues/1277
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#34]: https://gitlab.freedesktop.org/drm/intel/issues/34
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#447]: https://gitlab.freedesktop.org/drm/intel/issues/447
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#600]: https://gitlab.freedesktop.org/drm/intel/issues/600
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#679]: https://gitlab.freedesktop.org/drm/intel/issues/679
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5475 -> IGTPW_4238

  CI-20190529: 20190529
  CI_DRM_8026: 6ce18c241dde9ee20b19ff42f8198552a57ab259 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4238: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4238/index.html
  IGT_5475: ca52e3cb94072f8a6c59f6379f569f79e71a088b @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4238/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
