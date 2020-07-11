Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sat, 11 Jul 2020 19:56:32 -0000
Message-ID: <159449739297.9234.10562862290228075931@emeril.freedesktop.org>
References: <20200711180457.1824-1-mohammed.khajapasha@intel.com>
In-Reply-To: <20200711180457.1824-1-mohammed.khajapasha@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliL2ln?=
 =?utf-8?q?t=5Fkms=3A_Add_support_for_display_with_=28rev6=29?=
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

Series: lib/igt_kms: Add support for display with (rev6)
URL   : https://patchwork.freedesktop.org/series/78482/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5733_full -> IGTPW_4756_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4756_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4756_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4756/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4756_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-tglb:         NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4756/shard-tglb2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
    - shard-iclb:         NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4756/shard-iclb1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  
Known issues
------------

  Here are the changes found in IGTPW_4756_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@preservation-s3@bcs0:
    - shard-kbl:          [PASS][3] -> [DMESG-WARN][4] ([i915#180]) +3 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@bcs0.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4756/shard-kbl4/igt@gem_ctx_isolation@preservation-s3@bcs0.html

  * igt@gem_exec_reloc@basic-wc-gtt:
    - shard-snb:          [PASS][5] -> [TIMEOUT][6] ([i915#1958] / [i915#2119]) +2 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-snb5/igt@gem_exec_reloc@basic-wc-gtt.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4756/shard-snb5/igt@gem_exec_reloc@basic-wc-gtt.html

  * igt@gem_exec_suspend@basic:
    - shard-apl:          [PASS][7] -> [DMESG-WARN][8] ([i915#1635] / [i915#95]) +38 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-apl7/igt@gem_exec_suspend@basic.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4756/shard-apl1/igt@gem_exec_suspend@basic.html

  * igt@gem_exec_whisper@basic-fds-all:
    - shard-glk:          [PASS][9] -> [DMESG-WARN][10] ([i915#118] / [i915#95]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-glk3/igt@gem_exec_whisper@basic-fds-all.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4756/shard-glk2/igt@gem_exec_whisper@basic-fds-all.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-kbl:          [PASS][11] -> [DMESG-WARN][12] ([i915#1436] / [i915#716])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-kbl6/igt@gen9_exec_parse@allowed-all.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4756/shard-kbl7/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_module_load@reload:
    - shard-tglb:         [PASS][13] -> [DMESG-WARN][14] ([i915#402]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-tglb1/igt@i915_module_load@reload.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4756/shard-tglb7/igt@i915_module_load@reload.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-glk:          [PASS][15] -> [DMESG-FAIL][16] ([i915#118] / [i915#95])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-glk5/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4756/shard-glk8/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
    - shard-apl:          [PASS][17] -> [DMESG-WARN][18] ([i915#1635] / [i915#1982])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-apl6/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4756/shard-apl3/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-onscreen:
    - shard-kbl:          [PASS][19] -> [DMESG-FAIL][20] ([i915#54] / [i915#95])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-128x128-onscreen.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4756/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-128x128-onscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-tglb:         [PASS][21] -> [INCOMPLETE][22] ([i915#1798] / [i915#456])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-tglb8/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4756/shard-tglb8/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-stridechange:
    - shard-glk:          [PASS][23] -> [DMESG-WARN][24] ([i915#1982]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-glk9/igt@kms_frontbuffer_tracking@fbc-stridechange.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4756/shard-glk6/igt@kms_frontbuffer_tracking@fbc-stridechange.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render:
    - shard-tglb:         [PASS][25] -> [DMESG-WARN][26] ([i915#1982]) +2 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-tglb3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4756/shard-tglb5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-snb:          [PASS][27] -> [SKIP][28] ([fdo#109271]) +3 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-snb2/igt@kms_hdmi_inject@inject-audio.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4756/shard-snb4/igt@kms_hdmi_inject@inject-audio.html
    - shard-tglb:         [PASS][29] -> [SKIP][30] ([i915#433])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-tglb3/igt@kms_hdmi_inject@inject-audio.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4756/shard-tglb3/igt@kms_hdmi_inject@inject-audio.html
    - shard-kbl:          [PASS][31] -> [SKIP][32] ([fdo#109271])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-kbl4/igt@kms_hdmi_inject@inject-audio.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4756/shard-kbl2/igt@kms_hdmi_inject@inject-audio.html
    - shard-iclb:         [PASS][33] -> [SKIP][34] ([i915#433])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-iclb2/igt@kms_hdmi_inject@inject-audio.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4756/shard-iclb2/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-iclb:         [PASS][35] -> [DMESG-WARN][36] ([i915#1982])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-iclb4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4756/shard-iclb7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [PASS][37] -> [SKIP][38] ([fdo#109441]) +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-iclb2/igt@kms_psr@psr2_cursor_render.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4756/shard-iclb4/igt@kms_psr@psr2_cursor_render.html

  * igt@perf@blocking-parameterized:
    - shard-kbl:          [PASS][39] -> [FAIL][40] ([i915#1542])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-kbl7/igt@perf@blocking-parameterized.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4756/shard-kbl7/igt@perf@blocking-parameterized.html

  * igt@syncobj_wait@invalid-wait-zero-handles:
    - shard-kbl:          [PASS][41] -> [DMESG-WARN][42] ([i915#93] / [i915#95]) +47 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-kbl4/igt@syncobj_wait@invalid-wait-zero-handles.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4756/shard-kbl7/igt@syncobj_wait@invalid-wait-zero-handles.html

  
#### Possible fixes ####

  * igt@gem_exec_whisper@basic-normal-all:
    - shard-glk:          [DMESG-WARN][43] ([i915#118] / [i915#95]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-glk7/igt@gem_exec_whisper@basic-normal-all.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4756/shard-glk4/igt@gem_exec_whisper@basic-normal-all.html

  * igt@i915_pm_rps@waitboost:
    - shard-apl:          [FAIL][45] ([i915#1635] / [i915#39]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-apl1/igt@i915_pm_rps@waitboost.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4756/shard-apl6/igt@i915_pm_rps@waitboost.html

  * igt@kms_big_fb@linear-64bpp-rotate-0:
    - shard-apl:          [DMESG-WARN][47] ([i915#1635] / [i915#1982]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-apl2/igt@kms_big_fb@linear-64bpp-rotate-0.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4756/shard-apl3/igt@kms_big_fb@linear-64bpp-rotate-0.html
    - shard-glk:          [DMESG-FAIL][49] ([i915#118] / [i915#95]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-glk8/igt@kms_big_fb@linear-64bpp-rotate-0.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4756/shard-glk6/igt@kms_big_fb@linear-64bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-rapid-movement:
    - shard-hsw:          [TIMEOUT][51] ([i915#1958] / [i915#2119]) -> [PASS][52] +2 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-hsw4/igt@kms_cursor_crc@pipe-a-cursor-128x128-rapid-movement.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4756/shard-hsw1/igt@kms_cursor_crc@pipe-a-cursor-128x128-rapid-movement.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-offscreen:
    - shard-kbl:          [DMESG-FAIL][53] ([i915#54] / [i915#95]) -> [PASS][54] +2 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-256x256-offscreen.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4756/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-256x256-offscreen.html

  * igt@kms_cursor_edge_walk@pipe-a-64x64-top-edge:
    - shard-apl:          [DMESG-WARN][55] ([i915#1635] / [i915#95]) -> [PASS][56] +36 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-apl7/igt@kms_cursor_edge_walk@pipe-a-64x64-top-edge.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4756/shard-apl4/igt@kms_cursor_edge_walk@pipe-a-64x64-top-edge.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-ytiled:
    - shard-tglb:         [DMESG-WARN][57] ([i915#402]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-tglb1/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-ytiled.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4756/shard-tglb8/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-ytiled.html

  * igt@kms_flip@flip-vs-suspend@c-dp1:
    - shard-kbl:          [DMESG-WARN][59] ([i915#180]) -> [PASS][60] +5 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-kbl2/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4756/shard-kbl1/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:
    - shard-iclb:         [DMESG-WARN][61] ([i915#1982]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4756/shard-iclb4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy:
    - shard-tglb:         [DMESG-WARN][63] ([i915#1982]) -> [PASS][64] +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4756/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [DMESG-FAIL][65] ([i915#95]) -> [PASS][66] +1 similar issue
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4756/shard-kbl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
    - shard-apl:          [DMESG-FAIL][67] ([i915#1635] / [i915#95]) -> [PASS][68] +1 similar issue
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-apl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4756/shard-apl8/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant:
    - shard-kbl:          [DMESG-FAIL][69] ([fdo#108145] / [i915#95]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-kbl3/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4756/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
    - shard-apl:          [DMESG-FAIL][71] ([fdo#108145] / [i915#1635] / [i915#95]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4756/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html

  * igt@kms_plane_cursor@pipe-a-primary-size-128:
    - shard-kbl:          [DMESG-WARN][73] ([i915#93] / [i915#95]) -> [PASS][74] +46 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-kbl1/igt@kms_plane_cursor@pipe-a-primary-size-128.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4756/shard-kbl3/igt@kms_plane_cursor@pipe-a-primary-size-128.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][75] ([fdo#109441]) -> [PASS][76] +2 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-iclb6/igt@kms_psr@psr2_sprite_plane_move.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4756/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  
#### Warnings ####

  * igt@gem_exec_reloc@basic-concurrent16:
    - shard-snb:          [FAIL][77] ([i915#1930]) -> [TIMEOUT][78] ([i915#1958] / [i915#2119])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-snb1/igt@gem_exec_reloc@basic-concurrent16.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4756/shard-snb5/igt@gem_exec_reloc@basic-concurrent16.html

  * igt@kms_color@pipe-d-ctm-0-25:
    - shard-iclb:         [SKIP][79] ([fdo#109278] / [fdo#112010] / [i915#1149]) -> [SKIP][80] ([fdo#109278] / [i915#1149]) +9 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-iclb7/igt@kms_color@pipe-d-ctm-0-25.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4756/shard-iclb8/igt@kms_color@pipe-d-ctm-0-25.html

  * igt@kms_content_protection@atomic:
    - shard-kbl:          [TIMEOUT][81] ([i915#1319] / [i915#1958] / [i915#2119]) -> [DMESG-FAIL][82] ([fdo#110321] / [i915#95])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-kbl2/igt@kms_content_protection@atomic.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4756/shard-kbl2/igt@kms_content_protection@atomic.html
    - shard-apl:          [FAIL][83] ([fdo#110321] / [fdo#110336] / [i915#1635]) -> [DMESG-FAIL][84] ([fdo#110321] / [i915#1635] / [i915#95])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-apl4/igt@kms_content_protection@atomic.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4756/shard-apl1/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@lic:
    - shard-kbl:          [TIMEOUT][85] ([i915#1319] / [i915#2119]) -> [TIMEOUT][86] ([i915#1319] / [i915#1958] / [i915#2119])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-kbl2/igt@kms_content_protection@lic.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4756/shard-kbl6/igt@kms_content_protection@lic.html

  * igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen:
    - shard-iclb:         [SKIP][87] ([fdo#109279]) -> [SKIP][88] ([fdo#109278] / [fdo#109279]) +22 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-iclb6/igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4756/shard-iclb8/igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen.html

  * igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding:
    - shard-iclb:         [SKIP][89] ([fdo#109278] / [fdo#112010] / [i915#508]) -> [SKIP][90] ([fdo#109278])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-iclb1/igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4756/shard-iclb1/igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-iclb:         [SKIP][91] ([fdo#109274]) -> [SKIP][92] ([fdo#109274] / [fdo#109278]) +24 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-iclb4/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4756/shard-iclb7/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@pipe-d-single-move:
    - shard-iclb:         [SKIP][93] ([fdo#109278] / [fdo#112010]) -> [SKIP][94] ([fdo#109278]) +83 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-iclb6/igt@kms_cursor_legacy@pipe-d-single-move.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4756/shard-iclb3/igt@kms_cursor_legacy@pipe-d-single-move.html

  * igt@kms_flip@2x-flip-vs-wf_vblank:
    - shard-snb:          [SKIP][95] ([fdo#109271]) -> [TIMEOUT][96] ([i915#1958] / [i915#2119]) +2 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-snb1/igt@kms_flip@2x-flip-vs-wf_vblank.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4756/shard-snb5/igt@kms_flip@2x-flip-vs-wf_vblank.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [DMESG-WARN][97] ([i915#93] / [i915#95]) -> [DMESG-WARN][98] ([i915#180] / [i915#93] / [i915#95])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4756/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render:
    - shard-hsw:          [TIMEOUT][99] ([i915#1958] / [i915#2119]) -> [SKIP][100] ([fdo#109271]) +1 similar issue
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-hsw4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4756/shard-hsw1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-pwrite:
    - shard-hsw:          [SKIP][101] ([fdo#109271]) -> [TIMEOUT][102] ([i915#1958] / [i915#2119])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-hsw6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-pwrite.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4756/shard-hsw7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-pwrite.html

  * igt@kms_plane_multiple@atomic-pipe-d-tiling-yf:
    - shard-tglb:         [SKIP][103] ([fdo#112025] / [fdo#112054]) -> [SKIP][104] ([fdo#112054])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-tglb6/igt@kms_plane_multiple@atomic-pipe-d-tiling-yf.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4756/shard-tglb2/igt@kms_plane_multiple@atomic-pipe-d-tiling-yf.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-tglb:         [SKIP][105] ([fdo#111825] / [fdo#112015]) -> [SKIP][106] ([fdo#111825])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-tglb8/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4756/shard-tglb1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][107], [FAIL][108], [FAIL][109]) ([i915#1436] / [i915#1784] / [i915#2110]) -> ([FAIL][110], [FAIL][111]) ([fdo#109271] / [i915#1436] / [i915#1784] / [i915#2110] / [i915#716])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-kbl1/igt@runner@aborted.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-kbl6/igt@runner@aborted.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-kbl2/igt@runner@aborted.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4756/shard-kbl2/igt@runner@aborted.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4756/shard-kbl7/igt@runner@aborted.html
    - shard-apl:          ([FAIL][112], [FAIL][113], [FAIL][114], [FAIL][115], [FAIL][116], [FAIL][117]) ([i915#1610] / [i915#1635] / [i915#2110]) -> [FAIL][118] ([i915#1635] / [i915#2110])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-apl6/igt@runner@aborted.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-apl4/igt@runner@aborted.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-apl3/igt@runner@aborted.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-apl7/igt@runner@aborted.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-apl2/igt@runner@aborted.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-apl7/igt@runner@aborted.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4756/shard-apl1/igt@runner@aborted.html
    - shard-tglb:         [FAIL][119] ([i915#2110]) -> ([FAIL][120], [FAIL][121]) ([i915#1602] / [i915#2110])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/shard-tglb1/igt@runner@aborted.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4756/shard-tglb1/igt@runner@aborted.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4756/shard-tglb8/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#112010]: https://bugs.freedesktop.org/show_bug.cgi?id=112010
  [fdo#112015]: https://bugs.freedesktop.org/show_bug.cgi?id=112015
  [fdo#112025]: https://bugs.freedesktop.org/show_bug.cgi?id=112025
  [fdo#112054]: https://bugs.freedesktop.org/show_bug.cgi?id=112054
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1610]: https://gitlab.freedesktop.org/drm/intel/issues/1610
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1784]: https://gitlab.freedesktop.org/drm/intel/issues/1784
  [i915#1798]: https://gitlab.freedesktop.org/drm/intel/issues/1798
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2110]: https://gitlab.freedesktop.org/drm/intel/issues/2110
  [i915#2119]: https://gitlab.freedesktop.org/drm/intel/issues/2119
  [i915#39]: https://gitlab.freedesktop.org/drm/intel/issues/39
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#508]: https://gitlab.freedesktop.org/drm/intel/issues/508
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5733 -> IGTPW_4756

  CI-20190529: 20190529
  CI_DRM_8732: 4c05e94181f1a8ea4c91a5bd90e81f3275b51332 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4756: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4756/index.html
  IGT_5733: b793b4b40e42300f165dd3fdd670c2a85bd657c6 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4756/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
