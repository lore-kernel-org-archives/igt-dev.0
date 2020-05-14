Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 14 May 2020 14:07:32 -0000
Message-ID: <158946525230.2826.916249991012510565@emeril.freedesktop.org>
References: <20200514074412.962179-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200514074412.962179-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliL2k5?=
 =?utf-8?q?15=3A_Reset_all_engine_properties_to_defaults_prior_to_the_star?=
 =?utf-8?q?t_of_a_test_=28rev2=29?=
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

Series: lib/i915: Reset all engine properties to defaults prior to the start of a test (rev2)
URL   : https://patchwork.freedesktop.org/series/76951/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8483_full -> IGTPW_4568_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4568_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4568_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4568/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4568_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_ctx_persistence@legacy-engines-hostile@bsd1:
    - shard-tglb:         [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8483/shard-tglb5/igt@gem_ctx_persistence@legacy-engines-hostile@bsd1.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4568/shard-tglb5/igt@gem_ctx_persistence@legacy-engines-hostile@bsd1.html
    - shard-iclb:         NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4568/shard-iclb4/igt@gem_ctx_persistence@legacy-engines-hostile@bsd1.html

  * igt@gem_ctx_persistence@legacy-engines-hostile@render:
    - shard-kbl:          [PASS][4] -> [FAIL][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8483/shard-kbl6/igt@gem_ctx_persistence@legacy-engines-hostile@render.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4568/shard-kbl3/igt@gem_ctx_persistence@legacy-engines-hostile@render.html

  
#### Warnings ####

  * igt@runner@aborted:
    - shard-tglb:         [FAIL][6] ([i915#1602]) -> [FAIL][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8483/shard-tglb3/igt@runner@aborted.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4568/shard-tglb1/igt@runner@aborted.html

  
Known issues
------------

  Here are the changes found in IGTPW_4568_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_exec@basic-norecovery:
    - shard-kbl:          [PASS][8] -> [DMESG-WARN][9] ([i915#165])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8483/shard-kbl1/igt@gem_ctx_exec@basic-norecovery.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4568/shard-kbl2/igt@gem_ctx_exec@basic-norecovery.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-kbl:          [PASS][10] -> [DMESG-WARN][11] ([i915#183])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8483/shard-kbl3/igt@gem_tiled_swapping@non-threaded.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4568/shard-kbl2/igt@gem_tiled_swapping@non-threaded.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [PASS][12] -> [DMESG-WARN][13] ([i915#1436] / [i915#716])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8483/shard-glk2/igt@gen9_exec_parse@allowed-all.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4568/shard-glk2/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_backlight@fade_with_suspend:
    - shard-tglb:         [PASS][14] -> [INCOMPLETE][15] ([i915#1602] / [i915#456])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8483/shard-tglb3/igt@i915_pm_backlight@fade_with_suspend.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4568/shard-tglb1/igt@i915_pm_backlight@fade_with_suspend.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][16] -> [FAIL][17] ([i915#454])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8483/shard-iclb8/igt@i915_pm_dc@dc6-psr.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4568/shard-iclb6/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-apl:          [PASS][18] -> [TIMEOUT][19] ([i915#1288])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8483/shard-apl7/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4568/shard-apl3/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@i915_suspend@debugfs-reader:
    - shard-kbl:          [PASS][20] -> [INCOMPLETE][21] ([i915#155])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8483/shard-kbl2/igt@i915_suspend@debugfs-reader.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4568/shard-kbl3/igt@i915_suspend@debugfs-reader.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen:
    - shard-kbl:          [PASS][22] -> [FAIL][23] ([i915#54] / [i915#93] / [i915#95]) +1 similar issue
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8483/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4568/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen.html

  * igt@kms_cursor_legacy@all-pipes-torture-bo:
    - shard-snb:          [PASS][24] -> [DMESG-WARN][25] ([i915#128])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8483/shard-snb6/igt@kms_cursor_legacy@all-pipes-torture-bo.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4568/shard-snb6/igt@kms_cursor_legacy@all-pipes-torture-bo.html

  * igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size:
    - shard-snb:          [PASS][26] -> [SKIP][27] ([fdo#109271])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8483/shard-snb6/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4568/shard-snb1/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled:
    - shard-apl:          [PASS][28] -> [FAIL][29] ([i915#52] / [i915#54] / [i915#95])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8483/shard-apl8/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4568/shard-apl4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
    - shard-kbl:          [PASS][30] -> [FAIL][31] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8483/shard-kbl2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4568/shard-kbl2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-apl:          [PASS][32] -> [DMESG-WARN][33] ([i915#180] / [i915#95])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8483/shard-apl6/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4568/shard-apl4/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [PASS][34] -> [DMESG-WARN][35] ([i915#180]) +5 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8483/shard-kbl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4568/shard-kbl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-apl:          [PASS][36] -> [DMESG-WARN][37] ([i915#180]) +1 similar issue
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8483/shard-apl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4568/shard-apl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-iclb:         [PASS][38] -> [INCOMPLETE][39] ([i915#1185] / [i915#250])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8483/shard-iclb8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4568/shard-iclb3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_plane_cursor@pipe-b-viewport-size-128:
    - shard-kbl:          [PASS][40] -> [DMESG-WARN][41] ([i915#78]) +1 similar issue
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8483/shard-kbl6/igt@kms_plane_cursor@pipe-b-viewport-size-128.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4568/shard-kbl2/igt@kms_plane_cursor@pipe-b-viewport-size-128.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [PASS][42] -> [SKIP][43] ([fdo#109441]) +2 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8483/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4568/shard-iclb7/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [PASS][44] -> [FAIL][45] ([i915#31])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8483/shard-kbl1/igt@kms_setmode@basic.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4568/shard-kbl2/igt@kms_setmode@basic.html

  
#### Possible fixes ####

  * {igt@gem_ctx_isolation@preservation-s3@rcs0}:
    - shard-kbl:          [DMESG-WARN][46] ([i915#180]) -> [PASS][47] +1 similar issue
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8483/shard-kbl2/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4568/shard-kbl4/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@gem_exec_suspend@basic-s0:
    - shard-tglb:         [INCOMPLETE][48] ([i915#1602] / [i915#456]) -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8483/shard-tglb3/igt@gem_exec_suspend@basic-s0.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4568/shard-tglb3/igt@gem_exec_suspend@basic-s0.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-apl:          [FAIL][50] ([i915#1119] / [i915#95]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8483/shard-apl2/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4568/shard-apl3/igt@kms_big_fb@linear-32bpp-rotate-180.html
    - shard-kbl:          [FAIL][52] ([i915#1119] / [i915#93] / [i915#95]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8483/shard-kbl4/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4568/shard-kbl6/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-onscreen:
    - shard-kbl:          [FAIL][54] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][55] +1 similar issue
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8483/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-128x128-onscreen.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4568/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-128x128-onscreen.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [SKIP][56] ([fdo#109349]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8483/shard-iclb8/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4568/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled:
    - shard-apl:          [FAIL][58] ([i915#52] / [i915#54] / [i915#95]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8483/shard-apl2/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4568/shard-apl2/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html

  * {igt@kms_flip@flip-vs-suspend-interruptible@c-dp1}:
    - shard-apl:          [DMESG-WARN][60] ([i915#180]) -> [PASS][61] +6 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8483/shard-apl6/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4568/shard-apl3/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu:
    - shard-tglb:         [SKIP][62] ([i915#668]) -> [PASS][63] +5 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8483/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4568/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [SKIP][64] ([i915#433]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8483/shard-tglb8/igt@kms_hdmi_inject@inject-audio.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4568/shard-tglb1/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:
    - shard-kbl:          [DMESG-WARN][66] ([i915#180] / [i915#93] / [i915#95]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8483/shard-kbl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4568/shard-kbl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant:
    - shard-kbl:          [FAIL][68] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8483/shard-kbl1/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4568/shard-kbl3/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
    - shard-apl:          [FAIL][70] ([fdo#108145] / [i915#265] / [i915#95]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8483/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4568/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][72] ([fdo#109441]) -> [PASS][73] +2 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8483/shard-iclb1/igt@kms_psr@psr2_sprite_plane_move.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4568/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  * {igt@perf@blocking-parameterized}:
    - shard-hsw:          [FAIL][74] ([i915#1542]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8483/shard-hsw8/igt@perf@blocking-parameterized.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4568/shard-hsw2/igt@perf@blocking-parameterized.html

  * {igt@perf@polling-parameterized}:
    - shard-iclb:         [FAIL][76] ([i915#1542]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8483/shard-iclb8/igt@perf@polling-parameterized.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4568/shard-iclb1/igt@perf@polling-parameterized.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc5-psr:
    - shard-snb:          [INCOMPLETE][78] ([i915#82]) -> [SKIP][79] ([fdo#109271])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8483/shard-snb5/igt@i915_pm_dc@dc5-psr.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4568/shard-snb4/igt@i915_pm_dc@dc5-psr.html

  * igt@kms_content_protection@uevent:
    - shard-kbl:          [FAIL][80] ([i915#357] / [i915#93] / [i915#95]) -> [FAIL][81] ([i915#357])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8483/shard-kbl4/igt@kms_content_protection@uevent.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4568/shard-kbl3/igt@kms_content_protection@uevent.html
    - shard-apl:          [FAIL][82] ([i915#357] / [i915#95]) -> [FAIL][83] ([i915#357])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8483/shard-apl7/igt@kms_content_protection@uevent.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4568/shard-apl3/igt@kms_content_protection@uevent.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-kbl:          [FAIL][84] ([i915#1121] / [i915#93] / [i915#95]) -> [FAIL][85] ([i915#64])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8483/shard-kbl6/igt@kms_fbcon_fbt@fbc.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4568/shard-kbl6/igt@kms_fbcon_fbt@fbc.html
    - shard-apl:          [FAIL][86] ([i915#1121] / [i915#95]) -> [FAIL][87] ([i915#1525])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8483/shard-apl2/igt@kms_fbcon_fbt@fbc.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4568/shard-apl7/igt@kms_fbcon_fbt@fbc.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#1121]: https://gitlab.freedesktop.org/drm/intel/issues/1121
  [i915#1185]: https://gitlab.freedesktop.org/drm/intel/issues/1185
  [i915#128]: https://gitlab.freedesktop.org/drm/intel/issues/128
  [i915#1288]: https://gitlab.freedesktop.org/drm/intel/issues/1288
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1525]: https://gitlab.freedesktop.org/drm/intel/issues/1525
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#165]: https://gitlab.freedesktop.org/drm/intel/issues/165
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#183]: https://gitlab.freedesktop.org/drm/intel/issues/183
  [i915#250]: https://gitlab.freedesktop.org/drm/intel/issues/250
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#357]: https://gitlab.freedesktop.org/drm/intel/issues/357
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#64]: https://gitlab.freedesktop.org/drm/intel/issues/64
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#78]: https://gitlab.freedesktop.org/drm/intel/issues/78
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5654 -> IGTPW_4568
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8483: eb8997678b25cb3ca507e02cb4e8bfd9c42b4268 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4568: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4568/index.html
  IGT_5654: 5637a466a0b09535517751608f5525a8b468a76b @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4568/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
