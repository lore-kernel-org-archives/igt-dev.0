Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 22 May 2020 01:44:53 -0000
Message-ID: <159011189361.3046.8696555260979688076@emeril.freedesktop.org>
References: <20200521083926.20428-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20200521083926.20428-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgQ2hhbmdl?=
 =?utf-8?q?_media_fill_to_be_libdrm-free_=28rev2=29?=
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
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Change media fill to be libdrm-free (rev2)
URL   : https://patchwork.freedesktop.org/series/77501/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8517_full -> IGTPW_4606_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4606/index.html

Known issues
------------

  Here are the changes found in IGTPW_4606_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_eio@in-flight-suspend:
    - shard-kbl:          [PASS][1] -> [DMESG-WARN][2] ([i915#180]) +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8517/shard-kbl7/igt@gem_eio@in-flight-suspend.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4606/shard-kbl2/igt@gem_eio@in-flight-suspend.html

  * igt@gem_fenced_exec_thrash@too-many-fences:
    - shard-snb:          [PASS][3] -> [INCOMPLETE][4] ([i915#82])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8517/shard-snb2/igt@gem_fenced_exec_thrash@too-many-fences.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4606/shard-snb6/igt@gem_fenced_exec_thrash@too-many-fences.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-onscreen:
    - shard-kbl:          [PASS][5] -> [FAIL][6] ([i915#54] / [i915#93] / [i915#95])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8517/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-128x128-onscreen.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4606/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-128x128-onscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-kbl:          [PASS][7] -> [INCOMPLETE][8] ([i915#155])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8517/shard-kbl6/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4606/shard-kbl1/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-glk:          [PASS][9] -> [FAIL][10] ([i915#72])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8517/shard-glk2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4606/shard-glk7/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@pipe-b-torture-move:
    - shard-snb:          [PASS][11] -> [DMESG-WARN][12] ([i915#128])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8517/shard-snb5/igt@kms_cursor_legacy@pipe-b-torture-move.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4606/shard-snb6/igt@kms_cursor_legacy@pipe-b-torture-move.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [PASS][13] -> [SKIP][14] ([fdo#109349])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8517/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4606/shard-iclb5/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled:
    - shard-kbl:          [PASS][15] -> [FAIL][16] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8517/shard-kbl7/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4606/shard-kbl4/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-apl:          [PASS][17] -> [DMESG-WARN][18] ([i915#180] / [i915#95])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8517/shard-apl3/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4606/shard-apl8/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_mmap_write_crc@main:
    - shard-kbl:          [PASS][19] -> [FAIL][20] ([i915#93] / [i915#95])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8517/shard-kbl4/igt@kms_mmap_write_crc@main.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4606/shard-kbl1/igt@kms_mmap_write_crc@main.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence:
    - shard-apl:          [PASS][21] -> [FAIL][22] ([i915#53] / [i915#95])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8517/shard-apl1/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4606/shard-apl7/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html
    - shard-kbl:          [PASS][23] -> [FAIL][24] ([i915#53] / [i915#93] / [i915#95])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8517/shard-kbl6/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4606/shard-kbl1/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-apl:          [PASS][25] -> [DMESG-WARN][26] ([i915#180]) +2 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8517/shard-apl8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4606/shard-apl8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid:
    - shard-kbl:          [PASS][27] -> [FAIL][28] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8517/shard-kbl3/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4606/shard-kbl4/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
    - shard-apl:          [PASS][29] -> [FAIL][30] ([fdo#108145] / [i915#265] / [i915#95])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8517/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4606/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [PASS][31] -> [SKIP][32] ([fdo#109642] / [fdo#111068])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8517/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4606/shard-iclb5/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [PASS][33] -> [SKIP][34] ([fdo#109441]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8517/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4606/shard-iclb7/igt@kms_psr@psr2_primary_page_flip.html

  
#### Possible fixes ####

  * igt@i915_suspend@sysfs-reader:
    - shard-kbl:          [INCOMPLETE][35] ([i915#155]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8517/shard-kbl3/igt@i915_suspend@sysfs-reader.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4606/shard-kbl6/igt@i915_suspend@sysfs-reader.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen:
    - shard-kbl:          [FAIL][37] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][38] +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8517/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4606/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html

  * {igt@kms_flip@flip-vs-suspend-interruptible@c-dp1}:
    - shard-apl:          [DMESG-WARN][39] ([i915#180]) -> [PASS][40] +11 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8517/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4606/shard-apl7/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html

  * {igt@kms_flip@flip-vs-suspend@b-dp1}:
    - shard-kbl:          [DMESG-WARN][41] ([i915#180]) -> [PASS][42] +3 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8517/shard-kbl2/igt@kms_flip@flip-vs-suspend@b-dp1.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4606/shard-kbl1/igt@kms_flip@flip-vs-suspend@b-dp1.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [SKIP][43] ([i915#433]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8517/shard-tglb6/igt@kms_hdmi_inject@inject-audio.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4606/shard-tglb8/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min:
    - shard-kbl:          [FAIL][45] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8517/shard-kbl7/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4606/shard-kbl7/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-7efc:
    - shard-apl:          [FAIL][47] ([fdo#108145] / [i915#265] / [i915#95]) -> [PASS][48] +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8517/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4606/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [FAIL][49] ([i915#173]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8517/shard-iclb1/igt@kms_psr@no_drrs.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4606/shard-iclb4/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [SKIP][51] ([fdo#109441]) -> [PASS][52] +3 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8517/shard-iclb7/igt@kms_psr@psr2_cursor_render.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4606/shard-iclb2/igt@kms_psr@psr2_cursor_render.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [FAIL][53] ([i915#454]) -> [SKIP][54] ([i915#468])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8517/shard-tglb7/igt@i915_pm_dc@dc6-dpms.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4606/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [DMESG-WARN][55] ([i915#180]) -> [FAIL][56] ([i915#53] / [i915#93] / [i915#95])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8517/shard-kbl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4606/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-7efc:
    - shard-apl:          [FAIL][57] ([fdo#108145] / [i915#265]) -> [FAIL][58] ([fdo#108145] / [i915#265] / [i915#95])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8517/shard-apl7/igt@kms_plane_alpha_blend@pipe-b-alpha-7efc.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4606/shard-apl1/igt@kms_plane_alpha_blend@pipe-b-alpha-7efc.html
    - shard-kbl:          [FAIL][59] ([fdo#108145] / [i915#265]) -> [FAIL][60] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8517/shard-kbl2/igt@kms_plane_alpha_blend@pipe-b-alpha-7efc.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4606/shard-kbl7/igt@kms_plane_alpha_blend@pipe-b-alpha-7efc.html

  * igt@kms_psr2_su@page_flip:
    - shard-tglb:         [FAIL][61] ([i915#608]) -> [SKIP][62] ([i915#1911])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8517/shard-tglb7/igt@kms_psr2_su@page_flip.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4606/shard-tglb8/igt@kms_psr2_su@page_flip.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [i915#128]: https://gitlab.freedesktop.org/drm/intel/issues/128
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1911]: https://gitlab.freedesktop.org/drm/intel/issues/1911
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#53]: https://gitlab.freedesktop.org/drm/intel/issues/53
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#608]: https://gitlab.freedesktop.org/drm/intel/issues/608
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
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
  * IGT: IGT_5666 -> IGTPW_4606
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8517: 7c5c05e694bf83e9d4ef64172ef6c9d55aa334a5 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4606: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4606/index.html
  IGT_5666: dfa3b1fdc9813a48314a43faaacb7dacc06112d6 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4606/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
