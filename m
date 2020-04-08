Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 08 Apr 2020 10:12:59 -0000
Message-ID: <158634077918.19348.15096365833753701579@emeril.freedesktop.org>
References: <20200407220435.217727-1-andi@etezian.org>
In-Reply-To: <20200407220435.217727-1-andi@etezian.org>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915=5Fpm=5Fsseu=3A_remove_broken_test?=
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
To: Andi Shyti <andi@etezian.org>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/i915_pm_sseu: remove broken test
URL   : https://patchwork.freedesktop.org/series/75645/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8270_full -> IGTPW_4429_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4429/index.html

Known issues
------------

  Here are the changes found in IGTPW_4429_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-apl:          [PASS][1] -> [FAIL][2] ([i915#1119] / [i915#95])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8270/shard-apl2/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4429/shard-apl8/igt@kms_big_fb@linear-32bpp-rotate-180.html
    - shard-kbl:          [PASS][3] -> [FAIL][4] ([i915#1119] / [i915#93] / [i915#95])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8270/shard-kbl3/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4429/shard-kbl7/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen:
    - shard-kbl:          [PASS][5] -> [FAIL][6] ([i915#54] / [i915#93] / [i915#95]) +3 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8270/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4429/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding:
    - shard-apl:          [PASS][7] -> [FAIL][8] ([i915#54] / [i915#95]) +2 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8270/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4429/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [PASS][9] -> [DMESG-WARN][10] ([i915#180]) +5 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8270/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4429/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-hsw:          [PASS][11] -> [SKIP][12] ([fdo#109271])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8270/shard-hsw8/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4429/shard-hsw5/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_draw_crc@draw-method-rgb565-render-untiled:
    - shard-glk:          [PASS][13] -> [FAIL][14] ([i915#52] / [i915#54]) +2 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8270/shard-glk6/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4429/shard-glk2/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [PASS][15] -> [FAIL][16] ([i915#1525] / [i915#95])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8270/shard-apl4/igt@kms_fbcon_fbt@fbc-suspend.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4429/shard-apl6/igt@kms_fbcon_fbt@fbc-suspend.html
    - shard-kbl:          [PASS][17] -> [FAIL][18] ([i915#64] / [i915#93] / [i915#95])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8270/shard-kbl2/igt@kms_fbcon_fbt@fbc-suspend.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4429/shard-kbl6/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-apl:          [PASS][19] -> [DMESG-WARN][20] ([i915#180]) +2 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8270/shard-apl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4429/shard-apl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-128:
    - shard-kbl:          [PASS][21] -> [FAIL][22] ([i915#1559] / [i915#93] / [i915#95])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8270/shard-kbl4/igt@kms_plane_cursor@pipe-a-viewport-size-128.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4429/shard-kbl7/igt@kms_plane_cursor@pipe-a-viewport-size-128.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [PASS][23] -> [FAIL][24] ([i915#899]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8270/shard-glk5/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4429/shard-glk9/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [PASS][25] -> [SKIP][26] ([fdo#109441]) +2 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8270/shard-iclb2/igt@kms_psr@psr2_no_drrs.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4429/shard-iclb8/igt@kms_psr@psr2_no_drrs.html

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [PASS][27] -> [FAIL][28] ([i915#1085])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8270/shard-tglb7/igt@perf@gen12-mi-rpc.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4429/shard-tglb6/igt@perf@gen12-mi-rpc.html

  
#### Possible fixes ####

  * {igt@gem_wait@write-busy@all}:
    - shard-glk:          [FAIL][29] ([i915#1604]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8270/shard-glk2/igt@gem_wait@write-busy@all.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4429/shard-glk1/igt@gem_wait@write-busy@all.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-snb:          [FAIL][31] ([i915#1066]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8270/shard-snb5/igt@i915_pm_rc6_residency@rc6-idle.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4429/shard-snb6/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rpm@fences:
    - shard-tglb:         [SKIP][33] ([i915#1316] / [i915#579]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8270/shard-tglb6/igt@i915_pm_rpm@fences.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4429/shard-tglb1/igt@i915_pm_rpm@fences.html
    - shard-iclb:         [SKIP][35] ([i915#1316] / [i915#579]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8270/shard-iclb7/igt@i915_pm_rpm@fences.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4429/shard-iclb1/igt@i915_pm_rpm@fences.html
    - shard-hsw:          [SKIP][37] ([fdo#109271]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8270/shard-hsw4/igt@i915_pm_rpm@fences.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4429/shard-hsw4/igt@i915_pm_rpm@fences.html
    - shard-glk:          [SKIP][39] ([fdo#109271]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8270/shard-glk7/igt@i915_pm_rpm@fences.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4429/shard-glk6/igt@i915_pm_rpm@fences.html

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - shard-hsw:          [FAIL][41] ([i915#57]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8270/shard-hsw6/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4429/shard-hsw7/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  * igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic:
    - shard-glk:          [FAIL][43] ([i915#67]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8270/shard-glk2/igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4429/shard-glk3/igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled:
    - shard-glk:          [FAIL][45] ([i915#52] / [i915#54]) -> [PASS][46] +3 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8270/shard-glk8/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4429/shard-glk1/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled:
    - shard-glk:          [FAIL][47] ([i915#177] / [i915#52] / [i915#54]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8270/shard-glk5/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4429/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html

  * igt@kms_draw_crc@fill-fb:
    - shard-apl:          [FAIL][49] ([i915#95]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8270/shard-apl3/igt@kms_draw_crc@fill-fb.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4429/shard-apl3/igt@kms_draw_crc@fill-fb.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-glk:          [FAIL][51] ([i915#79]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8270/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4429/shard-glk7/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-hsw:          [INCOMPLETE][53] ([i915#61]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8270/shard-hsw4/igt@kms_flip@flip-vs-suspend.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4429/shard-hsw7/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-snb:          [SKIP][55] ([fdo#109271]) -> [PASS][56] +3 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8270/shard-snb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4429/shard-snb7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-256:
    - shard-apl:          [FAIL][57] ([i915#1559] / [i915#95]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8270/shard-apl7/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4429/shard-apl3/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
    - shard-kbl:          [FAIL][59] ([i915#1559] / [i915#93] / [i915#95]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8270/shard-kbl6/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4429/shard-kbl4/igt@kms_plane_cursor@pipe-a-viewport-size-256.html

  * igt@kms_psr@psr2_primary_render:
    - shard-iclb:         [SKIP][61] ([fdo#109441]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8270/shard-iclb8/igt@kms_psr@psr2_primary_render.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4429/shard-iclb2/igt@kms_psr@psr2_primary_render.html

  * igt@kms_vblank@pipe-b-ts-continuation-suspend:
    - shard-kbl:          [DMESG-WARN][63] ([i915#180]) -> [PASS][64] +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8270/shard-kbl3/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4429/shard-kbl2/igt@kms_vblank@pipe-b-ts-continuation-suspend.html

  * {igt@perf@blocking-parameterized}:
    - shard-kbl:          [FAIL][65] ([i915#1542]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8270/shard-kbl3/igt@perf@blocking-parameterized.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4429/shard-kbl2/igt@perf@blocking-parameterized.html
    - shard-iclb:         [FAIL][67] ([i915#1542]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8270/shard-iclb5/igt@perf@blocking-parameterized.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4429/shard-iclb8/igt@perf@blocking-parameterized.html

  * {igt@perf@polling-parameterized}:
    - shard-hsw:          [FAIL][69] ([i915#1542]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8270/shard-hsw8/igt@perf@polling-parameterized.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4429/shard-hsw4/igt@perf@polling-parameterized.html

  
#### Warnings ####

  * igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-snb:          [SKIP][71] ([fdo#109271]) -> [INCOMPLETE][72] ([i915#82])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8270/shard-snb6/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4429/shard-snb6/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_content_protection@uevent:
    - shard-kbl:          [FAIL][73] ([i915#357]) -> [FAIL][74] ([i915#357] / [i915#93] / [i915#95])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8270/shard-kbl1/igt@kms_content_protection@uevent.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4429/shard-kbl6/igt@kms_content_protection@uevent.html
    - shard-apl:          [FAIL][75] ([i915#357]) -> [FAIL][76] ([i915#357] / [i915#95])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8270/shard-apl8/igt@kms_content_protection@uevent.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4429/shard-apl8/igt@kms_content_protection@uevent.html

  * igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:
    - shard-apl:          [FAIL][77] ([fdo#108145] / [i915#265]) -> [FAIL][78] ([fdo#108145] / [i915#265] / [i915#95])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8270/shard-apl4/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4429/shard-apl1/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html
    - shard-kbl:          [FAIL][79] ([fdo#108145] / [i915#265]) -> [FAIL][80] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8270/shard-kbl4/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4429/shard-kbl3/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [i915#1066]: https://gitlab.freedesktop.org/drm/intel/issues/1066
  [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1525]: https://gitlab.freedesktop.org/drm/intel/issues/1525
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#1604]: https://gitlab.freedesktop.org/drm/intel/issues/1604
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#357]: https://gitlab.freedesktop.org/drm/intel/issues/357
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#57]: https://gitlab.freedesktop.org/drm/intel/issues/57
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#64]: https://gitlab.freedesktop.org/drm/intel/issues/64
  [i915#67]: https://gitlab.freedesktop.org/drm/intel/issues/67
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5577 -> IGTPW_4429
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8270: 3375eae2472503b49dcac86a09ab0018243f9f01 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4429: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4429/index.html
  IGT_5577: 7ee7e86fd79e4dbb6300ef4c23e50cb699216ae2 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4429/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
