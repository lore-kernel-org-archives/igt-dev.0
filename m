Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 24 Apr 2020 04:39:27 -0000
Message-ID: <158770316714.10800.11253895491772209328@emeril.freedesktop.org>
References: <20200424012605.2279679-1-rodrigosiqueiramelo@gmail.com>
In-Reply-To: <20200424012605.2279679-1-rodrigosiqueiramelo@gmail.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgQWRkIHN1?=
 =?utf-8?q?pport_for_testing_writeback_connectors_=28rev2=29?=
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
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Add support for testing writeback connectors (rev2)
URL   : https://patchwork.freedesktop.org/series/68352/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8357_full -> IGTPW_4504_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4504_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4504_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4504/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4504_full:

### IGT changes ###

#### Possible regressions ####

  * igt@debugfs_test@read_all_entries_display_off:
    - shard-snb:          [PASS][1] -> [FAIL][2] +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-snb5/igt@debugfs_test@read_all_entries_display_off.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4504/shard-snb4/igt@debugfs_test@read_all_entries_display_off.html
    - shard-glk:          [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-glk2/igt@debugfs_test@read_all_entries_display_off.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4504/shard-glk4/igt@debugfs_test@read_all_entries_display_off.html

  * igt@debugfs_test@read_all_entries_display_on:
    - shard-hsw:          [PASS][5] -> [FAIL][6] +2 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-hsw7/igt@debugfs_test@read_all_entries_display_on.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4504/shard-hsw8/igt@debugfs_test@read_all_entries_display_on.html
    - shard-iclb:         [PASS][7] -> [FAIL][8] +2 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-iclb6/igt@debugfs_test@read_all_entries_display_on.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4504/shard-iclb3/igt@debugfs_test@read_all_entries_display_on.html
    - shard-kbl:          [PASS][9] -> [FAIL][10] +2 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-kbl6/igt@debugfs_test@read_all_entries_display_on.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4504/shard-kbl7/igt@debugfs_test@read_all_entries_display_on.html
    - shard-apl:          [PASS][11] -> [FAIL][12] +2 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-apl1/igt@debugfs_test@read_all_entries_display_on.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4504/shard-apl2/igt@debugfs_test@read_all_entries_display_on.html
    - shard-tglb:         [PASS][13] -> [FAIL][14] +2 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-tglb2/igt@debugfs_test@read_all_entries_display_on.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4504/shard-tglb2/igt@debugfs_test@read_all_entries_display_on.html

  * {igt@kms_writeback@writeback-check-output} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][15] +3 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4504/shard-iclb2/igt@kms_writeback@writeback-check-output.html

  * {igt@kms_writeback@writeback-invalid-parameters} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][16] +3 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4504/shard-tglb6/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@runner@aborted:
    - shard-tglb:         NOTRUN -> [FAIL][17]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4504/shard-tglb3/igt@runner@aborted.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][18] ([i915#588]) -> [INCOMPLETE][19]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4504/shard-iclb7/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_color_chamelium@pipe-b-ctm-0-75:
    - shard-tglb:         [SKIP][20] ([fdo#109284] / [fdo#111827]) -> [SKIP][21] +46 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-tglb5/igt@kms_color_chamelium@pipe-b-ctm-0-75.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4504/shard-tglb3/igt@kms_color_chamelium@pipe-b-ctm-0-75.html

  * igt@kms_color_chamelium@pipe-b-ctm-red-to-blue:
    - shard-iclb:         [SKIP][22] ([fdo#109284] / [fdo#111827]) -> [SKIP][23] +34 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-iclb2/igt@kms_color_chamelium@pipe-b-ctm-red-to-blue.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4504/shard-iclb7/igt@kms_color_chamelium@pipe-b-ctm-red-to-blue.html

  * igt@kms_crtc_background_color:
    - shard-iclb:         [SKIP][24] ([fdo#109305]) -> [SKIP][25]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-iclb8/igt@kms_crtc_background_color.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4504/shard-iclb8/igt@kms_crtc_background_color.html
    - shard-tglb:         [SKIP][26] ([i915#274]) -> [SKIP][27]
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-tglb5/igt@kms_crtc_background_color.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4504/shard-tglb7/igt@kms_crtc_background_color.html

  * igt@kms_invalid_dotclock:
    - shard-tglb:         [SKIP][28] ([fdo#110577]) -> [SKIP][29]
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-tglb8/igt@kms_invalid_dotclock.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4504/shard-tglb1/igt@kms_invalid_dotclock.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8357_full and IGTPW_4504_full:

### New IGT tests (4) ###

  * igt@kms_writeback@writeback-check-output:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_writeback@writeback-fb-id:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_writeback@writeback-invalid-parameters:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_writeback@writeback-pixel-formats:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_4504_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_eio@in-flight-suspend:
    - shard-tglb:         [PASS][30] -> [INCOMPLETE][31] ([i915#1602] / [i915#456])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-tglb2/igt@gem_eio@in-flight-suspend.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4504/shard-tglb3/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-apl:          [PASS][32] -> [DMESG-WARN][33] ([i915#180])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-apl4/igt@gem_exec_suspend@basic-s3.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4504/shard-apl4/igt@gem_exec_suspend@basic-s3.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - shard-kbl:          [PASS][34] -> [FAIL][35] ([i915#54] / [i915#93] / [i915#95]) +2 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4504/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
    - shard-apl:          [PASS][36] -> [FAIL][37] ([i915#54] / [i915#95])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4504/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [PASS][38] -> [DMESG-WARN][39] ([i915#180])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4504/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding:
    - shard-kbl:          [PASS][40] -> [DMESG-WARN][41] ([i915#78])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4504/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html

  * igt@kms_cursor_edge_walk@pipe-a-128x128-bottom-edge:
    - shard-kbl:          [PASS][42] -> [FAIL][43] ([i915#70] / [i915#93] / [i915#95])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-kbl2/igt@kms_cursor_edge_walk@pipe-a-128x128-bottom-edge.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4504/shard-kbl3/igt@kms_cursor_edge_walk@pipe-a-128x128-bottom-edge.html

  * igt@kms_draw_crc@draw-method-rgb565-blt-ytiled:
    - shard-glk:          [PASS][44] -> [FAIL][45] ([i915#52] / [i915#54]) +4 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-glk2/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4504/shard-glk5/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled:
    - shard-apl:          [PASS][46] -> [FAIL][47] ([i915#52] / [i915#54] / [i915#95])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-apl1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4504/shard-apl4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
    - shard-kbl:          [PASS][48] -> [FAIL][49] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-kbl2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4504/shard-kbl3/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-64:
    - shard-apl:          [PASS][50] -> [FAIL][51] ([i915#1559] / [i915#95])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-apl3/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4504/shard-apl8/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
    - shard-kbl:          [PASS][52] -> [FAIL][53] ([i915#1559] / [i915#93] / [i915#95])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-kbl4/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4504/shard-kbl6/igt@kms_plane_cursor@pipe-a-overlay-size-64.html

  * igt@kms_psr@psr2_basic:
    - shard-iclb:         [PASS][54] -> [SKIP][55] ([fdo#109441]) +1 similar issue
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-iclb2/igt@kms_psr@psr2_basic.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4504/shard-iclb8/igt@kms_psr@psr2_basic.html

  
#### Possible fixes ####

  * igt@i915_pm_rps@waitboost:
    - shard-glk:          [FAIL][56] ([i915#39]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-glk1/igt@i915_pm_rps@waitboost.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4504/shard-glk2/igt@i915_pm_rps@waitboost.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-apl:          [FAIL][58] ([i915#1119] / [i915#95]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-apl4/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4504/shard-apl2/igt@kms_big_fb@linear-32bpp-rotate-180.html
    - shard-kbl:          [FAIL][60] ([i915#1119] / [i915#93] / [i915#95]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-kbl2/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4504/shard-kbl7/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_color@pipe-a-ctm-max:
    - shard-kbl:          [FAIL][62] ([i915#168] / [i915#93] / [i915#95]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-kbl2/igt@kms_color@pipe-a-ctm-max.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4504/shard-kbl6/igt@kms_color@pipe-a-ctm-max.html
    - shard-apl:          [FAIL][64] ([i915#168] / [i915#95]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-apl4/igt@kms_color@pipe-a-ctm-max.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4504/shard-apl8/igt@kms_color@pipe-a-ctm-max.html
    - shard-glk:          [FAIL][66] ([i915#168]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-glk9/igt@kms_color@pipe-a-ctm-max.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4504/shard-glk4/igt@kms_color@pipe-a-ctm-max.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding:
    - shard-apl:          [FAIL][68] ([i915#54] / [i915#95]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4504/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-random:
    - shard-kbl:          [FAIL][70] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4504/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [FAIL][72] ([i915#72]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-glk7/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4504/shard-glk5/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_draw_crc@draw-method-rgb565-render-ytiled:
    - shard-glk:          [FAIL][74] ([i915#52] / [i915#54]) -> [PASS][75] +3 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-glk7/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4504/shard-glk8/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [FAIL][76] ([i915#53] / [i915#93] / [i915#95]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4504/shard-kbl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
    - shard-apl:          [FAIL][78] ([i915#53] / [i915#95]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-apl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4504/shard-apl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-apl:          [DMESG-WARN][80] ([i915#180]) -> [PASS][81] +3 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-apl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4504/shard-apl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant:
    - shard-apl:          [FAIL][82] ([fdo#108145] / [i915#265] / [i915#95]) -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4504/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-256:
    - shard-apl:          [FAIL][84] ([i915#1559] / [i915#95]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-apl8/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4504/shard-apl7/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
    - shard-kbl:          [FAIL][86] ([i915#1559] / [i915#93] / [i915#95]) -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-kbl3/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4504/shard-kbl2/igt@kms_plane_cursor@pipe-a-viewport-size-256.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [FAIL][88] ([i915#899]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-glk1/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4504/shard-glk7/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr@psr2_cursor_plane_onoff:
    - shard-iclb:         [SKIP][90] ([fdo#109441]) -> [PASS][91] +1 similar issue
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-iclb3/igt@kms_psr@psr2_cursor_plane_onoff.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4504/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [FAIL][92] ([i915#31]) -> [PASS][93]
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-kbl2/igt@kms_setmode@basic.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4504/shard-kbl2/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-b-ts-continuation-suspend:
    - shard-apl:          [DMESG-WARN][94] ([i915#180] / [i915#95]) -> [PASS][95]
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-apl1/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4504/shard-apl1/igt@kms_vblank@pipe-b-ts-continuation-suspend.html

  * igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend:
    - shard-kbl:          [INCOMPLETE][96] ([i915#155]) -> [PASS][97]
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-kbl3/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4504/shard-kbl2/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html

  * {igt@perf@blocking-parameterized}:
    - shard-iclb:         [FAIL][98] ([i915#1542]) -> [PASS][99]
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-iclb8/igt@perf@blocking-parameterized.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4504/shard-iclb4/igt@perf@blocking-parameterized.html

  * {igt@perf@polling-parameterized}:
    - shard-hsw:          [FAIL][100] ([i915#1542]) -> [PASS][101]
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-hsw1/igt@perf@polling-parameterized.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4504/shard-hsw7/igt@perf@polling-parameterized.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [FAIL][102] ([i915#454]) -> [SKIP][103] ([i915#468])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-tglb5/igt@i915_pm_dc@dc6-psr.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4504/shard-tglb2/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         [WARN][104] ([i915#1515]) -> [FAIL][105] ([i915#1515])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-iclb7/igt@i915_pm_rc6_residency@rc6-idle.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4504/shard-iclb7/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-snb:          [SKIP][106] ([fdo#109271]) -> [INCOMPLETE][107] ([i915#82])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-snb6/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4504/shard-snb1/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_color_chamelium@pipe-a-ctm-blue-to-red:
    - shard-snb:          [SKIP][108] ([fdo#109271] / [fdo#111827]) -> [SKIP][109] ([fdo#109271]) +44 similar issues
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-snb4/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4504/shard-snb4/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html
    - shard-kbl:          [SKIP][110] ([fdo#109271] / [fdo#111827]) -> [SKIP][111] ([fdo#109271]) +45 similar issues
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-kbl3/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4504/shard-kbl6/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html

  * igt@kms_color_chamelium@pipe-a-ctm-limited-range:
    - shard-apl:          [SKIP][112] ([fdo#109271] / [fdo#111827]) -> [SKIP][113] ([fdo#109271]) +46 similar issues
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-apl1/igt@kms_color_chamelium@pipe-a-ctm-limited-range.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4504/shard-apl7/igt@kms_color_chamelium@pipe-a-ctm-limited-range.html

  * igt@kms_color_chamelium@pipe-b-ctm-0-5:
    - shard-glk:          [SKIP][114] ([fdo#109271] / [fdo#111827]) -> [SKIP][115] ([fdo#109271]) +41 similar issues
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-glk4/igt@kms_color_chamelium@pipe-b-ctm-0-5.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4504/shard-glk9/igt@kms_color_chamelium@pipe-b-ctm-0-5.html

  * igt@kms_color_chamelium@pipe-d-ctm-0-75:
    - shard-hsw:          [SKIP][116] ([fdo#109271] / [fdo#111827]) -> [SKIP][117] ([fdo#109271]) +45 similar issues
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-hsw7/igt@kms_color_chamelium@pipe-d-ctm-0-75.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4504/shard-hsw6/igt@kms_color_chamelium@pipe-d-ctm-0-75.html

  * igt@kms_color_chamelium@pipe-d-ctm-negative:
    - shard-iclb:         [SKIP][118] ([fdo#109278] / [fdo#109284] / [fdo#111827]) -> [SKIP][119] ([fdo#109278]) +10 similar issues
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-iclb8/igt@kms_color_chamelium@pipe-d-ctm-negative.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4504/shard-iclb3/igt@kms_color_chamelium@pipe-d-ctm-negative.html

  * igt@kms_content_protection@uevent:
    - shard-kbl:          [FAIL][120] ([i915#357] / [i915#93] / [i915#95]) -> [FAIL][121] ([i915#357])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-kbl1/igt@kms_content_protection@uevent.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4504/shard-kbl6/igt@kms_content_protection@uevent.html
    - shard-apl:          [FAIL][122] ([i915#357] / [i915#95]) -> [FAIL][123] ([i915#357])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-apl8/igt@kms_content_protection@uevent.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4504/shard-apl4/igt@kms_content_protection@uevent.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-basic:
    - shard-kbl:          [FAIL][124] ([fdo#108145] / [i915#265]) -> [FAIL][125] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-kbl1/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4504/shard-kbl2/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html

  * igt@kms_plane_multiple@atomic-pipe-d-tiling-yf:
    - shard-iclb:         [SKIP][126] ([fdo#109278] / [fdo#112010] / [fdo#112025]) -> [SKIP][127] ([fdo#109278] / [fdo#112025])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-iclb4/igt@kms_plane_multiple@atomic-pipe-d-tiling-yf.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4504/shard-iclb6/igt@kms_plane_multiple@atomic-pipe-d-tiling-yf.html

  * igt@kms_universal_plane@disable-primary-vs-flip-pipe-d:
    - shard-iclb:         [SKIP][128] ([fdo#109278] / [fdo#112010]) -> [SKIP][129] ([fdo#109278]) +14 similar issues
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-iclb7/igt@kms_universal_plane@disable-primary-vs-flip-pipe-d.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4504/shard-iclb8/igt@kms_universal_plane@disable-primary-vs-flip-pipe-d.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109305]: https://bugs.freedesktop.org/show_bug.cgi?id=109305
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110577]: https://bugs.freedesktop.org/show_bug.cgi?id=110577
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112010]: https://bugs.freedesktop.org/show_bug.cgi?id=112010
  [fdo#112025]: https://bugs.freedesktop.org/show_bug.cgi?id=112025
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#1515]: https://gitlab.freedesktop.org/drm/intel/issues/1515
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#168]: https://gitlab.freedesktop.org/drm/intel/issues/168
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#274]: https://gitlab.freedesktop.org/drm/intel/issues/274
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#357]: https://gitlab.freedesktop.org/drm/intel/issues/357
  [i915#39]: https://gitlab.freedesktop.org/drm/intel/issues/39
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#53]: https://gitlab.freedesktop.org/drm/intel/issues/53
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#70]: https://gitlab.freedesktop.org/drm/intel/issues/70
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#78]: https://gitlab.freedesktop.org/drm/intel/issues/78
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5609 -> IGTPW_4504
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8357: 95fef3b4fb9f6c72d65af138cdffb68e0f062910 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4504: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4504/index.html
  IGT_5609: c100fe19f7b144538549415e8503093053883ec6 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4504/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
