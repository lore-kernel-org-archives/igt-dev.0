Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sat, 06 Jun 2020 00:22:12 -0000
Message-ID: <159140293205.20631.7723308530179408567@emeril.freedesktop.org>
References: <20200605194540.2135972-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200605194540.2135972-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fhuc=5Fcopy=3A_Enable_a_HuC_copy_test_=28rev6=29?=
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
To: "Robert M. Fosha" <robert.m.fosha@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/i915/gem_huc_copy: Enable a HuC copy test (rev6)
URL   : https://patchwork.freedesktop.org/series/71194/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8594_full -> IGTPW_4653_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4653_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4653_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4653/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4653_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_suspend@basic:
    - shard-hsw:          [PASS][1] -> [TIMEOUT][2] +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8594/shard-hsw5/igt@gem_exec_suspend@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4653/shard-hsw5/igt@gem_exec_suspend@basic.html

  * {igt@gem_huc_copy@huc-copy} (NEW):
    - shard-tglb:         NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4653/shard-tglb1/igt@gem_huc_copy@huc-copy.html

  * {igt@gem_huc_copy@huc-load} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][4] +1 similar issue
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4653/shard-iclb3/igt@gem_huc_copy@huc-load.html

  * igt@gem_mmap_wc@write-cpu-read-wc-unflushed:
    - shard-snb:          [PASS][5] -> [TIMEOUT][6] +2 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8594/shard-snb5/igt@gem_mmap_wc@write-cpu-read-wc-unflushed.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4653/shard-snb2/igt@gem_mmap_wc@write-cpu-read-wc-unflushed.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-hsw:          NOTRUN -> [TIMEOUT][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4653/shard-hsw5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
    - shard-snb:          NOTRUN -> [TIMEOUT][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4653/shard-snb2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  
#### Warnings ####

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-msflip-blt:
    - shard-snb:          [SKIP][9] ([fdo#109271]) -> [TIMEOUT][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8594/shard-snb2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-msflip-blt.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4653/shard-snb2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-msflip-blt.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@gem_exec_reloc@basic-concurrent16}:
    - shard-snb:          [FAIL][11] ([i915#1930]) -> [TIMEOUT][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8594/shard-snb4/igt@gem_exec_reloc@basic-concurrent16.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4653/shard-snb2/igt@gem_exec_reloc@basic-concurrent16.html

  * {igt@gem_ringfill@basic-all}:
    - shard-hsw:          [PASS][13] -> [TIMEOUT][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8594/shard-hsw1/igt@gem_ringfill@basic-all.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4653/shard-hsw5/igt@gem_ringfill@basic-all.html
    - shard-snb:          [PASS][15] -> [TIMEOUT][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8594/shard-snb1/igt@gem_ringfill@basic-all.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4653/shard-snb2/igt@gem_ringfill@basic-all.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8594_full and IGTPW_4653_full:

### New IGT tests (2) ###

  * igt@gem_huc_copy@huc-copy:
    - Statuses : 1 fail(s) 6 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@gem_huc_copy@huc-load:
    - Statuses : 1 pass(s) 6 skip(s)
    - Exec time: [0.0, 0.00] s

  

Known issues
------------

  Here are the changes found in IGTPW_4653_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_whisper@basic-fds-all:
    - shard-glk:          [PASS][17] -> [DMESG-WARN][18] ([i915#118] / [i915#95]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8594/shard-glk6/igt@gem_exec_whisper@basic-fds-all.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4653/shard-glk8/igt@gem_exec_whisper@basic-fds-all.html

  * igt@i915_pm_dc@dc5-psr:
    - shard-tglb:         [PASS][19] -> [FAIL][20] ([i915#1899])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8594/shard-tglb2/igt@i915_pm_dc@dc5-psr.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4653/shard-tglb3/igt@i915_pm_dc@dc5-psr.html

  * igt@kms_atomic_transition@1x-modeset-transitions-nonblocking:
    - shard-snb:          [PASS][21] -> [SKIP][22] ([fdo#109271]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8594/shard-snb6/igt@kms_atomic_transition@1x-modeset-transitions-nonblocking.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4653/shard-snb1/igt@kms_atomic_transition@1x-modeset-transitions-nonblocking.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-apl:          [PASS][23] -> [DMESG-FAIL][24] ([i915#95]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8594/shard-apl2/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4653/shard-apl3/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-180:
    - shard-apl:          [PASS][25] -> [DMESG-WARN][26] ([i915#1982])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8594/shard-apl2/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4653/shard-apl8/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen:
    - shard-kbl:          [PASS][27] -> [DMESG-FAIL][28] ([i915#54] / [i915#95]) +2 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8594/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4653/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-apl:          [PASS][29] -> [DMESG-WARN][30] ([i915#180]) +2 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8594/shard-apl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4653/shard-apl8/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_cursor_edge_walk@pipe-a-64x64-bottom-edge:
    - shard-kbl:          [PASS][31] -> [DMESG-FAIL][32] ([i915#70] / [i915#95])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8594/shard-kbl4/igt@kms_cursor_edge_walk@pipe-a-64x64-bottom-edge.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4653/shard-kbl4/igt@kms_cursor_edge_walk@pipe-a-64x64-bottom-edge.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [PASS][33] -> [FAIL][34] ([i915#72])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8594/shard-glk7/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4653/shard-glk5/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_flip_tiling@flip-changes-tiling-yf:
    - shard-kbl:          [PASS][35] -> [DMESG-FAIL][36] ([i915#95]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8594/shard-kbl2/igt@kms_flip_tiling@flip-changes-tiling-yf.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4653/shard-kbl6/igt@kms_flip_tiling@flip-changes-tiling-yf.html

  * igt@kms_flip_tiling@flip-to-y-tiled:
    - shard-kbl:          [PASS][37] -> [DMESG-WARN][38] ([i915#1982])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8594/shard-kbl4/igt@kms_flip_tiling@flip-to-y-tiled.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4653/shard-kbl1/igt@kms_flip_tiling@flip-to-y-tiled.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render:
    - shard-glk:          [PASS][39] -> [FAIL][40] ([i915#49])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8594/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4653/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-badstride:
    - shard-glk:          [PASS][41] -> [DMESG-WARN][42] ([i915#1982])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8594/shard-glk4/igt@kms_frontbuffer_tracking@fbc-badstride.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4653/shard-glk6/igt@kms_frontbuffer_tracking@fbc-badstride.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-tglb:         [PASS][43] -> [DMESG-WARN][44] ([i915#1982]) +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8594/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4653/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-modesetfrombusy:
    - shard-tglb:         [PASS][45] -> [DMESG-WARN][46] ([i915#402]) +2 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8594/shard-tglb6/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4653/shard-tglb5/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-kbl:          [PASS][47] -> [DMESG-WARN][48] ([i915#180]) +2 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8594/shard-kbl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4653/shard-kbl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_plane_alpha_blend@pipe-b-constant-alpha-mid:
    - shard-apl:          [PASS][49] -> [DMESG-WARN][50] ([i915#95]) +35 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8594/shard-apl4/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-mid.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4653/shard-apl1/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-mid.html

  * igt@kms_psr@psr2_suspend:
    - shard-iclb:         [PASS][51] -> [SKIP][52] ([fdo#109441]) +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8594/shard-iclb2/igt@kms_psr@psr2_suspend.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4653/shard-iclb7/igt@kms_psr@psr2_suspend.html

  * igt@vgem_basic@unload:
    - shard-kbl:          [PASS][53] -> [DMESG-WARN][54] ([i915#93] / [i915#95]) +45 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8594/shard-kbl2/igt@vgem_basic@unload.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4653/shard-kbl6/igt@vgem_basic@unload.html

  
#### Possible fixes ####

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-tglb:         [INCOMPLETE][55] ([i915#1602] / [i915#456]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8594/shard-tglb2/igt@gem_workarounds@suspend-resume-fd.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4653/shard-tglb6/igt@gem_workarounds@suspend-resume-fd.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-tglb:         [SKIP][57] ([i915#1904]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8594/shard-tglb3/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4653/shard-tglb2/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_suspend@debugfs-reader:
    - shard-kbl:          [INCOMPLETE][59] ([i915#155]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8594/shard-kbl2/igt@i915_suspend@debugfs-reader.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4653/shard-kbl3/igt@i915_suspend@debugfs-reader.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-0:
    - shard-apl:          [DMESG-WARN][61] ([i915#1982]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8594/shard-apl4/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4653/shard-apl6/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html
    - shard-glk:          [DMESG-WARN][63] ([i915#1982]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8594/shard-glk4/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4653/shard-glk1/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-glk:          [DMESG-FAIL][65] ([i915#118] / [i915#95]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8594/shard-glk8/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4653/shard-glk6/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_color@pipe-d-ctm-0-5:
    - shard-tglb:         [DMESG-WARN][67] ([i915#1149] / [i915#402]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8594/shard-tglb3/igt@kms_color@pipe-d-ctm-0-5.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4653/shard-tglb5/igt@kms_color@pipe-d-ctm-0-5.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen:
    - shard-kbl:          [DMESG-FAIL][69] ([i915#54] / [i915#95]) -> [PASS][70] +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8594/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4653/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled:
    - shard-apl:          [TIMEOUT][71] ([i915#1635]) -> [PASS][72] +1 similar issue
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8594/shard-apl6/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4653/shard-apl8/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled.html
    - shard-glk:          [INCOMPLETE][73] ([i915#58] / [k.org#198133]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8594/shard-glk2/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4653/shard-glk5/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled.html
    - shard-hsw:          [TIMEOUT][75] -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8594/shard-hsw5/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4653/shard-hsw2/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-render-untiled:
    - shard-apl:          [DMESG-FAIL][77] ([i915#54] / [i915#95]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8594/shard-apl4/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4653/shard-apl8/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html

  * {igt@kms_flip@flip-vs-suspend-interruptible@a-dp1}:
    - shard-apl:          [DMESG-WARN][79] ([i915#180]) -> [PASS][80] +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8594/shard-apl6/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4653/shard-apl6/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_flip_tiling@flip-x-tiled:
    - shard-apl:          [DMESG-WARN][81] ([i915#95]) -> [PASS][82] +30 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8594/shard-apl4/igt@kms_flip_tiling@flip-x-tiled.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4653/shard-apl3/igt@kms_flip_tiling@flip-x-tiled.html

  * igt@kms_plane_scaling@pipe-b-scaler-with-clipping-clamping:
    - shard-glk:          [TIMEOUT][83] ([i915#1958]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8594/shard-glk2/igt@kms_plane_scaling@pipe-b-scaler-with-clipping-clamping.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4653/shard-glk4/igt@kms_plane_scaling@pipe-b-scaler-with-clipping-clamping.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [SKIP][85] ([fdo#109441]) -> [PASS][86] +3 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8594/shard-iclb3/igt@kms_psr@psr2_primary_mmap_cpu.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4653/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_universal_plane@universal-plane-gen9-features-pipe-a:
    - shard-kbl:          [DMESG-WARN][87] ([i915#93] / [i915#95]) -> [PASS][88] +43 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8594/shard-kbl7/igt@kms_universal_plane@universal-plane-gen9-features-pipe-a.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4653/shard-kbl4/igt@kms_universal_plane@universal-plane-gen9-features-pipe-a.html

  * igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend:
    - shard-iclb:         [INCOMPLETE][89] ([i915#1078] / [i915#1185]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8594/shard-iclb3/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4653/shard-iclb1/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [DMESG-WARN][91] ([i915#180]) -> [PASS][92] +4 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8594/shard-kbl3/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4653/shard-kbl1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@kms_vblank@pipe-b-wait-busy:
    - shard-iclb:         [DMESG-WARN][93] ([i915#1982]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8594/shard-iclb6/igt@kms_vblank@pipe-b-wait-busy.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4653/shard-iclb7/igt@kms_vblank@pipe-b-wait-busy.html
    - shard-kbl:          [DMESG-WARN][95] ([i915#1982]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8594/shard-kbl6/igt@kms_vblank@pipe-b-wait-busy.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4653/shard-kbl6/igt@kms_vblank@pipe-b-wait-busy.html

  * igt@syncobj_wait@invalid-multi-wait-unsubmitted-submitted:
    - shard-tglb:         [DMESG-WARN][97] ([i915#402]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8594/shard-tglb3/igt@syncobj_wait@invalid-multi-wait-unsubmitted-submitted.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4653/shard-tglb5/igt@syncobj_wait@invalid-multi-wait-unsubmitted-submitted.html

  
#### Warnings ####

  * igt@kms_ccs@pipe-c-crc-primary-basic:
    - shard-glk:          [TIMEOUT][99] ([i915#1958]) -> [SKIP][100] ([fdo#109271])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8594/shard-glk2/igt@kms_ccs@pipe-c-crc-primary-basic.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4653/shard-glk1/igt@kms_ccs@pipe-c-crc-primary-basic.html
    - shard-hsw:          [TIMEOUT][101] -> [SKIP][102] ([fdo#109271]) +1 similar issue
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8594/shard-hsw5/igt@kms_ccs@pipe-c-crc-primary-basic.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4653/shard-hsw4/igt@kms_ccs@pipe-c-crc-primary-basic.html

  * igt@kms_content_protection@legacy:
    - shard-kbl:          [TIMEOUT][103] ([i915#1319]) -> [TIMEOUT][104] ([i915#1319] / [i915#1958]) +1 similar issue
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8594/shard-kbl2/igt@kms_content_protection@legacy.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4653/shard-kbl4/igt@kms_content_protection@legacy.html
    - shard-apl:          [FAIL][105] ([fdo#110321] / [fdo#110336]) -> [TIMEOUT][106] ([i915#1319] / [i915#1635])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8594/shard-apl1/igt@kms_content_protection@legacy.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4653/shard-apl3/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic:
    - shard-apl:          [DMESG-FAIL][107] ([fdo#110321] / [i915#95]) -> [TIMEOUT][108] ([i915#1319] / [i915#1635])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8594/shard-apl2/igt@kms_content_protection@lic.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4653/shard-apl2/igt@kms_content_protection@lic.html
    - shard-kbl:          [TIMEOUT][109] ([i915#1319] / [i915#1958]) -> [TIMEOUT][110] ([i915#1319])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8594/shard-kbl4/igt@kms_content_protection@lic.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4653/shard-kbl4/igt@kms_content_protection@lic.html

  * igt@kms_content_protection@srm:
    - shard-apl:          [TIMEOUT][111] ([i915#1319] / [i915#1635]) -> [FAIL][112] ([fdo#110321])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8594/shard-apl1/igt@kms_content_protection@srm.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4653/shard-apl2/igt@kms_content_protection@srm.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-apl:          [TIMEOUT][113] ([i915#1635]) -> [SKIP][114] ([fdo#109271]) +1 similar issue
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8594/shard-apl6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-gtt.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4653/shard-apl3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-gtt.html
    - shard-hsw:          [INCOMPLETE][115] ([i915#61]) -> [SKIP][116] ([fdo#109271])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8594/shard-hsw5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-gtt.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4653/shard-hsw5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [FAIL][117] ([i915#31]) -> [DMESG-WARN][118] ([i915#93] / [i915#95])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8594/shard-kbl6/igt@kms_setmode@basic.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4653/shard-kbl2/igt@kms_setmode@basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1078]: https://gitlab.freedesktop.org/drm/intel/issues/1078
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1185]: https://gitlab.freedesktop.org/drm/intel/issues/1185
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1899]: https://gitlab.freedesktop.org/drm/intel/issues/1899
  [i915#1904]: https://gitlab.freedesktop.org/drm/intel/issues/1904
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#70]: https://gitlab.freedesktop.org/drm/intel/issues/70
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5695 -> IGTPW_4653
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8594: 6d6b387f9c60b269a434f75fe9b859a7aa6feb88 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4653: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4653/index.html
  IGT_5695: 53e8c878a6fb5708e63c99403691e8960b86ea9c @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4653/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
