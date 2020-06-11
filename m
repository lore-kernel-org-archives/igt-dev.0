Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 11 Jun 2020 11:07:32 -0000
Message-ID: <159187365275.22714.5159749561220653408@emeril.freedesktop.org>
References: <20200610193724.16436-1-mohammed.khajapasha@intel.com>
In-Reply-To: <20200610193724.16436-1-mohammed.khajapasha@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaS1nLXQg?=
 =?utf-8?q?1/1=5D_lib/igt=5Fkms=3A_Add_support_for_display_with_non-contig?=
 =?utf-8?q?uous_pipes?=
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
To: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: i-g-t 1/1] lib/igt_kms: Add support for display with non-contiguous pipes
URL   : https://patchwork.freedesktop.org/series/78198/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8611_full -> IGTPW_4664_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4664_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4664_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4664/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4664_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_atomic_transition@1x-modeset-transitions-nonblocking:
    - shard-apl:          NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4664/shard-apl6/igt@kms_atomic_transition@1x-modeset-transitions-nonblocking.html
    - shard-tglb:         NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4664/shard-tglb2/igt@kms_atomic_transition@1x-modeset-transitions-nonblocking.html
    - shard-snb:          NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4664/shard-snb1/igt@kms_atomic_transition@1x-modeset-transitions-nonblocking.html
    - shard-kbl:          NOTRUN -> [FAIL][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4664/shard-kbl1/igt@kms_atomic_transition@1x-modeset-transitions-nonblocking.html
    - shard-iclb:         NOTRUN -> [FAIL][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4664/shard-iclb5/igt@kms_atomic_transition@1x-modeset-transitions-nonblocking.html
    - shard-hsw:          NOTRUN -> [FAIL][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4664/shard-hsw1/igt@kms_atomic_transition@1x-modeset-transitions-nonblocking.html

  * igt@kms_atomic_transition@1x-modeset-transitions-nonblocking-fencing:
    - shard-snb:          [PASS][7] -> [FAIL][8] +12 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8611/shard-snb6/igt@kms_atomic_transition@1x-modeset-transitions-nonblocking-fencing.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4664/shard-snb1/igt@kms_atomic_transition@1x-modeset-transitions-nonblocking-fencing.html

  * igt@kms_cursor_legacy@all-pipes-forked-bo:
    - shard-glk:          [PASS][9] -> [FAIL][10] +14 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8611/shard-glk7/igt@kms_cursor_legacy@all-pipes-forked-bo.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4664/shard-glk8/igt@kms_cursor_legacy@all-pipes-forked-bo.html
    - shard-iclb:         [PASS][11] -> [FAIL][12] +11 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8611/shard-iclb1/igt@kms_cursor_legacy@all-pipes-forked-bo.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4664/shard-iclb2/igt@kms_cursor_legacy@all-pipes-forked-bo.html

  * igt@kms_cursor_legacy@all-pipes-single-move:
    - shard-tglb:         [PASS][13] -> [FAIL][14] +12 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8611/shard-tglb8/igt@kms_cursor_legacy@all-pipes-single-move.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4664/shard-tglb1/igt@kms_cursor_legacy@all-pipes-single-move.html
    - shard-hsw:          [PASS][15] -> [FAIL][16] +16 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8611/shard-hsw6/igt@kms_cursor_legacy@all-pipes-single-move.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4664/shard-hsw8/igt@kms_cursor_legacy@all-pipes-single-move.html

  * igt@kms_cursor_legacy@all-pipes-torture-bo:
    - shard-kbl:          [PASS][17] -> [FAIL][18] +11 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8611/shard-kbl6/igt@kms_cursor_legacy@all-pipes-torture-bo.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4664/shard-kbl4/igt@kms_cursor_legacy@all-pipes-torture-bo.html

  * igt@kms_cursor_legacy@pipe-d-forked-move:
    - shard-glk:          NOTRUN -> [FAIL][19] +2 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4664/shard-glk4/igt@kms_cursor_legacy@pipe-d-forked-move.html

  * igt@kms_lease@lease_unleased_crtc:
    - shard-apl:          [PASS][20] -> [FAIL][21] +11 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8611/shard-apl6/igt@kms_lease@lease_unleased_crtc.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4664/shard-apl2/igt@kms_lease@lease_unleased_crtc.html

  
#### Warnings ####

  * igt@kms_cursor_legacy@pipe-d-forked-move:
    - shard-apl:          [SKIP][22] ([fdo#109271]) -> [FAIL][23] +5 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8611/shard-apl8/igt@kms_cursor_legacy@pipe-d-forked-move.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4664/shard-apl8/igt@kms_cursor_legacy@pipe-d-forked-move.html

  * igt@kms_cursor_legacy@pipe-d-single-bo:
    - shard-glk:          [SKIP][24] ([fdo#109271]) -> [FAIL][25] +4 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8611/shard-glk2/igt@kms_cursor_legacy@pipe-d-single-bo.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4664/shard-glk2/igt@kms_cursor_legacy@pipe-d-single-bo.html
    - shard-hsw:          [SKIP][26] ([fdo#109271]) -> [FAIL][27] +5 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8611/shard-hsw1/igt@kms_cursor_legacy@pipe-d-single-bo.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4664/shard-hsw6/igt@kms_cursor_legacy@pipe-d-single-bo.html

  * igt@kms_cursor_legacy@pipe-d-single-move:
    - shard-iclb:         [SKIP][28] ([fdo#109278] / [fdo#112010]) -> [FAIL][29] +5 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8611/shard-iclb3/igt@kms_cursor_legacy@pipe-d-single-move.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4664/shard-iclb7/igt@kms_cursor_legacy@pipe-d-single-move.html
    - shard-kbl:          [SKIP][30] ([fdo#109271]) -> [FAIL][31] +5 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8611/shard-kbl3/igt@kms_cursor_legacy@pipe-d-single-move.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4664/shard-kbl3/igt@kms_cursor_legacy@pipe-d-single-move.html

  * igt@kms_cursor_legacy@pipe-d-torture-bo:
    - shard-snb:          [SKIP][32] ([fdo#109271]) -> [FAIL][33] +11 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8611/shard-snb5/igt@kms_cursor_legacy@pipe-d-torture-bo.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4664/shard-snb5/igt@kms_cursor_legacy@pipe-d-torture-bo.html

  
Known issues
------------

  Here are the changes found in IGTPW_4664_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_params@invalid-bsd1-flag-on-vebox:
    - shard-hsw:          [PASS][34] -> [TIMEOUT][35] ([i915#1958])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8611/shard-hsw4/igt@gem_exec_params@invalid-bsd1-flag-on-vebox.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4664/shard-hsw4/igt@gem_exec_params@invalid-bsd1-flag-on-vebox.html

  * igt@gem_exec_schedule@implicit-write-read@rcs0:
    - shard-snb:          [PASS][36] -> [INCOMPLETE][37] ([i915#82]) +1 similar issue
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8611/shard-snb5/igt@gem_exec_schedule@implicit-write-read@rcs0.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4664/shard-snb6/igt@gem_exec_schedule@implicit-write-read@rcs0.html

  * igt@gem_exec_whisper@basic-fds:
    - shard-glk:          [PASS][38] -> [DMESG-WARN][39] ([i915#118] / [i915#95])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8611/shard-glk6/igt@gem_exec_whisper@basic-fds.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4664/shard-glk8/igt@gem_exec_whisper@basic-fds.html

  * igt@gem_workarounds@suspend-resume:
    - shard-apl:          [PASS][40] -> [DMESG-WARN][41] ([i915#180]) +2 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8611/shard-apl2/igt@gem_workarounds@suspend-resume.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4664/shard-apl6/igt@gem_workarounds@suspend-resume.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [PASS][42] -> [DMESG-WARN][43] ([i915#1436] / [i915#716])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8611/shard-glk9/igt@gen9_exec_parse@allowed-all.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4664/shard-glk1/igt@gen9_exec_parse@allowed-all.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-0:
    - shard-glk:          [PASS][44] -> [DMESG-FAIL][45] ([i915#118] / [i915#95])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8611/shard-glk4/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4664/shard-glk8/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-0:
    - shard-glk:          [PASS][46] -> [DMESG-WARN][47] ([i915#1982])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8611/shard-glk6/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4664/shard-glk5/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html
    - shard-apl:          [PASS][48] -> [DMESG-WARN][49] ([i915#1982])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8611/shard-apl8/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4664/shard-apl2/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html

  * igt@kms_color@pipe-c-legacy-gamma-reset:
    - shard-tglb:         [PASS][50] -> [DMESG-WARN][51] ([i915#402]) +1 similar issue
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8611/shard-tglb5/igt@kms_color@pipe-c-legacy-gamma-reset.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4664/shard-tglb6/igt@kms_color@pipe-c-legacy-gamma-reset.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-onscreen:
    - shard-kbl:          [PASS][52] -> [DMESG-FAIL][53] ([i915#54] / [i915#95]) +1 similar issue
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8611/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-128x128-onscreen.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4664/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-128x128-onscreen.html

  * igt@kms_cursor_edge_walk@pipe-a-64x64-top-edge:
    - shard-apl:          [PASS][54] -> [DMESG-WARN][55] ([i915#95]) +35 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8611/shard-apl6/igt@kms_cursor_edge_walk@pipe-a-64x64-top-edge.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4664/shard-apl1/igt@kms_cursor_edge_walk@pipe-a-64x64-top-edge.html

  * igt@kms_cursor_edge_walk@pipe-b-256x256-right-edge:
    - shard-snb:          [PASS][56] -> [SKIP][57] ([fdo#109271]) +3 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8611/shard-snb1/igt@kms_cursor_edge_walk@pipe-b-256x256-right-edge.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4664/shard-snb6/igt@kms_cursor_edge_walk@pipe-b-256x256-right-edge.html

  * igt@kms_cursor_legacy@all-pipes-forked-bo:
    - shard-apl:          [PASS][58] -> [DMESG-FAIL][59] ([i915#95])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8611/shard-apl3/igt@kms_cursor_legacy@all-pipes-forked-bo.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4664/shard-apl1/igt@kms_cursor_legacy@all-pipes-forked-bo.html
    - shard-kbl:          [PASS][60] -> [DMESG-FAIL][61] ([i915#95])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8611/shard-kbl3/igt@kms_cursor_legacy@all-pipes-forked-bo.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4664/shard-kbl2/igt@kms_cursor_legacy@all-pipes-forked-bo.html

  * igt@kms_cursor_legacy@pipe-c-torture-move:
    - shard-hsw:          [PASS][62] -> [DMESG-WARN][63] ([i915#128])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8611/shard-hsw1/igt@kms_cursor_legacy@pipe-c-torture-move.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4664/shard-hsw4/igt@kms_cursor_legacy@pipe-c-torture-move.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled:
    - shard-apl:          [PASS][64] -> [DMESG-FAIL][65] ([i915#54] / [i915#95])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8611/shard-apl2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4664/shard-apl2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [PASS][66] -> [FAIL][67] ([i915#1525])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8611/shard-apl6/igt@kms_fbcon_fbt@fbc-suspend.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4664/shard-apl4/igt@kms_fbcon_fbt@fbc-suspend.html
    - shard-kbl:          [PASS][68] -> [FAIL][69] ([i915#64])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8611/shard-kbl1/igt@kms_fbcon_fbt@fbc-suspend.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4664/shard-kbl7/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-flip-vs-suspend@bc-vga1-hdmi-a1:
    - shard-hsw:          [PASS][70] -> [INCOMPLETE][71] ([i915#61]) +1 similar issue
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8611/shard-hsw6/igt@kms_flip@2x-flip-vs-suspend@bc-vga1-hdmi-a1.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4664/shard-hsw1/igt@kms_flip@2x-flip-vs-suspend@bc-vga1-hdmi-a1.html

  * igt@kms_flip@2x-plain-flip-fb-recreate@ac-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][72] -> [FAIL][73] ([i915#1928]) +1 similar issue
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8611/shard-glk2/igt@kms_flip@2x-plain-flip-fb-recreate@ac-hdmi-a1-hdmi-a2.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4664/shard-glk5/igt@kms_flip@2x-plain-flip-fb-recreate@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt:
    - shard-iclb:         [PASS][74] -> [DMESG-WARN][75] ([i915#1982])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8611/shard-iclb1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4664/shard-iclb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render:
    - shard-tglb:         [PASS][76] -> [DMESG-WARN][77] ([i915#1982]) +1 similar issue
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8611/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4664/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-suspend:
    - shard-iclb:         [PASS][78] -> [INCOMPLETE][79] ([i915#1185] / [i915#123])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8611/shard-iclb1/igt@kms_frontbuffer_tracking@psr-suspend.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4664/shard-iclb3/igt@kms_frontbuffer_tracking@psr-suspend.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-iclb:         [PASS][80] -> [SKIP][81] ([i915#433])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8611/shard-iclb3/igt@kms_hdmi_inject@inject-audio.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4664/shard-iclb4/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane_cursor@pipe-b-primary-size-256:
    - shard-kbl:          [PASS][82] -> [DMESG-WARN][83] ([i915#1982])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8611/shard-kbl2/igt@kms_plane_cursor@pipe-b-primary-size-256.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4664/shard-kbl1/igt@kms_plane_cursor@pipe-b-primary-size-256.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [PASS][84] -> [SKIP][85] ([fdo#109441]) +2 similar issues
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8611/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4664/shard-iclb4/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@kms_pwrite_crc:
    - shard-kbl:          [PASS][86] -> [DMESG-WARN][87] ([i915#93] / [i915#95]) +52 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8611/shard-kbl4/igt@kms_pwrite_crc.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4664/shard-kbl1/igt@kms_pwrite_crc.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [PASS][88] -> [DMESG-WARN][89] ([i915#180]) +2 similar issues
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8611/shard-kbl1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4664/shard-kbl6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@perf@blocking-parameterized:
    - shard-hsw:          [PASS][90] -> [FAIL][91] ([i915#1542])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8611/shard-hsw2/igt@perf@blocking-parameterized.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4664/shard-hsw6/igt@perf@blocking-parameterized.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@preservation-s3@vecs0:
    - shard-kbl:          [DMESG-WARN][92] ([i915#180]) -> [PASS][93] +2 similar issues
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8611/shard-kbl6/igt@gem_ctx_isolation@preservation-s3@vecs0.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4664/shard-kbl4/igt@gem_ctx_isolation@preservation-s3@vecs0.html

  * igt@gem_ctx_shared@disjoint-timelines:
    - shard-kbl:          [DMESG-WARN][94] ([i915#93] / [i915#95]) -> [PASS][95] +50 similar issues
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8611/shard-kbl6/igt@gem_ctx_shared@disjoint-timelines.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4664/shard-kbl7/igt@gem_ctx_shared@disjoint-timelines.html

  * igt@gem_exec_balancer@sliced:
    - shard-tglb:         [TIMEOUT][96] ([i915#1936]) -> [PASS][97]
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8611/shard-tglb5/igt@gem_exec_balancer@sliced.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4664/shard-tglb6/igt@gem_exec_balancer@sliced.html

  * igt@gem_exec_reloc@basic-wc-cpu-active:
    - shard-apl:          [DMESG-WARN][98] ([i915#95]) -> [PASS][99] +28 similar issues
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8611/shard-apl4/igt@gem_exec_reloc@basic-wc-cpu-active.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4664/shard-apl8/igt@gem_exec_reloc@basic-wc-cpu-active.html

  * igt@gem_exec_schedule@implicit-read-write@rcs0:
    - shard-snb:          [INCOMPLETE][100] ([i915#82]) -> [PASS][101]
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8611/shard-snb2/igt@gem_exec_schedule@implicit-read-write@rcs0.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4664/shard-snb1/igt@gem_exec_schedule@implicit-read-write@rcs0.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][102] ([i915#1899]) -> [PASS][103]
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8611/shard-iclb6/igt@i915_pm_dc@dc6-psr.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4664/shard-iclb2/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_suspend@debugfs-reader:
    - shard-kbl:          [FAIL][104] ([fdo#103375]) -> [PASS][105]
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8611/shard-kbl7/igt@i915_suspend@debugfs-reader.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4664/shard-kbl6/igt@i915_suspend@debugfs-reader.html

  * igt@kms_addfb_basic@bad-pitch-32:
    - shard-hsw:          [TIMEOUT][106] ([i915#1958]) -> [PASS][107] +1 similar issue
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8611/shard-hsw2/igt@kms_addfb_basic@bad-pitch-32.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4664/shard-hsw4/igt@kms_addfb_basic@bad-pitch-32.html
    - shard-snb:          [TIMEOUT][108] ([i915#1958]) -> [PASS][109] +1 similar issue
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8611/shard-snb2/igt@kms_addfb_basic@bad-pitch-32.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4664/shard-snb2/igt@kms_addfb_basic@bad-pitch-32.html

  * igt@kms_big_fb@linear-8bpp-rotate-180:
    - shard-apl:          [DMESG-WARN][110] ([i915#1982]) -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8611/shard-apl7/igt@kms_big_fb@linear-8bpp-rotate-180.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4664/shard-apl7/igt@kms_big_fb@linear-8bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-glk:          [DMESG-FAIL][112] ([i915#118] / [i915#95]) -> [PASS][113] +1 similar issue
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8611/shard-glk8/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4664/shard-glk9/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen:
    - shard-kbl:          [DMESG-FAIL][114] ([i915#54] / [i915#95]) -> [PASS][115]
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8611/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4664/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html

  * igt@kms_cursor_legacy@pipe-b-torture-move:
    - shard-tglb:         [DMESG-WARN][116] ([i915#128]) -> [PASS][117]
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8611/shard-tglb2/igt@kms_cursor_legacy@pipe-b-torture-move.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4664/shard-tglb7/igt@kms_cursor_legacy@pipe-b-torture-move.html

  * igt@kms_draw_crc@draw-method-xrgb8888-render-xtiled:
    - shard-apl:          [DMESG-FAIL][118] ([i915#54] / [i915#95]) -> [PASS][119]
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8611/shard-apl1/igt@kms_draw_crc@draw-method-xrgb8888-render-xtiled.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4664/shard-apl4/igt@kms_draw_crc@draw-method-xrgb8888-render-xtiled.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
    - shard-iclb:         [FAIL][120] ([i915#79]) -> [PASS][121]
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8611/shard-iclb7/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4664/shard-iclb1/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html

  * igt@kms_flip@plain-flip-ts-check@a-dp1:
    - shard-kbl:          [DMESG-WARN][122] ([i915#1982]) -> [PASS][123] +1 similar issue
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8611/shard-kbl4/igt@kms_flip@plain-flip-ts-check@a-dp1.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4664/shard-kbl7/igt@kms_flip@plain-flip-ts-check@a-dp1.html

  * igt@kms_flip_tiling@flip-changes-tiling-yf:
    - shard-kbl:          [DMESG-FAIL][124] ([i915#95]) -> [PASS][125] +1 similar issue
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8611/shard-kbl2/igt@kms_flip_tiling@flip-changes-tiling-yf.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4664/shard-kbl4/igt@kms_flip_tiling@flip-changes-tiling-yf.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [INCOMPLETE][126] ([i915#155]) -> [PASS][127]
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8611/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4664/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:
    - shard-glk:          [DMESG-WARN][128] ([i915#1982]) -> [PASS][129]
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8611/shard-glk8/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4664/shard-glk4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-64:
    - shard-apl:          [DMESG-FAIL][130] ([i915#95]) -> [PASS][131] +1 similar issue
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8611/shard-apl3/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4664/shard-apl4/igt@kms_plane_cursor@pipe-a-viewport-size-64.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-tglb:         [SKIP][132] ([i915#1911]) -> [PASS][133]
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8611/shard-tglb5/igt@kms_psr2_su@frontbuffer.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4664/shard-tglb3/igt@kms_psr2_su@frontbuffer.html
    - shard-iclb:         [SKIP][134] ([fdo#109642] / [fdo#111068]) -> [PASS][135]
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8611/shard-iclb7/igt@kms_psr2_su@frontbuffer.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4664/shard-iclb2/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [FAIL][136] ([i915#173]) -> [PASS][137]
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8611/shard-iclb1/igt@kms_psr@no_drrs.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4664/shard-iclb4/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [SKIP][138] ([fdo#109441]) -> [PASS][139] +1 similar issue
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8611/shard-iclb6/igt@kms_psr@psr2_cursor_render.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4664/shard-iclb2/igt@kms_psr@psr2_cursor_render.html

  * igt@perf_pmu@module-unload:
    - shard-iclb:         [DMESG-WARN][140] ([i915#1982]) -> [PASS][141]
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8611/shard-iclb5/igt@perf_pmu@module-unload.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4664/shard-iclb4/igt@perf_pmu@module-unload.html

  * igt@perf_pmu@other-init-3:
    - shard-tglb:         [DMESG-WARN][142] ([i915#402]) -> [PASS][143] +1 similar issue
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8611/shard-tglb6/igt@perf_pmu@other-init-3.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4664/shard-tglb7/igt@perf_pmu@other-init-3.html

  * igt@syncobj_basic@test-valid-cycle:
    - shard-glk:          [TIMEOUT][144] ([i915#1958]) -> [PASS][145] +1 similar issue
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8611/shard-glk5/igt@syncobj_basic@test-valid-cycle.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4664/shard-glk7/igt@syncobj_basic@test-valid-cycle.html

  * igt@syncobj_wait@single-wait-all-for-submit-signaled:
    - shard-tglb:         [TIMEOUT][146] -> [PASS][147] +2 similar issues
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8611/shard-tglb5/igt@syncobj_wait@single-wait-all-for-submit-signaled.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4664/shard-tglb6/igt@syncobj_wait@single-wait-all-for-submit-signaled.html

  
#### Warnings ####

  * igt@gem_exec_reloc@basic-concurrent16:
    - shard-snb:          [TIMEOUT][148] ([i915#1958]) -> [FAIL][149] ([i915#1930])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8611/shard-snb2/igt@gem_exec_reloc@basic-concurrent16.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4664/shard-snb2/igt@gem_exec_reloc@basic-concurrent16.html

  * igt@i915_pm_backlight@basic-brightness:
    - shard-hsw:          [SKIP][150] ([fdo#109271]) -> [TIMEOUT][151] ([i915#1958]) +2 similar issues
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8611/shard-hsw4/igt@i915_pm_backlight@basic-brightness.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4664/shard-hsw4/igt@i915_pm_backlight@basic-brightness.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [FAIL][152] ([i915#1899]) -> [FAIL][153] ([i915#454])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8611/shard-tglb8/igt@i915_pm_dc@dc6-psr.html
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4664/shard-tglb3/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         [FAIL][154] ([i915#1515]) -> [WARN][155] ([i915#1515])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8611/shard-iclb2/igt@i915_pm_rc6_residency@rc6-idle.html
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4664/shard-iclb6/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@kms_busy@basic-flip-pipe-d:
    - shard-hsw:          [TIMEOUT][156] ([i915#1958]) -> [SKIP][157] ([fdo#109271]) +1 similar issue
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8611/shard-hsw2/igt@kms_busy@basic-flip-pipe-d.html
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4664/shard-hsw6/igt@kms_busy@basic-flip-pipe-d.html
    - shard-glk:          [TIMEOUT][158] ([i915#1958]) -> [SKIP][159] ([fdo#109271]) +1 similar issue
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8611/shard-glk5/igt@kms_busy@basic-flip-pipe-d.html
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4664/shard-glk4/igt@kms_busy@basic-flip-pipe-d.html

  * igt@kms_color@pipe-d-ctm-0-25:
    - shard-iclb:         [SKIP][160] ([fdo#109278] / [fdo#112010] / [i915#1149]) -> [SKIP][161] ([fdo#109278] / [i915#1149]) +9 similar issues
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8611/shard-iclb1/igt@kms_color@pipe-d-ctm-0-25.html
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4664/shard-iclb6/igt@kms_color@pipe-d-ctm-0-25.html

  * igt@kms_content_protection@atomic:
    - shard-kbl:          [TIMEOUT][162] ([i915#1319]) -> [TIMEOUT][163] ([i915#1319] / [i915#1958])
   [162]: https://intel-g

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4664/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
