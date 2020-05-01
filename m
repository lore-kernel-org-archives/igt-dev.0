Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 01 May 2020 05:09:07 -0000
Message-ID: <158830974721.18944.1869345201469086838@emeril.freedesktop.org>
References: <20200430195134.1044125-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200430195134.1044125-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgaWd0L2dl?=
 =?utf-8?q?m=5Fmmap=5Foffset=3A_Simulate_gdb_inspecting_any_mmap_using_ptr?=
 =?utf-8?b?YWNlKCk=?=
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

Series: igt/gem_mmap_offset: Simulate gdb inspecting any mmap using ptrace()
URL   : https://patchwork.freedesktop.org/series/76786/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8403_full -> IGTPW_4524_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4524/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4524_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_mmap_offset@ptrace@gtt} (NEW):
    - shard-snb:          NOTRUN -> [FAIL][1] +3 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4524/shard-snb2/igt@gem_mmap_offset@ptrace@gtt.html

  * {igt@gem_mmap_offset@ptrace@uc} (NEW):
    - shard-iclb:         NOTRUN -> [FAIL][2] +3 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4524/shard-iclb7/igt@gem_mmap_offset@ptrace@uc.html

  * {igt@gem_mmap_offset@ptrace@wb} (NEW):
    - shard-glk:          NOTRUN -> [FAIL][3] +3 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4524/shard-glk4/igt@gem_mmap_offset@ptrace@wb.html
    - shard-tglb:         NOTRUN -> [FAIL][4] +3 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4524/shard-tglb1/igt@gem_mmap_offset@ptrace@wb.html
    - shard-kbl:          NOTRUN -> [FAIL][5] +3 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4524/shard-kbl6/igt@gem_mmap_offset@ptrace@wb.html

  * {igt@gem_mmap_offset@ptrace@wc} (NEW):
    - shard-hsw:          NOTRUN -> [FAIL][6] +3 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4524/shard-hsw6/igt@gem_mmap_offset@ptrace@wc.html
    - shard-apl:          NOTRUN -> [FAIL][7] +3 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4524/shard-apl1/igt@gem_mmap_offset@ptrace@wc.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@kms_flip@2x-modeset-vs-vblank-race-interruptible@bc-hdmi-a1-hdmi-a2}:
    - shard-glk:          [PASS][8] -> [FAIL][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8403/shard-glk2/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible@bc-hdmi-a1-hdmi-a2.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4524/shard-glk8/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible@bc-hdmi-a1-hdmi-a2.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8403_full and IGTPW_4524_full:

### New IGT tests (5) ###

  * igt@gem_mmap_offset@ptrace:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_mmap_offset@ptrace@gtt:
    - Statuses : 7 fail(s)
    - Exec time: [0.01, 0.11] s

  * igt@gem_mmap_offset@ptrace@uc:
    - Statuses : 7 fail(s)
    - Exec time: [0.01, 0.02] s

  * igt@gem_mmap_offset@ptrace@wb:
    - Statuses : 7 fail(s)
    - Exec time: [0.01, 0.02] s

  * igt@gem_mmap_offset@ptrace@wc:
    - Statuses : 7 fail(s)
    - Exec time: [0.01, 0.02] s

  

Known issues
------------

  Here are the changes found in IGTPW_4524_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][10] -> [FAIL][11] ([i915#454])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8403/shard-iclb3/igt@i915_pm_dc@dc6-psr.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4524/shard-iclb6/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@system-suspend:
    - shard-kbl:          [PASS][12] -> [INCOMPLETE][13] ([i915#151] / [i915#155])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8403/shard-kbl1/igt@i915_pm_rpm@system-suspend.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4524/shard-kbl3/igt@i915_pm_rpm@system-suspend.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-random:
    - shard-kbl:          [PASS][14] -> [FAIL][15] ([i915#54] / [i915#93] / [i915#95])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8403/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4524/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [PASS][16] -> [DMESG-WARN][17] ([i915#180]) +3 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8403/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4524/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy:
    - shard-kbl:          [PASS][18] -> [FAIL][19] ([i915#1566] / [i915#93] / [i915#95])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8403/shard-kbl2/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4524/shard-kbl4/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-untiled:
    - shard-glk:          [PASS][20] -> [FAIL][21] ([i915#52] / [i915#54]) +2 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8403/shard-glk4/igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-untiled.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4524/shard-glk6/igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-untiled.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled:
    - shard-glk:          [PASS][22] -> [FAIL][23] ([i915#177] / [i915#52] / [i915#54])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8403/shard-glk1/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4524/shard-glk5/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled:
    - shard-apl:          [PASS][24] -> [FAIL][25] ([i915#52] / [i915#54] / [i915#95])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8403/shard-apl6/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4524/shard-apl7/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html
    - shard-kbl:          [PASS][26] -> [FAIL][27] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8403/shard-kbl3/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4524/shard-kbl7/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled:
    - shard-kbl:          [PASS][28] -> [FAIL][29] ([fdo#108145] / [i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8403/shard-kbl4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4524/shard-kbl6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
    - shard-apl:          [PASS][30] -> [FAIL][31] ([fdo#108145] / [i915#52] / [i915#54] / [i915#95])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8403/shard-apl4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4524/shard-apl1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-apl:          [PASS][32] -> [DMESG-WARN][33] ([i915#180] / [i915#95])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8403/shard-apl1/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4524/shard-apl2/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-fullscreen:
    - shard-tglb:         [PASS][34] -> [SKIP][35] ([i915#668]) +5 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8403/shard-tglb6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-fullscreen.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4524/shard-tglb6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-apl:          [PASS][36] -> [DMESG-WARN][37] ([i915#180]) +2 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8403/shard-apl1/igt@kms_hdr@bpc-switch-suspend.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4524/shard-apl4/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid:
    - shard-kbl:          [PASS][38] -> [FAIL][39] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8403/shard-kbl7/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4524/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
    - shard-apl:          [PASS][40] -> [FAIL][41] ([fdo#108145] / [i915#265] / [i915#95]) +1 similar issue
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8403/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4524/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html

  * igt@kms_prime@basic-crc:
    - shard-apl:          [PASS][42] -> [FAIL][43] ([i915#1031] / [i915#95])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8403/shard-apl4/igt@kms_prime@basic-crc.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4524/shard-apl3/igt@kms_prime@basic-crc.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [PASS][44] -> [FAIL][45] ([i915#173])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8403/shard-iclb4/igt@kms_psr@no_drrs.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4524/shard-iclb1/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [PASS][46] -> [SKIP][47] ([fdo#109441])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8403/shard-iclb2/igt@kms_psr@psr2_cursor_render.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4524/shard-iclb5/igt@kms_psr@psr2_cursor_render.html

  
#### Possible fixes ####

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-random:
    - shard-kbl:          [FAIL][48] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][49] +1 similar issue
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8403/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4524/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-glk:          [FAIL][50] ([i915#72]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8403/shard-glk5/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4524/shard-glk4/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-hsw:          [FAIL][52] ([IGT#5]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8403/shard-hsw1/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4524/shard-hsw7/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_draw_crc@draw-method-rgb565-blt-ytiled:
    - shard-glk:          [FAIL][54] ([i915#52] / [i915#54]) -> [PASS][55] +3 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8403/shard-glk5/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4524/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [SKIP][56] ([i915#433]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8403/shard-tglb2/igt@kms_hdmi_inject@inject-audio.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4524/shard-tglb5/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-256:
    - shard-kbl:          [FAIL][58] ([i915#1559] / [i915#93] / [i915#95]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8403/shard-kbl3/igt@kms_plane_cursor@pipe-a-overlay-size-256.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4524/shard-kbl3/igt@kms_plane_cursor@pipe-a-overlay-size-256.html
    - shard-apl:          [FAIL][60] ([i915#1559] / [i915#95]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8403/shard-apl8/igt@kms_plane_cursor@pipe-a-overlay-size-256.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4524/shard-apl8/igt@kms_plane_cursor@pipe-a-overlay-size-256.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [FAIL][62] ([i915#899]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8403/shard-glk6/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4524/shard-glk5/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [SKIP][64] ([fdo#109642] / [fdo#111068]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8403/shard-iclb8/igt@kms_psr2_su@frontbuffer.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4524/shard-iclb2/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][66] ([fdo#109441]) -> [PASS][67] +2 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8403/shard-iclb6/igt@kms_psr@psr2_sprite_plane_move.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4524/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [DMESG-WARN][68] ([i915#180]) -> [PASS][69] +1 similar issue
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8403/shard-kbl6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4524/shard-kbl3/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@kms_vblank@pipe-b-ts-continuation-suspend:
    - shard-apl:          [DMESG-WARN][70] ([i915#180]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8403/shard-apl1/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4524/shard-apl8/igt@kms_vblank@pipe-b-ts-continuation-suspend.html

  * igt@testdisplay:
    - shard-apl:          [TIMEOUT][72] ([i915#1692]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8403/shard-apl4/igt@testdisplay.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4524/shard-apl2/igt@testdisplay.html
    - shard-kbl:          [TIMEOUT][74] ([i915#1692]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8403/shard-kbl1/igt@testdisplay.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4524/shard-kbl4/igt@testdisplay.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc6-dpms:
    - shard-kbl:          [FAIL][76] ([i915#454]) -> [FAIL][77] ([i915#454] / [i915#93] / [i915#95])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8403/shard-kbl1/igt@i915_pm_dc@dc6-dpms.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4524/shard-kbl6/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [SKIP][78] ([i915#468]) -> [FAIL][79] ([i915#454]) +1 similar issue
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8403/shard-tglb2/igt@i915_pm_dc@dc6-psr.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4524/shard-tglb7/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_content_protection@uevent:
    - shard-apl:          [FAIL][80] ([i915#357]) -> [FAIL][81] ([i915#357] / [i915#95])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8403/shard-apl3/igt@kms_content_protection@uevent.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4524/shard-apl2/igt@kms_content_protection@uevent.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-kbl:          [FAIL][82] ([i915#64]) -> [FAIL][83] ([i915#93] / [i915#95])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8403/shard-kbl6/igt@kms_fbcon_fbt@fbc.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4524/shard-kbl1/igt@kms_fbcon_fbt@fbc.html
    - shard-apl:          [FAIL][84] ([i915#1525]) -> [FAIL][85] ([i915#95])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8403/shard-apl8/igt@kms_fbcon_fbt@fbc.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4524/shard-apl4/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-kbl:          [DMESG-FAIL][86] ([i915#180] / [i915#95]) -> [FAIL][87] ([i915#93] / [i915#95])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8403/shard-kbl6/igt@kms_fbcon_fbt@fbc-suspend.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4524/shard-kbl1/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:
    - shard-apl:          [FAIL][88] ([fdo#108145] / [i915#265] / [i915#95]) -> [FAIL][89] ([fdo#108145] / [i915#265])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8403/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4524/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
    - shard-apl:          [FAIL][90] ([fdo#108145] / [i915#265]) -> [FAIL][91] ([fdo#108145] / [i915#265] / [i915#95])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8403/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4524/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max:
    - shard-kbl:          [FAIL][92] ([fdo#108145] / [i915#265]) -> [FAIL][93] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95]) +1 similar issue
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8403/shard-kbl6/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4524/shard-kbl7/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [FAIL][94] ([i915#31] / [i915#93] / [i915#95]) -> [FAIL][95] ([i915#31])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8403/shard-kbl6/igt@kms_setmode@basic.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4524/shard-kbl3/igt@kms_setmode@basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#5]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/5
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [i915#1031]: https://gitlab.freedesktop.org/drm/intel/issues/1031
  [i915#151]: https://gitlab.freedesktop.org/drm/intel/issues/151
  [i915#1525]: https://gitlab.freedesktop.org/drm/intel/issues/1525
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#1566]: https://gitlab.freedesktop.org/drm/intel/issues/1566
  [i915#1692]: https://gitlab.freedesktop.org/drm/intel/issues/1692
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#357]: https://gitlab.freedesktop.org/drm/intel/issues/357
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#64]: https://gitlab.freedesktop.org/drm/intel/issues/64
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5619 -> IGTPW_4524
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8403: 09978e99929f6e5acfe1e959f6499a134f210887 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4524: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4524/index.html
  IGT_5619: 94de923ca8d4cc8f532b8062d87aaad9da6ef956 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4524/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
