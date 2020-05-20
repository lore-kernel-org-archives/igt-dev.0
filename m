Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 20 May 2020 09:18:58 -0000
Message-ID: <158996633895.30691.14898214604199749416@emeril.freedesktop.org>
References: <20200519210924.2277459-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200519210924.2277459-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgbGliL2k5?=
 =?utf-8?q?15=3A_Assume_unknown_hardware_just_works?=
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

Series: lib/i915: Assume unknown hardware just works
URL   : https://patchwork.freedesktop.org/series/77437/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8506_full -> IGTPW_4596_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4596/index.html

Known issues
------------

  Here are the changes found in IGTPW_4596_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen:
    - shard-kbl:          [PASS][1] -> [FAIL][2] ([i915#54] / [i915#93] / [i915#95]) +3 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8506/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4596/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-tglb:         [PASS][3] -> [FAIL][4] ([i915#1121])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8506/shard-tglb7/igt@kms_fbcon_fbt@fbc-suspend.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4596/shard-tglb6/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_mmap_write_crc@main:
    - shard-kbl:          [PASS][5] -> [FAIL][6] ([i915#93] / [i915#95])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8506/shard-kbl1/igt@kms_mmap_write_crc@main.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4596/shard-kbl2/igt@kms_mmap_write_crc@main.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-64:
    - shard-apl:          [PASS][7] -> [FAIL][8] ([i915#1559] / [i915#95])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8506/shard-apl7/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4596/shard-apl7/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
    - shard-kbl:          [PASS][9] -> [FAIL][10] ([i915#1559] / [i915#93] / [i915#95])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8506/shard-kbl4/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4596/shard-kbl6/igt@kms_plane_cursor@pipe-a-overlay-size-64.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([fdo#109441]) +2 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8506/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4596/shard-iclb8/igt@kms_psr@psr2_primary_page_flip.html

  * igt@kms_vblank@pipe-c-ts-continuation-suspend:
    - shard-kbl:          [PASS][13] -> [DMESG-WARN][14] ([i915#180]) +2 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8506/shard-kbl6/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4596/shard-kbl4/igt@kms_vblank@pipe-c-ts-continuation-suspend.html

  
#### Possible fixes ####

  * igt@gen9_exec_parse@allowed-all:
    - shard-apl:          [DMESG-WARN][15] ([i915#1436] / [i915#716]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8506/shard-apl6/igt@gen9_exec_parse@allowed-all.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4596/shard-apl2/igt@gen9_exec_parse@allowed-all.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen:
    - shard-kbl:          [FAIL][17] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8506/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4596/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [SKIP][19] ([fdo#109349]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8506/shard-iclb6/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4596/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * {igt@kms_flip@flip-vs-suspend-interruptible@c-dp1}:
    - shard-apl:          [DMESG-WARN][21] ([i915#180]) -> [PASS][22] +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8506/shard-apl4/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4596/shard-apl6/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html

  * {igt@kms_flip@flip-vs-suspend@a-dp1}:
    - shard-kbl:          [DMESG-WARN][23] ([i915#180]) -> [PASS][24] +3 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8506/shard-kbl1/igt@kms_flip@flip-vs-suspend@a-dp1.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4596/shard-kbl2/igt@kms_flip@flip-vs-suspend@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-snb:          [SKIP][25] ([fdo#109271]) -> [PASS][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8506/shard-snb1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-cpu.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4596/shard-snb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-7efc:
    - shard-apl:          [FAIL][27] ([fdo#108145] / [i915#265] / [i915#95]) -> [PASS][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8506/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4596/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [SKIP][29] ([fdo#109441]) -> [PASS][30] +2 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8506/shard-iclb5/igt@kms_psr@psr2_cursor_render.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4596/shard-iclb2/igt@kms_psr@psr2_cursor_render.html

  * {igt@prime_vgem@sync@rcs0}:
    - shard-iclb:         [INCOMPLETE][31] ([i915#409]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8506/shard-iclb8/igt@prime_vgem@sync@rcs0.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4596/shard-iclb6/igt@prime_vgem@sync@rcs0.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][33] ([i915#658]) -> [SKIP][34] ([i915#588])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8506/shard-iclb6/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4596/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [FAIL][35] ([i915#454]) -> [SKIP][36] ([i915#468])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8506/shard-tglb7/igt@i915_pm_dc@dc6-dpms.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4596/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html

  * igt@kms_content_protection@atomic:
    - shard-apl:          [TIMEOUT][37] ([i915#1319]) -> [DMESG-FAIL][38] ([fdo#110321])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8506/shard-apl1/igt@kms_content_protection@atomic.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4596/shard-apl2/igt@kms_content_protection@atomic.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-kbl:          [DMESG-FAIL][39] ([i915#180] / [i915#95]) -> [FAIL][40] ([i915#1121] / [i915#93] / [i915#95])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8506/shard-kbl1/igt@kms_fbcon_fbt@fbc-suspend.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4596/shard-kbl4/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:
    - shard-kbl:          [FAIL][41] ([fdo#108145] / [i915#265]) -> [FAIL][42] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8506/shard-kbl1/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4596/shard-kbl3/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:
    - shard-kbl:          [FAIL][43] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95]) -> [FAIL][44] ([fdo#108145] / [i915#265])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8506/shard-kbl6/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4596/shard-kbl7/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html
    - shard-apl:          [FAIL][45] ([fdo#108145] / [i915#265] / [i915#95]) -> [FAIL][46] ([fdo#108145] / [i915#265])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8506/shard-apl4/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4596/shard-apl2/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [i915#1121]: https://gitlab.freedesktop.org/drm/intel/issues/1121
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#409]: https://gitlab.freedesktop.org/drm/intel/issues/409
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5661 -> IGTPW_4596
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8506: d6a73e9084ff6adfabbad014bc294d254484f304 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4596: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4596/index.html
  IGT_5661: a772a7c7a761c6125bc0af5284ad603478107737 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4596/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
