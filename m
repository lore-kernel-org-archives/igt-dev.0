Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 07 May 2020 12:42:16 -0000
Message-ID: <158885533600.2191.9013817614514153231@emeril.freedesktop.org>
References: <20200507084550.656091-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200507084550.656091-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgbGliL2k5?=
 =?utf-8?q?15=3A_Split_igt=5Frequire=5Fgem=28=29_into_i915/_=28rev2=29?=
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

Series: lib/i915: Split igt_require_gem() into i915/ (rev2)
URL   : https://patchwork.freedesktop.org/series/76950/
State : success

== Summary ==

CI Bug Log - changes from IGT_5638_full -> IGTPW_4541_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4541/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4541_full:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@prime_busy@hang-wait@rcs0}:
    - shard-tglb:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5638/shard-tglb7/igt@prime_busy@hang-wait@rcs0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4541/shard-tglb6/igt@prime_busy@hang-wait@rcs0.html

  
Known issues
------------

  Here are the changes found in IGTPW_4541_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@legacy-engines-mixed-process@render:
    - shard-apl:          [PASS][3] -> [FAIL][4] ([i915#1528])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5638/shard-apl4/igt@gem_ctx_persistence@legacy-engines-mixed-process@render.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4541/shard-apl8/igt@gem_ctx_persistence@legacy-engines-mixed-process@render.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-hsw:          [PASS][5] -> [INCOMPLETE][6] ([i915#61])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5638/shard-hsw2/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4541/shard-hsw7/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:
    - shard-kbl:          [PASS][7] -> [DMESG-WARN][8] ([i915#180]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5638/shard-kbl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4541/shard-kbl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant:
    - shard-kbl:          [PASS][9] -> [FAIL][10] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5638/shard-kbl7/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4541/shard-kbl1/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
    - shard-apl:          [PASS][11] -> [FAIL][12] ([fdo#108145] / [i915#265] / [i915#95])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5638/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4541/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [PASS][13] -> [FAIL][14] ([i915#899])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5638/shard-glk9/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4541/shard-glk2/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [PASS][15] -> [FAIL][16] ([i915#173])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5638/shard-iclb3/igt@kms_psr@no_drrs.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4541/shard-iclb1/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][17] -> [SKIP][18] ([fdo#109441]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5638/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4541/shard-iclb6/igt@kms_psr@psr2_sprite_plane_move.html

  
#### Possible fixes ####

  * {igt@gem_ctx_isolation@preservation-s3@rcs0}:
    - shard-apl:          [DMESG-WARN][19] ([i915#180]) -> [PASS][20] +3 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5638/shard-apl6/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4541/shard-apl8/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@kms_big_fb@linear-32bpp-rotate-0:
    - shard-kbl:          [FAIL][21] ([i915#1119] / [i915#93] / [i915#95]) -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5638/shard-kbl6/igt@kms_big_fb@linear-32bpp-rotate-0.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4541/shard-kbl6/igt@kms_big_fb@linear-32bpp-rotate-0.html
    - shard-apl:          [FAIL][23] ([i915#1119] / [i915#95]) -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5638/shard-apl2/igt@kms_big_fb@linear-32bpp-rotate-0.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4541/shard-apl1/igt@kms_big_fb@linear-32bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - shard-kbl:          [FAIL][25] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][26] +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5638/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4541/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [FAIL][27] ([i915#72]) -> [PASS][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5638/shard-glk8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4541/shard-glk1/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled:
    - shard-kbl:          [FAIL][29] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5638/shard-kbl1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4541/shard-kbl7/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
    - shard-apl:          [FAIL][31] ([i915#52] / [i915#54] / [i915#95]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5638/shard-apl6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4541/shard-apl2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [SKIP][33] ([fdo#109441]) -> [PASS][34] +2 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5638/shard-iclb5/igt@kms_psr@psr2_primary_mmap_cpu.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4541/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_vblank@pipe-c-ts-continuation-suspend:
    - shard-kbl:          [INCOMPLETE][35] ([i915#155] / [i915#794]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5638/shard-kbl4/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4541/shard-kbl6/igt@kms_vblank@pipe-c-ts-continuation-suspend.html

  * {igt@perf@blocking-parameterized}:
    - shard-iclb:         [FAIL][37] ([i915#1542]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5638/shard-iclb8/igt@perf@blocking-parameterized.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4541/shard-iclb7/igt@perf@blocking-parameterized.html

  
#### Warnings ####

  * igt@i915_pm_rpm@gem-idle:
    - shard-snb:          [INCOMPLETE][39] ([i915#82]) -> [SKIP][40] ([fdo#109271])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5638/shard-snb5/igt@i915_pm_rpm@gem-idle.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4541/shard-snb5/igt@i915_pm_rpm@gem-idle.html

  * igt@kms_content_protection@atomic:
    - shard-apl:          [TIMEOUT][41] ([i915#1319]) -> [FAIL][42] ([fdo#110321] / [fdo#110336])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5638/shard-apl6/igt@kms_content_protection@atomic.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4541/shard-apl4/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          [FAIL][43] ([fdo#110321] / [fdo#110336]) -> [TIMEOUT][44] ([i915#1319])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5638/shard-apl4/igt@kms_content_protection@atomic-dpms.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4541/shard-apl7/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@srm:
    - shard-apl:          [FAIL][45] ([fdo#110321] / [i915#95]) -> [TIMEOUT][46] ([i915#1319])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5638/shard-apl1/igt@kms_content_protection@srm.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4541/shard-apl2/igt@kms_content_protection@srm.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
    - shard-apl:          [FAIL][47] ([fdo#108145] / [i915#265] / [i915#95]) -> [FAIL][48] ([fdo#108145] / [i915#265])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5638/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4541/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
    - shard-kbl:          [FAIL][49] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95]) -> [FAIL][50] ([fdo#108145] / [i915#265])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5638/shard-kbl1/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4541/shard-kbl2/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [SKIP][51] ([fdo#109642] / [fdo#111068]) -> [FAIL][52] ([i915#608])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5638/shard-iclb1/igt@kms_psr2_su@page_flip.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4541/shard-iclb2/igt@kms_psr2_su@page_flip.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1528]: https://gitlab.freedesktop.org/drm/intel/issues/1528
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#608]: https://gitlab.freedesktop.org/drm/intel/issues/608
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#794]: https://gitlab.freedesktop.org/drm/intel/issues/794
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5638 -> IGTPW_4541

  CI-20190529: 20190529
  CI_DRM_8441: 6c0ee41a7c3201ef2a89800234803a95f65989be @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4541: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4541/index.html
  IGT_5638: 50868ab3c532a86aa147fb555b69a1078c572b13 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4541/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
