Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 18 May 2020 10:59:16 -0000
Message-ID: <158979955609.31688.4337144508278422617@emeril.freedesktop.org>
References: <20200518090919.14756-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20200518090919.14756-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgTWFrZSBn?=
 =?utf-8?q?pgpu_fill_tests_libdrm_independent_=28rev3=29?=
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

Series: Make gpgpu fill tests libdrm independent (rev3)
URL   : https://patchwork.freedesktop.org/series/77175/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8493_full -> IGTPW_4575_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4575_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4575_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4575/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4575_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_gpgpu_fill:
    - shard-glk:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8493/shard-glk8/igt@gem_gpgpu_fill.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4575/shard-glk5/igt@gem_gpgpu_fill.html
    - shard-apl:          [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8493/shard-apl1/igt@gem_gpgpu_fill.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4575/shard-apl2/igt@gem_gpgpu_fill.html

  * igt@kms_cursor_edge_walk@pipe-d-64x64-right-edge:
    - shard-tglb:         [PASS][5] -> [FAIL][6] +42 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8493/shard-tglb2/igt@kms_cursor_edge_walk@pipe-d-64x64-right-edge.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4575/shard-tglb6/igt@kms_cursor_edge_walk@pipe-d-64x64-right-edge.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-ytiled:
    - shard-tglb:         NOTRUN -> [FAIL][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4575/shard-tglb2/igt@kms_draw_crc@draw-method-xrgb2101010-blt-ytiled.html

  
#### Warnings ####

  * igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge:
    - shard-tglb:         [FAIL][8] ([i915#402]) -> [FAIL][9] +4 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8493/shard-tglb7/igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4575/shard-tglb3/igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-tglb:         [SKIP][10] ([i915#668]) -> [FAIL][11] +2 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8493/shard-tglb2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4575/shard-tglb1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html

  
Known issues
------------

  Here are the changes found in IGTPW_4575_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_workarounds@suspend-resume-context:
    - shard-kbl:          [PASS][12] -> [DMESG-WARN][13] ([i915#165])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8493/shard-kbl6/igt@gem_workarounds@suspend-resume-context.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4575/shard-kbl3/igt@gem_workarounds@suspend-resume-context.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-apl:          [PASS][14] -> [DMESG-WARN][15] ([i915#180])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8493/shard-apl6/igt@i915_suspend@fence-restore-untiled.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4575/shard-apl4/igt@i915_suspend@fence-restore-untiled.html

  * igt@kms_big_fb@linear-32bpp-rotate-0:
    - shard-apl:          [PASS][16] -> [FAIL][17] ([i915#1119] / [i915#95])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8493/shard-apl2/igt@kms_big_fb@linear-32bpp-rotate-0.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4575/shard-apl3/igt@kms_big_fb@linear-32bpp-rotate-0.html

  * igt@kms_big_fb@linear-8bpp-rotate-180:
    - shard-tglb:         [PASS][18] -> [FAIL][19] ([i915#1172]) +2 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8493/shard-tglb5/igt@kms_big_fb@linear-8bpp-rotate-180.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4575/shard-tglb8/igt@kms_big_fb@linear-8bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-270:
    - shard-tglb:         [PASS][20] -> [FAIL][21] ([i915#1172] / [i915#402]) +3 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8493/shard-tglb2/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4575/shard-tglb6/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html

  * igt@kms_color@pipe-a-ctm-0-5:
    - shard-tglb:         [PASS][22] -> [FAIL][23] ([i915#1149] / [i915#402]) +1 similar issue
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8493/shard-tglb8/igt@kms_color@pipe-a-ctm-0-5.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4575/shard-tglb7/igt@kms_color@pipe-a-ctm-0-5.html

  * igt@kms_color@pipe-b-ctm-max:
    - shard-tglb:         [PASS][24] -> [FAIL][25] ([i915#1149]) +2 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8493/shard-tglb3/igt@kms_color@pipe-b-ctm-max.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4575/shard-tglb5/igt@kms_color@pipe-b-ctm-max.html

  * igt@kms_color@pipe-d-ctm-0-5:
    - shard-tglb:         [PASS][26] -> [FAIL][27] ([i915#1149] / [i915#315])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8493/shard-tglb7/igt@kms_color@pipe-d-ctm-0-5.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4575/shard-tglb1/igt@kms_color@pipe-d-ctm-0-5.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen:
    - shard-kbl:          [PASS][28] -> [FAIL][29] ([i915#54] / [i915#93] / [i915#95]) +1 similar issue
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8493/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4575/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen.html

  * igt@kms_cursor_edge_walk@pipe-a-256x256-right-edge:
    - shard-tglb:         [PASS][30] -> [FAIL][31] ([i915#1897] / [i915#402]) +9 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8493/shard-tglb6/igt@kms_cursor_edge_walk@pipe-a-256x256-right-edge.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4575/shard-tglb7/igt@kms_cursor_edge_walk@pipe-a-256x256-right-edge.html

  * igt@kms_flip_tiling@flip-x-tiled:
    - shard-tglb:         [PASS][32] -> [FAIL][33] ([i915#402] / [i915#699])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8493/shard-tglb3/igt@kms_flip_tiling@flip-x-tiled.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4575/shard-tglb6/igt@kms_flip_tiling@flip-x-tiled.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-kbl:          [PASS][34] -> [FAIL][35] ([i915#49] / [i915#93] / [i915#95])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8493/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4575/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
    - shard-glk:          [PASS][36] -> [FAIL][37] ([i915#49]) +1 similar issue
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8493/shard-glk7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4575/shard-glk2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-kbl:          [PASS][38] -> [FAIL][39] ([i915#49])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8493/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4575/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html
    - shard-apl:          [PASS][40] -> [FAIL][41] ([i915#49] / [i915#95]) +1 similar issue
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8493/shard-apl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4575/shard-apl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render:
    - shard-tglb:         [PASS][42] -> [SKIP][43] ([i915#668]) +8 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8493/shard-tglb6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4575/shard-tglb1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [PASS][44] -> [FAIL][45] ([i915#53] / [i915#93] / [i915#95])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8493/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4575/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min:
    - shard-kbl:          [PASS][46] -> [FAIL][47] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8493/shard-kbl1/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4575/shard-kbl1/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
    - shard-apl:          [PASS][48] -> [FAIL][49] ([fdo#108145] / [i915#265] / [i915#95])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8493/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4575/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html

  * igt@kms_plane_alpha_blend@pipe-c-coverage-vs-premult-vs-constant:
    - shard-tglb:         [PASS][50] -> [FAIL][51] ([i915#1897]) +27 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8493/shard-tglb2/igt@kms_plane_alpha_blend@pipe-c-coverage-vs-premult-vs-constant.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4575/shard-tglb3/igt@kms_plane_alpha_blend@pipe-c-coverage-vs-premult-vs-constant.html

  * igt@kms_plane_cursor@pipe-b-viewport-size-128:
    - shard-tglb:         [PASS][52] -> [FAIL][53] ([i915#402]) +55 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8493/shard-tglb8/igt@kms_plane_cursor@pipe-b-viewport-size-128.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4575/shard-tglb6/igt@kms_plane_cursor@pipe-b-viewport-size-128.html

  * igt@kms_plane_lowres@pipe-a-tiling-y:
    - shard-tglb:         [PASS][54] -> [FAIL][55] ([i915#402] / [i915#899])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8493/shard-tglb3/igt@kms_plane_lowres@pipe-a-tiling-y.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4575/shard-tglb6/igt@kms_plane_lowres@pipe-a-tiling-y.html

  * igt@kms_plane_lowres@pipe-b-tiling-y:
    - shard-tglb:         [PASS][56] -> [FAIL][57] ([i915#899])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8493/shard-tglb6/igt@kms_plane_lowres@pipe-b-tiling-y.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4575/shard-tglb1/igt@kms_plane_lowres@pipe-b-tiling-y.html

  * igt@kms_psr@psr2_suspend:
    - shard-iclb:         [PASS][58] -> [SKIP][59] ([fdo#109441]) +1 similar issue
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8493/shard-iclb2/igt@kms_psr@psr2_suspend.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4575/shard-iclb7/igt@kms_psr@psr2_suspend.html

  * igt@kms_vblank@pipe-c-ts-continuation-suspend:
    - shard-kbl:          [PASS][60] -> [DMESG-WARN][61] ([i915#180]) +1 similar issue
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8493/shard-kbl2/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4575/shard-kbl2/igt@kms_vblank@pipe-c-ts-continuation-suspend.html

  
#### Possible fixes ####

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][62] ([i915#1899]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8493/shard-iclb5/igt@i915_pm_dc@dc6-psr.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4575/shard-iclb1/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_available_modes_crc@available_mode_test_crc:
    - shard-tglb:         [FAIL][64] ([i915#1537]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8493/shard-tglb2/igt@kms_available_modes_crc@available_mode_test_crc.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4575/shard-tglb5/igt@kms_available_modes_crc@available_mode_test_crc.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-180:
    - shard-tglb:         [FAIL][66] ([i915#1172] / [i915#402]) -> [PASS][67] +3 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8493/shard-tglb2/igt@kms_big_fb@x-tiled-16bpp-rotate-180.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4575/shard-tglb1/igt@kms_big_fb@x-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-0:
    - shard-tglb:         [FAIL][68] ([i915#1172]) -> [PASS][69] +1 similar issue
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8493/shard-tglb8/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4575/shard-tglb5/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html

  * igt@kms_ccs@pipe-a-crc-primary-basic:
    - shard-tglb:         [FAIL][70] ([i915#1483] / [i915#402]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8493/shard-tglb3/igt@kms_ccs@pipe-a-crc-primary-basic.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4575/shard-tglb7/igt@kms_ccs@pipe-a-crc-primary-basic.html

  * igt@kms_color@pipe-b-gamma:
    - shard-tglb:         [FAIL][72] ([i915#1149] / [i915#402]) -> [PASS][73] +3 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8493/shard-tglb7/igt@kms_color@pipe-b-gamma.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4575/shard-tglb3/igt@kms_color@pipe-b-gamma.html

  * igt@kms_color@pipe-d-ctm-blue-to-red:
    - shard-tglb:         [FAIL][74] ([i915#1149]) -> [PASS][75] +3 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8493/shard-tglb6/igt@kms_color@pipe-d-ctm-blue-to-red.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4575/shard-tglb2/igt@kms_color@pipe-d-ctm-blue-to-red.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-random:
    - shard-kbl:          [FAIL][76] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][77] +1 similar issue
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8493/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4575/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-apl:          [DMESG-WARN][78] ([i915#180]) -> [PASS][79] +3 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8493/shard-apl8/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4575/shard-apl1/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-d-cursor-64x21-offscreen:
    - shard-tglb:         [FAIL][80] ([i915#1897] / [i915#402]) -> [PASS][81] +3 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8493/shard-tglb6/igt@kms_cursor_crc@pipe-d-cursor-64x21-offscreen.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4575/shard-tglb2/igt@kms_cursor_crc@pipe-d-cursor-64x21-offscreen.html

  * igt@kms_cursor_crc@pipe-d-cursor-alpha-opaque:
    - shard-tglb:         [FAIL][82] ([i915#1897]) -> [PASS][83] +66 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8493/shard-tglb3/igt@kms_cursor_crc@pipe-d-cursor-alpha-opaque.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4575/shard-tglb3/igt@kms_cursor_crc@pipe-d-cursor-alpha-opaque.html

  * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
    - shard-tglb:         [FAIL][84] ([IGT#5] / [i915#402]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8493/shard-tglb7/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4575/shard-tglb1/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html

  * igt@kms_draw_crc@draw-method-rgb565-render-xtiled:
    - shard-snb:          [SKIP][86] ([fdo#109271]) -> [PASS][87] +3 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8493/shard-snb4/igt@kms_draw_crc@draw-method-rgb565-render-xtiled.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4575/shard-snb1/igt@kms_draw_crc@draw-method-rgb565-render-xtiled.html

  * igt@kms_draw_crc@fill-fb:
    - shard-apl:          [FAIL][88] ([i915#95]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8493/shard-apl6/igt@kms_draw_crc@fill-fb.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4575/shard-apl8/igt@kms_draw_crc@fill-fb.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-tglb:         [FAIL][90] ([i915#64]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8493/shard-tglb6/igt@kms_fbcon_fbt@fbc-suspend.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4575/shard-tglb8/igt@kms_fbcon_fbt@fbc-suspend.html

  * {igt@kms_flip@flip-vs-suspend@a-dp1}:
    - shard-kbl:          [DMESG-WARN][92] ([i915#180]) -> [PASS][93] +5 similar issues
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8493/shard-kbl7/igt@kms_flip@flip-vs-suspend@a-dp1.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4575/shard-kbl1/igt@kms_flip@flip-vs-suspend@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt:
    - shard-tglb:         [FAIL][94] ([i915#402]) -> [PASS][95] +69 similar issues
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8493/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4575/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-farfromfence:
    - shard-tglb:         [SKIP][96] ([i915#668]) -> [PASS][97] +18 similar issues
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8493/shard-tglb6/igt@kms_frontbuffer_tracking@psr-farfromfence.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4575/shard-tglb7/igt@kms_frontbuffer_tracking@psr-farfromfence.html

  * igt@kms_mmap_write_crc@main:
    - shard-tglb:         [FAIL][98] ([i915#1180] / [i915#402]) -> [PASS][99]
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8493/shard-tglb5/igt@kms_mmap_write_crc@main.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4575/shard-tglb6/igt@kms_mmap_write_crc@main.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-iclb:         [FAIL][100] ([i915#1757]) -> [PASS][101]
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8493/shard-iclb3/igt@kms_panel_fitting@atomic-fastset.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4575/shard-iclb5/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b:
    - shard-kbl:          [INCOMPLETE][102] ([i915#155]) -> [PASS][103]
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8493/shard-kbl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4575/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:
    - shard-tglb:         [FAIL][104] -> [PASS][105]
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8493/shard-tglb6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4575/shard-tglb3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-7efc:
    - shard-apl:          [FAIL][106] ([fdo#108145] / [i915#265] / [i915#95]) -> [PASS][107]
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8493/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4575/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-256:
    - shard-kbl:          [FAIL][108] ([i915#1559] / [i915#93] / [i915#95]) -> [PASS][109]
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8493/shard-kbl3/igt@kms_plane_cursor@pipe-a-overlay-size-256.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4575/shard-kbl7/igt@kms_plane_cursor@pipe-a-overlay-size-256.html
    - shard-apl:          [FAIL][110] ([i915#1559] / [i915#95]) -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8493/shard-apl1/igt@kms_plane_cursor@pipe-a-overlay-size-256.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4575/shard-apl7/igt@kms_plane_cursor@pipe-a-overlay-size-256.html

  * igt@kms_plane_cursor@pipe-a-primary-size-256:
    - shard-glk:          [FAIL][112] ([i915#1559]) -> [PASS][113]
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8493/shard-glk9/igt@kms_plane_cursor@pipe-a-primary-size-256.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4575/shard-glk4/igt@kms_plane_cursor@pipe-a-primary-size-256.html

  * igt@kms_plane_lowres@pipe-c-tiling-none:
    - shard-tglb:         [FAIL][114] ([i915#899]) -> [PASS][115] +2 similar issues
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8493/shard-tglb7/igt@kms_plane_lowres@pipe-c-tiling-none.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4575/shard-tglb5/igt@kms_plane_lowres@pipe-c-tiling-none.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-iclb:         [SKIP][116] ([fdo#109441]) -> [PASS][117]
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8493/shard-iclb7/igt@kms_psr@psr2_cursor_plane_move.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4575/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [SKIP][118] ([i915#468]) -> [SKIP][119] ([i915#668])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8493/shard-tglb2/igt@i915_pm_dc@dc6-psr.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4575/shard-tglb6/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-180:
    - shard-tglb:         [FAIL][120] ([i915#1172]) -> [FAIL][121] ([i915#1172] / [i915#402])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8493/shard-tglb8/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4575/shard-tglb8/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html

  * igt@kms_color@pipe-a-degamma:
    - shard-tglb:         [FAIL][122] ([i915#1149]) -> [FAIL][123] ([i915#1149] / [i915#402]) +1 similar issue
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8493/shard-tglb1/igt@kms_color@pipe-a-degamma.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4575/shard-tglb3/igt@kms_color@pipe-a-degamma.html

  * igt@kms_color@pipe-b-ctm-blue-to-red:
    - shard-tglb:         [FAIL][124] ([i915#1149] / [i915#402]) -> [FAIL][125] ([i915#1149]) +1 similar issue
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8493/shard-tglb8/igt@kms_color@pipe-b-ctm-blue-to-red.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4575/shard-tglb3/igt@kms_color@pipe-b-ctm-blue-to-red.html

  * igt@kms_content_protection@atomic:
    - shard-apl:          [TIMEOUT][126] ([i915#1319]) -> [DMESG-FAIL][127] ([fdo#110321])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8493/shard-apl3/igt@kms_content_protection@atomic.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4575/shard-apl8/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          [FAIL][128] ([fdo#110321] / [fdo#110336]) -> [TIMEOUT][129] ([i915#1319])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8493/shard-apl8/igt@kms_content_protection@atomic-dpms.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4575/shard-apl3/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@legacy:
    - shard-apl:          [TIMEOUT][130] ([i915#1319]) -> [FAIL][131] ([fdo#110321] / [fdo#110336])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8493/shard-apl1/igt@kms_content_protection@legacy.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4575/shard-apl7/igt@kms_content_protection@legacy.html

  * igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque:
    - shard-tglb:         [FAIL][132] ([i915#1897]) -> [FAIL][133] ([i915#1897] / [i915#402]) +11 similar issues
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8493/shard-tglb8/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4575/shard-tglb1/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [FAIL][134] ([i915#1121] / [i915#95]) -> [DMESG-FAIL][135] ([i915#180] / [i915#95])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8493/shard-apl4/igt@kms_fbcon_fbt@fbc-suspend.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4575/shard-apl4/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu:
    - shard-tglb:         [SKIP][136] ([i915#668]) -> [FAIL][137] ([i915#402]) +3 similar issues
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8493/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4575/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render:
    - shard-tglb:         [FAIL][138] ([i915#402]) -> [SKIP][139] ([i915#668]) +2 similar issues
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8493/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4575/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-blt:
    - shard-tglb:         [SKIP][140] ([i915#668]) -> [FAIL][141] ([i915#1897])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8493/shard-tglb8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-blt.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4575/shard-tglb7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-suspend:
    - shard-tglb:         [FAIL][142] ([i915#1897]) -> [SKIP][143] ([i915#668])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8493/shard-tglb3/igt@kms_frontbuffer_tracking@psr-suspend.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4575/shard-tglb5/igt@kms_frontbuffer_tracking@psr-suspend.html

  * igt@kms_plane@plane-position-hole-dpms-pipe-d-planes:
    - shard-tglb:         [FAIL][144] ([i915#1897] / [i915#402]) -> [FAIL][145] ([i915#1897]) +3 similar issues
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8493/shard-tglb7/igt@kms_plane@plane-position-hole-dpms-pipe-d-planes.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4575/shard-tglb8/igt@kms_plane@plane-position-hole-dpms-pipe-d-planes.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:
    - shard-apl:          [FAIL][146] ([fdo#108145] / [i915#265]) -> [FAIL][147] ([fdo#108145] / [i915#265] / [i915#95])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8493/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4575/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max:
    - shard-kbl:          [FAIL][148] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95]) -> [FAIL][149] ([fdo#108145] / [i915#265])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8493/shard-kbl4/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4575/shard-kbl3/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max.html
    - shard-apl:          [FAIL][150] ([fdo#108145] / [i915#265] / [i915#95]) -> [FAIL][151] ([fdo#108145] / [i915#265])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8493/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4575/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max.html

  * igt@kms_plane_lowres@pipe-b-tiling-x:
    - shard-tglb:         [FAIL][152] ([i915#899]) -> [FAIL][153] ([i915#402] / [i915#899])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8493/shard-tglb8/igt@kms_plane_lowres@pipe-b-tiling-x.html
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4575/shard-tglb6/igt@kms_plane_lowres@pipe-b-tiling-x.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#5]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/5
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://b

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4575/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
