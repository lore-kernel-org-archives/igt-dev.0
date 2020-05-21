Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 21 May 2020 19:17:10 -0000
Message-ID: <159008863004.4442.14595876382064216555@emeril.freedesktop.org>
References: <20200521012624.400031-1-jose.souza@intel.com>
In-Reply-To: <20200521012624.400031-1-jose.souza@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?fbcon=3A_Don=27t_close_drm_fd?=
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
To: "Souza, Jose" <jose.souza@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/fbcon: Don't close drm fd
URL   : https://patchwork.freedesktop.org/series/77497/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8515_full -> IGTPW_4603_full
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with IGTPW_4603_full need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4603_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4603/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4603_full:

### IGT changes ###

#### Warnings ####

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][1] ([i915#588]) -> [SKIP][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8515/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4603/shard-iclb1/igt@i915_pm_dc@dc3co-vpb-simulation.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8515_full and IGTPW_4603_full:

### New IGT tests (74) ###

  * igt@kms_big_fb@linear-16bpp-rotate-0:
    - Statuses : 6 pass(s)
    - Exec time: [1.52, 3.24] s

  * igt@kms_big_fb@linear-16bpp-rotate-180:
    - Statuses : 6 pass(s)
    - Exec time: [1.63, 3.35] s

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - Statuses : 6 skip(s)
    - Exec time: [0.01, 0.20] s

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - Statuses : 6 skip(s)
    - Exec time: [0.01, 0.19] s

  * igt@kms_big_fb@linear-32bpp-rotate-0:
    - Statuses : 6 pass(s)
    - Exec time: [1.63, 4.46] s

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - Statuses : 6 pass(s)
    - Exec time: [1.74, 4.43] s

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - Statuses : 5 skip(s)
    - Exec time: [0.01, 0.05] s

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - Statuses : 6 skip(s)
    - Exec time: [0.01, 0.20] s

  * igt@kms_big_fb@linear-64bpp-rotate-0:
    - Statuses : 6 pass(s)
    - Exec time: [1.91, 7.58] s

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - Statuses : 6 pass(s)
    - Exec time: [1.92, 7.54] s

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - Statuses : 6 skip(s)
    - Exec time: [0.05, 0.42] s

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - Statuses : 6 skip(s)
    - Exec time: [0.05, 0.43] s

  * igt@kms_big_fb@linear-8bpp-rotate-0:
    - Statuses : 6 pass(s)
    - Exec time: [1.46, 2.82] s

  * igt@kms_big_fb@linear-8bpp-rotate-180:
    - Statuses : 6 pass(s)
    - Exec time: [1.44, 2.68] s

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - Statuses : 6 skip(s)
    - Exec time: [0.01, 0.19] s

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - Statuses : 6 skip(s)
    - Exec time: [0.02, 0.23] s

  * igt@kms_big_fb@linear-addfb:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@x-tiled-16bpp-rotate-0:
    - Statuses : 6 pass(s)
    - Exec time: [1.53, 3.19] s

  * igt@kms_big_fb@x-tiled-16bpp-rotate-180:
    - Statuses : 6 pass(s)
    - Exec time: [1.43, 2.99] s

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - Statuses : 6 skip(s)
    - Exec time: [0.01, 0.19] s

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - Statuses : 6 skip(s)
    - Exec time: [0.01, 0.18] s

  * igt@kms_big_fb@x-tiled-32bpp-rotate-0:
    - Statuses : 6 pass(s)
    - Exec time: [1.59, 4.52] s

  * igt@kms_big_fb@x-tiled-32bpp-rotate-180:
    - Statuses : 6 pass(s)
    - Exec time: [1.69, 4.32] s

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - Statuses : 6 skip(s)
    - Exec time: [0.01, 0.21] s

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - Statuses : 6 skip(s)
    - Exec time: [0.01, 0.21] s

  * igt@kms_big_fb@x-tiled-64bpp-rotate-0:
    - Statuses : 6 pass(s)
    - Exec time: [1.86, 7.38] s

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - Statuses : 6 pass(s)
    - Exec time: [1.87, 7.31] s

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - Statuses : 5 skip(s)
    - Exec time: [0.05, 0.34] s

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - Statuses : 6 skip(s)
    - Exec time: [0.04, 0.41] s

  * igt@kms_big_fb@x-tiled-8bpp-rotate-0:
    - Statuses : 6 pass(s)
    - Exec time: [1.41, 2.47] s

  * igt@kms_big_fb@x-tiled-8bpp-rotate-180:
    - Statuses : 6 pass(s)
    - Exec time: [1.40, 2.44] s

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - Statuses : 6 skip(s)
    - Exec time: [0.01, 0.25] s

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - Statuses : 6 skip(s)
    - Exec time: [0.02, 0.23] s

  * igt@kms_big_fb@x-tiled-addfb:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@x-tiled-addfb-size-offset-overflow:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@x-tiled-addfb-size-overflow:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@y-tiled-16bpp-rotate-0:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 3.04] s

  * igt@kms_big_fb@y-tiled-16bpp-rotate-180:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 3.04] s

  * igt@kms_big_fb@y-tiled-16bpp-rotate-270:
    - Statuses : 2 pass(s) 4 skip(s)
    - Exec time: [0.0, 1.83] s

  * igt@kms_big_fb@y-tiled-16bpp-rotate-90:
    - Statuses : 2 pass(s) 4 skip(s)
    - Exec time: [0.0, 1.82] s

  * igt@kms_big_fb@y-tiled-32bpp-rotate-0:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 4.30] s

  * igt@kms_big_fb@y-tiled-32bpp-rotate-180:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 4.27] s

  * igt@kms_big_fb@y-tiled-32bpp-rotate-270:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 4.55] s

  * igt@kms_big_fb@y-tiled-32bpp-rotate-90:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 4.54] s

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.00, 7.29] s

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 7.03] s

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - Statuses : 5 skip(s)
    - Exec time: [0.0, 0.29] s

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - Statuses : 6 skip(s)
    - Exec time: [0.0, 0.39] s

  * igt@kms_big_fb@y-tiled-8bpp-rotate-0:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.45] s

  * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.51] s

  * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
    - Statuses : 6 skip(s)
    - Exec time: [0.0, 0.22] s

  * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
    - Statuses : 6 skip(s)
    - Exec time: [0.0, 0.24] s

  * igt@kms_big_fb@y-tiled-addfb:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 3.06] s

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 3.05] s

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - Statuses : 1 pass(s) 5 skip(s)
    - Exec time: [0.0, 1.95] s

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
    - Statuses : 1 pass(s) 5 skip(s)
    - Exec time: [0.0, 1.84] s

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 4.46] s

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 4.28] s

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-270:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 4.38] s

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 4.36] s

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - Statuses : 6 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-270:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@yf-tiled-addfb:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_4603_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_eio@in-flight-suspend:
    - shard-kbl:          [PASS][3] -> [INCOMPLETE][4] ([i915#155])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8515/shard-kbl1/igt@gem_eio@in-flight-suspend.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4603/shard-kbl4/igt@gem_eio@in-flight-suspend.html

  * igt@gem_softpin@noreloc-s3:
    - shard-apl:          [PASS][5] -> [DMESG-WARN][6] ([i915#180]) +7 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8515/shard-apl4/igt@gem_softpin@noreloc-s3.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4603/shard-apl2/igt@gem_softpin@noreloc-s3.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - shard-kbl:          [PASS][7] -> [FAIL][8] ([i915#54] / [i915#93] / [i915#95]) +2 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8515/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4603/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-64x21-random:
    - shard-kbl:          [PASS][9] -> [FAIL][10] ([i915#54]) +2 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8515/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-64x21-random.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4603/shard-kbl6/igt@kms_cursor_crc@pipe-c-cursor-64x21-random.html

  * igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding:
    - shard-glk:          [PASS][11] -> [FAIL][12] ([i915#54])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8515/shard-glk4/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4603/shard-glk4/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html
    - shard-apl:          [PASS][13] -> [FAIL][14] ([i915#54]) +2 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8515/shard-apl2/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4603/shard-apl3/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled:
    - shard-apl:          [PASS][15] -> [FAIL][16] ([i915#52] / [i915#54] / [i915#95])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8515/shard-apl6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4603/shard-apl6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
    - shard-kbl:          [PASS][17] -> [FAIL][18] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8515/shard-kbl1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4603/shard-kbl1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-kbl:          [PASS][19] -> [DMESG-WARN][20] ([i915#180])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8515/shard-kbl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4603/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_plane_multiple@atomic-pipe-a-tiling-none:
    - shard-apl:          [PASS][21] -> [FAIL][22] ([i915#1779] / [i915#95])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8515/shard-apl1/igt@kms_plane_multiple@atomic-pipe-a-tiling-none.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4603/shard-apl1/igt@kms_plane_multiple@atomic-pipe-a-tiling-none.html

  * igt@kms_psr@psr2_basic:
    - shard-iclb:         [PASS][23] -> [SKIP][24] ([fdo#109441])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8515/shard-iclb2/igt@kms_psr@psr2_basic.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4603/shard-iclb7/igt@kms_psr@psr2_basic.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@legacy-engines-mixed-process@render:
    - shard-apl:          [FAIL][25] ([i915#1528]) -> [PASS][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8515/shard-apl8/igt@gem_ctx_persistence@legacy-engines-mixed-process@render.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4603/shard-apl3/igt@gem_ctx_persistence@legacy-engines-mixed-process@render.html

  * igt@i915_pm_dc@dc5-psr:
    - shard-iclb:         [FAIL][27] ([i915#1899]) -> [PASS][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8515/shard-iclb1/igt@i915_pm_dc@dc5-psr.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4603/shard-iclb6/igt@i915_pm_dc@dc5-psr.html
    - shard-tglb:         [FAIL][29] ([i915#1899]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8515/shard-tglb3/igt@i915_pm_dc@dc5-psr.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4603/shard-tglb3/igt@i915_pm_dc@dc5-psr.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy:
    - shard-kbl:          [FAIL][31] ([i915#1566] / [i915#93] / [i915#95]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8515/shard-kbl1/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4603/shard-kbl3/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-kbl:          [FAIL][33] ([i915#1121] / [i915#93] / [i915#95]) -> [PASS][34] +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8515/shard-kbl6/igt@kms_fbcon_fbt@fbc.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4603/shard-kbl2/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [FAIL][35] ([i915#1121] / [i915#95]) -> [PASS][36] +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8515/shard-apl1/igt@kms_fbcon_fbt@fbc-suspend.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4603/shard-apl8/igt@kms_fbcon_fbt@fbc-suspend.html

  * {igt@kms_flip@flip-vs-suspend-interruptible@a-dp1}:
    - shard-kbl:          [DMESG-WARN][37] ([i915#180]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8515/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4603/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * {igt@kms_flip@flip-vs-suspend-interruptible@c-dp1}:
    - shard-apl:          [DMESG-WARN][39] ([i915#180]) -> [PASS][40] +7 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8515/shard-apl3/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4603/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html

  * igt@kms_psr@psr2_sprite_plane_onoff:
    - shard-iclb:         [SKIP][41] ([fdo#109441]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8515/shard-iclb6/igt@kms_psr@psr2_sprite_plane_onoff.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4603/shard-iclb2/igt@kms_psr@psr2_sprite_plane_onoff.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][43] ([i915#31]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8515/shard-apl1/igt@kms_setmode@basic.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4603/shard-apl3/igt@kms_setmode@basic.html

  * {igt@perf@blocking-parameterized}:
    - shard-iclb:         [FAIL][45] ([i915#1542]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8515/shard-iclb4/igt@perf@blocking-parameterized.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4603/shard-iclb5/igt@perf@blocking-parameterized.html

  
#### Warnings ####

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         [FAIL][47] ([i915#1515]) -> [WARN][48] ([i915#1515])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8515/shard-iclb4/igt@i915_pm_rc6_residency@rc6-idle.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4603/shard-iclb1/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@kms_content_protection@atomic:
    - shard-apl:          [TIMEOUT][49] ([i915#1319]) -> [FAIL][50] ([fdo#110321] / [fdo#110336])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8515/shard-apl4/igt@kms_content_protection@atomic.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4603/shard-apl1/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          [FAIL][51] ([fdo#110321] / [fdo#110336]) -> [TIMEOUT][52] ([i915#1319])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8515/shard-apl8/igt@kms_content_protection@atomic-dpms.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4603/shard-apl7/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@lic:
    - shard-apl:          [FAIL][53] ([fdo#110321]) -> [TIMEOUT][54] ([i915#1319]) +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8515/shard-apl6/igt@kms_content_protection@lic.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4603/shard-apl7/igt@kms_content_protection@lic.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [FAIL][55] ([i915#608]) -> [SKIP][56] ([fdo#109642] / [fdo#111068])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8515/shard-iclb2/igt@kms_psr2_su@page_flip.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4603/shard-iclb1/igt@kms_psr2_su@page_flip.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [i915#1121]: https://gitlab.freedesktop.org/drm/intel/issues/1121
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1515]: https://gitlab.freedesktop.org/drm/intel/issues/1515
  [i915#1528]: https://gitlab.freedesktop.org/drm/intel/issues/1528
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1566]: https://gitlab.freedesktop.org/drm/intel/issues/1566
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#1779]: https://gitlab.freedesktop.org/drm/intel/issues/1779
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1899]: https://gitlab.freedesktop.org/drm/intel/issues/1899
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#608]: https://gitlab.freedesktop.org/drm/intel/issues/608
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5665 -> IGTPW_4603
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8515: 41f9bb782f3bb2f30be09683184bbeecb1fd31bb @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4603: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4603/index.html
  IGT_5665: c5e5b0ce26fc321591a6d0235c639a1e8ec3cdfa @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4603/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
