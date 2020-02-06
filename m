Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 06 Feb 2020 12:53:52 -0000
Message-ID: <158099363233.15031.14033367400912800077@emeril.freedesktop.org>
References: <20200204072122.5968-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20200204072122.5968-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fset=5Ftiling=5Fvs=5Fpwrite=3A_disable_test_on_gens_w?=
 =?utf-8?q?ithout_ggtt?=
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
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/i915/gem_set_tiling_vs_pwrite: disable test on gens without ggtt
URL   : https://patchwork.freedesktop.org/series/72952/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7864_full -> IGTPW_4087_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4087/index.html

Known issues
------------

  Here are the changes found in IGTPW_4087_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [PASS][1] -> [SKIP][2] ([fdo#112080]) +13 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-iclb4/igt@gem_busy@busy-vcs1.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4087/shard-iclb5/igt@gem_busy@busy-vcs1.html

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-apl:          [PASS][3] -> [DMESG-WARN][4] ([i915#180]) +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-apl2/igt@gem_ctx_isolation@rcs0-s3.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4087/shard-apl6/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#110841])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-iclb8/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4087/shard-iclb4/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_schedule@in-order-bsd:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#112146]) +6 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-iclb3/igt@gem_exec_schedule@in-order-bsd.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4087/shard-iclb4/igt@gem_exec_schedule@in-order-bsd.html

  * igt@gem_exec_schedule@out-order-bsd2:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#109276]) +17 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-iclb1/igt@gem_exec_schedule@out-order-bsd2.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4087/shard-iclb8/igt@gem_exec_schedule@out-order-bsd2.html

  * igt@gem_render_copy_redux@normal:
    - shard-hsw:          [PASS][11] -> [FAIL][12] ([i915#694])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-hsw2/igt@gem_render_copy_redux@normal.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4087/shard-hsw2/igt@gem_render_copy_redux@normal.html

  * igt@gem_userptr_blits@sync-unmap-after-close:
    - shard-snb:          [PASS][13] -> [DMESG-WARN][14] ([fdo#111870] / [i915#478])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-snb6/igt@gem_userptr_blits@sync-unmap-after-close.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4087/shard-snb2/igt@gem_userptr_blits@sync-unmap-after-close.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-random:
    - shard-apl:          [PASS][15] -> [FAIL][16] ([i915#54])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4087/shard-apl1/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-ytiled:
    - shard-glk:          [PASS][17] -> [FAIL][18] ([i915#52] / [i915#54])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-glk4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-ytiled.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4087/shard-glk4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-ytiled.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-hsw:          [PASS][19] -> [INCOMPLETE][20] ([i915#61])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-hsw2/igt@kms_flip@2x-flip-vs-suspend.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4087/shard-hsw6/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-snb:          [PASS][21] -> [INCOMPLETE][22] ([i915#82])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-snb5/igt@kms_flip@flip-vs-suspend.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4087/shard-snb1/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [PASS][23] -> [DMESG-WARN][24] ([i915#180]) +6 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-kbl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4087/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [PASS][25] -> [SKIP][26] ([fdo#109642] / [fdo#111068])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-iclb2/igt@kms_psr2_su@page_flip.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4087/shard-iclb3/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [PASS][27] -> [SKIP][28] ([fdo#109441]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4087/shard-iclb7/igt@kms_psr@psr2_primary_page_flip.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@vcs1-dirty-create:
    - shard-iclb:         [SKIP][29] ([fdo#112080]) -> [PASS][30] +9 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-iclb5/igt@gem_ctx_isolation@vcs1-dirty-create.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4087/shard-iclb1/igt@gem_ctx_isolation@vcs1-dirty-create.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [SKIP][31] ([i915#677]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-iclb1/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4087/shard-iclb7/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [SKIP][33] ([fdo#112146]) -> [PASS][34] +7 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-iclb1/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4087/shard-iclb8/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_mmap_gtt@big-copy-odd:
    - shard-snb:          [DMESG-WARN][35] ([i915#478]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-snb6/igt@gem_mmap_gtt@big-copy-odd.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4087/shard-snb5/igt@gem_mmap_gtt@big-copy-odd.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-display:
    - shard-hsw:          [FAIL][37] ([i915#694]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-hsw7/igt@gem_partial_pwrite_pread@writes-after-reads-display.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4087/shard-hsw1/igt@gem_partial_pwrite_pread@writes-after-reads-display.html

  * igt@gem_softpin@noreloc-s3:
    - shard-apl:          [DMESG-WARN][39] ([i915#180]) -> [PASS][40] +2 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-apl6/igt@gem_softpin@noreloc-s3.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4087/shard-apl7/igt@gem_softpin@noreloc-s3.html

  * igt@i915_pm_rps@waitboost:
    - shard-tglb:         [FAIL][41] ([i915#413]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-tglb7/igt@i915_pm_rps@waitboost.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4087/shard-tglb5/igt@i915_pm_rps@waitboost.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-iclb:         [SKIP][43] ([i915#1140]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-iclb2/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4087/shard-iclb6/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][45] ([i915#180]) -> [PASS][46] +3 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4087/shard-kbl6/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-glk:          [FAIL][47] ([i915#79]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-glk1/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4087/shard-glk7/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [FAIL][49] ([i915#899]) -> [PASS][50] +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-glk9/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4087/shard-glk8/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [SKIP][51] ([fdo#109441]) -> [PASS][52] +2 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-iclb7/igt@kms_psr@psr2_no_drrs.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4087/shard-iclb2/igt@kms_psr@psr2_no_drrs.html

  * igt@prime_busy@after-bsd2:
    - shard-iclb:         [SKIP][53] ([fdo#109276]) -> [PASS][54] +16 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-iclb6/igt@prime_busy@after-bsd2.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4087/shard-iclb1/igt@prime_busy@after-bsd2.html

  * igt@prime_mmap_coherency@ioctl-errors:
    - shard-hsw:          [FAIL][55] ([i915#831]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-hsw5/igt@prime_mmap_coherency@ioctl-errors.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4087/shard-hsw2/igt@prime_mmap_coherency@ioctl-errors.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [SKIP][57] ([fdo#112080]) -> [FAIL][58] ([IGT#28])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-iclb6/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4087/shard-iclb2/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@gem_tiled_blits@normal:
    - shard-hsw:          [FAIL][59] ([i915#818]) -> [FAIL][60] ([i915#694]) +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-hsw7/igt@gem_tiled_blits@normal.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4087/shard-hsw2/igt@gem_tiled_blits@normal.html

  * igt@gem_userptr_blits@sync-unmap:
    - shard-snb:          [DMESG-WARN][61] ([fdo#111870] / [i915#478]) -> [DMESG-WARN][62] ([fdo#110789] / [fdo#111870] / [i915#478])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-snb5/igt@gem_userptr_blits@sync-unmap.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4087/shard-snb5/igt@gem_userptr_blits@sync-unmap.html

  * igt@i915_selftest@live_blt:
    - shard-hsw:          [DMESG-FAIL][63] ([i915#725]) -> [DMESG-FAIL][64] ([i915#770])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7864/shard-hsw7/igt@i915_selftest@live_blt.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4087/shard-hsw1/igt@i915_selftest@live_blt.html

  
  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1140]: https://gitlab.freedesktop.org/drm/intel/issues/1140
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#770]: https://gitlab.freedesktop.org/drm/intel/issues/770
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
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
  * IGT: IGT_5417 -> IGTPW_4087
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7864: 5a140e2fc771e4c8b10d14e2db7bfb4996ee9d8a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4087: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4087/index.html
  IGT_5417: 33cc93c8ba5daa0b7498f297a4f626844d895d06 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4087/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
