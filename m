Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 11 Jun 2020 16:09:02 -0000
Message-ID: <159189174276.22714.4749920295912565820@emeril.freedesktop.org>
References: <20200611120511.1036732-1-arkadiusz.hiler@intel.com>
In-Reply-To: <20200611120511.1036732-1-arkadiusz.hiler@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdG9vbHMv?=
 =?utf-8?b?aW50ZWxfZ3B1X3RvcDogRml4IF9vcGVuX3BtdSgp?=
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
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tools/intel_gpu_top: Fix _open_pmu()
URL   : https://patchwork.freedesktop.org/series/78222/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8616_full -> IGTPW_4667_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4667_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4667_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4667/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4667_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_endless@dispatch@rcs0:
    - shard-tglb:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-tglb7/igt@gem_exec_endless@dispatch@rcs0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4667/shard-tglb7/igt@gem_exec_endless@dispatch@rcs0.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-tglb:         [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-tglb6/igt@kms_psr@psr2_cursor_render.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4667/shard-tglb7/igt@kms_psr@psr2_cursor_render.html

  
Known issues
------------

  Here are the changes found in IGTPW_4667_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@preservation-s3@bcs0:
    - shard-kbl:          [PASS][5] -> [DMESG-WARN][6] ([i915#180]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-kbl4/igt@gem_ctx_isolation@preservation-s3@bcs0.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4667/shard-kbl1/igt@gem_ctx_isolation@preservation-s3@bcs0.html

  * igt@gem_exec_reloc@basic-cpu-wc-noreloc:
    - shard-snb:          [PASS][7] -> [TIMEOUT][8] ([i915#1958]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-snb1/igt@gem_exec_reloc@basic-cpu-wc-noreloc.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4667/shard-snb5/igt@gem_exec_reloc@basic-cpu-wc-noreloc.html

  * igt@i915_module_load@reload:
    - shard-tglb:         [PASS][9] -> [DMESG-WARN][10] ([i915#402]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-tglb7/igt@i915_module_load@reload.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4667/shard-tglb7/igt@i915_module_load@reload.html
    - shard-glk:          [PASS][11] -> [TIMEOUT][12] ([i915#1418] / [i915#1958])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-glk4/igt@i915_module_load@reload.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4667/shard-glk2/igt@i915_module_load@reload.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-tglb:         [PASS][13] -> [SKIP][14] ([i915#1904])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-tglb1/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4667/shard-tglb7/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_color@pipe-a-ctm-negative:
    - shard-glk:          [PASS][15] -> [TIMEOUT][16] ([i915#1958]) +2 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-glk9/igt@kms_color@pipe-a-ctm-negative.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4667/shard-glk6/igt@kms_color@pipe-a-ctm-negative.html

  * igt@kms_color@pipe-c-ctm-0-25:
    - shard-apl:          [PASS][17] -> [DMESG-WARN][18] ([i915#95]) +49 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-apl1/igt@kms_color@pipe-c-ctm-0-25.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4667/shard-apl7/igt@kms_color@pipe-c-ctm-0-25.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-random:
    - shard-kbl:          [PASS][19] -> [DMESG-FAIL][20] ([i915#54] / [i915#95]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4667/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [PASS][21] -> [DMESG-WARN][22] ([i915#180] / [i915#93] / [i915#95])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4667/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-c-cursor-256x256-onscreen:
    - shard-kbl:          [PASS][23] -> [FAIL][24] ([i915#54])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-256x256-onscreen.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4667/shard-kbl6/igt@kms_cursor_crc@pipe-c-cursor-256x256-onscreen.html
    - shard-apl:          [PASS][25] -> [FAIL][26] ([i915#54])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-apl1/igt@kms_cursor_crc@pipe-c-cursor-256x256-onscreen.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4667/shard-apl2/igt@kms_cursor_crc@pipe-c-cursor-256x256-onscreen.html
    - shard-glk:          [PASS][27] -> [FAIL][28] ([i915#54])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-glk7/igt@kms_cursor_crc@pipe-c-cursor-256x256-onscreen.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4667/shard-glk4/igt@kms_cursor_crc@pipe-c-cursor-256x256-onscreen.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled:
    - shard-apl:          [PASS][29] -> [DMESG-WARN][30] ([i915#1982]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-apl4/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4667/shard-apl3/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:
    - shard-apl:          [PASS][31] -> [DMESG-WARN][32] ([i915#180]) +2 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-apl2/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4667/shard-apl6/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc:
    - shard-iclb:         [PASS][33] -> [DMESG-WARN][34] ([i915#1982])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-iclb1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4667/shard-iclb2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-shrfb-fliptrack:
    - shard-tglb:         [PASS][35] -> [DMESG-WARN][36] ([i915#1982]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-1p-shrfb-fliptrack.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4667/shard-tglb6/igt@kms_frontbuffer_tracking@fbc-1p-shrfb-fliptrack.html

  * igt@kms_psr@psr2_sprite_blt:
    - shard-iclb:         [PASS][37] -> [SKIP][38] ([fdo#109441]) +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-iclb2/igt@kms_psr@psr2_sprite_blt.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4667/shard-iclb5/igt@kms_psr@psr2_sprite_blt.html

  * igt@kms_vblank@pipe-a-query-forked:
    - shard-kbl:          [PASS][39] -> [DMESG-WARN][40] ([i915#93] / [i915#95]) +52 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-kbl4/igt@kms_vblank@pipe-a-query-forked.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4667/shard-kbl4/igt@kms_vblank@pipe-a-query-forked.html

  * igt@perf@blocking-parameterized:
    - shard-hsw:          [PASS][41] -> [FAIL][42] ([i915#1542])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-hsw2/igt@perf@blocking-parameterized.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4667/shard-hsw6/igt@perf@blocking-parameterized.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-hsw:          [PASS][43] -> [SKIP][44] ([fdo#109271])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-hsw4/igt@perf@per-context-mode-unprivileged.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4667/shard-hsw2/igt@perf@per-context-mode-unprivileged.html

  * igt@syncobj_wait@invalid-signal-illegal-handle:
    - shard-hsw:          [PASS][45] -> [TIMEOUT][46] ([i915#1958]) +2 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-hsw1/igt@syncobj_wait@invalid-signal-illegal-handle.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4667/shard-hsw6/igt@syncobj_wait@invalid-signal-illegal-handle.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@preservation-s3@vcs0:
    - shard-kbl:          [DMESG-WARN][47] ([i915#180]) -> [PASS][48] +2 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-kbl4/igt@gem_ctx_isolation@preservation-s3@vcs0.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4667/shard-kbl1/igt@gem_ctx_isolation@preservation-s3@vcs0.html

  * igt@gem_ctx_shared@disjoint-timelines:
    - shard-kbl:          [DMESG-WARN][49] ([i915#93] / [i915#95]) -> [PASS][50] +48 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-kbl4/igt@gem_ctx_shared@disjoint-timelines.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4667/shard-kbl6/igt@gem_ctx_shared@disjoint-timelines.html

  * igt@gem_ctx_shared@q-smoketest@bcs0:
    - shard-tglb:         [INCOMPLETE][51] ([i915#1889]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-tglb8/igt@gem_ctx_shared@q-smoketest@bcs0.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4667/shard-tglb1/igt@gem_ctx_shared@q-smoketest@bcs0.html

  * igt@gem_exec_schedule@implicit-read-write@rcs0:
    - shard-snb:          [INCOMPLETE][53] ([i915#82]) -> [PASS][54] +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-snb1/igt@gem_exec_schedule@implicit-read-write@rcs0.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4667/shard-snb4/igt@gem_exec_schedule@implicit-read-write@rcs0.html

  * igt@gem_exec_whisper@basic-fds-priority:
    - shard-glk:          [DMESG-WARN][55] ([i915#118] / [i915#95]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-glk9/igt@gem_exec_whisper@basic-fds-priority.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4667/shard-glk5/igt@gem_exec_whisper@basic-fds-priority.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [DMESG-WARN][57] ([i915#1436] / [i915#716]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-glk9/igt@gen9_exec_parse@allowed-all.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4667/shard-glk1/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][59] ([i915#1899]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-iclb3/igt@i915_pm_dc@dc6-psr.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4667/shard-iclb8/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_addfb_basic@bad-pitch-32:
    - shard-hsw:          [TIMEOUT][61] ([i915#1958]) -> [PASS][62] +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-hsw2/igt@kms_addfb_basic@bad-pitch-32.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4667/shard-hsw6/igt@kms_addfb_basic@bad-pitch-32.html
    - shard-snb:          [TIMEOUT][63] ([i915#1958]) -> [PASS][64] +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-snb1/igt@kms_addfb_basic@bad-pitch-32.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4667/shard-snb5/igt@kms_addfb_basic@bad-pitch-32.html

  * igt@kms_atomic@atomic-invalid-params:
    - shard-apl:          [DMESG-WARN][65] ([i915#95]) -> [PASS][66] +38 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-apl4/igt@kms_atomic@atomic-invalid-params.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4667/shard-apl8/igt@kms_atomic@atomic-invalid-params.html

  * igt@kms_big_fb@linear-8bpp-rotate-180:
    - shard-apl:          [DMESG-WARN][67] ([i915#1982]) -> [PASS][68] +2 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-apl7/igt@kms_big_fb@linear-8bpp-rotate-180.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4667/shard-apl2/igt@kms_big_fb@linear-8bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-glk:          [DMESG-FAIL][69] ([i915#118] / [i915#95]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-glk8/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4667/shard-glk5/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen:
    - shard-kbl:          [DMESG-FAIL][71] ([i915#54] / [i915#95]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4667/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html

  * igt@kms_cursor_legacy@all-pipes-torture-move:
    - shard-hsw:          [DMESG-WARN][73] ([i915#128]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-hsw4/igt@kms_cursor_legacy@all-pipes-torture-move.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4667/shard-hsw1/igt@kms_cursor_legacy@all-pipes-torture-move.html

  * igt@kms_flip@flip-vs-suspend@b-dp1:
    - shard-apl:          [DMESG-WARN][75] ([i915#180]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-apl1/igt@kms_flip@flip-vs-suspend@b-dp1.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4667/shard-apl7/igt@kms_flip@flip-vs-suspend@b-dp1.html

  * igt@kms_flip_tiling@flip-changes-tiling-yf:
    - shard-kbl:          [DMESG-FAIL][77] ([i915#95]) -> [PASS][78] +1 similar issue
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-kbl6/igt@kms_flip_tiling@flip-changes-tiling-yf.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4667/shard-kbl7/igt@kms_flip_tiling@flip-changes-tiling-yf.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [SKIP][79] ([i915#433]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-tglb2/igt@kms_hdmi_inject@inject-audio.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4667/shard-tglb7/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-64:
    - shard-apl:          [DMESG-FAIL][81] ([i915#95]) -> [PASS][82] +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-apl1/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4667/shard-apl8/igt@kms_plane_cursor@pipe-a-viewport-size-64.html

  * igt@kms_plane_scaling@pipe-b-scaler-with-clipping-clamping:
    - shard-iclb:         [DMESG-WARN][83] ([i915#1982]) -> [PASS][84] +1 similar issue
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-iclb3/igt@kms_plane_scaling@pipe-b-scaler-with-clipping-clamping.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4667/shard-iclb2/igt@kms_plane_scaling@pipe-b-scaler-with-clipping-clamping.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-tglb:         [SKIP][85] ([i915#1911]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-tglb3/igt@kms_psr2_su@frontbuffer.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4667/shard-tglb7/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [SKIP][87] ([fdo#109642] / [fdo#111068]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-iclb1/igt@kms_psr2_su@page_flip.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4667/shard-iclb2/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_primary_mmap_gtt:
    - shard-iclb:         [SKIP][89] ([fdo#109441]) -> [PASS][90] +1 similar issue
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-iclb1/igt@kms_psr@psr2_primary_mmap_gtt.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4667/shard-iclb2/igt@kms_psr@psr2_primary_mmap_gtt.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][91] ([i915#31]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-apl2/igt@kms_setmode@basic.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4667/shard-apl8/igt@kms_setmode@basic.html

  * igt@perf_pmu@other-init-3:
    - shard-tglb:         [DMESG-WARN][93] ([i915#402]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-tglb6/igt@perf_pmu@other-init-3.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4667/shard-tglb3/igt@perf_pmu@other-init-3.html

  
#### Warnings ####

  * igt@gem_eio@in-flight-suspend:
    - shard-apl:          [DMESG-WARN][95] ([i915#95]) -> [DMESG-WARN][96] ([i915#180])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-apl1/igt@gem_eio@in-flight-suspend.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4667/shard-apl1/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_reloc@basic-concurrent16:
    - shard-glk:          [INCOMPLETE][97] ([i915#1958] / [i915#58] / [k.org#198133]) -> [TIMEOUT][98] ([i915#1958])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-glk1/igt@gem_exec_reloc@basic-concurrent16.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4667/shard-glk6/igt@gem_exec_reloc@basic-concurrent16.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [FAIL][99] ([i915#1899]) -> [FAIL][100] ([i915#454])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-tglb6/igt@i915_pm_dc@dc6-psr.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4667/shard-tglb5/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_suspend@forcewake:
    - shard-kbl:          [DMESG-WARN][101] ([i915#93] / [i915#95]) -> [DMESG-WARN][102] ([i915#180])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-kbl2/igt@i915_suspend@forcewake.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4667/shard-kbl6/igt@i915_suspend@forcewake.html

  * igt@kms_busy@basic-flip-pipe-d:
    - shard-hsw:          [TIMEOUT][103] ([i915#1958]) -> [SKIP][104] ([fdo#109271]) +1 similar issue
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-hsw2/igt@kms_busy@basic-flip-pipe-d.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4667/shard-hsw2/igt@kms_busy@basic-flip-pipe-d.html

  * igt@kms_content_protection@atomic:
    - shard-apl:          [TIMEOUT][105] ([i915#1319]) -> [FAIL][106] ([fdo#110321] / [fdo#110336])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-apl1/igt@kms_content_protection@atomic.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4667/shard-apl1/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          [TIMEOUT][107] ([i915#1319] / [i915#1635]) -> [FAIL][108] ([fdo#110321] / [fdo#110336])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-apl3/igt@kms_content_protection@atomic-dpms.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4667/shard-apl6/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@srm:
    - shard-kbl:          [DMESG-FAIL][109] ([fdo#110321] / [i915#95]) -> [TIMEOUT][110] ([i915#1319])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-kbl2/igt@kms_content_protection@srm.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4667/shard-kbl6/igt@kms_content_protection@srm.html
    - shard-apl:          [TIMEOUT][111] ([i915#1319]) -> [DMESG-FAIL][112] ([fdo#110321] / [i915#95])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-apl7/igt@kms_content_protection@srm.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4667/shard-apl6/igt@kms_content_protection@srm.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-ytiled:
    - shard-hsw:          [SKIP][113] ([fdo#109271]) -> [TIMEOUT][114] ([i915#1958]) +1 similar issue
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-hsw8/igt@kms_draw_crc@draw-method-xrgb2101010-blt-ytiled.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4667/shard-hsw6/igt@kms_draw_crc@draw-method-xrgb2101010-blt-ytiled.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-apl:          [DMESG-WARN][115] ([i915#95]) -> [DMESG-WARN][116] ([i915#180] / [i915#95])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-apl1/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4667/shard-apl4/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_plane_alpha_blend@pipe-d-alpha-transparent-fb:
    - shard-snb:          [TIMEOUT][117] ([i915#1958]) -> [SKIP][118] ([fdo#109271]) +3 similar issues
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-snb1/igt@kms_plane_alpha_blend@pipe-d-alpha-transparent-fb.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4667/shard-snb6/igt@kms_plane_alpha_blend@pipe-d-alpha-transparent-fb.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-snb:          [SKIP][119] ([fdo#109271]) -> [TIMEOUT][120] ([i915#1958]) +3 similar issues
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-snb2/igt@kms_psr@psr2_primary_page_flip.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4667/shard-snb5/igt@kms_psr@psr2_primary_page_flip.html
    - shard-glk:          [SKIP][121] ([fdo#109271]) -> [TIMEOUT][122] ([i915#1958])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-glk7/igt@kms_psr@psr2_primary_page_flip.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4667/shard-glk6/igt@kms_psr@psr2_primary_page_flip.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-iclb:         [SKIP][123] ([fdo#109289]) -> [SKIP][124] ([i915#405])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-iclb8/igt@perf@per-context-mode-unprivileged.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4667/shard-iclb4/igt@perf@per-context-mode-unprivileged.html
    - shard-tglb:         [SKIP][125] ([fdo#109289]) -> [SKIP][126] ([i915#405])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-tglb1/igt@perf@per-context-mode-unprivileged.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4667/shard-tglb3/igt@perf@per-context-mode-unprivileged.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#128]: https://gitlab.freedesktop.org/drm/intel/issues/128
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1418]: https://gitlab.freedesktop.org/drm/intel/issues/1418
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1889]: https://gitlab.freedesktop.org/drm/intel/issues/1889
  [i915#1899]: https://gitlab.freedesktop.org/drm/intel/issues/1899
  [i915#1904]: https://gitlab.freedesktop.org/drm/intel/issues/1904
  [i915#1911]: https://gitlab.freedesktop.org/drm/intel/issues/1911
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#405]: https://gitlab.freedesktop.org/drm/intel/issues/405
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5702 -> IGTPW_4667
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8616: 461ce57da4f8793e59534c8c1f57f8a87f40dfbe @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4667: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4667/index.html
  IGT_5702: d16ad07e7f2a028e14d61f570931c87fa5ce404c @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4667/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
