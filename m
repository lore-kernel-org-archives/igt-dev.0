Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 08 Jul 2020 21:26:46 -0000
Message-ID: <159424360605.3840.11839381626735122450@emeril.freedesktop.org>
References: <20200708161809.31585-1-marcin.bernatowicz@intel.com>
In-Reply-To: <20200708161809.31585-1-marcin.bernatowicz@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?device=5Freset=3A_Test_device_sysfs_reset_=28rev5=29?=
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
To: "Bernatowicz, Marcin" <marcin.bernatowicz@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/device_reset: Test device sysfs reset (rev5)
URL   : https://patchwork.freedesktop.org/series/78849/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8715_full -> IGTPW_4749_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4749_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4749_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4749/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4749_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@wf_vblank-ts-check-interruptible@c-hdmi-a1:
    - shard-hsw:          NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4749/shard-hsw4/igt@kms_flip@wf_vblank-ts-check-interruptible@c-hdmi-a1.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8715_full and IGTPW_4749_full:

### New IGT tests (1) ###

  * igt@device_reset@unbind-reset-rebind:
    - Statuses : 7 pass(s)
    - Exec time: [0.34, 1.96] s

  

Known issues
------------

  Here are the changes found in IGTPW_4749_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_bad_destroy@invalid-default-ctx:
    - shard-snb:          [PASS][2] -> [TIMEOUT][3] ([i915#1958] / [i915#2119]) +1 similar issue
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-snb4/igt@gem_ctx_bad_destroy@invalid-default-ctx.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4749/shard-snb6/igt@gem_ctx_bad_destroy@invalid-default-ctx.html

  * igt@gem_ctx_shared@q-smoketest-all:
    - shard-glk:          [PASS][4] -> [DMESG-WARN][5] ([i915#118] / [i915#95]) +2 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-glk1/igt@gem_ctx_shared@q-smoketest-all.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4749/shard-glk8/igt@gem_ctx_shared@q-smoketest-all.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress:
    - shard-kbl:          [PASS][6] -> [DMESG-WARN][7] ([i915#93] / [i915#95]) +41 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-kbl2/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4749/shard-kbl3/igt@i915_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-0:
    - shard-glk:          [PASS][8] -> [DMESG-FAIL][9] ([i915#118] / [i915#95])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-glk4/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4749/shard-glk8/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-0:
    - shard-apl:          [PASS][10] -> [DMESG-WARN][11] ([i915#1982]) +1 similar issue
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-apl7/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4749/shard-apl3/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-glk:          [PASS][12] -> [FAIL][13] ([i915#1119])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-glk1/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4749/shard-glk6/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_color@pipe-c-degamma:
    - shard-apl:          [PASS][14] -> [FAIL][15] ([i915#71])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-apl8/igt@kms_color@pipe-c-degamma.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4749/shard-apl7/igt@kms_color@pipe-c-degamma.html
    - shard-kbl:          [PASS][16] -> [FAIL][17] ([i915#71])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-kbl6/igt@kms_color@pipe-c-degamma.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4749/shard-kbl7/igt@kms_color@pipe-c-degamma.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [PASS][18] -> [DMESG-WARN][19] ([i915#180]) +2 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4749/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-d-cursor-128x42-sliding:
    - shard-tglb:         [PASS][20] -> [DMESG-WARN][21] ([i915#402])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-tglb3/igt@kms_cursor_crc@pipe-d-cursor-128x42-sliding.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4749/shard-tglb5/igt@kms_cursor_crc@pipe-d-cursor-128x42-sliding.html

  * igt@kms_cursor_edge_walk@pipe-b-128x128-left-edge:
    - shard-glk:          [PASS][22] -> [DMESG-WARN][23] ([i915#1982]) +1 similar issue
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-glk2/igt@kms_cursor_edge_walk@pipe-b-128x128-left-edge.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4749/shard-glk3/igt@kms_cursor_edge_walk@pipe-b-128x128-left-edge.html

  * igt@kms_cursor_legacy@pipe-c-forked-bo:
    - shard-apl:          [PASS][24] -> [DMESG-WARN][25] ([i915#1635] / [i915#95]) +35 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-apl8/igt@kms_cursor_legacy@pipe-c-forked-bo.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4749/shard-apl4/igt@kms_cursor_legacy@pipe-c-forked-bo.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-xtiled:
    - shard-glk:          [PASS][26] -> [DMESG-FAIL][27] ([i915#118] / [i915#54] / [i915#95])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-glk4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-xtiled.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4749/shard-glk6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-xtiled.html
    - shard-iclb:         [PASS][28] -> [FAIL][29] ([i915#52] / [i915#54])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-iclb6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-xtiled.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4749/shard-iclb7/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-xtiled.html

  * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1:
    - shard-glk:          [PASS][30] -> [FAIL][31] ([i915#79])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-glk1/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4749/shard-glk9/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-pwrite:
    - shard-tglb:         [PASS][32] -> [DMESG-WARN][33] ([i915#1982]) +3 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-tglb1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-pwrite.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4749/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
    - shard-iclb:         [PASS][34] -> [DMESG-WARN][35] ([i915#1982])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-iclb6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4749/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-glk:          [PASS][36] -> [FAIL][37] ([i915#49])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-glk3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4749/shard-glk6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [PASS][38] -> [SKIP][39] ([i915#433])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-tglb8/igt@kms_hdmi_inject@inject-audio.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4749/shard-tglb7/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [PASS][40] -> [DMESG-FAIL][41] ([i915#95]) +2 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-kbl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4749/shard-kbl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-128:
    - shard-apl:          [PASS][42] -> [DMESG-FAIL][43] ([i915#1635] / [i915#95]) +2 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-apl6/igt@kms_plane_cursor@pipe-a-viewport-size-128.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4749/shard-apl4/igt@kms_plane_cursor@pipe-a-viewport-size-128.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][44] -> [SKIP][45] ([fdo#109441]) +3 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4749/shard-iclb3/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@perf@blocking-parameterized:
    - shard-iclb:         [PASS][46] -> [FAIL][47] ([i915#1542])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-iclb7/igt@perf@blocking-parameterized.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4749/shard-iclb4/igt@perf@blocking-parameterized.html

  
#### Possible fixes ####

  * igt@gem_exec_balancer@bonded-early:
    - shard-iclb:         [FAIL][48] ([i915#926]) -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-iclb1/igt@gem_exec_balancer@bonded-early.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4749/shard-iclb5/igt@gem_exec_balancer@bonded-early.html

  * igt@gem_exec_reloc@basic-concurrent0:
    - shard-glk:          [FAIL][50] ([i915#1930]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-glk8/igt@gem_exec_reloc@basic-concurrent0.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4749/shard-glk1/igt@gem_exec_reloc@basic-concurrent0.html

  * igt@gem_exec_whisper@basic-normal:
    - shard-glk:          [DMESG-WARN][52] ([i915#118] / [i915#95]) -> [PASS][53] +1 similar issue
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-glk9/igt@gem_exec_whisper@basic-normal.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4749/shard-glk1/igt@gem_exec_whisper@basic-normal.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-tglb:         [DMESG-WARN][54] ([i915#402]) -> [PASS][55] +1 similar issue
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-tglb5/igt@i915_module_load@reload-with-fault-injection.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4749/shard-tglb5/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_selftest@mock@requests:
    - shard-snb:          [INCOMPLETE][56] ([i915#2110] / [i915#82]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-snb5/igt@i915_selftest@mock@requests.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4749/shard-snb6/igt@i915_selftest@mock@requests.html

  * igt@kms_addfb_basic@unused-pitches:
    - shard-kbl:          [DMESG-WARN][58] ([i915#93] / [i915#95]) -> [PASS][59] +42 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-kbl1/igt@kms_addfb_basic@unused-pitches.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4749/shard-kbl2/igt@kms_addfb_basic@unused-pitches.html

  * igt@kms_big_fb@linear-16bpp-rotate-180:
    - shard-kbl:          [DMESG-FAIL][60] ([i915#95]) -> [PASS][61] +2 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-kbl4/igt@kms_big_fb@linear-16bpp-rotate-180.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4749/shard-kbl3/igt@kms_big_fb@linear-16bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding:
    - shard-apl:          [DMESG-WARN][62] ([i915#1635] / [i915#95]) -> [PASS][63] +34 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4749/shard-apl1/igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-sliding:
    - shard-hsw:          [TIMEOUT][64] ([i915#1958] / [i915#2119]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-hsw8/igt@kms_cursor_crc@pipe-a-cursor-256x256-sliding.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4749/shard-hsw4/igt@kms_cursor_crc@pipe-a-cursor-256x256-sliding.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen:
    - shard-kbl:          [DMESG-FAIL][66] ([i915#54] / [i915#95]) -> [PASS][67] +1 similar issue
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4749/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [FAIL][68] ([i915#1525]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-apl8/igt@kms_fbcon_fbt@fbc-suspend.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4749/shard-apl8/igt@kms_fbcon_fbt@fbc-suspend.html
    - shard-kbl:          [FAIL][70] ([i915#64]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-kbl6/igt@kms_fbcon_fbt@fbc-suspend.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4749/shard-kbl1/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1:
    - shard-hsw:          [INCOMPLETE][72] ([i915#2055]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-hsw4/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4749/shard-hsw7/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend@b-dp1:
    - shard-kbl:          [DMESG-WARN][74] ([i915#180]) -> [PASS][75] +6 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-kbl2/igt@kms_flip@flip-vs-suspend@b-dp1.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4749/shard-kbl6/igt@kms_flip@flip-vs-suspend@b-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render:
    - shard-kbl:          [FAIL][76] ([i915#49]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4749/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
    - shard-apl:          [FAIL][78] ([i915#49]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-apl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4749/shard-apl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-badstride:
    - shard-glk:          [DMESG-WARN][80] ([i915#1982]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-glk8/igt@kms_frontbuffer_tracking@fbc-badstride.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4749/shard-glk6/igt@kms_frontbuffer_tracking@fbc-badstride.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-pwrite:
    - shard-tglb:         [DMESG-WARN][82] ([i915#1982]) -> [PASS][83] +3 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-tglb2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-pwrite.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4749/shard-tglb3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_pipe_crc_basic@hang-read-crc-pipe-a:
    - shard-apl:          [DMESG-FAIL][84] ([i915#1635] / [i915#95]) -> [PASS][85] +1 similar issue
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-apl8/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4749/shard-apl4/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html

  * igt@kms_plane_cursor@pipe-b-primary-size-128:
    - shard-hsw:          [INCOMPLETE][86] -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-hsw7/igt@kms_plane_cursor@pipe-b-primary-size-128.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4749/shard-hsw2/igt@kms_plane_cursor@pipe-b-primary-size-128.html

  * igt@kms_psr@psr2_suspend:
    - shard-iclb:         [SKIP][88] ([fdo#109441]) -> [PASS][89] +1 similar issue
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-iclb6/igt@kms_psr@psr2_suspend.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4749/shard-iclb2/igt@kms_psr@psr2_suspend.html

  
#### Warnings ####

  * igt@gem_exec_reloc@basic-concurrent0:
    - shard-kbl:          [FAIL][90] ([i915#1930]) -> [DMESG-FAIL][91] ([i915#95])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-kbl3/igt@gem_exec_reloc@basic-concurrent0.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4749/shard-kbl4/igt@gem_exec_reloc@basic-concurrent0.html

  * igt@gem_exec_reloc@basic-concurrent16:
    - shard-snb:          [FAIL][92] ([i915#1930]) -> [TIMEOUT][93] ([i915#1958] / [i915#2119])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-snb5/igt@gem_exec_reloc@basic-concurrent16.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4749/shard-snb6/igt@gem_exec_reloc@basic-concurrent16.html

  * igt@gem_vm_create@execbuf:
    - shard-hsw:          [TIMEOUT][94] ([i915#1958] / [i915#2119]) -> [SKIP][95] ([fdo#109271]) +1 similar issue
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-hsw8/igt@gem_vm_create@execbuf.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4749/shard-hsw6/igt@gem_vm_create@execbuf.html

  * igt@kms_chamelium@hdmi-crc-fast:
    - shard-apl:          [SKIP][96] ([fdo#109271] / [fdo#111827] / [i915#1635]) -> [SKIP][97] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-apl1/igt@kms_chamelium@hdmi-crc-fast.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4749/shard-apl6/igt@kms_chamelium@hdmi-crc-fast.html

  * igt@kms_color@pipe-d-ctm-0-25:
    - shard-snb:          [SKIP][98] ([fdo#109271]) -> [TIMEOUT][99] ([i915#1958] / [i915#2119]) +2 similar issues
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-snb2/igt@kms_color@pipe-d-ctm-0-25.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4749/shard-snb6/igt@kms_color@pipe-d-ctm-0-25.html

  * igt@kms_content_protection@atomic:
    - shard-apl:          [FAIL][100] ([fdo#110321] / [fdo#110336]) -> [DMESG-FAIL][101] ([fdo#110321] / [i915#1635] / [i915#95])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-apl4/igt@kms_content_protection@atomic.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4749/shard-apl7/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          [DMESG-FAIL][102] ([fdo#110321] / [i915#1635] / [i915#95]) -> [FAIL][103] ([fdo#110321] / [fdo#110336])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-apl8/igt@kms_content_protection@atomic-dpms.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4749/shard-apl4/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@lic:
    - shard-apl:          [FAIL][104] ([fdo#110321]) -> [DMESG-FAIL][105] ([fdo#110321] / [i915#1635] / [i915#95])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-apl3/igt@kms_content_protection@lic.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4749/shard-apl8/igt@kms_content_protection@lic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-apl:          [SKIP][106] ([fdo#109271] / [i915#1635]) -> [SKIP][107] ([fdo#109271]) +7 similar issues
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-apl6/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4749/shard-apl6/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
    - shard-apl:          [SKIP][108] ([fdo#109271]) -> [SKIP][109] ([fdo#109271] / [i915#1635]) +14 similar issues
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-apl8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4749/shard-apl6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
    - shard-apl:          [DMESG-FAIL][110] ([fdo#108145] / [i915#1635] / [i915#95]) -> [FAIL][111] ([fdo#108145] / [i915#265])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4749/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [DMESG-WARN][112] ([i915#93] / [i915#95]) -> [DMESG-WARN][113] ([i915#180])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-kbl1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4749/shard-kbl3/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][114], [FAIL][115], [FAIL][116]) ([i915#1610] / [i915#1635] / [i915#2110]) -> [FAIL][117] ([i915#1635] / [i915#2110])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-apl1/igt@runner@aborted.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-apl3/igt@runner@aborted.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-apl2/igt@runner@aborted.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4749/shard-apl7/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1525]: https://gitlab.freedesktop.org/drm/intel/issues/1525
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1610]: https://gitlab.freedesktop.org/drm/intel/issues/1610
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2055]: https://gitlab.freedesktop.org/drm/intel/issues/2055
  [i915#2110]: https://gitlab.freedesktop.org/drm/intel/issues/2110
  [i915#2119]: https://gitlab.freedesktop.org/drm/intel/issues/2119
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#64]: https://gitlab.freedesktop.org/drm/intel/issues/64
  [i915#71]: https://gitlab.freedesktop.org/drm/intel/issues/71
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#926]: https://gitlab.freedesktop.org/drm/intel/issues/926
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5728 -> IGTPW_4749
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8715: 76c2d43437601608d75f61a9eb6cf3a7aae5e02b @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4749: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4749/index.html
  IGT_5728: 6988eebf78e9ce9746b8c2b7d21cb4174d6623a9 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4749/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
