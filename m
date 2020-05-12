Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 12 May 2020 04:40:12 -0000
Message-ID: <158925841222.18141.749781274204567072@emeril.freedesktop.org>
References: <20200511182534.14395-1-imre.deak@intel.com>
In-Reply-To: <20200511182534.14395-1-imre.deak@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fflip=3A_Retry_test_in_case_of_a_DP/HDMI_link_reset_=28rev?=
 =?utf-8?q?2=29?=
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

Series: tests/kms_flip: Retry test in case of a DP/HDMI link reset (rev2)
URL   : https://patchwork.freedesktop.org/series/77167/
State : success

== Summary ==

CI Bug Log - changes from IGT_5647_full -> IGTPW_4558_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4558/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4558_full:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1}:
    - shard-tglb:         [FAIL][1] ([i915#488]) -> [FAIL][2] +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5647/shard-tglb7/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4558/shard-tglb2/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html

  
Known issues
------------

  Here are the changes found in IGTPW_4558_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_color@pipe-a-ctm-blue-to-red:
    - shard-kbl:          [PASS][3] -> [FAIL][4] ([i915#129] / [i915#93] / [i915#95])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5647/shard-kbl4/igt@kms_color@pipe-a-ctm-blue-to-red.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4558/shard-kbl4/igt@kms_color@pipe-a-ctm-blue-to-red.html
    - shard-apl:          [PASS][5] -> [FAIL][6] ([i915#129] / [i915#95])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5647/shard-apl2/igt@kms_color@pipe-a-ctm-blue-to-red.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4558/shard-apl6/igt@kms_color@pipe-a-ctm-blue-to-red.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen:
    - shard-kbl:          [PASS][7] -> [FAIL][8] ([i915#54] / [i915#93] / [i915#95]) +2 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5647/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4558/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-apl:          [PASS][9] -> [DMESG-WARN][10] ([i915#180]) +2 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5647/shard-apl2/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4558/shard-apl1/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-c-cursor-64x64-onscreen:
    - shard-glk:          [PASS][11] -> [FAIL][12] ([i915#54])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5647/shard-glk4/igt@kms_cursor_crc@pipe-c-cursor-64x64-onscreen.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4558/shard-glk1/igt@kms_cursor_crc@pipe-c-cursor-64x64-onscreen.html
    - shard-apl:          [PASS][13] -> [FAIL][14] ([i915#54])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5647/shard-apl8/igt@kms_cursor_crc@pipe-c-cursor-64x64-onscreen.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4558/shard-apl7/igt@kms_cursor_crc@pipe-c-cursor-64x64-onscreen.html
    - shard-kbl:          [PASS][15] -> [FAIL][16] ([i915#54])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5647/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-64x64-onscreen.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4558/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-64x64-onscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [PASS][17] -> [DMESG-WARN][18] ([i915#180]) +2 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5647/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4558/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [PASS][19] -> [SKIP][20] ([fdo#109349])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5647/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4558/shard-iclb4/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_flip_tiling@flip-changes-tiling-yf:
    - shard-kbl:          [PASS][21] -> [FAIL][22] ([i915#699] / [i915#93] / [i915#95])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5647/shard-kbl6/igt@kms_flip_tiling@flip-changes-tiling-yf.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4558/shard-kbl4/igt@kms_flip_tiling@flip-changes-tiling-yf.html
    - shard-apl:          [PASS][23] -> [FAIL][24] ([i915#95]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5647/shard-apl3/igt@kms_flip_tiling@flip-changes-tiling-yf.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4558/shard-apl6/igt@kms_flip_tiling@flip-changes-tiling-yf.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen:
    - shard-apl:          [PASS][25] -> [FAIL][26] ([i915#49])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5647/shard-apl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4558/shard-apl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html
    - shard-kbl:          [PASS][27] -> [FAIL][28] ([i915#49])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5647/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4558/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-rte:
    - shard-glk:          [PASS][29] -> [FAIL][30] ([i915#49])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5647/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-rte.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4558/shard-glk5/igt@kms_frontbuffer_tracking@fbc-2p-rte.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][31] -> [SKIP][32] ([fdo#109441])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5647/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4558/shard-iclb8/igt@kms_psr@psr2_sprite_plane_move.html

  
#### Possible fixes ####

  * {igt@gem_exec_fence@submit3@rcs0}:
    - shard-apl:          [FAIL][33] -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5647/shard-apl4/igt@gem_exec_fence@submit3@rcs0.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4558/shard-apl1/igt@gem_exec_fence@submit3@rcs0.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-apl:          [DMESG-WARN][35] ([i915#180]) -> [PASS][36] +2 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5647/shard-apl4/igt@i915_suspend@fence-restore-tiled2untiled.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4558/shard-apl8/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [INCOMPLETE][37] ([i915#155]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5647/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4558/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled:
    - shard-kbl:          [FAIL][39] ([fdo#108145] / [i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5647/shard-kbl6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4558/shard-kbl7/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
    - shard-apl:          [FAIL][41] ([fdo#108145] / [i915#52] / [i915#54] / [i915#95]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5647/shard-apl7/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4558/shard-apl2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html

  * {igt@kms_flip@flip-vs-suspend@a-dp1}:
    - shard-kbl:          [DMESG-WARN][43] ([i915#180]) -> [PASS][44] +4 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5647/shard-kbl1/igt@kms_flip@flip-vs-suspend@a-dp1.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4558/shard-kbl1/igt@kms_flip@flip-vs-suspend@a-dp1.html

  * igt@kms_flip_tiling@flip-changes-tiling:
    - shard-apl:          [FAIL][45] ([i915#95]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5647/shard-apl3/igt@kms_flip_tiling@flip-changes-tiling.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4558/shard-apl6/igt@kms_flip_tiling@flip-changes-tiling.html

  * igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
    - shard-kbl:          [FAIL][47] ([i915#49]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5647/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4558/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
    - shard-apl:          [FAIL][49] ([i915#49]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5647/shard-apl6/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4558/shard-apl6/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [SKIP][51] ([i915#433]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5647/shard-tglb7/igt@kms_hdmi_inject@inject-audio.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4558/shard-tglb1/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-7efc:
    - shard-apl:          [FAIL][53] ([fdo#108145] / [i915#265] / [i915#95]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5647/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4558/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-64:
    - shard-kbl:          [FAIL][55] ([i915#1559] / [i915#93] / [i915#95]) -> [PASS][56] +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5647/shard-kbl7/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4558/shard-kbl6/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
    - shard-apl:          [FAIL][57] ([i915#1559] / [i915#95]) -> [PASS][58] +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5647/shard-apl8/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4558/shard-apl8/igt@kms_plane_cursor@pipe-a-viewport-size-64.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [SKIP][59] ([fdo#109441]) -> [PASS][60] +3 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5647/shard-iclb6/igt@kms_psr@psr2_primary_page_flip.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4558/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html

  * igt@kms_universal_plane@universal-plane-pipe-a-functional:
    - shard-kbl:          [FAIL][61] ([i915#331]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5647/shard-kbl4/igt@kms_universal_plane@universal-plane-pipe-a-functional.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4558/shard-kbl4/igt@kms_universal_plane@universal-plane-pipe-a-functional.html
    - shard-apl:          [FAIL][63] ([i915#331]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5647/shard-apl8/igt@kms_universal_plane@universal-plane-pipe-a-functional.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4558/shard-apl4/igt@kms_universal_plane@universal-plane-pipe-a-functional.html

  
#### Warnings ####

  * igt@i915_pm_rpm@dpms-mode-unset-lpsp:
    - shard-snb:          [SKIP][65] ([fdo#109271]) -> [INCOMPLETE][66] ([i915#82])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5647/shard-snb6/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4558/shard-snb5/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          [FAIL][67] ([fdo#110321] / [fdo#110336] / [i915#95]) -> [FAIL][68] ([fdo#110321] / [fdo#110336])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5647/shard-apl7/igt@kms_content_protection@atomic-dpms.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4558/shard-apl2/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@srm:
    - shard-apl:          [TIMEOUT][69] ([i915#1319]) -> [FAIL][70] ([fdo#110321])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5647/shard-apl4/igt@kms_content_protection@srm.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4558/shard-apl1/igt@kms_content_protection@srm.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [DMESG-FAIL][71] ([i915#180] / [i915#95]) -> [FAIL][72] ([i915#1121] / [i915#95])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5647/shard-apl4/igt@kms_fbcon_fbt@fbc-suspend.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4558/shard-apl2/igt@kms_fbcon_fbt@fbc-suspend.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [i915#1121]: https://gitlab.freedesktop.org/drm/intel/issues/1121
  [i915#129]: https://gitlab.freedesktop.org/drm/intel/issues/129
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#331]: https://gitlab.freedesktop.org/drm/intel/issues/331
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#488]: https://gitlab.freedesktop.org/drm/intel/issues/488
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#699]: https://gitlab.freedesktop.org/drm/intel/issues/699
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5647 -> IGTPW_4558

  CI-20190529: 20190529
  CI_DRM_8467: 1a0f0c378117fc90f421a692698ad85963ecdb3a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4558: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4558/index.html
  IGT_5647: 726e09870f0b502b60bb1ecd209fc8af209ed378 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4558/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
