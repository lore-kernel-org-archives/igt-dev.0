Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sun, 21 Jun 2020 13:24:27 -0000
Message-ID: <159274586733.25323.9323099104024322286@emeril.freedesktop.org>
References: <20200618152707.6855-1-matthew.s.atwood@intel.com>
In-Reply-To: <20200618152707.6855-1-matthew.s.atwood@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fplane=5Fscaling=3A_set_minimum_height_and_width_to_20?=
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
To: Matt Atwood <matthew.s.atwood@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_plane_scaling: set minimum height and width to 20
URL   : https://patchwork.freedesktop.org/series/78536/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8641_full -> IGTPW_4684_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4684_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4684_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4684/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4684_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@flip-vs-suspend@c-hdmi-a1:
    - shard-hsw:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-hsw8/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4684/shard-hsw4/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html

  
Known issues
------------

  Here are the changes found in IGTPW_4684_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@dumb_buffer@invalid-bpp:
    - shard-snb:          [PASS][3] -> [TIMEOUT][4] ([i915#1958])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-snb4/igt@dumb_buffer@invalid-bpp.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4684/shard-snb2/igt@dumb_buffer@invalid-bpp.html

  * igt@gem_ctx_persistence@legacy-engines-mixed-process@render:
    - shard-apl:          [PASS][5] -> [FAIL][6] ([i915#1528])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-apl8/igt@gem_ctx_persistence@legacy-engines-mixed-process@render.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4684/shard-apl3/igt@gem_ctx_persistence@legacy-engines-mixed-process@render.html

  * igt@gem_exec_endless@dispatch@rcs0:
    - shard-tglb:         [PASS][7] -> [INCOMPLETE][8] ([i915#1958])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-tglb3/igt@gem_exec_endless@dispatch@rcs0.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4684/shard-tglb8/igt@gem_exec_endless@dispatch@rcs0.html

  * igt@gem_exec_schedule@implicit-read-write@rcs0:
    - shard-snb:          [PASS][9] -> [INCOMPLETE][10] ([i915#82])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-snb4/igt@gem_exec_schedule@implicit-read-write@rcs0.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4684/shard-snb4/igt@gem_exec_schedule@implicit-read-write@rcs0.html

  * igt@gem_exec_whisper@basic-contexts-forked:
    - shard-glk:          [PASS][11] -> [DMESG-WARN][12] ([i915#118] / [i915#95]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-glk8/igt@gem_exec_whisper@basic-contexts-forked.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4684/shard-glk8/igt@gem_exec_whisper@basic-contexts-forked.html

  * igt@gem_mmap_gtt@cpuset-medium-copy:
    - shard-kbl:          [PASS][13] -> [DMESG-WARN][14] ([i915#93] / [i915#95]) +39 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-kbl3/igt@gem_mmap_gtt@cpuset-medium-copy.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4684/shard-kbl4/igt@gem_mmap_gtt@cpuset-medium-copy.html

  * igt@gem_shrink@reclaim:
    - shard-hsw:          [PASS][15] -> [SKIP][16] ([fdo#109271])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-hsw8/igt@gem_shrink@reclaim.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4684/shard-hsw1/igt@gem_shrink@reclaim.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-apl:          [PASS][17] -> [INCOMPLETE][18] ([i915#1436])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-apl4/igt@gen9_exec_parse@allowed-all.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4684/shard-apl1/igt@gen9_exec_parse@allowed-all.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-glk:          [PASS][19] -> [DMESG-FAIL][20] ([i915#118] / [i915#95]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-glk6/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4684/shard-glk8/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-0:
    - shard-apl:          [PASS][21] -> [DMESG-WARN][22] ([i915#1982]) +2 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-apl7/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4684/shard-apl7/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html
    - shard-glk:          [PASS][23] -> [DMESG-WARN][24] ([i915#1982]) +2 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-glk1/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4684/shard-glk5/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html

  * igt@kms_color@pipe-c-ctm-red-to-blue:
    - shard-hsw:          [PASS][25] -> [TIMEOUT][26] ([i915#1958]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-hsw2/igt@kms_color@pipe-c-ctm-red-to-blue.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4684/shard-hsw1/igt@kms_color@pipe-c-ctm-red-to-blue.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - shard-kbl:          [PASS][27] -> [FAIL][28] ([i915#54])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4684/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
    - shard-glk:          [PASS][29] -> [FAIL][30] ([i915#54])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-glk7/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4684/shard-glk5/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
    - shard-apl:          [PASS][31] -> [FAIL][32] ([i915#54])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4684/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [PASS][33] -> [DMESG-WARN][34] ([i915#180]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4684/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-render-ytiled:
    - shard-tglb:         [PASS][35] -> [DMESG-WARN][36] ([i915#402]) +3 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-tglb1/igt@kms_draw_crc@draw-method-xrgb2101010-render-ytiled.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4684/shard-tglb5/igt@kms_draw_crc@draw-method-xrgb2101010-render-ytiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled:
    - shard-kbl:          [PASS][37] -> [DMESG-FAIL][38] ([i915#54] / [i915#95]) +3 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-kbl6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4684/shard-kbl2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
    - shard-apl:          [PASS][39] -> [DMESG-FAIL][40] ([i915#54] / [i915#95])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-apl8/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4684/shard-apl6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-apl:          [PASS][41] -> [FAIL][42] ([i915#1525])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-apl7/igt@kms_fbcon_fbt@fbc.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4684/shard-apl2/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@a-dp1:
    - shard-kbl:          [PASS][43] -> [DMESG-WARN][44] ([i915#1982])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-kbl2/igt@kms_flip@wf_vblank-ts-check-interruptible@a-dp1.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4684/shard-kbl4/igt@kms_flip@wf_vblank-ts-check-interruptible@a-dp1.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-pwrite:
    - shard-tglb:         [PASS][45] -> [DMESG-WARN][46] ([i915#1982]) +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-tglb3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-pwrite.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4684/shard-tglb6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-256:
    - shard-kbl:          [PASS][47] -> [DMESG-FAIL][48] ([i915#95]) +4 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-kbl6/igt@kms_plane_cursor@pipe-a-overlay-size-256.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4684/shard-kbl2/igt@kms_plane_cursor@pipe-a-overlay-size-256.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-128:
    - shard-apl:          [PASS][49] -> [DMESG-FAIL][50] ([i915#95]) +2 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-apl2/igt@kms_plane_cursor@pipe-a-viewport-size-128.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4684/shard-apl7/igt@kms_plane_cursor@pipe-a-viewport-size-128.html

  * igt@kms_psr2_su@page_flip:
    - shard-tglb:         [PASS][51] -> [SKIP][52] ([i915#1911])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-tglb7/igt@kms_psr2_su@page_flip.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4684/shard-tglb6/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_primary_render:
    - shard-iclb:         [PASS][53] -> [SKIP][54] ([fdo#109441])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-iclb2/igt@kms_psr@psr2_primary_render.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4684/shard-iclb1/igt@kms_psr@psr2_primary_render.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][55] -> [FAIL][56] ([i915#31])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-apl1/igt@kms_setmode@basic.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4684/shard-apl3/igt@kms_setmode@basic.html

  * igt@perf@invalid-oa-metric-set-id:
    - shard-apl:          [PASS][57] -> [DMESG-WARN][58] ([i915#95]) +34 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-apl7/igt@perf@invalid-oa-metric-set-id.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4684/shard-apl2/igt@perf@invalid-oa-metric-set-id.html

  
#### Possible fixes ####

  * igt@gem_exec_schedule@implicit-write-read@rcs0:
    - shard-snb:          [INCOMPLETE][59] ([i915#82]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-snb2/igt@gem_exec_schedule@implicit-write-read@rcs0.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4684/shard-snb2/igt@gem_exec_schedule@implicit-write-read@rcs0.html

  * igt@gem_exec_whisper@basic-contexts-all:
    - shard-glk:          [DMESG-WARN][61] ([i915#118] / [i915#95]) -> [PASS][62] +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-glk7/igt@gem_exec_whisper@basic-contexts-all.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4684/shard-glk1/igt@gem_exec_whisper@basic-contexts-all.html

  * igt@i915_module_load@reload:
    - shard-tglb:         [DMESG-WARN][63] ([i915#402]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-tglb3/igt@i915_module_load@reload.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4684/shard-tglb2/igt@i915_module_load@reload.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][65] ([i915#1899]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-iclb8/igt@i915_pm_dc@dc6-psr.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4684/shard-iclb5/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_suspend@debugfs-reader:
    - shard-tglb:         [INCOMPLETE][67] ([i915#1602] / [i915#456]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-tglb3/igt@i915_suspend@debugfs-reader.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4684/shard-tglb1/igt@i915_suspend@debugfs-reader.html

  * igt@kms_addfb_basic@bad-pitch-128:
    - shard-snb:          [TIMEOUT][69] ([i915#1958]) -> [PASS][70] +4 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-snb1/igt@kms_addfb_basic@bad-pitch-128.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4684/shard-snb4/igt@kms_addfb_basic@bad-pitch-128.html
    - shard-hsw:          [TIMEOUT][71] ([i915#1958]) -> [PASS][72] +4 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-hsw4/igt@kms_addfb_basic@bad-pitch-128.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4684/shard-hsw2/igt@kms_addfb_basic@bad-pitch-128.html

  * {igt@kms_atomic_transition@plane-all-transition@hdmi-a-1-pipe-a}:
    - shard-glk:          [INCOMPLETE][73] ([i915#58] / [k.org#198133]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-glk8/igt@kms_atomic_transition@plane-all-transition@hdmi-a-1-pipe-a.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4684/shard-glk5/igt@kms_atomic_transition@plane-all-transition@hdmi-a-1-pipe-a.html

  * igt@kms_cursor_crc@pipe-c-cursor-256x85-sliding:
    - shard-apl:          [FAIL][75] ([i915#54]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-apl3/igt@kms_cursor_crc@pipe-c-cursor-256x85-sliding.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4684/shard-apl1/igt@kms_cursor_crc@pipe-c-cursor-256x85-sliding.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-xtiled:
    - shard-kbl:          [DMESG-WARN][77] ([i915#93] / [i915#95]) -> [PASS][78] +44 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-kbl3/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-xtiled.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4684/shard-kbl1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-xtiled.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [DMESG-WARN][79] ([i915#180]) -> [PASS][80] +10 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4684/shard-kbl2/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_flip@plain-flip-fb-recreate@a-dp1:
    - shard-kbl:          [DMESG-WARN][81] ([i915#1982]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-kbl4/igt@kms_flip@plain-flip-fb-recreate@a-dp1.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4684/shard-kbl7/igt@kms_flip@plain-flip-fb-recreate@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:
    - shard-apl:          [DMESG-FAIL][83] ([i915#49] / [i915#95]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-apl8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4684/shard-apl8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html
    - shard-kbl:          [FAIL][85] ([i915#49]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4684/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-badstride:
    - shard-glk:          [DMESG-WARN][87] ([i915#1982]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-glk9/igt@kms_frontbuffer_tracking@fbc-badstride.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4684/shard-glk6/igt@kms_frontbuffer_tracking@fbc-badstride.html

  * igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
    - shard-iclb:         [DMESG-WARN][89] ([i915#1982]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-iclb7/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4684/shard-iclb1/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-gtt:
    - shard-tglb:         [DMESG-WARN][91] ([i915#1982]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-gtt.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4684/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid:
    - shard-kbl:          [DMESG-FAIL][93] ([fdo#108145] / [i915#95]) -> [PASS][94] +1 similar issue
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4684/shard-kbl3/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant:
    - shard-apl:          [DMESG-FAIL][95] ([fdo#108145] / [i915#95]) -> [PASS][96] +1 similar issue
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4684/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [FAIL][97] ([i915#173]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-iclb1/igt@kms_psr@no_drrs.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4684/shard-iclb2/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [SKIP][99] ([fdo#109441]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-iclb6/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4684/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@perf_pmu@semaphore-busy@rcs0:
    - shard-kbl:          [FAIL][101] ([i915#1820] / [i915#93] / [i915#95]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-kbl7/igt@perf_pmu@semaphore-busy@rcs0.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4684/shard-kbl7/igt@perf_pmu@semaphore-busy@rcs0.html

  * igt@syncobj_wait@invalid-multi-wait-unsubmitted-submitted-signaled:
    - shard-apl:          [DMESG-WARN][103] ([i915#95]) -> [PASS][104] +38 similar issues
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-apl6/igt@syncobj_wait@invalid-multi-wait-unsubmitted-submitted-signaled.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4684/shard-apl3/igt@syncobj_wait@invalid-multi-wait-unsubmitted-submitted-signaled.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [SKIP][105] ([i915#468]) -> [FAIL][106] ([i915#454])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-tglb2/igt@i915_pm_dc@dc6-psr.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4684/shard-tglb5/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-kbl:          [DMESG-WARN][107] ([i915#93] / [i915#95]) -> [DMESG-WARN][108] ([i915#180])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-kbl6/igt@i915_suspend@fence-restore-tiled2untiled.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4684/shard-kbl4/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_atomic_transition@3x-modeset-transitions-nonblocking:
    - shard-hsw:          [SKIP][109] ([fdo#109271]) -> [TIMEOUT][110] ([i915#1958])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-hsw6/igt@kms_atomic_transition@3x-modeset-transitions-nonblocking.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4684/shard-hsw1/igt@kms_atomic_transition@3x-modeset-transitions-nonblocking.html
    - shard-snb:          [SKIP][111] ([fdo#109271]) -> [TIMEOUT][112] ([i915#1958]) +1 similar issue
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-snb2/igt@kms_atomic_transition@3x-modeset-transitions-nonblocking.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4684/shard-snb2/igt@kms_atomic_transition@3x-modeset-transitions-nonblocking.html

  * igt@kms_content_protection@atomic:
    - shard-kbl:          [TIMEOUT][113] ([i915#1319] / [i915#1958]) -> [DMESG-FAIL][114] ([fdo#110321] / [i915#95])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-kbl4/igt@kms_content_protection@atomic.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4684/shard-kbl2/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          [FAIL][115] ([fdo#110321] / [fdo#110336]) -> [DMESG-FAIL][116] ([fdo#110321] / [i915#95]) +1 similar issue
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-apl7/igt@kms_content_protection@atomic-dpms.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4684/shard-apl2/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@uevent:
    - shard-kbl:          [FAIL][117] ([i915#357]) -> [DMESG-FAIL][118] ([i915#357] / [i915#95])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-kbl6/igt@kms_content_protection@uevent.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4684/shard-kbl4/igt@kms_content_protection@uevent.html
    - shard-apl:          [FAIL][119] ([i915#357]) -> [DMESG-FAIL][120] ([i915#357] / [i915#95])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-apl1/igt@kms_content_protection@uevent.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4684/shard-apl3/igt@kms_content_protection@uevent.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [DMESG-WARN][121] ([i915#180] / [i915#93] / [i915#95]) -> [DMESG-WARN][122] ([i915#93] / [i915#95])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4684/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:
    - shard-kbl:          [FAIL][123] ([fdo#108145] / [i915#265]) -> [DMESG-FAIL][124] ([fdo#108145] / [i915#1982])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-kbl7/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4684/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:
    - shard-kbl:          [DMESG-FAIL][125] ([i915#95]) -> [FAIL][126] ([i915#265])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-kbl4/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4684/shard-kbl7/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [SKIP][127] ([fdo#109642] / [fdo#111068]) -> [SKIP][128] ([i915#1911])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-iclb6/igt@kms_psr2_su@page_flip.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4684/shard-iclb2/igt@kms_psr2_su@page_flip.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1525]: https://gitlab.freedesktop.org/drm/intel/issues/1525
  [i915#1528]: https://gitlab.freedesktop.org/drm/intel/issues/1528
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1820]: https://gitlab.freedesktop.org/drm/intel/issues/1820
  [i915#1899]: https://gitlab.freedesktop.org/drm/intel/issues/1899
  [i915#1911]: https://gitlab.freedesktop.org/drm/intel/issues/1911
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#357]: https://gitlab.freedesktop.org/drm/intel/issues/357
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
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
  * IGT: IGT_5712 -> IGTPW_4684
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8641: aac91f91c7be78f53b352237d968dfa1996b2d4b @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4684: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4684/index.html
  IGT_5712: eba1135ddd35f9d3097ed91032aefe8f9a9f9d02 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4684/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
