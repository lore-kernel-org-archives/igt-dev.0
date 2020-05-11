Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 11 May 2020 10:07:45 -0000
Message-ID: <158919166567.13119.4234089823946728200@emeril.freedesktop.org>
References: <20200511082141.65494-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200511082141.65494-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fringfill=3A_Do_a_basic_pass_over_all_engines_simultaneousl?=
 =?utf-8?q?y?=
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

Series: i915/gem_ringfill: Do a basic pass over all engines simultaneously
URL   : https://patchwork.freedesktop.org/series/77142/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8461_full -> IGTPW_4554_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4554/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4554_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_ringfill@basic-all} (NEW):
    - shard-snb:          NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4554/shard-snb6/igt@gem_ringfill@basic-all.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8461_full and IGTPW_4554_full:

### New IGT tests (1) ###

  * igt@gem_ringfill@basic-all:
    - Statuses : 1 fail(s) 6 pass(s)
    - Exec time: [0.04, 2.28] s

  

Known issues
------------

  Here are the changes found in IGTPW_4554_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_softpin@noreloc-s3:
    - shard-kbl:          [PASS][2] -> [DMESG-WARN][3] ([i915#180] / [i915#93] / [i915#95])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-kbl7/igt@gem_softpin@noreloc-s3.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4554/shard-kbl3/igt@gem_softpin@noreloc-s3.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-kbl:          [PASS][4] -> [DMESG-WARN][5] ([i915#183])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-kbl3/igt@gem_tiled_swapping@non-threaded.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4554/shard-kbl1/igt@gem_tiled_swapping@non-threaded.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-apl:          [PASS][6] -> [DMESG-WARN][7] ([i915#716])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-apl1/igt@gen9_exec_parse@allowed-all.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4554/shard-apl6/igt@gen9_exec_parse@allowed-all.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen:
    - shard-kbl:          [PASS][8] -> [FAIL][9] ([i915#54] / [i915#93] / [i915#95]) +1 similar issue
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4554/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding:
    - shard-apl:          [PASS][10] -> [FAIL][11] ([i915#54])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4554/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding.html
    - shard-kbl:          [PASS][12] -> [FAIL][13] ([i915#54])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4554/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding.html

  * igt@kms_flip_tiling@flip-changes-tiling:
    - shard-apl:          [PASS][14] -> [FAIL][15] ([i915#95])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-apl6/igt@kms_flip_tiling@flip-changes-tiling.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4554/shard-apl8/igt@kms_flip_tiling@flip-changes-tiling.html
    - shard-kbl:          [PASS][16] -> [FAIL][17] ([i915#699] / [i915#93] / [i915#95])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-kbl1/igt@kms_flip_tiling@flip-changes-tiling.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4554/shard-kbl6/igt@kms_flip_tiling@flip-changes-tiling.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-a:
    - shard-apl:          [PASS][18] -> [FAIL][19] ([i915#53] / [i915#95])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-apl1/igt@kms_pipe_crc_basic@read-crc-pipe-a.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4554/shard-apl3/igt@kms_pipe_crc_basic@read-crc-pipe-a.html
    - shard-kbl:          [PASS][20] -> [FAIL][21] ([i915#53] / [i915#93] / [i915#95])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-kbl4/igt@kms_pipe_crc_basic@read-crc-pipe-a.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4554/shard-kbl7/igt@kms_pipe_crc_basic@read-crc-pipe-a.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:
    - shard-kbl:          [PASS][22] -> [DMESG-WARN][23] ([i915#180])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-kbl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4554/shard-kbl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-7efc:
    - shard-apl:          [PASS][24] -> [FAIL][25] ([fdo#108145] / [i915#265] / [i915#95])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4554/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [PASS][26] -> [SKIP][27] ([fdo#109642] / [fdo#111068])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4554/shard-iclb1/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [PASS][28] -> [SKIP][29] ([fdo#109441]) +2 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4554/shard-iclb5/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-apl:          [PASS][30] -> [DMESG-WARN][31] ([i915#180]) +1 similar issue
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-apl2/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4554/shard-apl1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  
#### Possible fixes ####

  * {igt@gem_ctx_isolation@preservation-s3@rcs0}:
    - shard-kbl:          [INCOMPLETE][32] ([i915#155]) -> [PASS][33]
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-kbl3/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4554/shard-kbl6/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-kbl:          [DMESG-WARN][34] ([i915#1436] / [i915#716]) -> [PASS][35]
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-kbl1/igt@gen9_exec_parse@allowed-all.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4554/shard-kbl3/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_suspend@sysfs-reader:
    - shard-apl:          [DMESG-WARN][36] ([i915#180]) -> [PASS][37] +1 similar issue
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-apl6/igt@i915_suspend@sysfs-reader.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4554/shard-apl8/igt@i915_suspend@sysfs-reader.html

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - shard-hsw:          [FAIL][38] ([i915#57]) -> [PASS][39]
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-hsw6/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4554/shard-hsw4/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [SKIP][40] ([fdo#109349]) -> [PASS][41]
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-iclb6/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4554/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled:
    - shard-apl:          [FAIL][42] ([i915#52] / [i915#54] / [i915#95]) -> [PASS][43]
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-apl7/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4554/shard-apl7/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
    - shard-kbl:          [FAIL][44] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95]) -> [PASS][45]
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-kbl2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4554/shard-kbl1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html

  * {igt@kms_flip@2x-flip-vs-suspend-interruptible@bc-vga1-hdmi-a1}:
    - shard-hsw:          [INCOMPLETE][46] ([i915#61]) -> [PASS][47]
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-hsw6/igt@kms_flip@2x-flip-vs-suspend-interruptible@bc-vga1-hdmi-a1.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4554/shard-hsw1/igt@kms_flip@2x-flip-vs-suspend-interruptible@bc-vga1-hdmi-a1.html

  * {igt@kms_flip@flip-vs-suspend-interruptible@a-dp1}:
    - shard-kbl:          [DMESG-WARN][48] ([i915#180]) -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4554/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_flip_tiling@flip-changes-tiling-yf:
    - shard-kbl:          [FAIL][50] ([i915#699] / [i915#93] / [i915#95]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-kbl6/igt@kms_flip_tiling@flip-changes-tiling-yf.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4554/shard-kbl4/igt@kms_flip_tiling@flip-changes-tiling-yf.html
    - shard-apl:          [FAIL][52] ([i915#95]) -> [PASS][53] +1 similar issue
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-apl2/igt@kms_flip_tiling@flip-changes-tiling-yf.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4554/shard-apl1/igt@kms_flip_tiling@flip-changes-tiling-yf.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant:
    - shard-kbl:          [FAIL][54] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-kbl4/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4554/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
    - shard-apl:          [FAIL][56] ([fdo#108145] / [i915#265] / [i915#95]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4554/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html

  * igt@kms_psr@psr2_cursor_plane_onoff:
    - shard-iclb:         [SKIP][58] ([fdo#109441]) -> [PASS][59] +2 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-iclb8/igt@kms_psr@psr2_cursor_plane_onoff.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4554/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html

  * {igt@perf@blocking-parameterized}:
    - shard-hsw:          [FAIL][60] ([i915#1542]) -> [PASS][61] +1 similar issue
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-hsw6/igt@perf@blocking-parameterized.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4554/shard-hsw1/igt@perf@blocking-parameterized.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][62] ([i915#658]) -> [SKIP][63] ([i915#588])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-iclb4/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4554/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [SKIP][64] ([i915#468]) -> [FAIL][65] ([i915#454])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-tglb2/igt@i915_pm_dc@dc6-psr.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4554/shard-tglb1/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_content_protection@atomic:
    - shard-apl:          [TIMEOUT][66] ([i915#1319]) -> [FAIL][67] ([fdo#110321] / [fdo#110336]) +1 similar issue
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-apl8/igt@kms_content_protection@atomic.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4554/shard-apl3/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@lic:
    - shard-apl:          [FAIL][68] ([fdo#110321]) -> [TIMEOUT][69] ([i915#1319])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-apl4/igt@kms_content_protection@lic.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4554/shard-apl4/igt@kms_content_protection@lic.html

  * igt@kms_content_protection@srm:
    - shard-apl:          [TIMEOUT][70] ([i915#1319]) -> [FAIL][71] ([fdo#110321])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-apl1/igt@kms_content_protection@srm.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4554/shard-apl4/igt@kms_content_protection@srm.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
    - shard-apl:          [FAIL][72] ([fdo#108145] / [i915#265] / [i915#95]) -> [FAIL][73] ([fdo#108145] / [i915#265])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4554/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
    - shard-kbl:          [FAIL][74] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95]) -> [FAIL][75] ([fdo#108145] / [i915#265])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4554/shard-kbl3/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#183]: https://gitlab.freedesktop.org/drm/intel/issues/183
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#53]: https://gitlab.freedesktop.org/drm/intel/issues/53
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#57]: https://gitlab.freedesktop.org/drm/intel/issues/57
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#699]: https://gitlab.freedesktop.org/drm/intel/issues/699
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5644 -> IGTPW_4554
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8461: c0be14b9502e54c9ece4f4fc25872d665c6a6553 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4554: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4554/index.html
  IGT_5644: 16f067ae42a6a93b8f0c5835210e2575a883001b @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4554/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
