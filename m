Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 03 Jul 2020 16:26:06 -0000
Message-ID: <159379356694.25591.17364911818547126600@emeril.freedesktop.org>
References: <20200703050302.25937-1-kunal1.joshi@intel.com>
In-Reply-To: <20200703050302.25937-1-kunal1.joshi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliL2ln?=
 =?utf-8?q?t=5Fchamelium=3A_Wait_for_connectors_after_replugging_them_at_e?=
 =?utf-8?q?xit?=
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
To: Kunal Joshi <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: lib/igt_chamelium: Wait for connectors after replugging them at exit
URL   : https://patchwork.freedesktop.org/series/79090/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8707_full -> IGTPW_4735_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4735_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4735_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4735/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4735_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_fbcon_fbt@fbc:
    - shard-iclb:         [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8707/shard-iclb1/igt@kms_fbcon_fbt@fbc.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4735/shard-iclb2/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-tglb:         [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8707/shard-tglb3/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4735/shard-tglb8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  
#### Warnings ####

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-hsw:          [SKIP][5] ([fdo#109271]) -> [INCOMPLETE][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8707/shard-hsw5/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4735/shard-hsw4/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  
Known issues
------------

  Here are the changes found in IGTPW_4735_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_param@set-priority-not-supported:
    - shard-snb:          [PASS][7] -> [TIMEOUT][8] ([i915#1958] / [i915#2119]) +2 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8707/shard-snb4/igt@gem_ctx_param@set-priority-not-supported.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4735/shard-snb4/igt@gem_ctx_param@set-priority-not-supported.html

  * igt@gem_userptr_blits@input-checking:
    - shard-hsw:          [PASS][9] -> [TIMEOUT][10] ([i915#1958] / [i915#2119]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8707/shard-hsw5/igt@gem_userptr_blits@input-checking.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4735/shard-hsw8/igt@gem_userptr_blits@input-checking.html

  * igt@gem_userptr_blits@sync-unmap:
    - shard-tglb:         [PASS][11] -> [DMESG-WARN][12] ([i915#402]) +3 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8707/shard-tglb7/igt@gem_userptr_blits@sync-unmap.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4735/shard-tglb1/igt@gem_userptr_blits@sync-unmap.html

  * igt@i915_pm_dc@dc5-psr:
    - shard-iclb:         [PASS][13] -> [FAIL][14] ([i915#1899])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8707/shard-iclb6/igt@i915_pm_dc@dc5-psr.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4735/shard-iclb8/igt@i915_pm_dc@dc5-psr.html

  * igt@kms_big_fb@linear-16bpp-rotate-180:
    - shard-kbl:          [PASS][15] -> [DMESG-FAIL][16] ([i915#95]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8707/shard-kbl6/igt@kms_big_fb@linear-16bpp-rotate-180.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4735/shard-kbl7/igt@kms_big_fb@linear-16bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-glk:          [PASS][17] -> [DMESG-FAIL][18] ([i915#118] / [i915#95])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8707/shard-glk7/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4735/shard-glk8/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-iclb:         [PASS][19] -> [DMESG-WARN][20] ([i915#1982])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8707/shard-iclb4/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4735/shard-iclb3/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen:
    - shard-kbl:          [PASS][21] -> [DMESG-WARN][22] ([i915#93] / [i915#95]) +45 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8707/shard-kbl4/igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4735/shard-kbl7/igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding:
    - shard-apl:          [PASS][23] -> [FAIL][24] ([i915#54])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8707/shard-apl2/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4735/shard-apl2/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html
    - shard-kbl:          [PASS][25] -> [FAIL][26] ([i915#54])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8707/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4735/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html

  * igt@kms_cursor_edge_walk@pipe-c-256x256-top-edge:
    - shard-hsw:          [PASS][27] -> [DMESG-WARN][28] ([i915#1982])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8707/shard-hsw7/igt@kms_cursor_edge_walk@pipe-c-256x256-top-edge.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4735/shard-hsw6/igt@kms_cursor_edge_walk@pipe-c-256x256-top-edge.html

  * igt@kms_cursor_legacy@short-flip-before-cursor-toggle:
    - shard-glk:          [PASS][29] -> [DMESG-WARN][30] ([i915#118] / [i915#95]) +3 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8707/shard-glk5/igt@kms_cursor_legacy@short-flip-before-cursor-toggle.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4735/shard-glk4/igt@kms_cursor_legacy@short-flip-before-cursor-toggle.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-ytiled:
    - shard-glk:          [PASS][31] -> [FAIL][32] ([i915#52] / [i915#54])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8707/shard-glk3/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-ytiled.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4735/shard-glk4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-ytiled.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-kbl:          [PASS][33] -> [FAIL][34] ([i915#64])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8707/shard-kbl1/igt@kms_fbcon_fbt@fbc.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4735/shard-kbl3/igt@kms_fbcon_fbt@fbc.html
    - shard-apl:          [PASS][35] -> [FAIL][36] ([i915#1525])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8707/shard-apl7/igt@kms_fbcon_fbt@fbc.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4735/shard-apl7/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp1:
    - shard-apl:          [PASS][37] -> [FAIL][38] ([i915#79])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8707/shard-apl7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp1.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4735/shard-apl3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a2:
    - shard-glk:          [PASS][39] -> [FAIL][40] ([i915#79])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8707/shard-glk5/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a2.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4735/shard-glk5/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a2.html

  * igt@kms_flip@flip-vs-suspend@c-dp1:
    - shard-kbl:          [PASS][41] -> [DMESG-WARN][42] ([i915#180]) +5 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8707/shard-kbl2/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4735/shard-kbl1/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-tglb:         [PASS][43] -> [DMESG-WARN][44] ([i915#1982]) +2 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8707/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-gtt.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4735/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_pipe_crc_basic@hang-read-crc-pipe-a:
    - shard-apl:          [PASS][45] -> [DMESG-FAIL][46] ([i915#1635] / [i915#95])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8707/shard-apl1/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4735/shard-apl3/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b:
    - shard-tglb:         [PASS][47] -> [INCOMPLETE][48] ([CI#80] / [i915#1798] / [i915#456])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8707/shard-tglb8/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4735/shard-tglb1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html

  * igt@kms_psr2_su@page_flip:
    - shard-tglb:         [PASS][49] -> [SKIP][50] ([i915#1911])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8707/shard-tglb2/igt@kms_psr2_su@page_flip.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4735/shard-tglb6/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-iclb:         [PASS][51] -> [SKIP][52] ([fdo#109441]) +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8707/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4735/shard-iclb7/igt@kms_psr@psr2_cursor_plane_move.html

  * igt@kms_setmode@basic:
    - shard-glk:          [PASS][53] -> [FAIL][54] ([i915#31])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8707/shard-glk2/igt@kms_setmode@basic.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4735/shard-glk5/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-c-ts-continuation-suspend:
    - shard-kbl:          [PASS][55] -> [INCOMPLETE][56] ([i915#155] / [i915#794])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8707/shard-kbl3/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4735/shard-kbl2/igt@kms_vblank@pipe-c-ts-continuation-suspend.html

  * igt@perf@invalid-oa-metric-set-id:
    - shard-apl:          [PASS][57] -> [DMESG-WARN][58] ([i915#1635] / [i915#95]) +31 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8707/shard-apl3/igt@perf@invalid-oa-metric-set-id.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4735/shard-apl4/igt@perf@invalid-oa-metric-set-id.html

  * igt@syncobj_wait@multi-wait-all-for-submit-unsubmitted-signaled:
    - shard-iclb:         [PASS][59] -> [DMESG-WARN][60] ([i915#1226])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8707/shard-iclb3/igt@syncobj_wait@multi-wait-all-for-submit-unsubmitted-signaled.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4735/shard-iclb2/igt@syncobj_wait@multi-wait-all-for-submit-unsubmitted-signaled.html

  
#### Possible fixes ####

  * igt@i915_module_load@reload:
    - shard-tglb:         [DMESG-WARN][61] ([i915#402]) -> [PASS][62] +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8707/shard-tglb3/igt@i915_module_load@reload.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4735/shard-tglb1/igt@i915_module_load@reload.html

  * igt@i915_suspend@forcewake:
    - shard-kbl:          [DMESG-WARN][63] ([i915#165]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8707/shard-kbl2/igt@i915_suspend@forcewake.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4735/shard-kbl6/igt@i915_suspend@forcewake.html

  * igt@i915_suspend@sysfs-reader:
    - shard-kbl:          [INCOMPLETE][65] ([i915#155]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8707/shard-kbl2/igt@i915_suspend@sysfs-reader.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4735/shard-kbl7/igt@i915_suspend@sysfs-reader.html

  * igt@kms_atomic@atomic-invalid-params:
    - shard-apl:          [DMESG-WARN][67] ([i915#1635] / [i915#95]) -> [PASS][68] +30 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8707/shard-apl6/igt@kms_atomic@atomic-invalid-params.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4735/shard-apl7/igt@kms_atomic@atomic-invalid-params.html

  * igt@kms_cursor_crc@pipe-b-cursor-128x42-sliding:
    - shard-hsw:          [TIMEOUT][69] ([i915#1958] / [i915#2119]) -> [PASS][70] +3 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8707/shard-hsw8/igt@kms_cursor_crc@pipe-b-cursor-128x42-sliding.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4735/shard-hsw2/igt@kms_cursor_crc@pipe-b-cursor-128x42-sliding.html

  * igt@kms_cursor_edge_walk@pipe-c-128x128-right-edge:
    - shard-glk:          [DMESG-WARN][71] ([i915#1982]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8707/shard-glk9/igt@kms_cursor_edge_walk@pipe-c-128x128-right-edge.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4735/shard-glk7/igt@kms_cursor_edge_walk@pipe-c-128x128-right-edge.html

  * igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions:
    - shard-kbl:          [DMESG-WARN][73] ([i915#1982]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8707/shard-kbl4/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4735/shard-kbl1/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-ytiled:
    - shard-apl:          [DMESG-WARN][75] ([i915#1982]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8707/shard-apl8/igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-ytiled.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4735/shard-apl2/igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-ytiled.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [FAIL][77] ([i915#1525]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8707/shard-apl8/igt@kms_fbcon_fbt@fbc-suspend.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4735/shard-apl3/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [DMESG-WARN][79] ([i915#180]) -> [PASS][80] +8 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8707/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4735/shard-kbl6/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_flip_tiling@flip-changes-tiling-y:
    - shard-apl:          [DMESG-FAIL][81] ([i915#1635] / [i915#95]) -> [PASS][82] +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8707/shard-apl1/igt@kms_flip_tiling@flip-changes-tiling-y.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4735/shard-apl7/igt@kms_flip_tiling@flip-changes-tiling-y.html

  * igt@kms_frontbuffer_tracking@basic:
    - shard-snb:          [TIMEOUT][83] ([i915#1958] / [i915#2119]) -> [PASS][84] +1 similar issue
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8707/shard-snb5/igt@kms_frontbuffer_tracking@basic.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4735/shard-snb1/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_frontbuffer_tracking@fbc-farfromfence:
    - shard-kbl:          [DMESG-WARN][85] ([i915#93] / [i915#95]) -> [PASS][86] +43 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8707/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-farfromfence.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4735/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-farfromfence.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
    - shard-tglb:         [DMESG-WARN][87] ([i915#1982]) -> [PASS][88] +3 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8707/shard-tglb3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4735/shard-tglb5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [SKIP][89] ([i915#433]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8707/shard-tglb2/igt@kms_hdmi_inject@inject-audio.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4735/shard-tglb6/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [DMESG-FAIL][91] ([i915#95]) -> [PASS][92] +1 similar issue
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8707/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4735/shard-kbl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min:
    - shard-kbl:          [DMESG-FAIL][93] ([fdo#108145] / [i915#95]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8707/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4735/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant:
    - shard-apl:          [DMESG-FAIL][95] ([fdo#108145] / [i915#1635] / [i915#95]) -> [PASS][96] +1 similar issue
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8707/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4735/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html

  * igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping:
    - shard-iclb:         [DMESG-WARN][97] ([i915#1982]) -> [PASS][98] +1 similar issue
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8707/shard-iclb2/igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4735/shard-iclb1/igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping.html

  * igt@kms_psr@psr2_dpms:
    - shard-iclb:         [SKIP][99] ([fdo#109441]) -> [PASS][100] +1 similar issue
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8707/shard-iclb4/igt@kms_psr@psr2_dpms.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4735/shard-iclb2/igt@kms_psr@psr2_dpms.html

  * igt@kms_vblank@pipe-a-query-forked:
    - shard-snb:          [SKIP][101] ([fdo#109271]) -> [PASS][102] +1 similar issue
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8707/shard-snb6/igt@kms_vblank@pipe-a-query-forked.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4735/shard-snb2/igt@kms_vblank@pipe-a-query-forked.html

  
#### Warnings ####

  * igt@gem_exec_reloc@basic-concurrent0:
    - shard-apl:          [FAIL][103] ([i915#1930]) -> [DMESG-FAIL][104] ([i915#1635] / [i915#95])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8707/shard-apl8/igt@gem_exec_reloc@basic-concurrent0.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4735/shard-apl7/igt@gem_exec_reloc@basic-concurrent0.html
    - shard-kbl:          [FAIL][105] ([i915#1930]) -> [DMESG-FAIL][106] ([i915#95])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8707/shard-kbl1/igt@gem_exec_reloc@basic-concurrent0.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4735/shard-kbl3/igt@gem_exec_reloc@basic-concurrent0.html

  * igt@gem_exec_reloc@basic-concurrent16:
    - shard-kbl:          [INCOMPLETE][107] ([i915#1958] / [i915#95]) -> [INCOMPLETE][108] ([i915#1958])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8707/shard-kbl4/igt@gem_exec_reloc@basic-concurrent16.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4735/shard-kbl3/igt@gem_exec_reloc@basic-concurrent16.html
    - shard-apl:          [INCOMPLETE][109] ([i915#1635] / [i915#1958] / [i915#95]) -> [INCOMPLETE][110] ([i915#1635] / [i915#1958])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8707/shard-apl1/igt@gem_exec_reloc@basic-concurrent16.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4735/shard-apl2/igt@gem_exec_reloc@basic-concurrent16.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][111] ([i915#588]) -> [SKIP][112] ([i915#658])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8707/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4735/shard-iclb3/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-apl:          [SKIP][113] ([fdo#109271] / [i915#1635]) -> [SKIP][114] ([fdo#109271]) +10 similar issues
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8707/shard-apl4/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4735/shard-apl3/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_chamelium@vga-hpd-with-enabled-mode:
    - shard-apl:          [SKIP][115] ([fdo#109271] / [fdo#111827]) -> [SKIP][116] ([fdo#109271] / [fdo#111827] / [i915#1635])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8707/shard-apl7/igt@kms_chamelium@vga-hpd-with-enabled-mode.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4735/shard-apl1/igt@kms_chamelium@vga-hpd-with-enabled-mode.html

  * igt@kms_color_chamelium@pipe-invalid-degamma-lut-sizes:
    - shard-apl:          [SKIP][117] ([fdo#109271] / [fdo#111827] / [i915#1635]) -> [SKIP][118] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8707/shard-apl1/igt@kms_color_chamelium@pipe-invalid-degamma-lut-sizes.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4735/shard-apl3/igt@kms_color_chamelium@pipe-invalid-degamma-lut-sizes.html

  * igt@kms_content_protection@atomic:
    - shard-apl:          [FAIL][119] ([fdo#110321] / [fdo#110336]) -> [DMESG-FAIL][120] ([fdo#110321] / [i915#1635] / [i915#95])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8707/shard-apl6/igt@kms_content_protection@atomic.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4735/shard-apl7/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@srm:
    - shard-apl:          [DMESG-FAIL][121] ([fdo#110321] / [i915#1635] / [i915#95]) -> [FAIL][122] ([fdo#110321])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8707/shard-apl4/igt@kms_content_protection@srm.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4735/shard-apl2/igt@kms_content_protection@srm.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-kbl:          [FAIL][123] ([i915#64]) -> [DMESG-WARN][124] ([i915#180])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8707/shard-kbl1/igt@kms_fbcon_fbt@fbc-suspend.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4735/shard-kbl7/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:
    - shard-snb:          [SKIP][125] ([fdo#109271]) -> [TIMEOUT][126] ([i915#1958] / [i915#2119]) +1 similar issue
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8707/shard-snb6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4735/shard-snb4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html
    - shard-hsw:          [SKIP][127] ([fdo#109271]) -> [TIMEOUT][128] ([i915#1958] / [i915#2119]) +1 similar issue
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8707/shard-hsw5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4735/shard-hsw8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [DMESG-WARN][129] ([i915#180] / [i915#93] / [i915#95]) -> [DMESG-WARN][130] ([i915#93] / [i915#95])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8707/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4735/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_vblank@pipe-d-ts-continuation-idle:
    - shard-apl:          [SKIP][131] ([fdo#109271]) -> [SKIP][132] ([fdo#109271] / [i915#1635]) +20 similar issues
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8707/shard-apl1/igt@kms_vblank@pipe-d-ts-continuation-idle.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4735/shard-apl3/igt@kms_vblank@pipe-d-ts-continuation-idle.html

  * igt@perf_pmu@rc6-runtime-pm-long:
    - shard-snb:          [TIMEOUT][133] ([i915#1958] / [i915#2119]) -> [SKIP][134] ([fdo#109271]) +2 similar issues
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8707/shard-snb5/igt@perf_pmu@rc6-runtime-pm-long.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4735/shard-snb2/igt@perf_pmu@rc6-runtime-pm-long.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][135], [FAIL][136], [FAIL][137], [FAIL][138]) ([i915#1610] / [i915#1635] / [i915#2110]) -> [FAIL][139] ([i915#1635] / [i915#2110])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8707/shard-apl3/igt@runner@aborted.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8707/shard-apl6/igt@runner@aborted.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8707/shard-apl4/igt@runner@aborted.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8707/shard-apl1/igt@runner@aborted.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4735/shard-apl4/igt@runner@aborted.html
    - shard-tglb:         ([FAIL][140], [FAIL][141]) ([i915#2110]) -> ([FAIL][142], [FAIL][143]) ([i915#1602] / [i915#2110])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8707/shard-tglb7/igt@runner@aborted.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8707/shard-tglb1/igt@runner@aborted.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4735/shard-tglb1/igt@runner@aborted.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4735/shard-tglb1/igt@runner@aborted.html

  
  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1226]: https://gitlab.freedesktop.org/drm/intel/issues/1226
  [i915#1525]: https://gitlab.freedesktop.org/drm/intel/issues/1525
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1610]: https://gitlab.freedesktop.org/drm/intel/issues/1610
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#165]: https://gitlab.freedesktop.org/drm/intel/issues/165
  [i915#1798]: https://gitlab.freedesktop.org/drm/intel/issues/1798
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1899]: https://gitlab.freedesktop.org/drm/intel/issues/1899
  [i915#1911]: https://gitlab.freedesktop.org/drm/intel/issues/1911
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2110]: https://gitlab.freedesktop.org/drm/intel/issues/2110
  [i915#2119]: https://gitlab.freedesktop.org/drm/intel/issues/2119
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#64]: https://gitlab.freedesktop.org/drm/intel/issues/64
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#794]: https://gitlab.freedesktop.org/drm/intel/issues/794
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5721 -> IGTPW_4735
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8707: d499de3ecccf4923c7e35e298fb6f13611a8f70e @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4735: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4735/index.htm

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4735/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
