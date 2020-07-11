Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sat, 11 Jul 2020 21:53:05 -0000
Message-ID: <159450438574.9232.7707772968357436910@emeril.freedesktop.org>
References: <20200711200602.3217-1-mohammed.khajapasha@intel.com>
In-Reply-To: <20200711200602.3217-1-mohammed.khajapasha@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliL2ln?=
 =?utf-8?q?t=5Fkms=3A_Add_support_for_display_with_=28rev7=29?=
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
To: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: lib/igt_kms: Add support for display with (rev7)
URL   : https://patchwork.freedesktop.org/series/78482/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5733_full -> IGTPW_4757_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4757_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4757_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4757_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_mmap_gtt@fault-concurrent:
    - shard-glk:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-glk3/igt@gem_mmap_gtt@fault-concurrent.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-glk6/igt@gem_mmap_gtt@fault-concurrent.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-tglb:         NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-tglb2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
    - shard-iclb:         NOTRUN -> [SKIP][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-iclb1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  
Known issues
------------

  Here are the changes found in IGTPW_4757_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic:
    - shard-hsw:          [PASS][5] -> [TIMEOUT][6] ([i915#1958] / [i915#2119]) +3 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-hsw6/igt@gem_exec_suspend@basic.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-hsw4/igt@gem_exec_suspend@basic.html
    - shard-snb:          [PASS][7] -> [TIMEOUT][8] ([i915#1958] / [i915#2119]) +2 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-snb5/igt@gem_exec_suspend@basic.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-snb1/igt@gem_exec_suspend@basic.html

  * igt@kms_addfb_basic@legacy-format:
    - shard-kbl:          [PASS][9] -> [DMESG-WARN][10] ([i915#93] / [i915#95]) +31 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-kbl1/igt@kms_addfb_basic@legacy-format.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-kbl4/igt@kms_addfb_basic@legacy-format.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-random:
    - shard-apl:          [PASS][11] -> [DMESG-FAIL][12] ([i915#1635] / [i915#54] / [i915#95]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-apl1/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-sliding:
    - shard-apl:          [PASS][13] -> [DMESG-WARN][14] ([i915#1635] / [i915#95]) +20 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-256x256-sliding.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-256x256-sliding.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen:
    - shard-kbl:          [PASS][15] -> [DMESG-FAIL][16] ([i915#54] / [i915#95]) +3 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html

  * igt@kms_cursor_edge_walk@pipe-b-128x128-top-edge:
    - shard-glk:          [PASS][17] -> [DMESG-WARN][18] ([i915#1982])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-glk6/igt@kms_cursor_edge_walk@pipe-b-128x128-top-edge.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-glk8/igt@kms_cursor_edge_walk@pipe-b-128x128-top-edge.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a2:
    - shard-glk:          [PASS][19] -> [FAIL][20] ([i915#79])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-glk2/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a2.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-glk6/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a2.html

  * igt@kms_flip@flip-vs-suspend@a-dp1:
    - shard-kbl:          [PASS][21] -> [DMESG-WARN][22] ([i915#180]) +2 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-kbl2/igt@kms_flip@flip-vs-suspend@a-dp1.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-kbl3/igt@kms_flip@flip-vs-suspend@a-dp1.html

  * igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw:
    - shard-tglb:         [PASS][23] -> [DMESG-WARN][24] ([i915#1982])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-tglb1/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-tglb6/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:
    - shard-iclb:         [PASS][25] -> [INCOMPLETE][26] ([i915#1185])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-iclb5/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-iclb3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [PASS][27] -> [SKIP][28] ([fdo#109441]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-iclb2/igt@kms_psr@psr2_cursor_render.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-iclb3/igt@kms_psr@psr2_cursor_render.html

  
#### Possible fixes ####

  * igt@gem_exec_whisper@basic-normal-all:
    - shard-glk:          [DMESG-WARN][29] ([i915#118] / [i915#95]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-glk7/igt@gem_exec_whisper@basic-normal-all.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-glk6/igt@gem_exec_whisper@basic-normal-all.html

  * igt@kms_big_fb@linear-64bpp-rotate-0:
    - shard-apl:          [DMESG-WARN][31] ([i915#1635] / [i915#1982]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-apl2/igt@kms_big_fb@linear-64bpp-rotate-0.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-apl1/igt@kms_big_fb@linear-64bpp-rotate-0.html
    - shard-glk:          [DMESG-FAIL][33] ([i915#118] / [i915#95]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-glk8/igt@kms_big_fb@linear-64bpp-rotate-0.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-glk9/igt@kms_big_fb@linear-64bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-rapid-movement:
    - shard-hsw:          [TIMEOUT][35] ([i915#1958] / [i915#2119]) -> [PASS][36] +2 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-hsw4/igt@kms_cursor_crc@pipe-a-cursor-128x128-rapid-movement.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-hsw7/igt@kms_cursor_crc@pipe-a-cursor-128x128-rapid-movement.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-offscreen:
    - shard-kbl:          [DMESG-FAIL][37] ([i915#54] / [i915#95]) -> [PASS][38] +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-256x256-offscreen.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-256x256-offscreen.html

  * igt@kms_cursor_edge_walk@pipe-a-64x64-top-edge:
    - shard-apl:          [DMESG-WARN][39] ([i915#1635] / [i915#95]) -> [PASS][40] +37 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-apl7/igt@kms_cursor_edge_walk@pipe-a-64x64-top-edge.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-apl7/igt@kms_cursor_edge_walk@pipe-a-64x64-top-edge.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-render-xtiled:
    - shard-tglb:         [DMESG-WARN][41] ([i915#402]) -> [PASS][42] +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-tglb3/igt@kms_draw_crc@draw-method-xrgb2101010-render-xtiled.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-tglb8/igt@kms_draw_crc@draw-method-xrgb2101010-render-xtiled.html

  * igt@kms_flip@flip-vs-suspend@c-dp1:
    - shard-kbl:          [DMESG-WARN][43] ([i915#180]) -> [PASS][44] +6 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-kbl2/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-kbl3/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-tglb:         [DMESG-WARN][45] ([i915#1982]) -> [PASS][46] +2 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-tglb1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-tglb3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [DMESG-FAIL][47] ([i915#95]) -> [PASS][48] +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-kbl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
    - shard-apl:          [DMESG-FAIL][49] ([i915#1635] / [i915#95]) -> [PASS][50] +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-apl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-apl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant:
    - shard-kbl:          [DMESG-FAIL][51] ([fdo#108145] / [i915#95]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-kbl3/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-kbl4/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
    - shard-apl:          [DMESG-FAIL][53] ([fdo#108145] / [i915#1635] / [i915#95]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html

  * igt@kms_plane_cursor@pipe-a-primary-size-128:
    - shard-kbl:          [DMESG-WARN][55] ([i915#93] / [i915#95]) -> [PASS][56] +48 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-kbl1/igt@kms_plane_cursor@pipe-a-primary-size-128.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-kbl6/igt@kms_plane_cursor@pipe-a-primary-size-128.html

  * igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping:
    - shard-iclb:         [DMESG-WARN][57] ([i915#1982]) -> [PASS][58] +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-iclb3/igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-iclb7/igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [SKIP][59] ([fdo#109441]) -> [PASS][60] +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-iclb7/igt@kms_psr@psr2_primary_mmap_cpu.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_setmode@basic:
    - shard-glk:          [FAIL][61] ([i915#31]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-glk1/igt@kms_setmode@basic.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-glk9/igt@kms_setmode@basic.html

  * igt@perf_pmu@semaphore-busy@rcs0:
    - shard-kbl:          [FAIL][63] ([i915#1820]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-kbl1/igt@perf_pmu@semaphore-busy@rcs0.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-kbl1/igt@perf_pmu@semaphore-busy@rcs0.html

  
#### Warnings ####

  * igt@gem_exec_reloc@basic-concurrent16:
    - shard-snb:          [FAIL][65] ([i915#1930]) -> [TIMEOUT][66] ([i915#1958] / [i915#2119])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-snb1/igt@gem_exec_reloc@basic-concurrent16.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-snb1/igt@gem_exec_reloc@basic-concurrent16.html

  * igt@kms_color@pipe-d-ctm-0-25:
    - shard-iclb:         [SKIP][67] ([fdo#109278] / [fdo#112010] / [i915#1149]) -> [SKIP][68] ([fdo#109278] / [i915#1149]) +9 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-iclb7/igt@kms_color@pipe-d-ctm-0-25.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-iclb3/igt@kms_color@pipe-d-ctm-0-25.html

  * igt@kms_content_protection@lic:
    - shard-kbl:          [TIMEOUT][69] ([i915#1319] / [i915#2119]) -> [TIMEOUT][70] ([i915#1319] / [i915#1958] / [i915#2119])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-kbl2/igt@kms_content_protection@lic.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-kbl4/igt@kms_content_protection@lic.html

  * igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen:
    - shard-iclb:         [SKIP][71] ([fdo#109279]) -> [SKIP][72] ([fdo#109278] / [fdo#109279]) +24 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-iclb6/igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-iclb4/igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen.html

  * igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding:
    - shard-iclb:         [SKIP][73] ([fdo#109278] / [fdo#112010] / [i915#508]) -> [SKIP][74] ([fdo#109278])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-iclb1/igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-iclb7/igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-iclb:         [SKIP][75] ([fdo#109274]) -> [SKIP][76] ([fdo#109274] / [fdo#109278]) +23 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-iclb4/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-iclb2/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@pipe-c-torture-move:
    - shard-snb:          [SKIP][77] ([fdo#109271]) -> [TIMEOUT][78] ([i915#1958] / [i915#2119]) +2 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-snb1/igt@kms_cursor_legacy@pipe-c-torture-move.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-snb1/igt@kms_cursor_legacy@pipe-c-torture-move.html

  * igt@kms_cursor_legacy@pipe-d-single-move:
    - shard-iclb:         [SKIP][79] ([fdo#109278] / [fdo#112010]) -> [SKIP][80] ([fdo#109278]) +74 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-iclb6/igt@kms_cursor_legacy@pipe-d-single-move.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-iclb3/igt@kms_cursor_legacy@pipe-d-single-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render:
    - shard-hsw:          [TIMEOUT][81] ([i915#1958] / [i915#2119]) -> [SKIP][82] ([fdo#109271])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-hsw4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-hsw1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_plane@plane-position-hole-dpms-pipe-d-planes:
    - shard-hsw:          [SKIP][83] ([fdo#109271]) -> [TIMEOUT][84] ([i915#1958] / [i915#2119]) +1 similar issue
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-hsw4/igt@kms_plane@plane-position-hole-dpms-pipe-d-planes.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-hsw4/igt@kms_plane@plane-position-hole-dpms-pipe-d-planes.html

  * igt@kms_plane_multiple@atomic-pipe-d-tiling-yf:
    - shard-tglb:         [SKIP][85] ([fdo#112025] / [fdo#112054]) -> [SKIP][86] ([fdo#112054])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-tglb6/igt@kms_plane_multiple@atomic-pipe-d-tiling-yf.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-tglb7/igt@kms_plane_multiple@atomic-pipe-d-tiling-yf.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-tglb:         [SKIP][87] ([fdo#111825] / [fdo#112015]) -> [SKIP][88] ([fdo#111825])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-tglb8/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-tglb6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][89] ([i915#1635] / [i915#31]) -> [DMESG-FAIL][90] ([i915#1635] / [i915#31] / [i915#95])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-apl4/igt@kms_setmode@basic.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-apl7/igt@kms_setmode@basic.html
    - shard-kbl:          [FAIL][91] ([i915#31]) -> [DMESG-WARN][92] ([i915#93] / [i915#95])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-kbl2/igt@kms_setmode@basic.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-kbl2/igt@kms_setmode@basic.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][93], [FAIL][94], [FAIL][95], [FAIL][96], [FAIL][97], [FAIL][98]) ([i915#1610] / [i915#1635] / [i915#2110]) -> [FAIL][99] ([i915#1635] / [i915#2110])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-apl6/igt@runner@aborted.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-apl4/igt@runner@aborted.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-apl3/igt@runner@aborted.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-apl7/igt@runner@aborted.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-apl2/igt@runner@aborted.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-apl7/igt@runner@aborted.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-apl3/igt@runner@aborted.html
    - shard-glk:          [FAIL][100] ([i915#2110] / [k.org#202321]) -> [FAIL][101] ([i915#1611] / [k.org#202321])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-glk2/igt@runner@aborted.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-glk6/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#112010]: https://bugs.freedesktop.org/show_bug.cgi?id=112010
  [fdo#112015]: https://bugs.freedesktop.org/show_bug.cgi?id=112015
  [fdo#112025]: https://bugs.freedesktop.org/show_bug.cgi?id=112025
  [fdo#112054]: https://bugs.freedesktop.org/show_bug.cgi?id=112054
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1185]: https://gitlab.freedesktop.org/drm/intel/issues/1185
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1610]: https://gitlab.freedesktop.org/drm/intel/issues/1610
  [i915#1611]: https://gitlab.freedesktop.org/drm/intel/issues/1611
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1820]: https://gitlab.freedesktop.org/drm/intel/issues/1820
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2110]: https://gitlab.freedesktop.org/drm/intel/issues/2110
  [i915#2119]: https://gitlab.freedesktop.org/drm/intel/issues/2119
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#508]: https://gitlab.freedesktop.org/drm/intel/issues/508
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [k.org#202321]: https://bugzilla.kernel.org/show_bug.cgi?id=202321


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5733 -> IGTPW_4757

  CI-20190529: 20190529
  CI_DRM_8732: 4c05e94181f1a8ea4c91a5bd90e81f3275b51332 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4757: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/index.html
  IGT_5733: b793b4b40e42300f165dd3fdd670c2a85bd657c6 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
