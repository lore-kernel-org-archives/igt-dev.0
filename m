Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 06 May 2020 18:59:47 -0000
Message-ID: <158879158711.11896.18162153015240786807@emeril.freedesktop.org>
References: <20200506155803.358220-1-arkadiusz.hiler@intel.com>
In-Reply-To: <20200506155803.358220-1-arkadiusz.hiler@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_lib/igt=5Fchamelium=3A_Sleep_w?=
 =?utf-8?q?hen_doing_autodiscovery?=
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
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,1/2] lib/igt_chamelium: Sleep when doing autodiscovery
URL   : https://patchwork.freedesktop.org/series/77002/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8434_full -> IGTPW_4540_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4540/index.html

Known issues
------------

  Here are the changes found in IGTPW_4540_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_eio@suspend:
    - shard-iclb:         [PASS][1] -> [INCOMPLETE][2] ([i915#1185])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8434/shard-iclb3/igt@gem_eio@suspend.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4540/shard-iclb3/igt@gem_eio@suspend.html

  * igt@gem_softpin@noreloc-s3:
    - shard-apl:          [PASS][3] -> [DMESG-WARN][4] ([i915#180]) +5 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8434/shard-apl4/igt@gem_softpin@noreloc-s3.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4540/shard-apl6/igt@gem_softpin@noreloc-s3.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen:
    - shard-kbl:          [PASS][5] -> [FAIL][6] ([i915#54] / [i915#93] / [i915#95]) +3 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8434/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4540/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [PASS][7] -> [DMESG-WARN][8] ([i915#180])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8434/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4540/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_draw_crc@draw-method-xrgb8888-render-untiled:
    - shard-kbl:          [PASS][9] -> [FAIL][10] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8434/shard-kbl6/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4540/shard-kbl6/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html
    - shard-apl:          [PASS][11] -> [FAIL][12] ([i915#52] / [i915#54] / [i915#95])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8434/shard-apl8/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4540/shard-apl4/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html

  * igt@kms_flip_tiling@flip-changes-tiling-y:
    - shard-apl:          [PASS][13] -> [FAIL][14] ([i915#95])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8434/shard-apl6/igt@kms_flip_tiling@flip-changes-tiling-y.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4540/shard-apl4/igt@kms_flip_tiling@flip-changes-tiling-y.html
    - shard-kbl:          [PASS][15] -> [FAIL][16] ([i915#699] / [i915#93] / [i915#95])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8434/shard-kbl4/igt@kms_flip_tiling@flip-changes-tiling-y.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4540/shard-kbl6/igt@kms_flip_tiling@flip-changes-tiling-y.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-128:
    - shard-apl:          [PASS][17] -> [FAIL][18] ([i915#1559] / [i915#95])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8434/shard-apl8/igt@kms_plane_cursor@pipe-a-viewport-size-128.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4540/shard-apl7/igt@kms_plane_cursor@pipe-a-viewport-size-128.html
    - shard-kbl:          [PASS][19] -> [FAIL][20] ([i915#1559] / [i915#93] / [i915#95])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8434/shard-kbl6/igt@kms_plane_cursor@pipe-a-viewport-size-128.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4540/shard-kbl7/igt@kms_plane_cursor@pipe-a-viewport-size-128.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [PASS][21] -> [SKIP][22] ([fdo#109441]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8434/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4540/shard-iclb8/igt@kms_psr@psr2_primary_page_flip.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@engines-mixed-process@bcs0:
    - shard-glk:          [FAIL][23] ([i915#1528]) -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8434/shard-glk4/igt@gem_ctx_persistence@engines-mixed-process@bcs0.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4540/shard-glk8/igt@gem_ctx_persistence@engines-mixed-process@bcs0.html

  * {igt@gem_exec_fence@parallel@bcs0}:
    - shard-tglb:         [FAIL][25] -> [PASS][26] +4 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8434/shard-tglb5/igt@gem_exec_fence@parallel@bcs0.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4540/shard-tglb6/igt@gem_exec_fence@parallel@bcs0.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-kbl:          [DMESG-WARN][27] ([i915#180]) -> [PASS][28] +2 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8434/shard-kbl7/igt@gem_exec_suspend@basic-s3.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4540/shard-kbl6/igt@gem_exec_suspend@basic-s3.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-apl:          [FAIL][29] ([i915#1119] / [i915#95]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8434/shard-apl6/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4540/shard-apl4/igt@kms_big_fb@linear-32bpp-rotate-180.html
    - shard-kbl:          [FAIL][31] ([i915#1119] / [i915#93] / [i915#95]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8434/shard-kbl4/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4540/shard-kbl6/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_color@pipe-b-legacy-gamma:
    - shard-kbl:          [FAIL][33] ([i915#71]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8434/shard-kbl4/igt@kms_color@pipe-b-legacy-gamma.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4540/shard-kbl2/igt@kms_color@pipe-b-legacy-gamma.html
    - shard-glk:          [FAIL][35] ([i915#71]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8434/shard-glk1/igt@kms_color@pipe-b-legacy-gamma.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4540/shard-glk7/igt@kms_color@pipe-b-legacy-gamma.html
    - shard-apl:          [FAIL][37] ([i915#71]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8434/shard-apl4/igt@kms_color@pipe-b-legacy-gamma.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4540/shard-apl6/igt@kms_color@pipe-b-legacy-gamma.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - shard-kbl:          [FAIL][39] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][40] +4 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8434/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4540/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite:
    - shard-apl:          [FAIL][41] ([i915#49] / [i915#95]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8434/shard-apl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4540/shard-apl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html
    - shard-kbl:          [FAIL][43] ([i915#49]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8434/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4540/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-apl:          [DMESG-WARN][45] ([i915#180]) -> [PASS][46] +2 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8434/shard-apl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4540/shard-apl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-64:
    - shard-kbl:          [FAIL][47] ([i915#1559] / [i915#93] / [i915#95]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8434/shard-kbl2/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4540/shard-kbl6/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
    - shard-apl:          [FAIL][49] ([i915#1559] / [i915#95]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8434/shard-apl6/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4540/shard-apl4/igt@kms_plane_cursor@pipe-a-viewport-size-64.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][51] ([fdo#109441]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8434/shard-iclb1/igt@kms_psr@psr2_sprite_plane_move.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4540/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  * {igt@perf@blocking-parameterized}:
    - shard-iclb:         [FAIL][53] ([i915#1542]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8434/shard-iclb1/igt@perf@blocking-parameterized.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4540/shard-iclb5/igt@perf@blocking-parameterized.html
    - shard-hsw:          [FAIL][55] ([i915#1542]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8434/shard-hsw8/igt@perf@blocking-parameterized.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4540/shard-hsw7/igt@perf@blocking-parameterized.html

  
#### Warnings ####

  * igt@i915_pm_rpm@pm-tiling:
    - shard-snb:          [INCOMPLETE][57] ([i915#82]) -> [SKIP][58] ([fdo#109271])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8434/shard-snb6/igt@i915_pm_rpm@pm-tiling.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4540/shard-snb6/igt@i915_pm_rpm@pm-tiling.html

  * igt@kms_content_protection@legacy:
    - shard-apl:          [FAIL][59] ([fdo#110321] / [fdo#110336]) -> [TIMEOUT][60] ([i915#1319])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8434/shard-apl6/igt@kms_content_protection@legacy.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4540/shard-apl7/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic:
    - shard-apl:          [TIMEOUT][61] ([i915#1319]) -> [FAIL][62] ([fdo#110321]) +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8434/shard-apl3/igt@kms_content_protection@lic.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4540/shard-apl2/igt@kms_content_protection@lic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#1185]: https://gitlab.freedesktop.org/drm/intel/issues/1185
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1528]: https://gitlab.freedesktop.org/drm/intel/issues/1528
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#699]: https://gitlab.freedesktop.org/drm/intel/issues/699
  [i915#71]: https://gitlab.freedesktop.org/drm/intel/issues/71
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5635 -> IGTPW_4540
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8434: 2951bac393beb4f095468de8b7cc53c8e3a092c2 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4540: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4540/index.html
  IGT_5635: e83abfca61d407d12eee4d25bb0e8686337a7791 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4540/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
