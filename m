Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 12 May 2020 18:06:12 -0000
Message-ID: <158930677238.18141.6048500702384561857@emeril.freedesktop.org>
References: <20200512140736.22096-1-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20200512140736.22096-1-janusz.krzysztofik@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgbGliL2dl?=
 =?utf-8?q?m=5Ftest=5Fengine=3A_Add_no_device_reopen_variant?=
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
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: lib/gem_test_engine: Add no device reopen variant
URL   : https://patchwork.freedesktop.org/series/77193/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8470_full -> IGTPW_4562_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4562/index.html

Known issues
------------

  Here are the changes found in IGTPW_4562_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gen9_exec_parse@allowed-all:
    - shard-kbl:          [PASS][1] -> [DMESG-WARN][2] ([i915#1436] / [i915#716])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8470/shard-kbl2/igt@gen9_exec_parse@allowed-all.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4562/shard-kbl3/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-kbl:          [PASS][3] -> [DMESG-WARN][4] ([i915#180]) +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8470/shard-kbl2/igt@i915_suspend@fence-restore-tiled2untiled.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4562/shard-kbl4/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-apl:          [PASS][5] -> [FAIL][6] ([i915#1119] / [i915#95]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8470/shard-apl2/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4562/shard-apl2/igt@kms_big_fb@linear-32bpp-rotate-180.html
    - shard-kbl:          [PASS][7] -> [FAIL][8] ([i915#1119] / [i915#93] / [i915#95]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8470/shard-kbl4/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4562/shard-kbl1/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen:
    - shard-kbl:          [PASS][9] -> [FAIL][10] ([i915#54] / [i915#93] / [i915#95]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8470/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4562/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [PASS][11] -> [INCOMPLETE][12] ([i915#155])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8470/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4562/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-b-cursor-64x21-random:
    - shard-glk:          [PASS][13] -> [FAIL][14] ([i915#54])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8470/shard-glk2/igt@kms_cursor_crc@pipe-b-cursor-64x21-random.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4562/shard-glk6/igt@kms_cursor_crc@pipe-b-cursor-64x21-random.html
    - shard-apl:          [PASS][15] -> [FAIL][16] ([i915#54])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8470/shard-apl3/igt@kms_cursor_crc@pipe-b-cursor-64x21-random.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4562/shard-apl6/igt@kms_cursor_crc@pipe-b-cursor-64x21-random.html
    - shard-kbl:          [PASS][17] -> [FAIL][18] ([i915#54])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8470/shard-kbl3/igt@kms_cursor_crc@pipe-b-cursor-64x21-random.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4562/shard-kbl2/igt@kms_cursor_crc@pipe-b-cursor-64x21-random.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic:
    - shard-kbl:          [PASS][19] -> [FAIL][20] ([i915#1566] / [i915#93] / [i915#95])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8470/shard-kbl6/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4562/shard-kbl4/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff:
    - shard-glk:          [PASS][21] -> [FAIL][22] ([i915#49])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8470/shard-glk4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4562/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-tglb:         [PASS][23] -> [SKIP][24] ([i915#668]) +7 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8470/shard-tglb7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4562/shard-tglb6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-apl:          [PASS][25] -> [DMESG-WARN][26] ([i915#180]) +3 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8470/shard-apl2/igt@kms_hdr@bpc-switch-suspend.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4562/shard-apl6/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-a:
    - shard-apl:          [PASS][27] -> [FAIL][28] ([i915#53] / [i915#95])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8470/shard-apl8/igt@kms_pipe_crc_basic@read-crc-pipe-a.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4562/shard-apl2/igt@kms_pipe_crc_basic@read-crc-pipe-a.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [PASS][29] -> [SKIP][30] ([fdo#109642] / [fdo#111068])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8470/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4562/shard-iclb5/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [PASS][31] -> [SKIP][32] ([fdo#109441])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8470/shard-iclb2/igt@kms_psr@psr2_cursor_render.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4562/shard-iclb7/igt@kms_psr@psr2_cursor_render.html

  
#### Possible fixes ####

  * igt@gen9_exec_parse@allowed-all:
    - shard-apl:          [DMESG-WARN][33] ([i915#1436] / [i915#716]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8470/shard-apl3/igt@gen9_exec_parse@allowed-all.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4562/shard-apl2/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_selftest@live@gt_pm:
    - shard-apl:          [INCOMPLETE][35] ([i915#1812]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8470/shard-apl2/igt@i915_selftest@live@gt_pm.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4562/shard-apl7/igt@i915_selftest@live@gt_pm.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen:
    - shard-kbl:          [FAIL][37] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][38] +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8470/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4562/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-tglb:         [INCOMPLETE][39] ([i915#1602] / [i915#456]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8470/shard-tglb6/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4562/shard-tglb2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_cursor_legacy@pipe-c-torture-bo:
    - shard-hsw:          [DMESG-WARN][41] ([i915#128]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8470/shard-hsw6/igt@kms_cursor_legacy@pipe-c-torture-bo.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4562/shard-hsw4/igt@kms_cursor_legacy@pipe-c-torture-bo.html

  * {igt@kms_flip@flip-vs-suspend-interruptible@c-dp1}:
    - shard-apl:          [DMESG-WARN][43] ([i915#180]) -> [PASS][44] +6 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8470/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4562/shard-apl2/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html

  * {igt@kms_flip@flip-vs-suspend@c-dp1}:
    - shard-kbl:          [DMESG-WARN][45] ([i915#180]) -> [PASS][46] +3 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8470/shard-kbl7/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4562/shard-kbl7/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * {igt@kms_flip@plain-flip-ts-check@a-hdmi-a1}:
    - shard-glk:          [FAIL][47] ([i915#34]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8470/shard-glk8/igt@kms_flip@plain-flip-ts-check@a-hdmi-a1.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4562/shard-glk6/igt@kms_flip@plain-flip-ts-check@a-hdmi-a1.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [SKIP][49] ([i915#433]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8470/shard-tglb1/igt@kms_hdmi_inject@inject-audio.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4562/shard-tglb8/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [FAIL][51] ([i915#53] / [i915#93] / [i915#95]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8470/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4562/shard-kbl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
    - shard-apl:          [FAIL][53] ([i915#53] / [i915#95]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8470/shard-apl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4562/shard-apl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-64:
    - shard-kbl:          [FAIL][55] ([i915#1559] / [i915#93] / [i915#95]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8470/shard-kbl2/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4562/shard-kbl1/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
    - shard-apl:          [FAIL][57] ([i915#1559] / [i915#95]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8470/shard-apl8/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4562/shard-apl8/igt@kms_plane_cursor@pipe-a-viewport-size-64.html

  * igt@kms_psr@psr2_sprite_blt:
    - shard-iclb:         [SKIP][59] ([fdo#109441]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8470/shard-iclb4/igt@kms_psr@psr2_sprite_blt.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4562/shard-iclb2/igt@kms_psr@psr2_sprite_blt.html

  * {igt@perf@blocking-parameterized}:
    - shard-hsw:          [FAIL][61] ([i915#1542]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8470/shard-hsw8/igt@perf@blocking-parameterized.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4562/shard-hsw2/igt@perf@blocking-parameterized.html

  
#### Warnings ####

  * igt@i915_pm_rpm@gem-idle:
    - shard-snb:          [INCOMPLETE][63] ([i915#82]) -> [SKIP][64] ([fdo#109271])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8470/shard-snb5/igt@i915_pm_rpm@gem-idle.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4562/shard-snb4/igt@i915_pm_rpm@gem-idle.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          [TIMEOUT][65] ([i915#1319]) -> [FAIL][66] ([fdo#110321] / [fdo#110336])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8470/shard-apl7/igt@kms_content_protection@atomic-dpms.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4562/shard-apl6/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@srm:
    - shard-apl:          [TIMEOUT][67] ([i915#1319]) -> [FAIL][68] ([fdo#110321])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8470/shard-apl3/igt@kms_content_protection@srm.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4562/shard-apl6/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-kbl:          [FAIL][69] ([i915#357]) -> [FAIL][70] ([i915#357] / [i915#93] / [i915#95])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8470/shard-kbl7/igt@kms_content_protection@uevent.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4562/shard-kbl4/igt@kms_content_protection@uevent.html
    - shard-apl:          [FAIL][71] ([i915#357]) -> [FAIL][72] ([i915#357] / [i915#95])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8470/shard-apl4/igt@kms_content_protection@uevent.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4562/shard-apl8/igt@kms_content_protection@uevent.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#128]: https://gitlab.freedesktop.org/drm/intel/issues/128
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#1566]: https://gitlab.freedesktop.org/drm/intel/issues/1566
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1812]: https://gitlab.freedesktop.org/drm/intel/issues/1812
  [i915#34]: https://gitlab.freedesktop.org/drm/intel/issues/34
  [i915#357]: https://gitlab.freedesktop.org/drm/intel/issues/357
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#53]: https://gitlab.freedesktop.org/drm/intel/issues/53
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5651 -> IGTPW_4562
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8470: d2c5ae86eac811c49f2fe22c4fa02b6e6d31cd67 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4562: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4562/index.html
  IGT_5651: e54e2642f1967ca3c488db32264607df670d1dfb @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4562/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
