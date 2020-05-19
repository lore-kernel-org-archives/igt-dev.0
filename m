Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 19 May 2020 02:27:59 -0000
Message-ID: <158985527952.31236.5021356390138477932@emeril.freedesktop.org>
References: <20200518233240.1540362-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200518233240.1540362-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_Always_pass_device_to_igt=5Fpa?=
 =?utf-8?q?rams=5Fset?=
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,1/2] Always pass device to igt_params_set
URL   : https://patchwork.freedesktop.org/series/77379/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8498_full -> IGTPW_4579_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4579_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4579_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4579/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4579_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_ctx_persistence@clone:
    - shard-kbl:          [PASS][1] -> [FAIL][2] +6 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/shard-kbl1/igt@gem_ctx_persistence@clone.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4579/shard-kbl6/igt@gem_ctx_persistence@clone.html

  * igt@gem_ctx_persistence@engines-hostile:
    - shard-kbl:          NOTRUN -> [FAIL][3] +18 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4579/shard-kbl6/igt@gem_ctx_persistence@engines-hostile.html

  * igt@gem_ctx_persistence@engines-mixed-process:
    - shard-iclb:         NOTRUN -> [FAIL][4] +18 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4579/shard-iclb2/igt@gem_ctx_persistence@engines-mixed-process.html

  * igt@gem_ctx_persistence@file:
    - shard-tglb:         [PASS][5] -> [FAIL][6] +9 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/shard-tglb3/igt@gem_ctx_persistence@file.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4579/shard-tglb3/igt@gem_ctx_persistence@file.html

  * igt@gem_ctx_persistence@hostile:
    - shard-apl:          [PASS][7] -> [FAIL][8] +7 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/shard-apl2/igt@gem_ctx_persistence@hostile.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4579/shard-apl4/igt@gem_ctx_persistence@hostile.html

  * igt@gem_ctx_persistence@legacy-engines-hostile:
    - shard-glk:          NOTRUN -> [FAIL][9] +16 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4579/shard-glk4/igt@gem_ctx_persistence@legacy-engines-hostile.html

  * igt@gem_ctx_persistence@legacy-engines-queued:
    - shard-tglb:         NOTRUN -> [FAIL][10] +18 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4579/shard-tglb6/igt@gem_ctx_persistence@legacy-engines-queued.html

  * igt@gem_ctx_persistence@process:
    - shard-iclb:         [PASS][11] -> [FAIL][12] +8 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/shard-iclb4/igt@gem_ctx_persistence@process.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4579/shard-iclb6/igt@gem_ctx_persistence@process.html

  * igt@gem_ctx_persistence@processes:
    - shard-glk:          [PASS][13] -> [FAIL][14] +7 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/shard-glk9/igt@gem_ctx_persistence@processes.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4579/shard-glk4/igt@gem_ctx_persistence@processes.html

  * igt@gem_ctx_persistence@replace:
    - shard-apl:          NOTRUN -> [FAIL][15] +18 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4579/shard-apl4/igt@gem_ctx_persistence@replace.html

  
#### Warnings ####

  * igt@gem_ctx_persistence@hang:
    - shard-apl:          [SKIP][16] ([fdo#109271]) -> [FAIL][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/shard-apl3/igt@gem_ctx_persistence@hang.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4579/shard-apl8/igt@gem_ctx_persistence@hang.html
    - shard-glk:          [SKIP][18] ([fdo#109271]) -> [FAIL][19]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/shard-glk6/igt@gem_ctx_persistence@hang.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4579/shard-glk1/igt@gem_ctx_persistence@hang.html
    - shard-kbl:          [SKIP][20] ([fdo#109271]) -> [FAIL][21]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/shard-kbl7/igt@gem_ctx_persistence@hang.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4579/shard-kbl1/igt@gem_ctx_persistence@hang.html

  * igt@gem_ctx_persistence@legacy-engines-mixed:
    - shard-snb:          [SKIP][22] ([fdo#109271] / [i915#1099]) -> [FAIL][23] +23 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/shard-snb5/igt@gem_ctx_persistence@legacy-engines-mixed.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4579/shard-snb1/igt@gem_ctx_persistence@legacy-engines-mixed.html

  * igt@gem_ctx_persistence@saturated-hostile:
    - shard-snb:          [SKIP][24] ([fdo#109271]) -> [FAIL][25] +3 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/shard-snb6/igt@gem_ctx_persistence@saturated-hostile.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4579/shard-snb6/igt@gem_ctx_persistence@saturated-hostile.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][26] ([i915#658]) -> [SKIP][27]
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/shard-iclb6/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4579/shard-iclb5/igt@i915_pm_dc@dc3co-vpb-simulation.html

  
Known issues
------------

  Here are the changes found in IGTPW_4579_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@process:
    - shard-kbl:          [PASS][28] -> [FAIL][29] ([i915#93] / [i915#95])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/shard-kbl6/igt@gem_ctx_persistence@process.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4579/shard-kbl1/igt@gem_ctx_persistence@process.html

  * igt@gem_eio@in-flight-suspend:
    - shard-apl:          [PASS][30] -> [DMESG-WARN][31] ([i915#180]) +1 similar issue
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/shard-apl2/igt@gem_eio@in-flight-suspend.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4579/shard-apl6/igt@gem_eio@in-flight-suspend.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [PASS][32] -> [DMESG-WARN][33] ([i915#1436] / [i915#716])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/shard-glk7/igt@gen9_exec_parse@allowed-all.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4579/shard-glk5/igt@gen9_exec_parse@allowed-all.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen:
    - shard-kbl:          [PASS][34] -> [FAIL][35] ([i915#54] / [i915#93] / [i915#95]) +1 similar issue
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4579/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding:
    - shard-apl:          [PASS][36] -> [FAIL][37] ([i915#54])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/shard-apl1/igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4579/shard-apl3/igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding.html

  * igt@kms_cursor_legacy@pipe-d-torture-bo:
    - shard-tglb:         [PASS][38] -> [DMESG-WARN][39] ([i915#128])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/shard-tglb1/igt@kms_cursor_legacy@pipe-d-torture-bo.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4579/shard-tglb6/igt@kms_cursor_legacy@pipe-d-torture-bo.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled:
    - shard-apl:          [PASS][40] -> [FAIL][41] ([i915#52] / [i915#54] / [i915#95]) +1 similar issue
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/shard-apl1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4579/shard-apl1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-render-untiled:
    - shard-kbl:          [PASS][42] -> [FAIL][43] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/shard-kbl7/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4579/shard-kbl6/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:
    - shard-glk:          [PASS][44] -> [FAIL][45] ([i915#49])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4579/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-iclb:         [PASS][46] -> [FAIL][47] ([i915#1757])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/shard-iclb4/igt@kms_panel_fitting@atomic-fastset.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4579/shard-iclb4/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence:
    - shard-apl:          [PASS][48] -> [FAIL][49] ([i915#53] / [i915#95])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/shard-apl3/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4579/shard-apl6/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html
    - shard-kbl:          [PASS][50] -> [FAIL][51] ([i915#53] / [i915#93] / [i915#95])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/shard-kbl7/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4579/shard-kbl1/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-128:
    - shard-apl:          [PASS][52] -> [FAIL][53] ([i915#1559] / [i915#95])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/shard-apl1/igt@kms_plane_cursor@pipe-a-viewport-size-128.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4579/shard-apl2/igt@kms_plane_cursor@pipe-a-viewport-size-128.html
    - shard-kbl:          [PASS][54] -> [FAIL][55] ([i915#1559] / [i915#93] / [i915#95])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/shard-kbl4/igt@kms_plane_cursor@pipe-a-viewport-size-128.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4579/shard-kbl3/igt@kms_plane_cursor@pipe-a-viewport-size-128.html

  * igt@kms_psr@psr2_primary_blt:
    - shard-iclb:         [PASS][56] -> [SKIP][57] ([fdo#109441]) +1 similar issue
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/shard-iclb2/igt@kms_psr@psr2_primary_blt.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4579/shard-iclb5/igt@kms_psr@psr2_primary_blt.html

  * igt@kms_vblank@pipe-c-ts-continuation-suspend:
    - shard-kbl:          [PASS][58] -> [DMESG-WARN][59] ([i915#180])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/shard-kbl3/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4579/shard-kbl2/igt@kms_vblank@pipe-c-ts-continuation-suspend.html

  
#### Possible fixes ####

  * igt@gen9_exec_parse@allowed-all:
    - shard-apl:          [DMESG-WARN][60] ([i915#1436] / [i915#716]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/shard-apl1/igt@gen9_exec_parse@allowed-all.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4579/shard-apl7/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-tglb:         [SKIP][62] -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/shard-tglb8/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4579/shard-tglb8/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_color@pipe-c-degamma:
    - shard-apl:          [FAIL][64] ([i915#71]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/shard-apl2/igt@kms_color@pipe-c-degamma.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4579/shard-apl8/igt@kms_color@pipe-c-degamma.html
    - shard-glk:          [FAIL][66] ([i915#71]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/shard-glk1/igt@kms_color@pipe-c-degamma.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4579/shard-glk4/igt@kms_color@pipe-c-degamma.html
    - shard-kbl:          [FAIL][68] ([i915#71]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/shard-kbl3/igt@kms_color@pipe-c-degamma.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4579/shard-kbl3/igt@kms_color@pipe-c-degamma.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - shard-kbl:          [FAIL][70] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4579/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][72] ([i915#180]) -> [PASS][73] +4 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4579/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-tglb:         [FAIL][74] ([i915#1121]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/shard-tglb2/igt@kms_fbcon_fbt@psr-suspend.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4579/shard-tglb7/igt@kms_fbcon_fbt@psr-suspend.html

  * {igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1}:
    - shard-glk:          [FAIL][76] ([i915#79]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/shard-glk9/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4579/shard-glk7/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1.html

  * {igt@kms_flip@flip-vs-suspend-interruptible@c-dp1}:
    - shard-apl:          [DMESG-WARN][78] ([i915#180]) -> [PASS][79] +2 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4579/shard-apl3/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-64:
    - shard-apl:          [FAIL][80] ([i915#1559] / [i915#95]) -> [PASS][81] +1 similar issue
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/shard-apl3/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4579/shard-apl8/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
    - shard-kbl:          [FAIL][82] ([i915#1559] / [i915#93] / [i915#95]) -> [PASS][83] +1 similar issue
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/shard-kbl7/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4579/shard-kbl3/igt@kms_plane_cursor@pipe-a-overlay-size-64.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [FAIL][84] ([i915#173]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/shard-iclb1/igt@kms_psr@no_drrs.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4579/shard-iclb4/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-iclb:         [SKIP][86] ([fdo#109441]) -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/shard-iclb3/igt@kms_psr@psr2_cursor_plane_move.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4579/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][88] ([i915#31]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/shard-apl3/igt@kms_setmode@basic.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4579/shard-apl3/igt@kms_setmode@basic.html

  * {igt@perf@polling-parameterized}:
    - shard-tglb:         [FAIL][90] ([i915#1542]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/shard-tglb1/igt@perf@polling-parameterized.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4579/shard-tglb3/igt@perf@polling-parameterized.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [FAIL][92] ([i915#454]) -> [SKIP][93] ([i915#468])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/shard-tglb3/igt@i915_pm_dc@dc6-dpms.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4579/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [SKIP][94] ([i915#468]) -> [FAIL][95] ([i915#454])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/shard-tglb2/igt@i915_pm_dc@dc6-psr.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4579/shard-tglb3/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_content_protection@atomic:
    - shard-apl:          [DMESG-FAIL][96] ([fdo#110321]) -> [TIMEOUT][97] ([i915#1319])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/shard-apl7/igt@kms_content_protection@atomic.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4579/shard-apl1/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          [TIMEOUT][98] ([i915#1319]) -> [FAIL][99] ([fdo#110321] / [fdo#110336])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/shard-apl1/igt@kms_content_protection@atomic-dpms.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4579/shard-apl3/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@lic:
    - shard-kbl:          [FAIL][100] ([fdo#110321]) -> [TIMEOUT][101] ([i915#1319])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/shard-kbl3/igt@kms_content_protection@lic.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4579/shard-kbl1/igt@kms_content_protection@lic.html

  * igt@kms_content_protection@srm:
    - shard-apl:          [TIMEOUT][102] ([i915#1319]) -> [FAIL][103] ([fdo#110321])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/shard-apl8/igt@kms_content_protection@srm.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4579/shard-apl8/igt@kms_content_protection@srm.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#1121]: https://gitlab.freedesktop.org/drm/intel/issues/1121
  [i915#128]: https://gitlab.freedesktop.org/drm/intel/issues/128
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#1757]: https://gitlab.freedesktop.org/drm/intel/issues/1757
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#53]: https://gitlab.freedesktop.org/drm/intel/issues/53
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#71]: https://gitlab.freedesktop.org/drm/intel/issues/71
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5659 -> IGTPW_4579
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8498: 1493c649ae92207a758afa50a639275bd6c80e2e @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4579: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4579/index.html
  IGT_5659: 66ab5e42811fee3dea8c21ab29e70e323a0650de @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4579/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
