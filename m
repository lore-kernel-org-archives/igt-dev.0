Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 15 Jul 2020 11:54:35 -0000
Message-ID: <159481407502.3436.6455168641085251582@emeril.freedesktop.org>
References: <20200711200602.3217-1-mohammed.khajapasha@intel.com>
In-Reply-To: <20200711200602.3217-1-mohammed.khajapasha@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgbGliL2ln?=
 =?utf-8?q?t=5Fkms=3A_Add_support_for_display_with_=28rev7=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1084482762=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1084482762==
Content-Type: multipart/alternative;
 boundary="===============3479278302493186593=="

--===============3479278302493186593==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/igt_kms: Add support for display with (rev7)
URL   : https://patchwork.freedesktop.org/series/78482/
State : success

== Summary ==

CI Bug Log - changes from IGT_5733_full -> IGTPW_4757_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/index.html

Known issues
------------

  Here are the changes found in IGTPW_4757_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic:
    - shard-hsw:          [PASS][1] -> [TIMEOUT][2] ([i915#1958] / [i915#2119]) +3 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-hsw6/igt@gem_exec_suspend@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-hsw4/igt@gem_exec_suspend@basic.html
    - shard-snb:          [PASS][3] -> [TIMEOUT][4] ([i915#1958] / [i915#2119]) +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-snb5/igt@gem_exec_suspend@basic.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-snb1/igt@gem_exec_suspend@basic.html

  * igt@gem_mmap_gtt@fault-concurrent:
    - shard-glk:          [PASS][5] -> [DMESG-WARN][6] ([i915#2165])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-glk3/igt@gem_mmap_gtt@fault-concurrent.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-glk6/igt@gem_mmap_gtt@fault-concurrent.html

  * igt@kms_addfb_basic@legacy-format:
    - shard-kbl:          [PASS][7] -> [DMESG-WARN][8] ([i915#93] / [i915#95]) +31 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-kbl1/igt@kms_addfb_basic@legacy-format.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-kbl4/igt@kms_addfb_basic@legacy-format.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-random:
    - shard-apl:          [PASS][9] -> [DMESG-FAIL][10] ([i915#1635] / [i915#54] / [i915#95]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-apl1/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-sliding:
    - shard-apl:          [PASS][11] -> [DMESG-WARN][12] ([i915#1635] / [i915#95]) +20 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-256x256-sliding.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-256x256-sliding.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen:
    - shard-kbl:          [PASS][13] -> [DMESG-FAIL][14] ([i915#54] / [i915#95]) +3 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html

  * igt@kms_cursor_edge_walk@pipe-b-128x128-top-edge:
    - shard-glk:          [PASS][15] -> [DMESG-WARN][16] ([i915#1982])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-glk6/igt@kms_cursor_edge_walk@pipe-b-128x128-top-edge.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-glk8/igt@kms_cursor_edge_walk@pipe-b-128x128-top-edge.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a2:
    - shard-glk:          [PASS][17] -> [FAIL][18] ([i915#79])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-glk2/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a2.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-glk6/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a2.html

  * igt@kms_flip@flip-vs-suspend@a-dp1:
    - shard-kbl:          [PASS][19] -> [DMESG-WARN][20] ([i915#180]) +2 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-kbl2/igt@kms_flip@flip-vs-suspend@a-dp1.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-kbl3/igt@kms_flip@flip-vs-suspend@a-dp1.html

  * igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw:
    - shard-tglb:         [PASS][21] -> [DMESG-WARN][22] ([i915#1982])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-tglb1/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-tglb6/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:
    - shard-iclb:         [PASS][23] -> [INCOMPLETE][24] ([i915#1185])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-iclb5/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-iclb3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [PASS][25] -> [SKIP][26] ([fdo#109441]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-iclb2/igt@kms_psr@psr2_cursor_render.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-iclb3/igt@kms_psr@psr2_cursor_render.html

  
#### Possible fixes ####

  * igt@gem_exec_whisper@basic-normal-all:
    - shard-glk:          [DMESG-WARN][27] ([i915#118] / [i915#95]) -> [PASS][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-glk7/igt@gem_exec_whisper@basic-normal-all.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-glk6/igt@gem_exec_whisper@basic-normal-all.html

  * igt@kms_big_fb@linear-64bpp-rotate-0:
    - shard-apl:          [DMESG-WARN][29] ([i915#1635] / [i915#1982]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-apl2/igt@kms_big_fb@linear-64bpp-rotate-0.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-apl1/igt@kms_big_fb@linear-64bpp-rotate-0.html
    - shard-glk:          [DMESG-FAIL][31] ([i915#118] / [i915#95]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-glk8/igt@kms_big_fb@linear-64bpp-rotate-0.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-glk9/igt@kms_big_fb@linear-64bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-rapid-movement:
    - shard-hsw:          [TIMEOUT][33] ([i915#1958] / [i915#2119]) -> [PASS][34] +2 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-hsw4/igt@kms_cursor_crc@pipe-a-cursor-128x128-rapid-movement.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-hsw7/igt@kms_cursor_crc@pipe-a-cursor-128x128-rapid-movement.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-offscreen:
    - shard-kbl:          [DMESG-FAIL][35] ([i915#54] / [i915#95]) -> [PASS][36] +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-256x256-offscreen.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-256x256-offscreen.html

  * igt@kms_cursor_edge_walk@pipe-a-64x64-top-edge:
    - shard-apl:          [DMESG-WARN][37] ([i915#1635] / [i915#95]) -> [PASS][38] +37 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-apl7/igt@kms_cursor_edge_walk@pipe-a-64x64-top-edge.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-apl7/igt@kms_cursor_edge_walk@pipe-a-64x64-top-edge.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-render-xtiled:
    - shard-tglb:         [DMESG-WARN][39] ([i915#402]) -> [PASS][40] +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-tglb3/igt@kms_draw_crc@draw-method-xrgb2101010-render-xtiled.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-tglb8/igt@kms_draw_crc@draw-method-xrgb2101010-render-xtiled.html

  * igt@kms_flip@flip-vs-suspend@c-dp1:
    - shard-kbl:          [DMESG-WARN][41] ([i915#180]) -> [PASS][42] +6 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-kbl2/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-kbl3/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-tglb:         [DMESG-WARN][43] ([i915#1982]) -> [PASS][44] +2 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-tglb1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-tglb3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [DMESG-FAIL][45] ([i915#95]) -> [PASS][46] +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-kbl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
    - shard-apl:          [DMESG-FAIL][47] ([i915#1635] / [i915#95]) -> [PASS][48] +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-apl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-apl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant:
    - shard-kbl:          [DMESG-FAIL][49] ([fdo#108145] / [i915#95]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-kbl3/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-kbl4/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
    - shard-apl:          [DMESG-FAIL][51] ([fdo#108145] / [i915#1635] / [i915#95]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html

  * igt@kms_plane_cursor@pipe-a-primary-size-128:
    - shard-kbl:          [DMESG-WARN][53] ([i915#93] / [i915#95]) -> [PASS][54] +48 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-kbl1/igt@kms_plane_cursor@pipe-a-primary-size-128.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-kbl6/igt@kms_plane_cursor@pipe-a-primary-size-128.html

  * igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping:
    - shard-iclb:         [DMESG-WARN][55] ([i915#1982]) -> [PASS][56] +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-iclb3/igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-iclb7/igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [SKIP][57] ([fdo#109441]) -> [PASS][58] +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-iclb7/igt@kms_psr@psr2_primary_mmap_cpu.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_setmode@basic:
    - shard-glk:          [FAIL][59] ([i915#31]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-glk1/igt@kms_setmode@basic.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-glk9/igt@kms_setmode@basic.html

  * igt@perf_pmu@semaphore-busy@rcs0:
    - shard-kbl:          [FAIL][61] ([i915#1820]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-kbl1/igt@perf_pmu@semaphore-busy@rcs0.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-kbl1/igt@perf_pmu@semaphore-busy@rcs0.html

  
#### Warnings ####

  * igt@gem_exec_reloc@basic-concurrent16:
    - shard-snb:          [FAIL][63] ([i915#1930]) -> [TIMEOUT][64] ([i915#1958] / [i915#2119])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-snb1/igt@gem_exec_reloc@basic-concurrent16.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-snb1/igt@gem_exec_reloc@basic-concurrent16.html

  * igt@kms_color@pipe-d-ctm-0-25:
    - shard-iclb:         [SKIP][65] ([fdo#109278] / [fdo#112010] / [i915#1149]) -> [SKIP][66] ([fdo#109278] / [i915#1149]) +9 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-iclb7/igt@kms_color@pipe-d-ctm-0-25.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-iclb3/igt@kms_color@pipe-d-ctm-0-25.html

  * igt@kms_content_protection@lic:
    - shard-kbl:          [TIMEOUT][67] ([i915#1319] / [i915#2119]) -> [TIMEOUT][68] ([i915#1319] / [i915#1958] / [i915#2119])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-kbl2/igt@kms_content_protection@lic.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-kbl4/igt@kms_content_protection@lic.html

  * igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen:
    - shard-iclb:         [SKIP][69] ([fdo#109279]) -> [SKIP][70] ([fdo#109278] / [fdo#109279]) +24 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-iclb6/igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-iclb4/igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen.html

  * igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding:
    - shard-iclb:         [SKIP][71] ([fdo#109278] / [fdo#112010] / [i915#508]) -> [SKIP][72] ([fdo#109278])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-iclb1/igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-iclb7/igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-iclb:         [SKIP][73] ([fdo#109274]) -> [SKIP][74] ([fdo#109274] / [fdo#109278]) +23 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-iclb4/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-iclb2/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@pipe-c-torture-move:
    - shard-snb:          [SKIP][75] ([fdo#109271]) -> [TIMEOUT][76] ([i915#1958] / [i915#2119]) +2 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-snb1/igt@kms_cursor_legacy@pipe-c-torture-move.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-snb1/igt@kms_cursor_legacy@pipe-c-torture-move.html

  * igt@kms_cursor_legacy@pipe-d-single-move:
    - shard-iclb:         [SKIP][77] ([fdo#109278] / [fdo#112010]) -> [SKIP][78] ([fdo#109278]) +74 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-iclb6/igt@kms_cursor_legacy@pipe-d-single-move.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-iclb3/igt@kms_cursor_legacy@pipe-d-single-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render:
    - shard-hsw:          [TIMEOUT][79] ([i915#1958] / [i915#2119]) -> [SKIP][80] ([fdo#109271])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-hsw4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-hsw1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_plane@plane-position-hole-dpms-pipe-d-planes:
    - shard-hsw:          [SKIP][81] ([fdo#109271]) -> [TIMEOUT][82] ([i915#1958] / [i915#2119]) +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-hsw4/igt@kms_plane@plane-position-hole-dpms-pipe-d-planes.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-hsw4/igt@kms_plane@plane-position-hole-dpms-pipe-d-planes.html

  * igt@kms_plane_multiple@atomic-pipe-d-tiling-yf:
    - shard-tglb:         [SKIP][83] ([fdo#112025] / [fdo#112054]) -> [SKIP][84] ([fdo#112054])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-tglb6/igt@kms_plane_multiple@atomic-pipe-d-tiling-yf.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-tglb7/igt@kms_plane_multiple@atomic-pipe-d-tiling-yf.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-tglb:         [SKIP][85] ([fdo#111825] / [fdo#112015]) -> [SKIP][86] ([fdo#111825])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-tglb8/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-tglb6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][87] ([i915#1635] / [i915#31]) -> [DMESG-FAIL][88] ([i915#1635] / [i915#31] / [i915#95])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-apl4/igt@kms_setmode@basic.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-apl7/igt@kms_setmode@basic.html
    - shard-kbl:          [FAIL][89] ([i915#31]) -> [DMESG-WARN][90] ([i915#93] / [i915#95])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-kbl2/igt@kms_setmode@basic.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-kbl2/igt@kms_setmode@basic.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][91], [FAIL][92], [FAIL][93], [FAIL][94], [FAIL][95], [FAIL][96]) ([i915#1610] / [i915#1635] / [i915#2110]) -> [FAIL][97] ([i915#1635] / [i915#2110])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-apl6/igt@runner@aborted.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-apl4/igt@runner@aborted.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-apl3/igt@runner@aborted.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-apl7/igt@runner@aborted.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-apl2/igt@runner@aborted.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-apl7/igt@runner@aborted.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-apl3/igt@runner@aborted.html
    - shard-glk:          [FAIL][98] ([i915#2110] / [k.org#202321]) -> [FAIL][99] ([i915#1611] / [k.org#202321])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-glk2/igt@runner@aborted.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-glk6/igt@runner@aborted.html

  
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
  [i915#2165]: https://gitlab.freedesktop.org/drm/intel/issues/2165
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

--===============3479278302493186593==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


<!DOCTYPE html>
<html xmlns=3D"http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8"/>
  <title>Project List - Patchwork</title>
  <style id=3D"css-table-select" type=3D"text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>lib/igt_kms: Add support for display with (r=
ev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/78482/">https://patchwork.freedesktop.org/series/78482/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_4757/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_4757/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_5733_full -&gt; IGTPW_4757_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/index.=
html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_4757_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic:</p>
<ul>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5733/shard-hsw6/igt@gem_exec_suspend@basic.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-hsw4/igt@gem_=
exec_suspend@basic.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/1958">i915#1958</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/2119">i915#2119</a>) +3 similar issues</p>
</li>
<li>
<p>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5733/shard-snb5/igt@gem_exec_suspend@basic.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-snb1/igt@gem_=
exec_suspend@basic.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/1958">i915#1958</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/2119">i915#2119</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@fault-concurrent:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5733/shard-glk3/igt@gem_mmap_gtt@fault-concurrent.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-glk6/=
igt@gem_mmap_gtt@fault-concurrent.html">DMESG-WARN</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/2165">i915#2165</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@legacy-format:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5733/shard-kbl1/igt@kms_addfb_basic@legacy-format.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-kbl4/=
igt@kms_addfb_basic@legacy-format.html">DMESG-WARN</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/93">i915#93</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) +31 similar issu=
es</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-128x128-random:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5733/shard-apl1/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_47=
57/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html">DMESG-F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i=
915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5=
4">i915#54</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/95">i915#95</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-256x256-sliding:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5733/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-256x256-sliding.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4=
757/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-256x256-sliding.html">DMESG=
-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635"=
>i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/95">i915#95</a>) +20 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5733/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_47=
57/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html">DMESG-F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/54">i91=
5#54</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/95">i=
915#95</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-b-128x128-top-edge:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5733/shard-glk6/igt@kms_cursor_edge_walk@pipe-b-128x128-top-edge.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4=
757/shard-glk8/igt@kms_cursor_edge_walk@pipe-b-128x128-top-edge.html">DMESG=
-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982"=
>i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5733/shard-glk2/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a2.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757=
/shard-glk6/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a2.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5733/shard-kbl2/igt@kms_flip@flip-vs-suspend@a-dp1.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-kbl3=
/igt@kms_flip@flip-vs-suspend@a-dp1.html">DMESG-WARN</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) +2 similar iss=
ues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5733/shard-tglb1/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidr=
aw.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_4757/shard-tglb6/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multi=
draw.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5733/shard-iclb5/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_47=
57/shard-iclb3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html">INCOMPL=
ETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1185">i=
915#1185</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_render:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5733/shard-iclb2/igt@kms_psr@psr2_cursor_render.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-iclb3/i=
gt@kms_psr@psr2_cursor_render.html">SKIP</a> (<a href=3D"https://bugs.freed=
esktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_whisper@basic-normal-all:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5733/shard-glk7/igt@gem_exec_whisper@basic-normal-all.html">DMESG-WARN=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/118">i915#=
118</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/95">i9=
15#95</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
4757/shard-glk6/igt@gem_exec_whisper@basic-normal-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-0:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5733/shard-apl2/igt@kms_big_fb@linear-64bpp-rotate-0.html">DMESG-WARN</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1=
635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982">=
i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_4757/shard-apl1/igt@kms_big_fb@linear-64bpp-rotate-0.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5733/shard-glk8/igt@kms_big_fb@linear-64bpp-rotate-0.html">DMESG-FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/118">i915#11=
8</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/95">i915=
#95</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_47=
57/shard-glk9/igt@kms_big_fb@linear-64bpp-rotate-0.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-128x128-rapid-movement:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5733/shard-hsw4/igt@kms_cursor_crc@pipe-a-cursor-128x128-rapid-movemen=
t.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/1958">i915#1958</a> / <a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/2119">i915#2119</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_4757/shard-hsw7/igt@kms_cursor_crc@pipe-a-cursor-128x1=
28-rapid-movement.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-256x256-offscreen:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5733/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-256x256-offscreen.htm=
l">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/54">i915#54</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/95">i915#95</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_4757/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-256x256-offscre=
en.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-a-64x64-top-edge:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5733/shard-apl7/igt@kms_cursor_edge_walk@pipe-a-64x64-top-edge.html">D=
MESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1=
635">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/95">i915#95</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_4757/shard-apl7/igt@kms_cursor_edge_walk@pipe-a-64x64-top-edge.h=
tml">PASS</a> +37 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-render-xtiled:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5733/shard-tglb3/igt@kms_draw_crc@draw-method-xrgb2101010-render-xtile=
d.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/402">i915#402</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_4757/shard-tglb8/igt@kms_draw_crc@draw-method-xrgb2101010-r=
ender-xtiled.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5733/shard-kbl2/igt@kms_flip@flip-vs-suspend@c-dp1.html">DMESG-WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/=
shard-kbl3/igt@kms_flip@flip-vs-suspend@c-dp1.html">PASS</a> +6 similar iss=
ues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5733/shard-tglb1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrf=
b-draw-mmap-cpu.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-tglb3/igt@kms_frontbuffer_tracki=
ng@psr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html">PASS</a> +2 similar issues=
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5733/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">DM=
ESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/95=
">i915#95</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_4757/shard-kbl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">PA=
SS</a> +1 similar issue</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5733/shard-apl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">DM=
ESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/16=
35">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/95">i915#95</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_4757/shard-apl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.ht=
ml">PASS</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5733/shard-kbl3/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs=
-constant.html">DMESG-FAIL</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_4757/shard-kbl4/igt@kms_plane_alpha_blend@pip=
e-a-coverage-vs-premult-vs-constant.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5733/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs=
-constant.html">DMESG-FAIL</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/1635">i915#1635</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-apl2/igt@kms_plane_alpha_ble=
nd@pipe-a-coverage-vs-premult-vs-constant.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@pipe-a-primary-size-128:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5733/shard-kbl1/igt@kms_plane_cursor@pipe-a-primary-size-128.html">DME=
SG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/93"=
>i915#93</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/9=
5">i915#95</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_4757/shard-kbl6/igt@kms_plane_cursor@pipe-a-primary-size-128.html">PAS=
S</a> +48 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5733/shard-iclb3/igt@kms_plane_scaling@pipe-a-scaler-with-clipping-cla=
mping.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_4757/shard-iclb7/igt@kms_plane_scaling@pipe-a-scaler-=
with-clipping-clamping.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5733/shard-iclb7/igt@kms_psr@psr2_primary_mmap_cpu.html">SKIP</a> (<a =
href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/sh=
ard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html">PASS</a> +1 similar issue=
</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5733/shard-glk1/igt@kms_setmode@basic.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/31">i915#31</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-glk9/igt@kms_=
setmode@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@semaphore-busy@rcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5733/shard-kbl1/igt@perf_pmu@semaphore-busy@rcs0.html">FAIL</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/1820">i915#1820</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-=
kbl1/igt@perf_pmu@semaphore-busy@rcs0.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_reloc@basic-concurrent16:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5733/shard-snb1/igt@gem_exec_reloc@basic-concurrent16.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1930">i915#1930<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/s=
hard-snb1/igt@gem_exec_reloc@basic-concurrent16.html">TIMEOUT</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-0-25:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5733/shard-iclb7/igt@kms_color@pipe-d-ctm-0-25.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109278">fdo#109278</a> /=
 <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112010">fdo#1120=
10</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1149">i=
915#1149</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_4757/shard-iclb3/igt@kms_color@pipe-d-ctm-0-25.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109278">fdo#109278</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1149">i915#1149=
</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5733/shard-kbl2/igt@kms_content_protection@lic.html">TIMEOUT</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/1319">i915#1319</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#211=
9</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757=
/shard-kbl4/igt@kms_content_protection@lic.html">TIMEOUT</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/1319">i915#1319</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5733/shard-iclb6/igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
279">fdo#109279</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_4757/shard-iclb4/igt@kms_cursor_crc@pipe-b-cursor-512x170-offscre=
en.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109278">fdo#109278</a> / <a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D109279">fdo#109279</a>) +24 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5733/shard-iclb1/igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109278"=
>fdo#109278</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D112010">fdo#112010</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/508">i915#508</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_4757/shard-iclb7/igt@kms_cursor_crc@pipe-d-cursor-64x21=
-sliding.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109278">fdo#109278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5733/shard-iclb4/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109274"=
>fdo#109274</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_4757/shard-iclb2/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109274=
">fdo#109274</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109278">fdo#109278</a>) +23 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@pipe-c-torture-move:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5733/shard-snb1/igt@kms_cursor_legacy@pipe-c-torture-move.html">SKIP</=
a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#1=
09271</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
4757/shard-snb1/igt@kms_cursor_legacy@pipe-c-torture-move.html">TIMEOUT</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#195=
8</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2119">i9=
15#2119</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@pipe-d-single-move:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5733/shard-iclb6/igt@kms_cursor_legacy@pipe-d-single-move.html">SKIP</=
a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109278">fdo#1=
09278</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D11201=
0">fdo#112010</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_4757/shard-iclb3/igt@kms_cursor_legacy@pipe-d-single-move.html">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109278">fd=
o#109278</a>) +74 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render:</=
p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5733/shard-hsw4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-in=
dfb-draw-render.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/1958">i915#1958</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/2119">i915#2119</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-hsw1/igt@kms_frontbuffer_trac=
king@fbcpsr-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"ht=
tps://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms-pipe-d-planes:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5733/shard-hsw4/igt@kms_plane@plane-position-hole-dpms-pipe-d-planes.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_4757/shard-hsw4/igt@kms_plane@plane-position-hole-dpms-pipe-d-pl=
anes.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/1958">i915#1958</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/2119">i915#2119</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@atomic-pipe-d-tiling-yf:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5733/shard-tglb6/igt@kms_plane_multiple@atomic-pipe-d-tiling-yf.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112025"=
>fdo#112025</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D112054">fdo#112054</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_4757/shard-tglb7/igt@kms_plane_multiple@atomic-pipe-d-tilin=
g-yf.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D112054">fdo#112054</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5733/shard-tglb8/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111825">fdo=
#111825</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112=
015">fdo#112015</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_4757/shard-tglb6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111825=
">fdo#111825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5733/shard-apl4/igt@kms_setmode@basic.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/31">i915#31</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-apl7/igt@k=
ms_setmode@basic.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/1635">i915#1635</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/31">i915#31</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/95">i915#95</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5733/shard-kbl2/igt@kms_setmode@basic.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/31">i915#31</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-kbl2/igt@kms_set=
mode@basic.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/93">i915#93</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/95">i915#95</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5733/shard-apl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-apl4/igt@runner@aborted.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/s=
hard-apl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGT_5733/shard-apl7/igt@runner@aborted.html">FAIL</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-apl2/i=
gt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGT_5733/shard-apl7/igt@runner@aborted.html">FAIL</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1610">i915#1610</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2110">i915#=
2110</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4=
757/shard-apl3/igt@runner@aborted.html">FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/2110">i915#2110</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5733/shard-glk2/igt@runner@aborted.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/2110">i915#2110</a> / <a href=3D"htt=
ps://bugzilla.kernel.org/show_bug.cgi?id=3D202321">k.org#202321</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/shard-glk6/i=
gt@runner@aborted.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/1611">i915#1611</a> / <a href=3D"https://bugzilla.kernel.=
org/show_bug.cgi?id=3D202321">k.org#202321</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5733 -&gt; IGTPW_4757</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_8732: 4c05e94181f1a8ea4c91a5bd90e81f3275b51332 @ git://anongit.fre=
edesktop.org/gfx-ci/linux<br />
  IGTPW_4757: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4757/index.htm=
l<br />
  IGT_5733: b793b4b40e42300f165dd3fdd670c2a85bd657c6 @ git://anongit.freede=
sktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============3479278302493186593==--

--===============1084482762==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1084482762==--
