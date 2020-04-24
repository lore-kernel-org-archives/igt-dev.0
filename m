Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 24 Apr 2020 08:58:23 -0000
Message-ID: <158771870334.10801.3987354102323488864@emeril.freedesktop.org>
References: <20200424070528.15104-1-karthik.b.s@intel.com>
In-Reply-To: <20200424070528.15104-1-karthik.b.s@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fmultipipe=5Fmodeset=3A_Add_test_to_validate_max_pipe_conf?=
 =?utf-8?q?iguration_=28rev2=29?=
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
To: Karthik B S <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_multipipe_modeset: Add test to validate max pipe configuration (rev2)
URL   : https://patchwork.freedesktop.org/series/75876/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8357_full -> IGTPW_4505_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4505/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4505_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_multipipe_modeset@multipipe-modeset} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4505/shard-tglb2/igt@kms_multipipe_modeset@multipipe-modeset.html
    - shard-iclb:         NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4505/shard-iclb8/igt@kms_multipipe_modeset@multipipe-modeset.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8357_full and IGTPW_4505_full:

### New IGT tests (1) ###

  * igt@kms_multipipe_modeset@multipipe-modeset:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_4505_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@engines-mixed-process@vcs1:
    - shard-tglb:         [PASS][3] -> [FAIL][4] ([i915#1528])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-tglb8/igt@gem_ctx_persistence@engines-mixed-process@vcs1.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4505/shard-tglb5/igt@gem_ctx_persistence@engines-mixed-process@vcs1.html

  * igt@gem_ctx_ringsize@idle@bcs0:
    - shard-glk:          [PASS][5] -> [INCOMPLETE][6] ([i915#58] / [k.org#198133])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-glk1/igt@gem_ctx_ringsize@idle@bcs0.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4505/shard-glk5/igt@gem_ctx_ringsize@idle@bcs0.html

  * igt@gem_softpin@noreloc-s3:
    - shard-kbl:          [PASS][7] -> [DMESG-WARN][8] ([i915#180])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-kbl1/igt@gem_softpin@noreloc-s3.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4505/shard-kbl1/igt@gem_softpin@noreloc-s3.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding:
    - shard-apl:          [PASS][9] -> [FAIL][10] ([i915#54] / [i915#95])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4505/shard-apl1/igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-apl:          [PASS][11] -> [DMESG-WARN][12] ([i915#180])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-apl7/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4505/shard-apl1/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_cursor_edge_walk@pipe-a-64x64-bottom-edge:
    - shard-kbl:          [PASS][13] -> [FAIL][14] ([i915#70] / [i915#93] / [i915#95])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-kbl4/igt@kms_cursor_edge_walk@pipe-a-64x64-bottom-edge.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4505/shard-kbl7/igt@kms_cursor_edge_walk@pipe-a-64x64-bottom-edge.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled:
    - shard-glk:          [PASS][15] -> [FAIL][16] ([i915#177] / [i915#52] / [i915#54])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-glk4/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4505/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled:
    - shard-glk:          [PASS][17] -> [FAIL][18] ([i915#52] / [i915#54]) +3 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-glk8/igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4505/shard-glk8/igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled:
    - shard-apl:          [PASS][19] -> [FAIL][20] ([i915#52] / [i915#54] / [i915#95])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-apl1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4505/shard-apl7/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
    - shard-kbl:          [PASS][21] -> [FAIL][22] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-kbl2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4505/shard-kbl2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html

  * igt@kms_flip_tiling@flip-changes-tiling-yf:
    - shard-kbl:          [PASS][23] -> [FAIL][24] ([i915#699] / [i915#93] / [i915#95])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-kbl2/igt@kms_flip_tiling@flip-changes-tiling-yf.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4505/shard-kbl6/igt@kms_flip_tiling@flip-changes-tiling-yf.html
    - shard-apl:          [PASS][25] -> [FAIL][26] ([i915#95])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-apl7/igt@kms_flip_tiling@flip-changes-tiling-yf.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4505/shard-apl1/igt@kms_flip_tiling@flip-changes-tiling-yf.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [PASS][27] -> [DMESG-WARN][28] ([i915#180] / [i915#93] / [i915#95])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4505/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min:
    - shard-kbl:          [PASS][29] -> [FAIL][30] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-kbl1/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4505/shard-kbl3/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
    - shard-apl:          [PASS][31] -> [FAIL][32] ([fdo#108145] / [i915#265] / [i915#95])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4505/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html

  * igt@kms_psr@psr2_sprite_mmap_cpu:
    - shard-iclb:         [PASS][33] -> [SKIP][34] ([fdo#109441])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_cpu.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4505/shard-iclb8/igt@kms_psr@psr2_sprite_mmap_cpu.html

  
#### Possible fixes ####

  * igt@gem_exec_params@invalid-bsd-ring:
    - shard-iclb:         [SKIP][35] ([fdo#109276]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-iclb7/igt@gem_exec_params@invalid-bsd-ring.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4505/shard-iclb2/igt@gem_exec_params@invalid-bsd-ring.html

  * igt@i915_pm_rps@waitboost:
    - shard-glk:          [FAIL][37] ([i915#39]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-glk1/igt@i915_pm_rps@waitboost.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4505/shard-glk8/igt@i915_pm_rps@waitboost.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-apl:          [FAIL][39] ([i915#1119] / [i915#95]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-apl4/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4505/shard-apl2/igt@kms_big_fb@linear-32bpp-rotate-180.html
    - shard-kbl:          [FAIL][41] ([i915#1119] / [i915#93] / [i915#95]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-kbl2/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4505/shard-kbl6/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_color@pipe-a-ctm-max:
    - shard-kbl:          [FAIL][43] ([i915#168] / [i915#93] / [i915#95]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-kbl2/igt@kms_color@pipe-a-ctm-max.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4505/shard-kbl7/igt@kms_color@pipe-a-ctm-max.html
    - shard-apl:          [FAIL][45] ([i915#168] / [i915#95]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-apl4/igt@kms_color@pipe-a-ctm-max.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4505/shard-apl7/igt@kms_color@pipe-a-ctm-max.html
    - shard-glk:          [FAIL][47] ([i915#168]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-glk9/igt@kms_color@pipe-a-ctm-max.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4505/shard-glk4/igt@kms_color@pipe-a-ctm-max.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding:
    - shard-apl:          [FAIL][49] ([i915#54] / [i915#95]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4505/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-random:
    - shard-kbl:          [FAIL][51] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4505/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [FAIL][53] ([i915#72]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-glk7/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4505/shard-glk4/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-untiled:
    - shard-glk:          [FAIL][55] ([i915#52] / [i915#54]) -> [PASS][56] +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-untiled.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4505/shard-glk4/igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-untiled.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [FAIL][57] ([i915#53] / [i915#93] / [i915#95]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4505/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
    - shard-apl:          [FAIL][59] ([i915#53] / [i915#95]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-apl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4505/shard-apl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-apl:          [DMESG-WARN][61] ([i915#180]) -> [PASS][62] +3 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-apl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4505/shard-apl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant:
    - shard-apl:          [FAIL][63] ([fdo#108145] / [i915#265] / [i915#95]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4505/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-256:
    - shard-apl:          [FAIL][65] ([i915#1559] / [i915#95]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-apl8/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4505/shard-apl8/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
    - shard-kbl:          [FAIL][67] ([i915#1559] / [i915#93] / [i915#95]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-kbl3/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4505/shard-kbl7/igt@kms_plane_cursor@pipe-a-viewport-size-256.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [FAIL][69] ([i915#899]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-glk1/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4505/shard-glk9/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [SKIP][71] ([fdo#109642] / [fdo#111068]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-iclb6/igt@kms_psr2_su@frontbuffer.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4505/shard-iclb2/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [SKIP][73] ([fdo#109441]) -> [PASS][74] +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-iclb1/igt@kms_psr@psr2_no_drrs.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4505/shard-iclb2/igt@kms_psr@psr2_no_drrs.html

  * igt@kms_vblank@pipe-b-ts-continuation-suspend:
    - shard-apl:          [DMESG-WARN][75] ([i915#180] / [i915#95]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-apl1/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4505/shard-apl3/igt@kms_vblank@pipe-b-ts-continuation-suspend.html

  * igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend:
    - shard-kbl:          [INCOMPLETE][77] ([i915#155]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-kbl3/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4505/shard-kbl4/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html

  * {igt@perf@blocking-parameterized}:
    - shard-iclb:         [FAIL][79] ([i915#1542]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-iclb8/igt@perf@blocking-parameterized.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4505/shard-iclb3/igt@perf@blocking-parameterized.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][81] ([i915#588]) -> [SKIP][82] ([i915#658])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4505/shard-iclb5/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [FAIL][83] ([i915#454]) -> [SKIP][84] ([i915#468])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-tglb5/igt@i915_pm_dc@dc6-psr.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4505/shard-tglb2/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_content_protection@uevent:
    - shard-kbl:          [FAIL][85] ([i915#357] / [i915#93] / [i915#95]) -> [FAIL][86] ([i915#357])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-kbl1/igt@kms_content_protection@uevent.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4505/shard-kbl3/igt@kms_content_protection@uevent.html
    - shard-apl:          [FAIL][87] ([i915#357] / [i915#95]) -> [FAIL][88] ([i915#357])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-apl8/igt@kms_content_protection@uevent.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4505/shard-apl6/igt@kms_content_protection@uevent.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [FAIL][89] ([i915#95]) -> [DMESG-FAIL][90] ([i915#180] / [i915#95])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-apl1/igt@kms_fbcon_fbt@fbc-suspend.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4505/shard-apl8/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max:
    - shard-apl:          [FAIL][91] ([fdo#108145] / [i915#265]) -> [FAIL][92] ([fdo#108145] / [i915#265] / [i915#95])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4505/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [FAIL][93] ([i915#31]) -> [FAIL][94] ([i915#31] / [i915#93] / [i915#95])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8357/shard-kbl2/igt@kms_setmode@basic.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4505/shard-kbl4/igt@kms_setmode@basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#1528]: https://gitlab.freedesktop.org/drm/intel/issues/1528
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#168]: https://gitlab.freedesktop.org/drm/intel/issues/168
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#357]: https://gitlab.freedesktop.org/drm/intel/issues/357
  [i915#39]: https://gitlab.freedesktop.org/drm/intel/issues/39
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#53]: https://gitlab.freedesktop.org/drm/intel/issues/53
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#699]: https://gitlab.freedesktop.org/drm/intel/issues/699
  [i915#70]: https://gitlab.freedesktop.org/drm/intel/issues/70
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5609 -> IGTPW_4505
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8357: 95fef3b4fb9f6c72d65af138cdffb68e0f062910 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4505: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4505/index.html
  IGT_5609: c100fe19f7b144538549415e8503093053883ec6 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4505/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
