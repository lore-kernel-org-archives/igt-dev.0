Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 20 May 2020 07:06:39 -0000
Message-ID: <158995839988.30688.13653606355047710312@emeril.freedesktop.org>
References: <20200519191346.17210-1-ashutosh.dixit@intel.com>
In-Reply-To: <20200519191346.17210-1-ashutosh.dixit@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_tests/i915=5Ffb=5Ftiling=3A_Ch?=
 =?utf-8?q?eck_if_device_supports_tiling?=
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
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,1/2] tests/i915_fb_tiling: Check if device supports tiling
URL   : https://patchwork.freedesktop.org/series/77434/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8506_full -> IGTPW_4594_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4594_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4594_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4594/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4594_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-iclb:         [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8506/shard-iclb6/igt@kms_panel_fitting@atomic-fastset.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4594/shard-iclb1/igt@kms_panel_fitting@atomic-fastset.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@kms_flip@flip-vs-suspend-interruptible@c-edp1}:
    - shard-iclb:         [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8506/shard-iclb5/igt@kms_flip@flip-vs-suspend-interruptible@c-edp1.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4594/shard-iclb3/igt@kms_flip@flip-vs-suspend-interruptible@c-edp1.html

  
Known issues
------------

  Here are the changes found in IGTPW_4594_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_softpin@noreloc-s3:
    - shard-kbl:          [PASS][5] -> [DMESG-WARN][6] ([i915#180])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8506/shard-kbl6/igt@gem_softpin@noreloc-s3.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4594/shard-kbl1/igt@gem_softpin@noreloc-s3.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-tglb:         [PASS][7] -> [SKIP][8] ([i915#1904])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8506/shard-tglb2/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4594/shard-tglb1/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen:
    - shard-kbl:          [PASS][9] -> [FAIL][10] ([i915#54] / [i915#93] / [i915#95])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8506/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4594/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html

  * igt@kms_cursor_legacy@all-pipes-torture-move:
    - shard-iclb:         [PASS][11] -> [DMESG-WARN][12] ([i915#128])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8506/shard-iclb6/igt@kms_cursor_legacy@all-pipes-torture-move.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4594/shard-iclb1/igt@kms_cursor_legacy@all-pipes-torture-move.html

  * igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled:
    - shard-kbl:          [PASS][13] -> [FAIL][14] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8506/shard-kbl7/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4594/shard-kbl4/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
    - shard-apl:          [PASS][15] -> [FAIL][16] ([i915#52] / [i915#54] / [i915#95])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8506/shard-apl4/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4594/shard-apl7/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html

  * igt@kms_flip_tiling@flip-changes-tiling-y:
    - shard-apl:          [PASS][17] -> [FAIL][18] ([i915#95]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8506/shard-apl4/igt@kms_flip_tiling@flip-changes-tiling-y.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4594/shard-apl1/igt@kms_flip_tiling@flip-changes-tiling-y.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:
    - shard-apl:          [PASS][19] -> [DMESG-WARN][20] ([i915#180]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8506/shard-apl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4594/shard-apl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [PASS][21] -> [SKIP][22] ([fdo#109441]) +2 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8506/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4594/shard-iclb8/igt@kms_psr@psr2_primary_page_flip.html

  
#### Possible fixes ####

  * igt@gen9_exec_parse@allowed-all:
    - shard-apl:          [DMESG-WARN][23] ([i915#1436] / [i915#716]) -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8506/shard-apl6/igt@gen9_exec_parse@allowed-all.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4594/shard-apl7/igt@gen9_exec_parse@allowed-all.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen:
    - shard-kbl:          [FAIL][25] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8506/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4594/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen.html

  * {igt@kms_flip@flip-vs-suspend-interruptible@c-dp1}:
    - shard-apl:          [DMESG-WARN][27] ([i915#180]) -> [PASS][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8506/shard-apl4/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4594/shard-apl4/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html

  * {igt@kms_flip@flip-vs-suspend@a-dp1}:
    - shard-kbl:          [DMESG-WARN][29] ([i915#180]) -> [PASS][30] +3 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8506/shard-kbl1/igt@kms_flip@flip-vs-suspend@a-dp1.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4594/shard-kbl2/igt@kms_flip@flip-vs-suspend@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-snb:          [SKIP][31] ([fdo#109271]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8506/shard-snb1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-cpu.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4594/shard-snb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_psr@psr2_primary_mmap_gtt:
    - shard-iclb:         [SKIP][33] ([fdo#109441]) -> [PASS][34] +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8506/shard-iclb8/igt@kms_psr@psr2_primary_mmap_gtt.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4594/shard-iclb2/igt@kms_psr@psr2_primary_mmap_gtt.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [FAIL][35] ([i915#31]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8506/shard-kbl6/igt@kms_setmode@basic.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4594/shard-kbl6/igt@kms_setmode@basic.html

  * {igt@prime_vgem@sync@rcs0}:
    - shard-iclb:         [INCOMPLETE][37] ([i915#409]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8506/shard-iclb8/igt@prime_vgem@sync@rcs0.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4594/shard-iclb8/igt@prime_vgem@sync@rcs0.html

  
#### Warnings ####

  * igt@kms_content_protection@legacy:
    - shard-apl:          [TIMEOUT][39] ([i915#1319]) -> [FAIL][40] ([fdo#110321] / [fdo#110336])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8506/shard-apl3/igt@kms_content_protection@legacy.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4594/shard-apl1/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic:
    - shard-apl:          [FAIL][41] ([fdo#110321]) -> [TIMEOUT][42] ([i915#1319])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8506/shard-apl6/igt@kms_content_protection@lic.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4594/shard-apl7/igt@kms_content_protection@lic.html

  * igt@kms_content_protection@srm:
    - shard-apl:          [TIMEOUT][43] ([i915#1319]) -> [FAIL][44] ([fdo#110321])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8506/shard-apl8/igt@kms_content_protection@srm.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4594/shard-apl3/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-kbl:          [FAIL][45] ([i915#357]) -> [FAIL][46] ([i915#357] / [i915#93] / [i915#95])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8506/shard-kbl6/igt@kms_content_protection@uevent.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4594/shard-kbl3/igt@kms_content_protection@uevent.html
    - shard-apl:          [FAIL][47] ([i915#357]) -> [FAIL][48] ([i915#357] / [i915#95])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8506/shard-apl3/igt@kms_content_protection@uevent.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4594/shard-apl7/igt@kms_content_protection@uevent.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [FAIL][49] ([i915#1121] / [i915#95]) -> [DMESG-FAIL][50] ([i915#180] / [i915#95])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8506/shard-apl6/igt@kms_fbcon_fbt@fbc-suspend.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4594/shard-apl1/igt@kms_fbcon_fbt@fbc-suspend.html
    - shard-kbl:          [DMESG-FAIL][51] ([i915#180] / [i915#95]) -> [FAIL][52] ([i915#1121] / [i915#93] / [i915#95])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8506/shard-kbl1/igt@kms_fbcon_fbt@fbc-suspend.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4594/shard-kbl1/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:
    - shard-kbl:          [FAIL][53] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95]) -> [FAIL][54] ([fdo#108145] / [i915#265])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8506/shard-kbl6/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4594/shard-kbl4/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html
    - shard-apl:          [FAIL][55] ([fdo#108145] / [i915#265] / [i915#95]) -> [FAIL][56] ([fdo#108145] / [i915#265])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8506/shard-apl4/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4594/shard-apl7/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [i915#1121]: https://gitlab.freedesktop.org/drm/intel/issues/1121
  [i915#128]: https://gitlab.freedesktop.org/drm/intel/issues/128
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1904]: https://gitlab.freedesktop.org/drm/intel/issues/1904
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#357]: https://gitlab.freedesktop.org/drm/intel/issues/357
  [i915#409]: https://gitlab.freedesktop.org/drm/intel/issues/409
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5661 -> IGTPW_4594
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8506: d6a73e9084ff6adfabbad014bc294d254484f304 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4594: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4594/index.html
  IGT_5661: a772a7c7a761c6125bc0af5284ad603478107737 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4594/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
