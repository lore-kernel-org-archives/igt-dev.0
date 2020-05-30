Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sat, 30 May 2020 00:08:45 -0000
Message-ID: <159079732522.9482.5838279212637278283@emeril.freedesktop.org>
References: <20200529195850.8664-1-imre.deak@intel.com>
In-Reply-To: <20200529195850.8664-1-imre.deak@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgbGliL2tt?=
 =?utf-8?q?s=5Fchamelium=3A_Wait_for_the_sink_to_reconnect_after_an_FSM_DP?=
 =?utf-8?q?MS-off?=
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
To: Imre Deak <imre.deak@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: lib/kms_chamelium: Wait for the sink to reconnect after an FSM DPMS-off
URL   : https://patchwork.freedesktop.org/series/77800/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8555_full -> IGTPW_4625_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4625/index.html

Known issues
------------

  Here are the changes found in IGTPW_4625_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_reloc@basic-gtt-wc-noreloc:
    - shard-glk:          [PASS][1] -> [DMESG-WARN][2] ([i915#1927])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8555/shard-glk1/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4625/shard-glk5/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html

  * igt@gem_render_copy@yf-tiled-ccs-to-linear:
    - shard-glk:          [PASS][3] -> [TIMEOUT][4] ([i915#1958])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8555/shard-glk7/igt@gem_render_copy@yf-tiled-ccs-to-linear.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4625/shard-glk1/igt@gem_render_copy@yf-tiled-ccs-to-linear.html

  * igt@kms_big_fb@linear-64bpp-rotate-0:
    - shard-glk:          [PASS][5] -> [FAIL][6] ([i915#1119] / [i915#118] / [i915#95]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8555/shard-glk7/igt@kms_big_fb@linear-64bpp-rotate-0.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4625/shard-glk8/igt@kms_big_fb@linear-64bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen:
    - shard-kbl:          [PASS][7] -> [FAIL][8] ([i915#54] / [i915#93] / [i915#95]) +2 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8555/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4625/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [PASS][9] -> [DMESG-WARN][10] ([i915#180]) +2 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8555/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4625/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-glk:          [PASS][11] -> [DMESG-WARN][12] ([i915#1926]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8555/shard-glk2/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4625/shard-glk2/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-glk:          [PASS][13] -> [INCOMPLETE][14] ([i915#58] / [k.org#198133])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8555/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4625/shard-glk1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic:
    - shard-kbl:          [PASS][15] -> [FAIL][16] ([i915#1566] / [i915#93] / [i915#95])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8555/shard-kbl4/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4625/shard-kbl2/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html

  * igt@kms_cursor_legacy@pipe-a-forked-bo:
    - shard-hsw:          [PASS][17] -> [INCOMPLETE][18] ([i915#61])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8555/shard-hsw1/igt@kms_cursor_legacy@pipe-a-forked-bo.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4625/shard-hsw4/igt@kms_cursor_legacy@pipe-a-forked-bo.html

  * igt@kms_draw_crc@fill-fb:
    - shard-apl:          [PASS][19] -> [FAIL][20] ([i915#95])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8555/shard-apl6/igt@kms_draw_crc@fill-fb.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4625/shard-apl3/igt@kms_draw_crc@fill-fb.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-kbl:          [PASS][21] -> [FAIL][22] ([i915#64])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8555/shard-kbl4/igt@kms_fbcon_fbt@fbc.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4625/shard-kbl1/igt@kms_fbcon_fbt@fbc.html
    - shard-apl:          [PASS][23] -> [FAIL][24] ([i915#1525])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8555/shard-apl2/igt@kms_fbcon_fbt@fbc.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4625/shard-apl8/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [PASS][25] -> [FAIL][26] ([i915#53] / [i915#93] / [i915#95])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8555/shard-kbl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4625/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
    - shard-apl:          [PASS][27] -> [FAIL][28] ([i915#53] / [i915#95])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8555/shard-apl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4625/shard-apl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b:
    - shard-apl:          [PASS][29] -> [DMESG-WARN][30] ([i915#180])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8555/shard-apl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4625/shard-apl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-iclb:         [PASS][31] -> [INCOMPLETE][32] ([i915#1185] / [i915#250])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8555/shard-iclb4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4625/shard-iclb3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][33] -> [SKIP][34] ([fdo#109441]) +2 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8555/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4625/shard-iclb6/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_vblank@pipe-c-ts-continuation-suspend:
    - shard-apl:          [PASS][35] -> [TIMEOUT][36] ([i915#1635]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8555/shard-apl1/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4625/shard-apl1/igt@kms_vblank@pipe-c-ts-continuation-suspend.html

  
#### Possible fixes ####

  * igt@gem_vm_create@isolation:
    - shard-apl:          [TIMEOUT][37] ([i915#1635]) -> [PASS][38] +3 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8555/shard-apl1/igt@gem_vm_create@isolation.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4625/shard-apl8/igt@gem_vm_create@isolation.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][39] ([i915#1899]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8555/shard-iclb4/igt@i915_pm_dc@dc6-psr.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4625/shard-iclb5/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_suspend@forcewake:
    - shard-kbl:          [INCOMPLETE][41] ([i915#155]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8555/shard-kbl1/igt@i915_suspend@forcewake.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4625/shard-kbl2/igt@i915_suspend@forcewake.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-180:
    - shard-snb:          [SKIP][43] ([fdo#109271]) -> [PASS][44] +6 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8555/shard-snb2/igt@kms_big_fb@x-tiled-16bpp-rotate-180.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4625/shard-snb1/igt@kms_big_fb@x-tiled-16bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-random:
    - shard-kbl:          [FAIL][45] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8555/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4625/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-glk:          [FAIL][47] ([i915#72]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8555/shard-glk6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4625/shard-glk1/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * {igt@kms_flip@flip-vs-suspend@c-dp1}:
    - shard-kbl:          [DMESG-WARN][49] ([i915#180]) -> [PASS][50] +2 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8555/shard-kbl6/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4625/shard-kbl1/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-apl:          [DMESG-WARN][51] ([i915#180]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8555/shard-apl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4625/shard-apl8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid:
    - shard-kbl:          [FAIL][53] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95]) -> [PASS][54] +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8555/shard-kbl2/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4625/shard-kbl7/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
    - shard-apl:          [FAIL][55] ([fdo#108145] / [i915#265] / [i915#95]) -> [PASS][56] +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8555/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4625/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html

  * {igt@kms_prime@basic-crc@second-to-first}:
    - shard-apl:          [FAIL][57] ([i915#95]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8555/shard-apl6/igt@kms_prime@basic-crc@second-to-first.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4625/shard-apl4/igt@kms_prime@basic-crc@second-to-first.html
    - shard-kbl:          [FAIL][59] ([i915#93] / [i915#95]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8555/shard-kbl6/igt@kms_prime@basic-crc@second-to-first.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4625/shard-kbl2/igt@kms_prime@basic-crc@second-to-first.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [SKIP][61] ([fdo#109441]) -> [PASS][62] +2 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8555/shard-iclb7/igt@kms_psr@psr2_primary_page_flip.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4625/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [FAIL][63] ([i915#31]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8555/shard-kbl6/igt@kms_setmode@basic.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4625/shard-kbl2/igt@kms_setmode@basic.html

  * {igt@perf@blocking-parameterized}:
    - shard-iclb:         [FAIL][65] ([i915#1542]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8555/shard-iclb7/igt@perf@blocking-parameterized.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4625/shard-iclb1/igt@perf@blocking-parameterized.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [FAIL][67] ([i915#1899]) -> [FAIL][68] ([i915#454])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8555/shard-tglb1/igt@i915_pm_dc@dc6-psr.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4625/shard-tglb5/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-gtt:
    - shard-apl:          [SKIP][69] ([fdo#109271]) -> [TIMEOUT][70] ([i915#1635]) +2 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8555/shard-apl6/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-gtt.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4625/shard-apl1/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-gtt.html
    - shard-glk:          [SKIP][71] ([fdo#109271]) -> [TIMEOUT][72] ([i915#1958]) +2 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8555/shard-glk1/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-gtt.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4625/shard-glk1/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - shard-apl:          [TIMEOUT][73] ([i915#1635]) -> [SKIP][74] ([fdo#109271])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8555/shard-apl1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4625/shard-apl6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-basic:
    - shard-kbl:          [FAIL][75] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95]) -> [FAIL][76] ([fdo#108145] / [i915#265])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8555/shard-kbl4/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4625/shard-kbl2/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html
    - shard-apl:          [FAIL][77] ([fdo#108145] / [i915#265] / [i915#95]) -> [FAIL][78] ([fdo#108145] / [i915#265])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8555/shard-apl1/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4625/shard-apl7/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html

  * igt@kms_vblank@pipe-d-wait-forked:
    - shard-hsw:          [SKIP][79] ([fdo#109271] / [i915#1927]) -> [SKIP][80] ([fdo#109271])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8555/shard-hsw4/igt@kms_vblank@pipe-d-wait-forked.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4625/shard-hsw1/igt@kms_vblank@pipe-d-wait-forked.html

  * igt@runner@aborted:
    - shard-glk:          [FAIL][81] ([k.org#202321]) -> [FAIL][82] ([i915#1611] / [k.org#202321])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8555/shard-glk5/igt@runner@aborted.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4625/shard-glk5/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1185]: https://gitlab.freedesktop.org/drm/intel/issues/1185
  [i915#1525]: https://gitlab.freedesktop.org/drm/intel/issues/1525
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1566]: https://gitlab.freedesktop.org/drm/intel/issues/1566
  [i915#1611]: https://gitlab.freedesktop.org/drm/intel/issues/1611
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1899]: https://gitlab.freedesktop.org/drm/intel/issues/1899
  [i915#1926]: https://gitlab.freedesktop.org/drm/intel/issues/1926
  [i915#1927]: https://gitlab.freedesktop.org/drm/intel/issues/1927
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#250]: https://gitlab.freedesktop.org/drm/intel/issues/250
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#53]: https://gitlab.freedesktop.org/drm/intel/issues/53
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#64]: https://gitlab.freedesktop.org/drm/intel/issues/64
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#794]: https://gitlab.freedesktop.org/drm/intel/issues/794
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133
  [k.org#202321]: https://bugzilla.kernel.org/show_bug.cgi?id=202321


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5684 -> IGTPW_4625
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8555: 3ab722a5245e3e8813847e4b82f1acd76722ce1d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4625: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4625/index.html
  IGT_5684: bd399f5eb8263bb4a84ae6a5bb1a13d329e0515d @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4625/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
