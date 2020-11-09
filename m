Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 09 Nov 2020 05:44:39 -0000
Message-ID: <160490067949.18040.4805980389431922342@emeril.freedesktop.org>
References: <20201106102222.8674-1-mohammed.khajapasha@intel.com>
In-Reply-To: <20201106102222.8674-1-mohammed.khajapasha@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fplane=5Fscaling=3A_Don=27t_run_plane_scaler_tests_on_each?=
 =?utf-8?q?_output?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0641900141=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0641900141==
Content-Type: multipart/alternative;
 boundary="===============0373154881595634085=="

--===============0373154881595634085==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_plane_scaling: Don't run plane scaler tests on each output
URL   : https://patchwork.freedesktop.org/series/83578/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9281_full -> IGTPW_5140_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5140_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5140_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5140_full:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@hotunbind-rebind:
    - shard-glk:          [PASS][1] -> [INCOMPLETE][2] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-glk2/igt@core_hotunplug@hotunbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-glk1/igt@core_hotunplug@hotunbind-rebind.html
    - shard-kbl:          [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-kbl4/igt@core_hotunplug@hotunbind-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-kbl4/igt@core_hotunplug@hotunbind-rebind.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-snb:          [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-snb4/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-snb5/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@runner@aborted:
    - shard-hsw:          NOTRUN -> [FAIL][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-hsw8/igt@runner@aborted.html
    - shard-iclb:         NOTRUN -> [FAIL][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-iclb4/igt@runner@aborted.html
    - shard-tglb:         NOTRUN -> [FAIL][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-tglb6/igt@runner@aborted.html

  
#### Warnings ####

  * igt@core_hotunplug@hotunbind-rebind:
    - shard-hsw:          [WARN][10] ([i915#2283]) -> [INCOMPLETE][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-hsw1/igt@core_hotunplug@hotunbind-rebind.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-hsw8/igt@core_hotunplug@hotunbind-rebind.html
    - shard-iclb:         [DMESG-WARN][12] ([i915#1982]) -> [INCOMPLETE][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-iclb4/igt@core_hotunplug@hotunbind-rebind.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-iclb4/igt@core_hotunplug@hotunbind-rebind.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@kms_flip_tiling@flip-to-y-tiled@hdmi-a-2-pipe-a}:
    - shard-glk:          [PASS][14] -> [FAIL][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-glk1/igt@kms_flip_tiling@flip-to-y-tiled@hdmi-a-2-pipe-a.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-glk8/igt@kms_flip_tiling@flip-to-y-tiled@hdmi-a-2-pipe-a.html

  
New tests
---------

  New tests have been introduced between CI_DRM_9281_full and IGTPW_5140_full:

### New IGT tests (20) ###

  * igt@kms_plane_scaling@plane-scaling:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane_scaling@plane-scaling@pipe-a-plane-scaling:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 2.60] s

  * igt@kms_plane_scaling@plane-scaling@pipe-b-plane-scaling:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 3.56] s

  * igt@kms_plane_scaling@plane-scaling@pipe-c-plane-scaling:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 3.55] s

  * igt@kms_plane_scaling@plane-scaling@pipe-d-plane-scaling:
    - Statuses : 1 pass(s)
    - Exec time: [2.76] s

  * igt@kms_plane_scaling@scaler-with-clipping-clamping:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-a-scaler-with-rotation:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 21.18] s

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-scaler-with-rotation:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 22.20] s

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-rotation:
    - Statuses : 2 pass(s) 4 skip(s)
    - Exec time: [0.0, 22.17] s

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-d-scaler-with-rotation:
    - Statuses : 1 pass(s)
    - Exec time: [20.17] s

  * igt@kms_plane_scaling@scaler-with-pixel-format:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane_scaling@scaler-with-pixel-format@pipe-a-scaler-with-pixel-format:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 8.66] s

  * igt@kms_plane_scaling@scaler-with-pixel-format@pipe-b-scaler-with-pixel-format:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 10.99] s

  * igt@kms_plane_scaling@scaler-with-pixel-format@pipe-c-scaler-with-pixel-format:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 15.17] s

  * igt@kms_plane_scaling@scaler-with-pixel-format@pipe-d-scaler-with-pixel-format:
    - Statuses : 1 pass(s)
    - Exec time: [9.68] s

  * igt@kms_plane_scaling@scaler-with-rotation:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane_scaling@scaler-with-rotation@pipe-a-scaler-with-rotation:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 6.93] s

  * igt@kms_plane_scaling@scaler-with-rotation@pipe-b-scaler-with-rotation:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 8.98] s

  * igt@kms_plane_scaling@scaler-with-rotation@pipe-c-scaler-with-rotation:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 10.51] s

  * igt@kms_plane_scaling@scaler-with-rotation@pipe-d-scaler-with-rotation:
    - Statuses : 1 pass(s)
    - Exec time: [9.90] s

  

Known issues
------------

  Here are the changes found in IGTPW_5140_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotunbind-rebind:
    - shard-tglb:         [PASS][16] -> [INCOMPLETE][17] ([i915#1602])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-tglb3/igt@core_hotunplug@hotunbind-rebind.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-tglb6/igt@core_hotunplug@hotunbind-rebind.html
    - shard-apl:          [PASS][18] -> [INCOMPLETE][19] ([i915#1635])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-apl1/igt@core_hotunplug@hotunbind-rebind.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-apl3/igt@core_hotunplug@hotunbind-rebind.html

  * igt@gem_exec_whisper@basic-contexts-all:
    - shard-glk:          [PASS][20] -> [DMESG-WARN][21] ([i915#118] / [i915#95])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-glk4/igt@gem_exec_whisper@basic-contexts-all.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-glk9/igt@gem_exec_whisper@basic-contexts-all.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-iclb:         [PASS][22] -> [DMESG-WARN][23] ([i915#1982])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-iclb2/igt@i915_module_load@reload-with-fault-injection.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-iclb1/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][24] -> [FAIL][25] ([i915#454])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-iclb7/igt@i915_pm_dc@dc6-psr.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-iclb6/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-kbl:          [PASS][26] -> [DMESG-WARN][27] ([i915#1982]) +6 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-kbl3/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-kbl4/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_cursor_edge_walk@pipe-b-64x64-right-edge:
    - shard-glk:          [PASS][28] -> [DMESG-WARN][29] ([i915#1982]) +8 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-glk5/igt@kms_cursor_edge_walk@pipe-b-64x64-right-edge.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-glk6/igt@kms_cursor_edge_walk@pipe-b-64x64-right-edge.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-hsw:          [PASS][30] -> [FAIL][31] ([i915#96])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-hsw7/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-hsw8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-tglb:         [PASS][32] -> [FAIL][33] ([i915#2346])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-tglb1/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-tglb2/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_draw_crc@draw-method-rgb565-render-untiled:
    - shard-snb:          [PASS][34] -> [FAIL][35] ([i915#54]) +1 similar issue
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-snb6/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-snb5/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1:
    - shard-hsw:          [PASS][36] -> [DMESG-WARN][37] ([i915#1982])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-hsw1/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-hsw6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1:
    - shard-tglb:         [PASS][38] -> [FAIL][39] ([i915#2122])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-tglb5/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-tglb8/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1:
    - shard-apl:          [PASS][40] -> [FAIL][41] ([i915#1635] / [i915#79])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-apl6/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-apl6/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:
    - shard-apl:          [PASS][42] -> [DMESG-WARN][43] ([i915#1635] / [i915#1982]) +7 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-apl4/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-apl3/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt:
    - shard-tglb:         [PASS][44] -> [DMESG-WARN][45] ([i915#1982]) +4 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [PASS][46] -> [SKIP][47] ([fdo#109441]) +1 similar issue
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-iclb3/igt@kms_psr@psr2_primary_page_flip.html

  * igt@perf@unprivileged-single-ctx-counters:
    - shard-hsw:          [PASS][48] -> [SKIP][49] ([fdo#109271])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-hsw7/igt@perf@unprivileged-single-ctx-counters.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-hsw1/igt@perf@unprivileged-single-ctx-counters.html

  
#### Possible fixes ####

  * igt@gem_ppgtt@blt-vs-render-ctx0:
    - shard-tglb:         [INCOMPLETE][50] ([i915#750]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-tglb2/igt@gem_ppgtt@blt-vs-render-ctx0.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-tglb2/igt@gem_ppgtt@blt-vs-render-ctx0.html

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-snb:          [INCOMPLETE][52] ([i915#82]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-snb2/igt@gem_userptr_blits@sync-unmap-cycles.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-snb7/igt@gem_userptr_blits@sync-unmap-cycles.html

  * {igt@kms_async_flips@alternate-sync-async-flip}:
    - shard-kbl:          [FAIL][54] ([i915#2521]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-kbl3/igt@kms_async_flips@alternate-sync-async-flip.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-kbl2/igt@kms_async_flips@alternate-sync-async-flip.html
    - shard-tglb:         [FAIL][56] ([i915#2521]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-tglb5/igt@kms_async_flips@alternate-sync-async-flip.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-tglb5/igt@kms_async_flips@alternate-sync-async-flip.html

  * {igt@kms_async_flips@async-flip-with-page-flip-events}:
    - shard-glk:          [FAIL][58] ([i915#2521]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-glk3/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-glk5/igt@kms_async_flips@async-flip-with-page-flip-events.html
    - shard-apl:          [FAIL][60] ([i915#1635] / [i915#2521]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-apl7/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-apl2/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * {igt@kms_async_flips@test-time-stamp}:
    - shard-tglb:         [FAIL][62] ([i915#2597]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-tglb6/igt@kms_async_flips@test-time-stamp.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-tglb7/igt@kms_async_flips@test-time-stamp.html

  * igt@kms_cursor_edge_walk@pipe-b-64x64-left-edge:
    - shard-apl:          [DMESG-WARN][64] ([i915#1635] / [i915#1982]) -> [PASS][65] +9 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-apl3/igt@kms_cursor_edge_walk@pipe-b-64x64-left-edge.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-apl6/igt@kms_cursor_edge_walk@pipe-b-64x64-left-edge.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-glk:          [DMESG-WARN][66] ([i915#1982]) -> [PASS][67] +10 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-glk7/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-glk9/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_flip@blocking-wf_vblank@a-dp1:
    - shard-kbl:          [DMESG-WARN][68] ([i915#1982]) -> [PASS][69] +4 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-kbl4/igt@kms_flip@blocking-wf_vblank@a-dp1.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-kbl3/igt@kms_flip@blocking-wf_vblank@a-dp1.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-tglb:         [FAIL][70] ([i915#2598]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-tglb2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-tglb2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [DMESG-WARN][72] ([i915#180]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-kbl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-kbl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [SKIP][74] ([fdo#109642] / [fdo#111068]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-iclb6/igt@kms_psr2_su@page_flip.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-iclb2/igt@kms_psr2_su@page_flip.html

  * igt@kms_sequence@queue-busy:
    - shard-tglb:         [DMESG-WARN][76] ([i915#1982]) -> [PASS][77] +2 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-tglb6/igt@kms_sequence@queue-busy.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-tglb1/igt@kms_sequence@queue-busy.html

  * igt@kms_sysfs_edid_timing:
    - shard-hsw:          [FAIL][78] ([IGT#2]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-hsw6/igt@kms_sysfs_edid_timing.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-hsw1/igt@kms_sysfs_edid_timing.html

  * igt@kms_universal_plane@disable-primary-vs-flip-pipe-a:
    - shard-hsw:          [DMESG-WARN][80] ([i915#1982]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-hsw1/igt@kms_universal_plane@disable-primary-vs-flip-pipe-a.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-hsw4/igt@kms_universal_plane@disable-primary-vs-flip-pipe-a.html

  * igt@perf@enable-disable:
    - shard-iclb:         [SKIP][82] ([i915#1354]) -> [PASS][83] +1 similar issue
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-iclb7/igt@perf@enable-disable.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-iclb2/igt@perf@enable-disable.html
    - shard-hsw:          [SKIP][84] ([fdo#109271]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-hsw8/igt@perf@enable-disable.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-hsw7/igt@perf@enable-disable.html

  * igt@perf@polling-small-buf:
    - shard-glk:          [SKIP][86] ([fdo#109271] / [i915#1354]) -> [PASS][87] +1 similar issue
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-glk1/igt@perf@polling-small-buf.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-glk9/igt@perf@polling-small-buf.html
    - shard-tglb:         [SKIP][88] ([i915#1354]) -> [PASS][89] +1 similar issue
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-tglb6/igt@perf@polling-small-buf.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-tglb6/igt@perf@polling-small-buf.html
    - shard-apl:          [SKIP][90] ([fdo#109271] / [i915#1354] / [i915#1635]) -> [PASS][91] +1 similar issue
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-apl6/igt@perf@polling-small-buf.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-apl8/igt@perf@polling-small-buf.html
    - shard-kbl:          [SKIP][92] ([fdo#109271] / [i915#1354]) -> [PASS][93] +1 similar issue
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-kbl1/igt@perf@polling-small-buf.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-kbl4/igt@perf@polling-small-buf.html

  
#### Warnings ####

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-hsw:          [FAIL][94] ([i915#2644]) -> [WARN][95] ([i915#2283])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-hsw7/igt@core_hotunplug@hotrebind-lateclose.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-hsw1/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-iclb:         [SKIP][96] ([fdo#109274] / [fdo#109278]) -> [SKIP][97] ([fdo#109274])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-iclb8/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-iclb4/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-apl:          [SKIP][98] ([fdo#109271] / [i915#1635]) -> [SKIP][99] ([fdo#109271] / [i915#1354] / [i915#1635]) +1 similar issue
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-apl4/igt@perf@per-context-mode-unprivileged.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-apl1/igt@perf@per-context-mode-unprivileged.html
    - shard-glk:          [SKIP][100] ([fdo#109271]) -> [SKIP][101] ([fdo#109271] / [i915#1354]) +1 similar issue
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-glk6/igt@perf@per-context-mode-unprivileged.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-glk4/igt@perf@per-context-mode-unprivileged.html
    - shard-kbl:          [SKIP][102] ([fdo#109271]) -> [SKIP][103] ([fdo#109271] / [i915#1354]) +1 similar issue
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-kbl1/igt@perf@per-context-mode-unprivileged.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-kbl1/igt@perf@per-context-mode-unprivileged.html

  * igt@perf@unprivileged-single-ctx-counters:
    - shard-iclb:         [SKIP][104] ([fdo#109289]) -> [SKIP][105] ([i915#1354])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-iclb5/igt@perf@unprivileged-single-ctx-counters.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-iclb2/igt@perf@unprivileged-single-ctx-counters.html
    - shard-tglb:         [SKIP][106] ([fdo#109289]) -> [SKIP][107] ([i915#1354])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-tglb3/igt@perf@unprivileged-single-ctx-counters.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-tglb3/igt@perf@unprivileged-single-ctx-counters.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1226]: https://gitlab.freedesktop.org/drm/intel/issues/1226
  [i915#1354]: https://gitlab.freedesktop.org/drm/intel/issues/1354
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#2283]: https://gitlab.freedesktop.org/drm/intel/issues/2283
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2521]: https://gitlab.freedesktop.org/drm/intel/issues/2521
  [i915#2597]: https://gitlab.freedesktop.org/drm/intel/issues/2597
  [i915#2598]: https://gitlab.freedesktop.org/drm/intel/issues/2598
  [i915#2644]: https://gitlab.freedesktop.org/drm/intel/issues/2644
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#750]: https://gitlab.freedesktop.org/drm/intel/issues/750
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [i915#96]: https://gitlab.freedesktop.org/drm/intel/issues/96


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5836 -> IGTPW_5140
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_9281: f88cfb4c62df91cd9024854d8739c5257e4b6a55 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5140: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/index.html
  IGT_5836: 4c2ec0ad123b82f42f9fe2297e1a41fec73c9229 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/index.html

--===============0373154881595634085==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <title>Project List - Patchwork</title>
  <style id="css-table-select" type="text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>tests/kms_plane_scaling: Don&#39;t run plane scaler tests on each output</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/83578/">https://patchwork.freedesktop.org/series/83578/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9281_full -&gt; IGTPW_5140_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5140_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5140_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5140_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotunbind-rebind:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-glk2/igt@core_hotunplug@hotunbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-glk1/igt@core_hotunplug@hotunbind-rebind.html">INCOMPLETE</a> +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-kbl4/igt@core_hotunplug@hotunbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-kbl4/igt@core_hotunplug@hotunbind-rebind.html">INCOMPLETE</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-180:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-snb4/igt@kms_big_fb@linear-64bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-snb5/igt@kms_big_fb@linear-64bpp-rotate-180.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-hsw8/igt@runner@aborted.html">FAIL</a></p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-iclb4/igt@runner@aborted.html">FAIL</a></p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-tglb6/igt@runner@aborted.html">FAIL</a></p>
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotunbind-rebind:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-hsw1/igt@core_hotunplug@hotunbind-rebind.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2283">i915#2283</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-hsw8/igt@core_hotunplug@hotunbind-rebind.html">INCOMPLETE</a></p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-iclb4/igt@core_hotunplug@hotunbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-iclb4/igt@core_hotunplug@hotunbind-rebind.html">INCOMPLETE</a></p>
</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@kms_flip_tiling@flip-to-y-tiled@hdmi-a-2-pipe-a}:<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-glk1/igt@kms_flip_tiling@flip-to-y-tiled@hdmi-a-2-pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-glk8/igt@kms_flip_tiling@flip-to-y-tiled@hdmi-a-2-pipe-a.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_9281_full and IGTPW_5140_full:</p>
<h3>New IGT tests (20)</h3>
<ul>
<li>
<p>igt@kms_plane_scaling@plane-scaling:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaling@pipe-a-plane-scaling:</p>
<ul>
<li>Statuses : 5 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 2.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaling@pipe-b-plane-scaling:</p>
<ul>
<li>Statuses : 5 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 3.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaling@pipe-c-plane-scaling:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 3.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaling@pipe-d-plane-scaling:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-clipping-clamping:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-a-scaler-with-rotation:</p>
<ul>
<li>Statuses : 5 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 21.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-scaler-with-rotation:</p>
<ul>
<li>Statuses : 5 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 22.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-rotation:</p>
<ul>
<li>Statuses : 2 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 22.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-d-scaler-with-rotation:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [20.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-pixel-format:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-pixel-format@pipe-a-scaler-with-pixel-format:</p>
<ul>
<li>Statuses : 5 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 8.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-pixel-format@pipe-b-scaler-with-pixel-format:</p>
<ul>
<li>Statuses : 5 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 10.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-pixel-format@pipe-c-scaler-with-pixel-format:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 15.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-pixel-format@pipe-d-scaler-with-pixel-format:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [9.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-rotation:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-rotation@pipe-a-scaler-with-rotation:</p>
<ul>
<li>Statuses : 5 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 6.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-rotation@pipe-b-scaler-with-rotation:</p>
<ul>
<li>Statuses : 5 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 8.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-rotation@pipe-c-scaler-with-rotation:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 10.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-rotation@pipe-d-scaler-with-rotation:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [9.90] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5140_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotunbind-rebind:</p>
<ul>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-tglb3/igt@core_hotunplug@hotunbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-tglb6/igt@core_hotunplug@hotunbind-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a>)</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-apl1/igt@core_hotunplug@hotunbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-apl3/igt@core_hotunplug@hotunbind-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-glk4/igt@gem_exec_whisper@basic-contexts-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-glk9/igt@gem_exec_whisper@basic-contexts-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-iclb2/igt@i915_module_load@reload-with-fault-injection.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-iclb1/igt@i915_module_load@reload-with-fault-injection.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-iclb7/igt@i915_pm_dc@dc6-psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-iclb6/igt@i915_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-kbl3/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-kbl4/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-b-64x64-right-edge:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-glk5/igt@kms_cursor_edge_walk@pipe-b-64x64-right-edge.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-glk6/igt@kms_cursor_edge_walk@pipe-b-64x64-right-edge.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-hsw7/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-hsw8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/96">i915#96</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-tglb1/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-tglb2/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-render-untiled:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-snb6/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-snb5/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-hsw1/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-hsw6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-tglb5/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-tglb8/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2122">i915#2122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-apl6/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-apl6/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-apl4/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-apl3/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_page_flip:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-iclb3/igt@kms_psr@psr2_primary_page_flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@perf@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-hsw7/igt@perf@unprivileged-single-ctx-counters.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-hsw1/igt@perf@unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ppgtt@blt-vs-render-ctx0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-tglb2/igt@gem_ppgtt@blt-vs-render-ctx0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/750">i915#750</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-tglb2/igt@gem_ppgtt@blt-vs-render-ctx0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@sync-unmap-cycles:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-snb2/igt@gem_userptr_blits@sync-unmap-cycles.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/82">i915#82</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-snb7/igt@gem_userptr_blits@sync-unmap-cycles.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_async_flips@alternate-sync-async-flip}:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-kbl3/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2521">i915#2521</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-kbl2/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-tglb5/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2521">i915#2521</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-tglb5/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_async_flips@async-flip-with-page-flip-events}:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-glk3/igt@kms_async_flips@async-flip-with-page-flip-events.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2521">i915#2521</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-glk5/igt@kms_async_flips@async-flip-with-page-flip-events.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-apl7/igt@kms_async_flips@async-flip-with-page-flip-events.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2521">i915#2521</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-apl2/igt@kms_async_flips@async-flip-with-page-flip-events.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_async_flips@test-time-stamp}:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-tglb6/igt@kms_async_flips@test-time-stamp.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2597">i915#2597</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-tglb7/igt@kms_async_flips@test-time-stamp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-b-64x64-left-edge:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-apl3/igt@kms_cursor_edge_walk@pipe-b-64x64-left-edge.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-apl6/igt@kms_cursor_edge_walk@pipe-b-64x64-left-edge.html">PASS</a> +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-glk7/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-glk9/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">PASS</a> +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-kbl4/igt@kms_flip@blocking-wf_vblank@a-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-kbl3/igt@kms_flip@blocking-wf_vblank@a-dp1.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-tglb2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2598">i915#2598</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-tglb2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-kbl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-kbl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-iclb6/igt@kms_psr2_su@page_flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109642">fdo#109642</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111068">fdo#111068</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-iclb2/igt@kms_psr2_su@page_flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_sequence@queue-busy:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-tglb6/igt@kms_sequence@queue-busy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-tglb1/igt@kms_sequence@queue-busy.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-hsw6/igt@kms_sysfs_edid_timing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2">IGT#2</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-hsw1/igt@kms_sysfs_edid_timing.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@disable-primary-vs-flip-pipe-a:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-hsw1/igt@kms_universal_plane@disable-primary-vs-flip-pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-hsw4/igt@kms_universal_plane@disable-primary-vs-flip-pipe-a.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@enable-disable:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-iclb7/igt@perf@enable-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-iclb2/igt@perf@enable-disable.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-hsw8/igt@perf@enable-disable.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-hsw7/igt@perf@enable-disable.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@perf@polling-small-buf:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-glk1/igt@perf@polling-small-buf.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-glk9/igt@perf@polling-small-buf.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-tglb6/igt@perf@polling-small-buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-tglb6/igt@perf@polling-small-buf.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-apl6/igt@perf@polling-small-buf.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-apl8/igt@perf@polling-small-buf.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-kbl1/igt@perf@polling-small-buf.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-kbl4/igt@perf@polling-small-buf.html">PASS</a> +1 similar issue</p>
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-hsw7/igt@core_hotunplug@hotrebind-lateclose.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2644">i915#2644</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-hsw1/igt@core_hotunplug@hotrebind-lateclose.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2283">i915#2283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-iclb8/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-iclb4/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@per-context-mode-unprivileged:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-apl4/igt@perf@per-context-mode-unprivileged.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-apl1/igt@perf@per-context-mode-unprivileged.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-glk6/igt@perf@per-context-mode-unprivileged.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-glk4/igt@perf@per-context-mode-unprivileged.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-kbl1/igt@perf@per-context-mode-unprivileged.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-kbl1/igt@perf@per-context-mode-unprivileged.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@perf@unprivileged-single-ctx-counters:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-iclb5/igt@perf@unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-iclb2/igt@perf@unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9281/shard-tglb3/igt@perf@unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/shard-tglb3/igt@perf@unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (11 -&gt; 8)</h2>
<p>Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5836 -&gt; IGTPW_5140</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9281: f88cfb4c62df91cd9024854d8739c5257e4b6a55 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5140: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5140/index.html<br />
  IGT_5836: 4c2ec0ad123b82f42f9fe2297e1a41fec73c9229 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============0373154881595634085==--

--===============0641900141==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0641900141==--
