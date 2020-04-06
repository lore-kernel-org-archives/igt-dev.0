Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 06 Apr 2020 11:33:56 -0000
Message-ID: <158617283661.4192.4383568711204189568@emeril.freedesktop.org>
References: <20200403114727.27760-1-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20200403114727.27760-1-janusz.krzysztofik@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgbGliOiBG?=
 =?utf-8?q?ix_device_lists_not_cleaned_up_sufficiently_before_rescan_=28re?=
 =?utf-8?b?djIp?=
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
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: lib: Fix device lists not cleaned up sufficiently before rescan (rev2)
URL   : https://patchwork.freedesktop.org/series/74929/
State : success

== Summary ==

CI Bug Log - changes from IGT_5561_full -> IGTPW_4401_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4401/index.html

Known issues
------------

  Here are the changes found in IGTPW_4401_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_eio@reset-stress:
    - shard-tglb:         [PASS][1] -> [INCOMPLETE][2] ([i915#1636])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5561/shard-tglb1/igt@gem_eio@reset-stress.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4401/shard-tglb8/igt@gem_eio@reset-stress.html

  * igt@gem_exec_params@invalid-bsd-ring:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#109276])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5561/shard-iclb1/igt@gem_exec_params@invalid-bsd-ring.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4401/shard-iclb5/igt@gem_exec_params@invalid-bsd-ring.html

  * igt@gem_mmap_gtt@hang:
    - shard-iclb:         [PASS][5] -> [FAIL][6] ([i915#1621])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5561/shard-iclb1/igt@gem_mmap_gtt@hang.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4401/shard-iclb7/igt@gem_mmap_gtt@hang.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-apl:          [PASS][7] -> [FAIL][8] ([i915#1618])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5561/shard-apl8/igt@gem_tiled_swapping@non-threaded.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4401/shard-apl7/igt@gem_tiled_swapping@non-threaded.html
    - shard-glk:          [PASS][9] -> [FAIL][10] ([i915#1618])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5561/shard-glk9/igt@gem_tiled_swapping@non-threaded.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4401/shard-glk9/igt@gem_tiled_swapping@non-threaded.html
    - shard-kbl:          [PASS][11] -> [FAIL][12] ([i915#1618])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5561/shard-kbl6/igt@gem_tiled_swapping@non-threaded.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4401/shard-kbl6/igt@gem_tiled_swapping@non-threaded.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [PASS][13] -> [DMESG-WARN][14] ([i915#716])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5561/shard-glk2/igt@gen9_exec_parse@allowed-all.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4401/shard-glk1/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress:
    - shard-kbl:          [PASS][15] -> [TIMEOUT][16] ([i915#1288])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5561/shard-kbl6/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4401/shard-kbl7/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
    - shard-apl:          [PASS][17] -> [TIMEOUT][18] ([i915#1288])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5561/shard-apl8/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4401/shard-apl6/igt@i915_pm_rpm@modeset-non-lpsp-stress.html

  * igt@i915_selftest@live@blt:
    - shard-hsw:          [PASS][19] -> [DMESG-FAIL][20] ([i915#1409])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5561/shard-hsw2/igt@i915_selftest@live@blt.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4401/shard-hsw6/igt@i915_selftest@live@blt.html

  * igt@kms_big_fb@linear-32bpp-rotate-0:
    - shard-kbl:          [PASS][21] -> [FAIL][22] ([i915#1119] / [i915#93] / [i915#95])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5561/shard-kbl1/igt@kms_big_fb@linear-32bpp-rotate-0.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4401/shard-kbl4/igt@kms_big_fb@linear-32bpp-rotate-0.html
    - shard-apl:          [PASS][23] -> [FAIL][24] ([i915#1119] / [i915#95])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5561/shard-apl2/igt@kms_big_fb@linear-32bpp-rotate-0.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4401/shard-apl8/igt@kms_big_fb@linear-32bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen:
    - shard-kbl:          [PASS][25] -> [FAIL][26] ([i915#54] / [i915#93] / [i915#95]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5561/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4401/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding:
    - shard-apl:          [PASS][27] -> [FAIL][28] ([i915#54] / [i915#95]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5561/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4401/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [PASS][29] -> [DMESG-WARN][30] ([i915#180]) +5 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5561/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4401/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-apl:          [PASS][31] -> [DMESG-WARN][32] ([i915#180]) +2 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5561/shard-apl7/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4401/shard-apl8/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-hsw:          [PASS][33] -> [FAIL][34] ([i915#96])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5561/shard-hsw6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4401/shard-hsw1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled:
    - shard-glk:          [PASS][35] -> [FAIL][36] ([i915#177] / [i915#52] / [i915#54])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5561/shard-glk5/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4401/shard-glk4/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html

  * igt@kms_draw_crc@draw-method-rgb565-render-untiled:
    - shard-glk:          [PASS][37] -> [FAIL][38] ([i915#52] / [i915#54]) +5 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5561/shard-glk6/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4401/shard-glk8/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-7efc:
    - shard-apl:          [PASS][39] -> [FAIL][40] ([fdo#108145] / [i915#265] / [i915#95])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5561/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4401/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-64:
    - shard-apl:          [PASS][41] -> [FAIL][42] ([i915#1559] / [i915#95])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5561/shard-apl7/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4401/shard-apl4/igt@kms_plane_cursor@pipe-a-viewport-size-64.html

  * igt@kms_prime@basic-crc:
    - shard-apl:          [PASS][43] -> [FAIL][44] ([i915#1031] / [i915#95])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5561/shard-apl6/igt@kms_prime@basic-crc.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4401/shard-apl1/igt@kms_prime@basic-crc.html
    - shard-kbl:          [PASS][45] -> [FAIL][46] ([i915#1031] / [i915#93] / [i915#95])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5561/shard-kbl2/igt@kms_prime@basic-crc.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4401/shard-kbl2/igt@kms_prime@basic-crc.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [PASS][47] -> [SKIP][48] ([fdo#109642] / [fdo#111068])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5561/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4401/shard-iclb6/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [PASS][49] -> [SKIP][50] ([fdo#109441]) +3 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5561/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4401/shard-iclb4/igt@kms_psr@psr2_cursor_mmap_cpu.html

  
#### Possible fixes ####

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [SKIP][51] ([fdo#110854]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5561/shard-iclb6/igt@gem_exec_balancer@smoke.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4401/shard-iclb1/igt@gem_exec_balancer@smoke.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-hsw:          [FAIL][53] ([i915#1618]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5561/shard-hsw1/igt@gem_tiled_swapping@non-threaded.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4401/shard-hsw2/igt@gem_tiled_swapping@non-threaded.html
    - shard-snb:          [FAIL][55] ([i915#1618]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5561/shard-snb1/igt@gem_tiled_swapping@non-threaded.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4401/shard-snb6/igt@gem_tiled_swapping@non-threaded.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-apl:          [DMESG-WARN][57] ([i915#180]) -> [PASS][58] +2 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5561/shard-apl6/igt@gem_workarounds@suspend-resume-context.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4401/shard-apl2/igt@gem_workarounds@suspend-resume-context.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-kbl:          [INCOMPLETE][59] ([i915#1423]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5561/shard-kbl2/igt@i915_module_load@reload-with-fault-injection.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4401/shard-kbl1/igt@i915_module_load@reload-with-fault-injection.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen:
    - shard-kbl:          [FAIL][61] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5561/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4401/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-dpms:
    - shard-apl:          [FAIL][63] ([i915#54]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5561/shard-apl8/igt@kms_cursor_crc@pipe-c-cursor-dpms.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4401/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-dpms.html
    - shard-kbl:          [FAIL][65] ([i915#54]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5561/shard-kbl6/igt@kms_cursor_crc@pipe-c-cursor-dpms.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4401/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-dpms.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-glk:          [FAIL][67] ([i915#72]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5561/shard-glk2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4401/shard-glk6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled:
    - shard-glk:          [FAIL][69] ([i915#52] / [i915#54]) -> [PASS][70] +4 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5561/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4401/shard-glk6/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled:
    - shard-apl:          [FAIL][71] ([i915#52] / [i915#54] / [i915#95]) -> [PASS][72] +1 similar issue
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5561/shard-apl2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4401/shard-apl4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled:
    - shard-kbl:          [FAIL][73] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95]) -> [PASS][74] +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5561/shard-kbl6/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4401/shard-kbl2/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-kbl:          [DMESG-WARN][75] ([i915#180]) -> [PASS][76] +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5561/shard-kbl6/igt@kms_flip@flip-vs-suspend-interruptible.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4401/shard-kbl6/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen:
    - shard-apl:          [FAIL][77] ([i915#49] / [i915#95]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5561/shard-apl8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4401/shard-apl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html
    - shard-kbl:          [FAIL][79] ([i915#49]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5561/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4401/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min:
    - shard-kbl:          [FAIL][81] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5561/shard-kbl2/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4401/shard-kbl1/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
    - shard-apl:          [FAIL][83] ([fdo#108145] / [i915#265] / [i915#95]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5561/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4401/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-64:
    - shard-apl:          [FAIL][85] ([i915#1559] / [i915#95]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5561/shard-apl4/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4401/shard-apl6/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
    - shard-kbl:          [FAIL][87] ([i915#1559] / [i915#93] / [i915#95]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5561/shard-kbl7/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4401/shard-kbl3/igt@kms_plane_cursor@pipe-a-overlay-size-64.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-128:
    - shard-glk:          [FAIL][89] ([i915#1559]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5561/shard-glk3/igt@kms_plane_cursor@pipe-a-viewport-size-128.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4401/shard-glk6/igt@kms_plane_cursor@pipe-a-viewport-size-128.html

  * igt@kms_psr@psr2_cursor_plane_onoff:
    - shard-iclb:         [SKIP][91] ([fdo#109441]) -> [PASS][92] +1 similar issue
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5561/shard-iclb1/igt@kms_psr@psr2_cursor_plane_onoff.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4401/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html

  * igt@kms_setmode@basic:
    - shard-hsw:          [FAIL][93] ([i915#31]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5561/shard-hsw4/igt@kms_setmode@basic.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4401/shard-hsw4/igt@kms_setmode@basic.html
    - shard-kbl:          [FAIL][95] ([i915#31]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5561/shard-kbl6/igt@kms_setmode@basic.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4401/shard-kbl2/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [DMESG-WARN][97] ([i915#180] / [i915#93] / [i915#95]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5561/shard-kbl2/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4401/shard-kbl1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * {igt@perf@blocking-parameterized}:
    - shard-kbl:          [FAIL][99] ([i915#1542]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5561/shard-kbl2/igt@perf@blocking-parameterized.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4401/shard-kbl1/igt@perf@blocking-parameterized.html
    - shard-iclb:         [FAIL][101] ([i915#1542]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5561/shard-iclb2/igt@perf@blocking-parameterized.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4401/shard-iclb5/igt@perf@blocking-parameterized.html
    - shard-hsw:          [FAIL][103] ([i915#1542]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5561/shard-hsw6/igt@perf@blocking-parameterized.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4401/shard-hsw4/igt@perf@blocking-parameterized.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [FAIL][105] ([i915#454]) -> [SKIP][106] ([i915#468])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5561/shard-tglb1/igt@i915_pm_dc@dc6-dpms.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4401/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [SKIP][107] ([i915#468]) -> [FAIL][108] ([i915#454])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5561/shard-tglb2/igt@i915_pm_dc@dc6-psr.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4401/shard-tglb6/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:
    - shard-kbl:          [FAIL][109] ([fdo#108145] / [i915#265]) -> [FAIL][110] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5561/shard-kbl1/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4401/shard-kbl6/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html

  * igt@kms_sysfs_edid_timing:
    - shard-apl:          [FAIL][111] ([IGT#2] / [i915#95]) -> [FAIL][112] ([IGT#2])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5561/shard-apl7/igt@kms_sysfs_edid_timing.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4401/shard-apl2/igt@kms_sysfs_edid_timing.html
    - shard-kbl:          [FAIL][113] ([IGT#2] / [i915#93] / [i915#95]) -> [FAIL][114] ([IGT#2])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5561/shard-kbl7/igt@kms_sysfs_edid_timing.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4401/shard-kbl6/igt@kms_sysfs_edid_timing.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [i915#1031]: https://gitlab.freedesktop.org/drm/intel/issues/1031
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#1288]: https://gitlab.freedesktop.org/drm/intel/issues/1288
  [i915#1409]: https://gitlab.freedesktop.org/drm/intel/issues/1409
  [i915#1423]: https://gitlab.freedesktop.org/drm/intel/issues/1423
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#1618]: https://gitlab.freedesktop.org/drm/intel/issues/1618
  [i915#1621]: https://gitlab.freedesktop.org/drm/intel/issues/1621
  [i915#1636]: https://gitlab.freedesktop.org/drm/intel/issues/1636
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [i915#96]: https://gitlab.freedesktop.org/drm/intel/issues/96


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5561 -> IGTPW_4401

  CI-20190529: 20190529
  CI_DRM_8244: 55348aac86bd6f0c4ce4d3d8a0e227f6a20a72f9 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4401: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4401/index.html
  IGT_5561: 860a72c190aa9246055f20ac87a02a26fe1842e8 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4401/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
