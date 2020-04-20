Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 20 Apr 2020 03:57:43 -0000
Message-ID: <158735506303.29873.8546951844073944577@emeril.freedesktop.org>
References: <20200419104819.349537-1-lionel.g.landwerlin@intel.com>
In-Reply-To: <20200419104819.349537-1-lionel.g.landwerlin@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?perf=3A_fix_global-sseu-config-invalid_for_Gen11?=
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
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/perf: fix global-sseu-config-invalid for Gen11
URL   : https://patchwork.freedesktop.org/series/76159/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8323_full -> IGTPW_4486_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4486/index.html

Known issues
------------

  Here are the changes found in IGTPW_4486_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-glk:          [PASS][1] -> [INCOMPLETE][2] ([i915#58] / [k.org#198133])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8323/shard-glk5/igt@i915_module_load@reload-with-fault-injection.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4486/shard-glk9/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_suspend@sysfs-reader:
    - shard-kbl:          [PASS][3] -> [DMESG-WARN][4] ([i915#180]) +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8323/shard-kbl7/igt@i915_suspend@sysfs-reader.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4486/shard-kbl6/igt@i915_suspend@sysfs-reader.html

  * igt@kms_big_fb@linear-32bpp-rotate-0:
    - shard-kbl:          [PASS][5] -> [FAIL][6] ([i915#1119] / [i915#93] / [i915#95])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8323/shard-kbl7/igt@kms_big_fb@linear-32bpp-rotate-0.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4486/shard-kbl1/igt@kms_big_fb@linear-32bpp-rotate-0.html
    - shard-apl:          [PASS][7] -> [FAIL][8] ([i915#1119] / [i915#95])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8323/shard-apl2/igt@kms_big_fb@linear-32bpp-rotate-0.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4486/shard-apl4/igt@kms_big_fb@linear-32bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-random:
    - shard-apl:          [PASS][9] -> [FAIL][10] ([i915#54] / [i915#95]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8323/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4486/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-random:
    - shard-kbl:          [PASS][11] -> [FAIL][12] ([i915#54] / [i915#93] / [i915#95]) +4 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8323/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4486/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy:
    - shard-kbl:          [PASS][13] -> [FAIL][14] ([i915#1566] / [i915#93] / [i915#95])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8323/shard-kbl7/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4486/shard-kbl3/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled:
    - shard-glk:          [PASS][15] -> [FAIL][16] ([i915#177] / [i915#52] / [i915#54])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8323/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4486/shard-glk5/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html

  * igt@kms_draw_crc@draw-method-rgb565-render-ytiled:
    - shard-glk:          [PASS][17] -> [FAIL][18] ([i915#52] / [i915#54]) +2 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8323/shard-glk5/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4486/shard-glk5/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled:
    - shard-kbl:          [PASS][19] -> [FAIL][20] ([fdo#108145] / [i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8323/shard-kbl4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4486/shard-kbl4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
    - shard-apl:          [PASS][21] -> [FAIL][22] ([fdo#108145] / [i915#52] / [i915#54] / [i915#95])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8323/shard-apl1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4486/shard-apl3/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled:
    - shard-kbl:          [PASS][23] -> [FAIL][24] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8323/shard-kbl1/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4486/shard-kbl6/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
    - shard-apl:          [PASS][25] -> [FAIL][26] ([i915#52] / [i915#54] / [i915#95])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8323/shard-apl7/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4486/shard-apl2/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-apl:          [PASS][27] -> [DMESG-WARN][28] ([i915#180])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8323/shard-apl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4486/shard-apl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid:
    - shard-kbl:          [PASS][29] -> [FAIL][30] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8323/shard-kbl7/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4486/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
    - shard-apl:          [PASS][31] -> [FAIL][32] ([fdo#108145] / [i915#265] / [i915#95])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8323/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4486/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html

  * igt@kms_psr@psr2_sprite_blt:
    - shard-iclb:         [PASS][33] -> [SKIP][34] ([fdo#109441])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8323/shard-iclb2/igt@kms_psr@psr2_sprite_blt.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4486/shard-iclb1/igt@kms_psr@psr2_sprite_blt.html

  
#### Possible fixes ####

  * igt@gem_workarounds@suspend-resume-context:
    - shard-tglb:         [INCOMPLETE][35] ([i915#456]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8323/shard-tglb1/igt@gem_workarounds@suspend-resume-context.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4486/shard-tglb2/igt@gem_workarounds@suspend-resume-context.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-apl:          [INCOMPLETE][37] -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8323/shard-apl2/igt@i915_module_load@reload-with-fault-injection.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4486/shard-apl8/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress:
    - shard-kbl:          [TIMEOUT][39] ([i915#1288]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8323/shard-kbl6/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4486/shard-kbl1/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
    - shard-apl:          [TIMEOUT][41] ([i915#1288]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8323/shard-apl8/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4486/shard-apl3/igt@i915_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen:
    - shard-kbl:          [FAIL][43] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][44] +3 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8323/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4486/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque:
    - shard-apl:          [FAIL][45] ([i915#54]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8323/shard-apl8/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4486/shard-apl3/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html
    - shard-kbl:          [FAIL][47] ([i915#54]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8323/shard-kbl3/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4486/shard-kbl1/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - shard-hsw:          [FAIL][49] ([i915#57]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8323/shard-hsw1/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4486/shard-hsw6/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled:
    - shard-glk:          [FAIL][51] ([i915#52] / [i915#54]) -> [PASS][52] +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8323/shard-glk7/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4486/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled.html

  * {igt@kms_flip@flip-vs-suspend@a-dp1}:
    - shard-kbl:          [DMESG-WARN][53] ([i915#180]) -> [PASS][54] +2 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8323/shard-kbl4/igt@kms_flip@flip-vs-suspend@a-dp1.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4486/shard-kbl2/igt@kms_flip@flip-vs-suspend@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [INCOMPLETE][55] ([i915#155]) -> [PASS][56] +2 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8323/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4486/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-apl:          [DMESG-WARN][57] ([i915#180]) -> [PASS][58] +2 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8323/shard-apl2/igt@kms_hdr@bpc-switch-suspend.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4486/shard-apl4/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-b-frame-sequence:
    - shard-snb:          [SKIP][59] ([fdo#109271]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8323/shard-snb5/igt@kms_pipe_crc_basic@read-crc-pipe-b-frame-sequence.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4486/shard-snb2/igt@kms_pipe_crc_basic@read-crc-pipe-b-frame-sequence.html

  * igt@kms_plane_multiple@atomic-pipe-a-tiling-y:
    - shard-apl:          [FAIL][61] ([i915#95]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8323/shard-apl6/igt@kms_plane_multiple@atomic-pipe-a-tiling-y.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4486/shard-apl1/igt@kms_plane_multiple@atomic-pipe-a-tiling-y.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [SKIP][63] ([fdo#109441]) -> [PASS][64] +2 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8323/shard-iclb1/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4486/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * {igt@perf@global-sseu-config-invalid}:
    - shard-iclb:         [FAIL][65] ([i915#1543]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8323/shard-iclb2/igt@perf@global-sseu-config-invalid.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4486/shard-iclb7/igt@perf@global-sseu-config-invalid.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [FAIL][67] ([i915#454]) -> [SKIP][68] ([i915#468])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8323/shard-tglb6/igt@i915_pm_dc@dc6-psr.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4486/shard-tglb2/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@gem-execbuf-stress:
    - shard-snb:          [SKIP][69] ([fdo#109271]) -> [INCOMPLETE][70] ([i915#82])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8323/shard-snb6/igt@i915_pm_rpm@gem-execbuf-stress.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4486/shard-snb4/igt@i915_pm_rpm@gem-execbuf-stress.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:
    - shard-kbl:          [FAIL][71] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95]) -> [FAIL][72] ([fdo#108145] / [i915#265])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8323/shard-kbl6/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4486/shard-kbl2/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-basic:
    - shard-kbl:          [FAIL][73] ([fdo#108145] / [i915#265]) -> [FAIL][74] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8323/shard-kbl3/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4486/shard-kbl6/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [FAIL][75] ([i915#608]) -> [SKIP][76] ([fdo#109642] / [fdo#111068])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8323/shard-iclb2/igt@kms_psr2_su@page_flip.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4486/shard-iclb6/igt@kms_psr2_su@page_flip.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#1288]: https://gitlab.freedesktop.org/drm/intel/issues/1288
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1543]: https://gitlab.freedesktop.org/drm/intel/issues/1543
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1566]: https://gitlab.freedesktop.org/drm/intel/issues/1566
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#57]: https://gitlab.freedesktop.org/drm/intel/issues/57
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#608]: https://gitlab.freedesktop.org/drm/intel/issues/608
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5599 -> IGTPW_4486
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8323: 65545bfa1e4f92bb86462bf7226b8a33d13715a1 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4486: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4486/index.html
  IGT_5599: cdb07101dda33e2fcb0f4c2aa199c47159d88f35 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4486/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
