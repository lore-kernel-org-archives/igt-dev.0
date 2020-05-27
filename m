Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 27 May 2020 13:41:22 -0000
Message-ID: <159058688235.342.14851979363005813778@emeril.freedesktop.org>
References: <20200527110507.16902-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20200527110507.16902-1-ankit.k.nautiyal@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fcontent=5Fprotection=3A_Enhancements?=
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
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_content_protection: Enhancements
URL   : https://patchwork.freedesktop.org/series/77694/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8542_full -> IGTPW_4616_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4616/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4616_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_content_protection@hdcp-1_4} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4616/shard-tglb7/igt@kms_content_protection@hdcp-1_4.html

  * {igt@kms_content_protection@hdcp-2_2} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][2] +1 similar issue
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4616/shard-iclb6/igt@kms_content_protection@hdcp-2_2.html
    - shard-tglb:         NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4616/shard-tglb7/igt@kms_content_protection@hdcp-2_2.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8542_full and IGTPW_4616_full:

### New IGT tests (2) ###

  * igt@kms_content_protection@hdcp-1_4:
    - Statuses : 7 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_content_protection@hdcp-2_2:
    - Statuses : 1 fail(s) 6 skip(s)
    - Exec time: [0.0, 0.01] s

  

Known issues
------------

  Here are the changes found in IGTPW_4616_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][4] -> [FAIL][5] ([i915#454])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8542/shard-iclb5/igt@i915_pm_dc@dc6-psr.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4616/shard-iclb6/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen:
    - shard-kbl:          [PASS][6] -> [FAIL][7] ([i915#54] / [i915#93] / [i915#95]) +1 similar issue
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8542/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4616/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [PASS][8] -> [DMESG-WARN][9] ([i915#180]) +4 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8542/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4616/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:
    - shard-hsw:          [PASS][10] -> [FAIL][11] ([i915#57])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8542/shard-hsw4/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4616/shard-hsw6/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-7efc:
    - shard-apl:          [PASS][12] -> [FAIL][13] ([fdo#108145] / [i915#265] / [i915#95])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8542/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4616/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-256:
    - shard-apl:          [PASS][14] -> [FAIL][15] ([i915#1559] / [i915#95])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8542/shard-apl8/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4616/shard-apl8/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
    - shard-kbl:          [PASS][16] -> [FAIL][17] ([i915#1559] / [i915#93] / [i915#95])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8542/shard-kbl7/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4616/shard-kbl2/igt@kms_plane_cursor@pipe-a-viewport-size-256.html

  * igt@kms_psr@psr2_sprite_mmap_cpu:
    - shard-iclb:         [PASS][18] -> [SKIP][19] ([fdo#109441])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8542/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_cpu.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4616/shard-iclb3/igt@kms_psr@psr2_sprite_mmap_cpu.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][20] -> [FAIL][21] ([i915#31])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8542/shard-apl1/igt@kms_setmode@basic.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4616/shard-apl2/igt@kms_setmode@basic.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s3:
    - shard-kbl:          [INCOMPLETE][22] ([i915#155]) -> [PASS][23]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8542/shard-kbl4/igt@gem_exec_suspend@basic-s3.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4616/shard-kbl3/igt@gem_exec_suspend@basic-s3.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-apl:          [DMESG-WARN][24] ([i915#1436] / [i915#716]) -> [PASS][25]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8542/shard-apl6/igt@gen9_exec_parse@allowed-all.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4616/shard-apl3/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-kbl:          [INCOMPLETE][26] ([i915#151] / [i915#155]) -> [PASS][27]
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8542/shard-kbl2/igt@i915_pm_rpm@system-suspend-execbuf.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4616/shard-kbl6/igt@i915_pm_rpm@system-suspend-execbuf.html

  * {igt@i915_selftest@perf@request}:
    - shard-tglb:         [INCOMPLETE][28] ([i915#1823]) -> [PASS][29]
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8542/shard-tglb5/igt@i915_selftest@perf@request.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4616/shard-tglb8/igt@i915_selftest@perf@request.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-glk:          [FAIL][30] ([i915#1119] / [i915#118] / [i915#95]) -> [PASS][31]
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8542/shard-glk8/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4616/shard-glk6/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen:
    - shard-kbl:          [FAIL][32] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][33]
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8542/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4616/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-glk:          [DMESG-WARN][34] ([i915#1926]) -> [PASS][35]
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8542/shard-glk9/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4616/shard-glk1/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled:
    - shard-apl:          [FAIL][36] ([i915#52] / [i915#54] / [i915#95]) -> [PASS][37]
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8542/shard-apl3/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4616/shard-apl6/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html
    - shard-kbl:          [FAIL][38] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95]) -> [PASS][39]
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8542/shard-kbl4/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4616/shard-kbl4/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html

  * {igt@kms_flip@flip-vs-suspend-interruptible@a-dp1}:
    - shard-kbl:          [DMESG-WARN][40] ([i915#180]) -> [PASS][41] +7 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8542/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4616/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-tglb:         [FAIL][42] ([i915#83]) -> [PASS][43]
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8542/shard-tglb8/igt@kms_panel_fitting@atomic-fastset.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4616/shard-tglb5/igt@kms_panel_fitting@atomic-fastset.html
    - shard-iclb:         [FAIL][44] ([i915#83]) -> [PASS][45]
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8542/shard-iclb7/igt@kms_panel_fitting@atomic-fastset.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4616/shard-iclb1/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [FAIL][46] ([i915#53] / [i915#93] / [i915#95]) -> [PASS][47]
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8542/shard-kbl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4616/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
    - shard-apl:          [FAIL][48] ([i915#53] / [i915#95]) -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8542/shard-apl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4616/shard-apl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-apl:          [DMESG-WARN][50] ([i915#180]) -> [PASS][51] +2 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8542/shard-apl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4616/shard-apl8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-256:
    - shard-kbl:          [FAIL][52] ([i915#1559] / [i915#93] / [i915#95]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8542/shard-kbl2/igt@kms_plane_cursor@pipe-a-overlay-size-256.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4616/shard-kbl2/igt@kms_plane_cursor@pipe-a-overlay-size-256.html
    - shard-apl:          [FAIL][54] ([i915#1559] / [i915#95]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8542/shard-apl3/igt@kms_plane_cursor@pipe-a-overlay-size-256.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4616/shard-apl7/igt@kms_plane_cursor@pipe-a-overlay-size-256.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [SKIP][56] ([fdo#109441]) -> [PASS][57] +1 similar issue
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8542/shard-iclb1/igt@kms_psr@psr2_cursor_render.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4616/shard-iclb2/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [FAIL][58] ([i915#31]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8542/shard-kbl2/igt@kms_setmode@basic.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4616/shard-kbl6/igt@kms_setmode@basic.html

  
#### Warnings ####

  * igt@i915_pm_backlight@fade:
    - shard-glk:          [TIMEOUT][60] -> [SKIP][61] ([fdo#109271]) +1 similar issue
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8542/shard-glk2/igt@i915_pm_backlight@fade.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4616/shard-glk5/igt@i915_pm_backlight@fade.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [FAIL][62] ([i915#454]) -> [SKIP][63] ([i915#468])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8542/shard-tglb3/igt@i915_pm_dc@dc6-dpms.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4616/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [FAIL][64] ([i915#1525]) -> [DMESG-WARN][65] ([i915#180])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8542/shard-apl7/igt@kms_fbcon_fbt@fbc-suspend.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4616/shard-apl4/igt@kms_fbcon_fbt@fbc-suspend.html
    - shard-kbl:          [FAIL][66] ([i915#64]) -> [DMESG-WARN][67] ([i915#180])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8542/shard-kbl6/igt@kms_fbcon_fbt@fbc-suspend.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4616/shard-kbl4/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-basic:
    - shard-glk:          [TIMEOUT][68] -> [FAIL][69] ([fdo#108145] / [i915#265])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8542/shard-glk2/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4616/shard-glk1/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html
    - shard-kbl:          [FAIL][70] ([fdo#108145] / [i915#265]) -> [FAIL][71] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8542/shard-kbl4/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4616/shard-kbl1/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [FAIL][72] ([i915#608]) -> [SKIP][73] ([fdo#109642] / [fdo#111068])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8542/shard-iclb2/igt@kms_psr2_su@page_flip.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4616/shard-iclb6/igt@kms_psr2_su@page_flip.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#151]: https://gitlab.freedesktop.org/drm/intel/issues/151
  [i915#1525]: https://gitlab.freedesktop.org/drm/intel/issues/1525
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1823]: https://gitlab.freedesktop.org/drm/intel/issues/1823
  [i915#1926]: https://gitlab.freedesktop.org/drm/intel/issues/1926
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#53]: https://gitlab.freedesktop.org/drm/intel/issues/53
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#57]: https://gitlab.freedesktop.org/drm/intel/issues/57
  [i915#608]: https://gitlab.freedesktop.org/drm/intel/issues/608
  [i915#64]: https://gitlab.freedesktop.org/drm/intel/issues/64
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#83]: https://gitlab.freedesktop.org/drm/intel/issues/83
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5680 -> IGTPW_4616
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8542: 547d23ff9379bfa0f65c53721f63e688c5356b68 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4616: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4616/index.html
  IGT_5680: f7e3772175c53f0c910f4513831791cb5bdcab04 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4616/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
