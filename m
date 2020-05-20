Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 20 May 2020 06:17:44 -0000
Message-ID: <158995546447.30688.3578844498955556082@emeril.freedesktop.org>
References: <20200519190257.16709-1-ashutosh.dixit@intel.com>
In-Reply-To: <20200519190257.16709-1-ashutosh.dixit@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Ftiled=5Fwb=3A_skip_on_devices_without_mappable_aperture?=
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

Series: i915/gem_tiled_wb: skip on devices without mappable aperture
URL   : https://patchwork.freedesktop.org/series/77432/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8506_full -> IGTPW_4593_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4593_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4593_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4593/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4593_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_fbcon_fbt@psr:
    - shard-tglb:         [PASS][1] -> [FAIL][2] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8506/shard-tglb2/igt@kms_fbcon_fbt@psr.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4593/shard-tglb1/igt@kms_fbcon_fbt@psr.html

  * igt@runner@aborted:
    - shard-tglb:         NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4593/shard-tglb6/igt@runner@aborted.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [FAIL][4] ([i915#454]) -> [FAIL][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8506/shard-tglb3/igt@i915_pm_dc@dc6-psr.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4593/shard-tglb7/igt@i915_pm_dc@dc6-psr.html

  
Known issues
------------

  Here are the changes found in IGTPW_4593_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_softpin@noreloc-s3:
    - shard-tglb:         [PASS][6] -> [INCOMPLETE][7] ([i915#1602] / [i915#456])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8506/shard-tglb1/igt@gem_softpin@noreloc-s3.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4593/shard-tglb6/igt@gem_softpin@noreloc-s3.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-kbl:          [PASS][8] -> [DMESG-WARN][9] ([i915#180])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8506/shard-kbl7/igt@gem_workarounds@suspend-resume-fd.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4593/shard-kbl6/igt@gem_workarounds@suspend-resume-fd.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][10] -> [FAIL][11] ([i915#1899]) +1 similar issue
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8506/shard-iclb3/igt@i915_pm_dc@dc6-psr.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4593/shard-iclb1/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen:
    - shard-kbl:          [PASS][12] -> [FAIL][13] ([i915#54] / [i915#93] / [i915#95])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8506/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4593/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic:
    - shard-kbl:          [PASS][14] -> [FAIL][15] ([i915#1566] / [i915#93] / [i915#95])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8506/shard-kbl7/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4593/shard-kbl2/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html

  * igt@kms_flip_tiling@flip-changes-tiling-y:
    - shard-apl:          [PASS][16] -> [FAIL][17] ([i915#95])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8506/shard-apl4/igt@kms_flip_tiling@flip-changes-tiling-y.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4593/shard-apl4/igt@kms_flip_tiling@flip-changes-tiling-y.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [PASS][18] -> [SKIP][19] ([fdo#109441]) +2 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8506/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4593/shard-iclb1/igt@kms_psr@psr2_primary_page_flip.html

  
#### Possible fixes ####

  * igt@gen9_exec_parse@allowed-all:
    - shard-apl:          [DMESG-WARN][20] ([i915#1436] / [i915#716]) -> [PASS][21]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8506/shard-apl6/igt@gen9_exec_parse@allowed-all.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4593/shard-apl1/igt@gen9_exec_parse@allowed-all.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen:
    - shard-kbl:          [FAIL][22] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][23]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8506/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4593/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled:
    - shard-kbl:          [FAIL][24] ([fdo#108145] / [i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95]) -> [PASS][25]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8506/shard-kbl2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4593/shard-kbl4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
    - shard-apl:          [FAIL][26] ([fdo#108145] / [i915#52] / [i915#54] / [i915#95]) -> [PASS][27]
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8506/shard-apl7/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4593/shard-apl6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html

  * {igt@kms_flip@flip-vs-suspend-interruptible@c-dp1}:
    - shard-apl:          [DMESG-WARN][28] ([i915#180]) -> [PASS][29]
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8506/shard-apl4/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4593/shard-apl4/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html

  * {igt@kms_flip@flip-vs-suspend@a-dp1}:
    - shard-kbl:          [DMESG-WARN][30] ([i915#180]) -> [PASS][31] +4 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8506/shard-kbl1/igt@kms_flip@flip-vs-suspend@a-dp1.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4593/shard-kbl2/igt@kms_flip@flip-vs-suspend@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-snb:          [SKIP][32] ([fdo#109271]) -> [PASS][33]
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8506/shard-snb1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-cpu.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4593/shard-snb4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-7efc:
    - shard-apl:          [FAIL][34] ([fdo#108145] / [i915#265] / [i915#95]) -> [PASS][35]
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8506/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4593/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [SKIP][36] ([fdo#109441]) -> [PASS][37] +1 similar issue
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8506/shard-iclb7/igt@kms_psr@psr2_no_drrs.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4593/shard-iclb2/igt@kms_psr@psr2_no_drrs.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][38] ([i915#31]) -> [PASS][39]
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8506/shard-apl6/igt@kms_setmode@basic.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4593/shard-apl8/igt@kms_setmode@basic.html
    - shard-kbl:          [FAIL][40] ([i915#31]) -> [PASS][41]
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8506/shard-kbl6/igt@kms_setmode@basic.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4593/shard-kbl2/igt@kms_setmode@basic.html

  * {igt@prime_vgem@sync@rcs0}:
    - shard-iclb:         [INCOMPLETE][42] ([i915#409]) -> [PASS][43]
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8506/shard-iclb8/igt@prime_vgem@sync@rcs0.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4593/shard-iclb6/igt@prime_vgem@sync@rcs0.html

  
#### Warnings ####

  * igt@kms_content_protection@lic:
    - shard-apl:          [FAIL][44] ([fdo#110321]) -> [FAIL][45] ([fdo#110321] / [i915#95])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8506/shard-apl6/igt@kms_content_protection@lic.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4593/shard-apl2/igt@kms_content_protection@lic.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-kbl:          [DMESG-FAIL][46] ([i915#180] / [i915#95]) -> [FAIL][47] ([i915#1121] / [i915#93] / [i915#95])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8506/shard-kbl1/igt@kms_fbcon_fbt@fbc-suspend.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4593/shard-kbl2/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
    - shard-apl:          [FAIL][48] ([fdo#108145] / [i915#265]) -> [FAIL][49] ([fdo#108145] / [i915#265] / [i915#95])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8506/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4593/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:
    - shard-kbl:          [FAIL][50] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95]) -> [FAIL][51] ([fdo#108145] / [i915#265])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8506/shard-kbl6/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4593/shard-kbl7/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html
    - shard-apl:          [FAIL][52] ([fdo#108145] / [i915#265] / [i915#95]) -> [FAIL][53] ([fdo#108145] / [i915#265])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8506/shard-apl4/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4593/shard-apl7/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [i915#1121]: https://gitlab.freedesktop.org/drm/intel/issues/1121
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1566]: https://gitlab.freedesktop.org/drm/intel/issues/1566
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1899]: https://gitlab.freedesktop.org/drm/intel/issues/1899
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#409]: https://gitlab.freedesktop.org/drm/intel/issues/409
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
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
  * IGT: IGT_5661 -> IGTPW_4593
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8506: d6a73e9084ff6adfabbad014bc294d254484f304 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4593: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4593/index.html
  IGT_5661: a772a7c7a761c6125bc0af5284ad603478107737 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4593/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
