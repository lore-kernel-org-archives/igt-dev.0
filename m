Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 12 May 2020 13:27:22 -0000
Message-ID: <158929004214.18141.7917311984874435202@emeril.freedesktop.org>
References: <20200512102447.9249-1-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20200512102447.9249-1-janusz.krzysztofik@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?gem=5Fexec=5Fnop=3A_=22headless=22_requires_submicrosecond_prec?=
 =?utf-8?q?ision?=
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

Series: tests/gem_exec_nop: "headless" requires submicrosecond precision
URL   : https://patchwork.freedesktop.org/series/77186/
State : success

== Summary ==

CI Bug Log - changes from IGT_5651_full -> IGTPW_4560_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4560/index.html

Known issues
------------

  Here are the changes found in IGTPW_4560_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-sliding:
    - shard-apl:          [PASS][1] -> [FAIL][2] ([i915#54])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5651/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-256x256-sliding.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4560/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-256x256-sliding.html
    - shard-kbl:          [PASS][3] -> [FAIL][4] ([i915#54])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5651/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-256x256-sliding.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4560/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-256x256-sliding.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x85-random:
    - shard-kbl:          [PASS][5] -> [FAIL][6] ([i915#54] / [i915#93] / [i915#95]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5651/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-256x85-random.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4560/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-256x85-random.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [PASS][7] -> [DMESG-WARN][8] ([i915#180]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5651/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4560/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_legacy@pipe-c-torture-move:
    - shard-hsw:          [PASS][9] -> [DMESG-WARN][10] ([i915#128])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5651/shard-hsw1/igt@kms_cursor_legacy@pipe-c-torture-move.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4560/shard-hsw4/igt@kms_cursor_legacy@pipe-c-torture-move.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled:
    - shard-iclb:         [PASS][11] -> [FAIL][12] ([i915#52] / [i915#54])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5651/shard-iclb2/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4560/shard-iclb2/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled:
    - shard-kbl:          [PASS][13] -> [FAIL][14] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5651/shard-kbl6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4560/shard-kbl1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
    - shard-apl:          [PASS][15] -> [FAIL][16] ([i915#52] / [i915#54] / [i915#95])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5651/shard-apl4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4560/shard-apl6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:
    - shard-kbl:          [PASS][17] -> [FAIL][18] ([i915#49])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5651/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4560/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html
    - shard-apl:          [PASS][19] -> [FAIL][20] ([i915#49])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5651/shard-apl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4560/shard-apl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html

  * igt@kms_pipe_crc_basic@hang-read-crc-pipe-a:
    - shard-kbl:          [PASS][21] -> [FAIL][22] ([i915#53] / [i915#93] / [i915#95])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5651/shard-kbl1/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4560/shard-kbl6/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence:
    - shard-apl:          [PASS][23] -> [FAIL][24] ([i915#53] / [i915#95]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5651/shard-apl3/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4560/shard-apl8/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html

  * igt@kms_plane@plane-position-covered-pipe-b-planes:
    - shard-iclb:         [PASS][25] -> [FAIL][26] ([i915#247])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5651/shard-iclb1/igt@kms_plane@plane-position-covered-pipe-b-planes.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4560/shard-iclb2/igt@kms_plane@plane-position-covered-pipe-b-planes.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-128:
    - shard-kbl:          [PASS][27] -> [FAIL][28] ([i915#1559] / [i915#93] / [i915#95]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5651/shard-kbl1/igt@kms_plane_cursor@pipe-a-overlay-size-128.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4560/shard-kbl2/igt@kms_plane_cursor@pipe-a-overlay-size-128.html
    - shard-apl:          [PASS][29] -> [FAIL][30] ([i915#1559] / [i915#95]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5651/shard-apl2/igt@kms_plane_cursor@pipe-a-overlay-size-128.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4560/shard-apl6/igt@kms_plane_cursor@pipe-a-overlay-size-128.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [PASS][31] -> [FAIL][32] ([i915#173])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5651/shard-iclb6/igt@kms_psr@no_drrs.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4560/shard-iclb1/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [PASS][33] -> [SKIP][34] ([fdo#109441]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5651/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4560/shard-iclb5/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_vblank@pipe-c-ts-continuation-suspend:
    - shard-apl:          [PASS][35] -> [DMESG-WARN][36] ([i915#180])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5651/shard-apl3/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4560/shard-apl6/igt@kms_vblank@pipe-c-ts-continuation-suspend.html

  * igt@kms_vblank@pipe-d-ts-continuation-dpms-suspend:
    - shard-tglb:         [PASS][37] -> [INCOMPLETE][38] ([i915#1602])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5651/shard-tglb6/igt@kms_vblank@pipe-d-ts-continuation-dpms-suspend.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4560/shard-tglb8/igt@kms_vblank@pipe-d-ts-continuation-dpms-suspend.html

  * igt@perf@oa-formats:
    - shard-iclb:         [PASS][39] -> [SKIP][40] ([i915#405])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5651/shard-iclb6/igt@perf@oa-formats.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4560/shard-iclb6/igt@perf@oa-formats.html
    - shard-glk:          [PASS][41] -> [SKIP][42] ([fdo#109271])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5651/shard-glk7/igt@perf@oa-formats.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4560/shard-glk2/igt@perf@oa-formats.html
    - shard-apl:          [PASS][43] -> [SKIP][44] ([fdo#109271])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5651/shard-apl8/igt@perf@oa-formats.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4560/shard-apl4/igt@perf@oa-formats.html
    - shard-kbl:          [PASS][45] -> [SKIP][46] ([fdo#109271])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5651/shard-kbl3/igt@perf@oa-formats.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4560/shard-kbl4/igt@perf@oa-formats.html
    - shard-hsw:          [PASS][47] -> [SKIP][48] ([fdo#109271])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5651/shard-hsw6/igt@perf@oa-formats.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4560/shard-hsw2/igt@perf@oa-formats.html
    - shard-tglb:         [PASS][49] -> [SKIP][50] ([i915#405])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5651/shard-tglb3/igt@perf@oa-formats.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4560/shard-tglb6/igt@perf@oa-formats.html

  
#### Possible fixes ####

  * {igt@gem_exec_schedule@smoketest@bcs0}:
    - shard-tglb:         [INCOMPLETE][51] -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5651/shard-tglb8/igt@gem_exec_schedule@smoketest@bcs0.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4560/shard-tglb5/igt@gem_exec_schedule@smoketest@bcs0.html

  * igt@i915_suspend@forcewake:
    - shard-apl:          [DMESG-WARN][53] ([i915#180]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5651/shard-apl1/igt@i915_suspend@forcewake.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4560/shard-apl7/igt@i915_suspend@forcewake.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen:
    - shard-kbl:          [FAIL][55] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][56] +2 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5651/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4560/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-tglb:         [INCOMPLETE][57] ([i915#1602] / [i915#456]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5651/shard-tglb3/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4560/shard-tglb8/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [SKIP][59] ([fdo#109349]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5651/shard-iclb7/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4560/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-tglb:         [FAIL][61] ([i915#64]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5651/shard-tglb6/igt@kms_fbcon_fbt@fbc.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4560/shard-tglb2/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [SKIP][63] ([i915#433]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5651/shard-tglb8/igt@kms_hdmi_inject@inject-audio.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4560/shard-tglb5/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-kbl:          [DMESG-WARN][65] ([i915#180]) -> [PASS][66] +5 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5651/shard-kbl4/igt@kms_hdr@bpc-switch-suspend.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4560/shard-kbl3/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [FAIL][67] ([i915#53] / [i915#93] / [i915#95]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5651/shard-kbl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4560/shard-kbl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
    - shard-apl:          [FAIL][69] ([i915#53] / [i915#95]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5651/shard-apl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4560/shard-apl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-64:
    - shard-kbl:          [FAIL][71] ([i915#1559] / [i915#93] / [i915#95]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5651/shard-kbl6/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4560/shard-kbl6/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
    - shard-apl:          [FAIL][73] ([i915#1559] / [i915#95]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5651/shard-apl2/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4560/shard-apl1/igt@kms_plane_cursor@pipe-a-viewport-size-64.html

  * igt@kms_psr@psr2_primary_mmap_gtt:
    - shard-iclb:         [SKIP][75] ([fdo#109441]) -> [PASS][76] +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5651/shard-iclb6/igt@kms_psr@psr2_primary_mmap_gtt.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4560/shard-iclb2/igt@kms_psr@psr2_primary_mmap_gtt.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc6-dpms:
    - shard-kbl:          [FAIL][77] ([i915#454]) -> [FAIL][78] ([i915#454] / [i915#93] / [i915#95])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5651/shard-kbl6/igt@i915_pm_dc@dc6-dpms.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4560/shard-kbl6/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [SKIP][79] ([i915#468]) -> [FAIL][80] ([i915#454])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5651/shard-tglb2/igt@i915_pm_dc@dc6-psr.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4560/shard-tglb8/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@gem-pread:
    - shard-snb:          [SKIP][81] ([fdo#109271]) -> [INCOMPLETE][82] ([i915#82])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5651/shard-snb2/igt@i915_pm_rpm@gem-pread.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4560/shard-snb2/igt@i915_pm_rpm@gem-pread.html

  * igt@kms_content_protection@atomic:
    - shard-kbl:          [TIMEOUT][83] ([i915#1319]) -> [FAIL][84] ([fdo#110321] / [fdo#110336] / [i915#93] / [i915#95])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5651/shard-kbl4/igt@kms_content_protection@atomic.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4560/shard-kbl2/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          [TIMEOUT][85] ([i915#1319]) -> [FAIL][86] ([fdo#110321] / [fdo#110336]) +1 similar issue
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5651/shard-apl1/igt@kms_content_protection@atomic-dpms.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4560/shard-apl2/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@lic:
    - shard-apl:          [FAIL][87] ([fdo#110321]) -> [DMESG-FAIL][88] ([fdo#110321] / [i915#95])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5651/shard-apl4/igt@kms_content_protection@lic.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4560/shard-apl8/igt@kms_content_protection@lic.html

  * igt@kms_content_protection@srm:
    - shard-apl:          [TIMEOUT][89] ([i915#1319]) -> [FAIL][90] ([fdo#110321])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5651/shard-apl8/igt@kms_content_protection@srm.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4560/shard-apl1/igt@kms_content_protection@srm.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max:
    - shard-apl:          [FAIL][91] ([fdo#108145] / [i915#265]) -> [FAIL][92] ([fdo#108145] / [i915#265] / [i915#95])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5651/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4560/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max.html

  * igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max:
    - shard-kbl:          [FAIL][93] ([fdo#108145] / [i915#265]) -> [FAIL][94] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5651/shard-kbl2/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4560/shard-kbl2/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max.html

  * igt@runner@aborted:
    - shard-tglb:         [FAIL][95] -> [FAIL][96] ([i915#1602])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5651/shard-tglb3/igt@runner@aborted.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4560/shard-tglb8/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [i915#128]: https://gitlab.freedesktop.org/drm/intel/issues/128
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#247]: https://gitlab.freedesktop.org/drm/intel/issues/247
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#34]: https://gitlab.freedesktop.org/drm/intel/issues/34
  [i915#405]: https://gitlab.freedesktop.org/drm/intel/issues/405
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#53]: https://gitlab.freedesktop.org/drm/intel/issues/53
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#64]: https://gitlab.freedesktop.org/drm/intel/issues/64
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5651 -> IGTPW_4560

  CI-20190529: 20190529
  CI_DRM_8467: 1a0f0c378117fc90f421a692698ad85963ecdb3a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4560: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4560/index.html
  IGT_5651: e54e2642f1967ca3c488db32264607df670d1dfb @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4560/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
