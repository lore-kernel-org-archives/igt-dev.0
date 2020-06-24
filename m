Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 24 Jun 2020 06:17:52 -0000
Message-ID: <159297947241.19235.8351663067568169789@emeril.freedesktop.org>
References: <20200622135900.3227-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20200622135900.3227-1-juhapekka.heikkila@gmail.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fflip=5Ftiling=3A_remove_cut=27n=27paste?=
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
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_flip_tiling: remove cut'n'paste
URL   : https://patchwork.freedesktop.org/series/78692/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8651_full -> IGTPW_4685_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4685/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4685_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_flip_tiling@flip-y-tiled-to-yf-tiled} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][1] +6 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4685/shard-tglb8/igt@kms_flip_tiling@flip-y-tiled-to-yf-tiled.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8651_full and IGTPW_4685_full:

### New IGT tests (16) ###

  * igt@kms_flip_tiling@flip-linear-to-linear:
    - Statuses : 7 pass(s)
    - Exec time: [0.70, 4.47] s

  * igt@kms_flip_tiling@flip-linear-to-x-tiled:
    - Statuses : 7 pass(s)
    - Exec time: [0.61, 4.41] s

  * igt@kms_flip_tiling@flip-linear-to-y-tiled:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 4.48] s

  * igt@kms_flip_tiling@flip-linear-to-yf-tiled:
    - Statuses : 1 dmesg-warn(s) 3 pass(s) 3 skip(s)
    - Exec time: [0.0, 3.39] s

  * igt@kms_flip_tiling@flip-x-tiled-to-linear:
    - Statuses : 7 pass(s)
    - Exec time: [0.61, 4.45] s

  * igt@kms_flip_tiling@flip-x-tiled-to-x-tiled:
    - Statuses : 7 pass(s)
    - Exec time: [0.69, 4.46] s

  * igt@kms_flip_tiling@flip-x-tiled-to-y-tiled:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 4.48] s

  * igt@kms_flip_tiling@flip-x-tiled-to-yf-tiled:
    - Statuses : 4 pass(s) 3 skip(s)
    - Exec time: [0.0, 3.42] s

  * igt@kms_flip_tiling@flip-y-tiled-to-linear:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 4.41] s

  * igt@kms_flip_tiling@flip-y-tiled-to-x-tiled:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 4.46] s

  * igt@kms_flip_tiling@flip-y-tiled-to-y-tiled:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 4.44] s

  * igt@kms_flip_tiling@flip-y-tiled-to-yf-tiled:
    - Statuses : 4 pass(s) 3 skip(s)
    - Exec time: [0.0, 3.76] s

  * igt@kms_flip_tiling@flip-yf-tiled-to-linear:
    - Statuses : 4 pass(s) 3 skip(s)
    - Exec time: [0.0, 3.52] s

  * igt@kms_flip_tiling@flip-yf-tiled-to-x-tiled:
    - Statuses : 4 pass(s) 3 skip(s)
    - Exec time: [0.0, 3.42] s

  * igt@kms_flip_tiling@flip-yf-tiled-to-y-tiled:
    - Statuses : 4 pass(s) 3 skip(s)
    - Exec time: [0.0, 3.80] s

  * igt@kms_flip_tiling@flip-yf-tiled-to-yf-tiled:
    - Statuses : 4 pass(s) 3 skip(s)
    - Exec time: [0.0, 3.56] s

  

Known issues
------------

  Here are the changes found in IGTPW_4685_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_endless@dispatch@rcs0:
    - shard-tglb:         [PASS][2] -> [INCOMPLETE][3] ([i915#1958])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-tglb7/igt@gem_exec_endless@dispatch@rcs0.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4685/shard-tglb3/igt@gem_exec_endless@dispatch@rcs0.html

  * igt@gem_exec_whisper@basic-contexts-forked:
    - shard-glk:          [PASS][4] -> [DMESG-WARN][5] ([i915#118] / [i915#95]) +1 similar issue
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-glk5/igt@gem_exec_whisper@basic-contexts-forked.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4685/shard-glk6/igt@gem_exec_whisper@basic-contexts-forked.html

  * igt@gem_shrink@reclaim:
    - shard-hsw:          [PASS][6] -> [SKIP][7] ([fdo#109271])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-hsw4/igt@gem_shrink@reclaim.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4685/shard-hsw1/igt@gem_shrink@reclaim.html

  * igt@i915_module_load@reload:
    - shard-tglb:         [PASS][8] -> [DMESG-WARN][9] ([i915#402]) +3 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-tglb5/igt@i915_module_load@reload.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4685/shard-tglb2/igt@i915_module_load@reload.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-tglb:         [PASS][10] -> [SKIP][11] ([i915#1904])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-tglb6/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4685/shard-tglb8/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-tglb:         [PASS][12] -> [FAIL][13] ([i915#1568])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-tglb5/igt@i915_pm_rc6_residency@rc6-fence.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4685/shard-tglb3/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-kbl:          [PASS][14] -> [INCOMPLETE][15] ([i915#155])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-kbl7/igt@i915_suspend@fence-restore-tiled2untiled.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4685/shard-kbl4/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@i915_suspend@forcewake:
    - shard-kbl:          [PASS][16] -> [DMESG-WARN][17] ([i915#180]) +3 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-kbl4/igt@i915_suspend@forcewake.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4685/shard-kbl7/igt@i915_suspend@forcewake.html

  * igt@kms_atomic@atomic-invalid-params:
    - shard-hsw:          [PASS][18] -> [TIMEOUT][19] ([i915#1958]) +4 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-hsw8/igt@kms_atomic@atomic-invalid-params.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4685/shard-hsw7/igt@kms_atomic@atomic-invalid-params.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-glk:          [PASS][20] -> [DMESG-FAIL][21] ([i915#118] / [i915#95])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-glk5/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4685/shard-glk8/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_color@pipe-a-ctm-blue-to-red:
    - shard-kbl:          [PASS][22] -> [DMESG-WARN][23] ([i915#93] / [i915#95]) +39 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-kbl1/igt@kms_color@pipe-a-ctm-blue-to-red.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4685/shard-kbl3/igt@kms_color@pipe-a-ctm-blue-to-red.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-random:
    - shard-kbl:          [PASS][24] -> [DMESG-FAIL][25] ([i915#54] / [i915#95]) +1 similar issue
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4685/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt:
    - shard-tglb:         [PASS][26] -> [DMESG-WARN][27] ([i915#1982]) +1 similar issue
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-tglb5/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4685/shard-tglb3/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt.html

  * igt@kms_lease@lease-uevent:
    - shard-apl:          [PASS][28] -> [DMESG-WARN][29] ([i915#1635] / [i915#95]) +26 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-apl6/igt@kms_lease@lease-uevent.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4685/shard-apl4/igt@kms_lease@lease-uevent.html

  * igt@kms_lease@page_flip_implicit_plane:
    - shard-snb:          [PASS][30] -> [TIMEOUT][31] ([i915#1958]) +4 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-snb5/igt@kms_lease@page_flip_implicit_plane.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4685/shard-snb1/igt@kms_lease@page_flip_implicit_plane.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-128:
    - shard-kbl:          [PASS][32] -> [DMESG-FAIL][33] ([i915#95]) +1 similar issue
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-kbl1/igt@kms_plane_cursor@pipe-a-overlay-size-128.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4685/shard-kbl7/igt@kms_plane_cursor@pipe-a-overlay-size-128.html
    - shard-apl:          [PASS][34] -> [DMESG-FAIL][35] ([i915#1635] / [i915#95]) +1 similar issue
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-apl8/igt@kms_plane_cursor@pipe-a-overlay-size-128.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4685/shard-apl1/igt@kms_plane_cursor@pipe-a-overlay-size-128.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [PASS][36] -> [SKIP][37] ([fdo#109642] / [fdo#111068])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-iclb2/igt@kms_psr2_su@page_flip.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4685/shard-iclb6/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][38] -> [SKIP][39] ([fdo#109441]) +2 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4685/shard-iclb4/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_vblank@pipe-a-ts-continuation-modeset-hang:
    - shard-snb:          [PASS][40] -> [SKIP][41] ([fdo#109271])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-snb4/igt@kms_vblank@pipe-a-ts-continuation-modeset-hang.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4685/shard-snb2/igt@kms_vblank@pipe-a-ts-continuation-modeset-hang.html

  * igt@sysfs_preempt_timeout@timeout@vecs0:
    - shard-glk:          [PASS][42] -> [FAIL][43] ([i915#1755])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-glk5/igt@sysfs_preempt_timeout@timeout@vecs0.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4685/shard-glk1/igt@sysfs_preempt_timeout@timeout@vecs0.html

  * igt@sysfs_timeslice_duration@timeout@vecs0:
    - shard-apl:          [PASS][44] -> [FAIL][45] ([i915#1732])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-apl8/igt@sysfs_timeslice_duration@timeout@vecs0.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4685/shard-apl8/igt@sysfs_timeslice_duration@timeout@vecs0.html

  
#### Possible fixes ####

  * igt@drm_read@invalid-buffer:
    - shard-tglb:         [DMESG-WARN][46] ([i915#402]) -> [PASS][47] +2 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-tglb3/igt@drm_read@invalid-buffer.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4685/shard-tglb5/igt@drm_read@invalid-buffer.html

  * igt@gem_exec_whisper@basic-fds-priority:
    - shard-glk:          [DMESG-WARN][48] ([i915#118] / [i915#95]) -> [PASS][49] +3 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-glk6/igt@gem_exec_whisper@basic-fds-priority.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4685/shard-glk7/igt@gem_exec_whisper@basic-fds-priority.html

  * igt@gem_mmap_wc@read-write-distinct:
    - shard-hsw:          [TIMEOUT][50] ([i915#1958]) -> [PASS][51] +4 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-hsw4/igt@gem_mmap_wc@read-write-distinct.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4685/shard-hsw2/igt@gem_mmap_wc@read-write-distinct.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][52] ([i915#454]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-iclb1/igt@i915_pm_dc@dc6-psr.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4685/shard-iclb1/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-apl:          [DMESG-WARN][54] ([i915#1982]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-apl7/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4685/shard-apl4/igt@kms_big_fb@linear-64bpp-rotate-180.html
    - shard-glk:          [DMESG-FAIL][56] ([i915#118] / [i915#95]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-glk8/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4685/shard-glk2/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - shard-kbl:          [DMESG-FAIL][58] ([i915#54] / [i915#95]) -> [PASS][59] +1 similar issue
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4685/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_cursor_edge_walk@pipe-b-128x128-bottom-edge:
    - shard-glk:          [DMESG-WARN][60] ([i915#1982]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-glk2/igt@kms_cursor_edge_walk@pipe-b-128x128-bottom-edge.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4685/shard-glk1/igt@kms_cursor_edge_walk@pipe-b-128x128-bottom-edge.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled:
    - shard-apl:          [DMESG-FAIL][62] ([i915#1635] / [i915#54] / [i915#95]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-apl2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4685/shard-apl4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html

  * igt@kms_flip@2x-nonexisting-fb-interruptible@ab-vga1-hdmi-a1:
    - shard-hsw:          [DMESG-WARN][64] ([i915#1982]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-hsw6/igt@kms_flip@2x-nonexisting-fb-interruptible@ab-vga1-hdmi-a1.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4685/shard-hsw6/igt@kms_flip@2x-nonexisting-fb-interruptible@ab-vga1-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-pwrite:
    - shard-snb:          [SKIP][66] ([fdo#109271]) -> [PASS][67] +1 similar issue
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-snb1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-pwrite.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4685/shard-snb5/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-pwrite.html

  * igt@kms_plane@plane-position-covered-pipe-c-planes:
    - shard-apl:          [FAIL][68] ([i915#247]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-apl7/igt@kms_plane@plane-position-covered-pipe-c-planes.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4685/shard-apl1/igt@kms_plane@plane-position-covered-pipe-c-planes.html
    - shard-kbl:          [FAIL][70] ([i915#247]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-kbl6/igt@kms_plane@plane-position-covered-pipe-c-planes.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4685/shard-kbl1/igt@kms_plane@plane-position-covered-pipe-c-planes.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-64:
    - shard-kbl:          [DMESG-FAIL][72] ([i915#95]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-kbl7/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4685/shard-kbl1/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
    - shard-apl:          [DMESG-FAIL][74] ([i915#1635] / [i915#95]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-apl4/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4685/shard-apl6/igt@kms_plane_cursor@pipe-a-viewport-size-64.html

  * igt@kms_vblank@pipe-a-query-forked:
    - shard-kbl:          [DMESG-WARN][76] ([i915#93] / [i915#95]) -> [PASS][77] +45 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-kbl1/igt@kms_vblank@pipe-a-query-forked.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4685/shard-kbl3/igt@kms_vblank@pipe-a-query-forked.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [DMESG-WARN][78] ([i915#180]) -> [PASS][79] +7 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-kbl6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4685/shard-kbl7/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@perf@invalid-oa-metric-set-id:
    - shard-apl:          [DMESG-WARN][80] ([i915#1635] / [i915#95]) -> [PASS][81] +34 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-apl3/igt@perf@invalid-oa-metric-set-id.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4685/shard-apl8/igt@perf@invalid-oa-metric-set-id.html

  * igt@syncobj_wait@invalid-multi-wait-all-unsubmitted-signaled:
    - shard-snb:          [TIMEOUT][82] ([i915#1958]) -> [PASS][83] +3 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-snb6/igt@syncobj_wait@invalid-multi-wait-all-unsubmitted-signaled.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4685/shard-snb4/igt@syncobj_wait@invalid-multi-wait-all-unsubmitted-signaled.html

  
#### Warnings ####

  * igt@gem_exec_reloc@basic-concurrent0:
    - shard-kbl:          [FAIL][84] ([i915#1930]) -> [DMESG-FAIL][85] ([i915#95])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-kbl4/igt@gem_exec_reloc@basic-concurrent0.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4685/shard-kbl3/igt@gem_exec_reloc@basic-concurrent0.html

  * igt@gem_exec_reloc@basic-spin-others@vcs0:
    - shard-snb:          [WARN][86] ([i915#2021]) -> [WARN][87] ([i915#2036])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-snb6/igt@gem_exec_reloc@basic-spin-others@vcs0.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4685/shard-snb2/igt@gem_exec_reloc@basic-spin-others@vcs0.html

  * igt@gem_userptr_blits@process-exit-mmap@gtt:
    - shard-apl:          [SKIP][88] ([fdo#109271] / [i915#1635] / [i915#1699]) -> [SKIP][89] ([fdo#109271] / [i915#1699])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-apl6/igt@gem_userptr_blits@process-exit-mmap@gtt.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4685/shard-apl3/igt@gem_userptr_blits@process-exit-mmap@gtt.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][90] ([i915#588]) -> [SKIP][91] ([i915#658])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4685/shard-iclb7/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [SKIP][92] ([i915#468]) -> [FAIL][93] ([i915#454])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-tglb2/igt@i915_pm_dc@dc6-psr.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4685/shard-tglb7/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_chamelium@hdmi-audio-edid:
    - shard-apl:          [SKIP][94] ([fdo#109271] / [fdo#111827]) -> [SKIP][95] ([fdo#109271] / [fdo#111827] / [i915#1635]) +3 similar issues
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-apl6/igt@kms_chamelium@hdmi-audio-edid.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4685/shard-apl7/igt@kms_chamelium@hdmi-audio-edid.html

  * igt@kms_color_chamelium@pipe-a-gamma:
    - shard-apl:          [SKIP][96] ([fdo#109271] / [fdo#111827] / [i915#1635]) -> [SKIP][97] ([fdo#109271] / [fdo#111827])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-apl4/igt@kms_color_chamelium@pipe-a-gamma.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4685/shard-apl1/igt@kms_color_chamelium@pipe-a-gamma.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          [FAIL][98] ([fdo#110321] / [fdo#110336]) -> [DMESG-FAIL][99] ([fdo#110321] / [i915#1635] / [i915#95])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-apl6/igt@kms_content_protection@atomic-dpms.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4685/shard-apl4/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-apl:          [SKIP][100] ([fdo#109271]) -> [SKIP][101] ([fdo#109271] / [i915#1635]) +19 similar issues
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-apl3/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4685/shard-apl1/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-hsw:          [SKIP][102] ([fdo#109271]) -> [TIMEOUT][103] ([i915#1958])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-hsw1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4685/shard-hsw7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu.html
    - shard-snb:          [SKIP][104] ([fdo#109271]) -> [TIMEOUT][105] ([i915#1958])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-snb1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4685/shard-snb1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:
    - shard-apl:          [SKIP][106] ([fdo#109271] / [i915#1635]) -> [SKIP][107] ([fdo#109271]) +12 similar issues
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-apl8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4685/shard-apl6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:
    - shard-apl:          [DMESG-FAIL][108] ([i915#1635] / [i915#95]) -> [FAIL][109] ([i915#265])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4685/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:
    - shard-apl:          [FAIL][110] ([i915#265]) -> [DMESG-FAIL][111] ([i915#1635] / [i915#95])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-apl2/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4685/shard-apl4/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html

  * igt@kms_plane_cursor@pipe-c-viewport-size-256:
    - shard-snb:          [TIMEOUT][112] ([i915#1958]) -> [SKIP][113] ([fdo#109271])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8651/shard-snb6/igt@kms_plane_cursor@pipe-c-viewport-size-256.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4685/shard-snb2/igt@kms_plane_cursor@pipe-c-viewport-size-256.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1568]: https://gitlab.freedesktop.org/drm/intel/issues/1568
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1699]: https://gitlab.freedesktop.org/drm/intel/issues/1699
  [i915#1732]: https://gitlab.freedesktop.org/drm/intel/issues/1732
  [i915#1755]: https://gitlab.freedesktop.org/drm/intel/issues/1755
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1904]: https://gitlab.freedesktop.org/drm/intel/issues/1904
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
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
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5715 -> IGTPW_4685
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8651: f6210d1dd268f9e09e10d3704c768d7679a44f48 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4685: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4685/index.html
  IGT_5715: 3b6975c0f9e429c0c1f48c61a3417be9d68300cf @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4685/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
