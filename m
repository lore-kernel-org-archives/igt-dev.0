Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 22 Jun 2020 18:09:06 -0000
Message-ID: <159284934675.9208.16466864596177460829@emeril.freedesktop.org>
References: <20200622164415.30352-1-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20200622164415.30352-1-janusz.krzysztofik@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?core=5Fhotunplug=3A_New_subtests_and_enhancements_=28rev2=29?=
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

Series: tests/core_hotunplug: New subtests and enhancements (rev2)
URL   : https://patchwork.freedesktop.org/series/78698/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8651_full -> IGTPW_4687_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4687_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4687_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4687/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4687_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@2x-blocking-absolute-wf_vblank@ab-vga1-hdmi-a1:
    - shard-hsw:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-hsw2/igt@kms_flip@2x-blocking-absolute-wf_vblank@ab-vga1-hdmi-a1.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4687/shard-hsw2/igt@kms_flip@2x-blocking-absolute-wf_vblank@ab-vga1-hdmi-a1.html

  
#### Warnings ####

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-gtt:
    - shard-hsw:          [SKIP][3] ([fdo#109271]) -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-hsw8/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-gtt.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4687/shard-hsw2/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-gtt.html

  
Known issues
------------

  Here are the changes found in IGTPW_4687_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@close-race:
    - shard-snb:          [PASS][5] -> [TIMEOUT][6] ([i915#1958]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-snb6/igt@gem_busy@close-race.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4687/shard-snb5/igt@gem_busy@close-race.html

  * igt@gem_exec_flush@basic-wb-pro-default:
    - shard-apl:          [PASS][7] -> [DMESG-WARN][8] ([i915#1635] / [i915#95]) +29 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-apl1/igt@gem_exec_flush@basic-wb-pro-default.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4687/shard-apl1/igt@gem_exec_flush@basic-wb-pro-default.html

  * igt@gem_exec_reloc@basic-concurrent0:
    - shard-glk:          [PASS][9] -> [FAIL][10] ([i915#1930])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-glk8/igt@gem_exec_reloc@basic-concurrent0.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4687/shard-glk2/igt@gem_exec_reloc@basic-concurrent0.html

  * igt@gem_exec_whisper@basic-queues-priority-all:
    - shard-glk:          [PASS][11] -> [DMESG-WARN][12] ([i915#118] / [i915#95])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-glk9/igt@gem_exec_whisper@basic-queues-priority-all.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4687/shard-glk2/igt@gem_exec_whisper@basic-queues-priority-all.html

  * igt@gem_shrink@reclaim:
    - shard-hsw:          [PASS][13] -> [SKIP][14] ([fdo#109271])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-hsw4/igt@gem_shrink@reclaim.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4687/shard-hsw1/igt@gem_shrink@reclaim.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-apl:          [PASS][15] -> [DMESG-WARN][16] ([i915#1436] / [i915#716])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-apl3/igt@gen9_exec_parse@allowed-all.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4687/shard-apl3/igt@gen9_exec_parse@allowed-all.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-snb:          [PASS][17] -> [SKIP][18] ([fdo#109271])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-snb6/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4687/shard-snb1/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen:
    - shard-kbl:          [PASS][19] -> [DMESG-FAIL][20] ([i915#54] / [i915#95])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4687/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [PASS][21] -> [DMESG-WARN][22] ([i915#180] / [i915#93] / [i915#95])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4687/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-tglb:         [PASS][23] -> [FAIL][24] ([IGT#5])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-tglb2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4687/shard-tglb6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1:
    - shard-glk:          [PASS][25] -> [FAIL][26] ([i915#79])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-glk6/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4687/shard-glk1/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend@c-dp1:
    - shard-kbl:          [PASS][27] -> [DMESG-WARN][28] ([i915#180]) +3 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-kbl1/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4687/shard-kbl6/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_flip@wf_vblank-ts-check@a-dp1:
    - shard-kbl:          [PASS][29] -> [DMESG-WARN][30] ([i915#1982])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-kbl6/igt@kms_flip@wf_vblank-ts-check@a-dp1.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4687/shard-kbl6/igt@kms_flip@wf_vblank-ts-check@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-gtt:
    - shard-iclb:         [PASS][31] -> [INCOMPLETE][32] ([i915#123])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-iclb3/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-gtt.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4687/shard-iclb3/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt:
    - shard-tglb:         [PASS][33] -> [DMESG-WARN][34] ([i915#402]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4687/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-hsw:          [PASS][35] -> [TIMEOUT][36] ([i915#1958]) +2 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-hsw4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4687/shard-hsw2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min:
    - shard-kbl:          [PASS][37] -> [DMESG-FAIL][38] ([fdo#108145] / [i915#95])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4687/shard-kbl7/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
    - shard-apl:          [PASS][39] -> [DMESG-FAIL][40] ([fdo#108145] / [i915#1635] / [i915#95])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4687/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-64:
    - shard-apl:          [PASS][41] -> [DMESG-FAIL][42] ([i915#1635] / [i915#95])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-apl2/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4687/shard-apl6/igt@kms_plane_cursor@pipe-a-overlay-size-64.html

  * igt@kms_plane_cursor@pipe-c-overlay-size-64:
    - shard-iclb:         [PASS][43] -> [TIMEOUT][44] ([i915#1958]) +2 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-iclb4/igt@kms_plane_cursor@pipe-c-overlay-size-64.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4687/shard-iclb3/igt@kms_plane_cursor@pipe-c-overlay-size-64.html
    - shard-glk:          [PASS][45] -> [TIMEOUT][46] ([i915#1958]) +2 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-glk6/igt@kms_plane_cursor@pipe-c-overlay-size-64.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4687/shard-glk6/igt@kms_plane_cursor@pipe-c-overlay-size-64.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [PASS][47] -> [SKIP][48] ([fdo#109642] / [fdo#111068])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-iclb2/igt@kms_psr2_su@page_flip.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4687/shard-iclb6/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][49] -> [SKIP][50] ([fdo#109441]) +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4687/shard-iclb8/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_vblank@pipe-a-query-forked-hang:
    - shard-kbl:          [PASS][51] -> [DMESG-WARN][52] ([i915#93] / [i915#95]) +52 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-kbl1/igt@kms_vblank@pipe-a-query-forked-hang.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4687/shard-kbl3/igt@kms_vblank@pipe-a-query-forked-hang.html

  * igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend:
    - shard-apl:          [PASS][53] -> [INCOMPLETE][54] ([i915#1635])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-apl2/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4687/shard-apl7/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html

  * igt@kms_vblank@pipe-b-wait-busy:
    - shard-apl:          [PASS][55] -> [DMESG-WARN][56] ([i915#1982]) +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-apl8/igt@kms_vblank@pipe-b-wait-busy.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4687/shard-apl6/igt@kms_vblank@pipe-b-wait-busy.html

  
#### Possible fixes ####

  * igt@drm_read@invalid-buffer:
    - shard-tglb:         [DMESG-WARN][57] ([i915#402]) -> [PASS][58] +2 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-tglb3/igt@drm_read@invalid-buffer.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4687/shard-tglb7/igt@drm_read@invalid-buffer.html

  * igt@gem_exec_whisper@basic-fds-priority:
    - shard-glk:          [DMESG-WARN][59] ([i915#118] / [i915#95]) -> [PASS][60] +3 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-glk6/igt@gem_exec_whisper@basic-fds-priority.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4687/shard-glk7/igt@gem_exec_whisper@basic-fds-priority.html

  * igt@gem_mmap_wc@read-write-distinct:
    - shard-hsw:          [TIMEOUT][61] ([i915#1958]) -> [PASS][62] +3 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-hsw4/igt@gem_mmap_wc@read-write-distinct.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4687/shard-hsw6/igt@gem_mmap_wc@read-write-distinct.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][63] ([i915#454]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-iclb1/igt@i915_pm_dc@dc6-psr.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4687/shard-iclb1/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-apl:          [DMESG-WARN][65] ([i915#1982]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-apl7/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4687/shard-apl1/igt@kms_big_fb@linear-64bpp-rotate-180.html
    - shard-glk:          [DMESG-FAIL][67] ([i915#118] / [i915#95]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-glk8/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4687/shard-glk7/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-random:
    - shard-kbl:          [DMESG-FAIL][69] ([i915#54] / [i915#95]) -> [PASS][70] +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4687/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html

  * igt@kms_cursor_edge_walk@pipe-b-128x128-bottom-edge:
    - shard-glk:          [DMESG-WARN][71] ([i915#1982]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-glk2/igt@kms_cursor_edge_walk@pipe-b-128x128-bottom-edge.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4687/shard-glk8/igt@kms_cursor_edge_walk@pipe-b-128x128-bottom-edge.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled:
    - shard-apl:          [DMESG-FAIL][73] ([i915#1635] / [i915#54] / [i915#95]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-apl2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4687/shard-apl7/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html

  * igt@kms_flip@2x-nonexisting-fb-interruptible@ab-vga1-hdmi-a1:
    - shard-hsw:          [DMESG-WARN][75] ([i915#1982]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-hsw6/igt@kms_flip@2x-nonexisting-fb-interruptible@ab-vga1-hdmi-a1.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4687/shard-hsw4/igt@kms_flip@2x-nonexisting-fb-interruptible@ab-vga1-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-pwrite:
    - shard-snb:          [SKIP][77] ([fdo#109271]) -> [PASS][78] +1 similar issue
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-snb1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-pwrite.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4687/shard-snb4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-pwrite.html

  * igt@kms_plane@plane-position-covered-pipe-c-planes:
    - shard-apl:          [FAIL][79] ([i915#247]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-apl7/igt@kms_plane@plane-position-covered-pipe-c-planes.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4687/shard-apl4/igt@kms_plane@plane-position-covered-pipe-c-planes.html
    - shard-kbl:          [FAIL][81] ([i915#247]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-kbl6/igt@kms_plane@plane-position-covered-pipe-c-planes.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4687/shard-kbl7/igt@kms_plane@plane-position-covered-pipe-c-planes.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-64:
    - shard-kbl:          [DMESG-FAIL][83] ([i915#95]) -> [PASS][84] +2 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-kbl7/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4687/shard-kbl1/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
    - shard-apl:          [DMESG-FAIL][85] ([i915#1635] / [i915#95]) -> [PASS][86] +2 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-apl4/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4687/shard-apl4/igt@kms_plane_cursor@pipe-a-viewport-size-64.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [SKIP][87] ([fdo#109642] / [fdo#111068]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-iclb4/igt@kms_psr2_su@frontbuffer.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4687/shard-iclb2/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [SKIP][89] ([fdo#109441]) -> [PASS][90] +2 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-iclb8/igt@kms_psr@psr2_no_drrs.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4687/shard-iclb2/igt@kms_psr@psr2_no_drrs.html

  * igt@kms_vblank@pipe-a-query-forked:
    - shard-kbl:          [DMESG-WARN][91] ([i915#93] / [i915#95]) -> [PASS][92] +47 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-kbl1/igt@kms_vblank@pipe-a-query-forked.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4687/shard-kbl7/igt@kms_vblank@pipe-a-query-forked.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [DMESG-WARN][93] ([i915#180]) -> [PASS][94] +6 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-kbl6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4687/shard-kbl3/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@perf@invalid-oa-metric-set-id:
    - shard-apl:          [DMESG-WARN][95] ([i915#1635] / [i915#95]) -> [PASS][96] +31 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-apl3/igt@perf@invalid-oa-metric-set-id.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4687/shard-apl8/igt@perf@invalid-oa-metric-set-id.html

  * igt@syncobj_wait@invalid-multi-wait-all-unsubmitted-signaled:
    - shard-snb:          [TIMEOUT][97] ([i915#1958]) -> [PASS][98] +2 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-snb6/igt@syncobj_wait@invalid-multi-wait-all-unsubmitted-signaled.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4687/shard-snb1/igt@syncobj_wait@invalid-multi-wait-all-unsubmitted-signaled.html

  
#### Warnings ####

  * igt@gem_exec_reloc@basic-concurrent16:
    - shard-iclb:         [INCOMPLETE][99] ([i915#1958]) -> [TIMEOUT][100] ([i915#1958])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-iclb8/igt@gem_exec_reloc@basic-concurrent16.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4687/shard-iclb3/igt@gem_exec_reloc@basic-concurrent16.html
    - shard-glk:          [INCOMPLETE][101] ([i915#1958] / [i915#58] / [k.org#198133]) -> [TIMEOUT][102] ([i915#1958])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-glk7/igt@gem_exec_reloc@basic-concurrent16.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4687/shard-glk6/igt@gem_exec_reloc@basic-concurrent16.html

  * igt@gem_userptr_blits@process-exit-mmap@gtt:
    - shard-apl:          [SKIP][103] ([fdo#109271] / [i915#1635] / [i915#1699]) -> [SKIP][104] ([fdo#109271] / [i915#1699])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-apl6/igt@gem_userptr_blits@process-exit-mmap@gtt.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4687/shard-apl3/igt@gem_userptr_blits@process-exit-mmap@gtt.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][105] ([i915#588]) -> [SKIP][106] ([i915#658])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4687/shard-iclb3/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [SKIP][107] ([i915#468]) -> [FAIL][108] ([i915#454])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-tglb2/igt@i915_pm_dc@dc6-psr.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4687/shard-tglb7/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
    - shard-apl:          [SKIP][109] ([fdo#109271] / [i915#1937]) -> [SKIP][110] ([fdo#109271] / [i915#1635] / [i915#1937])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-apl8/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4687/shard-apl4/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html

  * igt@kms_chamelium@dp-edid-read:
    - shard-apl:          [SKIP][111] ([fdo#109271] / [fdo#111827] / [i915#1635]) -> [SKIP][112] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-apl3/igt@kms_chamelium@dp-edid-read.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4687/shard-apl2/igt@kms_chamelium@dp-edid-read.html

  * igt@kms_color_chamelium@pipe-c-gamma:
    - shard-apl:          [SKIP][113] ([fdo#109271] / [fdo#111827]) -> [SKIP][114] ([fdo#109271] / [fdo#111827] / [i915#1635])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-apl2/igt@kms_color_chamelium@pipe-c-gamma.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4687/shard-apl6/igt@kms_color_chamelium@pipe-c-gamma.html

  * igt@kms_cursor_edge_walk@pipe-d-128x128-left-edge:
    - shard-apl:          [SKIP][115] ([fdo#109271]) -> [SKIP][116] ([fdo#109271] / [i915#1635]) +23 similar issues
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-apl3/igt@kms_cursor_edge_walk@pipe-d-128x128-left-edge.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4687/shard-apl1/igt@kms_cursor_edge_walk@pipe-d-128x128-left-edge.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-gtt:
    - shard-snb:          [SKIP][117] ([fdo#109271]) -> [TIMEOUT][118] ([i915#1958]) +1 similar issue
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-snb6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-gtt.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4687/shard-snb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-gtt.html
    - shard-glk:          [SKIP][119] ([fdo#109271]) -> [INCOMPLETE][120] ([i915#58] / [k.org#198133])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-glk1/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-gtt.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4687/shard-glk6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt:
    - shard-snb:          [SKIP][121] ([fdo#109271]) -> [INCOMPLETE][122] ([i915#82])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-snb6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4687/shard-snb5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:
    - shard-apl:          [DMESG-FAIL][123] ([i915#1635] / [i915#95]) -> [FAIL][124] ([i915#265])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4687/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:
    - shard-kbl:          [DMESG-FAIL][125] ([i915#95]) -> [FAIL][126] ([i915#265])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-kbl1/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4687/shard-kbl4/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html

  * igt@kms_plane_cursor@pipe-c-viewport-size-256:
    - shard-snb:          [TIMEOUT][127] ([i915#1958]) -> [SKIP][128] ([fdo#109271])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-snb6/igt@kms_plane_cursor@pipe-c-viewport-size-256.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4687/shard-snb2/igt@kms_plane_cursor@pipe-c-viewport-size-256.html

  * igt@prime_nv_pcopy@test2:
    - shard-apl:          [SKIP][129] ([fdo#109271] / [i915#1635]) -> [SKIP][130] ([fdo#109271]) +12 similar issues
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-apl6/igt@prime_nv_pcopy@test2.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4687/shard-apl8/igt@prime_nv_pcopy@test2.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#5]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/5
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#123]: https://gitlab.freedesktop.org/drm/intel/issues/123
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1699]: https://gitlab.freedesktop.org/drm/intel/issues/1699
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1937]: https://gitlab.freedesktop.org/drm/intel/issues/1937
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2021]: https://gitlab.freedesktop.org/drm/intel/issues/2021
  [i915#2036]: https://gitlab.freedesktop.org/drm/intel/issues/2036
  [i915#247]: https://gitlab.freedesktop.org/drm/intel/issues/247
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
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
  * IGT: IGT_5715 -> IGTPW_4687
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8651: f6210d1dd268f9e09e10d3704c768d7679a44f48 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4687: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4687/index.html
  IGT_5715: 3b6975c0f9e429c0c1f48c61a3417be9d68300cf @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4687/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
