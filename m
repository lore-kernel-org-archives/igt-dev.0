Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 16 Mar 2020 20:12:37 -0000
Message-ID: <158438955736.18995.10011269665939254317@emeril.freedesktop.org>
References: <20200316105427.517192-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200316105427.517192-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_intel-ci=3A_Tweak_blacklist_fo?=
 =?utf-8?q?r_very_long_running_stability_tests?=
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

Series: series starting with [i-g-t,1/2] intel-ci: Tweak blacklist for very long running stability tests
URL   : https://patchwork.freedesktop.org/series/74735/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8137_full -> IGTPW_4308_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4308_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4308_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4308_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_ctx_shared@q-independent-blt:
    - shard-iclb:         [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb8/igt@gem_ctx_shared@q-independent-blt.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/shard-iclb7/igt@gem_ctx_shared@q-independent-blt.html

  * igt@gem_ctx_shared@single-timeline:
    - shard-snb:          NOTRUN -> [FAIL][3] +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/shard-snb5/igt@gem_ctx_shared@single-timeline.html
    - shard-hsw:          NOTRUN -> [FAIL][4] +1 similar issue
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/shard-hsw6/igt@gem_ctx_shared@single-timeline.html

  * igt@i915_selftest@live:
    - shard-tglb:         NOTRUN -> [FAIL][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/shard-tglb1/igt@i915_selftest@live.html
    - shard-kbl:          NOTRUN -> [FAIL][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/shard-kbl7/igt@i915_selftest@live.html
    - shard-glk:          NOTRUN -> [FAIL][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/shard-glk9/igt@i915_selftest@live.html
    - shard-iclb:         NOTRUN -> [FAIL][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/shard-iclb7/igt@i915_selftest@live.html
    - shard-apl:          NOTRUN -> [FAIL][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/shard-apl7/igt@i915_selftest@live.html

  * igt@prime_busy@hang-vebox:
    - shard-iclb:         [PASS][10] -> [SKIP][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb2/igt@prime_busy@hang-vebox.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/shard-iclb7/igt@prime_busy@hang-vebox.html
    - shard-tglb:         [PASS][12] -> [SKIP][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-tglb3/igt@prime_busy@hang-vebox.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/shard-tglb6/igt@prime_busy@hang-vebox.html

  * igt@prime_busy@wait-hang-vebox:
    - shard-iclb:         [PASS][14] -> [TIMEOUT][15] +1 similar issue
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb5/igt@prime_busy@wait-hang-vebox.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/shard-iclb6/igt@prime_busy@wait-hang-vebox.html
    - shard-apl:          [PASS][16] -> [TIMEOUT][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-apl2/igt@prime_busy@wait-hang-vebox.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/shard-apl1/igt@prime_busy@wait-hang-vebox.html
    - shard-glk:          [PASS][18] -> [TIMEOUT][19]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-glk5/igt@prime_busy@wait-hang-vebox.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/shard-glk9/igt@prime_busy@wait-hang-vebox.html
    - shard-tglb:         [PASS][20] -> [TIMEOUT][21]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-tglb5/igt@prime_busy@wait-hang-vebox.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/shard-tglb3/igt@prime_busy@wait-hang-vebox.html
    - shard-kbl:          [PASS][22] -> [TIMEOUT][23]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-kbl2/igt@prime_busy@wait-hang-vebox.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/shard-kbl1/igt@prime_busy@wait-hang-vebox.html

  
#### Warnings ####

  * igt@gen3_render_mixed_blits:
    - shard-tglb:         [SKIP][24] ([fdo#109289]) -> [SKIP][25]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-tglb6/igt@gen3_render_mixed_blits.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/shard-tglb5/igt@gen3_render_mixed_blits.html
    - shard-iclb:         [SKIP][26] ([fdo#109289]) -> [SKIP][27]
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb1/igt@gen3_render_mixed_blits.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/shard-iclb4/igt@gen3_render_mixed_blits.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8137_full and IGTPW_4308_full:

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

  Here are the changes found in IGTPW_4308_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-iclb:         [PASS][28] -> [INCOMPLETE][29] ([i915#1402])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb8/igt@gem_ctx_persistence@close-replace-race.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/shard-iclb4/igt@gem_ctx_persistence@close-replace-race.html
    - shard-glk:          [PASS][30] -> [INCOMPLETE][31] ([i915#1402] / [i915#58] / [k.org#198133])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-glk3/igt@gem_ctx_persistence@close-replace-race.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/shard-glk3/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_ctx_shared@q-independent-blt:
    - shard-kbl:          [PASS][32] -> [FAIL][33] ([fdo#112118] / [i915#935])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-kbl1/igt@gem_ctx_shared@q-independent-blt.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/shard-kbl3/igt@gem_ctx_shared@q-independent-blt.html
    - shard-glk:          [PASS][34] -> [FAIL][35] ([i915#935])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-glk6/igt@gem_ctx_shared@q-independent-blt.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/shard-glk3/igt@gem_ctx_shared@q-independent-blt.html
    - shard-apl:          [PASS][36] -> [FAIL][37] ([fdo#112118] / [i915#935])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-apl1/igt@gem_ctx_shared@q-independent-blt.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/shard-apl6/igt@gem_ctx_shared@q-independent-blt.html
    - shard-tglb:         [PASS][38] -> [FAIL][39] ([i915#935])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-tglb5/igt@gem_ctx_shared@q-independent-blt.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/shard-tglb6/igt@gem_ctx_shared@q-independent-blt.html

  * igt@gem_exec_schedule@implicit-both-bsd1:
    - shard-iclb:         [PASS][40] -> [SKIP][41] ([fdo#109276] / [i915#677])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb4/igt@gem_exec_schedule@implicit-both-bsd1.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/shard-iclb3/igt@gem_exec_schedule@implicit-both-bsd1.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [PASS][42] -> [SKIP][43] ([fdo#112146]) +3 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb6/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/shard-iclb4/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [PASS][44] -> [FAIL][45] ([i915#644])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-glk9/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/shard-glk9/igt@gem_ppgtt@flink-and-close-vma-leak.html
    - shard-tglb:         [PASS][46] -> [FAIL][47] ([i915#644])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-tglb6/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/shard-tglb3/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-apl:          [PASS][48] -> [DMESG-WARN][49] ([i915#180]) +3 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-apl4/igt@gem_workarounds@suspend-resume-context.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/shard-apl6/igt@gem_workarounds@suspend-resume-context.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [PASS][50] -> [FAIL][51] ([i915#454])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb5/igt@i915_pm_dc@dc6-dpms.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rpm@dpms-mode-unset-lpsp:
    - shard-tglb:         [PASS][52] -> [SKIP][53] ([i915#1316])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-tglb8/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/shard-tglb3/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html
    - shard-iclb:         [PASS][54] -> [SKIP][55] ([i915#1316])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb6/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/shard-iclb3/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@i915_suspend@forcewake:
    - shard-kbl:          [PASS][56] -> [DMESG-WARN][57] ([i915#180]) +3 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-kbl1/igt@i915_suspend@forcewake.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/shard-kbl2/igt@i915_suspend@forcewake.html

  * igt@kms_flip@flip-vs-fences-interruptible:
    - shard-kbl:          [PASS][58] -> [DMESG-WARN][59] ([i915#1297])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-kbl2/igt@kms_flip@flip-vs-fences-interruptible.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/shard-kbl1/igt@kms_flip@flip-vs-fences-interruptible.html
    - shard-apl:          [PASS][60] -> [DMESG-WARN][61] ([i915#1297])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-apl6/igt@kms_flip@flip-vs-fences-interruptible.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/shard-apl1/igt@kms_flip@flip-vs-fences-interruptible.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][62] -> [SKIP][63] ([fdo#109441]) +3 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/shard-iclb6/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][64] -> [FAIL][65] ([i915#31])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-apl2/igt@kms_setmode@basic.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/shard-apl3/igt@kms_setmode@basic.html
    - shard-kbl:          [PASS][66] -> [FAIL][67] ([i915#31])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-kbl7/igt@kms_setmode@basic.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/shard-kbl7/igt@kms_setmode@basic.html

  * igt@perf_pmu@busy-no-semaphores-vcs1:
    - shard-iclb:         [PASS][68] -> [SKIP][69] ([fdo#112080]) +9 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb2/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/shard-iclb7/igt@perf_pmu@busy-no-semaphores-vcs1.html

  * igt@prime_busy@hang-vebox:
    - shard-glk:          [PASS][70] -> [SKIP][71] ([fdo#109271])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-glk1/igt@prime_busy@hang-vebox.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/shard-glk3/igt@prime_busy@hang-vebox.html
    - shard-kbl:          [PASS][72] -> [SKIP][73] ([fdo#109271])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-kbl4/igt@prime_busy@hang-vebox.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/shard-kbl3/igt@prime_busy@hang-vebox.html
    - shard-apl:          [PASS][74] -> [SKIP][75] ([fdo#109271])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-apl6/igt@prime_busy@hang-vebox.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/shard-apl6/igt@prime_busy@hang-vebox.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [PASS][76] -> [SKIP][77] ([fdo#109276]) +15 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb1/igt@prime_vgem@fence-wait-bsd2.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/shard-iclb6/igt@prime_vgem@fence-wait-bsd2.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-snb:          [FAIL][78] -> [PASS][79] +1 similar issue
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-snb4/igt@gem_ctx_isolation@rcs0-s3.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/shard-snb6/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_exec_parallel@bcs0-fds:
    - shard-apl:          [FAIL][80] -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-apl6/igt@gem_exec_parallel@bcs0-fds.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/shard-apl1/igt@gem_exec_parallel@bcs0-fds.html
    - shard-iclb:         [FAIL][82] -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb2/igt@gem_exec_parallel@bcs0-fds.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/shard-iclb6/igt@gem_exec_parallel@bcs0-fds.html
    - shard-tglb:         [FAIL][84] -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-tglb3/igt@gem_exec_parallel@bcs0-fds.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/shard-tglb7/igt@gem_exec_parallel@bcs0-fds.html
    - shard-glk:          [FAIL][86] -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-glk8/igt@gem_exec_parallel@bcs0-fds.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/shard-glk2/igt@gem_exec_parallel@bcs0-fds.html

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [SKIP][88] ([fdo#112080]) -> [PASS][89] +6 similar issues
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb8/igt@gem_exec_parallel@vcs1-fds.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/shard-iclb1/igt@gem_exec_parallel@vcs1-fds.html

  * igt@gem_exec_schedule@implicit-both-bsd2:
    - shard-iclb:         [SKIP][90] ([fdo#109276] / [i915#677]) -> [PASS][91] +1 similar issue
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb5/igt@gem_exec_schedule@implicit-both-bsd2.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/shard-iclb4/igt@gem_exec_schedule@implicit-both-bsd2.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [SKIP][92] ([i915#677]) -> [PASS][93] +3 similar issues
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb1/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/shard-iclb7/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@preempt-contexts-bsd2:
    - shard-iclb:         [SKIP][94] ([fdo#109276]) -> [PASS][95] +17 similar issues
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb8/igt@gem_exec_schedule@preempt-contexts-bsd2.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/shard-iclb1/igt@gem_exec_schedule@preempt-contexts-bsd2.html

  * igt@gem_exec_schedule@preempt-hang-render:
    - shard-apl:          [SKIP][96] ([fdo#109271]) -> [PASS][97]
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-apl6/igt@gem_exec_schedule@preempt-hang-render.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/shard-apl3/igt@gem_exec_schedule@preempt-hang-render.html
    - shard-glk:          [SKIP][98] ([fdo#109271]) -> [PASS][99] +1 similar issue
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-glk8/igt@gem_exec_schedule@preempt-hang-render.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/shard-glk1/igt@gem_exec_schedule@preempt-hang-render.html
    - shard-iclb:         [SKIP][100] -> [PASS][101]
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb2/igt@gem_exec_schedule@preempt-hang-render.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/shard-iclb8/igt@gem_exec_schedule@preempt-hang-render.html
    - shard-tglb:         [SKIP][102] -> [PASS][103]
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-tglb3/igt@gem_exec_schedule@preempt-hang-render.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/shard-tglb7/igt@gem_exec_schedule@preempt-hang-render.html
    - shard-kbl:          [SKIP][104] ([fdo#109271]) -> [PASS][105]
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-kbl7/igt@gem_exec_schedule@preempt-hang-render.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/shard-kbl3/igt@gem_exec_schedule@preempt-hang-render.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [SKIP][106] ([fdo#112146]) -> [PASS][107] +4 similar issues
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb4/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/shard-iclb8/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-kbl:          [DMESG-WARN][108] ([i915#180]) -> [PASS][109] +1 similar issue
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-kbl2/igt@gem_workarounds@suspend-resume-fd.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/shard-kbl2/igt@gem_workarounds@suspend-resume-fd.html

  * igt@i915_pm_dc@dc5-dpms:
    - shard-iclb:         [FAIL][110] ([i915#447]) -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb3/igt@i915_pm_dc@dc5-dpms.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/shard-iclb6/igt@i915_pm_dc@dc5-dpms.html

  * igt@i915_pm_rpm@system-suspend-devices:
    - shard-iclb:         [SKIP][112] ([i915#1316]) -> [PASS][113]
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb1/igt@i915_pm_rpm@system-suspend-devices.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/shard-iclb7/igt@i915_pm_rpm@system-suspend-devices.html
    - shard-tglb:         [SKIP][114] ([i915#1316]) -> [PASS][115]
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-tglb6/igt@i915_pm_rpm@system-suspend-devices.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/shard-tglb6/igt@i915_pm_rpm@system-suspend-devices.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [FAIL][116] ([i915#72]) -> [PASS][117]
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-glk1/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/shard-glk6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-hsw:          [INCOMPLETE][118] ([i915#61]) -> [PASS][119]
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-hsw4/igt@kms_flip@flip-vs-suspend.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/shard-hsw2/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render:
    - shard-kbl:          [FAIL][120] ([i915#49]) -> [PASS][121]
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html
    - shard-glk:          [FAIL][122] ([i915#49]) -> [PASS][123]
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-glk2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/shard-glk6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html
    - shard-apl:          [FAIL][124] ([i915#49]) -> [PASS][125]
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-apl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/shard-apl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-apl:          [DMESG-WARN][126] ([i915#180]) -> [PASS][127] +1 similar issue
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-apl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/shard-apl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [SKIP][128] ([fdo#109441]) -> [PASS][129] +2 similar issues
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb6/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@kms_vblank@pipe-d-ts-continuation-modeset-hang:
    - shard-tglb:         [SKIP][130] ([fdo#112015]) -> [PASS][131]
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-tglb3/igt@kms_vblank@pipe-d-ts-continuation-modeset-hang.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/shard-tglb3/igt@kms_vblank@pipe-d-ts-continuation-modeset-hang.html

  * igt@perf_pmu@most-busy-idle-check-all-bcs0:
    - shard-hsw:          [FAIL][132] -> [PASS][133] +1 similar issue
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-hsw5/igt@perf_pmu@most-busy-idle-check-all-bcs0.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/shard-hsw1/igt@perf_pmu@most-busy-idle-check-all-bcs0.html

  
#### Warnings ####

  * igt@gem_userptr_blits@map-fixed-invalidate-busy@gtt:
    - shard-hsw:          [DMESG-WARN][134] ([fdo#110789] / [i915#478]) -> [DMESG-WARN][135] ([i915#478])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-hsw5/igt@gem_userptr_blits@map-fixed-invalidate-busy@gtt.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/shard-hsw4/igt@gem_userptr_blits@map-fixed-invalidate-busy@gtt.html

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-snb:          [DMESG-WARN][136] ([fdo#111870] / [i915#478]) -> [DMESG-WARN][137] ([fdo#110789] / [fdo#111870] / [i915#478]) +1 similar issue
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-snb5/igt@gem_userptr_blits@sync-unmap-cycles.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/shard-snb2/igt@gem_userptr_blits@sync-unmap-cycles.html
    - shard-hsw:          [DMESG-WARN][138] ([fdo#111870]) -> [DMESG-WARN][139] ([fdo#110789] / [fdo#111870])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-hsw1/igt@gem_userptr_blits@sync-unmap-cycles.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/shard-hsw2/igt@gem_userptr_blits@sync-unmap-cycles.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [SKIP][140] ([i915#468]) -> [FAIL][141] ([i915#454])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/shard-tglb1/igt@i915_pm_dc@dc6-dpms.html

  * igt@runner@aborted:
    - shard-hsw:          ([FAIL][142], [FAIL][143], [FAIL][144], [FAIL][145], [FAIL][146], [FAIL][147], [FAIL][148], [FAIL][149]) ([fdo#111870]) -> ([FAIL][150], [FAIL][151], [FAIL][152], [FAIL][153], [FAIL][154], [FAIL][155], [FAIL][156], [FAIL][157], [FAIL][158]) ([fdo#111870] / [i915#1400])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-hsw7/igt@runner@aborted.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-hsw6/igt@runner@aborted.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-hsw6/igt@runner@aborted.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-hsw2/igt@runner@aborted.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-hsw1/igt@runner@aborted.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-hsw5/igt@runner@aborted.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-hsw5/igt@runner@aborted.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-hsw2/igt@runner@aborted.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/shard-hsw1/igt@runner@aborted.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/shard-hsw6/igt@runner@aborted.html
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/shard-hsw4/igt@runner@aborted.html
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/shard-hsw2/igt@runner@aborted.html
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/shard-hsw1/igt@runner@aborted.html
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/shard-hsw6/igt@runner@aborted.html
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/shard-hsw1/igt@runner@aborted.html
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/shard-hsw5/igt@runner@aborted.html
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/shard-hsw6/igt@runner@aborted.html
    - shard-kbl:          [FAIL][159] ([i915#92]) -> ([FAIL][160], [FAIL][161]) ([i915#656] / [i915#92])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-kbl3/igt@runner@aborted.html
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/shard-kbl6/igt@runner@aborted.html
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/shard-kbl7/igt@runner@aborted.html
    - shard-apl:          ([FAIL][162], [FAIL][163]) ([fdo#103927] / [i915#1402]) -> ([FAIL][164], [FAIL][165], [FAIL][166]) ([fdo#103927] / [i915#1402] / [i915#529])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-apl3/igt@runner@aborted.html
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-apl1/igt@runner@aborted.html
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/shard-apl3/igt@runner@aborted.html
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/shard-apl2/igt@runner@aborted.html
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/shard-apl7/igt@runner@aborted.html
    - shard-tglb:         [FAIL][167] ([i915#1389]) -> ([FAIL][168], [FAIL][169]) ([i915#1233] / [i915#1389] / [i915#529])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-tglb2/igt@runner@aborted.html
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/shard-tglb1/igt@runner@aborted.html
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/shard-tglb2/igt@runner@aborted.html
    - shard-snb:          ([FAIL][170], [FAIL][171], [FAIL][172], [FAIL][173], [FAIL][174], [FAIL][175], [FAIL][176], [FAIL][177], [FAIL][178]) ([fdo#111870] / [i915#1077] / [i915#698]) -> ([FAIL][179], [FAIL][180], [FAIL][181], [FAIL][182], [FAIL][183], [FAIL][184], [FAIL][185], [FAIL][186], [FAIL][187]) ([fdo#111870] / [i915#1077])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-snb4/igt@runner@aborted.html
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-snb6/igt@runner@aborted.html
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-snb5/igt@runner@aborted.html
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-snb4/igt@runner@aborted.html
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-snb5/igt@runner@aborted.html
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-snb4/igt@runner@aborted.html
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-snb5/igt@runner@aborted.html
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-snb2/igt@runner@aborted.html
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-snb4/igt@runner@aborted.html
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/shard-snb6/igt@runner@aborted.html
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/shard

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4308/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
