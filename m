Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 23 Nov 2020 11:02:21 -0000
Message-ID: <160612934182.16916.5233309274912269448@emeril.freedesktop.org>
References: <20201120105217.5058-1-tzimmermann@suse.de>
In-Reply-To: <20201120105217.5058-1-tzimmermann@suse.de>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgVGVzdCBj?=
 =?utf-8?q?ases_for_fbdev?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0817687916=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0817687916==
Content-Type: multipart/alternative;
 boundary="===============6863105356392098592=="

--===============6863105356392098592==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Test cases for fbdev
URL   : https://patchwork.freedesktop.org/series/84103/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9369_full -> IGTPW_5201_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5201/index.html

New tests
---------

  New tests have been introduced between CI_DRM_9369_full and IGTPW_5201_full:

### New IGT tests (6) ###

  * igt@fbdev@eof:
    - Statuses : 7 pass(s)
    - Exec time: [0.0] s

  * igt@fbdev@nullptr:
    - Statuses : 7 pass(s)
    - Exec time: [0.0] s

  * igt@fbdev@read:
    - Statuses : 7 pass(s)
    - Exec time: [0.07, 0.75] s

  * igt@fbdev@unaligned-read:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.02] s

  * igt@fbdev@unaligned-write:
    - Statuses : 7 pass(s)
    - Exec time: [0.02, 0.20] s

  * igt@fbdev@write:
    - Statuses : 7 pass(s)
    - Exec time: [0.04, 0.41] s

  

Known issues
------------

  Here are the changes found in IGTPW_5201_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_whisper@basic-queues-priority:
    - shard-glk:          [PASS][1] -> [DMESG-WARN][2] ([i915#118] / [i915#95])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9369/shard-glk6/igt@gem_exec_whisper@basic-queues-priority.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5201/shard-glk2/igt@gem_exec_whisper@basic-queues-priority.html

  * igt@i915_pm_rc6_residency@rc6-accuracy:
    - shard-iclb:         [PASS][3] -> [DMESG-WARN][4] ([i915#1982])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9369/shard-iclb3/igt@i915_pm_rc6_residency@rc6-accuracy.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5201/shard-iclb2/igt@i915_pm_rc6_residency@rc6-accuracy.html

  * igt@i915_pm_rpm@modeset-non-lpsp:
    - shard-apl:          [PASS][5] -> [SKIP][6] ([fdo#109271] / [i915#1635])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9369/shard-apl4/igt@i915_pm_rpm@modeset-non-lpsp.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5201/shard-apl1/igt@i915_pm_rpm@modeset-non-lpsp.html
    - shard-glk:          [PASS][7] -> [SKIP][8] ([fdo#109271])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9369/shard-glk4/igt@i915_pm_rpm@modeset-non-lpsp.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5201/shard-glk2/igt@i915_pm_rpm@modeset-non-lpsp.html
    - shard-hsw:          [PASS][9] -> [SKIP][10] ([fdo#109271])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9369/shard-hsw7/igt@i915_pm_rpm@modeset-non-lpsp.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5201/shard-hsw6/igt@i915_pm_rpm@modeset-non-lpsp.html
    - shard-kbl:          [PASS][11] -> [SKIP][12] ([fdo#109271])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9369/shard-kbl7/igt@i915_pm_rpm@modeset-non-lpsp.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5201/shard-kbl1/igt@i915_pm_rpm@modeset-non-lpsp.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-glk:          [PASS][13] -> [FAIL][14] ([i915#1119])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9369/shard-glk4/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5201/shard-glk9/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_cursor_edge_walk@pipe-a-64x64-bottom-edge:
    - shard-glk:          [PASS][15] -> [DMESG-WARN][16] ([i915#1982]) +3 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9369/shard-glk6/igt@kms_cursor_edge_walk@pipe-a-64x64-bottom-edge.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5201/shard-glk9/igt@kms_cursor_edge_walk@pipe-a-64x64-bottom-edge.html

  * igt@kms_cursor_edge_walk@pipe-c-64x64-left-edge:
    - shard-hsw:          [PASS][17] -> [DMESG-WARN][18] ([i915#1982]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9369/shard-hsw8/igt@kms_cursor_edge_walk@pipe-c-64x64-left-edge.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5201/shard-hsw1/igt@kms_cursor_edge_walk@pipe-c-64x64-left-edge.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic:
    - shard-tglb:         [PASS][19] -> [FAIL][20] ([i915#2346])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9369/shard-tglb7/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5201/shard-tglb3/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
    - shard-tglb:         [PASS][21] -> [FAIL][22] ([i915#2598])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9369/shard-tglb2/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5201/shard-tglb3/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt:
    - shard-kbl:          [PASS][23] -> [DMESG-WARN][24] ([i915#1982]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9369/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5201/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
    - shard-apl:          [PASS][25] -> [DMESG-WARN][26] ([i915#1635] / [i915#1982]) +2 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9369/shard-apl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5201/shard-apl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff:
    - shard-iclb:         [PASS][27] -> [FAIL][28] ([i915#49])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9369/shard-iclb3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5201/shard-iclb5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu:
    - shard-tglb:         [PASS][29] -> [DMESG-WARN][30] ([i915#1982]) +2 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9369/shard-tglb3/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5201/shard-tglb2/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu.html

  * igt@kms_plane_lowres@pipe-a-tiling-none:
    - shard-kbl:          [PASS][31] -> [DMESG-WARN][32] ([i915#165] / [i915#78])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9369/shard-kbl6/igt@kms_plane_lowres@pipe-a-tiling-none.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5201/shard-kbl2/igt@kms_plane_lowres@pipe-a-tiling-none.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][33] -> [SKIP][34] ([fdo#109441]) +4 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9369/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5201/shard-iclb1/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend:
    - shard-iclb:         [PASS][35] -> [INCOMPLETE][36] ([i915#1185] / [i915#2405])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9369/shard-iclb8/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5201/shard-iclb3/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
    - shard-kbl:          [PASS][37] -> [INCOMPLETE][38] ([i915#155] / [i915#2405])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9369/shard-kbl6/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5201/shard-kbl3/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
    - shard-hsw:          [PASS][39] -> [INCOMPLETE][40] ([i915#2405] / [i915#2637])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9369/shard-hsw7/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5201/shard-hsw5/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
    - shard-glk:          [PASS][41] -> [INCOMPLETE][42] ([i915#2405] / [i915#2635])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9369/shard-glk4/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5201/shard-glk5/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
    - shard-apl:          [PASS][43] -> [INCOMPLETE][44] ([i915#1635] / [i915#2405] / [i915#2635])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9369/shard-apl8/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5201/shard-apl3/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html

  * igt@prime_vgem@sync@rcs0:
    - shard-tglb:         [PASS][45] -> [INCOMPLETE][46] ([i915#409])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9369/shard-tglb2/igt@prime_vgem@sync@rcs0.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5201/shard-tglb6/igt@prime_vgem@sync@rcs0.html

  
#### Possible fixes ####

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][47] ([i915#454]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9369/shard-iclb2/igt@i915_pm_dc@dc6-psr.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5201/shard-iclb1/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-hsw:          [SKIP][49] ([fdo#109271]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9369/shard-hsw8/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5201/shard-hsw2/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
    - shard-kbl:          [SKIP][51] ([fdo#109271]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9369/shard-kbl3/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5201/shard-kbl4/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
    - shard-apl:          [SKIP][53] ([fdo#109271] / [i915#1635]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9369/shard-apl7/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5201/shard-apl7/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
    - shard-glk:          [SKIP][55] ([fdo#109271]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9369/shard-glk8/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5201/shard-glk8/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html

  * {igt@kms_async_flips@test-time-stamp}:
    - shard-tglb:         [FAIL][57] ([i915#2597]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9369/shard-tglb5/igt@kms_async_flips@test-time-stamp.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5201/shard-tglb6/igt@kms_async_flips@test-time-stamp.html

  * igt@kms_cursor_edge_walk@pipe-b-256x256-top-edge:
    - shard-glk:          [DMESG-WARN][59] ([i915#1982]) -> [PASS][60] +5 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9369/shard-glk3/igt@kms_cursor_edge_walk@pipe-b-256x256-top-edge.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5201/shard-glk3/igt@kms_cursor_edge_walk@pipe-b-256x256-top-edge.html
    - shard-apl:          [DMESG-WARN][61] ([i915#1635] / [i915#1982]) -> [PASS][62] +4 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9369/shard-apl4/igt@kms_cursor_edge_walk@pipe-b-256x256-top-edge.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5201/shard-apl2/igt@kms_cursor_edge_walk@pipe-b-256x256-top-edge.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-hsw:          [FAIL][63] ([i915#96]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9369/shard-hsw8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5201/shard-hsw1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:
    - shard-hsw:          [FAIL][65] ([i915#2295] / [i915#2370]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9369/shard-hsw8/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5201/shard-hsw2/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursor-vs-flip-varying-size:
    - shard-hsw:          [FAIL][67] ([i915#2370]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9369/shard-hsw6/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5201/shard-hsw6/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-vga1-hdmi-a1:
    - shard-hsw:          [DMESG-WARN][69] ([i915#1982]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9369/shard-hsw6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-vga1-hdmi-a1.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5201/shard-hsw5/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-vga1-hdmi-a1.html

  * igt@kms_flip@2x-plain-flip-fb-recreate@bc-hdmi-a1-hdmi-a2:
    - shard-glk:          [FAIL][71] ([i915#2122]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9369/shard-glk4/igt@kms_flip@2x-plain-flip-fb-recreate@bc-hdmi-a1-hdmi-a2.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5201/shard-glk5/igt@kms_flip@2x-plain-flip-fb-recreate@bc-hdmi-a1-hdmi-a2.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-msflip-blt:
    - shard-tglb:         [DMESG-WARN][73] ([i915#1982]) -> [PASS][74] +3 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9369/shard-tglb3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-msflip-blt.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5201/shard-tglb7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_psr@psr2_sprite_render:
    - shard-iclb:         [SKIP][75] ([fdo#109441]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9369/shard-iclb3/igt@kms_psr@psr2_sprite_render.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5201/shard-iclb2/igt@kms_psr@psr2_sprite_render.html

  * igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend:
    - shard-hsw:          [INCOMPLETE][77] ([i915#2637]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9369/shard-hsw8/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5201/shard-hsw8/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html
    - shard-kbl:          [INCOMPLETE][79] ([i915#155]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9369/shard-kbl3/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5201/shard-kbl4/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html
    - shard-iclb:         [INCOMPLETE][81] ([i915#1185]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9369/shard-iclb5/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5201/shard-iclb6/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html
    - shard-apl:          [INCOMPLETE][83] ([i915#1635] / [i915#2635]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9369/shard-apl7/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5201/shard-apl2/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html
    - shard-glk:          [INCOMPLETE][85] ([i915#2635]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9369/shard-glk8/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5201/shard-glk3/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html

  * igt@kms_vblank@pipe-b-wait-forked-busy:
    - shard-kbl:          [DMESG-WARN][87] ([i915#1982]) -> [PASS][88] +7 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9369/shard-kbl3/igt@kms_vblank@pipe-b-wait-forked-busy.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5201/shard-kbl2/igt@kms_vblank@pipe-b-wait-forked-busy.html

  * igt@perf_pmu@module-unload:
    - shard-tglb:         [DMESG-WARN][89] ([i915#1982] / [i915#262]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9369/shard-tglb5/igt@perf_pmu@module-unload.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5201/shard-tglb8/igt@perf_pmu@module-unload.html

  
#### Warnings ####

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-iclb:         [WARN][91] ([i915#2684]) -> [WARN][92] ([i915#1804] / [i915#2684])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9369/shard-iclb3/igt@i915_pm_rc6_residency@rc6-fence.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5201/shard-iclb6/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         [WARN][93] -> [WARN][94] ([i915#1804])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9369/shard-iclb5/igt@i915_pm_rc6_residency@rc6-idle.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5201/shard-iclb3/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-tglb:         [SKIP][95] ([i915#579]) -> [SKIP][96] ([fdo#111644] / [i915#1397] / [i915#2411])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9369/shard-tglb3/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5201/shard-tglb2/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
    - shard-iclb:         [SKIP][97] ([i915#579]) -> [SKIP][98] ([fdo#110892])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9369/shard-iclb5/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5201/shard-iclb2/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@i915_pm_rpm@modeset-non-lpsp:
    - shard-iclb:         [SKIP][99] ([fdo#110892]) -> [SKIP][100] ([i915#579])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9369/shard-iclb3/igt@i915_pm_rpm@modeset-non-lpsp.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5201/shard-iclb7/igt@i915_pm_rpm@modeset-non-lpsp.html
    - shard-tglb:         [SKIP][101] ([fdo#111644] / [i915#1397] / [i915#2411]) -> [SKIP][102] ([i915#579])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9369/shard-tglb1/igt@i915_pm_rpm@modeset-non-lpsp.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5201/shard-tglb3/igt@i915_pm_rpm@modeset-non-lpsp.html

  * igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend:
    - shard-tglb:         [INCOMPLETE][103] ([i915#1436] / [i915#1602] / [i915#1798] / [i915#1887] / [i915#1982] / [i915#2411] / [i915#456]) -> [DMESG-WARN][104] ([i915#2411])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9369/shard-tglb3/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5201/shard-tglb6/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html

  * igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend:
    - shard-tglb:         [DMESG-WARN][105] ([i915#2411]) -> [INCOMPLETE][106] ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2411] / [i915#456])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9369/shard-tglb2/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5201/shard-tglb1/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html

  * igt@kms_vblank@pipe-d-ts-continuation-dpms-rpm:
    - shard-tglb:         [DMESG-WARN][107] ([i915#2411]) -> [SKIP][108] ([i915#2648])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9369/shard-tglb2/igt@kms_vblank@pipe-d-ts-continuation-dpms-rpm.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5201/shard-tglb1/igt@kms_vblank@pipe-d-ts-continuation-dpms-rpm.html

  * igt@runner@aborted:
    - shard-kbl:          [FAIL][109] ([i915#2295] / [i915#483]) -> [FAIL][110] ([i915#2295])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9369/shard-kbl2/igt@runner@aborted.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5201/shard-kbl7/igt@runner@aborted.html
    - shard-iclb:         ([FAIL][111], [FAIL][112]) ([i915#1814] / [i915#2295] / [i915#483]) -> ([FAIL][113], [FAIL][114]) ([i915#1814] / [i915#2295])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9369/shard-iclb8/igt@runner@aborted.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9369/shard-iclb5/igt@runner@aborted.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5201/shard-iclb3/igt@runner@aborted.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5201/shard-iclb4/igt@runner@aborted.html
    - shard-glk:          ([FAIL][115], [FAIL][116]) ([i915#1814] / [i915#2295] / [k.org#202321]) -> ([FAIL][117], [FAIL][118]) ([i915#1814] / [i915#2295] / [i915#483] / [k.org#202321])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9369/shard-glk6/igt@runner@aborted.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9369/shard-glk8/igt@runner@aborted.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5201/shard-glk7/igt@runner@aborted.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5201/shard-glk5/igt@runner@aborted.html
    - shard-tglb:         ([FAIL][119], [FAIL][120]) ([i915#1602] / [i915#2295]) -> ([FAIL][121], [FAIL][122], [FAIL][123]) ([i915#1602] / [i915#2295] / [i915#2426] / [i915#409])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9369/shard-tglb3/igt@runner@aborted.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9369/shard-tglb8/igt@runner@aborted.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5201/shard-tglb6/igt@runner@aborted.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5201/shard-tglb6/igt@runner@aborted.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5201/shard-tglb1/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110892]: https://bugs.freedesktop.org/show_bug.cgi?id=110892
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1185]: https://gitlab.freedesktop.org/drm/intel/issues/1185
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#165]: https://gitlab.freedesktop.org/drm/intel/issues/165
  [i915#1798]: https://gitlab.freedesktop.org/drm/intel/issues/1798
  [i915#1804]: https://gitlab.freedesktop.org/drm/intel/issues/1804
  [i915#1814]: https://gitlab.freedesktop.org/drm/intel/issues/1814
  [i915#1887]: https://gitlab.freedesktop.org/drm/intel/issues/1887
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#2295]: https://gitlab.freedesktop.org/drm/intel/issues/2295
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2370]: https://gitlab.freedesktop.org/drm/intel/issues/2370
  [i915#2405]: https://gitlab.freedesktop.org/drm/intel/issues/2405
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2426]: https://gitlab.freedesktop.org/drm/intel/issues/2426
  [i915#2597]: https://gitlab.freedesktop.org/drm/intel/issues/2597
  [i915#2598]: https://gitlab.freedesktop.org/drm/intel/issues/2598
  [i915#262]: https://gitlab.freedesktop.org/drm/intel/issues/262
  [i915#2635]: https://gitlab.freedesktop.org/drm/intel/issues/2635
  [i915#2637]: https://gitlab.freedesktop.org/drm/intel/issues/2637
  [i915#2641]: https://gitlab.freedesktop.org/drm/intel/issues/2641
  [i915#2648]: https://gitlab.freedesktop.org/drm/intel/issues/2648
  [i915#2684]: https://gitlab.freedesktop.org/drm/intel/issues/2684
  [i915#409]: https://gitlab.freedesktop.org/drm/intel/issues/409
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#483]: https://gitlab.freedesktop.org/drm/intel/issues/483
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#78]: https://gitlab.freedesktop.org/drm/intel/issues/78
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [i915#96]: https://gitlab.freedesktop.org/drm/intel/issues/96
  [k.org#202321]: https://bugzilla.kernel.org/show_bug.cgi?id=202321


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5863 -> IGTPW_5201
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_9369: 50eb41aa12d68d1fff634d5f09a8faba3e72b46b @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5201: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5201/index.html
  IGT_5863: 849de1780d33c6749e0a26dc3c642eb9b3d6cd42 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5201/index.html

--===============6863105356392098592==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


<!DOCTYPE html>
<html xmlns=3D"http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8"/>
  <title>Project List - Patchwork</title>
  <style id=3D"css-table-select" type=3D"text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>Test cases for fbdev</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/84103/">https://patchwork.freedesktop.org/series/84103/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5201/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5201/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9369_full -&gt; IGTPW_5201_full</h=
1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5201/index.=
html</p>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_9369_full and IGTPW_5201_f=
ull:</p>
<h3>New IGT tests (6)</h3>
<ul>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.07, 0.75] s</li>
</ul>
</li>
<li>
<p>igt@fbdev@unaligned-read:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.00, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@fbdev@unaligned-write:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.02, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.04, 0.41] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5201_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_whisper@basic-queues-priority:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9369/shard-glk6/igt@gem_exec_whisper@basic-queues-priority.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5201=
/shard-glk2/igt@gem_exec_whisper@basic-queues-priority.html">DMESG-WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/95">i915#9=
5</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-accuracy:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9369/shard-iclb3/igt@i915_pm_rc6_residency@rc6-accuracy.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5201/sh=
ard-iclb2/igt@i915_pm_rc6_residency@rc6-accuracy.html">DMESG-WARN</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)=
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9369/shard-apl4/igt@i915_pm_rpm@modeset-non-lpsp.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5201/shard-apl1=
/igt@i915_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href=3D"https://bugs.f=
reedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9369/shard-glk4/igt@i915_pm_rpm@modeset-non-lpsp.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5201/shard-glk2=
/igt@i915_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href=3D"https://bugs.f=
reedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9369/shard-hsw7/igt@i915_pm_rpm@modeset-non-lpsp.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5201/shard-hsw6=
/igt@i915_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href=3D"https://bugs.f=
reedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9369/shard-kbl7/igt@i915_pm_rpm@modeset-non-lpsp.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5201/shard-kbl1=
/igt@i915_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href=3D"https://bugs.f=
reedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-180:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9369/shard-glk4/igt@kms_big_fb@linear-64bpp-rotate-180.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5201/sha=
rd-glk9/igt@kms_big_fb@linear-64bpp-rotate-180.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/1119">i915#1119</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-a-64x64-bottom-edge:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9369/shard-glk6/igt@kms_cursor_edge_walk@pipe-a-64x64-bottom-edge.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5201/shard-glk9/igt@kms_cursor_edge_walk@pipe-a-64x64-bottom-edge.html">=
DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
1982">i915#1982</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-c-64x64-left-edge:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9369/shard-hsw8/igt@kms_cursor_edge_walk@pipe-c-64x64-left-edge.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5201/shard-hsw1/igt@kms_cursor_edge_walk@pipe-c-64x64-left-edge.html">DMES=
G-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982=
">i915#1982</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9369/shard-tglb7/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.ht=
ml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5201/shard-tglb3/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2346">i9=
15#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9369/shard-tglb2/igt@kms_flip@flip-vs-expired-vblank-interruptible@=
a-edp1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_5201/shard-tglb3/igt@kms_flip@flip-vs-expired-vblank-interruptib=
le@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/2598">i915#2598</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9369/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-in=
dfb-draw-blt.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_5201/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-1p-offscr=
en-pri-indfb-draw-blt.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/1982">i915#1982</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9369/shard-apl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-=
pgflip-blt.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_5201/shard-apl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn=
-indfb-pgflip-blt.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/1635">i915#1635</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/1982">i915#1982</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9369/shard-iclb3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-i=
ndfb-onoff.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_5201/shard-iclb5/igt@kms_frontbuffer_tracking@psr-1p-primscr=
n-spr-indfb-onoff.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/49">i915#49</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9369/shard-tglb3/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-=
cpu.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5201/shard-tglb2/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-=
cpu.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/1982">i915#1982</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-a-tiling-none:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9369/shard-kbl6/igt@kms_plane_lowres@pipe-a-tiling-none.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5201/sh=
ard-kbl2/igt@kms_plane_lowres@pipe-a-tiling-none.html">DMESG-WARN</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/165">i915#165</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/78">i915#78</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9369/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5201/shard-=
iclb1/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a> (<a href=3D"https:/=
/bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) +4 similar =
issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9369/shard-iclb8/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_5201/shard-iclb3/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/1185">i915#1185</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/2405">i915#2405</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9369/shard-kbl6/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5201/shard-kbl3/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html"=
>INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/155">i915#155</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/2405">i915#2405</a>)</p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9369/shard-hsw7/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5201/shard-hsw5/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html"=
>INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/2405">i915#2405</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/2637">i915#2637</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9369/shard-glk4/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5201/shard-glk5/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html"=
>INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/2405">i915#2405</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/2635">i915#2635</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9369/shard-apl8/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5201/shard-apl3/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html"=
>INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/1635">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/2405">i915#2405</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/2635">i915#2635</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@sync@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9369/shard-tglb2/igt@prime_vgem@sync@rcs0.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5201/shard-tglb6/igt@=
prime_vgem@sync@rcs0.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/409">i915#409</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9369/shard-iclb2/igt@i915_pm_dc@dc6-psr.html">FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5201/shard-iclb1/ig=
t@i915_pm_dc@dc6-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9369/shard-hsw8/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP<=
/a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#=
109271</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5201/shard-hsw2/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9369/shard-kbl3/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP<=
/a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#=
109271</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5201/shard-kbl4/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9369/shard-apl7/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP<=
/a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#=
109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/163=
5">i915#1635</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_5201/shard-apl7/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS<=
/a></p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9369/shard-glk8/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP<=
/a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#=
109271</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5201/shard-glk8/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_async_flips@test-time-stamp}:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9369/shard-tglb5/igt@kms_async_flips@test-time-stamp.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2597">i915#259=
7</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5201=
/shard-tglb6/igt@kms_async_flips@test-time-stamp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-b-256x256-top-edge:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9369/shard-glk3/igt@kms_cursor_edge_walk@pipe-b-256x256-top-edge.htm=
l">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_5201/shard-glk3/igt@kms_cursor_edge_walk@pipe-b-256x256-top-ed=
ge.html">PASS</a> +5 similar issues</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9369/shard-apl4/igt@kms_cursor_edge_walk@pipe-b-256x256-top-edge.htm=
l">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/1635">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5201/shard-apl2/igt@kms_cursor_edge_walk@pipe-b-256x256-=
top-edge.html">PASS</a> +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9369/shard-hsw8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/96">i915#96</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_5201/shard-hsw1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.=
html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9369/shard-hsw8/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transit=
ions-varying-size.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/2370">i915#2370</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_5201/shard-hsw2/igt@kms_cursor_legacy@cur=
sor-vs-flip-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-varying-size:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9369/shard-hsw6/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
370">i915#2370</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_5201/shard-hsw6/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.=
html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9369/shard-hsw6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-vga1-=
hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_5201/shard-hsw5/igt@kms_flip@2x-flip-vs-absolute-wf=
_vblank@ab-vga1-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate@bc-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9369/shard-glk4/igt@kms_flip@2x-plain-flip-fb-recreate@bc-hdmi-a1-h=
dmi-a2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/2122">i915#2122</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_5201/shard-glk5/igt@kms_flip@2x-plain-flip-fb-recreate@bc-=
hdmi-a1-hdmi-a2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9369/shard-tglb3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb=
-msflip-blt.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_5201/shard-tglb7/igt@kms_frontbuffer_tracking@p=
sr-1p-primscrn-indfb-msflip-blt.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_render:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9369/shard-iclb3/igt@kms_psr@psr2_sprite_render.html">SKIP</a> (<a =
href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5201/sh=
ard-iclb2/igt@kms_psr@psr2_sprite_render.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend:</p>
<ul>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9369/shard-hsw8/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.h=
tml">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/2637">i915#2637</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_5201/shard-hsw8/igt@kms_vblank@pipe-b-ts-continuation-dpms-s=
uspend.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9369/shard-kbl3/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.h=
tml">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/155">i915#155</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_5201/shard-kbl4/igt@kms_vblank@pipe-b-ts-continuation-dpms-sus=
pend.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9369/shard-iclb5/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.=
html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/1185">i915#1185</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_5201/shard-iclb6/igt@kms_vblank@pipe-b-ts-continuation-dpms=
-suspend.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9369/shard-apl7/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.h=
tml">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/1635">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/2635">i915#2635</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_5201/shard-apl2/igt@kms_vblank@pipe-b-ts-continuation-=
dpms-suspend.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9369/shard-glk8/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.h=
tml">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/2635">i915#2635</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_5201/shard-glk3/igt@kms_vblank@pipe-b-ts-continuation-dpms-s=
uspend.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-wait-forked-busy:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9369/shard-kbl3/igt@kms_vblank@pipe-b-wait-forked-busy.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982">=
i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_5201/shard-kbl2/igt@kms_vblank@pipe-b-wait-forked-busy.html">PASS</a> +=
7 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9369/shard-tglb5/igt@perf_pmu@module-unload.html">DMESG-WARN</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/262">i915#2=
62</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_520=
1/shard-tglb8/igt@perf_pmu@module-unload.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9369/shard-iclb3/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#268=
4</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5201=
/shard-iclb6/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/1804">i915#1804</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#2684</a>)=
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9369/shard-iclb5/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5201/shard-=
iclb3/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/intel/issues/1804">i915#1804</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9369/shard-tglb3/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/579">i915#=
579</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_52=
01/shard-tglb2/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a =
href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111644">fdo#111644</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#=
1397</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2411"=
>i915#2411</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9369/shard-iclb5/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/579">i915#=
579</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_52=
01/shard-iclb2/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a =
href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110892">fdo#110892</=
a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9369/shard-iclb3/igt@i915_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a=
 href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110892">fdo#110892<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5201/s=
hard-iclb7/igt@i915_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9369/shard-tglb1/igt@i915_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a=
 href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111644">fdo#111644<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1397">i915=
#1397</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2411=
">i915#2411</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_5201/shard-tglb3/igt@i915_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>)<=
/p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9369/shard-tglb3/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend=
.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/1436">i915#1436</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/1602">i915#1602</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/1798">i915#1798</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/1887">i915#1887</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/2411">i915#2411</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/456">i915#456</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5201/shard-tglb6/igt@kms=
_vblank@pipe-b-ts-continuation-dpms-suspend.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9369/shard-tglb2/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend=
.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/2411">i915#2411</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_5201/shard-tglb1/igt@kms_vblank@pipe-c-ts-continuation-dpm=
s-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/1436">i915#1436</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/1602">i915#1602</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/1887">i915#1887</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/2411">i915#2411</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/456">i915#456</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-ts-continuation-dpms-rpm:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9369/shard-tglb2/igt@kms_vblank@pipe-d-ts-continuation-dpms-rpm.htm=
l">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2411">i915#2411</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_5201/shard-tglb1/igt@kms_vblank@pipe-d-ts-continuation-dpms-rp=
m.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2648">i915#2648</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9369/shard-kbl2/igt@runner@aborted.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/483">i915#483</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5201/shard-kbl7/igt=
@runner@aborted.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/2295">i915#2295</a>)</p>
</li>
<li>
<p>shard-iclb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9369/shard-iclb8/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9369/shard-iclb5/igt@runner@abo=
rted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/1814">i915#1814</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/483">i915#483</a>) -&gt; (<a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_5201/shard-iclb3/igt@runner@aborted.html">FAIL</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5201/shard-ic=
lb4/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/1814">i915#1814</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/2295">i915#2295</a>)</p>
</li>
<li>
<p>shard-glk:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9369/shard-glk6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9369/shard-glk8/igt@runner@abort=
ed.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/1814">i915#1814</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/2295">i915#2295</a> / <a href=3D"https://bugzilla.kernel.org/show=
_bug.cgi?id=3D202321">k.org#202321</a>) -&gt; (<a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_5201/shard-glk7/igt@runner@aborted.html">FAIL=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5201/shard-=
glk5/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/1814">i915#1814</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/483">i915#483</a> / <a href=3D"https:/=
/bugzilla.kernel.org/show_bug.cgi?id=3D202321">k.org#202321</a>)</p>
</li>
<li>
<p>shard-tglb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9369/shard-tglb3/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9369/shard-tglb8/igt@runner@abo=
rted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/1602">i915#1602</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2295">i915#2295</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_5201/shard-tglb6/igt@runner@aborted.html">FAIL</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5201/shard-tglb6/=
igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_5201/shard-tglb1/igt@runner@aborted.html">FAIL</a>) (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#229=
5</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2426">i9=
15#2426</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/40=
9">i915#409</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (10 -&gt; 8)</h2>
<p>Missing    (2): pig-skl-6260u pig-glk-j5005 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5863 -&gt; IGTPW_5201</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9369: 50eb41aa12d68d1fff634d5f09a8faba3e72b46b @ git://anongit.fre=
edesktop.org/gfx-ci/linux<br />
  IGTPW_5201: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5201/index.htm=
l<br />
  IGT_5863: 849de1780d33c6749e0a26dc3c642eb9b3d6cd42 @ git://anongit.freede=
sktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============6863105356392098592==--

--===============0817687916==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0817687916==--
