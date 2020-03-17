Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 17 Mar 2020 01:23:40 -0000
Message-ID: <158440822013.5178.301597601099602834@emeril.freedesktop.org>
References: <20200316160452.29636-1-lyude@redhat.com>
In-Reply-To: <20200316160452.29636-1-lyude@redhat.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliL3Rl?=
 =?utf-8?q?sts/igt=5Fdescribe=3A_Use_=5F=5FFILE=5F=5F_in_JUST=5FC=5FOUTPUT?=
 =?utf-8?q?_and_DESCRIBE=5FALL=5FOUTPUT?=
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

Series: lib/tests/igt_describe: Use __FILE__ in JUST_C_OUTPUT and DESCRIBE_ALL_OUTPUT
URL   : https://patchwork.freedesktop.org/series/74751/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8137_full -> IGTPW_4311_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4311_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4311_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4311/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4311_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_ctx_shared@single-timeline:
    - shard-snb:          NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4311/shard-snb2/igt@gem_ctx_shared@single-timeline.html
    - shard-hsw:          NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4311/shard-hsw2/igt@gem_ctx_shared@single-timeline.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4311/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-suspend.html

  
#### Warnings ####

  * igt@runner@aborted:
    - shard-hsw:          ([FAIL][5], [FAIL][6], [FAIL][7], [FAIL][8], [FAIL][9], [FAIL][10], [FAIL][11], [FAIL][12]) ([fdo#111870]) -> ([FAIL][13], [FAIL][14], [FAIL][15], [FAIL][16], [FAIL][17], [FAIL][18], [FAIL][19], [FAIL][20]) ([fdo#111870] / [k.org#204565])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-hsw7/igt@runner@aborted.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-hsw6/igt@runner@aborted.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-hsw6/igt@runner@aborted.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-hsw2/igt@runner@aborted.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-hsw1/igt@runner@aborted.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-hsw5/igt@runner@aborted.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-hsw5/igt@runner@aborted.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-hsw2/igt@runner@aborted.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4311/shard-hsw6/igt@runner@aborted.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4311/shard-hsw2/igt@runner@aborted.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4311/shard-hsw1/igt@runner@aborted.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4311/shard-hsw4/igt@runner@aborted.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4311/shard-hsw2/igt@runner@aborted.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4311/shard-hsw5/igt@runner@aborted.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4311/shard-hsw4/igt@runner@aborted.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4311/shard-hsw6/igt@runner@aborted.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8137_full and IGTPW_4311_full:

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

  Here are the changes found in IGTPW_4311_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-glk:          [PASS][21] -> [INCOMPLETE][22] ([i915#1402] / [i915#58] / [k.org#198133])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-glk3/igt@gem_ctx_persistence@close-replace-race.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4311/shard-glk6/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_exec_schedule@implicit-both-bsd:
    - shard-iclb:         [PASS][23] -> [SKIP][24] ([i915#677])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb6/igt@gem_exec_schedule@implicit-both-bsd.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4311/shard-iclb1/igt@gem_exec_schedule@implicit-both-bsd.html

  * igt@gem_exec_schedule@wide-bsd:
    - shard-iclb:         [PASS][25] -> [SKIP][26] ([fdo#112146]) +5 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb8/igt@gem_exec_schedule@wide-bsd.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4311/shard-iclb4/igt@gem_exec_schedule@wide-bsd.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [PASS][27] -> [FAIL][28] ([i915#644])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-glk9/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4311/shard-glk1/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-snb:          [PASS][29] -> [DMESG-WARN][30] ([fdo#111870] / [i915#478])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-snb6/igt@gem_userptr_blits@dmabuf-unsync.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4311/shard-snb2/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@i915_module_load@reload:
    - shard-tglb:         [PASS][31] -> [INCOMPLETE][32] ([i915#1390])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-tglb3/igt@i915_module_load@reload.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4311/shard-tglb7/igt@i915_module_load@reload.html
    - shard-snb:          [PASS][33] -> [INCOMPLETE][34] ([i915#82])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-snb2/igt@i915_module_load@reload.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4311/shard-snb2/igt@i915_module_load@reload.html
    - shard-iclb:         [PASS][35] -> [INCOMPLETE][36] ([i915#140])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb2/igt@i915_module_load@reload.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4311/shard-iclb7/igt@i915_module_load@reload.html
    - shard-kbl:          [PASS][37] -> [INCOMPLETE][38] ([i915#1390])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-kbl4/igt@i915_module_load@reload.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4311/shard-kbl4/igt@i915_module_load@reload.html
    - shard-hsw:          [PASS][39] -> [INCOMPLETE][40] ([i915#1312] / [i915#61])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-hsw2/igt@i915_module_load@reload.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4311/shard-hsw2/igt@i915_module_load@reload.html
    - shard-glk:          [PASS][41] -> [INCOMPLETE][42] ([i915#1390] / [i915#58] / [k.org#198133])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-glk1/igt@i915_module_load@reload.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4311/shard-glk5/igt@i915_module_load@reload.html
    - shard-apl:          [PASS][43] -> [INCOMPLETE][44] ([fdo#103927] / [i915#1390])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-apl6/igt@i915_module_load@reload.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4311/shard-apl2/igt@i915_module_load@reload.html

  * igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-iclb:         [PASS][45] -> [SKIP][46] ([i915#1316])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb6/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4311/shard-iclb6/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html
    - shard-tglb:         [PASS][47] -> [SKIP][48] ([i915#1316])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-tglb8/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4311/shard-tglb5/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@i915_pm_rps@waitboost:
    - shard-iclb:         [PASS][49] -> [FAIL][50] ([i915#413])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb4/igt@i915_pm_rps@waitboost.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4311/shard-iclb5/igt@i915_pm_rps@waitboost.html

  * igt@kms_cursor_crc@pipe-b-cursor-64x64-onscreen:
    - shard-kbl:          [PASS][51] -> [FAIL][52] ([i915#54])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-kbl1/igt@kms_cursor_crc@pipe-b-cursor-64x64-onscreen.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4311/shard-kbl2/igt@kms_cursor_crc@pipe-b-cursor-64x64-onscreen.html
    - shard-apl:          [PASS][53] -> [FAIL][54] ([i915#54])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-apl1/igt@kms_cursor_crc@pipe-b-cursor-64x64-onscreen.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4311/shard-apl1/igt@kms_cursor_crc@pipe-b-cursor-64x64-onscreen.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-untiled:
    - shard-snb:          [PASS][55] -> [DMESG-WARN][56] ([i915#478])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-snb5/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-untiled.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4311/shard-snb5/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-untiled.html
    - shard-hsw:          [PASS][57] -> [DMESG-WARN][58] ([i915#478])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-hsw1/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-untiled.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4311/shard-hsw4/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-untiled.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-kbl:          [PASS][59] -> [DMESG-WARN][60] ([i915#180]) +5 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-kbl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4311/shard-kbl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][61] -> [SKIP][62] ([fdo#109441]) +3 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4311/shard-iclb6/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_setmode@basic:
    - shard-glk:          [PASS][63] -> [FAIL][64] ([i915#31])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-glk2/igt@kms_setmode@basic.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4311/shard-glk1/igt@kms_setmode@basic.html
    - shard-kbl:          [PASS][65] -> [FAIL][66] ([i915#31])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-kbl7/igt@kms_setmode@basic.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4311/shard-kbl2/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-a-query-forked-hang:
    - shard-kbl:          [PASS][67] -> [SKIP][68] ([fdo#109271])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-kbl3/igt@kms_vblank@pipe-a-query-forked-hang.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4311/shard-kbl1/igt@kms_vblank@pipe-a-query-forked-hang.html
    - shard-tglb:         [PASS][69] -> [SKIP][70] ([fdo#112015])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-tglb2/igt@kms_vblank@pipe-a-query-forked-hang.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4311/shard-tglb7/igt@kms_vblank@pipe-a-query-forked-hang.html
    - shard-apl:          [PASS][71] -> [SKIP][72] ([fdo#109271])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-apl1/igt@kms_vblank@pipe-a-query-forked-hang.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4311/shard-apl3/igt@kms_vblank@pipe-a-query-forked-hang.html
    - shard-iclb:         [PASS][73] -> [SKIP][74] ([fdo#109278])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb7/igt@kms_vblank@pipe-a-query-forked-hang.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4311/shard-iclb8/igt@kms_vblank@pipe-a-query-forked-hang.html

  * igt@perf_pmu@busy-no-semaphores-vcs1:
    - shard-iclb:         [PASS][75] -> [SKIP][76] ([fdo#112080]) +9 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb2/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4311/shard-iclb3/igt@perf_pmu@busy-no-semaphores-vcs1.html

  * igt@perf_pmu@rc6-runtime-pm-long:
    - shard-iclb:         [PASS][77] -> [SKIP][78] ([i915#293])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb5/igt@perf_pmu@rc6-runtime-pm-long.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4311/shard-iclb6/igt@perf_pmu@rc6-runtime-pm-long.html
    - shard-tglb:         [PASS][79] -> [SKIP][80] ([fdo#111719])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-tglb1/igt@perf_pmu@rc6-runtime-pm-long.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4311/shard-tglb5/igt@perf_pmu@rc6-runtime-pm-long.html
    - shard-glk:          [PASS][81] -> [SKIP][82] ([fdo#109271]) +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-glk7/igt@perf_pmu@rc6-runtime-pm-long.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4311/shard-glk2/igt@perf_pmu@rc6-runtime-pm-long.html
    - shard-hsw:          [PASS][83] -> [SKIP][84] ([fdo#109271])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-hsw7/igt@perf_pmu@rc6-runtime-pm-long.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4311/shard-hsw4/igt@perf_pmu@rc6-runtime-pm-long.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [PASS][85] -> [SKIP][86] ([fdo#109276]) +19 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb1/igt@prime_vgem@fence-wait-bsd2.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4311/shard-iclb8/igt@prime_vgem@fence-wait-bsd2.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-snb:          [FAIL][87] -> [PASS][88] +1 similar issue
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-snb4/igt@gem_ctx_isolation@rcs0-s3.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4311/shard-snb5/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_eio@in-flight-contexts-1us:
    - shard-hsw:          [TIMEOUT][89] -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-hsw1/igt@gem_eio@in-flight-contexts-1us.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4311/shard-hsw1/igt@gem_eio@in-flight-contexts-1us.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [SKIP][91] ([fdo#110854]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb8/igt@gem_exec_balancer@smoke.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4311/shard-iclb4/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_parallel@bcs0-fds:
    - shard-apl:          [FAIL][93] -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-apl6/igt@gem_exec_parallel@bcs0-fds.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4311/shard-apl3/igt@gem_exec_parallel@bcs0-fds.html
    - shard-iclb:         [FAIL][95] -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb2/igt@gem_exec_parallel@bcs0-fds.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4311/shard-iclb5/igt@gem_exec_parallel@bcs0-fds.html
    - shard-tglb:         [FAIL][97] -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-tglb3/igt@gem_exec_parallel@bcs0-fds.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4311/shard-tglb3/igt@gem_exec_parallel@bcs0-fds.html
    - shard-glk:          [FAIL][99] -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-glk8/igt@gem_exec_parallel@bcs0-fds.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4311/shard-glk4/igt@gem_exec_parallel@bcs0-fds.html

  * igt@gem_exec_schedule@implicit-both-bsd2:
    - shard-iclb:         [SKIP][101] ([fdo#109276] / [i915#677]) -> [PASS][102] +1 similar issue
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb5/igt@gem_exec_schedule@implicit-both-bsd2.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4311/shard-iclb2/igt@gem_exec_schedule@implicit-both-bsd2.html

  * igt@gem_exec_schedule@in-order-bsd:
    - shard-iclb:         [SKIP][103] ([fdo#112146]) -> [PASS][104] +4 similar issues
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb4/igt@gem_exec_schedule@in-order-bsd.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4311/shard-iclb6/igt@gem_exec_schedule@in-order-bsd.html

  * igt@gem_exec_schedule@out-order-bsd2:
    - shard-iclb:         [SKIP][105] ([fdo#109276]) -> [PASS][106] +16 similar issues
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb5/igt@gem_exec_schedule@out-order-bsd2.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4311/shard-iclb4/igt@gem_exec_schedule@out-order-bsd2.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [SKIP][107] ([i915#677]) -> [PASS][108] +4 similar issues
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb1/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4311/shard-iclb7/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@preempt-hang-render:
    - shard-apl:          [SKIP][109] ([fdo#109271]) -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-apl6/igt@gem_exec_schedule@preempt-hang-render.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4311/shard-apl4/igt@gem_exec_schedule@preempt-hang-render.html
    - shard-glk:          [SKIP][111] ([fdo#109271]) -> [PASS][112] +1 similar issue
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-glk8/igt@gem_exec_schedule@preempt-hang-render.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4311/shard-glk2/igt@gem_exec_schedule@preempt-hang-render.html
    - shard-iclb:         [SKIP][113] -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb2/igt@gem_exec_schedule@preempt-hang-render.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4311/shard-iclb7/igt@gem_exec_schedule@preempt-hang-render.html
    - shard-tglb:         [SKIP][115] -> [PASS][116]
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-tglb3/igt@gem_exec_schedule@preempt-hang-render.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4311/shard-tglb7/igt@gem_exec_schedule@preempt-hang-render.html
    - shard-kbl:          [SKIP][117] ([fdo#109271]) -> [PASS][118]
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-kbl7/igt@gem_exec_schedule@preempt-hang-render.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4311/shard-kbl6/igt@gem_exec_schedule@preempt-hang-render.html

  * igt@gem_userptr_blits@sync-unmap-after-close:
    - shard-snb:          [DMESG-WARN][119] ([fdo#111870] / [i915#478]) -> [PASS][120]
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-snb5/igt@gem_userptr_blits@sync-unmap-after-close.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4311/shard-snb5/igt@gem_userptr_blits@sync-unmap-after-close.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-kbl:          [DMESG-WARN][121] ([i915#180]) -> [PASS][122] +2 similar issues
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-kbl2/igt@gem_workarounds@suspend-resume-fd.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4311/shard-kbl6/igt@gem_workarounds@suspend-resume-fd.html

  * igt@i915_pm_dc@dc5-dpms:
    - shard-iclb:         [FAIL][123] ([i915#447]) -> [PASS][124]
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb3/igt@i915_pm_dc@dc5-dpms.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4311/shard-iclb6/igt@i915_pm_dc@dc5-dpms.html

  * igt@i915_pm_rpm@system-suspend-devices:
    - shard-iclb:         [SKIP][125] ([i915#1316]) -> [PASS][126]
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb1/igt@i915_pm_rpm@system-suspend-devices.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4311/shard-iclb6/igt@i915_pm_rpm@system-suspend-devices.html
    - shard-hsw:          [SKIP][127] ([fdo#109271]) -> [PASS][128]
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-hsw4/igt@i915_pm_rpm@system-suspend-devices.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4311/shard-hsw5/igt@i915_pm_rpm@system-suspend-devices.html
    - shard-tglb:         [SKIP][129] ([i915#1316]) -> [PASS][130]
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-tglb6/igt@i915_pm_rpm@system-suspend-devices.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4311/shard-tglb5/igt@i915_pm_rpm@system-suspend-devices.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [FAIL][131] ([i915#72]) -> [PASS][132]
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-glk1/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4311/shard-glk2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-hsw:          [INCOMPLETE][133] ([i915#61]) -> [PASS][134]
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-hsw4/igt@kms_flip@flip-vs-suspend.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4311/shard-hsw5/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render:
    - shard-kbl:          [FAIL][135] ([i915#49]) -> [PASS][136]
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4311/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html
    - shard-glk:          [FAIL][137] ([i915#49]) -> [PASS][138]
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-glk2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4311/shard-glk6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html
    - shard-apl:          [FAIL][139] ([i915#49]) -> [PASS][140]
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-apl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4311/shard-apl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite:
    - shard-snb:          [DMESG-WARN][141] ([i915#478]) -> [PASS][142]
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-snb6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4311/shard-snb4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-apl:          [DMESG-WARN][143] ([i915#180]) -> [PASS][144] +1 similar issue
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-apl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4311/shard-apl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [SKIP][145] ([fdo#109441]) -> [PASS][146] +3 similar issues
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb4/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4311/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_setmode@basic:
    - shard-hsw:          [FAIL][147] ([i915#31]) -> [PASS][148]
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-hsw6/igt@kms_setmode@basic.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4311/shard-hsw6/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-d-ts-continuation-modeset-hang:
    - shard-tglb:         [SKIP][149] ([fdo#112015]) -> [PASS][150]
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-tglb3/igt@kms_vblank@pipe-d-ts-continuation-modeset-hang.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4311/shard-tglb3/igt@kms_vblank@pipe-d-ts-continuation-modeset-hang.html

  * igt@perf_pmu@busy-vcs1:
    - shard-iclb:         [SKIP][151] ([fdo#112080]) -> [PASS][152] +11 similar issues
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb6/igt@perf_pmu@busy-vcs1.html
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4311/shard-iclb2/igt@perf_pmu@busy-vcs1.html

  * igt@perf_pmu@most-busy-idle-check-all-bcs0:
    - shard-hsw:          [FAIL][153] -> [PASS][154] +1 similar issue
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-hsw5/igt@perf_pmu@most-busy-idle-check-all-bcs0.html
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4311/shard-hsw5/igt@perf_pmu@most-busy-idle-check-all-bcs0.html

  
#### Warnings ####

  * igt@gem_userptr_blits@map-fixed-invalidate-busy@gtt:
    - shard-hsw:          [DMESG-WARN][155] ([fdo#110789] / [i915#478]) -> [DMESG-WARN][156] ([i915#478])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-hsw5/igt@gem_userptr_blits@map-fixed-invalidate-busy@gtt.html
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4311/shard-hsw4/igt@gem_userptr_blits@map-fixed-invalidate-busy@gtt.html

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-snb:          [DMESG-WARN][157] ([fdo#111870] / [i915#478]) -> [DMESG-WARN][158] ([fdo#110789] / [fdo#111870] / [i915#478])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-snb5/igt@gem_userptr_blits@sync-unmap-cycles.html
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4311/shard-snb4/igt@gem_userptr_blits@sync-unmap-cycles.html
    - shard-hsw:          [DMESG-WARN][159] ([fdo#111870]) -> [DMESG-WARN][160] ([fdo#110789] / [fdo#111870])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-hsw1/igt@gem_userptr_blits@sync-unmap-cycles.html
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4311/shard-hsw1/igt@gem_userptr_blits@sync-unmap-cycles.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [SKIP][161] ([i915#468]) -> [FAIL][162] ([i915#454])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4311/shard-tglb6/igt@i915_pm_dc@dc6-dpms.html

  * igt@runner@aborted:
    - shard-kbl:          [FAIL][163] ([i915#92]) -> [FAIL][164] ([k.org#204565])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-kbl3/igt@runner@aborted.html
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4311/shard-kbl4/igt@runner@aborted.html
    - shard-apl:          ([FAIL][165], [FAIL][166]) ([fdo#103927] / [i915#1402]) -> ([FAIL][167], [FAIL][168], [FAIL][169]) ([fdo#103927] / [i915#1402] / [k.org#204565])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-apl3/igt@runner@aborted.html
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-apl1/igt@runner@aborted.html
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4311/shard-apl2/igt@runner@aborted.html
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4311/shard-apl7/igt@runner@aborted.html
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4311/shard-apl2/igt@runner@aborted.html
    - shard-tglb:         [FAIL][170] ([i915#1389]) -> ([FAIL][171], [FAIL][172]) ([i915#1389] / [k.org#204565])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-tglb2/igt@runner@aborted.html
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4311/shard-tglb3/igt@runner@aborted.html
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4311/shard-tglb7/igt@runner@aborted.html
    - shard-snb:          ([FAIL][173], [FAIL][174], [FAIL][175], [FAIL][176], [FAIL][177], [FAIL][178], [FAIL][179], [FAIL][180], [FAIL][181]) ([fdo#111870] / [i915#1077] / [i915#698]) -> ([FAIL][182], [FAIL][183], [FAIL][184], [FAIL][185], [FAIL][186], [FAIL][187], [FAIL][188], [FAIL][189]) ([fdo#111870] / [i915#1077] / [k.org#

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4311/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
