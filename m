Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 27 Apr 2020 22:28:57 -0000
Message-ID: <158802653769.26354.1515493479655007366@emeril.freedesktop.org>
References: <20200427175302.20512-1-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20200427175302.20512-1-umesh.nerlige.ramappa@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?perf=3A_Fix_B0_counter_check_in_gen12-mi-rpc_=28rev2=29?=
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
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/perf: Fix B0 counter check in gen12-mi-rpc (rev2)
URL   : https://patchwork.freedesktop.org/series/76278/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8374_full -> IGTPW_4511_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4511/index.html

Known issues
------------

  Here are the changes found in IGTPW_4511_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_params@invalid-bsd-ring:
    - shard-iclb:         [PASS][1] -> [SKIP][2] ([fdo#109276])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8374/shard-iclb2/igt@gem_exec_params@invalid-bsd-ring.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4511/shard-iclb7/igt@gem_exec_params@invalid-bsd-ring.html

  * igt@i915_pm_rps@min-max-config-loaded:
    - shard-iclb:         [PASS][3] -> [FAIL][4] ([i915#370])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8374/shard-iclb1/igt@i915_pm_rps@min-max-config-loaded.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4511/shard-iclb1/igt@i915_pm_rps@min-max-config-loaded.html
    - shard-glk:          [PASS][5] -> [FAIL][6] ([i915#39])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8374/shard-glk8/igt@i915_pm_rps@min-max-config-loaded.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4511/shard-glk6/igt@i915_pm_rps@min-max-config-loaded.html

  * igt@i915_suspend@forcewake:
    - shard-snb:          [PASS][7] -> [DMESG-WARN][8] ([i915#42])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8374/shard-snb1/igt@i915_suspend@forcewake.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4511/shard-snb4/igt@i915_suspend@forcewake.html

  * igt@kms_big_fb@linear-32bpp-rotate-0:
    - shard-kbl:          [PASS][9] -> [FAIL][10] ([i915#1119] / [i915#93] / [i915#95])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8374/shard-kbl1/igt@kms_big_fb@linear-32bpp-rotate-0.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4511/shard-kbl3/igt@kms_big_fb@linear-32bpp-rotate-0.html
    - shard-apl:          [PASS][11] -> [FAIL][12] ([i915#1119] / [i915#95])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8374/shard-apl4/igt@kms_big_fb@linear-32bpp-rotate-0.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4511/shard-apl4/igt@kms_big_fb@linear-32bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen:
    - shard-apl:          [PASS][13] -> [FAIL][14] ([i915#54] / [i915#95])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8374/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4511/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html
    - shard-kbl:          [PASS][15] -> [FAIL][16] ([i915#54] / [i915#93] / [i915#95])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8374/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4511/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - shard-hsw:          [PASS][17] -> [FAIL][18] ([i915#57])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8374/shard-hsw7/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4511/shard-hsw6/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy:
    - shard-kbl:          [PASS][19] -> [FAIL][20] ([i915#1566] / [i915#93] / [i915#95])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8374/shard-kbl1/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4511/shard-kbl6/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html

  * igt@kms_draw_crc@draw-method-rgb565-blt-ytiled:
    - shard-glk:          [PASS][21] -> [FAIL][22] ([i915#52] / [i915#54]) +4 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8374/shard-glk8/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4511/shard-glk4/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [PASS][23] -> [DMESG-WARN][24] ([i915#180]) +2 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8374/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4511/shard-kbl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b:
    - shard-tglb:         [PASS][25] -> [INCOMPLETE][26] ([i915#1602] / [i915#456])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8374/shard-tglb2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4511/shard-tglb5/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-128:
    - shard-apl:          [PASS][27] -> [FAIL][28] ([i915#1559] / [i915#95])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8374/shard-apl6/igt@kms_plane_cursor@pipe-a-viewport-size-128.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4511/shard-apl4/igt@kms_plane_cursor@pipe-a-viewport-size-128.html
    - shard-kbl:          [PASS][29] -> [FAIL][30] ([i915#1559] / [i915#93] / [i915#95])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8374/shard-kbl2/igt@kms_plane_cursor@pipe-a-viewport-size-128.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4511/shard-kbl4/igt@kms_plane_cursor@pipe-a-viewport-size-128.html

  * igt@kms_plane_lowres@pipe-a-tiling-y:
    - shard-glk:          [PASS][31] -> [FAIL][32] ([i915#899])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8374/shard-glk4/igt@kms_plane_lowres@pipe-a-tiling-y.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4511/shard-glk2/igt@kms_plane_lowres@pipe-a-tiling-y.html

  * igt@kms_prime@basic-crc:
    - shard-apl:          [PASS][33] -> [FAIL][34] ([i915#1031] / [i915#95])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8374/shard-apl6/igt@kms_prime@basic-crc.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4511/shard-apl6/igt@kms_prime@basic-crc.html
    - shard-kbl:          [PASS][35] -> [FAIL][36] ([i915#1031] / [i915#93] / [i915#95])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8374/shard-kbl2/igt@kms_prime@basic-crc.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4511/shard-kbl7/igt@kms_prime@basic-crc.html

  * igt@kms_psr@psr2_primary_render:
    - shard-iclb:         [PASS][37] -> [SKIP][38] ([fdo#109441])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8374/shard-iclb2/igt@kms_psr@psr2_primary_render.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4511/shard-iclb3/igt@kms_psr@psr2_primary_render.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][39] -> [FAIL][40] ([i915#31])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8374/shard-apl4/igt@kms_setmode@basic.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4511/shard-apl7/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-c-ts-continuation-suspend:
    - shard-apl:          [PASS][41] -> [DMESG-WARN][42] ([i915#180]) +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8374/shard-apl8/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4511/shard-apl8/igt@kms_vblank@pipe-c-ts-continuation-suspend.html

  
#### Possible fixes ####

  * igt@gem_softpin@noreloc-s3:
    - shard-apl:          [DMESG-WARN][43] ([i915#180]) -> [PASS][44] +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8374/shard-apl3/igt@gem_softpin@noreloc-s3.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4511/shard-apl7/igt@gem_softpin@noreloc-s3.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][45] ([i915#454]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8374/shard-iclb2/igt@i915_pm_dc@dc6-psr.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4511/shard-iclb8/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_selftest@live@gt_pm:
    - shard-hsw:          [INCOMPLETE][47] ([i915#61]) -> [PASS][48] +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8374/shard-hsw1/igt@i915_selftest@live@gt_pm.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4511/shard-hsw4/igt@i915_selftest@live@gt_pm.html
    - shard-snb:          [DMESG-FAIL][49] -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8374/shard-snb5/igt@i915_selftest@live@gt_pm.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4511/shard-snb5/igt@i915_selftest@live@gt_pm.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-offscreen:
    - shard-kbl:          [FAIL][51] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][52] +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8374/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-256x256-offscreen.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4511/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-256x256-offscreen.html

  * igt@kms_draw_crc@draw-method-rgb565-render-ytiled:
    - shard-glk:          [FAIL][53] ([i915#52] / [i915#54]) -> [PASS][54] +2 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8374/shard-glk7/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4511/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-render-untiled:
    - shard-kbl:          [FAIL][55] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8374/shard-kbl6/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4511/shard-kbl7/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html
    - shard-apl:          [FAIL][57] ([i915#52] / [i915#54] / [i915#95]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8374/shard-apl2/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4511/shard-apl1/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html

  * {igt@kms_flip@flip-vs-suspend-interruptible@a-edp1}:
    - shard-iclb:         [INCOMPLETE][59] -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8374/shard-iclb3/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4511/shard-iclb6/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-kbl:          [DMESG-WARN][61] ([i915#180]) -> [PASS][62] +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8374/shard-kbl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4511/shard-kbl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [FAIL][63] ([i915#899]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8374/shard-glk6/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4511/shard-glk4/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [SKIP][65] ([fdo#109441]) -> [PASS][66] +1 similar issue
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8374/shard-iclb7/igt@kms_psr@psr2_primary_page_flip.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4511/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html

  * {igt@perf@blocking-parameterized}:
    - shard-hsw:          [FAIL][67] ([i915#1542]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8374/shard-hsw1/igt@perf@blocking-parameterized.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4511/shard-hsw4/igt@perf@blocking-parameterized.html

  * {igt@perf@gen12-oa-tlb-invalidate}:
    - shard-tglb:         [SKIP][69] ([i915#405]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8374/shard-tglb5/igt@perf@gen12-oa-tlb-invalidate.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4511/shard-tglb3/igt@perf@gen12-oa-tlb-invalidate.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [FAIL][71] ([i915#454]) -> [SKIP][72] ([i915#468])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8374/shard-tglb1/igt@i915_pm_dc@dc6-dpms.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4511/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [FAIL][73] ([i915#608]) -> [SKIP][74] ([fdo#109642] / [fdo#111068])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8374/shard-iclb2/igt@kms_psr2_su@page_flip.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4511/shard-iclb4/igt@kms_psr2_su@page_flip.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [i915#1031]: https://gitlab.freedesktop.org/drm/intel/issues/1031
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#1566]: https://gitlab.freedesktop.org/drm/intel/issues/1566
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#370]: https://gitlab.freedesktop.org/drm/intel/issues/370
  [i915#39]: https://gitlab.freedesktop.org/drm/intel/issues/39
  [i915#405]: https://gitlab.freedesktop.org/drm/intel/issues/405
  [i915#42]: https://gitlab.freedesktop.org/drm/intel/issues/42
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#57]: https://gitlab.freedesktop.org/drm/intel/issues/57
  [i915#608]: https://gitlab.freedesktop.org/drm/intel/issues/608
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5612 -> IGTPW_4511
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8374: 2473013ecc666fa73ec8dabb04f56ba71f840834 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4511: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4511/index.html
  IGT_5612: c8dc1fd926a550308b971ca7d83fe0a927a38152 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4511/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
