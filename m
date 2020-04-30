Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 30 Apr 2020 19:49:06 -0000
Message-ID: <158827614625.31921.15507893683123913383@emeril.freedesktop.org>
References: <20200430103612.12579-1-arjun.melkaveri@intel.com>
In-Reply-To: <20200430103612.12579-1-arjun.melkaveri@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fsync=3ACorrected_legacy_Dynamic_test_case_name?=
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
To: Arjun Melkaveri <arjun.melkaveri@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: i915/gem_sync:Corrected legacy Dynamic test case name
URL   : https://patchwork.freedesktop.org/series/76770/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8401_full -> IGTPW_4519_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4519/index.html

Known issues
------------

  Here are the changes found in IGTPW_4519_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_params@invalid-bsd-ring:
    - shard-iclb:         [PASS][1] -> [SKIP][2] ([fdo#109276])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8401/shard-iclb1/igt@gem_exec_params@invalid-bsd-ring.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4519/shard-iclb3/igt@gem_exec_params@invalid-bsd-ring.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-kbl:          [PASS][3] -> [DMESG-WARN][4] ([i915#180]) +3 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8401/shard-kbl3/igt@gem_workarounds@suspend-resume-fd.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4519/shard-kbl6/igt@gem_workarounds@suspend-resume-fd.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen:
    - shard-kbl:          [PASS][5] -> [FAIL][6] ([i915#54] / [i915#93] / [i915#95])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8401/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4519/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled:
    - shard-glk:          [PASS][7] -> [FAIL][8] ([i915#177] / [i915#52] / [i915#54])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8401/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4519/shard-glk4/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html

  * igt@kms_draw_crc@draw-method-rgb565-render-ytiled:
    - shard-glk:          [PASS][9] -> [FAIL][10] ([i915#52] / [i915#54]) +2 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8401/shard-glk4/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4519/shard-glk1/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled:
    - shard-kbl:          [PASS][11] -> [FAIL][12] ([fdo#108145] / [i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8401/shard-kbl1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4519/shard-kbl6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
    - shard-apl:          [PASS][13] -> [FAIL][14] ([fdo#108145] / [i915#52] / [i915#54] / [i915#95])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8401/shard-apl3/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4519/shard-apl1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html

  * igt@kms_flip_tiling@flip-changes-tiling:
    - shard-apl:          [PASS][15] -> [FAIL][16] ([i915#95]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8401/shard-apl8/igt@kms_flip_tiling@flip-changes-tiling.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4519/shard-apl4/igt@kms_flip_tiling@flip-changes-tiling.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-apl:          [PASS][17] -> [DMESG-WARN][18] ([i915#180] / [i915#95])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8401/shard-apl7/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4519/shard-apl6/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min:
    - shard-kbl:          [PASS][19] -> [FAIL][20] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8401/shard-kbl2/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4519/shard-kbl2/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
    - shard-apl:          [PASS][21] -> [FAIL][22] ([fdo#108145] / [i915#265] / [i915#95])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8401/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4519/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-256:
    - shard-kbl:          [PASS][23] -> [FAIL][24] ([i915#1559] / [i915#93] / [i915#95])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8401/shard-kbl6/igt@kms_plane_cursor@pipe-a-overlay-size-256.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4519/shard-kbl1/igt@kms_plane_cursor@pipe-a-overlay-size-256.html
    - shard-apl:          [PASS][25] -> [FAIL][26] ([i915#1559] / [i915#95])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8401/shard-apl3/igt@kms_plane_cursor@pipe-a-overlay-size-256.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4519/shard-apl1/igt@kms_plane_cursor@pipe-a-overlay-size-256.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [PASS][27] -> [SKIP][28] ([fdo#109642] / [fdo#111068])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8401/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4519/shard-iclb8/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_basic:
    - shard-iclb:         [PASS][29] -> [SKIP][30] ([fdo#109441]) +2 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8401/shard-iclb2/igt@kms_psr@psr2_basic.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4519/shard-iclb1/igt@kms_psr@psr2_basic.html

  
#### Possible fixes ####

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][31] ([i915#454]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8401/shard-iclb4/igt@i915_pm_dc@dc6-psr.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4519/shard-iclb5/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen:
    - shard-kbl:          [FAIL][33] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][34] +3 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8401/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4519/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][35] ([i915#180]) -> [PASS][36] +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8401/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4519/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_draw_crc@draw-method-rgb565-blt-ytiled:
    - shard-glk:          [FAIL][37] ([i915#52] / [i915#54]) -> [PASS][38] +2 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8401/shard-glk6/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4519/shard-glk1/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html

  * {igt@kms_flip@flip-vs-suspend-interruptible@c-dp1}:
    - shard-apl:          [DMESG-WARN][39] ([i915#180]) -> [PASS][40] +3 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8401/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4519/shard-apl7/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:
    - shard-glk:          [FAIL][41] ([i915#49]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8401/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4519/shard-glk4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-256:
    - shard-apl:          [FAIL][43] ([i915#1559] / [i915#95]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8401/shard-apl4/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4519/shard-apl1/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
    - shard-kbl:          [FAIL][45] ([i915#1559] / [i915#93] / [i915#95]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8401/shard-kbl4/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4519/shard-kbl1/igt@kms_plane_cursor@pipe-a-viewport-size-256.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [FAIL][47] ([i915#173]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8401/shard-iclb1/igt@kms_psr@no_drrs.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4519/shard-iclb6/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [SKIP][49] ([fdo#109441]) -> [PASS][50] +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8401/shard-iclb5/igt@kms_psr@psr2_primary_mmap_cpu.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4519/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html

  
#### Warnings ####

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [FAIL][51] ([i915#95]) -> [FAIL][52] ([i915#1525] / [i915#95])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8401/shard-apl8/igt@kms_fbcon_fbt@fbc-suspend.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4519/shard-apl7/igt@kms_fbcon_fbt@fbc-suspend.html
    - shard-kbl:          [FAIL][53] ([i915#93] / [i915#95]) -> [FAIL][54] ([i915#64] / [i915#93] / [i915#95])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8401/shard-kbl3/igt@kms_fbcon_fbt@fbc-suspend.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4519/shard-kbl2/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-7efc:
    - shard-kbl:          [FAIL][55] ([fdo#108145] / [i915#265]) -> [FAIL][56] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8401/shard-kbl1/igt@kms_plane_alpha_blend@pipe-b-alpha-7efc.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4519/shard-kbl7/igt@kms_plane_alpha_blend@pipe-b-alpha-7efc.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [i915#1525]: https://gitlab.freedesktop.org/drm/intel/issues/1525
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#64]: https://gitlab.freedesktop.org/drm/intel/issues/64
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5617 -> IGTPW_4519
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8401: 41fac0e3809be301af095c66e717eb9843b80212 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4519: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4519/index.html
  IGT_5617: 807b26292a3f21057ef7865a4028d22c512590df @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4519/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
