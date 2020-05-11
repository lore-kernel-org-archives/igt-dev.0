Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 11 May 2020 13:29:38 -0000
Message-ID: <158920377875.13117.17358954261836452855@emeril.freedesktop.org>
References: <20200511082141.65494-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200511082141.65494-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fringfill=3A_Do_a_basic_pass_over_all_engines_simultaneousl?=
 =?utf-8?q?y_=28rev3=29?=
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

Series: i915/gem_ringfill: Do a basic pass over all engines simultaneously (rev3)
URL   : https://patchwork.freedesktop.org/series/77142/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8462_full -> IGTPW_4555_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4555_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4555_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4555/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4555_full:

### IGT changes ###

#### Possible regressions ####

  * igt@runner@aborted:
    - shard-tglb:         NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4555/shard-tglb2/igt@runner@aborted.html

  
Known issues
------------

  Here are the changes found in IGTPW_4555_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s3:
    - shard-tglb:         [PASS][2] -> [INCOMPLETE][3] ([i915#1602])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8462/shard-tglb8/igt@gem_exec_suspend@basic-s3.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4555/shard-tglb2/igt@gem_exec_suspend@basic-s3.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-kbl:          [PASS][4] -> [DMESG-WARN][5] ([i915#1436] / [i915#716] / [i915#93] / [i915#95])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8462/shard-kbl1/igt@gen9_exec_parse@allowed-all.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4555/shard-kbl7/igt@gen9_exec_parse@allowed-all.html

  * igt@kms_big_fb@linear-32bpp-rotate-0:
    - shard-apl:          [PASS][6] -> [FAIL][7] ([i915#1119] / [i915#95])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8462/shard-apl2/igt@kms_big_fb@linear-32bpp-rotate-0.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4555/shard-apl8/igt@kms_big_fb@linear-32bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-random:
    - shard-kbl:          [PASS][8] -> [FAIL][9] ([i915#54] / [i915#93] / [i915#95])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8462/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4555/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html

  * igt@kms_cursor_edge_walk@pipe-a-128x128-top-edge:
    - shard-kbl:          [PASS][10] -> [FAIL][11] ([i915#70] / [i915#93] / [i915#95])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8462/shard-kbl2/igt@kms_cursor_edge_walk@pipe-a-128x128-top-edge.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4555/shard-kbl4/igt@kms_cursor_edge_walk@pipe-a-128x128-top-edge.html
    - shard-apl:          [PASS][12] -> [FAIL][13] ([i915#70] / [i915#95])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8462/shard-apl8/igt@kms_cursor_edge_walk@pipe-a-128x128-top-edge.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4555/shard-apl4/igt@kms_cursor_edge_walk@pipe-a-128x128-top-edge.html

  * igt@kms_cursor_legacy@pipe-b-torture-move:
    - shard-iclb:         [PASS][14] -> [DMESG-WARN][15] ([i915#128])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8462/shard-iclb4/igt@kms_cursor_legacy@pipe-b-torture-move.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4555/shard-iclb5/igt@kms_cursor_legacy@pipe-b-torture-move.html

  * igt@kms_draw_crc@draw-method-xrgb8888-render-untiled:
    - shard-kbl:          [PASS][16] -> [FAIL][17] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8462/shard-kbl6/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4555/shard-kbl6/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html
    - shard-apl:          [PASS][18] -> [FAIL][19] ([i915#52] / [i915#54] / [i915#95])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8462/shard-apl4/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4555/shard-apl1/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html

  * igt@kms_flip_tiling@flip-changes-tiling-yf:
    - shard-kbl:          [PASS][20] -> [FAIL][21] ([i915#699] / [i915#93] / [i915#95])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8462/shard-kbl7/igt@kms_flip_tiling@flip-changes-tiling-yf.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4555/shard-kbl3/igt@kms_flip_tiling@flip-changes-tiling-yf.html

  * igt@kms_mmap_write_crc@main:
    - shard-kbl:          [PASS][22] -> [FAIL][23] ([i915#93] / [i915#95])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8462/shard-kbl1/igt@kms_mmap_write_crc@main.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4555/shard-kbl2/igt@kms_mmap_write_crc@main.html

  * igt@kms_pipe_crc_basic@hang-read-crc-pipe-a:
    - shard-kbl:          [PASS][24] -> [FAIL][25] ([i915#53] / [i915#93] / [i915#95]) +1 similar issue
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8462/shard-kbl4/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4555/shard-kbl1/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-a:
    - shard-apl:          [PASS][26] -> [FAIL][27] ([i915#53] / [i915#95]) +1 similar issue
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8462/shard-apl4/igt@kms_pipe_crc_basic@read-crc-pipe-a.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4555/shard-apl7/igt@kms_pipe_crc_basic@read-crc-pipe-a.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid:
    - shard-kbl:          [PASS][28] -> [FAIL][29] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8462/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4555/shard-kbl4/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
    - shard-apl:          [PASS][30] -> [FAIL][31] ([fdo#108145] / [i915#265] / [i915#95])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8462/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4555/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-128:
    - shard-apl:          [PASS][32] -> [FAIL][33] ([i915#1559] / [i915#95])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8462/shard-apl2/igt@kms_plane_cursor@pipe-a-viewport-size-128.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4555/shard-apl8/igt@kms_plane_cursor@pipe-a-viewport-size-128.html
    - shard-kbl:          [PASS][34] -> [FAIL][35] ([i915#1559] / [i915#93] / [i915#95])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8462/shard-kbl3/igt@kms_plane_cursor@pipe-a-viewport-size-128.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4555/shard-kbl1/igt@kms_plane_cursor@pipe-a-viewport-size-128.html

  * igt@kms_psr@psr2_primary_mmap_gtt:
    - shard-iclb:         [PASS][36] -> [SKIP][37] ([fdo#109441])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8462/shard-iclb2/igt@kms_psr@psr2_primary_mmap_gtt.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4555/shard-iclb7/igt@kms_psr@psr2_primary_mmap_gtt.html

  
#### Possible fixes ####

  * {igt@gem_ctx_isolation@preservation-s3@rcs0}:
    - shard-kbl:          [INCOMPLETE][38] ([i915#155] / [i915#794]) -> [PASS][39]
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8462/shard-kbl1/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4555/shard-kbl2/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-kbl:          [INCOMPLETE][40] ([i915#151] / [i915#155]) -> [PASS][41]
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8462/shard-kbl4/igt@i915_pm_rpm@system-suspend-execbuf.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4555/shard-kbl2/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@i915_suspend@forcewake:
    - shard-kbl:          [DMESG-WARN][42] ([i915#180]) -> [PASS][43] +2 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8462/shard-kbl7/igt@i915_suspend@forcewake.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4555/shard-kbl4/igt@i915_suspend@forcewake.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-glk:          [FAIL][44] ([i915#72]) -> [PASS][45]
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8462/shard-glk5/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4555/shard-glk2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@all-pipes-torture-move:
    - shard-hsw:          [DMESG-WARN][46] ([i915#128]) -> [PASS][47]
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8462/shard-hsw4/igt@kms_cursor_legacy@all-pipes-torture-move.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4555/shard-hsw8/igt@kms_cursor_legacy@all-pipes-torture-move.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled:
    - shard-apl:          [FAIL][48] ([i915#52] / [i915#54] / [i915#95]) -> [PASS][49] +1 similar issue
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8462/shard-apl8/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4555/shard-apl3/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
    - shard-kbl:          [FAIL][50] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8462/shard-kbl2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4555/shard-kbl2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html

  * igt@kms_draw_crc@fill-fb:
    - shard-apl:          [FAIL][52] ([i915#95]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8462/shard-apl2/igt@kms_draw_crc@fill-fb.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4555/shard-apl3/igt@kms_draw_crc@fill-fb.html

  * {igt@kms_flip@flip-vs-suspend@a-dp1}:
    - shard-apl:          [DMESG-WARN][54] ([i915#180]) -> [PASS][55] +2 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8462/shard-apl4/igt@kms_flip@flip-vs-suspend@a-dp1.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4555/shard-apl6/igt@kms_flip@flip-vs-suspend@a-dp1.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant:
    - shard-kbl:          [FAIL][56] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8462/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4555/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
    - shard-apl:          [FAIL][58] ([fdo#108145] / [i915#265] / [i915#95]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8462/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4555/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [SKIP][60] ([fdo#109441]) -> [PASS][61] +3 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8462/shard-iclb6/igt@kms_psr@psr2_no_drrs.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4555/shard-iclb2/igt@kms_psr@psr2_no_drrs.html

  
#### Warnings ####

  * igt@i915_pm_rpm@cursor-dpms:
    - shard-snb:          [INCOMPLETE][62] ([i915#82]) -> [SKIP][63] ([fdo#109271])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8462/shard-snb4/igt@i915_pm_rpm@cursor-dpms.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4555/shard-snb2/igt@i915_pm_rpm@cursor-dpms.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-snb:          [SKIP][64] ([fdo#109271]) -> [INCOMPLETE][65] ([i915#82])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8462/shard-snb1/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4555/shard-snb6/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_content_protection@lic:
    - shard-apl:          [TIMEOUT][66] ([i915#1319]) -> [FAIL][67] ([fdo#110321])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8462/shard-apl3/igt@kms_content_protection@lic.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4555/shard-apl3/igt@kms_content_protection@lic.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
    - shard-apl:          [FAIL][68] ([fdo#108145] / [i915#265] / [i915#95]) -> [FAIL][69] ([fdo#108145] / [i915#265])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8462/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4555/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
    - shard-kbl:          [FAIL][70] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95]) -> [FAIL][71] ([fdo#108145] / [i915#265])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8462/shard-kbl7/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4555/shard-kbl7/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#128]: https://gitlab.freedesktop.org/drm/intel/issues/128
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#151]: https://gitlab.freedesktop.org/drm/intel/issues/151
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#53]: https://gitlab.freedesktop.org/drm/intel/issues/53
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#699]: https://gitlab.freedesktop.org/drm/intel/issues/699
  [i915#70]: https://gitlab.freedesktop.org/drm/intel/issues/70
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#794]: https://gitlab.freedesktop.org/drm/intel/issues/794
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5644 -> IGTPW_4555
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8462: f15508df0c2c0ab81c181457603f83ccc4ddf866 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4555: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4555/index.html
  IGT_5644: 16f067ae42a6a93b8f0c5835210e2575a883001b @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4555/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
