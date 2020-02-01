Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sat, 01 Feb 2020 00:44:54 -0000
Message-ID: <158051789484.32691.2466839719763993191@emeril.freedesktop.org>
References: <20200129131753.12460-1-petri.latvala@intel.com>
In-Reply-To: <20200129131753.12460-1-petri.latvala@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_runner=3A_Support_dynamic_subt?=
 =?utf-8?q?ests_in_testlists?=
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
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,1/2] runner: Support dynamic subtests in testlists
URL   : https://patchwork.freedesktop.org/series/72719/
State : success

== Summary ==

CI Bug Log - changes from IGT_5404_full -> IGTPW_4027_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4027/index.html

Known issues
------------

  Here are the changes found in IGTPW_4027_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_caching@reads:
    - shard-hsw:          [PASS][1] -> [FAIL][2] ([i915#694])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5404/shard-hsw6/igt@gem_caching@reads.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4027/shard-hsw8/igt@gem_caching@reads.html

  * igt@gem_ctx_persistence@vcs1-mixed:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#109276] / [fdo#112080])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5404/shard-iclb4/igt@gem_ctx_persistence@vcs1-mixed.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4027/shard-iclb7/igt@gem_ctx_persistence@vcs1-mixed.html

  * igt@gem_exec_schedule@pi-userfault-bsd:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([i915#677])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5404/shard-iclb6/igt@gem_exec_schedule@pi-userfault-bsd.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4027/shard-iclb2/igt@gem_exec_schedule@pi-userfault-bsd.html

  * igt@gem_exec_schedule@preempt-blt:
    - shard-tglb:         [PASS][7] -> [INCOMPLETE][8] ([i915#472])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5404/shard-tglb2/igt@gem_exec_schedule@preempt-blt.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4027/shard-tglb4/igt@gem_exec_schedule@preempt-blt.html

  * igt@gem_exec_schedule@preempt-queue-bsd1:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#109276]) +14 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5404/shard-iclb4/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4027/shard-iclb3/igt@gem_exec_schedule@preempt-queue-bsd1.html

  * igt@gem_exec_schedule@reorder-wide-bsd:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([fdo#112146]) +6 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5404/shard-iclb3/igt@gem_exec_schedule@reorder-wide-bsd.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4027/shard-iclb2/igt@gem_exec_schedule@reorder-wide-bsd.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-kbl:          [PASS][13] -> [DMESG-WARN][14] ([i915#180]) +2 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5404/shard-kbl6/igt@gem_workarounds@suspend-resume-fd.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4027/shard-kbl4/igt@gem_workarounds@suspend-resume-fd.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-apl:          [PASS][15] -> [DMESG-WARN][16] ([i915#180]) +3 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5404/shard-apl7/igt@kms_flip@flip-vs-suspend-interruptible.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4027/shard-apl4/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [PASS][17] -> [SKIP][18] ([fdo#109642] / [fdo#111068])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5404/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4027/shard-iclb5/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][19] -> [SKIP][20] ([fdo#109441])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5404/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4027/shard-iclb1/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [PASS][21] -> [FAIL][22] ([i915#31])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5404/shard-kbl7/igt@kms_setmode@basic.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4027/shard-kbl6/igt@kms_setmode@basic.html

  * igt@perf_pmu@busy-no-semaphores-vcs1:
    - shard-iclb:         [PASS][23] -> [SKIP][24] ([fdo#112080]) +13 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5404/shard-iclb1/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4027/shard-iclb5/igt@perf_pmu@busy-no-semaphores-vcs1.html

  * igt@prime_mmap_coherency@ioctl-errors:
    - shard-hsw:          [PASS][25] -> [FAIL][26] ([i915#831])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5404/shard-hsw2/igt@prime_mmap_coherency@ioctl-errors.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4027/shard-hsw2/igt@prime_mmap_coherency@ioctl-errors.html

  
#### Possible fixes ####

  * igt@gem_caching@writes:
    - shard-hsw:          [FAIL][27] ([i915#694]) -> [PASS][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5404/shard-hsw6/igt@gem_caching@writes.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4027/shard-hsw1/igt@gem_caching@writes.html

  * igt@gem_close_race@basic-threads:
    - shard-hsw:          [TIMEOUT][29] ([fdo#112271] / [i915#1084]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5404/shard-hsw5/igt@gem_close_race@basic-threads.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4027/shard-hsw8/igt@gem_close_race@basic-threads.html

  * igt@gem_ctx_shared@q-smoketest-bsd2:
    - shard-iclb:         [SKIP][31] ([fdo#109276]) -> [PASS][32] +12 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5404/shard-iclb8/igt@gem_ctx_shared@q-smoketest-bsd2.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4027/shard-iclb2/igt@gem_ctx_shared@q-smoketest-bsd2.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [SKIP][33] ([i915#677]) -> [PASS][34] +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5404/shard-iclb2/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4027/shard-iclb3/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [SKIP][35] ([fdo#112146]) -> [PASS][36] +3 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5404/shard-iclb1/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4027/shard-iclb5/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_persistent_relocs@forked-interruptible-thrash-inactive:
    - shard-hsw:          [FAIL][37] ([i915#520]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5404/shard-hsw6/igt@gem_persistent_relocs@forked-interruptible-thrash-inactive.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4027/shard-hsw5/igt@gem_persistent_relocs@forked-interruptible-thrash-inactive.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-kbl:          [FAIL][39] ([i915#644]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5404/shard-kbl6/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4027/shard-kbl4/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_softpin@noreloc-s3:
    - shard-apl:          [DMESG-WARN][41] ([i915#180]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5404/shard-apl1/igt@gem_softpin@noreloc-s3.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4027/shard-apl3/igt@gem_softpin@noreloc-s3.html

  * igt@i915_pm_rps@waitboost:
    - shard-iclb:         [FAIL][43] ([i915#413]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5404/shard-iclb3/igt@i915_pm_rps@waitboost.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4027/shard-iclb5/igt@i915_pm_rps@waitboost.html

  * igt@i915_selftest@live_gtt:
    - shard-apl:          [TIMEOUT][45] ([fdo#112271]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5404/shard-apl1/igt@i915_selftest@live_gtt.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4027/shard-apl8/igt@i915_selftest@live_gtt.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][47] ([i915#180]) -> [PASS][48] +5 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5404/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4027/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-iclb:         [TIMEOUT][49] -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5404/shard-iclb4/igt@kms_fbcon_fbt@psr-suspend.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4027/shard-iclb5/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible:
    - shard-kbl:          [FAIL][51] ([i915#34]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5404/shard-kbl6/igt@kms_flip@plain-flip-fb-recreate-interruptible.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4027/shard-kbl7/igt@kms_flip@plain-flip-fb-recreate-interruptible.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [SKIP][53] ([fdo#109441]) -> [PASS][54] +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5404/shard-iclb1/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4027/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@perf_pmu@init-busy-vcs1:
    - shard-iclb:         [SKIP][55] ([fdo#112080]) -> [PASS][56] +15 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5404/shard-iclb6/igt@perf_pmu@init-busy-vcs1.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4027/shard-iclb2/igt@perf_pmu@init-busy-vcs1.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv-switch:
    - shard-iclb:         [SKIP][57] ([fdo#112080]) -> [FAIL][58] ([IGT#28])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5404/shard-iclb6/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4027/shard-iclb2/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html

  * igt@gem_tiled_blits@normal:
    - shard-hsw:          [FAIL][59] ([i915#818]) -> [FAIL][60] ([i915#694])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5404/shard-hsw2/igt@gem_tiled_blits@normal.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4027/shard-hsw6/igt@gem_tiled_blits@normal.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
    - shard-snb:          [DMESG-WARN][61] ([fdo#111870] / [i915#478]) -> [DMESG-WARN][62] ([fdo#110789] / [fdo#111870] / [i915#478])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5404/shard-snb4/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4027/shard-snb6/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html

  
  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1084]: https://gitlab.freedesktop.org/drm/intel/issues/1084
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#34]: https://gitlab.freedesktop.org/drm/intel/issues/34
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#520]: https://gitlab.freedesktop.org/drm/intel/issues/520
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#831]: https://gitlab.freedesktop.org/drm/intel/issues/831


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5404 -> IGTPW_4027

  CI-20190529: 20190529
  CI_DRM_7837: 4a3438425d35afbf11f3d2c6092642d42c4cf941 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4027: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4027/index.html
  IGT_5404: 4147bab8e3dcaf11bd657b5fb4c109708e94e60c @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4027/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
