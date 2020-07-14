Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 14 Jul 2020 08:51:18 -0000
Message-ID: <159471667880.6779.13055797177737658807@emeril.freedesktop.org>
References: <20200714071334.69883-1-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20200714071334.69883-1-umesh.nerlige.ramappa@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgaTkxNS9w?=
 =?utf-8?q?erf=3A_Sanity_check_reports_in_mapped_OA_buffer?=
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
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: i915/perf: Sanity check reports in mapped OA buffer
URL   : https://patchwork.freedesktop.org/series/79459/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8740_full -> IGTPW_4761_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4761/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4761_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@perf@mapped-oa-buffer} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4761/shard-tglb3/igt@perf@mapped-oa-buffer.html
    - shard-iclb:         NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4761/shard-iclb3/igt@perf@mapped-oa-buffer.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8740_full and IGTPW_4761_full:

### New IGT tests (1) ###

  * igt@perf@mapped-oa-buffer:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_4761_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_eio@wait-1us:
    - shard-hsw:          [PASS][3] -> [TIMEOUT][4] ([i915#1958] / [i915#2119]) +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-hsw4/igt@gem_eio@wait-1us.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4761/shard-hsw6/igt@gem_eio@wait-1us.html

  * igt@gem_exec_balancer@bonded-early:
    - shard-kbl:          [PASS][5] -> [FAIL][6] ([i915#2079])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-kbl1/igt@gem_exec_balancer@bonded-early.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4761/shard-kbl2/igt@gem_exec_balancer@bonded-early.html

  * igt@gem_exec_endless@dispatch@vecs0:
    - shard-iclb:         [PASS][7] -> [INCOMPLETE][8] ([i915#1958] / [i915#2119])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-iclb6/igt@gem_exec_endless@dispatch@vecs0.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4761/shard-iclb7/igt@gem_exec_endless@dispatch@vecs0.html

  * igt@gem_exec_reloc@basic-concurrent0:
    - shard-glk:          [PASS][9] -> [FAIL][10] ([i915#1930])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-glk3/igt@gem_exec_reloc@basic-concurrent0.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4761/shard-glk9/igt@gem_exec_reloc@basic-concurrent0.html

  * igt@gem_exec_suspend@basic:
    - shard-apl:          [PASS][11] -> [DMESG-WARN][12] ([i915#1635] / [i915#95]) +32 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-apl8/igt@gem_exec_suspend@basic.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4761/shard-apl6/igt@gem_exec_suspend@basic.html

  * igt@gem_partial_pwrite_pread@reads-display:
    - shard-tglb:         [PASS][13] -> [DMESG-WARN][14] ([i915#402]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-tglb5/igt@gem_partial_pwrite_pread@reads-display.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4761/shard-tglb8/igt@gem_partial_pwrite_pread@reads-display.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-kbl:          [PASS][15] -> [DMESG-WARN][16] ([i915#1436] / [i915#716])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-kbl6/igt@gen9_exec_parse@allowed-all.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4761/shard-kbl2/igt@gen9_exec_parse@allowed-all.html

  * igt@kms_big_fb@linear-16bpp-rotate-180:
    - shard-apl:          [PASS][17] -> [DMESG-FAIL][18] ([i915#1635] / [i915#95])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-apl8/igt@kms_big_fb@linear-16bpp-rotate-180.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4761/shard-apl4/igt@kms_big_fb@linear-16bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-random:
    - shard-kbl:          [PASS][19] -> [DMESG-FAIL][20] ([i915#54] / [i915#95]) +2 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4761/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html

  * igt@kms_cursor_edge_walk@pipe-b-256x256-bottom-edge:
    - shard-glk:          [PASS][21] -> [DMESG-WARN][22] ([i915#1982]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-glk5/igt@kms_cursor_edge_walk@pipe-b-256x256-bottom-edge.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4761/shard-glk2/igt@kms_cursor_edge_walk@pipe-b-256x256-bottom-edge.html

  * igt@kms_draw_crc@draw-method-rgb565-render-xtiled:
    - shard-snb:          [PASS][23] -> [TIMEOUT][24] ([i915#1958] / [i915#2119]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-snb5/igt@kms_draw_crc@draw-method-rgb565-render-xtiled.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4761/shard-snb5/igt@kms_draw_crc@draw-method-rgb565-render-xtiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled:
    - shard-apl:          [PASS][25] -> [DMESG-FAIL][26] ([i915#1635] / [i915#54] / [i915#95]) +2 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-apl7/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4761/shard-apl3/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html

  * igt@kms_flip@flip-vs-suspend@a-dp1:
    - shard-kbl:          [PASS][27] -> [DMESG-WARN][28] ([i915#180]) +2 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-kbl2/igt@kms_flip@flip-vs-suspend@a-dp1.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4761/shard-kbl3/igt@kms_flip@flip-vs-suspend@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
    - shard-kbl:          [PASS][29] -> [FAIL][30] ([i915#49]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4761/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
    - shard-apl:          [PASS][31] -> [FAIL][32] ([i915#1635] / [i915#49]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-apl4/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4761/shard-apl1/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-wc:
    - shard-tglb:         [PASS][33] -> [DMESG-WARN][34] ([i915#1982])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-tglb6/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-wc.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4761/shard-tglb1/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-wc.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-kbl:          [PASS][35] -> [DMESG-WARN][36] ([i915#93] / [i915#95]) +36 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-kbl1/igt@kms_hdr@bpc-switch-suspend.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4761/shard-kbl7/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [PASS][37] -> [SKIP][38] ([fdo#109441]) +4 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4761/shard-iclb3/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [PASS][39] -> [FAIL][40] ([i915#31])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-kbl3/igt@kms_setmode@basic.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4761/shard-kbl6/igt@kms_setmode@basic.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-apl:          [PASS][41] -> [TIMEOUT][42] ([i915#1635] / [i915#1958] / [i915#2119])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-apl1/igt@perf@gen8-unprivileged-single-ctx-counters.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4761/shard-apl2/igt@perf@gen8-unprivileged-single-ctx-counters.html
    - shard-glk:          [PASS][43] -> [TIMEOUT][44] ([i915#1958] / [i915#2119])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-glk5/igt@perf@gen8-unprivileged-single-ctx-counters.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4761/shard-glk5/igt@perf@gen8-unprivileged-single-ctx-counters.html
    - shard-iclb:         [PASS][45] -> [TIMEOUT][46] ([i915#1958] / [i915#2119])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-iclb4/igt@perf@gen8-unprivileged-single-ctx-counters.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4761/shard-iclb7/igt@perf@gen8-unprivileged-single-ctx-counters.html
    - shard-kbl:          [PASS][47] -> [TIMEOUT][48] ([i915#1958] / [i915#2119])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-kbl7/igt@perf@gen8-unprivileged-single-ctx-counters.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4761/shard-kbl3/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@perf@invalid-oa-metric-set-id:
    - shard-apl:          [PASS][49] -> [SKIP][50] ([fdo#109271] / [i915#1635])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-apl6/igt@perf@invalid-oa-metric-set-id.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4761/shard-apl6/igt@perf@invalid-oa-metric-set-id.html
    - shard-glk:          [PASS][51] -> [SKIP][52] ([fdo#109271])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-glk5/igt@perf@invalid-oa-metric-set-id.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4761/shard-glk9/igt@perf@invalid-oa-metric-set-id.html
    - shard-tglb:         [PASS][53] -> [SKIP][54] ([i915#405])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-tglb2/igt@perf@invalid-oa-metric-set-id.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4761/shard-tglb8/igt@perf@invalid-oa-metric-set-id.html
    - shard-hsw:          [PASS][55] -> [SKIP][56] ([fdo#109271])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-hsw4/igt@perf@invalid-oa-metric-set-id.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4761/shard-hsw1/igt@perf@invalid-oa-metric-set-id.html
    - shard-iclb:         [PASS][57] -> [SKIP][58] ([i915#405])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-iclb7/igt@perf@invalid-oa-metric-set-id.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4761/shard-iclb2/igt@perf@invalid-oa-metric-set-id.html

  * igt@perf@rc6-disable:
    - shard-iclb:         [PASS][59] -> [TIMEOUT][60] ([i915#2119])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-iclb1/igt@perf@rc6-disable.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4761/shard-iclb2/igt@perf@rc6-disable.html
    - shard-hsw:          [PASS][61] -> [TIMEOUT][62] ([i915#2119])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-hsw7/igt@perf@rc6-disable.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4761/shard-hsw6/igt@perf@rc6-disable.html
    - shard-kbl:          [PASS][63] -> [TIMEOUT][64] ([i915#2119])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-kbl6/igt@perf@rc6-disable.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4761/shard-kbl7/igt@perf@rc6-disable.html
    - shard-apl:          [PASS][65] -> [TIMEOUT][66] ([i915#1635] / [i915#2119])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-apl3/igt@perf@rc6-disable.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4761/shard-apl2/igt@perf@rc6-disable.html
    - shard-tglb:         [PASS][67] -> [TIMEOUT][68] ([i915#2119])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-tglb5/igt@perf@rc6-disable.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4761/shard-tglb6/igt@perf@rc6-disable.html
    - shard-glk:          [PASS][69] -> [TIMEOUT][70] ([i915#2119])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-glk7/igt@perf@rc6-disable.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4761/shard-glk2/igt@perf@rc6-disable.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@legacy-engines-mixed-process@vebox:
    - shard-apl:          [FAIL][71] ([i915#1528] / [i915#1635]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-apl7/igt@gem_ctx_persistence@legacy-engines-mixed-process@vebox.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4761/shard-apl6/igt@gem_ctx_persistence@legacy-engines-mixed-process@vebox.html

  * igt@gem_exec_fence@syncobj-unused-fence:
    - shard-apl:          [DMESG-WARN][73] ([i915#1635] / [i915#95]) -> [PASS][74] +36 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-apl4/igt@gem_exec_fence@syncobj-unused-fence.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4761/shard-apl8/igt@gem_exec_fence@syncobj-unused-fence.html

  * igt@gem_mmap_wc@fault-concurrent:
    - shard-iclb:         [DMESG-WARN][75] ([i915#1982]) -> [PASS][76] +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-iclb2/igt@gem_mmap_wc@fault-concurrent.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4761/shard-iclb4/igt@gem_mmap_wc@fault-concurrent.html

  * igt@gem_softpin@noreloc-interruptible:
    - shard-snb:          [INCOMPLETE][77] ([i915#82]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-snb6/igt@gem_softpin@noreloc-interruptible.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4761/shard-snb1/igt@gem_softpin@noreloc-interruptible.html

  * igt@gem_sync@basic-all:
    - shard-glk:          [DMESG-WARN][79] ([i915#118] / [i915#95]) -> [PASS][80] +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-glk6/igt@gem_sync@basic-all.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4761/shard-glk3/igt@gem_sync@basic-all.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-apl:          [DMESG-WARN][81] ([i915#1436] / [i915#1635] / [i915#716]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-apl7/igt@gen9_exec_parse@allowed-all.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4761/shard-apl6/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_module_load@reload:
    - shard-tglb:         [DMESG-WARN][83] ([i915#402]) -> [PASS][84] +1 similar issue
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-tglb7/igt@i915_module_load@reload.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4761/shard-tglb2/igt@i915_module_load@reload.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-glk:          [DMESG-FAIL][85] ([i915#118] / [i915#95]) -> [PASS][86] +1 similar issue
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-glk8/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4761/shard-glk2/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_color@pipe-a-ctm-blue-to-red:
    - shard-kbl:          [DMESG-WARN][87] ([i915#93] / [i915#95]) -> [PASS][88] +42 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-kbl6/igt@kms_color@pipe-a-ctm-blue-to-red.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4761/shard-kbl4/igt@kms_color@pipe-a-ctm-blue-to-red.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-random:
    - shard-kbl:          [DMESG-FAIL][89] ([i915#54] / [i915#95]) -> [PASS][90] +2 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4761/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [INCOMPLETE][91] ([i915#155]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4761/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-untiled:
    - shard-glk:          [DMESG-WARN][93] ([i915#1982]) -> [PASS][94] +1 similar issue
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-glk2/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-untiled.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4761/shard-glk5/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-untiled.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [DMESG-WARN][95] ([i915#180]) -> [PASS][96] +7 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4761/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@b-dp1:
    - shard-kbl:          [FAIL][97] ([i915#2122]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-kbl4/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-dp1.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4761/shard-kbl7/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
    - shard-tglb:         [DMESG-WARN][99] ([i915#1982]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4761/shard-tglb8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_pipe_crc_basic@hang-read-crc-pipe-a:
    - shard-kbl:          [DMESG-FAIL][101] ([i915#95]) -> [PASS][102] +2 similar issues
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-kbl6/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4761/shard-kbl6/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html

  * igt@kms_plane@plane-position-covered-pipe-b-planes:
    - shard-kbl:          [FAIL][103] ([i915#247]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-kbl6/igt@kms_plane@plane-position-covered-pipe-b-planes.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4761/shard-kbl3/igt@kms_plane@plane-position-covered-pipe-b-planes.html
    - shard-apl:          [FAIL][105] ([i915#1635] / [i915#247]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-apl4/igt@kms_plane@plane-position-covered-pipe-b-planes.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4761/shard-apl2/igt@kms_plane@plane-position-covered-pipe-b-planes.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-128:
    - shard-apl:          [DMESG-FAIL][107] ([i915#1635] / [i915#95]) -> [PASS][108] +2 similar issues
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-apl6/igt@kms_plane_cursor@pipe-a-viewport-size-128.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4761/shard-apl6/igt@kms_plane_cursor@pipe-a-viewport-size-128.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [SKIP][109] ([fdo#109642] / [fdo#111068]) -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-iclb5/igt@kms_psr2_su@page_flip.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4761/shard-iclb2/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_primary_render:
    - shard-iclb:         [SKIP][111] ([fdo#109441]) -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-iclb7/igt@kms_psr@psr2_primary_render.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4761/shard-iclb2/igt@kms_psr@psr2_primary_render.html

  * igt@kms_vblank@pipe-a-query-busy-hang:
    - shard-hsw:          [TIMEOUT][113] ([i915#1958] / [i915#2119]) -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-hsw1/igt@kms_vblank@pipe-a-query-busy-hang.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4761/shard-hsw2/igt@kms_vblank@pipe-a-query-busy-hang.html
    - shard-snb:          [TIMEOUT][115] ([i915#1958] / [i915#2119]) -> [PASS][116]
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-snb6/igt@kms_vblank@pipe-a-query-busy-hang.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4761/shard-snb4/igt@kms_vblank@pipe-a-query-busy-hang.html

  * igt@testdisplay:
    - shard-kbl:          [TIMEOUT][117] ([i915#1692] / [i915#1958] / [i915#2119]) -> [PASS][118]
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-kbl7/igt@testdisplay.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4761/shard-kbl6/igt@testdisplay.html

  
#### Warnings ####

  * igt@gem_ctx_persistence@hostile:
    - shard-hsw:          [SKIP][119] ([fdo#109271] / [i915#1099]) -> [TIMEOUT][120] ([i915#1958] / [i915#2119])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-hsw1/igt@gem_ctx_persistence@hostile.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4761/shard-hsw6/igt@gem_ctx_persistence@hostile.html
    - shard-snb:          [SKIP][121] ([fdo#109271] / [i915#1099]) -> [TIMEOUT][122] ([i915#1958] / [i915#2119])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-snb5/igt@gem_ctx_persistence@hostile.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4761/shard-snb5/igt@gem_ctx_persistence@hostile.html

  * igt@gem_exec_reloc@basic-spin-others@vcs0:
    - shard-snb:          [WARN][123] ([i915#2036]) -> [WARN][124] ([i915#2021])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-snb2/igt@gem_exec_reloc@basic-spin-others@vcs0.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4761/shard-snb1/igt@gem_exec_reloc@basic-spin-others@vcs0.html

  * igt@gen9_exec_parse@bb-start-far:
    - shard-hsw:          [INCOMPLETE][125] ([i915#1958]) -> [SKIP][126] ([fdo#109271])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-hsw1/igt@gen9_exec_parse@bb-start-far.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4761/shard-hsw4/igt@gen9_exec_parse@bb-start-far.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][127] ([i915#658]) -> [SKIP][128] ([i915#588])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-iclb1/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4761/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_chamelium@dp-hpd-fast:
    - shard-snb:          [SKIP][129] ([fdo#109271] / [fdo#111827]) -> [TIMEOUT][130] ([i915#1958] / [i915#2119])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-snb6/igt@kms_chamelium@dp-hpd-fast.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4761/shard-snb5/igt@kms_chamelium@dp-hpd-fast.html
    - shard-hsw:          [SKIP][131] ([fdo#109271] / [fdo#111827]) -> [TIMEOUT][132] ([i915#1958] / [i915#2119])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-hsw7/igt@kms_chamelium@dp-hpd-fast.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4761/shard-hsw6/igt@kms_chamelium@dp-hpd-fast.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
    - shard-kbl:          [DMESG-WARN][133] ([i915#1982]) -> [DMESG-WARN][134] ([i915#93] / [i915#95])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4761/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu:
    - shard-hsw:          [SKIP][135] ([fdo#109271]) -> [TIMEOUT][136] ([i915#1958] / [i915#2119])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-hsw6/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4761/shard-hsw6/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu.html
    - shard-snb:          [SKIP][137] ([fdo#109271]) -> [TIMEOUT][138] ([i915#1958] / [i915#2119])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-snb5/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4761/shard-snb5/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb:
    - shard-apl:          [DMESG-FAIL][139] ([fdo#108145] / [i915#1635] / [i915#95]) -> [FAIL][140] ([fdo#108145] / [i915#1635] / [i915#265])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-apl7/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4761/shard-apl3/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html
    - shard-kbl:          [DMESG-FAIL][141] ([fdo#108145] / [i915#95]) -> [FAIL][142] ([fdo#108145] / [i915#265])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-kbl4/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4761/shard-kbl2/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html

  * igt@kms_plane_cursor@pipe-d-overlay-size-128:
    - shard-hsw:          [TIMEOUT][143] ([i915#1958] / [i915#2119]) -> [SKIP][144] ([fdo#109271]) +2 similar issues
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-hsw1/igt@kms_plane_cursor@pipe-d-overlay-size-128.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4761/shard-hsw4/igt@kms_plane_cursor@pipe-d-overlay-size-128.html
    - shard-snb:          [TIMEOUT][145] ([i915#1958] / [i915#2119]) -> [SKIP][146] ([fdo#109271]) +3 similar issues
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-snb6/igt@kms_plane_cursor@pipe-d-overlay-size-128.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4761/shard-snb1/igt@kms_plane_cursor@pipe-d-overlay-size-128.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][147], [FAIL][148], [FAIL][149], [FAIL][150]) ([i915#1436] / [i915#1784] / [i915#2110]) -> ([FAIL][151], [FAIL][152]) ([fdo#109271] / [i915#1436] / [i915#1784] / [i915#2110] / [i915#716])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-kbl1/igt@runner@aborted.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-kbl2/igt@runner@aborted.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-kbl1/igt@runner@aborted.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-kbl6/igt@runner@aborted.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4761/shard-kbl2/igt@runner@aborted.html
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4761/shard-kbl1/igt@runner@aborted.html
    - shard-apl:          ([FAIL][153], [FAIL][154], [FAIL][155], [FAIL][156]) ([fdo#109271] / [i915#1610] / [i915#1635] / [i915#2110] / [i915#716]) -> [FAIL][157] ([i915#1635] / [i915#2110])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-apl7/igt@runner@aborted.html
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-apl3/igt@runner@aborted.html
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-apl4/igt@runner@aborted.html
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-apl7/igt@runner@aborted.html
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4761/shard-apl1/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1528]: https://gitlab.freedesktop.org/drm/intel/issues/1528
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1610]: https://gitlab.freedesktop.org/drm/intel/issues/1610
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1692]: https://gitlab.freedesktop.org/drm/intel/issues/1692
  [i915#1784]: https://gitlab.freedesktop.org/drm/intel/issues/1784
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2021]: https://gitlab.freedesktop.org/drm/intel/issues/2021
  [i915#2036]: https://gitlab.freedesktop.org/drm/intel/issues/2036
  [i915#2079]: https://gitlab.freedesktop.org/drm/intel/issues/2079
  [i915#2110]: https://gitlab.freedesktop.org/dr

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4761/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
