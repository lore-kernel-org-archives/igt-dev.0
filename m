Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 08 Apr 2020 20:34:34 -0000
Message-ID: <158637807412.19346.2880128918762737839@emeril.freedesktop.org>
References: <20200408102408.1959598-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200408102408.1959598-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3Iga21zX2Zs?=
 =?utf-8?q?ip=3A_Reduce_hang_tests_to_minimum_duration?=
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

Series: kms_flip: Reduce hang tests to minimum duration
URL   : https://patchwork.freedesktop.org/series/75665/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8274_full -> IGTPW_4430_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4430/index.html

Known issues
------------

  Here are the changes found in IGTPW_4430_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [PASS][1] -> [DMESG-WARN][2] ([i915#180]) +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8274/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4430/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-apl:          [PASS][3] -> [DMESG-WARN][4] ([i915#180]) +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8274/shard-apl4/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4430/shard-apl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_draw_crc@draw-method-rgb565-render-untiled:
    - shard-glk:          [PASS][5] -> [FAIL][6] ([i915#52] / [i915#54]) +2 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8274/shard-glk6/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4430/shard-glk4/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-render-untiled:
    - shard-kbl:          [PASS][7] -> [FAIL][8] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8274/shard-kbl4/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4430/shard-kbl3/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html
    - shard-apl:          [PASS][9] -> [FAIL][10] ([i915#52] / [i915#54] / [i915#95])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8274/shard-apl2/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4430/shard-apl7/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html

  * igt@kms_draw_crc@fill-fb:
    - shard-apl:          [PASS][11] -> [FAIL][12] ([i915#95])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8274/shard-apl3/igt@kms_draw_crc@fill-fb.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4430/shard-apl3/igt@kms_draw_crc@fill-fb.html

  * igt@kms_psr@primary_page_flip:
    - shard-tglb:         [PASS][13] -> [SKIP][14] ([i915#668]) +8 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8274/shard-tglb8/igt@kms_psr@primary_page_flip.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4430/shard-tglb6/igt@kms_psr@primary_page_flip.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [PASS][15] -> [SKIP][16] ([fdo#109441]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8274/shard-iclb2/igt@kms_psr@psr2_cursor_render.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4430/shard-iclb3/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend:
    - shard-kbl:          [PASS][17] -> [INCOMPLETE][18] ([i915#155])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8274/shard-kbl7/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4430/shard-kbl2/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html

  
#### Possible fixes ####

  * igt@gem_exec_params@invalid-bsd-ring:
    - shard-iclb:         [SKIP][19] ([fdo#109276]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8274/shard-iclb7/igt@gem_exec_params@invalid-bsd-ring.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4430/shard-iclb1/igt@gem_exec_params@invalid-bsd-ring.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [DMESG-WARN][21] ([i915#716]) -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8274/shard-glk8/igt@gen9_exec_parse@allowed-all.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4430/shard-glk4/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_rpm@drm-resources-equal:
    - shard-hsw:          [SKIP][23] ([fdo#109271]) -> [PASS][24] +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8274/shard-hsw7/igt@i915_pm_rpm@drm-resources-equal.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4430/shard-hsw6/igt@i915_pm_rpm@drm-resources-equal.html

  * igt@i915_pm_rpm@system-suspend-devices:
    - shard-iclb:         [SKIP][25] ([i915#1316] / [i915#579]) -> [PASS][26] +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8274/shard-iclb5/igt@i915_pm_rpm@system-suspend-devices.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4430/shard-iclb7/igt@i915_pm_rpm@system-suspend-devices.html
    - shard-tglb:         [SKIP][27] ([i915#1316] / [i915#579]) -> [PASS][28] +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8274/shard-tglb1/igt@i915_pm_rpm@system-suspend-devices.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4430/shard-tglb2/igt@i915_pm_rpm@system-suspend-devices.html
    - shard-glk:          [SKIP][29] ([fdo#109271]) -> [PASS][30] +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8274/shard-glk1/igt@i915_pm_rpm@system-suspend-devices.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4430/shard-glk2/igt@i915_pm_rpm@system-suspend-devices.html

  * igt@i915_selftest@live@requests:
    - shard-tglb:         [INCOMPLETE][31] ([i915#1531] / [i915#1658]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8274/shard-tglb1/igt@i915_selftest@live@requests.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4430/shard-tglb7/igt@i915_selftest@live@requests.html

  * igt@kms_color@pipe-c-legacy-gamma:
    - shard-kbl:          [FAIL][33] ([i915#71]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8274/shard-kbl1/igt@kms_color@pipe-c-legacy-gamma.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4430/shard-kbl1/igt@kms_color@pipe-c-legacy-gamma.html
    - shard-apl:          [FAIL][35] ([i915#71]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8274/shard-apl2/igt@kms_color@pipe-c-legacy-gamma.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4430/shard-apl3/igt@kms_color@pipe-c-legacy-gamma.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding:
    - shard-apl:          [FAIL][37] ([i915#54]) -> [PASS][38] +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8274/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4430/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen:
    - shard-glk:          [FAIL][39] ([i915#54]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8274/shard-glk9/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4430/shard-glk7/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html
    - shard-kbl:          [FAIL][41] ([i915#54]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8274/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4430/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-random:
    - shard-kbl:          [FAIL][43] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][44] +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8274/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4430/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-apl:          [DMESG-WARN][45] ([i915#180] / [i915#95]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8274/shard-apl1/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4430/shard-apl2/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-xtiled:
    - shard-glk:          [FAIL][47] ([i915#52] / [i915#54]) -> [PASS][48] +2 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8274/shard-glk6/igt@kms_draw_crc@draw-method-rgb565-pwrite-xtiled.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4430/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-pwrite-xtiled.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-pwrite:
    - shard-tglb:         [SKIP][49] ([i915#668]) -> [PASS][50] +4 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8274/shard-tglb6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-pwrite.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4430/shard-tglb1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [DMESG-WARN][51] ([i915#180]) -> [PASS][52] +4 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8274/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4430/shard-kbl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-apl:          [DMESG-WARN][53] ([i915#180]) -> [PASS][54] +3 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8274/shard-apl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4430/shard-apl8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_psr@psr2_dpms:
    - shard-iclb:         [SKIP][55] ([fdo#109441]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8274/shard-iclb6/igt@kms_psr@psr2_dpms.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4430/shard-iclb2/igt@kms_psr@psr2_dpms.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [SKIP][57] ([i915#468]) -> [FAIL][58] ([i915#454])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8274/shard-tglb2/igt@i915_pm_dc@dc6-psr.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4430/shard-tglb3/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][59] ([i915#180] / [i915#93] / [i915#95]) -> [DMESG-WARN][60] ([i915#180])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8274/shard-kbl7/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4430/shard-kbl1/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [FAIL][61] ([i915#95]) -> [FAIL][62] ([i915#1525])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8274/shard-apl1/igt@kms_fbcon_fbt@fbc-suspend.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4430/shard-apl3/igt@kms_fbcon_fbt@fbc-suspend.html
    - shard-kbl:          [DMESG-FAIL][63] ([i915#180] / [i915#95]) -> [FAIL][64] ([i915#64])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8274/shard-kbl7/igt@kms_fbcon_fbt@fbc-suspend.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4430/shard-kbl2/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-kbl:          [INCOMPLETE][65] ([i915#155] / [i915#648]) -> [DMESG-WARN][66] ([i915#180])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8274/shard-kbl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4430/shard-kbl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
    - shard-apl:          [FAIL][67] ([fdo#108145] / [i915#265]) -> [FAIL][68] ([fdo#108145] / [i915#265] / [i915#95])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8274/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4430/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-256:
    - shard-apl:          [FAIL][69] ([i915#1559]) -> [FAIL][70] ([i915#1559] / [i915#95])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8274/shard-apl7/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4430/shard-apl3/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
    - shard-kbl:          [FAIL][71] ([i915#1559]) -> [FAIL][72] ([i915#1559] / [i915#93] / [i915#95])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8274/shard-kbl3/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4430/shard-kbl4/igt@kms_plane_cursor@pipe-a-viewport-size-256.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [SKIP][73] ([fdo#109642] / [fdo#111068]) -> [FAIL][74] ([i915#608])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8274/shard-iclb7/igt@kms_psr2_su@page_flip.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4430/shard-iclb2/igt@kms_psr2_su@page_flip.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1525]: https://gitlab.freedesktop.org/drm/intel/issues/1525
  [i915#1531]: https://gitlab.freedesktop.org/drm/intel/issues/1531
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#1658]: https://gitlab.freedesktop.org/drm/intel/issues/1658
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#608]: https://gitlab.freedesktop.org/drm/intel/issues/608
  [i915#64]: https://gitlab.freedesktop.org/drm/intel/issues/64
  [i915#648]: https://gitlab.freedesktop.org/drm/intel/issues/648
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#71]: https://gitlab.freedesktop.org/drm/intel/issues/71
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5580 -> IGTPW_4430
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8274: 860acd37e552def563b63ac3f77ad002b58fada0 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4430: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4430/index.html
  IGT_5580: fb488389a7a263b649361ec9c29e8b3b69851122 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4430/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
