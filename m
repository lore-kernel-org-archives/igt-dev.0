Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 03 Jun 2020 14:10:32 -0000
Message-ID: <159119343255.12266.17423282662991410724@emeril.freedesktop.org>
References: <20200603100751.304637-1-matthew.auld@intel.com>
In-Reply-To: <20200603100751.304637-1-matthew.auld@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgaTkxNTog?=
 =?utf-8?q?purge_i915=5Fgem=5Fcreate=5Fv2?=
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
To: Matthew Auld <matthew.auld@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: i915: purge i915_gem_create_v2
URL   : https://patchwork.freedesktop.org/series/77946/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8575_full -> IGTPW_4643_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4643/index.html

Known issues
------------

  Here are the changes found in IGTPW_4643_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@drm_read@empty-block:
    - shard-tglb:         [PASS][1] -> [DMESG-WARN][2] ([i915#402]) +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8575/shard-tglb1/igt@drm_read@empty-block.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4643/shard-tglb5/igt@drm_read@empty-block.html

  * igt@gem_exec_whisper@basic-queues-forked:
    - shard-glk:          [PASS][3] -> [DMESG-WARN][4] ([i915#118] / [i915#95])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8575/shard-glk1/igt@gem_exec_whisper@basic-queues-forked.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4643/shard-glk2/igt@gem_exec_whisper@basic-queues-forked.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-apl:          [PASS][5] -> [DMESG-WARN][6] ([i915#183])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8575/shard-apl6/igt@gem_tiled_swapping@non-threaded.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4643/shard-apl4/igt@gem_tiled_swapping@non-threaded.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-apl:          [PASS][7] -> [DMESG-WARN][8] ([i915#1436] / [i915#716])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8575/shard-apl7/igt@gen9_exec_parse@allowed-all.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4643/shard-apl3/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-apl:          [PASS][9] -> [DMESG-WARN][10] ([i915#180]) +4 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8575/shard-apl3/igt@i915_suspend@fence-restore-tiled2untiled.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4643/shard-apl8/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-glk:          [PASS][11] -> [DMESG-FAIL][12] ([i915#118] / [i915#95])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8575/shard-glk1/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4643/shard-glk8/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen:
    - shard-kbl:          [PASS][13] -> [DMESG-FAIL][14] ([i915#54] / [i915#95]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8575/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4643/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-64x64-onscreen:
    - shard-snb:          [PASS][15] -> [INCOMPLETE][16] ([i915#82])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8575/shard-snb4/igt@kms_cursor_crc@pipe-b-cursor-64x64-onscreen.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4643/shard-snb1/igt@kms_cursor_crc@pipe-b-cursor-64x64-onscreen.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [PASS][17] -> [FAIL][18] ([i915#72])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8575/shard-glk9/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4643/shard-glk6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@pipe-b-single-bo:
    - shard-glk:          [PASS][19] -> [TIMEOUT][20] ([i915#1958]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8575/shard-glk2/igt@kms_cursor_legacy@pipe-b-single-bo.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4643/shard-glk9/igt@kms_cursor_legacy@pipe-b-single-bo.html
    - shard-apl:          [PASS][21] -> [TIMEOUT][22] ([i915#1635]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8575/shard-apl6/igt@kms_cursor_legacy@pipe-b-single-bo.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4643/shard-apl7/igt@kms_cursor_legacy@pipe-b-single-bo.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-ytiled:
    - shard-iclb:         [PASS][23] -> [FAIL][24] ([i915#52] / [i915#54])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8575/shard-iclb8/igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-ytiled.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4643/shard-iclb7/igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-ytiled.html

  * igt@kms_lease@lease_unleased_crtc:
    - shard-apl:          [PASS][25] -> [DMESG-WARN][26] ([i915#95]) +25 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8575/shard-apl3/igt@kms_lease@lease_unleased_crtc.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4643/shard-apl4/igt@kms_lease@lease_unleased_crtc.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-iclb:         [PASS][27] -> [FAIL][28] ([i915#83])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8575/shard-iclb6/igt@kms_panel_fitting@atomic-fastset.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4643/shard-iclb7/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-kbl:          [PASS][29] -> [DMESG-WARN][30] ([i915#180]) +2 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8575/shard-kbl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4643/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-kbl:          [PASS][31] -> [DMESG-WARN][32] ([i915#180] / [i915#93] / [i915#95])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8575/shard-kbl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4643/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_plane_cursor@pipe-a-primary-size-128:
    - shard-kbl:          [PASS][33] -> [DMESG-WARN][34] ([i915#93] / [i915#95]) +40 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8575/shard-kbl4/igt@kms_plane_cursor@pipe-a-primary-size-128.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4643/shard-kbl1/igt@kms_plane_cursor@pipe-a-primary-size-128.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-tglb:         [PASS][35] -> [SKIP][36] ([i915#1911])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8575/shard-tglb5/igt@kms_psr2_su@frontbuffer.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4643/shard-tglb1/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [PASS][37] -> [SKIP][38] ([fdo#109642] / [fdo#111068])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8575/shard-iclb2/igt@kms_psr2_su@page_flip.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4643/shard-iclb1/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_sprite_render:
    - shard-iclb:         [PASS][39] -> [SKIP][40] ([fdo#109441])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8575/shard-iclb2/igt@kms_psr@psr2_sprite_render.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4643/shard-iclb6/igt@kms_psr@psr2_sprite_render.html

  * igt@kms_vblank@pipe-a-wait-idle-hang:
    - shard-kbl:          [PASS][41] -> [DMESG-WARN][42] ([i915#1982]) +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8575/shard-kbl4/igt@kms_vblank@pipe-a-wait-idle-hang.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4643/shard-kbl7/igt@kms_vblank@pipe-a-wait-idle-hang.html

  
#### Possible fixes ####

  * igt@gem_exec_reloc@basic-gtt-read-active:
    - shard-kbl:          [DMESG-WARN][43] ([i915#93] / [i915#95]) -> [PASS][44] +50 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8575/shard-kbl1/igt@gem_exec_reloc@basic-gtt-read-active.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4643/shard-kbl7/igt@gem_exec_reloc@basic-gtt-read-active.html

  * igt@gem_exec_whisper@basic-forked-all:
    - shard-glk:          [DMESG-WARN][45] ([i915#118] / [i915#95]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8575/shard-glk6/igt@gem_exec_whisper@basic-forked-all.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4643/shard-glk1/igt@gem_exec_whisper@basic-forked-all.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][47] ([i915#1899]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8575/shard-iclb4/igt@i915_pm_dc@dc6-psr.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4643/shard-iclb1/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-apl:          [DMESG-WARN][49] ([i915#180]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8575/shard-apl6/igt@i915_suspend@fence-restore-untiled.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4643/shard-apl1/igt@i915_suspend@fence-restore-untiled.html

  * {igt@kms_atomic_transition@plane-all-transition-nonblocking@pipe-c}:
    - shard-tglb:         [DMESG-WARN][51] ([i915#1982]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8575/shard-tglb1/igt@kms_atomic_transition@plane-all-transition-nonblocking@pipe-c.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4643/shard-tglb3/igt@kms_atomic_transition@plane-all-transition-nonblocking@pipe-c.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-glk:          [DMESG-FAIL][53] ([i915#118] / [i915#95]) -> [PASS][54] +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8575/shard-glk8/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4643/shard-glk5/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
    - shard-apl:          [DMESG-WARN][55] ([i915#1982]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8575/shard-apl2/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4643/shard-apl6/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-random:
    - shard-apl:          [DMESG-WARN][57] ([i915#95]) -> [PASS][58] +45 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8575/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4643/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html
    - shard-kbl:          [DMESG-FAIL][59] ([i915#54] / [i915#95]) -> [PASS][60] +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8575/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4643/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][61] ([i915#180] / [i915#93] / [i915#95]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8575/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4643/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-b-cursor-256x85-random:
    - shard-apl:          [FAIL][63] ([i915#54]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8575/shard-apl8/igt@kms_cursor_crc@pipe-b-cursor-256x85-random.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4643/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-256x85-random.html
    - shard-kbl:          [FAIL][65] ([i915#54]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8575/shard-kbl1/igt@kms_cursor_crc@pipe-b-cursor-256x85-random.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4643/shard-kbl4/igt@kms_cursor_crc@pipe-b-cursor-256x85-random.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-tglb:         [INCOMPLETE][67] ([i915#1602] / [i915#456]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8575/shard-tglb1/igt@kms_fbcon_fbt@fbc-suspend.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4643/shard-tglb1/igt@kms_fbcon_fbt@fbc-suspend.html

  * {igt@kms_flip@flip-vs-expired-vblank@c-dp1}:
    - shard-apl:          [FAIL][69] ([i915#79]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8575/shard-apl1/igt@kms_flip@flip-vs-expired-vblank@c-dp1.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4643/shard-apl3/igt@kms_flip@flip-vs-expired-vblank@c-dp1.html

  * {igt@kms_flip@flip-vs-suspend-interruptible@a-dp1}:
    - shard-kbl:          [DMESG-WARN][71] ([i915#180]) -> [PASS][72] +4 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8575/shard-kbl2/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4643/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-256:
    - shard-apl:          [DMESG-FAIL][73] ([i915#95]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8575/shard-apl7/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4643/shard-apl6/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
    - shard-kbl:          [DMESG-FAIL][75] ([i915#95]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8575/shard-kbl3/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4643/shard-kbl3/igt@kms_plane_cursor@pipe-a-viewport-size-256.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][77] ([fdo#109441]) -> [PASS][78] +3 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8575/shard-iclb4/igt@kms_psr@psr2_sprite_plane_move.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4643/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend:
    - shard-iclb:         [INCOMPLETE][79] ([i915#1078] / [i915#1185]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8575/shard-iclb3/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4643/shard-iclb4/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html

  * {igt@perf_pmu@module-unload}:
    - shard-apl:          [TIMEOUT][81] ([i915#1635]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8575/shard-apl1/igt@perf_pmu@module-unload.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4643/shard-apl4/igt@perf_pmu@module-unload.html

  
#### Warnings ####

  * igt@gem_render_copy@yf-tiled-to-vebox-y-tiled:
    - shard-glk:          [SKIP][83] ([fdo#109271]) -> [TIMEOUT][84] ([i915#1958]) +1 similar issue
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8575/shard-glk5/igt@gem_render_copy@yf-tiled-to-vebox-y-tiled.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4643/shard-glk9/igt@gem_render_copy@yf-tiled-to-vebox-y-tiled.html
    - shard-apl:          [SKIP][85] ([fdo#109271]) -> [TIMEOUT][86] ([i915#1635]) +1 similar issue
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8575/shard-apl8/igt@gem_render_copy@yf-tiled-to-vebox-y-tiled.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4643/shard-apl7/igt@gem_render_copy@yf-tiled-to-vebox-y-tiled.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [SKIP][87] ([i915#468]) -> [FAIL][88] ([i915#454])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8575/shard-tglb2/igt@i915_pm_dc@dc6-psr.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4643/shard-tglb8/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         [FAIL][89] ([i915#1515]) -> [WARN][90] ([i915#1515])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8575/shard-iclb6/igt@i915_pm_rc6_residency@rc6-idle.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4643/shard-iclb3/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-apl:          [TIMEOUT][91] ([i915#1635]) -> [SKIP][92] ([fdo#109271]) +4 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8575/shard-apl1/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4643/shard-apl1/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          [TIMEOUT][93] ([i915#1319]) -> [FAIL][94] ([fdo#110321] / [fdo#110336])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8575/shard-apl1/igt@kms_content_protection@atomic-dpms.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4643/shard-apl2/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@legacy:
    - shard-apl:          [FAIL][95] ([fdo#110321] / [fdo#110336]) -> [TIMEOUT][96] ([i915#1319])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8575/shard-apl2/igt@kms_content_protection@legacy.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4643/shard-apl6/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic:
    - shard-apl:          [TIMEOUT][97] ([i915#1319]) -> [TIMEOUT][98] ([i915#1319] / [i915#1635])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8575/shard-apl3/igt@kms_content_protection@lic.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4643/shard-apl6/igt@kms_content_protection@lic.html

  * igt@kms_content_protection@srm:
    - shard-apl:          [FAIL][99] ([fdo#110321]) -> [TIMEOUT][100] ([i915#1319] / [i915#1635])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8575/shard-apl2/igt@kms_content_protection@srm.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4643/shard-apl8/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-apl:          [DMESG-WARN][101] ([i915#180] / [i915#95]) -> [DMESG-WARN][102] ([i915#180])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8575/shard-apl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4643/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-glk:          [DMESG-FAIL][103] ([i915#1925] / [i915#1926]) -> [DMESG-WARN][104] ([i915#1926]) +1 similar issue
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8575/shard-glk8/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4643/shard-glk4/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-apl:          [DMESG-WARN][105] ([i915#95]) -> [DMESG-WARN][106] ([i915#180] / [i915#95])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8575/shard-apl1/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4643/shard-apl8/igt@kms_frontbuffer_tracking@fbc-suspend.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [i915#1078]: https://gitlab.freedesktop.org/drm/intel/issues/1078
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1185]: https://gitlab.freedesktop.org/drm/intel/issues/1185
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1515]: https://gitlab.freedesktop.org/drm/intel/issues/1515
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#183]: https://gitlab.freedesktop.org/drm/intel/issues/183
  [i915#1899]: https://gitlab.freedesktop.org/drm/intel/issues/1899
  [i915#1911]: https://gitlab.freedesktop.org/drm/intel/issues/1911
  [i915#1925]: https://gitlab.freedesktop.org/drm/intel/issues/1925
  [i915#1926]: https://gitlab.freedesktop.org/drm/intel/issues/1926
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#83]: https://gitlab.freedesktop.org/drm/intel/issues/83
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5692 -> IGTPW_4643
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8575: b261605291bae8f267174f92df7513a3a7184573 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4643: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4643/index.html
  IGT_5692: c98c9ad6d06c4eb8b05b23ef0bbe0159730e387f @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4643/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
