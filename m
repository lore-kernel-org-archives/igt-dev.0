Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 15 May 2020 18:14:30 -0000
Message-ID: <158956647040.26211.8314577379076963373@emeril.freedesktop.org>
References: <20181213105734.32617-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20181213105734.32617-1-ville.syrjala@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliL2Rl?=
 =?utf-8?q?bugfs=3A_Sanity_check_even_discarded_CRCs_=28rev3=29?=
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
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: lib/debugfs: Sanity check even discarded CRCs (rev3)
URL   : https://patchwork.freedesktop.org/series/53982/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8488_full -> IGTPW_4574_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4574_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4574_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4574/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4574_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_ctx_ringsize@idle@rcs0:
    - shard-iclb:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8488/shard-iclb8/igt@gem_ctx_ringsize@idle@rcs0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4574/shard-iclb5/igt@gem_ctx_ringsize@idle@rcs0.html

  * igt@kms_cursor_edge_walk@pipe-a-256x256-bottom-edge:
    - shard-iclb:         [PASS][3] -> [WARN][4] +33 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8488/shard-iclb8/igt@kms_cursor_edge_walk@pipe-a-256x256-bottom-edge.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4574/shard-iclb8/igt@kms_cursor_edge_walk@pipe-a-256x256-bottom-edge.html

  * igt@kms_cursor_edge_walk@pipe-a-256x256-right-edge:
    - shard-tglb:         [PASS][5] -> [WARN][6] +47 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8488/shard-tglb2/igt@kms_cursor_edge_walk@pipe-a-256x256-right-edge.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4574/shard-tglb3/igt@kms_cursor_edge_walk@pipe-a-256x256-right-edge.html

  * igt@kms_cursor_edge_walk@pipe-a-256x256-top-edge:
    - shard-glk:          NOTRUN -> [WARN][7] +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4574/shard-glk5/igt@kms_cursor_edge_walk@pipe-a-256x256-top-edge.html

  * igt@kms_cursor_edge_walk@pipe-a-64x64-right-edge:
    - shard-snb:          NOTRUN -> [WARN][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4574/shard-snb5/igt@kms_cursor_edge_walk@pipe-a-64x64-right-edge.html

  * igt@kms_cursor_edge_walk@pipe-a-64x64-top-edge:
    - shard-apl:          [PASS][9] -> [WARN][10] +34 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8488/shard-apl4/igt@kms_cursor_edge_walk@pipe-a-64x64-top-edge.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4574/shard-apl1/igt@kms_cursor_edge_walk@pipe-a-64x64-top-edge.html

  * igt@kms_cursor_edge_walk@pipe-b-128x128-bottom-edge:
    - shard-glk:          [PASS][11] -> [WARN][12] +31 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8488/shard-glk6/igt@kms_cursor_edge_walk@pipe-b-128x128-bottom-edge.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4574/shard-glk7/igt@kms_cursor_edge_walk@pipe-b-128x128-bottom-edge.html

  * igt@kms_cursor_edge_walk@pipe-b-256x256-top-edge:
    - shard-snb:          [PASS][13] -> [WARN][14] +22 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8488/shard-snb4/igt@kms_cursor_edge_walk@pipe-b-256x256-top-edge.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4574/shard-snb4/igt@kms_cursor_edge_walk@pipe-b-256x256-top-edge.html

  * igt@kms_cursor_edge_walk@pipe-c-128x128-left-edge:
    - shard-kbl:          [PASS][15] -> [WARN][16] +34 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8488/shard-kbl7/igt@kms_cursor_edge_walk@pipe-c-128x128-left-edge.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4574/shard-kbl7/igt@kms_cursor_edge_walk@pipe-c-128x128-left-edge.html

  * igt@kms_plane_cursor@pipe-b-viewport-size-128:
    - shard-iclb:         [PASS][17] -> [TIMEOUT][18] +2 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8488/shard-iclb8/igt@kms_plane_cursor@pipe-b-viewport-size-128.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4574/shard-iclb5/igt@kms_plane_cursor@pipe-b-viewport-size-128.html

  
#### Warnings ####

  * igt@kms_atomic_transition@2x-modeset-transitions-nonblocking-fencing:
    - shard-iclb:         [SKIP][19] ([fdo#109280]) -> [TIMEOUT][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8488/shard-iclb1/igt@kms_atomic_transition@2x-modeset-transitions-nonblocking-fencing.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4574/shard-iclb5/igt@kms_atomic_transition@2x-modeset-transitions-nonblocking-fencing.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-iclb:         [SKIP][21] ([fdo#110725] / [fdo#111614]) -> [TIMEOUT][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8488/shard-iclb7/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4574/shard-iclb5/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_cursor_edge_walk@pipe-a-64x64-left-edge:
    - shard-apl:          [FAIL][23] ([i915#70] / [i915#95]) -> [WARN][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8488/shard-apl3/igt@kms_cursor_edge_walk@pipe-a-64x64-left-edge.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4574/shard-apl3/igt@kms_cursor_edge_walk@pipe-a-64x64-left-edge.html
    - shard-kbl:          [FAIL][25] ([i915#70] / [i915#93] / [i915#95]) -> [WARN][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8488/shard-kbl2/igt@kms_cursor_edge_walk@pipe-a-64x64-left-edge.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4574/shard-kbl4/igt@kms_cursor_edge_walk@pipe-a-64x64-left-edge.html

  * igt@kms_plane_multiple@atomic-pipe-d-tiling-x:
    - shard-iclb:         [SKIP][27] ([fdo#109278] / [fdo#112010]) -> [TIMEOUT][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8488/shard-iclb2/igt@kms_plane_multiple@atomic-pipe-d-tiling-x.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4574/shard-iclb5/igt@kms_plane_multiple@atomic-pipe-d-tiling-x.html

  
Known issues
------------

  Here are the changes found in IGTPW_4574_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-random:
    - shard-kbl:          [PASS][29] -> [FAIL][30] ([i915#54] / [i915#93] / [i915#95]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8488/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4574/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-tglb:         [PASS][31] -> [FAIL][32] ([i915#64])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8488/shard-tglb1/igt@kms_fbcon_fbt@fbc.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4574/shard-tglb7/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-glk:          [PASS][33] -> [FAIL][34] ([i915#49])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8488/shard-glk1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4574/shard-glk8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html
    - shard-apl:          [PASS][35] -> [FAIL][36] ([i915#49])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8488/shard-apl8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4574/shard-apl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html
    - shard-kbl:          [PASS][37] -> [FAIL][38] ([i915#49])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8488/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4574/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [PASS][39] -> [DMESG-WARN][40] ([i915#180] / [i915#93] / [i915#95])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8488/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4574/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-apl:          [PASS][41] -> [FAIL][42] ([i915#53] / [i915#95])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8488/shard-apl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4574/shard-apl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-kbl:          [PASS][43] -> [DMESG-WARN][44] ([i915#180]) +3 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8488/shard-kbl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4574/shard-kbl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-128:
    - shard-kbl:          [PASS][45] -> [FAIL][46] ([i915#1559] / [i915#93] / [i915#95])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8488/shard-kbl7/igt@kms_plane_cursor@pipe-a-overlay-size-128.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4574/shard-kbl2/igt@kms_plane_cursor@pipe-a-overlay-size-128.html
    - shard-apl:          [PASS][47] -> [FAIL][48] ([i915#1559] / [i915#95])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8488/shard-apl1/igt@kms_plane_cursor@pipe-a-overlay-size-128.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4574/shard-apl6/igt@kms_plane_cursor@pipe-a-overlay-size-128.html

  * igt@kms_psr@psr2_cursor_blt:
    - shard-iclb:         [PASS][49] -> [SKIP][50] ([fdo#109441]) +2 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8488/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4574/shard-iclb4/igt@kms_psr@psr2_cursor_blt.html

  
#### Possible fixes ####

  * igt@i915_suspend@fence-restore-untiled:
    - shard-apl:          [DMESG-WARN][51] ([i915#180]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8488/shard-apl6/igt@i915_suspend@fence-restore-untiled.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4574/shard-apl1/igt@i915_suspend@fence-restore-untiled.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen:
    - shard-kbl:          [FAIL][53] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][54] +3 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8488/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4574/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy:
    - shard-kbl:          [FAIL][55] ([i915#1566] / [i915#93] / [i915#95]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8488/shard-kbl4/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4574/shard-kbl1/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html

  * igt@kms_draw_crc@draw-method-xrgb8888-render-untiled:
    - shard-kbl:          [FAIL][57] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8488/shard-kbl6/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4574/shard-kbl2/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html
    - shard-apl:          [FAIL][59] ([i915#52] / [i915#54] / [i915#95]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8488/shard-apl1/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4574/shard-apl2/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html

  * {igt@kms_flip@flip-vs-suspend-interruptible@a-dp1}:
    - shard-kbl:          [DMESG-WARN][61] ([i915#180]) -> [PASS][62] +5 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8488/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4574/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * {igt@kms_flip@flip-vs-suspend@a-vga1}:
    - shard-snb:          [DMESG-WARN][63] ([i915#42]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8488/shard-snb2/igt@kms_flip@flip-vs-suspend@a-vga1.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4574/shard-snb5/igt@kms_flip@flip-vs-suspend@a-vga1.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence:
    - shard-apl:          [FAIL][65] ([i915#53] / [i915#95]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8488/shard-apl2/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4574/shard-apl1/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html
    - shard-kbl:          [FAIL][67] ([i915#53] / [i915#93] / [i915#95]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8488/shard-kbl3/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4574/shard-kbl7/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min:
    - shard-kbl:          [FAIL][69] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8488/shard-kbl3/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4574/shard-kbl7/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
    - shard-apl:          [FAIL][71] ([fdo#108145] / [i915#265] / [i915#95]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8488/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4574/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-256:
    - shard-apl:          [FAIL][73] ([i915#1559] / [i915#95]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8488/shard-apl1/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4574/shard-apl1/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
    - shard-kbl:          [FAIL][75] ([i915#1559] / [i915#93] / [i915#95]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8488/shard-kbl7/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4574/shard-kbl7/igt@kms_plane_cursor@pipe-a-viewport-size-256.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-iclb:         [SKIP][77] ([fdo#109441]) -> [PASS][78] +3 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8488/shard-iclb1/igt@kms_psr@psr2_cursor_plane_move.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4574/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [FAIL][79] ([i915#454]) -> [SKIP][80] ([i915#468])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8488/shard-tglb7/igt@i915_pm_dc@dc6-psr.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4574/shard-tglb2/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@cursor-dpms:
    - shard-snb:          [INCOMPLETE][81] ([i915#82]) -> [SKIP][82] ([fdo#109271])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8488/shard-snb1/igt@i915_pm_rpm@cursor-dpms.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4574/shard-snb1/igt@i915_pm_rpm@cursor-dpms.html

  * igt@kms_content_protection@atomic:
    - shard-apl:          [FAIL][83] ([fdo#110321] / [fdo#110336] / [i915#95]) -> [TIMEOUT][84] ([i915#1319])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8488/shard-apl6/igt@kms_content_protection@atomic.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4574/shard-apl2/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@lic:
    - shard-apl:          [TIMEOUT][85] ([i915#1319]) -> [FAIL][86] ([fdo#110321] / [i915#95])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8488/shard-apl2/igt@kms_content_protection@lic.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4574/shard-apl6/igt@kms_content_protection@lic.html
    - shard-kbl:          [TIMEOUT][87] ([i915#1319]) -> [FAIL][88] ([fdo#110321] / [i915#93] / [i915#95])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8488/shard-kbl3/igt@kms_content_protection@lic.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4574/shard-kbl2/igt@kms_content_protection@lic.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-kbl:          [FAIL][89] ([i915#64]) -> [FAIL][90] ([i915#1121] / [i915#93] / [i915#95])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8488/shard-kbl4/igt@kms_fbcon_fbt@fbc.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4574/shard-kbl1/igt@kms_fbcon_fbt@fbc.html
    - shard-apl:          [FAIL][91] ([i915#1525]) -> [FAIL][92] ([i915#1121] / [i915#95])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8488/shard-apl8/igt@kms_fbcon_fbt@fbc.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4574/shard-apl6/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-kbl:          [DMESG-FAIL][93] ([i915#180] / [i915#95]) -> [FAIL][94] ([i915#1121] / [i915#93] / [i915#95])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8488/shard-kbl4/igt@kms_fbcon_fbt@fbc-suspend.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4574/shard-kbl1/igt@kms_fbcon_fbt@fbc-suspend.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [fdo#110725]: https://bugs.freedesktop.org/show_bug.cgi?id=110725
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#112010]: https://bugs.freedesktop.org/show_bug.cgi?id=112010
  [i915#1121]: https://gitlab.freedesktop.org/drm/intel/issues/1121
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1525]: https://gitlab.freedesktop.org/drm/intel/issues/1525
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#1566]: https://gitlab.freedesktop.org/drm/intel/issues/1566
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#42]: https://gitlab.freedesktop.org/drm/intel/issues/42
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#53]: https://gitlab.freedesktop.org/drm/intel/issues/53
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#64]: https://gitlab.freedesktop.org/drm/intel/issues/64
  [i915#70]: https://gitlab.freedesktop.org/drm/intel/issues/70
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5655 -> IGTPW_4574
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8488: d40ec60813532e485e9c63623c91babf556cfbe3 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4574: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4574/index.html
  IGT_5655: 2cc4c1edc3065590f9917930b6d049a90c4a38fd @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4574/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
