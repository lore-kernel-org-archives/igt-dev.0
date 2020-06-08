Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 08 Jun 2020 10:49:41 -0000
Message-ID: <159161338179.14463.15554209829080630032@emeril.freedesktop.org>
References: <20200608085621.28382-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20200608085621.28382-1-ankit.k.nautiyal@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fcontent=5Fprotection=3A?=
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
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_content_protection:
URL   : https://patchwork.freedesktop.org/series/78113/
State : success

== Summary ==

CI Bug Log - changes from IGT_5698_full -> IGTPW_4655_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4655/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4655_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_content_protection@hdcp-1_4} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][1] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4655/shard-tglb7/igt@kms_content_protection@hdcp-1_4.html
    - shard-kbl:          NOTRUN -> [INCOMPLETE][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4655/shard-kbl6/igt@kms_content_protection@hdcp-1_4.html
    - shard-apl:          NOTRUN -> [INCOMPLETE][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4655/shard-apl1/igt@kms_content_protection@hdcp-1_4.html

  * {igt@kms_content_protection@hdcp-2_2} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][4] +1 similar issue
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4655/shard-iclb5/igt@kms_content_protection@hdcp-2_2.html

  
New tests
---------

  New tests have been introduced between IGT_5698_full and IGTPW_4655_full:

### New IGT tests (2) ###

  * igt@kms_content_protection@hdcp-1_4:
    - Statuses : 2 incomplete(s) 5 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_content_protection@hdcp-2_2:
    - Statuses : 7 skip(s)
    - Exec time: [0.0, 0.01] s

  

Known issues
------------

  Here are the changes found in IGTPW_4655_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@engines-mixed-process@vecs0:
    - shard-apl:          [PASS][5] -> [FAIL][6] ([i915#1528])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5698/shard-apl1/igt@gem_ctx_persistence@engines-mixed-process@vecs0.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4655/shard-apl7/igt@gem_ctx_persistence@engines-mixed-process@vecs0.html

  * igt@gem_exec_flush@basic-wb-set-default:
    - shard-hsw:          [PASS][7] -> [INCOMPLETE][8] ([i915#61])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5698/shard-hsw2/igt@gem_exec_flush@basic-wb-set-default.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4655/shard-hsw4/igt@gem_exec_flush@basic-wb-set-default.html

  * igt@gem_ppgtt@blt-vs-render-ctx0:
    - shard-snb:          [PASS][9] -> [INCOMPLETE][10] ([i915#82])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5698/shard-snb6/igt@gem_ppgtt@blt-vs-render-ctx0.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4655/shard-snb4/igt@gem_ppgtt@blt-vs-render-ctx0.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][11] -> [FAIL][12] ([i915#1899])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5698/shard-iclb7/igt@i915_pm_dc@dc6-psr.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4655/shard-iclb4/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rps@min-max-config-idle:
    - shard-snb:          [PASS][13] -> [TIMEOUT][14] ([i915#1958])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5698/shard-snb5/igt@i915_pm_rps@min-max-config-idle.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4655/shard-snb4/igt@i915_pm_rps@min-max-config-idle.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-apl:          [PASS][15] -> [DMESG-WARN][16] ([i915#180]) +2 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5698/shard-apl2/igt@i915_suspend@fence-restore-tiled2untiled.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4655/shard-apl8/igt@i915_suspend@fence-restore-tiled2untiled.html
    - shard-kbl:          [PASS][17] -> [DMESG-WARN][18] ([i915#180])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5698/shard-kbl2/igt@i915_suspend@fence-restore-tiled2untiled.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4655/shard-kbl4/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@i915_suspend@sysfs-reader:
    - shard-kbl:          [PASS][19] -> [INCOMPLETE][20] ([i915#155])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5698/shard-kbl1/igt@i915_suspend@sysfs-reader.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4655/shard-kbl2/igt@i915_suspend@sysfs-reader.html

  * igt@kms_color@pipe-b-ctm-max:
    - shard-apl:          [PASS][21] -> [DMESG-WARN][22] ([i915#95]) +34 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5698/shard-apl7/igt@kms_color@pipe-b-ctm-max.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4655/shard-apl1/igt@kms_color@pipe-b-ctm-max.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-random:
    - shard-apl:          [PASS][23] -> [DMESG-FAIL][24] ([i915#54] / [i915#95])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5698/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4655/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-random:
    - shard-kbl:          [PASS][25] -> [DMESG-FAIL][26] ([i915#54] / [i915#95]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5698/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4655/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html

  * igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions:
    - shard-apl:          [PASS][27] -> [DMESG-WARN][28] ([i915#1982])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5698/shard-apl6/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4655/shard-apl8/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-gtt:
    - shard-kbl:          [PASS][29] -> [DMESG-WARN][30] ([i915#93] / [i915#95]) +44 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5698/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-gtt.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4655/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-gtt:
    - shard-tglb:         [PASS][31] -> [DMESG-WARN][32] ([i915#1982])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5698/shard-tglb6/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-gtt.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4655/shard-tglb6/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-gtt.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-tglb:         [PASS][33] -> [FAIL][34] ([i915#83])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5698/shard-tglb8/igt@kms_panel_fitting@atomic-fastset.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4655/shard-tglb3/igt@kms_panel_fitting@atomic-fastset.html
    - shard-iclb:         [PASS][35] -> [FAIL][36] ([i915#83])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5698/shard-iclb6/igt@kms_panel_fitting@atomic-fastset.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4655/shard-iclb1/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-128:
    - shard-kbl:          [PASS][37] -> [DMESG-FAIL][38] ([i915#95]) +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5698/shard-kbl2/igt@kms_plane_cursor@pipe-a-overlay-size-128.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4655/shard-kbl7/igt@kms_plane_cursor@pipe-a-overlay-size-128.html
    - shard-apl:          [PASS][39] -> [DMESG-FAIL][40] ([i915#95]) +2 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5698/shard-apl3/igt@kms_plane_cursor@pipe-a-overlay-size-128.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4655/shard-apl3/igt@kms_plane_cursor@pipe-a-overlay-size-128.html

  * igt@kms_psr2_su@page_flip:
    - shard-tglb:         [PASS][41] -> [SKIP][42] ([i915#1911])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5698/shard-tglb5/igt@kms_psr2_su@page_flip.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4655/shard-tglb1/igt@kms_psr2_su@page_flip.html
    - shard-iclb:         [PASS][43] -> [SKIP][44] ([fdo#109642] / [fdo#111068])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5698/shard-iclb2/igt@kms_psr2_su@page_flip.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4655/shard-iclb3/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_sprite_render:
    - shard-iclb:         [PASS][45] -> [SKIP][46] ([fdo#109441])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5698/shard-iclb2/igt@kms_psr@psr2_sprite_render.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4655/shard-iclb1/igt@kms_psr@psr2_sprite_render.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-glk:          [PASS][47] -> [DMESG-WARN][48] ([i915#1982])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5698/shard-glk1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4655/shard-glk8/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  
#### Possible fixes ####

  * {igt@gem_ctx_shared@q-independent@bcs0}:
    - shard-kbl:          [FAIL][49] -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5698/shard-kbl6/igt@gem_ctx_shared@q-independent@bcs0.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4655/shard-kbl6/igt@gem_ctx_shared@q-independent@bcs0.html

  * igt@gem_exec_balancer@individual:
    - shard-apl:          [DMESG-WARN][51] ([i915#95]) -> [PASS][52] +41 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5698/shard-apl4/igt@gem_exec_balancer@individual.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4655/shard-apl4/igt@gem_exec_balancer@individual.html

  * igt@gem_mmap_wc@copy:
    - shard-kbl:          [DMESG-WARN][53] ([i915#93] / [i915#95]) -> [PASS][54] +44 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5698/shard-kbl3/igt@gem_mmap_wc@copy.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4655/shard-kbl6/igt@gem_mmap_wc@copy.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-tglb:         [DMESG-WARN][55] ([i915#402]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5698/shard-tglb1/igt@i915_module_load@reload-with-fault-injection.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4655/shard-tglb5/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_suspend@forcewake:
    - shard-kbl:          [DMESG-WARN][57] ([i915#180]) -> [PASS][58] +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5698/shard-kbl4/igt@i915_suspend@forcewake.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4655/shard-kbl2/igt@i915_suspend@forcewake.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-0:
    - shard-kbl:          [DMESG-FAIL][59] ([i915#95]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5698/shard-kbl3/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4655/shard-kbl2/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen:
    - shard-kbl:          [DMESG-FAIL][61] ([i915#54] / [i915#95]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5698/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4655/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-apl:          [DMESG-WARN][63] ([i915#180]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5698/shard-apl8/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4655/shard-apl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [FAIL][65] ([i915#72]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5698/shard-glk2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4655/shard-glk9/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@pipe-b-single-move:
    - shard-hsw:          [INCOMPLETE][67] ([i915#61]) -> [PASS][68] +1 similar issue
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5698/shard-hsw8/igt@kms_cursor_legacy@pipe-b-single-move.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4655/shard-hsw4/igt@kms_cursor_legacy@pipe-b-single-move.html

  * igt@kms_cursor_legacy@pipe-c-torture-bo:
    - shard-tglb:         [DMESG-WARN][69] ([i915#128]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5698/shard-tglb1/igt@kms_cursor_legacy@pipe-c-torture-bo.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4655/shard-tglb3/igt@kms_cursor_legacy@pipe-c-torture-bo.html

  * {igt@kms_flip@flip-vs-suspend-interruptible@b-edp1}:
    - shard-iclb:         [INCOMPLETE][71] ([i915#1185] / [i915#1895]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5698/shard-iclb3/igt@kms_flip@flip-vs-suspend-interruptible@b-edp1.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4655/shard-iclb6/igt@kms_flip@flip-vs-suspend-interruptible@b-edp1.html

  * igt@kms_flip_tiling@flip-changes-tiling-yf:
    - shard-apl:          [DMESG-FAIL][73] ([i915#95]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5698/shard-apl3/igt@kms_flip_tiling@flip-changes-tiling-yf.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4655/shard-apl1/igt@kms_flip_tiling@flip-changes-tiling-yf.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-glk:          [FAIL][75] ([i915#49]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5698/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4655/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-stridechange:
    - shard-glk:          [DMESG-WARN][77] ([i915#1982]) -> [PASS][78] +2 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5698/shard-glk4/igt@kms_frontbuffer_tracking@fbc-stridechange.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4655/shard-glk7/igt@kms_frontbuffer_tracking@fbc-stridechange.html

  * {igt@kms_frontbuffer_tracking@fbc-tiling-linear}:
    - shard-kbl:          [DMESG-WARN][79] ([i915#1982]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5698/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4655/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render:
    - shard-tglb:         [DMESG-WARN][81] ([i915#1982]) -> [PASS][82] +3 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5698/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4655/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-iclb:         [TIMEOUT][83] ([i915#123]) -> [PASS][84] +1 similar issue
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5698/shard-iclb8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4655/shard-iclb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [FAIL][85] ([i915#173]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5698/shard-iclb1/igt@kms_psr@no_drrs.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4655/shard-iclb2/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_cursor_mmap_gtt:
    - shard-iclb:         [SKIP][87] ([fdo#109441]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5698/shard-iclb1/igt@kms_psr@psr2_cursor_mmap_gtt.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4655/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_gtt.html

  * {igt@perf@global-sseu-config-invalid}:
    - shard-hsw:          [SKIP][89] ([fdo#109271]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5698/shard-hsw8/igt@perf@global-sseu-config-invalid.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4655/shard-hsw6/igt@perf@global-sseu-config-invalid.html
    - shard-iclb:         [SKIP][91] -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5698/shard-iclb8/igt@perf@global-sseu-config-invalid.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4655/shard-iclb7/igt@perf@global-sseu-config-invalid.html
    - shard-glk:          [SKIP][93] ([fdo#109271]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5698/shard-glk4/igt@perf@global-sseu-config-invalid.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4655/shard-glk4/igt@perf@global-sseu-config-invalid.html
    - shard-apl:          [SKIP][95] ([fdo#109271]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5698/shard-apl8/igt@perf@global-sseu-config-invalid.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4655/shard-apl3/igt@perf@global-sseu-config-invalid.html
    - shard-kbl:          [SKIP][97] ([fdo#109271]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5698/shard-kbl3/igt@perf@global-sseu-config-invalid.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4655/shard-kbl1/igt@perf@global-sseu-config-invalid.html
    - shard-tglb:         [SKIP][99] -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5698/shard-tglb1/igt@perf@global-sseu-config-invalid.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4655/shard-tglb1/igt@perf@global-sseu-config-invalid.html

  
#### Warnings ####

  * igt@gem_eio@in-flight-suspend:
    - shard-kbl:          [DMESG-WARN][101] ([i915#180]) -> [DMESG-WARN][102] ([i915#180] / [i915#93] / [i915#95])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5698/shard-kbl4/igt@gem_eio@in-flight-suspend.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4655/shard-kbl1/igt@gem_eio@in-flight-suspend.html

  * igt@i915_pm_dc@dc5-dpms:
    - shard-snb:          [SKIP][103] ([fdo#109271]) -> [INCOMPLETE][104] ([i915#82])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5698/shard-snb2/igt@i915_pm_dc@dc5-dpms.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4655/shard-snb2/igt@i915_pm_dc@dc5-dpms.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [SKIP][105] ([i915#468]) -> [FAIL][106] ([i915#1899])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5698/shard-tglb2/igt@i915_pm_dc@dc6-psr.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4655/shard-tglb8/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_flip_tiling@flip-changes-tiling:
    - shard-kbl:          [DMESG-FAIL][107] ([i915#95]) -> [DMESG-WARN][108] ([i915#93] / [i915#95])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5698/shard-kbl3/igt@kms_flip_tiling@flip-changes-tiling.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4655/shard-kbl4/igt@kms_flip_tiling@flip-changes-tiling.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [DMESG-WARN][109] ([i915#93] / [i915#95]) -> [DMESG-WARN][110] ([i915#180] / [i915#93] / [i915#95])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5698/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4655/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-hsw:          [TIMEOUT][111] ([i915#1958]) -> [SKIP][112] ([fdo#109271]) +3 similar issues
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5698/shard-hsw2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4655/shard-hsw4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
    - shard-snb:          [TIMEOUT][113] ([i915#1958]) -> [SKIP][114] ([fdo#109271]) +2 similar issues
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5698/shard-snb6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4655/shard-snb4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-snb:          [SKIP][115] ([fdo#109271]) -> [TIMEOUT][116] ([i915#1958])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5698/shard-snb6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4655/shard-snb4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-iclb:         [TIMEOUT][117] -> [SKIP][118] ([fdo#109280])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5698/shard-iclb8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4655/shard-iclb7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:
    - shard-apl:          [DMESG-FAIL][119] ([fdo#108145] / [i915#95]) -> [FAIL][120] ([fdo#108145] / [i915#265]) +1 similar issue
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5698/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4655/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-basic:
    - shard-apl:          [FAIL][121] ([fdo#108145] / [i915#265]) -> [DMESG-FAIL][122] ([fdo#108145] / [i915#1982])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5698/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4655/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html

  * igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max:
    - shard-kbl:          [DMESG-FAIL][123] ([fdo#108145] / [i915#95]) -> [FAIL][124] ([fdo#108145] / [i915#265])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5698/shard-kbl1/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4655/shard-kbl3/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max.html

  * igt@kms_setmode@basic:
    - shard-tglb:         [FAIL][125] ([i915#31]) -> [DMESG-FAIL][126] ([i915#31] / [i915#402])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5698/shard-tglb2/igt@kms_setmode@basic.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4655/shard-tglb5/igt@kms_setmode@basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [i915#1185]: https://gitlab.freedesktop.org/drm/intel/issues/1185
  [i915#123]: https://gitlab.freedesktop.org/drm/intel/issues/123
  [i915#128]: https://gitlab.freedesktop.org/drm/intel/issues/128
  [i915#1528]: https://gitlab.freedesktop.org/drm/intel/issues/1528
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1895]: https://gitlab.freedesktop.org/drm/intel/issues/1895
  [i915#1899]: https://gitlab.freedesktop.org/drm/intel/issues/1899
  [i915#1911]: https://gitlab.freedesktop.org/drm/intel/issues/1911
  [i915#1926]: https://gitlab.freedesktop.org/drm/intel/issues/1926
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#83]: https://gitlab.freedesktop.org/drm/intel/issues/83
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5698 -> IGTPW_4655

  CI-20190529: 20190529
  CI_DRM_8599: 41ca9ea98b74c926c923e84931b9b4a4c3955e08 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4655: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4655/index.html
  IGT_5698: b6ba988cc22ccb02cf174b520d3d8d7bd4158d76 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4655/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
