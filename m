Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sun, 02 Feb 2020 17:29:23 -0000
Message-ID: <158066456335.17035.3181585064174238557@emeril.freedesktop.org>
References: <20200130211748.629-1-antonio.argenziano@intel.com>
In-Reply-To: <20200130211748.629-1-antonio.argenziano@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fconcurrent=5Fall=3A_Skip_GTT_mapping_when_aperture_n?=
 =?utf-8?q?ot_available?=
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
To: Antonio Argenziano <antonio.argenziano@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/i915/gem_concurrent_all: Skip GTT mapping when aperture not available
URL   : https://patchwork.freedesktop.org/series/72794/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7847_full -> IGTPW_4048_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4048/index.html

Known issues
------------

  Here are the changes found in IGTPW_4048_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [PASS][1] -> [SKIP][2] ([fdo#110854])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7847/shard-iclb1/igt@gem_exec_balancer@smoke.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4048/shard-iclb6/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_schedule@pi-shared-iova-bsd:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([i915#677])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7847/shard-iclb3/igt@gem_exec_schedule@pi-shared-iova-bsd.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4048/shard-iclb4/igt@gem_exec_schedule@pi-shared-iova-bsd.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#112146]) +5 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7847/shard-iclb7/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4048/shard-iclb2/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled:
    - shard-snb:          [PASS][7] -> [DMESG-WARN][8] ([i915#478])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7847/shard-snb6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4048/shard-snb2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-apl:          [PASS][9] -> [DMESG-WARN][10] ([i915#180]) +2 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7847/shard-apl6/igt@kms_flip@flip-vs-suspend-interruptible.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4048/shard-apl6/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render:
    - shard-kbl:          [PASS][11] -> [FAIL][12] ([i915#49])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7847/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4048/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
    - shard-apl:          [PASS][13] -> [FAIL][14] ([i915#49])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7847/shard-apl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4048/shard-apl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [PASS][15] -> [DMESG-WARN][16] ([i915#180]) +2 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7847/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4048/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [PASS][17] -> [SKIP][18] ([fdo#109642] / [fdo#111068])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7847/shard-iclb2/igt@kms_psr2_su@page_flip.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4048/shard-iclb7/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [PASS][19] -> [SKIP][20] ([fdo#109441]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7847/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4048/shard-iclb1/igt@kms_psr@psr2_primary_page_flip.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-tglb:         [PASS][21] -> [INCOMPLETE][22] ([i915#472] / [i915#750])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7847/shard-tglb5/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4048/shard-tglb6/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@perf_pmu@busy-check-all-vcs1:
    - shard-iclb:         [PASS][23] -> [SKIP][24] ([fdo#112080]) +8 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7847/shard-iclb1/igt@perf_pmu@busy-check-all-vcs1.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4048/shard-iclb5/igt@perf_pmu@busy-check-all-vcs1.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [PASS][25] -> [SKIP][26] ([fdo#109276]) +21 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7847/shard-iclb2/igt@prime_vgem@fence-wait-bsd2.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4048/shard-iclb3/igt@prime_vgem@fence-wait-bsd2.html

  
#### Possible fixes ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [SKIP][27] ([fdo#112080]) -> [PASS][28] +12 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7847/shard-iclb8/igt@gem_busy@busy-vcs1.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4048/shard-iclb2/igt@gem_busy@busy-vcs1.html

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-kbl:          [DMESG-WARN][29] ([i915#180]) -> [PASS][30] +8 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7847/shard-kbl2/igt@gem_ctx_isolation@rcs0-s3.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4048/shard-kbl3/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [SKIP][31] ([fdo#110841]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7847/shard-iclb2/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4048/shard-iclb7/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_balancer@hang:
    - shard-tglb:         [TIMEOUT][33] ([fdo#112271]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7847/shard-tglb8/igt@gem_exec_balancer@hang.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4048/shard-tglb2/igt@gem_exec_balancer@hang.html

  * igt@gem_exec_schedule@preempt-contexts-bsd:
    - shard-iclb:         [SKIP][35] ([fdo#112146]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7847/shard-iclb4/igt@gem_exec_schedule@preempt-contexts-bsd.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4048/shard-iclb3/igt@gem_exec_schedule@preempt-contexts-bsd.html

  * igt@gem_exec_schedule@preempt-contexts-bsd2:
    - shard-iclb:         [SKIP][37] ([fdo#109276]) -> [PASS][38] +19 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7847/shard-iclb6/igt@gem_exec_schedule@preempt-contexts-bsd2.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4048/shard-iclb1/igt@gem_exec_schedule@preempt-contexts-bsd2.html

  * igt@gem_linear_blits@normal:
    - shard-hsw:          [FAIL][39] ([i915#893]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7847/shard-hsw2/igt@gem_linear_blits@normal.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4048/shard-hsw2/igt@gem_linear_blits@normal.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-snb:          [DMESG-WARN][41] ([fdo#111870] / [i915#478]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7847/shard-snb5/igt@gem_userptr_blits@dmabuf-sync.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4048/shard-snb2/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@i915_pm_rps@reset:
    - shard-iclb:         [FAIL][43] ([i915#413]) -> [PASS][44] +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7847/shard-iclb2/igt@i915_pm_rps@reset.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4048/shard-iclb7/igt@i915_pm_rps@reset.html

  * igt@i915_pm_rps@waitboost:
    - shard-tglb:         [FAIL][45] ([i915#413]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7847/shard-tglb2/igt@i915_pm_rps@waitboost.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4048/shard-tglb1/igt@i915_pm_rps@waitboost.html

  * igt@kms_color@pipe-c-ctm-green-to-red:
    - shard-kbl:          [FAIL][47] ([i915#129]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7847/shard-kbl1/igt@kms_color@pipe-c-ctm-green-to-red.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4048/shard-kbl3/igt@kms_color@pipe-c-ctm-green-to-red.html
    - shard-apl:          [FAIL][49] ([i915#129]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7847/shard-apl8/igt@kms_color@pipe-c-ctm-green-to-red.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4048/shard-apl6/igt@kms_color@pipe-c-ctm-green-to-red.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-hsw:          [INCOMPLETE][51] ([CI#80] / [i915#61]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7847/shard-hsw5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4048/shard-hsw1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-kbl:          [FAIL][53] ([i915#1036]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7847/shard-kbl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4048/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_psr@psr2_cursor_plane_onoff:
    - shard-iclb:         [SKIP][55] ([fdo#109441]) -> [PASS][56] +2 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7847/shard-iclb3/igt@kms_psr@psr2_cursor_plane_onoff.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4048/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-apl:          [DMESG-WARN][57] ([i915#180]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7847/shard-apl1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4048/shard-apl1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@prime_mmap_coherency@ioctl-errors:
    - shard-hsw:          [FAIL][59] ([i915#831]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7847/shard-hsw1/igt@prime_mmap_coherency@ioctl-errors.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4048/shard-hsw1/igt@prime_mmap_coherency@ioctl-errors.html

  
#### Warnings ####

  * igt@gem_eio@in-flight-immediate:
    - shard-apl:          [INCOMPLETE][61] ([CI#80] / [fdo#103927] / [i915#1098]) -> [TIMEOUT][62] ([fdo#112271])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7847/shard-apl3/igt@gem_eio@in-flight-immediate.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4048/shard-apl2/igt@gem_eio@in-flight-immediate.html

  * igt@gem_tiled_blits@interruptible:
    - shard-hsw:          [FAIL][63] ([i915#818]) -> [FAIL][64] ([i915#694])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7847/shard-hsw5/igt@gem_tiled_blits@interruptible.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4048/shard-hsw2/igt@gem_tiled_blits@interruptible.html

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-snb:          [DMESG-WARN][65] ([fdo#110789] / [fdo#111870] / [i915#478]) -> [DMESG-WARN][66] ([fdo#111870] / [i915#478])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7847/shard-snb1/igt@gem_userptr_blits@sync-unmap-cycles.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4048/shard-snb2/igt@gem_userptr_blits@sync-unmap-cycles.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [IGT#68]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/68
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1036]: https://gitlab.freedesktop.org/drm/intel/issues/1036
  [i915#1098]: https://gitlab.freedesktop.org/drm/intel/issues/1098
  [i915#129]: https://gitlab.freedesktop.org/drm/intel/issues/129
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#750]: https://gitlab.freedesktop.org/drm/intel/issues/750
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#831]: https://gitlab.freedesktop.org/drm/intel/issues/831
  [i915#893]: https://gitlab.freedesktop.org/drm/intel/issues/893


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5407 -> IGTPW_4048
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7847: 2515f8cc5d56f8791232dc6b077a370658d4cecf @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4048: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4048/index.html
  IGT_5407: a9d69f51dadbcbc53527671f87572d05c3370cba @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4048/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
