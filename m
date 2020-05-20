Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 20 May 2020 00:46:51 -0000
Message-ID: <158993561172.30691.1341927660328042632@emeril.freedesktop.org>
References: <20200519134405.1876899-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200519134405.1876899-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgbGliOiBS?=
 =?utf-8?q?emove_early_has=5Fknown=5Fintel=5Fchipset=28=29_check?=
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

Series: lib: Remove early has_known_intel_chipset() check
URL   : https://patchwork.freedesktop.org/series/77420/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8505_full -> IGTPW_4589_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4589/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4589_full:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@gem_exec_balancer@sliced}:
    - shard-kbl:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8505/shard-kbl7/igt@gem_exec_balancer@sliced.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4589/shard-kbl2/igt@gem_exec_balancer@sliced.html
    - shard-tglb:         [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8505/shard-tglb7/igt@gem_exec_balancer@sliced.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4589/shard-tglb2/igt@gem_exec_balancer@sliced.html

  
Known issues
------------

  Here are the changes found in IGTPW_4589_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_suspend@sysfs-reader:
    - shard-apl:          [PASS][5] -> [DMESG-WARN][6] ([i915#180]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8505/shard-apl3/igt@i915_suspend@sysfs-reader.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4589/shard-apl4/igt@i915_suspend@sysfs-reader.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen:
    - shard-kbl:          [PASS][7] -> [FAIL][8] ([i915#54] / [i915#93] / [i915#95]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8505/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4589/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-tglb:         [PASS][9] -> [INCOMPLETE][10] ([i915#1602] / [i915#456])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8505/shard-tglb5/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4589/shard-tglb2/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic:
    - shard-kbl:          [PASS][11] -> [FAIL][12] ([i915#1566] / [i915#93] / [i915#95])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8505/shard-kbl7/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4589/shard-kbl1/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled:
    - shard-kbl:          [PASS][13] -> [FAIL][14] ([fdo#108145] / [i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8505/shard-kbl1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4589/shard-kbl7/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
    - shard-apl:          [PASS][15] -> [FAIL][16] ([fdo#108145] / [i915#52] / [i915#54] / [i915#95])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8505/shard-apl4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4589/shard-apl4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [PASS][17] -> [DMESG-WARN][18] ([i915#180] / [i915#93] / [i915#95])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8505/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4589/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_pipe_crc_basic@hang-read-crc-pipe-a:
    - shard-kbl:          [PASS][19] -> [FAIL][20] ([i915#53] / [i915#93] / [i915#95])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8505/shard-kbl4/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4589/shard-kbl1/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence:
    - shard-apl:          [PASS][21] -> [FAIL][22] ([i915#53] / [i915#95]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8505/shard-apl6/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4589/shard-apl1/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-128:
    - shard-kbl:          [PASS][23] -> [FAIL][24] ([i915#1559] / [i915#93] / [i915#95]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8505/shard-kbl1/igt@kms_plane_cursor@pipe-a-overlay-size-128.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4589/shard-kbl1/igt@kms_plane_cursor@pipe-a-overlay-size-128.html
    - shard-apl:          [PASS][25] -> [FAIL][26] ([i915#1559] / [i915#95]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8505/shard-apl3/igt@kms_plane_cursor@pipe-a-overlay-size-128.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4589/shard-apl6/igt@kms_plane_cursor@pipe-a-overlay-size-128.html

  * igt@kms_plane_multiple@atomic-pipe-a-tiling-yf:
    - shard-apl:          [PASS][27] -> [FAIL][28] ([i915#1779] / [i915#95])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8505/shard-apl7/igt@kms_plane_multiple@atomic-pipe-a-tiling-yf.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4589/shard-apl6/igt@kms_plane_multiple@atomic-pipe-a-tiling-yf.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [PASS][29] -> [SKIP][30] ([fdo#109441]) +2 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8505/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4589/shard-iclb3/igt@kms_psr@psr2_primary_page_flip.html

  
#### Possible fixes ####

  * igt@gem_workarounds@suspend-resume:
    - shard-apl:          [DMESG-WARN][31] ([i915#180] / [i915#95]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8505/shard-apl4/igt@gem_workarounds@suspend-resume.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4589/shard-apl8/igt@gem_workarounds@suspend-resume.html
    - shard-kbl:          [DMESG-WARN][33] ([i915#180] / [i915#93] / [i915#95]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8505/shard-kbl6/igt@gem_workarounds@suspend-resume.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4589/shard-kbl7/igt@gem_workarounds@suspend-resume.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-apl:          [DMESG-WARN][35] ([i915#180]) -> [PASS][36] +2 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8505/shard-apl6/igt@i915_suspend@fence-restore-tiled2untiled.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4589/shard-apl1/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-apl:          [FAIL][37] ([i915#1119] / [i915#95]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8505/shard-apl7/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4589/shard-apl2/igt@kms_big_fb@linear-32bpp-rotate-180.html
    - shard-kbl:          [FAIL][39] ([i915#1119] / [i915#93] / [i915#95]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8505/shard-kbl4/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4589/shard-kbl4/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - shard-kbl:          [FAIL][41] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8505/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4589/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-256x256-sliding:
    - shard-apl:          [FAIL][43] ([i915#54]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8505/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-256x256-sliding.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4589/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-256x256-sliding.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy:
    - shard-kbl:          [FAIL][45] ([i915#1566] / [i915#93] / [i915#95]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8505/shard-kbl2/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4589/shard-kbl2/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html

  * {igt@kms_flip@flip-vs-suspend-interruptible@a-dp1}:
    - shard-kbl:          [DMESG-WARN][47] ([i915#180]) -> [PASS][48] +5 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8505/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4589/shard-kbl6/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_flip_tiling@flip-changes-tiling-y:
    - shard-apl:          [FAIL][49] ([i915#95]) -> [PASS][50] +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8505/shard-apl3/igt@kms_flip_tiling@flip-changes-tiling-y.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4589/shard-apl4/igt@kms_flip_tiling@flip-changes-tiling-y.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [SKIP][51] ([i915#433]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8505/shard-tglb6/igt@kms_hdmi_inject@inject-audio.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4589/shard-tglb7/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][53] ([fdo#109441]) -> [PASS][54] +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8505/shard-iclb3/igt@kms_psr@psr2_sprite_plane_move.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4589/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_vblank@pipe-d-ts-continuation-dpms-suspend:
    - shard-tglb:         [INCOMPLETE][55] ([i915#1602]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8505/shard-tglb2/igt@kms_vblank@pipe-d-ts-continuation-dpms-suspend.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4589/shard-tglb1/igt@kms_vblank@pipe-d-ts-continuation-dpms-suspend.html

  * {igt@perf@blocking-parameterized}:
    - shard-iclb:         [FAIL][57] ([i915#1542]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8505/shard-iclb3/igt@perf@blocking-parameterized.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4589/shard-iclb5/igt@perf@blocking-parameterized.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][59] ([i915#588]) -> [SKIP][60] ([i915#658])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8505/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4589/shard-iclb3/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-kbl:          [FAIL][61] ([i915#454] / [i915#93] / [i915#95]) -> [FAIL][62] ([i915#454])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8505/shard-kbl1/igt@i915_pm_dc@dc6-dpms.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4589/shard-kbl1/igt@i915_pm_dc@dc6-dpms.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          [FAIL][63] ([fdo#110321] / [fdo#110336]) -> [TIMEOUT][64] ([i915#1319]) +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8505/shard-apl2/igt@kms_content_protection@atomic-dpms.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4589/shard-apl2/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@srm:
    - shard-kbl:          [FAIL][65] ([fdo#110321] / [i915#93] / [i915#95]) -> [TIMEOUT][66] ([i915#1319])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8505/shard-kbl2/igt@kms_content_protection@srm.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4589/shard-kbl3/igt@kms_content_protection@srm.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-kbl:          [FAIL][67] ([i915#1121] / [i915#93] / [i915#95]) -> [FAIL][68] ([i915#64])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8505/shard-kbl4/igt@kms_fbcon_fbt@fbc.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4589/shard-kbl1/igt@kms_fbcon_fbt@fbc.html
    - shard-apl:          [FAIL][69] ([i915#1121] / [i915#95]) -> [FAIL][70] ([i915#1525])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8505/shard-apl2/igt@kms_fbcon_fbt@fbc.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4589/shard-apl8/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_psr2_su@page_flip:
    - shard-tglb:         [SKIP][71] -> [FAIL][72] ([i915#608])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8505/shard-tglb2/igt@kms_psr2_su@page_flip.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4589/shard-tglb6/igt@kms_psr2_su@page_flip.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#1121]: https://gitlab.freedesktop.org/drm/intel/issues/1121
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1525]: https://gitlab.freedesktop.org/drm/intel/issues/1525
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#1566]: https://gitlab.freedesktop.org/drm/intel/issues/1566
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#1779]: https://gitlab.freedesktop.org/drm/intel/issues/1779
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#53]: https://gitlab.freedesktop.org/drm/intel/issues/53
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#608]: https://gitlab.freedesktop.org/drm/intel/issues/608
  [i915#64]: https://gitlab.freedesktop.org/drm/intel/issues/64
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5660 -> IGTPW_4589
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8505: dd6f7db19af1ccb376719c8759afe6be9107315c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4589: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4589/index.html
  IGT_5660: bf43e3e45a17c16094fb3a47b363ccf1c95c28b9 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4589/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
