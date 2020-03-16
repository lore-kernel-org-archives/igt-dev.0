Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 16 Mar 2020 18:42:35 -0000
Message-ID: <158438415581.18993.16972641237638574357@emeril.freedesktop.org>
References: <20200314000016.16629-1-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20200314000016.16629-1-umesh.nerlige.ramappa@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdC9w?=
 =?utf-8?q?erf=3A_Add_test_to_verify_OA_TLB_invalidation_=28rev4=29?=
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

Series: test/perf: Add test to verify OA TLB invalidation (rev4)
URL   : https://patchwork.freedesktop.org/series/74477/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8137_full -> IGTPW_4306_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4306_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4306_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4306/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4306_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_ctx_shared@single-timeline:
    - shard-snb:          NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4306/shard-snb6/igt@gem_ctx_shared@single-timeline.html
    - shard-hsw:          NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4306/shard-hsw6/igt@gem_ctx_shared@single-timeline.html

  * igt@gem_eio@in-flight-external:
    - shard-iclb:         [PASS][3] -> [SKIP][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb7/igt@gem_eio@in-flight-external.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4306/shard-iclb8/igt@gem_eio@in-flight-external.html
    - shard-tglb:         [PASS][5] -> [SKIP][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-tglb2/igt@gem_eio@in-flight-external.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4306/shard-tglb1/igt@gem_eio@in-flight-external.html

  * igt@gem_exec_reloc@basic-cpu-gtt-active:
    - shard-snb:          [PASS][7] -> [FAIL][8] +2 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-snb4/igt@gem_exec_reloc@basic-cpu-gtt-active.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4306/shard-snb6/igt@gem_exec_reloc@basic-cpu-gtt-active.html
    - shard-hsw:          [PASS][9] -> [FAIL][10] +2 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-hsw5/igt@gem_exec_reloc@basic-cpu-gtt-active.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4306/shard-hsw2/igt@gem_exec_reloc@basic-cpu-gtt-active.html

  * igt@gem_exec_schedule@promotion-vebox:
    - shard-apl:          [PASS][11] -> [FAIL][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-apl7/igt@gem_exec_schedule@promotion-vebox.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4306/shard-apl8/igt@gem_exec_schedule@promotion-vebox.html
    - shard-iclb:         [PASS][13] -> [FAIL][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb4/igt@gem_exec_schedule@promotion-vebox.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4306/shard-iclb8/igt@gem_exec_schedule@promotion-vebox.html
    - shard-tglb:         [PASS][15] -> [FAIL][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-tglb7/igt@gem_exec_schedule@promotion-vebox.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4306/shard-tglb1/igt@gem_exec_schedule@promotion-vebox.html
    - shard-glk:          [PASS][17] -> [FAIL][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-glk2/igt@gem_exec_schedule@promotion-vebox.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4306/shard-glk1/igt@gem_exec_schedule@promotion-vebox.html

  * {igt@perf@gen12-oa-tlb-invalidate} (NEW):
    - shard-tglb:         NOTRUN -> [FAIL][19] +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4306/shard-tglb2/igt@perf@gen12-oa-tlb-invalidate.html
    - shard-iclb:         NOTRUN -> [SKIP][20]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4306/shard-iclb3/igt@perf@gen12-oa-tlb-invalidate.html

  
#### Warnings ####

  * igt@gem_userptr_blits@map-fixed-invalidate-busy@gtt:
    - shard-hsw:          [DMESG-WARN][21] ([fdo#110789] / [i915#478]) -> [DMESG-WARN][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-hsw5/igt@gem_userptr_blits@map-fixed-invalidate-busy@gtt.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4306/shard-hsw2/igt@gem_userptr_blits@map-fixed-invalidate-busy@gtt.html

  * igt@perf@gen12-mi-rpc:
    - shard-iclb:         [SKIP][23] ([fdo#109289]) -> [SKIP][24] +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb1/igt@perf@gen12-mi-rpc.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4306/shard-iclb2/igt@perf@gen12-mi-rpc.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8137_full and IGTPW_4306_full:

### New IGT tests (11) ###

  * igt@perf@gen12-oa-tlb-invalidate:
    - Statuses : 1 fail(s) 6 skip(s)
    - Exec time: [0.0, 12.02] s

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

  Here are the changes found in IGTPW_4306_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-glk:          [PASS][25] -> [INCOMPLETE][26] ([i915#1402] / [i915#58] / [k.org#198133])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-glk3/igt@gem_ctx_persistence@close-replace-race.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4306/shard-glk2/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_eio@in-flight-external:
    - shard-glk:          [PASS][27] -> [SKIP][28] ([fdo#109271]) +2 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-glk3/igt@gem_eio@in-flight-external.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4306/shard-glk1/igt@gem_eio@in-flight-external.html

  * igt@gem_exec_async@concurrent-writes-bsd:
    - shard-iclb:         [PASS][29] -> [SKIP][30] ([fdo#112146]) +3 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb3/igt@gem_exec_async@concurrent-writes-bsd.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4306/shard-iclb4/igt@gem_exec_async@concurrent-writes-bsd.html

  * igt@gem_exec_schedule@implicit-both-bsd1:
    - shard-iclb:         [PASS][31] -> [SKIP][32] ([fdo#109276] / [i915#677]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb4/igt@gem_exec_schedule@implicit-both-bsd1.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4306/shard-iclb7/igt@gem_exec_schedule@implicit-both-bsd1.html

  * igt@gem_exec_schedule@independent-bsd2:
    - shard-iclb:         [PASS][33] -> [SKIP][34] ([fdo#109276]) +14 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb2/igt@gem_exec_schedule@independent-bsd2.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4306/shard-iclb5/igt@gem_exec_schedule@independent-bsd2.html

  * igt@gem_exec_schedule@preempt-contexts-bsd2:
    - shard-kbl:          [PASS][35] -> [FAIL][36] ([fdo#112118])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-kbl6/igt@gem_exec_schedule@preempt-contexts-bsd2.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4306/shard-kbl2/igt@gem_exec_schedule@preempt-contexts-bsd2.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-snb:          [PASS][37] -> [DMESG-WARN][38] ([fdo#111870] / [i915#478])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-snb6/igt@gem_userptr_blits@dmabuf-unsync.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4306/shard-snb5/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@i915_pm_rps@waitboost:
    - shard-iclb:         [PASS][39] -> [FAIL][40] ([i915#413])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb4/igt@i915_pm_rps@waitboost.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4306/shard-iclb4/igt@i915_pm_rps@waitboost.html

  * igt@kms_draw_crc@draw-method-xrgb8888-pwrite-xtiled:
    - shard-glk:          [PASS][41] -> [FAIL][42] ([i915#52] / [i915#54])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-glk3/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-xtiled.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4306/shard-glk7/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-xtiled.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-apl:          [PASS][43] -> [DMESG-WARN][44] ([i915#180])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-apl3/igt@kms_flip@flip-vs-suspend-interruptible.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4306/shard-apl1/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-kbl:          [PASS][45] -> [DMESG-WARN][46] ([i915#180]) +2 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-kbl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4306/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
    - shard-hsw:          [PASS][47] -> [INCOMPLETE][48] ([i915#61])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-hsw2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4306/shard-hsw2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][49] -> [SKIP][50] ([fdo#109441]) +2 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4306/shard-iclb8/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][51] -> [FAIL][52] ([i915#31])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-apl2/igt@kms_setmode@basic.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4306/shard-apl6/igt@kms_setmode@basic.html
    - shard-glk:          [PASS][53] -> [FAIL][54] ([i915#31])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-glk2/igt@kms_setmode@basic.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4306/shard-glk5/igt@kms_setmode@basic.html
    - shard-kbl:          [PASS][55] -> [FAIL][56] ([i915#31])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-kbl7/igt@kms_setmode@basic.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4306/shard-kbl4/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-c-ts-continuation-modeset-hang:
    - shard-iclb:         [PASS][57] -> [SKIP][58] ([fdo#109278])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb5/igt@kms_vblank@pipe-c-ts-continuation-modeset-hang.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4306/shard-iclb8/igt@kms_vblank@pipe-c-ts-continuation-modeset-hang.html
    - shard-tglb:         [PASS][59] -> [SKIP][60] ([fdo#112015])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-tglb2/igt@kms_vblank@pipe-c-ts-continuation-modeset-hang.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4306/shard-tglb1/igt@kms_vblank@pipe-c-ts-continuation-modeset-hang.html

  * igt@perf@short-reads:
    - shard-tglb:         [PASS][61] -> [SKIP][62] ([i915#405])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-tglb3/igt@perf@short-reads.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4306/shard-tglb2/igt@perf@short-reads.html
    - shard-kbl:          [PASS][63] -> [SKIP][64] ([fdo#109271]) +2 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-kbl4/igt@perf@short-reads.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4306/shard-kbl6/igt@perf@short-reads.html
    - shard-hsw:          [PASS][65] -> [SKIP][66] ([fdo#109271])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-hsw2/igt@perf@short-reads.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4306/shard-hsw4/igt@perf@short-reads.html
    - shard-iclb:         [PASS][67] -> [SKIP][68] ([i915#405])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb2/igt@perf@short-reads.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4306/shard-iclb5/igt@perf@short-reads.html
    - shard-apl:          [PASS][69] -> [SKIP][70] ([fdo#109271]) +2 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-apl6/igt@perf@short-reads.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4306/shard-apl7/igt@perf@short-reads.html

  * igt@perf_pmu@busy-accuracy-2-vcs1:
    - shard-iclb:         [PASS][71] -> [SKIP][72] ([fdo#112080]) +9 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb2/igt@perf_pmu@busy-accuracy-2-vcs1.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4306/shard-iclb6/igt@perf_pmu@busy-accuracy-2-vcs1.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-snb:          [FAIL][73] -> [PASS][74] +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-snb4/igt@gem_ctx_isolation@rcs0-s3.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4306/shard-snb5/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-tglb:         [INCOMPLETE][75] ([i915#1402]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-tglb2/igt@gem_ctx_persistence@close-replace-race.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4306/shard-tglb7/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_eio@in-flight-contexts-1us:
    - shard-hsw:          [TIMEOUT][77] -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-hsw1/igt@gem_eio@in-flight-contexts-1us.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4306/shard-hsw2/igt@gem_eio@in-flight-contexts-1us.html

  * igt@gem_exec_parallel@bcs0-fds:
    - shard-apl:          [FAIL][79] -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-apl6/igt@gem_exec_parallel@bcs0-fds.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4306/shard-apl6/igt@gem_exec_parallel@bcs0-fds.html
    - shard-iclb:         [FAIL][81] -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb2/igt@gem_exec_parallel@bcs0-fds.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4306/shard-iclb6/igt@gem_exec_parallel@bcs0-fds.html
    - shard-tglb:         [FAIL][83] -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-tglb3/igt@gem_exec_parallel@bcs0-fds.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4306/shard-tglb7/igt@gem_exec_parallel@bcs0-fds.html
    - shard-glk:          [FAIL][85] -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-glk8/igt@gem_exec_parallel@bcs0-fds.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4306/shard-glk3/igt@gem_exec_parallel@bcs0-fds.html

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [SKIP][87] ([fdo#112080]) -> [PASS][88] +15 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb8/igt@gem_exec_parallel@vcs1-fds.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4306/shard-iclb4/igt@gem_exec_parallel@vcs1-fds.html

  * igt@gem_exec_schedule@implicit-both-bsd2:
    - shard-iclb:         [SKIP][89] ([fdo#109276] / [i915#677]) -> [PASS][90] +2 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb5/igt@gem_exec_schedule@implicit-both-bsd2.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4306/shard-iclb1/igt@gem_exec_schedule@implicit-both-bsd2.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [SKIP][91] ([i915#677]) -> [PASS][92] +2 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb1/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4306/shard-iclb6/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@preempt-hang-render:
    - shard-apl:          [SKIP][93] ([fdo#109271]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-apl6/igt@gem_exec_schedule@preempt-hang-render.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4306/shard-apl2/igt@gem_exec_schedule@preempt-hang-render.html
    - shard-glk:          [SKIP][95] ([fdo#109271]) -> [PASS][96] +1 similar issue
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-glk8/igt@gem_exec_schedule@preempt-hang-render.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4306/shard-glk3/igt@gem_exec_schedule@preempt-hang-render.html
    - shard-iclb:         [SKIP][97] -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb2/igt@gem_exec_schedule@preempt-hang-render.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4306/shard-iclb6/igt@gem_exec_schedule@preempt-hang-render.html
    - shard-tglb:         [SKIP][99] -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-tglb3/igt@gem_exec_schedule@preempt-hang-render.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4306/shard-tglb6/igt@gem_exec_schedule@preempt-hang-render.html
    - shard-kbl:          [SKIP][101] ([fdo#109271]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-kbl7/igt@gem_exec_schedule@preempt-hang-render.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4306/shard-kbl7/igt@gem_exec_schedule@preempt-hang-render.html

  * igt@gem_exec_schedule@reorder-wide-bsd:
    - shard-iclb:         [SKIP][103] ([fdo#112146]) -> [PASS][104] +4 similar issues
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb2/igt@gem_exec_schedule@reorder-wide-bsd.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4306/shard-iclb6/igt@gem_exec_schedule@reorder-wide-bsd.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-kbl:          [DMESG-WARN][105] ([i915#180]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-kbl2/igt@gem_workarounds@suspend-resume-fd.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4306/shard-kbl7/igt@gem_workarounds@suspend-resume-fd.html

  * igt@i915_pm_dc@dc5-dpms:
    - shard-iclb:         [FAIL][107] ([i915#447]) -> [PASS][108]
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb3/igt@i915_pm_dc@dc5-dpms.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4306/shard-iclb2/igt@i915_pm_dc@dc5-dpms.html

  * igt@i915_pm_rpm@system-suspend-devices:
    - shard-iclb:         [SKIP][109] ([i915#1316]) -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb1/igt@i915_pm_rpm@system-suspend-devices.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4306/shard-iclb7/igt@i915_pm_rpm@system-suspend-devices.html
    - shard-hsw:          [SKIP][111] ([fdo#109271]) -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-hsw4/igt@i915_pm_rpm@system-suspend-devices.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4306/shard-hsw2/igt@i915_pm_rpm@system-suspend-devices.html
    - shard-tglb:         [SKIP][113] ([i915#1316]) -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-tglb6/igt@i915_pm_rpm@system-suspend-devices.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4306/shard-tglb7/igt@i915_pm_rpm@system-suspend-devices.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [FAIL][115] ([i915#72]) -> [PASS][116]
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-glk1/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4306/shard-glk9/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-hsw:          [INCOMPLETE][117] ([i915#61]) -> [PASS][118]
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-hsw4/igt@kms_flip@flip-vs-suspend.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4306/shard-hsw2/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render:
    - shard-kbl:          [FAIL][119] ([i915#49]) -> [PASS][120]
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4306/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html
    - shard-glk:          [FAIL][121] ([i915#49]) -> [PASS][122]
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-glk2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4306/shard-glk9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html
    - shard-apl:          [FAIL][123] ([i915#49]) -> [PASS][124]
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-apl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4306/shard-apl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-apl:          [DMESG-WARN][125] ([i915#180]) -> [PASS][126] +1 similar issue
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-apl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4306/shard-apl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_psr@psr2_basic:
    - shard-iclb:         [SKIP][127] ([fdo#109441]) -> [PASS][128] +1 similar issue
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb7/igt@kms_psr@psr2_basic.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4306/shard-iclb2/igt@kms_psr@psr2_basic.html

  * igt@kms_vblank@pipe-d-ts-continuation-modeset-hang:
    - shard-tglb:         [SKIP][129] ([fdo#112015]) -> [PASS][130]
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-tglb3/igt@kms_vblank@pipe-d-ts-continuation-modeset-hang.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4306/shard-tglb6/igt@kms_vblank@pipe-d-ts-continuation-modeset-hang.html

  * igt@perf_pmu@most-busy-idle-check-all-bcs0:
    - shard-hsw:          [FAIL][131] -> [PASS][132] +1 similar issue
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-hsw5/igt@perf_pmu@most-busy-idle-check-all-bcs0.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4306/shard-hsw5/igt@perf_pmu@most-busy-idle-check-all-bcs0.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [SKIP][133] ([fdo#109276]) -> [PASS][134] +22 similar issues
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb8/igt@prime_busy@hang-bsd2.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4306/shard-iclb1/igt@prime_busy@hang-bsd2.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [SKIP][135] ([i915#468]) -> [FAIL][136] ([i915#454])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4306/shard-tglb8/igt@i915_pm_dc@dc6-dpms.html

  * igt@runner@aborted:
    - shard-snb:          ([FAIL][137], [FAIL][138], [FAIL][139], [FAIL][140], [FAIL][141], [FAIL][142], [FAIL][143], [FAIL][144], [FAIL][145]) ([fdo#111870] / [i915#1077] / [i915#698]) -> ([FAIL][146], [FAIL][147], [FAIL][148], [FAIL][149], [FAIL][150], [FAIL][151], [FAIL][152], [FAIL][153]) ([fdo#111870] / [i915#1077])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-snb4/igt@runner@aborted.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-snb6/igt@runner@aborted.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-snb5/igt@runner@aborted.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-snb4/igt@runner@aborted.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-snb5/igt@runner@aborted.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-snb4/igt@runner@aborted.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-snb5/igt@runner@aborted.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-snb2/igt@runner@aborted.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-snb4/igt@runner@aborted.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4306/shard-snb6/igt@runner@aborted.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4306/shard-snb6/igt@runner@aborted.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4306/shard-snb2/igt@runner@aborted.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4306/shard-snb5/igt@runner@aborted.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4306/shard-snb2/igt@runner@aborted.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4306/shard-snb2/igt@runner@aborted.html
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4306/shard-snb2/igt@runner@aborted.html
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4306/shard-snb2/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112015]: https://bugs.freedesktop.org/show_bug.cgi?id=112015
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112118]: https://bugs.freedesktop.org/show_bug.cgi?id=112118
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1077]: https://gitlab.freedesktop.org/drm/intel/issues/1077
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1402]: https://gitlab.freedesktop.org/drm/intel/issues/1402
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#405]: https://gitlab.freedesktop.org/drm/intel/issues/405
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#447]: https://gitlab.freedesktop.org/drm/intel/issues/447
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#698]: https://gitlab.freedesktop.org/drm/intel/issues/698
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5510 -> IGTPW_4306
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8137: 5786b5e77cc17a1b494b9bdf3c3f29eedc2e2e7d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4306: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4306/index.html
  IGT_5510: e100092d50105463f58db531fa953c70cc58bb10 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4306/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
