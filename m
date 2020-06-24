Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 24 Jun 2020 14:02:49 -0000
Message-ID: <159300736965.19235.17994676661848323018@emeril.freedesktop.org>
References: <20200624094238.1719-1-karthik.b.s@intel.com>
In-Reply-To: <20200624094238.1719-1-karthik.b.s@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fbig=5Fjoiner=3A_Add_test_to_validate_big_joiner?=
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
To: Karthik B S <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_big_joiner: Add test to validate big joiner
URL   : https://patchwork.freedesktop.org/series/78769/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8661_full -> IGTPW_4700_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4700_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4700_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4700/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4700_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_big_joiner@invalid-modeset} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4700/shard-iclb4/igt@kms_big_joiner@invalid-modeset.html
    - shard-tglb:         NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4700/shard-tglb3/igt@kms_big_joiner@invalid-modeset.html

  * igt@perf@buffer-fill:
    - shard-glk:          [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-glk2/igt@perf@buffer-fill.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4700/shard-glk1/igt@perf@buffer-fill.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8661_full and IGTPW_4700_full:

### New IGT tests (1) ###

  * igt@kms_big_joiner@invalid-modeset:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_4700_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@dumb_buffer@map-invalid-size:
    - shard-snb:          [PASS][5] -> [TIMEOUT][6] ([i915#1958]) +2 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-snb4/igt@dumb_buffer@map-invalid-size.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4700/shard-snb5/igt@dumb_buffer@map-invalid-size.html
    - shard-hsw:          [PASS][7] -> [TIMEOUT][8] ([i915#1958]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-hsw8/igt@dumb_buffer@map-invalid-size.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4700/shard-hsw1/igt@dumb_buffer@map-invalid-size.html

  * igt@gem_exec_whisper@basic-fds-priority:
    - shard-glk:          [PASS][9] -> [DMESG-WARN][10] ([i915#118] / [i915#95]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-glk2/igt@gem_exec_whisper@basic-fds-priority.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4700/shard-glk4/igt@gem_exec_whisper@basic-fds-priority.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-kbl:          [PASS][11] -> [DMESG-WARN][12] ([i915#1436] / [i915#716])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-kbl7/igt@gen9_exec_parse@allowed-all.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4700/shard-kbl1/igt@gen9_exec_parse@allowed-all.html

  * igt@kms_big_fb@linear-64bpp-rotate-0:
    - shard-glk:          [PASS][13] -> [DMESG-FAIL][14] ([i915#118] / [i915#95])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-glk9/igt@kms_big_fb@linear-64bpp-rotate-0.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4700/shard-glk8/igt@kms_big_fb@linear-64bpp-rotate-0.html

  * igt@kms_color@pipe-c-ctm-max:
    - shard-kbl:          [PASS][15] -> [FAIL][16] ([i915#168])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-kbl6/igt@kms_color@pipe-c-ctm-max.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4700/shard-kbl7/igt@kms_color@pipe-c-ctm-max.html
    - shard-apl:          [PASS][17] -> [FAIL][18] ([i915#168])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-apl1/igt@kms_color@pipe-c-ctm-max.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4700/shard-apl1/igt@kms_color@pipe-c-ctm-max.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-random:
    - shard-kbl:          [PASS][19] -> [DMESG-FAIL][20] ([i915#54] / [i915#95]) +2 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4700/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding:
    - shard-apl:          [PASS][21] -> [DMESG-WARN][22] ([i915#1635] / [i915#95]) +44 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-apl1/igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4700/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding.html

  * igt@kms_cursor_crc@pipe-c-cursor-128x128-sliding:
    - shard-kbl:          [PASS][23] -> [FAIL][24] ([i915#54])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-128x128-sliding.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4700/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-128x128-sliding.html
    - shard-apl:          [PASS][25] -> [FAIL][26] ([i915#54])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-apl7/igt@kms_cursor_crc@pipe-c-cursor-128x128-sliding.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4700/shard-apl1/igt@kms_cursor_crc@pipe-c-cursor-128x128-sliding.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled:
    - shard-apl:          [PASS][27] -> [DMESG-FAIL][28] ([i915#1635] / [i915#54] / [i915#95]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-apl2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4700/shard-apl3/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [PASS][29] -> [DMESG-WARN][30] ([i915#180]) +4 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4700/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu:
    - shard-kbl:          [PASS][31] -> [DMESG-WARN][32] ([i915#93] / [i915#95]) +36 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4700/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-pwrite:
    - shard-iclb:         [PASS][33] -> [DMESG-WARN][34] ([i915#1982]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-iclb4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-pwrite.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4700/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-glk:          [PASS][35] -> [FAIL][36] ([i915#49])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-glk4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4700/shard-glk6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite:
    - shard-tglb:         [PASS][37] -> [DMESG-WARN][38] ([i915#1982])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-tglb2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4700/shard-tglb3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [PASS][39] -> [FAIL][40] ([i915#31])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-kbl3/igt@kms_setmode@basic.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4700/shard-kbl7/igt@kms_setmode@basic.html

  * igt@kms_sysfs_edid_timing:
    - shard-apl:          [PASS][41] -> [FAIL][42] ([IGT#2])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-apl7/igt@kms_sysfs_edid_timing.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4700/shard-apl8/igt@kms_sysfs_edid_timing.html
    - shard-kbl:          [PASS][43] -> [FAIL][44] ([IGT#2])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-kbl4/igt@kms_sysfs_edid_timing.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4700/shard-kbl4/igt@kms_sysfs_edid_timing.html

  
#### Possible fixes ####

  * igt@gem_exec_whisper@basic-queues-all:
    - shard-glk:          [DMESG-WARN][45] ([i915#118] / [i915#95]) -> [PASS][46] +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-glk2/igt@gem_exec_whisper@basic-queues-all.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4700/shard-glk9/igt@gem_exec_whisper@basic-queues-all.html

  * igt@gem_userptr_blits@create-destroy-sync:
    - shard-hsw:          [TIMEOUT][47] ([i915#1958]) -> [PASS][48] +3 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-hsw1/igt@gem_userptr_blits@create-destroy-sync.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4700/shard-hsw5/igt@gem_userptr_blits@create-destroy-sync.html

  * igt@i915_module_load@reload:
    - shard-tglb:         [DMESG-WARN][49] ([i915#402]) -> [PASS][50] +2 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-tglb7/igt@i915_module_load@reload.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4700/shard-tglb3/igt@i915_module_load@reload.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-tglb:         [SKIP][51] ([i915#1904]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-tglb8/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4700/shard-tglb1/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-glk:          [DMESG-FAIL][53] ([i915#118] / [i915#95]) -> [PASS][54] +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-glk8/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4700/shard-glk4/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_color@pipe-a-ctm-blue-to-red:
    - shard-kbl:          [DMESG-WARN][55] ([i915#93] / [i915#95]) -> [PASS][56] +40 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-kbl6/igt@kms_color@pipe-a-ctm-blue-to-red.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4700/shard-kbl7/igt@kms_color@pipe-a-ctm-blue-to-red.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - shard-kbl:          [DMESG-FAIL][57] ([i915#54] / [i915#95]) -> [PASS][58] +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4700/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-128x42-random:
    - shard-hsw:          [INCOMPLETE][59] -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-hsw7/igt@kms_cursor_crc@pipe-b-cursor-128x42-random.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4700/shard-hsw6/igt@kms_cursor_crc@pipe-b-cursor-128x42-random.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][61] ([i915#180]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-kbl7/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4700/shard-kbl6/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_cursor_edge_walk@pipe-b-64x64-left-edge:
    - shard-apl:          [TIMEOUT][63] ([i915#1635] / [i915#1958]) -> [PASS][64] +5 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-apl8/igt@kms_cursor_edge_walk@pipe-b-64x64-left-edge.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4700/shard-apl1/igt@kms_cursor_edge_walk@pipe-b-64x64-left-edge.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-apl:          [FAIL][65] ([IGT#5]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-apl3/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4700/shard-apl2/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-kbl:          [DMESG-FAIL][67] ([i915#95]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-kbl6/igt@kms_fbcon_fbt@fbc-suspend.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4700/shard-kbl3/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a2:
    - shard-glk:          [FAIL][69] ([i915#79]) -> [PASS][70] +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-glk5/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a2.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4700/shard-glk2/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a2.html

  * igt@kms_flip_tiling@flip-changes-tiling-yf:
    - shard-apl:          [DMESG-FAIL][71] ([i915#1635] / [i915#95]) -> [PASS][72] +2 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-apl4/igt@kms_flip_tiling@flip-changes-tiling-yf.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4700/shard-apl1/igt@kms_flip_tiling@flip-changes-tiling-yf.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-msflip-blt:
    - shard-tglb:         [DMESG-WARN][73] ([i915#1982]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-tglb7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-msflip-blt.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4700/shard-tglb7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_invalid_dotclock:
    - shard-snb:          [TIMEOUT][75] ([i915#1958]) -> [PASS][76] +3 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-snb2/igt@kms_invalid_dotclock.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4700/shard-snb6/igt@kms_invalid_dotclock.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid:
    - shard-kbl:          [DMESG-FAIL][77] ([fdo#108145] / [i915#95]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4700/shard-kbl3/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
    - shard-apl:          [DMESG-FAIL][79] ([fdo#108145] / [i915#1635] / [i915#95]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4700/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html

  * igt@kms_vblank@pipe-c-accuracy-idle:
    - shard-apl:          [DMESG-WARN][81] ([i915#1982]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-apl3/igt@kms_vblank@pipe-c-accuracy-idle.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4700/shard-apl2/igt@kms_vblank@pipe-c-accuracy-idle.html

  * igt@perf@low-oa-exponent-permissions:
    - shard-apl:          [DMESG-WARN][83] ([i915#1635] / [i915#95]) -> [PASS][84] +31 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-apl4/igt@perf@low-oa-exponent-permissions.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4700/shard-apl7/igt@perf@low-oa-exponent-permissions.html

  
#### Warnings ####

  * igt@gem_exec_reloc@basic-concurrent16:
    - shard-apl:          [TIMEOUT][85] ([i915#1635] / [i915#1958]) -> [INCOMPLETE][86] ([i915#1635] / [i915#1958])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-apl8/igt@gem_exec_reloc@basic-concurrent16.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4700/shard-apl7/igt@gem_exec_reloc@basic-concurrent16.html

  * igt@gem_exec_reloc@basic-spin-others@vcs0:
    - shard-snb:          [WARN][87] ([i915#2036]) -> [WARN][88] ([i915#2021])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-snb6/igt@gem_exec_reloc@basic-spin-others@vcs0.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4700/shard-snb6/igt@gem_exec_reloc@basic-spin-others@vcs0.html

  * igt@i915_pm_rpm@modeset-lpsp-stress:
    - shard-apl:          [SKIP][89] ([fdo#109271]) -> [SKIP][90] ([fdo#109271] / [i915#1635]) +19 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-apl7/igt@i915_pm_rpm@modeset-lpsp-stress.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4700/shard-apl1/igt@i915_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-90:
    - shard-hsw:          [TIMEOUT][91] ([i915#1958]) -> [SKIP][92] ([fdo#109271]) +1 similar issue
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-hsw1/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4700/shard-hsw1/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html

  * igt@kms_chamelium@dp-hpd-with-enabled-mode:
    - shard-apl:          [SKIP][93] ([fdo#109271] / [fdo#111827]) -> [SKIP][94] ([fdo#109271] / [fdo#111827] / [i915#1635])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-apl4/igt@kms_chamelium@dp-hpd-with-enabled-mode.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4700/shard-apl6/igt@kms_chamelium@dp-hpd-with-enabled-mode.html

  * igt@kms_color_chamelium@pipe-a-ctm-limited-range:
    - shard-apl:          [SKIP][95] ([fdo#109271] / [fdo#111827] / [i915#1635]) -> [SKIP][96] ([fdo#109271] / [fdo#111827]) +2 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-apl1/igt@kms_color_chamelium@pipe-a-ctm-limited-range.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4700/shard-apl2/igt@kms_color_chamelium@pipe-a-ctm-limited-range.html

  * igt@kms_cursor_crc@pipe-a-cursor-512x512-random:
    - shard-hsw:          [SKIP][97] ([fdo#109271]) -> [TIMEOUT][98] ([i915#1958]) +2 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-hsw5/igt@kms_cursor_crc@pipe-a-cursor-512x512-random.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4700/shard-hsw1/igt@kms_cursor_crc@pipe-a-cursor-512x512-random.html

  * igt@kms_draw_crc@draw-method-rgb565-render-ytiled:
    - shard-snb:          [TIMEOUT][99] ([i915#1958]) -> [SKIP][100] ([fdo#109271]) +1 similar issue
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-snb2/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4700/shard-snb2/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html

  * igt@kms_flip@flip-vs-suspend@a-dp1:
    - shard-kbl:          [DMESG-WARN][101] ([i915#180]) -> [INCOMPLETE][102] ([i915#155])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-kbl6/igt@kms_flip@flip-vs-suspend@a-dp1.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4700/shard-kbl3/igt@kms_flip@flip-vs-suspend@a-dp1.html

  * igt@kms_flip_tiling@flip-yf-tiled:
    - shard-snb:          [SKIP][103] ([fdo#109271]) -> [TIMEOUT][104] ([i915#1958]) +2 similar issues
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-snb6/igt@kms_flip_tiling@flip-yf-tiled.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4700/shard-snb5/igt@kms_flip_tiling@flip-yf-tiled.html

  * igt@perf@gen12-unprivileged-single-ctx-counters:
    - shard-apl:          [SKIP][105] ([fdo#109271] / [i915#1635]) -> [SKIP][106] ([fdo#109271]) +11 similar issues
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-apl6/igt@perf@gen12-unprivileged-single-ctx-counters.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4700/shard-apl3/igt@perf@gen12-unprivileged-single-ctx-counters.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2
  [IGT#5]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/5
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#168]: https://gitlab.freedesktop.org/drm/intel/issues/168
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1904]: https://gitlab.freedesktop.org/drm/intel/issues/1904
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2021]: https://gitlab.freedesktop.org/drm/intel/issues/2021
  [i915#2036]: https://gitlab.freedesktop.org/drm/intel/issues/2036
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
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
  * IGT: IGT_5717 -> IGTPW_4700
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8661: 64cab0b9f9bfeb14d3ec2452d76b56915cdeb09f @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4700: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4700/index.html
  IGT_5717: 725bf2dae51f0087eaa64f1931a2ef9d22f070dd @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4700/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
