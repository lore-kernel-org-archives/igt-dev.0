Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 17 Mar 2020 00:39:07 -0000
Message-ID: <158440554757.5177.13285170984518509102@emeril.freedesktop.org>
References: <20200316161132.29833-1-lyude@redhat.com>
In-Reply-To: <20200316161132.29833-1-lyude@redhat.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgRml4ZXMg?=
 =?utf-8?q?for_GCC_10=27s_-fcommon_default?=
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
To: Lyude <lyude@redhat.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Fixes for GCC 10's -fcommon default
URL   : https://patchwork.freedesktop.org/series/74749/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8137_full -> IGTPW_4310_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4310_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4310_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4310/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4310_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_ctx_shared@single-timeline:
    - shard-snb:          NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4310/shard-snb4/igt@gem_ctx_shared@single-timeline.html

  * igt@gem_eio@banned:
    - shard-iclb:         [PASS][2] -> [SKIP][3]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb6/igt@gem_eio@banned.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4310/shard-iclb7/igt@gem_eio@banned.html
    - shard-tglb:         [PASS][4] -> [SKIP][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-tglb7/igt@gem_eio@banned.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4310/shard-tglb2/igt@gem_eio@banned.html

  * igt@gem_eio@kms:
    - shard-glk:          [PASS][6] -> [FAIL][7] +1 similar issue
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-glk5/igt@gem_eio@kms.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4310/shard-glk5/igt@gem_eio@kms.html

  * igt@gem_wait@busy-vecs0:
    - shard-hsw:          NOTRUN -> [FAIL][8] +1 similar issue
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4310/shard-hsw1/igt@gem_wait@busy-vecs0.html

  * igt@gem_wait@write-wait-bcs0:
    - shard-hsw:          [PASS][9] -> [FAIL][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-hsw4/igt@gem_wait@write-wait-bcs0.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4310/shard-hsw1/igt@gem_wait@write-wait-bcs0.html

  * igt@i915_hangman@error-state-capture-vcs0:
    - shard-snb:          [PASS][11] -> [TIMEOUT][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-snb4/igt@i915_hangman@error-state-capture-vcs0.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4310/shard-snb4/igt@i915_hangman@error-state-capture-vcs0.html

  * igt@i915_pm_sseu@full-enable:
    - shard-apl:          [PASS][13] -> [FAIL][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-apl7/igt@i915_pm_sseu@full-enable.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4310/shard-apl6/igt@i915_pm_sseu@full-enable.html
    - shard-kbl:          [PASS][15] -> [FAIL][16] +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-kbl1/igt@i915_pm_sseu@full-enable.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4310/shard-kbl1/igt@i915_pm_sseu@full-enable.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-snb:          [PASS][17] -> [FAIL][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-snb5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4310/shard-snb5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-kbl:          [PASS][19] -> [INCOMPLETE][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-kbl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4310/shard-kbl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8137_full and IGTPW_4310_full:

### New IGT tests (10) ###

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

  Here are the changes found in IGTPW_4310_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-kbl:          [PASS][21] -> [DMESG-WARN][22] ([i915#180]) +5 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-kbl1/igt@gem_ctx_isolation@rcs0-s3.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4310/shard-kbl1/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-kbl:          [PASS][23] -> [INCOMPLETE][24] ([i915#1402])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-kbl6/igt@gem_ctx_persistence@close-replace-race.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4310/shard-kbl4/igt@gem_ctx_persistence@close-replace-race.html
    - shard-glk:          [PASS][25] -> [INCOMPLETE][26] ([i915#1402] / [i915#58] / [k.org#198133])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-glk3/igt@gem_ctx_persistence@close-replace-race.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4310/shard-glk2/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [PASS][27] -> [SKIP][28] ([fdo#110841])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb5/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4310/shard-iclb1/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_ctx_shared@q-out-order-blt:
    - shard-glk:          [PASS][29] -> [FAIL][30] ([fdo#112118]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-glk6/igt@gem_ctx_shared@q-out-order-blt.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4310/shard-glk3/igt@gem_ctx_shared@q-out-order-blt.html
    - shard-apl:          [PASS][31] -> [FAIL][32] ([fdo#112118])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-apl8/igt@gem_ctx_shared@q-out-order-blt.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4310/shard-apl3/igt@gem_ctx_shared@q-out-order-blt.html
    - shard-tglb:         [PASS][33] -> [FAIL][34] ([fdo#112118])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-tglb7/igt@gem_ctx_shared@q-out-order-blt.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4310/shard-tglb2/igt@gem_ctx_shared@q-out-order-blt.html

  * igt@gem_ctx_shared@q-out-order-vebox:
    - shard-kbl:          [PASS][35] -> [FAIL][36] ([fdo#112118])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-kbl6/igt@gem_ctx_shared@q-out-order-vebox.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4310/shard-kbl4/igt@gem_ctx_shared@q-out-order-vebox.html

  * igt@gem_eio@banned:
    - shard-apl:          [PASS][37] -> [SKIP][38] ([fdo#109271]) +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-apl8/igt@gem_eio@banned.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4310/shard-apl3/igt@gem_eio@banned.html
    - shard-glk:          [PASS][39] -> [SKIP][40] ([fdo#109271]) +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-glk6/igt@gem_eio@banned.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4310/shard-glk3/igt@gem_eio@banned.html
    - shard-kbl:          [PASS][41] -> [SKIP][42] ([fdo#109271]) +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-kbl3/igt@gem_eio@banned.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4310/shard-kbl4/igt@gem_eio@banned.html

  * igt@gem_exec_schedule@implicit-both-bsd1:
    - shard-iclb:         [PASS][43] -> [SKIP][44] ([fdo#109276] / [i915#677]) +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb4/igt@gem_exec_schedule@implicit-both-bsd1.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4310/shard-iclb5/igt@gem_exec_schedule@implicit-both-bsd1.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [PASS][45] -> [SKIP][46] ([fdo#112146]) +8 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb6/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4310/shard-iclb1/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [PASS][47] -> [FAIL][48] ([i915#644])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-glk9/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4310/shard-glk4/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@i915_pm_rps@waitboost:
    - shard-iclb:         [PASS][49] -> [FAIL][50] ([i915#413])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb4/igt@i915_pm_rps@waitboost.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4310/shard-iclb5/igt@i915_pm_rps@waitboost.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-glk:          [PASS][51] -> [FAIL][52] ([i915#407])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-glk8/igt@kms_flip@2x-modeset-vs-vblank-race.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4310/shard-glk8/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-glk:          [PASS][53] -> [FAIL][54] ([i915#79])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-glk6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4310/shard-glk5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-apl:          [PASS][55] -> [DMESG-WARN][56] ([i915#180])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-apl3/igt@kms_flip@flip-vs-suspend-interruptible.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4310/shard-apl1/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render:
    - shard-snb:          [PASS][57] -> [DMESG-WARN][58] ([i915#478])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-snb6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4310/shard-snb6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_plane_lowres@pipe-c-tiling-x:
    - shard-hsw:          [PASS][59] -> [DMESG-WARN][60] ([i915#478])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-hsw7/igt@kms_plane_lowres@pipe-c-tiling-x.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4310/shard-hsw5/igt@kms_plane_lowres@pipe-c-tiling-x.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][61] -> [SKIP][62] ([fdo#109441]) +3 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4310/shard-iclb5/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_setmode@basic:
    - shard-glk:          [PASS][63] -> [FAIL][64] ([i915#31])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-glk2/igt@kms_setmode@basic.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4310/shard-glk8/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-c-query-idle-hang:
    - shard-iclb:         [PASS][65] -> [SKIP][66] ([fdo#109278])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb4/igt@kms_vblank@pipe-c-query-idle-hang.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4310/shard-iclb7/igt@kms_vblank@pipe-c-query-idle-hang.html
    - shard-tglb:         [PASS][67] -> [SKIP][68] ([fdo#112015])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-tglb7/igt@kms_vblank@pipe-c-query-idle-hang.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4310/shard-tglb2/igt@kms_vblank@pipe-c-query-idle-hang.html

  * igt@perf_pmu@busy-no-semaphores-vcs1:
    - shard-iclb:         [PASS][69] -> [SKIP][70] ([fdo#112080]) +11 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb2/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4310/shard-iclb6/igt@perf_pmu@busy-no-semaphores-vcs1.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [PASS][71] -> [SKIP][72] ([fdo#109276]) +17 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb1/igt@prime_vgem@fence-wait-bsd2.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4310/shard-iclb5/igt@prime_vgem@fence-wait-bsd2.html

  
#### Possible fixes ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [SKIP][73] ([fdo#112080]) -> [PASS][74] +12 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb5/igt@gem_busy@busy-vcs1.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4310/shard-iclb4/igt@gem_busy@busy-vcs1.html

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-snb:          [FAIL][75] -> [PASS][76] +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-snb4/igt@gem_ctx_isolation@rcs0-s3.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4310/shard-snb5/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-tglb:         [INCOMPLETE][77] ([i915#1402]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-tglb2/igt@gem_ctx_persistence@close-replace-race.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4310/shard-tglb1/igt@gem_ctx_persistence@close-replace-race.html
    - shard-apl:          [INCOMPLETE][79] ([fdo#103927] / [i915#1402]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-apl1/igt@gem_ctx_persistence@close-replace-race.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4310/shard-apl8/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_eio@in-flight-contexts-1us:
    - shard-hsw:          [TIMEOUT][81] -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-hsw1/igt@gem_eio@in-flight-contexts-1us.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4310/shard-hsw1/igt@gem_eio@in-flight-contexts-1us.html

  * igt@gem_exec_parallel@bcs0-fds:
    - shard-apl:          [FAIL][83] -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-apl6/igt@gem_exec_parallel@bcs0-fds.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4310/shard-apl3/igt@gem_exec_parallel@bcs0-fds.html
    - shard-iclb:         [FAIL][85] -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb2/igt@gem_exec_parallel@bcs0-fds.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4310/shard-iclb6/igt@gem_exec_parallel@bcs0-fds.html
    - shard-tglb:         [FAIL][87] -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-tglb3/igt@gem_exec_parallel@bcs0-fds.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4310/shard-tglb3/igt@gem_exec_parallel@bcs0-fds.html
    - shard-glk:          [FAIL][89] -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-glk8/igt@gem_exec_parallel@bcs0-fds.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4310/shard-glk5/igt@gem_exec_parallel@bcs0-fds.html

  * igt@gem_exec_schedule@implicit-read-write-bsd1:
    - shard-iclb:         [SKIP][91] ([fdo#109276] / [i915#677]) -> [PASS][92] +2 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb5/igt@gem_exec_schedule@implicit-read-write-bsd1.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4310/shard-iclb4/igt@gem_exec_schedule@implicit-read-write-bsd1.html

  * igt@gem_exec_schedule@in-order-bsd:
    - shard-iclb:         [SKIP][93] ([fdo#112146]) -> [PASS][94] +2 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb4/igt@gem_exec_schedule@in-order-bsd.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4310/shard-iclb8/igt@gem_exec_schedule@in-order-bsd.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [SKIP][95] ([i915#677]) -> [PASS][96] +3 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb1/igt@gem_exec_schedule@pi-common-bsd.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4310/shard-iclb8/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_schedule@preempt-contexts-bsd2:
    - shard-iclb:         [SKIP][97] ([fdo#109276]) -> [PASS][98] +15 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb8/igt@gem_exec_schedule@preempt-contexts-bsd2.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4310/shard-iclb4/igt@gem_exec_schedule@preempt-contexts-bsd2.html

  * igt@gem_exec_schedule@preempt-hang-render:
    - shard-apl:          [SKIP][99] ([fdo#109271]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-apl6/igt@gem_exec_schedule@preempt-hang-render.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4310/shard-apl4/igt@gem_exec_schedule@preempt-hang-render.html
    - shard-glk:          [SKIP][101] ([fdo#109271]) -> [PASS][102] +1 similar issue
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-glk8/igt@gem_exec_schedule@preempt-hang-render.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4310/shard-glk6/igt@gem_exec_schedule@preempt-hang-render.html
    - shard-iclb:         [SKIP][103] -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb2/igt@gem_exec_schedule@preempt-hang-render.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4310/shard-iclb1/igt@gem_exec_schedule@preempt-hang-render.html
    - shard-tglb:         [SKIP][105] -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-tglb3/igt@gem_exec_schedule@preempt-hang-render.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4310/shard-tglb6/igt@gem_exec_schedule@preempt-hang-render.html
    - shard-kbl:          [SKIP][107] ([fdo#109271]) -> [PASS][108]
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-kbl7/igt@gem_exec_schedule@preempt-hang-render.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4310/shard-kbl7/igt@gem_exec_schedule@preempt-hang-render.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-hsw:          [DMESG-WARN][109] ([fdo#111870]) -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-hsw7/igt@gem_userptr_blits@dmabuf-unsync.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4310/shard-hsw5/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-kbl:          [DMESG-WARN][111] ([i915#180]) -> [PASS][112] +1 similar issue
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-kbl2/igt@gem_workarounds@suspend-resume-fd.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4310/shard-kbl2/igt@gem_workarounds@suspend-resume-fd.html

  * igt@i915_pm_dc@dc5-dpms:
    - shard-iclb:         [FAIL][113] ([i915#447]) -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb3/igt@i915_pm_dc@dc5-dpms.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4310/shard-iclb2/igt@i915_pm_dc@dc5-dpms.html

  * igt@i915_pm_rpm@system-suspend-devices:
    - shard-iclb:         [SKIP][115] ([i915#1316]) -> [PASS][116]
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb1/igt@i915_pm_rpm@system-suspend-devices.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4310/shard-iclb4/igt@i915_pm_rpm@system-suspend-devices.html
    - shard-hsw:          [SKIP][117] ([fdo#109271]) -> [PASS][118]
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-hsw4/igt@i915_pm_rpm@system-suspend-devices.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4310/shard-hsw4/igt@i915_pm_rpm@system-suspend-devices.html
    - shard-tglb:         [SKIP][119] ([i915#1316]) -> [PASS][120]
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-tglb6/igt@i915_pm_rpm@system-suspend-devices.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4310/shard-tglb2/igt@i915_pm_rpm@system-suspend-devices.html

  * igt@i915_pm_rps@waitboost:
    - shard-tglb:         [FAIL][121] ([i915#413]) -> [PASS][122]
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-tglb7/igt@i915_pm_rps@waitboost.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4310/shard-tglb5/igt@i915_pm_rps@waitboost.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [FAIL][123] ([i915#72]) -> [PASS][124]
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-glk1/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4310/shard-glk3/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-hsw:          [INCOMPLETE][125] ([i915#61]) -> [PASS][126]
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-hsw4/igt@kms_flip@flip-vs-suspend.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4310/shard-hsw1/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render:
    - shard-kbl:          [FAIL][127] ([i915#49]) -> [PASS][128]
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4310/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html
    - shard-glk:          [FAIL][129] ([i915#49]) -> [PASS][130]
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-glk2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4310/shard-glk5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html
    - shard-apl:          [FAIL][131] ([i915#49]) -> [PASS][132]
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-apl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4310/shard-apl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite:
    - shard-snb:          [DMESG-WARN][133] ([i915#478]) -> [PASS][134]
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-snb6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4310/shard-snb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-apl:          [DMESG-WARN][135] ([i915#180]) -> [PASS][136] +1 similar issue
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-apl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4310/shard-apl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_psr@psr2_cursor_plane_onoff:
    - shard-iclb:         [SKIP][137] ([fdo#109441]) -> [PASS][138] +1 similar issue
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb6/igt@kms_psr@psr2_cursor_plane_onoff.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4310/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html

  * igt@kms_vblank@pipe-d-ts-continuation-modeset-hang:
    - shard-tglb:         [SKIP][139] ([fdo#112015]) -> [PASS][140]
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-tglb3/igt@kms_vblank@pipe-d-ts-continuation-modeset-hang.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4310/shard-tglb2/igt@kms_vblank@pipe-d-ts-continuation-modeset-hang.html

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [FAIL][141] ([i915#1085]) -> [PASS][142]
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-tglb6/igt@perf@gen12-mi-rpc.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4310/shard-tglb7/igt@perf@gen12-mi-rpc.html

  * igt@perf_pmu@most-busy-idle-check-all-bcs0:
    - shard-hsw:          [FAIL][143] -> [PASS][144] +1 similar issue
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-hsw5/igt@perf_pmu@most-busy-idle-check-all-bcs0.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4310/shard-hsw5/igt@perf_pmu@most-busy-idle-check-all-bcs0.html

  
#### Warnings ####

  * igt@gem_userptr_blits@map-fixed-invalidate-busy@gtt:
    - shard-hsw:          [DMESG-WARN][145] ([fdo#110789] / [i915#478]) -> [DMESG-WARN][146] ([i915#478])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-hsw5/igt@gem_userptr_blits@map-fixed-invalidate-busy@gtt.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4310/shard-hsw4/igt@gem_userptr_blits@map-fixed-invalidate-busy@gtt.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [SKIP][147] ([i915#468]) -> [FAIL][148] ([i915#454])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4310/shard-tglb6/igt@i915_pm_dc@dc6-dpms.html

  * igt@kms_content_protection@legacy:
    - shard-apl:          [TIMEOUT][149] ([i915#1319]) -> [FAIL][150] ([fdo#110321] / [fdo#110336])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-apl8/igt@kms_content_protection@legacy.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4310/shard-apl4/igt@kms_content_protection@legacy.html

  * igt@runner@aborted:
    - shard-kbl:          [FAIL][151] ([i915#92]) -> ([FAIL][152], [FAIL][153]) ([i915#1389] / [i915#1402] / [i915#92])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-kbl3/igt@runner@aborted.html
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4310/shard-kbl1/igt@runner@aborted.html
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4310/shard-kbl4/igt@runner@aborted.html
    - shard-apl:          ([FAIL][154], [FAIL][155]) ([fdo#103927] / [i915#1402]) -> [FAIL][156] ([fdo#103927])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-apl3/igt@runner@aborted.html
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-apl1/igt@runner@aborted.html
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4310/shard-apl1/igt@runner@aborted.html

  
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112015]: https://bugs.freedesktop.org/show_bug.cgi?id=112015
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112118]: https://bugs.freedesktop.org/show_bug.cgi?id=112118
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1389]: https://gitlab.freedesktop.org/drm/intel/issues/1389
  [i915#1402]: https://gitlab.freedesktop.org/drm/intel/issues/1402
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#407]: https://gitlab.freedesktop.org/drm/intel/issues/407
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#447]: https://gitlab.freedesktop.org/drm/intel/issues/447
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#58]: https://gitlab.freedesktop.org/d

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4310/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
