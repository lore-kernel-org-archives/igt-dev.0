Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 23 Apr 2020 19:01:02 -0000
Message-ID: <158766846268.26750.11285073372874844208@emeril.freedesktop.org>
References: <20200423165520.26115-1-arjun.melkaveri@intel.com>
In-Reply-To: <20200423165520.26115-1-arjun.melkaveri@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fsync=2Ec_=3AAdded_=5F=5Ffor=5Feach=5Fphysical=5Fengi?=
 =?utf-8?q?ne_to_utilize_all_available_=28rev9=29?=
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
To: Arjun Melkaveri <arjun.melkaveri@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/i915/gem_sync.c :Added __for_each_physical_engine to utilize all available (rev9)
URL   : https://patchwork.freedesktop.org/series/75536/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8353_full -> IGTPW_4503_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4503/index.html

Known issues
------------

  Here are the changes found in IGTPW_4503_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_sync@basic-store-each:
    - shard-snb:          [PASS][1] -> [INCOMPLETE][2] ([i915#82]) +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8353/shard-snb1/igt@gem_sync@basic-store-each.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4503/shard-snb5/igt@gem_sync@basic-store-each.html

  * igt@i915_pm_rpm@system-suspend:
    - shard-kbl:          [PASS][3] -> [INCOMPLETE][4] ([i915#151] / [i915#155])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8353/shard-kbl3/igt@i915_pm_rpm@system-suspend.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4503/shard-kbl6/igt@i915_pm_rpm@system-suspend.html

  * igt@kms_big_fb@linear-32bpp-rotate-0:
    - shard-kbl:          [PASS][5] -> [FAIL][6] ([i915#1119] / [i915#93] / [i915#95])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8353/shard-kbl4/igt@kms_big_fb@linear-32bpp-rotate-0.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4503/shard-kbl6/igt@kms_big_fb@linear-32bpp-rotate-0.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-apl:          [PASS][7] -> [FAIL][8] ([i915#1119] / [i915#95]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8353/shard-apl1/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4503/shard-apl1/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-random:
    - shard-kbl:          [PASS][9] -> [FAIL][10] ([i915#54] / [i915#93] / [i915#95]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8353/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4503/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html
    - shard-apl:          [PASS][11] -> [FAIL][12] ([i915#54] / [i915#95])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8353/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4503/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html

  * igt@kms_cursor_crc@pipe-c-cursor-256x85-sliding:
    - shard-apl:          [PASS][13] -> [FAIL][14] ([i915#54])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8353/shard-apl8/igt@kms_cursor_crc@pipe-c-cursor-256x85-sliding.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4503/shard-apl1/igt@kms_cursor_crc@pipe-c-cursor-256x85-sliding.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-glk:          [PASS][15] -> [FAIL][16] ([i915#72])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8353/shard-glk9/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4503/shard-glk5/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled:
    - shard-glk:          [PASS][17] -> [FAIL][18] ([i915#177] / [i915#52] / [i915#54])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8353/shard-glk1/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4503/shard-glk2/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled:
    - shard-glk:          [PASS][19] -> [FAIL][20] ([i915#52] / [i915#54]) +3 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8353/shard-glk7/igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4503/shard-glk7/igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled.html

  * igt@kms_flip_tiling@flip-changes-tiling-yf:
    - shard-kbl:          [PASS][21] -> [FAIL][22] ([i915#699] / [i915#93] / [i915#95])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8353/shard-kbl4/igt@kms_flip_tiling@flip-changes-tiling-yf.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4503/shard-kbl3/igt@kms_flip_tiling@flip-changes-tiling-yf.html
    - shard-apl:          [PASS][23] -> [FAIL][24] ([i915#95])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8353/shard-apl1/igt@kms_flip_tiling@flip-changes-tiling-yf.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4503/shard-apl3/igt@kms_flip_tiling@flip-changes-tiling-yf.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-apl:          [PASS][25] -> [DMESG-WARN][26] ([i915#180]) +2 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8353/shard-apl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4503/shard-apl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [PASS][27] -> [FAIL][28] ([i915#173])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8353/shard-iclb2/igt@kms_psr@no_drrs.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4503/shard-iclb1/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_sprite_blt:
    - shard-iclb:         [PASS][29] -> [SKIP][30] ([fdo#109441]) +2 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8353/shard-iclb2/igt@kms_psr@psr2_sprite_blt.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4503/shard-iclb7/igt@kms_psr@psr2_sprite_blt.html

  * igt@kms_vblank@pipe-c-ts-continuation-suspend:
    - shard-tglb:         [PASS][31] -> [INCOMPLETE][32] ([i915#1602] / [i915#456])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8353/shard-tglb5/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4503/shard-tglb6/igt@kms_vblank@pipe-c-ts-continuation-suspend.html

  
#### Possible fixes ####

  * igt@i915_suspend@forcewake:
    - shard-kbl:          [INCOMPLETE][33] ([i915#155]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8353/shard-kbl1/igt@i915_suspend@forcewake.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4503/shard-kbl2/igt@i915_suspend@forcewake.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen:
    - shard-apl:          [FAIL][35] ([i915#54] / [i915#95]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8353/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4503/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-offscreen:
    - shard-kbl:          [FAIL][37] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][38] +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8353/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-64x64-offscreen.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4503/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x64-offscreen.html

  * igt@kms_cursor_edge_walk@pipe-a-256x256-left-edge:
    - shard-glk:          [FAIL][39] ([i915#118] / [i915#70] / [i915#95]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8353/shard-glk9/igt@kms_cursor_edge_walk@pipe-a-256x256-left-edge.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4503/shard-glk1/igt@kms_cursor_edge_walk@pipe-a-256x256-left-edge.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-xtiled:
    - shard-glk:          [FAIL][41] ([i915#52] / [i915#54]) -> [PASS][42] +4 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8353/shard-glk8/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-xtiled.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4503/shard-glk5/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-xtiled.html

  * {igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp1}:
    - shard-apl:          [FAIL][43] ([i915#46]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8353/shard-apl4/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp1.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4503/shard-apl1/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp1.html

  * {igt@kms_flip@flip-vs-suspend-interruptible@c-dp1}:
    - shard-apl:          [DMESG-WARN][45] ([i915#180]) -> [PASS][46] +3 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8353/shard-apl1/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4503/shard-apl3/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
    - shard-apl:          [FAIL][47] ([i915#49] / [i915#95]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8353/shard-apl8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4503/shard-apl8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html
    - shard-kbl:          [FAIL][49] ([i915#49]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8353/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4503/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [SKIP][51] ([fdo#109441]) -> [PASS][52] +2 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8353/shard-iclb3/igt@kms_psr@psr2_primary_page_flip.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4503/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [DMESG-WARN][53] ([i915#180]) -> [PASS][54] +2 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8353/shard-kbl1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4503/shard-kbl7/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * {igt@perf@polling-parameterized}:
    - shard-hsw:          [FAIL][55] ([i915#1542]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8353/shard-hsw1/igt@perf@polling-parameterized.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4503/shard-hsw7/igt@perf@polling-parameterized.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][57] ([i915#658]) -> [SKIP][58] ([i915#588])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8353/shard-iclb3/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4503/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [SKIP][59] ([i915#468]) -> [FAIL][60] ([i915#454])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8353/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4503/shard-tglb7/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [FAIL][61] ([i915#454]) -> [SKIP][62] ([i915#468])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8353/shard-tglb5/igt@i915_pm_dc@dc6-psr.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4503/shard-tglb2/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@system-suspend:
    - shard-snb:          [INCOMPLETE][63] ([i915#82]) -> [SKIP][64] ([fdo#109271])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8353/shard-snb1/igt@i915_pm_rpm@system-suspend.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4503/shard-snb2/igt@i915_pm_rpm@system-suspend.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#151]: https://gitlab.freedesktop.org/drm/intel/issues/151
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#46]: https://gitlab.freedesktop.org/drm/intel/issues/46
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#699]: https://gitlab.freedesktop.org/drm/intel/issues/699
  [i915#70]: https://gitlab.freedesktop.org/drm/intel/issues/70
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5608 -> IGTPW_4503
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8353: ce2d0a17f95f9c6cdfed244b19da590d714d87ae @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4503: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4503/index.html
  IGT_5608: e7bcaf1dd251d454706c7cd64282f531aec50183 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4503/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
