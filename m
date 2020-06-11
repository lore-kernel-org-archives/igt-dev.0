Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 11 Jun 2020 18:46:44 -0000
Message-ID: <159190120484.22715.3808747763827601852@emeril.freedesktop.org>
References: <20200611135238.176102-1-gwan-gyeong.mun@intel.com>
In-Reply-To: <20200611135238.176102-1-gwan-gyeong.mun@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fpsr2=5Fsu=3A_Print_errno_while_it_fails_to_read_debugfs?=
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
To: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_psr2_su: Print errno while it fails to read debugfs
URL   : https://patchwork.freedesktop.org/series/78229/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8617_full -> IGTPW_4669_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4669/index.html

Known issues
------------

  Here are the changes found in IGTPW_4669_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_fence@syncobj-invalid-flags:
    - shard-tglb:         [PASS][1] -> [DMESG-WARN][2] ([i915#402])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-tglb8/igt@gem_exec_fence@syncobj-invalid-flags.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4669/shard-tglb8/igt@gem_exec_fence@syncobj-invalid-flags.html

  * igt@gem_gtt_cpu_tlb:
    - shard-apl:          [PASS][3] -> [DMESG-WARN][4] ([i915#95]) +33 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-apl8/igt@gem_gtt_cpu_tlb.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4669/shard-apl2/igt@gem_gtt_cpu_tlb.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-tglb:         [PASS][5] -> [SKIP][6] ([i915#1904])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-tglb1/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4669/shard-tglb2/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-glk:          [PASS][7] -> [DMESG-FAIL][8] ([i915#118] / [i915#95])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-glk4/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4669/shard-glk8/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-random:
    - shard-kbl:          [PASS][9] -> [DMESG-FAIL][10] ([i915#54] / [i915#95]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4669/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html

  * igt@kms_cursor_crc@pipe-c-cursor-256x85-sliding:
    - shard-glk:          [PASS][11] -> [DMESG-WARN][12] ([i915#95])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-glk2/igt@kms_cursor_crc@pipe-c-cursor-256x85-sliding.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4669/shard-glk8/igt@kms_cursor_crc@pipe-c-cursor-256x85-sliding.html

  * igt@kms_cursor_edge_walk@pipe-a-256x256-right-edge:
    - shard-kbl:          [PASS][13] -> [DMESG-FAIL][14] ([i915#70] / [i915#95])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-kbl7/igt@kms_cursor_edge_walk@pipe-a-256x256-right-edge.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4669/shard-kbl7/igt@kms_cursor_edge_walk@pipe-a-256x256-right-edge.html

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - shard-hsw:          [PASS][15] -> [FAIL][16] ([i915#57])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-hsw2/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4669/shard-hsw6/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:
    - shard-apl:          [PASS][17] -> [DMESG-WARN][18] ([i915#180]) +2 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-apl3/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4669/shard-apl1/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html

  * igt@kms_flip@flip-vs-suspend@c-dp1:
    - shard-kbl:          [PASS][19] -> [DMESG-WARN][20] ([i915#180]) +3 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-kbl4/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4669/shard-kbl1/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-apl:          [PASS][21] -> [FAIL][22] ([i915#49])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-apl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4669/shard-apl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html
    - shard-kbl:          [PASS][23] -> [FAIL][24] ([i915#49])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4669/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-msflip-blt:
    - shard-tglb:         [PASS][25] -> [DMESG-WARN][26] ([i915#1982]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-tglb2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-msflip-blt.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4669/shard-tglb6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:
    - shard-iclb:         [PASS][27] -> [DMESG-WARN][28] ([i915#1982])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-iclb4/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4669/shard-iclb3/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence:
    - shard-apl:          [PASS][29] -> [DMESG-FAIL][30] ([i915#95]) +2 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-apl8/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4669/shard-apl3/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html

  * igt@kms_plane_cursor@pipe-b-primary-size-256:
    - shard-kbl:          [PASS][31] -> [DMESG-WARN][32] ([i915#1982])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-kbl4/igt@kms_plane_cursor@pipe-b-primary-size-256.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4669/shard-kbl4/igt@kms_plane_cursor@pipe-b-primary-size-256.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [PASS][33] -> [SKIP][34] ([fdo#109441])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-iclb2/igt@kms_psr@psr2_cursor_render.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4669/shard-iclb7/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_pwrite_crc:
    - shard-kbl:          [PASS][35] -> [DMESG-WARN][36] ([i915#93] / [i915#95]) +48 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-kbl7/igt@kms_pwrite_crc.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4669/shard-kbl4/igt@kms_pwrite_crc.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@legacy-engines-mixed-process@blt:
    - shard-apl:          [FAIL][37] ([i915#1528]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-apl6/igt@gem_ctx_persistence@legacy-engines-mixed-process@blt.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4669/shard-apl8/igt@gem_ctx_persistence@legacy-engines-mixed-process@blt.html

  * igt@gem_ctx_shared@disjoint-timelines:
    - shard-kbl:          [DMESG-WARN][39] ([i915#93] / [i915#95]) -> [PASS][40] +50 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-kbl6/igt@gem_ctx_shared@disjoint-timelines.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4669/shard-kbl7/igt@gem_ctx_shared@disjoint-timelines.html

  * igt@gem_mmap_gtt@ptrace:
    - shard-hsw:          [INCOMPLETE][41] ([i915#61]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-hsw4/igt@gem_mmap_gtt@ptrace.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4669/shard-hsw4/igt@gem_mmap_gtt@ptrace.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-tglb:         [DMESG-WARN][43] ([i915#402]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-tglb3/igt@i915_module_load@reload-with-fault-injection.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4669/shard-tglb6/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][45] ([i915#1899]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-iclb4/igt@i915_pm_dc@dc6-psr.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4669/shard-iclb7/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_addfb_basic@bad-pitch-32:
    - shard-hsw:          [TIMEOUT][47] ([i915#1958]) -> [PASS][48] +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-hsw8/igt@kms_addfb_basic@bad-pitch-32.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4669/shard-hsw4/igt@kms_addfb_basic@bad-pitch-32.html
    - shard-snb:          [TIMEOUT][49] ([i915#1958]) -> [PASS][50] +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-snb6/igt@kms_addfb_basic@bad-pitch-32.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4669/shard-snb1/igt@kms_addfb_basic@bad-pitch-32.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-apl:          [DMESG-WARN][51] ([i915#1982]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-apl2/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4669/shard-apl3/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen:
    - shard-kbl:          [DMESG-FAIL][53] ([i915#54] / [i915#95]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4669/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html

  * igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic:
    - shard-apl:          [DMESG-WARN][55] ([i915#95]) -> [PASS][56] +36 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-apl4/igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4669/shard-apl1/igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_draw_crc@draw-method-xrgb8888-render-xtiled:
    - shard-apl:          [DMESG-FAIL][57] ([i915#54] / [i915#95]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-apl1/igt@kms_draw_crc@draw-method-xrgb8888-render-xtiled.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4669/shard-apl3/igt@kms_draw_crc@draw-method-xrgb8888-render-xtiled.html

  * igt@kms_flip@dpms-off-confusion@a-hdmi-a1:
    - shard-glk:          [DMESG-WARN][59] ([i915#1982]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-glk9/igt@kms_flip@dpms-off-confusion@a-hdmi-a1.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4669/shard-glk9/igt@kms_flip@dpms-off-confusion@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [DMESG-WARN][61] ([i915#180]) -> [PASS][62] +8 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4669/shard-kbl6/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_flip@flip-vs-suspend@a-dp1:
    - shard-apl:          [DMESG-WARN][63] ([i915#180]) -> [PASS][64] +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-apl4/igt@kms_flip@flip-vs-suspend@a-dp1.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4669/shard-apl7/igt@kms_flip@flip-vs-suspend@a-dp1.html

  * igt@kms_flip@plain-flip-ts-check@a-dp1:
    - shard-kbl:          [DMESG-WARN][65] ([i915#1982]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-kbl6/igt@kms_flip@plain-flip-ts-check@a-dp1.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4669/shard-kbl1/igt@kms_flip@plain-flip-ts-check@a-dp1.html

  * igt@kms_frontbuffer_tracking@psr-slowdraw:
    - shard-tglb:         [DMESG-WARN][67] ([i915#1982]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-tglb1/igt@kms_frontbuffer_tracking@psr-slowdraw.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4669/shard-tglb1/igt@kms_frontbuffer_tracking@psr-slowdraw.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [SKIP][69] ([i915#433]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-tglb3/igt@kms_hdmi_inject@inject-audio.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4669/shard-tglb7/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-64:
    - shard-kbl:          [DMESG-FAIL][71] ([i915#95]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-kbl4/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4669/shard-kbl3/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
    - shard-apl:          [DMESG-FAIL][73] ([i915#95]) -> [PASS][74] +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-apl4/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4669/shard-apl4/igt@kms_plane_cursor@pipe-a-viewport-size-64.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-tglb:         [SKIP][75] ([i915#1911]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-tglb5/igt@kms_psr2_su@frontbuffer.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4669/shard-tglb1/igt@kms_psr2_su@frontbuffer.html
    - shard-iclb:         [SKIP][77] ([i915#1911]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4669/shard-iclb2/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [SKIP][79] ([fdo#109441]) -> [PASS][80] +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-iclb3/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4669/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [FAIL][81] ([i915#31]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-kbl6/igt@kms_setmode@basic.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4669/shard-kbl6/igt@kms_setmode@basic.html

  * igt@perf@blocking-parameterized:
    - shard-iclb:         [FAIL][83] ([i915#1542]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-iclb7/igt@perf@blocking-parameterized.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4669/shard-iclb3/igt@perf@blocking-parameterized.html

  
#### Warnings ####

  * igt@gem_exec_reloc@basic-concurrent16:
    - shard-snb:          [TIMEOUT][85] ([i915#1958]) -> [FAIL][86] ([i915#1930])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-snb6/igt@gem_exec_reloc@basic-concurrent16.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4669/shard-snb6/igt@gem_exec_reloc@basic-concurrent16.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [FAIL][87] ([i915#1899]) -> [FAIL][88] ([i915#454])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-tglb3/igt@i915_pm_dc@dc6-psr.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4669/shard-tglb6/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_busy@basic-flip-pipe-d:
    - shard-hsw:          [TIMEOUT][89] ([i915#1958]) -> [SKIP][90] ([fdo#109271]) +1 similar issue
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-hsw8/igt@kms_busy@basic-flip-pipe-d.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4669/shard-hsw4/igt@kms_busy@basic-flip-pipe-d.html

  * igt@kms_content_protection@atomic:
    - shard-apl:          [TIMEOUT][91] ([i915#1319] / [i915#1635]) -> [FAIL][92] ([fdo#110321] / [fdo#110336])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-apl4/igt@kms_content_protection@atomic.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4669/shard-apl6/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          [TIMEOUT][93] ([i915#1319]) -> [TIMEOUT][94] ([i915#1319] / [i915#1635])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-apl1/igt@kms_content_protection@atomic-dpms.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4669/shard-apl8/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@legacy:
    - shard-apl:          [FAIL][95] ([fdo#110321] / [fdo#110336]) -> [TIMEOUT][96] ([i915#1319] / [i915#1635])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-apl7/igt@kms_content_protection@legacy.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4669/shard-apl1/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic:
    - shard-apl:          [TIMEOUT][97] ([i915#1319]) -> [FAIL][98] ([fdo#110321]) +1 similar issue
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-apl6/igt@kms_content_protection@lic.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4669/shard-apl1/igt@kms_content_protection@lic.html

  * igt@kms_content_protection@srm:
    - shard-kbl:          [DMESG-FAIL][99] ([fdo#110321] / [i915#95]) -> [TIMEOUT][100] ([i915#1319])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-kbl2/igt@kms_content_protection@srm.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4669/shard-kbl3/igt@kms_content_protection@srm.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-kbl:          [DMESG-WARN][101] ([i915#180]) -> [DMESG-FAIL][102] ([i915#95])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-kbl3/igt@kms_fbcon_fbt@fbc-suspend.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4669/shard-kbl6/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-farfromfence:
    - shard-hsw:          [SKIP][103] ([fdo#109271]) -> [TIMEOUT][104] ([i915#1958]) +2 similar issues
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-hsw4/igt@kms_frontbuffer_tracking@fbc-farfromfence.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4669/shard-hsw2/igt@kms_frontbuffer_tracking@fbc-farfromfence.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max:
    - shard-apl:          [DMESG-FAIL][105] ([fdo#108145] / [i915#95]) -> [FAIL][106] ([fdo#108145] / [i915#265])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4669/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb:
    - shard-kbl:          [FAIL][107] ([fdo#108145] / [i915#265]) -> [DMESG-FAIL][108] ([fdo#108145] / [i915#95])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-kbl3/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4669/shard-kbl4/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@pipe-d-alpha-transparent-fb:
    - shard-snb:          [TIMEOUT][109] ([i915#1958]) -> [SKIP][110] ([fdo#109271]) +3 similar issues
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-snb6/igt@kms_plane_alpha_blend@pipe-d-alpha-transparent-fb.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4669/shard-snb6/igt@kms_plane_alpha_blend@pipe-d-alpha-transparent-fb.html

  
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1528]: https://gitlab.freedesktop.org/drm/intel/issues/1528
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1899]: https://gitlab.freedesktop.org/drm/intel/issues/1899
  [i915#1904]: https://gitlab.freedesktop.org/drm/intel/issues/1904
  [i915#1911]: https://gitlab.freedesktop.org/drm/intel/issues/1911
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#57]: https://gitlab.freedesktop.org/drm/intel/issues/57
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#70]: https://gitlab.freedesktop.org/drm/intel/issues/70
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5702 -> IGTPW_4669
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8617: 2100025f87587a1dcf07985174c79a68c4a550eb @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4669: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4669/index.html
  IGT_5702: d16ad07e7f2a028e14d61f570931c87fa5ce404c @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4669/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
