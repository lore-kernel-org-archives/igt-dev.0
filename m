Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 11 Feb 2020 09:30:27 -0000
Message-ID: <158141342755.23971.6608320607023588306@emeril.freedesktop.org>
References: <20200207191524.19362-1-imre.deak@intel.com>
In-Reply-To: <20200207191524.19362-1-imre.deak@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/8=5D_lib/igt=5Fdraw=3A_Refactor_get?=
 =?utf-8?q?=5Ftiling_calls?=
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
To: Imre Deak <imre.deak@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,1/8] lib/igt_draw: Refactor get_tiling calls
URL   : https://patchwork.freedesktop.org/series/73172/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7887_full -> IGTPW_4114_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4114_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4114_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4114/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4114_full:

### IGT changes ###

#### Possible regressions ####

  * igt@runner@aborted:
    - shard-hsw:          NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4114/shard-hsw5/igt@runner@aborted.html

  
Known issues
------------

  Here are the changes found in IGTPW_4114_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_schedule@out-order-bsd2:
    - shard-iclb:         [PASS][2] -> [SKIP][3] ([fdo#109276]) +8 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7887/shard-iclb1/igt@gem_exec_schedule@out-order-bsd2.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4114/shard-iclb6/igt@gem_exec_schedule@out-order-bsd2.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [PASS][4] -> [SKIP][5] ([i915#677]) +1 similar issue
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7887/shard-iclb3/igt@gem_exec_schedule@pi-common-bsd.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4114/shard-iclb4/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_schedule@reorder-wide-bsd:
    - shard-iclb:         [PASS][6] -> [SKIP][7] ([fdo#112146]) +6 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7887/shard-iclb3/igt@gem_exec_schedule@reorder-wide-bsd.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4114/shard-iclb2/igt@gem_exec_schedule@reorder-wide-bsd.html

  * igt@gem_partial_pwrite_pread@reads-uncached:
    - shard-hsw:          [PASS][8] -> [FAIL][9] ([i915#694])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7887/shard-hsw2/igt@gem_partial_pwrite_pread@reads-uncached.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4114/shard-hsw1/igt@gem_partial_pwrite_pread@reads-uncached.html

  * igt@gem_ppgtt@blt-vs-render-ctx0:
    - shard-hsw:          [PASS][10] -> [INCOMPLETE][11] ([i915#61])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7887/shard-hsw8/igt@gem_ppgtt@blt-vs-render-ctx0.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4114/shard-hsw5/igt@gem_ppgtt@blt-vs-render-ctx0.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [PASS][12] -> [FAIL][13] ([i915#454])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7887/shard-iclb5/igt@i915_pm_dc@dc6-dpms.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4114/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_selftest@live_gtt:
    - shard-apl:          [PASS][14] -> [TIMEOUT][15] ([fdo#112271])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7887/shard-apl8/igt@i915_selftest@live_gtt.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4114/shard-apl4/igt@i915_selftest@live_gtt.html

  * igt@kms_cursor_crc@pipe-b-cursor-256x256-onscreen:
    - shard-apl:          [PASS][16] -> [FAIL][17] ([i915#54])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7887/shard-apl2/igt@kms_cursor_crc@pipe-b-cursor-256x256-onscreen.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4114/shard-apl2/igt@kms_cursor_crc@pipe-b-cursor-256x256-onscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-apl:          [PASS][18] -> [DMESG-WARN][19] ([i915#180])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7887/shard-apl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4114/shard-apl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_flip@plain-flip-ts-check-interruptible:
    - shard-glk:          [PASS][20] -> [FAIL][21] ([i915#34])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7887/shard-glk1/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4114/shard-glk1/igt@kms_flip@plain-flip-ts-check-interruptible.html

  * igt@kms_frontbuffer_tracking@psr-suspend:
    - shard-iclb:         [PASS][22] -> [INCOMPLETE][23] ([i915#123])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7887/shard-iclb2/igt@kms_frontbuffer_tracking@psr-suspend.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4114/shard-iclb8/igt@kms_frontbuffer_tracking@psr-suspend.html

  * igt@kms_psr@psr2_cursor_plane_onoff:
    - shard-iclb:         [PASS][24] -> [SKIP][25] ([fdo#109441]) +2 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7887/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4114/shard-iclb8/igt@kms_psr@psr2_cursor_plane_onoff.html

  * igt@kms_setmode@basic:
    - shard-glk:          [PASS][26] -> [FAIL][27] ([i915#31])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7887/shard-glk2/igt@kms_setmode@basic.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4114/shard-glk7/igt@kms_setmode@basic.html

  * igt@perf_pmu@init-busy-vcs1:
    - shard-iclb:         [PASS][28] -> [SKIP][29] ([fdo#112080]) +9 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7887/shard-iclb2/igt@perf_pmu@init-busy-vcs1.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4114/shard-iclb5/igt@perf_pmu@init-busy-vcs1.html

  * igt@prime_mmap_coherency@ioctl-errors:
    - shard-hsw:          [PASS][30] -> [FAIL][31] ([i915#831])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7887/shard-hsw2/igt@prime_mmap_coherency@ioctl-errors.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4114/shard-hsw8/igt@prime_mmap_coherency@ioctl-errors.html

  
#### Possible fixes ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [SKIP][32] ([fdo#112080]) -> [PASS][33] +8 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7887/shard-iclb6/igt@gem_busy@busy-vcs1.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4114/shard-iclb1/igt@gem_busy@busy-vcs1.html

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-apl:          [DMESG-WARN][34] ([i915#180]) -> [PASS][35] +1 similar issue
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7887/shard-apl6/igt@gem_ctx_isolation@rcs0-s3.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4114/shard-apl8/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_exec_balancer@hang:
    - shard-iclb:         [TIMEOUT][36] ([fdo#112271]) -> [PASS][37]
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7887/shard-iclb4/igt@gem_exec_balancer@hang.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4114/shard-iclb2/igt@gem_exec_balancer@hang.html

  * igt@gem_exec_schedule@deep-bsd:
    - shard-iclb:         [SKIP][38] ([fdo#112146]) -> [PASS][39] +3 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7887/shard-iclb2/igt@gem_exec_schedule@deep-bsd.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4114/shard-iclb7/igt@gem_exec_schedule@deep-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd1:
    - shard-iclb:         [SKIP][40] ([fdo#109276]) -> [PASS][41] +13 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7887/shard-iclb6/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4114/shard-iclb2/igt@gem_exec_schedule@preempt-queue-bsd1.html

  * igt@gem_partial_pwrite_pread@reads:
    - shard-hsw:          [FAIL][42] ([i915#694]) -> [PASS][43]
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7887/shard-hsw2/igt@gem_partial_pwrite_pread@reads.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4114/shard-hsw8/igt@gem_partial_pwrite_pread@reads.html

  * igt@gem_userptr_blits@sync-unmap:
    - shard-snb:          [DMESG-WARN][44] ([fdo#111870] / [i915#478]) -> [PASS][45]
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7887/shard-snb5/igt@gem_userptr_blits@sync-unmap.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4114/shard-snb6/igt@gem_userptr_blits@sync-unmap.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][46] ([i915#454]) -> [PASS][47]
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7887/shard-iclb2/igt@i915_pm_dc@dc6-psr.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4114/shard-iclb7/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rps@waitboost:
    - shard-iclb:         [FAIL][48] ([i915#413]) -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7887/shard-iclb7/igt@i915_pm_rps@waitboost.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4114/shard-iclb3/igt@i915_pm_rps@waitboost.html

  * igt@i915_selftest@live_blt:
    - shard-hsw:          [DMESG-FAIL][50] ([i915#553] / [i915#725]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7887/shard-hsw8/igt@i915_selftest@live_blt.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4114/shard-hsw2/igt@i915_selftest@live_blt.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-xtiled:
    - shard-snb:          [DMESG-WARN][52] ([i915#478]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7887/shard-snb5/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-xtiled.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4114/shard-snb2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-xtiled.html

  * igt@kms_plane_lowres@pipe-a-tiling-y:
    - shard-glk:          [FAIL][54] ([i915#899]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7887/shard-glk4/igt@kms_plane_lowres@pipe-a-tiling-y.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4114/shard-glk7/igt@kms_plane_lowres@pipe-a-tiling-y.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [SKIP][56] ([fdo#109642] / [fdo#111068]) -> [PASS][57] +1 similar issue
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7887/shard-iclb5/igt@kms_psr2_su@frontbuffer.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4114/shard-iclb2/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [SKIP][58] ([fdo#109441]) -> [PASS][59] +1 similar issue
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7887/shard-iclb8/igt@kms_psr@psr2_primary_mmap_cpu.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4114/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend:
    - shard-iclb:         [INCOMPLETE][60] ([i915#140]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7887/shard-iclb7/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4114/shard-iclb8/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [SKIP][62] ([fdo#112080]) -> [FAIL][63] ([IGT#28])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7887/shard-iclb7/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4114/shard-iclb1/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@gem_tiled_blits@interruptible:
    - shard-hsw:          [FAIL][64] ([i915#818]) -> [FAIL][65] ([i915#694])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7887/shard-hsw5/igt@gem_tiled_blits@interruptible.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4114/shard-hsw1/igt@gem_tiled_blits@interruptible.html

  * igt@i915_pm_rpm@legacy-planes:
    - shard-snb:          [INCOMPLETE][66] ([i915#82]) -> [SKIP][67] ([fdo#109271])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7887/shard-snb4/igt@i915_pm_rpm@legacy-planes.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4114/shard-snb4/igt@i915_pm_rpm@legacy-planes.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [DMESG-WARN][68] ([fdo#107724]) -> [SKIP][69] ([fdo#109349])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7887/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4114/shard-iclb8/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@runner@aborted:
    - shard-iclb:         [FAIL][70] ([fdo#111093]) -> [FAIL][71] ([fdo#111093] / [i915#209])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7887/shard-iclb7/igt@runner@aborted.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4114/shard-iclb8/igt@runner@aborted.html

  
  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#107724]: https://bugs.freedesktop.org/show_bug.cgi?id=107724
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111093]: https://bugs.freedesktop.org/show_bug.cgi?id=111093
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#123]: https://gitlab.freedesktop.org/drm/intel/issues/123
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#209]: https://gitlab.freedesktop.org/drm/intel/issues/209
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#34]: https://gitlab.freedesktop.org/drm/intel/issues/34
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#553]: https://gitlab.freedesktop.org/drm/intel/issues/553
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#831]: https://gitlab.freedesktop.org/drm/intel/issues/831
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5425 -> IGTPW_4114
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7887: b147ed9753265260d6380604de01c3d646a323cd @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4114: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4114/index.html
  IGT_5425: ad4542ef1adbaa1227bc9ba9e24bb0e0f6dd408d @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4114/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
