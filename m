Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 17 Jun 2020 16:44:59 -0000
Message-ID: <159241229918.29980.11681273165788102740@emeril.freedesktop.org>
References: <20200616141450.1181127-1-arkadiusz.hiler@intel.com>
In-Reply-To: <20200616141450.1181127-1-arkadiusz.hiler@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/3=5D_lib/core=3A_Print_thred=3Atid_?=
 =?utf-8?q?with_igt=5Flog_for_non-main_threads_=28rev2=29?=
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

Series: series starting with [i-g-t,1/3] lib/core: Print thred:tid with igt_log for non-main threads (rev2)
URL   : https://patchwork.freedesktop.org/series/78422/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5712_full -> IGTPW_4679_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4679_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4679_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4679/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4679_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_balancer@bonded-early:
    - shard-kbl:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-kbl4/igt@gem_exec_balancer@bonded-early.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4679/shard-kbl4/igt@gem_exec_balancer@bonded-early.html

  
Known issues
------------

  Here are the changes found in IGTPW_4679_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_gttfill@all:
    - shard-glk:          [PASS][3] -> [DMESG-WARN][4] ([i915#118] / [i915#95])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-glk4/igt@gem_exec_gttfill@all.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4679/shard-glk1/igt@gem_exec_gttfill@all.html

  * igt@gem_exec_schedule@implicit-boths@rcs0:
    - shard-snb:          [PASS][5] -> [INCOMPLETE][6] ([i915#82])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-snb1/igt@gem_exec_schedule@implicit-boths@rcs0.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4679/shard-snb6/igt@gem_exec_schedule@implicit-boths@rcs0.html

  * igt@gem_mmap_offset@basic-uaf:
    - shard-apl:          [PASS][7] -> [DMESG-WARN][8] ([i915#95]) +41 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-apl3/igt@gem_mmap_offset@basic-uaf.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4679/shard-apl4/igt@gem_mmap_offset@basic-uaf.html

  * igt@gem_mmap_wc@copy:
    - shard-kbl:          [PASS][9] -> [DMESG-WARN][10] ([i915#93] / [i915#95]) +47 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-kbl6/igt@gem_mmap_wc@copy.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4679/shard-kbl6/igt@gem_mmap_wc@copy.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [PASS][11] -> [DMESG-WARN][12] ([i915#1436] / [i915#716])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-glk1/igt@gen9_exec_parse@allowed-all.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4679/shard-glk6/igt@gen9_exec_parse@allowed-all.html
    - shard-kbl:          [PASS][13] -> [DMESG-WARN][14] ([i915#1436] / [i915#716])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-kbl3/igt@gen9_exec_parse@allowed-all.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4679/shard-kbl6/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_dc@dc5-psr:
    - shard-iclb:         [PASS][15] -> [FAIL][16] ([i915#1899])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-iclb6/igt@i915_pm_dc@dc5-psr.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4679/shard-iclb7/igt@i915_pm_dc@dc5-psr.html

  * igt@kms_big_fb@linear-32bpp-rotate-0:
    - shard-kbl:          [PASS][17] -> [DMESG-WARN][18] ([i915#1982]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-kbl4/igt@kms_big_fb@linear-32bpp-rotate-0.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4679/shard-kbl6/igt@kms_big_fb@linear-32bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-0:
    - shard-glk:          [PASS][19] -> [DMESG-FAIL][20] ([i915#118] / [i915#95])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-glk7/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4679/shard-glk8/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen:
    - shard-kbl:          [PASS][21] -> [DMESG-FAIL][22] ([i915#54] / [i915#95]) +4 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4679/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-dpms:
    - shard-kbl:          [PASS][23] -> [FAIL][24] ([i915#54])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-dpms.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4679/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-dpms.html
    - shard-apl:          [PASS][25] -> [FAIL][26] ([i915#54])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-apl1/igt@kms_cursor_crc@pipe-a-cursor-dpms.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4679/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-dpms.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-hsw:          [PASS][27] -> [FAIL][28] ([i915#96])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-hsw4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4679/shard-hsw8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-glk:          [PASS][29] -> [INCOMPLETE][30] ([i915#58] / [k.org#198133])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-glk4/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4679/shard-glk6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled:
    - shard-apl:          [PASS][31] -> [DMESG-FAIL][32] ([i915#54] / [i915#95]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-apl7/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4679/shard-apl3/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html

  * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a2:
    - shard-glk:          [PASS][33] -> [FAIL][34] ([i915#79])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-glk1/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a2.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4679/shard-glk5/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a2.html

  * igt@kms_flip@flip-vs-suspend@c-dp1:
    - shard-kbl:          [PASS][35] -> [DMESG-WARN][36] ([i915#180]) +7 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-kbl4/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4679/shard-kbl1/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-gtt:
    - shard-tglb:         [PASS][37] -> [DMESG-WARN][38] ([i915#1982])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-tglb5/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-gtt.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4679/shard-tglb1/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-gtt.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence:
    - shard-kbl:          [PASS][39] -> [DMESG-FAIL][40] ([i915#95])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-kbl7/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4679/shard-kbl4/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-64:
    - shard-apl:          [PASS][41] -> [DMESG-FAIL][42] ([i915#95]) +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-apl2/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4679/shard-apl7/igt@kms_plane_cursor@pipe-a-overlay-size-64.html

  * igt@kms_psr@psr2_primary_mmap_gtt:
    - shard-iclb:         [PASS][43] -> [SKIP][44] ([fdo#109441]) +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-iclb2/igt@kms_psr@psr2_primary_mmap_gtt.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4679/shard-iclb3/igt@kms_psr@psr2_primary_mmap_gtt.html

  * igt@kms_vblank@pipe-d-ts-continuation-dpms-suspend:
    - shard-tglb:         [PASS][45] -> [INCOMPLETE][46] ([i915#1602])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-tglb2/igt@kms_vblank@pipe-d-ts-continuation-dpms-suspend.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4679/shard-tglb8/igt@kms_vblank@pipe-d-ts-continuation-dpms-suspend.html

  * igt@syncobj_wait@invalid-multi-wait-all-unsubmitted-submitted:
    - shard-tglb:         [PASS][47] -> [DMESG-WARN][48] ([i915#402])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-tglb7/igt@syncobj_wait@invalid-multi-wait-all-unsubmitted-submitted.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4679/shard-tglb5/igt@syncobj_wait@invalid-multi-wait-all-unsubmitted-submitted.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@legacy-engines-mixed-process@bsd1:
    - shard-tglb:         [FAIL][49] ([i915#1528]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-tglb2/igt@gem_ctx_persistence@legacy-engines-mixed-process@bsd1.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4679/shard-tglb6/igt@gem_ctx_persistence@legacy-engines-mixed-process@bsd1.html

  * igt@gem_eio@kms:
    - shard-snb:          [DMESG-WARN][51] ([i915#1982]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-snb1/igt@gem_eio@kms.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4679/shard-snb2/igt@gem_eio@kms.html

  * igt@gem_exec_whisper@basic-contexts:
    - shard-iclb:         [DMESG-WARN][53] ([i915#1982]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-iclb2/igt@gem_exec_whisper@basic-contexts.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4679/shard-iclb8/igt@gem_exec_whisper@basic-contexts.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][55] ([i915#1899]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-iclb2/igt@i915_pm_dc@dc6-psr.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4679/shard-iclb4/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_suspend@debugfs-reader:
    - shard-tglb:         [INCOMPLETE][57] ([i915#1602] / [i915#456]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-tglb3/igt@i915_suspend@debugfs-reader.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4679/shard-tglb2/igt@i915_suspend@debugfs-reader.html

  * igt@kms_addfb_basic@bad-pitch-128:
    - shard-snb:          [TIMEOUT][59] ([i915#1958]) -> [PASS][60] +4 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-snb6/igt@kms_addfb_basic@bad-pitch-128.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4679/shard-snb6/igt@kms_addfb_basic@bad-pitch-128.html
    - shard-hsw:          [TIMEOUT][61] ([i915#1958]) -> [PASS][62] +4 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-hsw2/igt@kms_addfb_basic@bad-pitch-128.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4679/shard-hsw2/igt@kms_addfb_basic@bad-pitch-128.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-0:
    - shard-apl:          [DMESG-WARN][63] ([i915#1982]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-apl8/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4679/shard-apl6/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html
    - shard-glk:          [DMESG-WARN][65] ([i915#1982]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-glk5/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4679/shard-glk5/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html

  * igt@kms_cursor_edge_walk@pipe-a-64x64-bottom-edge:
    - shard-apl:          [DMESG-WARN][67] ([i915#95]) -> [PASS][68] +42 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-apl6/igt@kms_cursor_edge_walk@pipe-a-64x64-bottom-edge.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4679/shard-apl7/igt@kms_cursor_edge_walk@pipe-a-64x64-bottom-edge.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-xtiled:
    - shard-kbl:          [DMESG-WARN][69] ([i915#93] / [i915#95]) -> [PASS][70] +41 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-kbl2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-xtiled.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4679/shard-kbl2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-xtiled.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [DMESG-WARN][71] ([i915#180]) -> [PASS][72] +5 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-kbl6/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4679/shard-kbl2/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:
    - shard-apl:          [FAIL][73] ([i915#49]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-apl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4679/shard-apl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html
    - shard-kbl:          [FAIL][75] ([i915#49]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4679/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-tglb:         [DMESG-WARN][77] ([i915#1982]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4679/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid:
    - shard-kbl:          [DMESG-FAIL][79] ([fdo#108145] / [i915#95]) -> [PASS][80] +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-kbl1/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4679/shard-kbl2/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant:
    - shard-apl:          [DMESG-FAIL][81] ([fdo#108145] / [i915#95]) -> [PASS][82] +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4679/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html

  * igt@kms_psr@psr2_cursor_plane_onoff:
    - shard-iclb:         [SKIP][83] ([fdo#109441]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-iclb1/igt@kms_psr@psr2_cursor_plane_onoff.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4679/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html

  * igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend:
    - shard-apl:          [INCOMPLETE][85] -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-apl6/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4679/shard-apl2/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html

  * igt@perf_pmu@module-unload:
    - shard-tglb:         [DMESG-WARN][87] ([i915#402]) -> [PASS][88] +1 similar issue
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-tglb1/igt@perf_pmu@module-unload.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4679/shard-tglb5/igt@perf_pmu@module-unload.html

  * igt@perf_pmu@semaphore-busy@rcs0:
    - shard-kbl:          [FAIL][89] ([i915#1820] / [i915#93] / [i915#95]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-kbl7/igt@perf_pmu@semaphore-busy@rcs0.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4679/shard-kbl7/igt@perf_pmu@semaphore-busy@rcs0.html

  
#### Warnings ####

  * igt@gem_ctx_persistence@engines-cleanup:
    - shard-hsw:          [SKIP][91] ([fdo#109271] / [i915#1099]) -> [TIMEOUT][92] ([i915#1958])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-hsw1/igt@gem_ctx_persistence@engines-cleanup.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4679/shard-hsw5/igt@gem_ctx_persistence@engines-cleanup.html
    - shard-snb:          [SKIP][93] ([fdo#109271] / [i915#1099]) -> [TIMEOUT][94] ([i915#1958])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-snb6/igt@gem_ctx_persistence@engines-cleanup.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4679/shard-snb1/igt@gem_ctx_persistence@engines-cleanup.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][95] ([i915#658]) -> [SKIP][96] ([i915#588])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-iclb6/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4679/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [FAIL][97] ([i915#1899]) -> [FAIL][98] ([i915#454])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-tglb5/igt@i915_pm_dc@dc6-psr.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4679/shard-tglb6/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-kbl:          [TIMEOUT][99] ([i915#1319] / [i915#1958]) -> [TIMEOUT][100] ([i915#1319]) +1 similar issue
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-kbl2/igt@kms_content_protection@atomic-dpms.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4679/shard-kbl6/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@lic:
    - shard-apl:          [FAIL][101] ([fdo#110321]) -> [DMESG-FAIL][102] ([fdo#110321] / [i915#95])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-apl3/igt@kms_content_protection@lic.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4679/shard-apl1/igt@kms_content_protection@lic.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt:
    - shard-snb:          [SKIP][103] ([fdo#109271]) -> [TIMEOUT][104] ([i915#1958]) +4 similar issues
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-snb2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4679/shard-snb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt.html
    - shard-hsw:          [SKIP][105] ([fdo#109271]) -> [TIMEOUT][106] ([i915#1958]) +4 similar issues
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-hsw4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4679/shard-hsw5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
    - shard-apl:          [FAIL][107] ([fdo#108145] / [i915#265]) -> [DMESG-FAIL][108] ([fdo#108145] / [i915#95]) +1 similar issue
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4679/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:
    - shard-apl:          [DMESG-FAIL][109] ([i915#95]) -> [FAIL][110] ([i915#265])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-apl6/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4679/shard-apl1/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html
    - shard-kbl:          [DMESG-FAIL][111] ([i915#95]) -> [FAIL][112] ([i915#265])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-kbl6/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4679/shard-kbl6/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [DMESG-WARN][113] ([i915#93] / [i915#95]) -> [DMESG-WARN][114] ([i915#180])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5712/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4679/shard-kbl7/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1528]: https://gitlab.freedesktop.org/drm/intel/issues/1528
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1820]: https://gitlab.freedesktop.org/drm/intel/issues/1820
  [i915#1899]: https://gitlab.freedesktop.org/drm/intel/issues/1899
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [i915#96]: https://gitlab.freedesktop.org/drm/intel/issues/96
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5712 -> IGTPW_4679

  CI-20190529: 20190529
  CI_DRM_8639: 47584e59cf51ec499d68a4cefbaf447448ce2894 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4679: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4679/index.html
  IGT_5712: eba1135ddd35f9d3097ed91032aefe8f9a9f9d02 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4679/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
