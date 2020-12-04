Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 04 Dec 2020 13:30:41 -0000
Message-ID: <160708864107.27542.1651240154601020531@emeril.freedesktop.org>
References: <20201203095726.1427559-1-chris@chris-wilson.co.uk>
In-Reply-To: <20201203095726.1427559-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fctx=5Fexec=3A_Exercise_execution_along_context_while_closi?=
 =?utf-8?q?ng_it_=28rev3=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1650312172=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1650312172==
Content-Type: multipart/alternative;
 boundary="===============3742540615853647983=="

--===============3742540615853647983==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915/gem_ctx_exec: Exercise execution along context while closing it (rev3)
URL   : https://patchwork.freedesktop.org/series/84530/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9441_full -> IGTPW_5248_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5248/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5248_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_ctx_exec@basic-close-race} (NEW):
    - shard-tglb:         NOTRUN -> [TIMEOUT][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5248/shard-tglb1/igt@gem_ctx_exec@basic-close-race.html
    - shard-glk:          NOTRUN -> [TIMEOUT][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5248/shard-glk7/igt@gem_ctx_exec@basic-close-race.html
    - shard-apl:          NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5248/shard-apl4/igt@gem_ctx_exec@basic-close-race.html
    - shard-kbl:          NOTRUN -> [TIMEOUT][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5248/shard-kbl7/igt@gem_ctx_exec@basic-close-race.html
    - shard-iclb:         NOTRUN -> [TIMEOUT][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5248/shard-iclb1/igt@gem_ctx_exec@basic-close-race.html
    - shard-hsw:          NOTRUN -> [TIMEOUT][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5248/shard-hsw1/igt@gem_ctx_exec@basic-close-race.html
    - shard-snb:          NOTRUN -> [FAIL][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5248/shard-snb4/igt@gem_ctx_exec@basic-close-race.html

  
New tests
---------

  New tests have been introduced between CI_DRM_9441_full and IGTPW_5248_full:

### New IGT tests (1) ###

  * igt@gem_ctx_exec@basic-close-race:
    - Statuses : 2 fail(s) 5 timeout(s)
    - Exec time: [5.43, 121.42] s

  

Known issues
------------

  Here are the changes found in IGTPW_5248_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s3:
    - shard-kbl:          [PASS][8] -> [INCOMPLETE][9] ([i915#155] / [i915#180] / [i915#2369])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9441/shard-kbl3/igt@gem_exec_suspend@basic-s3.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5248/shard-kbl2/igt@gem_exec_suspend@basic-s3.html

  * igt@i915_pm_rpm@fences:
    - shard-kbl:          [PASS][10] -> [SKIP][11] ([fdo#109271])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9441/shard-kbl6/igt@i915_pm_rpm@fences.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5248/shard-kbl3/igt@i915_pm_rpm@fences.html
    - shard-iclb:         [PASS][12] -> [SKIP][13] ([i915#579])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9441/shard-iclb7/igt@i915_pm_rpm@fences.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5248/shard-iclb5/igt@i915_pm_rpm@fences.html
    - shard-hsw:          [PASS][14] -> [SKIP][15] ([fdo#109271])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9441/shard-hsw7/igt@i915_pm_rpm@fences.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5248/shard-hsw1/igt@i915_pm_rpm@fences.html
    - shard-glk:          [PASS][16] -> [SKIP][17] ([fdo#109271])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9441/shard-glk8/igt@i915_pm_rpm@fences.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5248/shard-glk2/igt@i915_pm_rpm@fences.html
    - shard-apl:          [PASS][18] -> [SKIP][19] ([fdo#109271])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9441/shard-apl4/igt@i915_pm_rpm@fences.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5248/shard-apl7/igt@i915_pm_rpm@fences.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-iclb:         [PASS][20] -> [INCOMPLETE][21] ([i915#1185])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9441/shard-iclb7/igt@i915_suspend@fence-restore-untiled.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5248/shard-iclb5/igt@i915_suspend@fence-restore-untiled.html
    - shard-glk:          [PASS][22] -> [INCOMPLETE][23] ([i915#2635])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9441/shard-glk5/igt@i915_suspend@fence-restore-untiled.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5248/shard-glk2/igt@i915_suspend@fence-restore-untiled.html
    - shard-apl:          [PASS][24] -> [INCOMPLETE][25] ([i915#2635])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9441/shard-apl4/igt@i915_suspend@fence-restore-untiled.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5248/shard-apl7/igt@i915_suspend@fence-restore-untiled.html
    - shard-kbl:          [PASS][26] -> [INCOMPLETE][27] ([i915#155])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9441/shard-kbl2/igt@i915_suspend@fence-restore-untiled.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5248/shard-kbl3/igt@i915_suspend@fence-restore-untiled.html
    - shard-hsw:          [PASS][28] -> [INCOMPLETE][29] ([i915#2637])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9441/shard-hsw2/igt@i915_suspend@fence-restore-untiled.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5248/shard-hsw1/igt@i915_suspend@fence-restore-untiled.html

  * igt@kms_async_flips@test-time-stamp:
    - shard-tglb:         [PASS][30] -> [FAIL][31] ([i915#2574])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9441/shard-tglb1/igt@kms_async_flips@test-time-stamp.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5248/shard-tglb5/igt@kms_async_flips@test-time-stamp.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff:
    - shard-apl:          [PASS][32] -> [FAIL][33] ([i915#49])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9441/shard-apl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5248/shard-apl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff.html
    - shard-kbl:          [PASS][34] -> [FAIL][35] ([i915#49])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9441/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5248/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff.html
    - shard-glk:          [PASS][36] -> [FAIL][37] ([i915#49])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9441/shard-glk7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5248/shard-glk3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-d-planes:
    - shard-tglb:         [PASS][38] -> [INCOMPLETE][39] ([i915#1436] / [i915#1982] / [i915#456])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9441/shard-tglb7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-d-planes.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5248/shard-tglb5/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-d-planes.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-iclb:         [PASS][40] -> [SKIP][41] ([fdo#109441]) +2 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9441/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5248/shard-iclb5/igt@kms_psr@psr2_cursor_plane_move.html

  
#### Possible fixes ####

  * igt@gem_exec_gttfill@engines@rcs0:
    - shard-glk:          [DMESG-WARN][42] ([i915#118] / [i915#95]) -> [PASS][43] +2 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9441/shard-glk7/igt@gem_exec_gttfill@engines@rcs0.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5248/shard-glk6/igt@gem_exec_gttfill@engines@rcs0.html

  * igt@i915_pm_rpm@sysfs-read:
    - shard-iclb:         [SKIP][44] ([i915#579]) -> [PASS][45]
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9441/shard-iclb3/igt@i915_pm_rpm@sysfs-read.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5248/shard-iclb3/igt@i915_pm_rpm@sysfs-read.html
    - shard-tglb:         [SKIP][46] ([i915#579]) -> [PASS][47]
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9441/shard-tglb2/igt@i915_pm_rpm@sysfs-read.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5248/shard-tglb7/igt@i915_pm_rpm@sysfs-read.html

  * igt@kms_color@pipe-a-ctm-max:
    - shard-kbl:          [FAIL][48] ([i915#1292]) -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9441/shard-kbl3/igt@kms_color@pipe-a-ctm-max.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5248/shard-kbl1/igt@kms_color@pipe-a-ctm-max.html
    - shard-apl:          [FAIL][50] ([i915#1292]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9441/shard-apl6/igt@kms_color@pipe-a-ctm-max.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5248/shard-apl8/igt@kms_color@pipe-a-ctm-max.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [FAIL][52] ([i915#72]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9441/shard-glk1/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5248/shard-glk9/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [SKIP][54] ([fdo#109642] / [fdo#111068]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9441/shard-iclb1/igt@kms_psr2_su@frontbuffer.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5248/shard-iclb2/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [SKIP][56] ([fdo#109441]) -> [PASS][57] +1 similar issue
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9441/shard-iclb3/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5248/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@perf_pmu@rc6-runtime-pm:
    - shard-glk:          [SKIP][58] ([fdo#109271]) -> [PASS][59] +1 similar issue
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9441/shard-glk1/igt@perf_pmu@rc6-runtime-pm.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5248/shard-glk7/igt@perf_pmu@rc6-runtime-pm.html
    - shard-apl:          [SKIP][60] ([fdo#109271]) -> [PASS][61] +1 similar issue
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9441/shard-apl2/igt@perf_pmu@rc6-runtime-pm.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5248/shard-apl4/igt@perf_pmu@rc6-runtime-pm.html
    - shard-kbl:          [SKIP][62] ([fdo#109271]) -> [PASS][63] +1 similar issue
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9441/shard-kbl6/igt@perf_pmu@rc6-runtime-pm.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5248/shard-kbl7/igt@perf_pmu@rc6-runtime-pm.html
    - shard-tglb:         [SKIP][64] ([fdo#111719]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9441/shard-tglb6/igt@perf_pmu@rc6-runtime-pm.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5248/shard-tglb1/igt@perf_pmu@rc6-runtime-pm.html
    - shard-hsw:          [SKIP][66] ([fdo#109271]) -> [PASS][67] +1 similar issue
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9441/shard-hsw6/igt@perf_pmu@rc6-runtime-pm.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5248/shard-hsw1/igt@perf_pmu@rc6-runtime-pm.html
    - shard-iclb:         [SKIP][68] ([i915#293]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9441/shard-iclb1/igt@perf_pmu@rc6-runtime-pm.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5248/shard-iclb1/igt@perf_pmu@rc6-runtime-pm.html

  
#### Warnings ####

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-iclb:         [WARN][70] ([i915#1804] / [i915#2684]) -> [WARN][71] ([i915#2684])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9441/shard-iclb7/igt@i915_pm_rc6_residency@rc6-fence.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5248/shard-iclb2/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         [WARN][72] ([i915#2684]) -> [WARN][73] ([i915#1804] / [i915#2684])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9441/shard-iclb2/igt@i915_pm_rc6_residency@rc6-idle.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5248/shard-iclb6/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rpm@modeset-pc8-residency-stress:
    - shard-tglb:         [SKIP][74] ([i915#579]) -> [SKIP][75] ([fdo#109506] / [i915#2411])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9441/shard-tglb6/igt@i915_pm_rpm@modeset-pc8-residency-stress.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5248/shard-tglb8/igt@i915_pm_rpm@modeset-pc8-residency-stress.html
    - shard-iclb:         [SKIP][76] ([i915#579]) -> [SKIP][77] ([fdo#109293] / [fdo#109506])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9441/shard-iclb1/igt@i915_pm_rpm@modeset-pc8-residency-stress.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5248/shard-iclb8/igt@i915_pm_rpm@modeset-pc8-residency-stress.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][78], [FAIL][79]) ([i915#2295] / [i915#2722] / [i915#483] / [i915#92]) -> ([FAIL][80], [FAIL][81]) ([i915#2295] / [i915#2722] / [i915#483])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9441/shard-kbl6/igt@runner@aborted.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9441/shard-kbl2/igt@runner@aborted.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5248/shard-kbl7/igt@runner@aborted.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5248/shard-kbl2/igt@runner@aborted.html
    - shard-tglb:         [FAIL][82] ([i915#2295] / [i915#2722]) -> ([FAIL][83], [FAIL][84]) ([i915#1814] / [i915#2295] / [i915#2722])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9441/shard-tglb7/igt@runner@aborted.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5248/shard-tglb5/igt@runner@aborted.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5248/shard-tglb5/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109293]: https://bugs.freedesktop.org/show_bug.cgi?id=109293
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111719]: https://bugs.freedesktop.org/show_bug.cgi?id=111719
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1185]: https://gitlab.freedesktop.org/drm/intel/issues/1185
  [i915#1292]: https://gitlab.freedesktop.org/drm/intel/issues/1292
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1804]: https://gitlab.freedesktop.org/drm/intel/issues/1804
  [i915#1814]: https://gitlab.freedesktop.org/drm/intel/issues/1814
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2295]: https://gitlab.freedesktop.org/drm/intel/issues/2295
  [i915#2369]: https://gitlab.freedesktop.org/drm/intel/issues/2369
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2574]: https://gitlab.freedesktop.org/drm/intel/issues/2574
  [i915#2635]: https://gitlab.freedesktop.org/drm/intel/issues/2635
  [i915#2637]: https://gitlab.freedesktop.org/drm/intel/issues/2637
  [i915#2684]: https://gitlab.freedesktop.org/drm/intel/issues/2684
  [i915#2722]: https://gitlab.freedesktop.org/drm/intel/issues/2722
  [i915#293]: https://gitlab.freedesktop.org/drm/intel/issues/293
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#483]: https://gitlab.freedesktop.org/drm/intel/issues/483
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5880 -> IGTPW_5248
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_9441: 6e992bb7585d1bee238776d8fe0512a70a22a1a0 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5248: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5248/index.html
  IGT_5880: d67bad61dc9a7515f94a7eecadd3bcd6b4f9d49e @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5248/index.html

--===============3742540615853647983==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


<!DOCTYPE html>
<html xmlns=3D"http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8"/>
  <title>Project List - Patchwork</title>
  <style id=3D"css-table-select" type=3D"text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>i915/gem_ctx_exec: Exercise execution along =
context while closing it (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/84530/">https://patchwork.freedesktop.org/series/84530/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5248/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5248/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9441_full -&gt; IGTPW_5248_full</h=
1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5248/index.=
html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5248=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@gem_ctx_exec@basic-close-race} (NEW):</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5248/shard-tglb1/igt@gem_ctx_exec@basic-close-race.html"=
>TIMEOUT</a></p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5248/shard-glk7/igt@gem_ctx_exec@basic-close-race.html">=
TIMEOUT</a></p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5248/shard-apl4/igt@gem_ctx_exec@basic-close-race.html">=
FAIL</a></p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5248/shard-kbl7/igt@gem_ctx_exec@basic-close-race.html">=
TIMEOUT</a></p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5248/shard-iclb1/igt@gem_ctx_exec@basic-close-race.html"=
>TIMEOUT</a></p>
</li>
<li>
<p>shard-hsw:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5248/shard-hsw1/igt@gem_ctx_exec@basic-close-race.html">=
TIMEOUT</a></p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5248/shard-snb4/igt@gem_ctx_exec@basic-close-race.html">=
FAIL</a></p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_9441_full and IGTPW_5248_f=
ull:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@gem_ctx_exec@basic-close-race:<ul>
<li>Statuses : 2 fail(s) 5 timeout(s)</li>
<li>Exec time: [5.43, 121.42] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5248_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9441/shard-kbl3/igt@gem_exec_suspend@basic-s3.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5248/shard-kbl2/i=
gt@gem_exec_suspend@basic-s3.html">INCOMPLETE</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/155">i915#155</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/2369">i915#2369</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@fences:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9441/shard-kbl6/igt@i915_pm_rpm@fences.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5248/shard-kbl3/igt@i915=
_pm_rpm@fences.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9441/shard-iclb7/igt@i915_pm_rpm@fences.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5248/shard-iclb5/igt@i91=
5_pm_rpm@fences.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/579">i915#579</a>)</p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9441/shard-hsw7/igt@i915_pm_rpm@fences.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5248/shard-hsw1/igt@i915=
_pm_rpm@fences.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9441/shard-glk8/igt@i915_pm_rpm@fences.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5248/shard-glk2/igt@i915=
_pm_rpm@fences.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9441/shard-apl4/igt@i915_pm_rpm@fences.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5248/shard-apl7/igt@i915=
_pm_rpm@fences.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-untiled:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9441/shard-iclb7/igt@i915_suspend@fence-restore-untiled.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5248/sha=
rd-iclb5/igt@i915_suspend@fence-restore-untiled.html">INCOMPLETE</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/1185">i915#1185</a>)<=
/p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9441/shard-glk5/igt@i915_suspend@fence-restore-untiled.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5248/shar=
d-glk2/igt@i915_suspend@fence-restore-untiled.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2635">i915#2635</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9441/shard-apl4/igt@i915_suspend@fence-restore-untiled.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5248/shar=
d-apl7/igt@i915_suspend@fence-restore-untiled.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2635">i915#2635</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9441/shard-kbl2/igt@i915_suspend@fence-restore-untiled.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5248/shar=
d-kbl3/igt@i915_suspend@fence-restore-untiled.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a>)</p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9441/shard-hsw2/igt@i915_suspend@fence-restore-untiled.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5248/shar=
d-hsw1/igt@i915_suspend@fence-restore-untiled.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2637">i915#2637</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9441/shard-tglb1/igt@kms_async_flips@test-time-stamp.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5248/shard=
-tglb5/igt@kms_async_flips@test-time-stamp.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/2574">i915#2574</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9441/shard-apl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-ind=
fb-onoff.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_5248/shard-apl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-c=
ur-indfb-onoff.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/49">i915#49</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9441/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-ind=
fb-onoff.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_5248/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-c=
ur-indfb-onoff.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/49">i915#49</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9441/shard-glk7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-ind=
fb-onoff.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_5248/shard-glk3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-c=
ur-indfb-onoff.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/49">i915#49</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend-pipe-d-planes:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9441/shard-tglb7/igt@kms_plane@plane-panning-bottom-right-suspend-p=
ipe-d-planes.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_5248/shard-tglb5/igt@kms_plane@plane-panning-bottom-right-=
suspend-pipe-d-planes.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/1436">i915#1436</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/456">i915#456</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_move:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9441/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5248/shard-=
iclb5/igt@kms_psr@psr2_cursor_plane_move.html">SKIP</a> (<a href=3D"https:/=
/bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) +2 similar =
issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_gttfill@engines@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9441/shard-glk7/igt@gem_exec_gttfill@engines@rcs0.html">DMESG-WARN<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/118">i915#1=
18</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/95">i91=
5#95</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
248/shard-glk6/igt@gem_exec_gttfill@engines@rcs0.html">PASS</a> +2 similar =
issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@sysfs-read:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9441/shard-iclb3/igt@i915_pm_rpm@sysfs-read.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5248/shard-iclb=
3/igt@i915_pm_rpm@sysfs-read.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9441/shard-tglb2/igt@i915_pm_rpm@sysfs-read.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5248/shard-tglb=
7/igt@i915_pm_rpm@sysfs-read.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-a-ctm-max:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9441/shard-kbl3/igt@kms_color@pipe-a-ctm-max.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1292">i915#1292</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5248/shard-kb=
l1/igt@kms_color@pipe-a-ctm-max.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9441/shard-apl6/igt@kms_color@pipe-a-ctm-max.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1292">i915#1292</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5248/shard-ap=
l8/igt@kms_color@pipe-a-ctm-max.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9441/shard-glk1/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/72">i915#72</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_5248/shard-glk9/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.=
html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9441/shard-iclb1/igt@kms_psr2_su@frontbuffer.html">SKIP</a> (<a hre=
f=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109642">fdo#109642</a> =
/ <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111068">fdo#111=
068</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_52=
48/shard-iclb2/igt@kms_psr2_su@frontbuffer.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_gtt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9441/shard-iclb3/igt@kms_psr@psr2_sprite_mmap_gtt.html">SKIP</a> (<=
a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5248/=
shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html">PASS</a> +1 similar issu=
e</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-runtime-pm:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9441/shard-glk1/igt@perf_pmu@rc6-runtime-pm.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5248/shard-=
glk7/igt@perf_pmu@rc6-runtime-pm.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9441/shard-apl2/igt@perf_pmu@rc6-runtime-pm.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5248/shard-=
apl4/igt@perf_pmu@rc6-runtime-pm.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9441/shard-kbl6/igt@perf_pmu@rc6-runtime-pm.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5248/shard-=
kbl7/igt@perf_pmu@rc6-runtime-pm.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9441/shard-tglb6/igt@perf_pmu@rc6-runtime-pm.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111719">fdo#111719</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5248/shard-=
tglb1/igt@perf_pmu@rc6-runtime-pm.html">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9441/shard-hsw6/igt@perf_pmu@rc6-runtime-pm.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5248/shard-=
hsw1/igt@perf_pmu@rc6-runtime-pm.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9441/shard-iclb1/igt@perf_pmu@rc6-runtime-pm.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/293">i915#293</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5248/shard-iclb=
1/igt@perf_pmu@rc6-runtime-pm.html">PASS</a></p>
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9441/shard-iclb7/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1804">i915#180=
4</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i9=
15#2684</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5248/shard-iclb2/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#2684</a>)=
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9441/shard-iclb2/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#2684=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5248/=
shard-iclb6/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/1804">i915#1804</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#2684</a>)</=
li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-pc8-residency-stress:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9441/shard-tglb6/igt@i915_pm_rpm@modeset-pc8-residency-stress.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/579">i=
915#579</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5248/shard-tglb8/igt@i915_pm_rpm@modeset-pc8-residency-stress.html">SKIP<=
/a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109506">fdo#=
109506</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/241=
1">i915#2411</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9441/shard-iclb1/igt@i915_pm_rpm@modeset-pc8-residency-stress.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/579">i=
915#579</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5248/shard-iclb8/igt@i915_pm_rpm@modeset-pc8-residency-stress.html">SKIP<=
/a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109293">fdo#=
109293</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1095=
06">fdo#109506</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-kbl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9441/shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9441/shard-kbl2/igt@runner@abort=
ed.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/2722">i915#2722</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/483">i915#483</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/92">i915#92</a>) -&gt; (<a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_5248/shard-kbl7/igt@runner@aborted.html">FAIL</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5248/shard-kbl=
2/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/2722">i915#2722</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/483">i915#483</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9441/shard-tglb7/igt@runner@aborted.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/2722">i915#2722</a>) -&gt;=
 (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5248/shard-tglb=
5/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5248/shard-tglb5/igt@runner@aborted.html">FAIL</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2=
295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2722">=
i915#2722</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (10 -&gt; 8)</h2>
<p>Missing    (2): pig-skl-6260u pig-glk-j5005 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5880 -&gt; IGTPW_5248</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9441: 6e992bb7585d1bee238776d8fe0512a70a22a1a0 @ git://anongit.fre=
edesktop.org/gfx-ci/linux<br />
  IGTPW_5248: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5248/index.htm=
l<br />
  IGT_5880: d67bad61dc9a7515f94a7eecadd3bcd6b4f9d49e @ git://anongit.freede=
sktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============3742540615853647983==--

--===============1650312172==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1650312172==--
