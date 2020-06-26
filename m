Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 26 Jun 2020 12:12:33 -0000
Message-ID: <159317355312.22983.3977569525368923346@emeril.freedesktop.org>
References: <20200625103857.uwqycap3iy6yd6hk@smtp.gmail.com>
In-Reply-To: <20200625103857.uwqycap3iy6yd6hk@smtp.gmail.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgbGliL2ln?=
 =?utf-8?q?t=5Ffb=3A_remove_extra_parameters_from_igt=5Fput=5Fcaito=5Fctx?=
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
To: Melissa Wen <melissa.srw@gmail.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: lib/igt_fb: remove extra parameters from igt_put_caito_ctx
URL   : https://patchwork.freedesktop.org/series/78815/
State : success

== Summary ==

CI Bug Log - changes from IGT_5718_full -> IGTPW_4706_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4706/index.html

Known issues
------------

  Here are the changes found in IGTPW_4706_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_whisper@basic-queues-forked:
    - shard-glk:          [PASS][1] -> [DMESG-WARN][2] ([i915#118] / [i915#95]) +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5718/shard-glk1/igt@gem_exec_whisper@basic-queues-forked.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4706/shard-glk7/igt@gem_exec_whisper@basic-queues-forked.html

  * igt@i915_module_load@reload:
    - shard-tglb:         [PASS][3] -> [DMESG-WARN][4] ([i915#402]) +3 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5718/shard-tglb7/igt@i915_module_load@reload.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4706/shard-tglb6/igt@i915_module_load@reload.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-kbl:          [PASS][5] -> [DMESG-WARN][6] ([i915#180])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5718/shard-kbl2/igt@i915_suspend@fence-restore-tiled2untiled.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4706/shard-kbl7/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-apl:          [PASS][7] -> [DMESG-WARN][8] ([i915#1982]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5718/shard-apl3/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4706/shard-apl4/igt@kms_big_fb@linear-64bpp-rotate-180.html
    - shard-glk:          [PASS][9] -> [DMESG-WARN][10] ([i915#1982])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5718/shard-glk1/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4706/shard-glk1/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen:
    - shard-kbl:          [PASS][11] -> [DMESG-FAIL][12] ([i915#54] / [i915#95]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5718/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4706/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen:
    - shard-kbl:          [PASS][13] -> [DMESG-WARN][14] ([i915#93] / [i915#95]) +44 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5718/shard-kbl6/igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4706/shard-kbl6/igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding:
    - shard-glk:          [PASS][15] -> [FAIL][16] ([i915#54])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5718/shard-glk4/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4706/shard-glk5/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html
    - shard-apl:          [PASS][17] -> [FAIL][18] ([i915#54])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5718/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4706/shard-apl4/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html
    - shard-kbl:          [PASS][19] -> [FAIL][20] ([i915#54])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5718/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4706/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html

  * igt@kms_cursor_edge_walk@pipe-c-128x128-right-edge:
    - shard-hsw:          [PASS][21] -> [TIMEOUT][22] ([i915#1958])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5718/shard-hsw7/igt@kms_cursor_edge_walk@pipe-c-128x128-right-edge.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4706/shard-hsw5/igt@kms_cursor_edge_walk@pipe-c-128x128-right-edge.html

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled:
    - shard-apl:          [PASS][23] -> [DMESG-FAIL][24] ([i915#1635] / [i915#54] / [i915#95])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5718/shard-apl3/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4706/shard-apl8/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html

  * igt@kms_flip@2x-absolute-wf_vblank@ab-vga1-hdmi-a1:
    - shard-hsw:          [PASS][25] -> [DMESG-WARN][26] ([i915#1982])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5718/shard-hsw1/igt@kms_flip@2x-absolute-wf_vblank@ab-vga1-hdmi-a1.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4706/shard-hsw6/igt@kms_flip@2x-absolute-wf_vblank@ab-vga1-hdmi-a1.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a2:
    - shard-glk:          [PASS][27] -> [FAIL][28] ([i915#79])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5718/shard-glk6/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a2.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4706/shard-glk2/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a2.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@a-dp1:
    - shard-kbl:          [PASS][29] -> [DMESG-WARN][30] ([i915#1982])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5718/shard-kbl1/igt@kms_flip@wf_vblank-ts-check-interruptible@a-dp1.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4706/shard-kbl4/igt@kms_flip@wf_vblank-ts-check-interruptible@a-dp1.html

  * igt@kms_flip_tiling@flip-changes-tiling-y:
    - shard-apl:          [PASS][31] -> [DMESG-FAIL][32] ([i915#1635] / [i915#95])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5718/shard-apl8/igt@kms_flip_tiling@flip-changes-tiling-y.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4706/shard-apl4/igt@kms_flip_tiling@flip-changes-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-pwrite:
    - shard-tglb:         [PASS][33] -> [DMESG-WARN][34] ([i915#1982])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5718/shard-tglb2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-pwrite.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4706/shard-tglb3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-iclb:         [PASS][35] -> [FAIL][36] ([i915#83])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5718/shard-iclb7/igt@kms_panel_fitting@atomic-fastset.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4706/shard-iclb1/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_properties@get_properties-sanity-non-atomic:
    - shard-apl:          [PASS][37] -> [DMESG-WARN][38] ([i915#1635] / [i915#95]) +38 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5718/shard-apl2/igt@kms_properties@get_properties-sanity-non-atomic.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4706/shard-apl4/igt@kms_properties@get_properties-sanity-non-atomic.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [PASS][39] -> [SKIP][40] ([fdo#109642] / [fdo#111068])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5718/shard-iclb2/igt@kms_psr2_su@page_flip.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4706/shard-iclb1/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_sprite_render:
    - shard-iclb:         [PASS][41] -> [SKIP][42] ([fdo#109441])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5718/shard-iclb2/igt@kms_psr@psr2_sprite_render.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4706/shard-iclb4/igt@kms_psr@psr2_sprite_render.html

  * igt@perf@blocking-parameterized:
    - shard-iclb:         [PASS][43] -> [FAIL][44] ([i915#1542]) +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5718/shard-iclb3/igt@perf@blocking-parameterized.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4706/shard-iclb8/igt@perf@blocking-parameterized.html

  * igt@perf@invalid-oa-format-id:
    - shard-kbl:          [PASS][45] -> [SKIP][46] ([fdo#109271])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5718/shard-kbl1/igt@perf@invalid-oa-format-id.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4706/shard-kbl7/igt@perf@invalid-oa-format-id.html
    - shard-hsw:          [PASS][47] -> [SKIP][48] ([fdo#109271])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5718/shard-hsw4/igt@perf@invalid-oa-format-id.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4706/shard-hsw1/igt@perf@invalid-oa-format-id.html
    - shard-tglb:         [PASS][49] -> [SKIP][50] ([i915#405])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5718/shard-tglb1/igt@perf@invalid-oa-format-id.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4706/shard-tglb2/igt@perf@invalid-oa-format-id.html
    - shard-iclb:         [PASS][51] -> [SKIP][52] ([i915#405])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5718/shard-iclb2/igt@perf@invalid-oa-format-id.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4706/shard-iclb2/igt@perf@invalid-oa-format-id.html
    - shard-glk:          [PASS][53] -> [SKIP][54] ([fdo#109271])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5718/shard-glk3/igt@perf@invalid-oa-format-id.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4706/shard-glk7/igt@perf@invalid-oa-format-id.html
    - shard-apl:          [PASS][55] -> [SKIP][56] ([fdo#109271])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5718/shard-apl6/igt@perf@invalid-oa-format-id.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4706/shard-apl2/igt@perf@invalid-oa-format-id.html

  
#### Possible fixes ####

  * igt@i915_getparams_basic@basic-eu-total:
    - shard-kbl:          [DMESG-WARN][57] ([i915#93] / [i915#95]) -> [PASS][58] +46 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5718/shard-kbl6/igt@i915_getparams_basic@basic-eu-total.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4706/shard-kbl3/igt@i915_getparams_basic@basic-eu-total.html

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - shard-apl:          [DMESG-WARN][59] ([i915#1982]) -> [PASS][60] +2 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5718/shard-apl7/igt@i915_pm_rpm@basic-pci-d3-state.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4706/shard-apl1/igt@i915_pm_rpm@basic-pci-d3-state.html

  * igt@i915_suspend@sysfs-reader:
    - shard-kbl:          [DMESG-WARN][61] ([i915#180]) -> [PASS][62] +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5718/shard-kbl7/igt@i915_suspend@sysfs-reader.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4706/shard-kbl4/igt@i915_suspend@sysfs-reader.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-glk:          [DMESG-FAIL][63] ([i915#118] / [i915#95]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5718/shard-glk8/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4706/shard-glk6/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - shard-kbl:          [DMESG-FAIL][65] ([i915#54] / [i915#95]) -> [PASS][66] +3 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5718/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4706/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-256x85-random:
    - shard-hsw:          [TIMEOUT][67] ([i915#1958]) -> [PASS][68] +2 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5718/shard-hsw1/igt@kms_cursor_crc@pipe-c-cursor-256x85-random.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4706/shard-hsw5/igt@kms_cursor_crc@pipe-c-cursor-256x85-random.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite:
    - shard-apl:          [DMESG-WARN][69] ([i915#1635] / [i915#95]) -> [PASS][70] +31 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5718/shard-apl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4706/shard-apl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt:
    - shard-tglb:         [DMESG-WARN][71] ([i915#1982]) -> [PASS][72] +1 similar issue
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5718/shard-tglb5/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4706/shard-tglb7/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-apl:          [FAIL][73] ([fdo#103375]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5718/shard-apl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4706/shard-apl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid:
    - shard-kbl:          [DMESG-FAIL][75] ([fdo#108145] / [i915#95]) -> [PASS][76] +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5718/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4706/shard-kbl2/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant:
    - shard-apl:          [DMESG-FAIL][77] ([fdo#108145] / [i915#1635] / [i915#95]) -> [PASS][78] +1 similar issue
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5718/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4706/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-128:
    - shard-kbl:          [DMESG-FAIL][79] ([i915#95]) -> [PASS][80] +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5718/shard-kbl1/igt@kms_plane_cursor@pipe-a-overlay-size-128.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4706/shard-kbl6/igt@kms_plane_cursor@pipe-a-overlay-size-128.html
    - shard-apl:          [DMESG-FAIL][81] ([i915#1635] / [i915#95]) -> [PASS][82] +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5718/shard-apl2/igt@kms_plane_cursor@pipe-a-overlay-size-128.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4706/shard-apl1/igt@kms_plane_cursor@pipe-a-overlay-size-128.html

  * igt@kms_plane_scaling@pipe-c-scaler-with-clipping-clamping:
    - shard-iclb:         [DMESG-WARN][83] ([i915#1982]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5718/shard-iclb3/igt@kms_plane_scaling@pipe-c-scaler-with-clipping-clamping.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4706/shard-iclb1/igt@kms_plane_scaling@pipe-c-scaler-with-clipping-clamping.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [FAIL][85] ([i915#173]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5718/shard-iclb1/igt@kms_psr@no_drrs.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4706/shard-iclb3/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][87] ([fdo#109441]) -> [PASS][88] +1 similar issue
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5718/shard-iclb8/igt@kms_psr@psr2_sprite_plane_move.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4706/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_vblank@pipe-a-query-forked-busy-hang:
    - shard-kbl:          [DMESG-WARN][89] ([i915#1982]) -> [PASS][90] +1 similar issue
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5718/shard-kbl7/igt@kms_vblank@pipe-a-query-forked-busy-hang.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4706/shard-kbl2/igt@kms_vblank@pipe-a-query-forked-busy-hang.html

  * igt@prime_mmap_kms@buffer-sharing:
    - shard-tglb:         [DMESG-WARN][91] ([i915#402]) -> [PASS][92] +2 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5718/shard-tglb2/igt@prime_mmap_kms@buffer-sharing.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4706/shard-tglb7/igt@prime_mmap_kms@buffer-sharing.html

  
#### Warnings ####

  * igt@gem_ctx_sseu@invalid-args:
    - shard-apl:          [SKIP][93] ([fdo#109271]) -> [SKIP][94] ([fdo#109271] / [i915#1635]) +11 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5718/shard-apl3/igt@gem_ctx_sseu@invalid-args.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4706/shard-apl4/igt@gem_ctx_sseu@invalid-args.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-apl:          [DMESG-WARN][95] ([i915#1436] / [i915#716]) -> [DMESG-WARN][96] ([i915#1635] / [i915#95])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5718/shard-apl4/igt@gen9_exec_parse@allowed-all.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4706/shard-apl3/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_backlight@fade:
    - shard-hsw:          [SKIP][97] ([fdo#109271]) -> [TIMEOUT][98] ([i915#1958]) +3 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5718/shard-hsw6/igt@i915_pm_backlight@fade.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4706/shard-hsw5/igt@i915_pm_backlight@fade.html

  * igt@kms_chamelium@dp-audio:
    - shard-apl:          [SKIP][99] ([fdo#109271] / [fdo#111827]) -> [SKIP][100] ([fdo#109271] / [fdo#111827] / [i915#1635]) +1 similar issue
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5718/shard-apl7/igt@kms_chamelium@dp-audio.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4706/shard-apl6/igt@kms_chamelium@dp-audio.html

  * igt@kms_color_chamelium@pipe-b-ctm-0-75:
    - shard-apl:          [SKIP][101] ([fdo#109271] / [fdo#111827] / [i915#1635]) -> [SKIP][102] ([fdo#109271] / [fdo#111827])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5718/shard-apl1/igt@kms_color_chamelium@pipe-b-ctm-0-75.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4706/shard-apl8/igt@kms_color_chamelium@pipe-b-ctm-0-75.html

  * igt@kms_color_chamelium@pipe-b-ctm-green-to-red:
    - shard-hsw:          [SKIP][103] ([fdo#109271] / [fdo#111827]) -> [TIMEOUT][104] ([i915#1958])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5718/shard-hsw4/igt@kms_color_chamelium@pipe-b-ctm-green-to-red.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4706/shard-hsw5/igt@kms_color_chamelium@pipe-b-ctm-green-to-red.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled:
    - shard-hsw:          [TIMEOUT][105] ([i915#1958]) -> [SKIP][106] ([fdo#109271])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5718/shard-hsw1/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4706/shard-hsw4/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [DMESG-WARN][107] ([i915#93] / [i915#95]) -> [INCOMPLETE][108] ([i915#155])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5718/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4706/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@psr-1p-rte:
    - shard-apl:          [SKIP][109] ([fdo#109271] / [i915#1635]) -> [SKIP][110] ([fdo#109271]) +12 similar issues
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5718/shard-apl3/igt@kms_frontbuffer_tracking@psr-1p-rte.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4706/shard-apl1/igt@kms_frontbuffer_tracking@psr-1p-rte.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-basic:
    - shard-apl:          [DMESG-FAIL][111] ([fdo#108145] / [i915#1635] / [i915#95]) -> [FAIL][112] ([fdo#108145] / [i915#265])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5718/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4706/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html
    - shard-kbl:          [DMESG-FAIL][113] ([fdo#108145] / [i915#95]) -> [FAIL][114] ([fdo#108145] / [i915#265])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5718/shard-kbl2/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4706/shard-kbl2/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html

  
  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#405]: https://gitlab.freedesktop.org/drm/intel/issues/405
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#83]: https://gitlab.freedesktop.org/drm/intel/issues/83
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5718 -> IGTPW_4706

  CI-20190529: 20190529
  CI_DRM_8665: 2cb786fa6506e20b5cb2a10decda11454111e026 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4706: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4706/index.html
  IGT_5718: af1ef32bfae90bcdbaf1b5d84c61ff4e04368505 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4706/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
