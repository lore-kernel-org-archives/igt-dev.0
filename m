Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 04 Jun 2020 04:35:28 -0000
Message-ID: <159124532822.14554.4040340924205217276@emeril.freedesktop.org>
References: <20200603125414.1027845-1-arkadiusz.hiler@intel.com>
In-Reply-To: <20200603125414.1027845-1-arkadiusz.hiler@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgbGliL2ln?=
 =?utf-8?q?t=5Fcore=3A_Don=27t_kill_the_world_after_a_failed_fork?=
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

Series: lib/igt_core: Don't kill the world after a failed fork
URL   : https://patchwork.freedesktop.org/series/77953/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8579_full -> IGTPW_4645_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4645/index.html

Known issues
------------

  Here are the changes found in IGTPW_4645_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_eio@unwedge-stress:
    - shard-glk:          [PASS][1] -> [TIMEOUT][2] ([i915#1958]) +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-glk7/igt@gem_eio@unwedge-stress.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4645/shard-glk2/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_whisper@basic-queues-all:
    - shard-glk:          [PASS][3] -> [DMESG-WARN][4] ([i915#118] / [i915#95])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-glk9/igt@gem_exec_whisper@basic-queues-all.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4645/shard-glk1/igt@gem_exec_whisper@basic-queues-all.html

  * igt@gem_tiled_partial_pwrite_pread@writes-after-reads:
    - shard-apl:          [PASS][5] -> [DMESG-WARN][6] ([i915#95]) +32 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-apl2/igt@gem_tiled_partial_pwrite_pread@writes-after-reads.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4645/shard-apl7/igt@gem_tiled_partial_pwrite_pread@writes-after-reads.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-180:
    - shard-apl:          [PASS][7] -> [DMESG-WARN][8] ([i915#1982]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-apl7/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4645/shard-apl7/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html

  * igt@kms_color@pipe-a-ctm-blue-to-red:
    - shard-kbl:          [PASS][9] -> [DMESG-WARN][10] ([i915#93] / [i915#95]) +41 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-kbl3/igt@kms_color@pipe-a-ctm-blue-to-red.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4645/shard-kbl4/igt@kms_color@pipe-a-ctm-blue-to-red.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen:
    - shard-kbl:          [PASS][11] -> [DMESG-FAIL][12] ([i915#54] / [i915#95])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4645/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-glk:          [PASS][13] -> [DMESG-FAIL][14] ([i915#1925] / [i915#1926])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-glk9/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4645/shard-glk6/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-kbl:          [PASS][15] -> [DMESG-FAIL][16] ([i915#95]) +2 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-kbl2/igt@kms_fbcon_fbt@fbc.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4645/shard-kbl3/igt@kms_fbcon_fbt@fbc.html
    - shard-apl:          [PASS][17] -> [FAIL][18] ([i915#1525])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-apl1/igt@kms_fbcon_fbt@fbc.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4645/shard-apl8/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc:
    - shard-tglb:         [PASS][19] -> [DMESG-WARN][20] ([i915#1982]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-tglb8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4645/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt:
    - shard-kbl:          [PASS][21] -> [DMESG-WARN][22] ([i915#1982])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4645/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-a:
    - shard-apl:          [PASS][23] -> [DMESG-FAIL][24] ([i915#95])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-apl1/igt@kms_pipe_crc_basic@read-crc-pipe-a.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4645/shard-apl3/igt@kms_pipe_crc_basic@read-crc-pipe-a.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-apl:          [PASS][25] -> [DMESG-WARN][26] ([i915#180]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-apl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4645/shard-apl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-kbl:          [PASS][27] -> [DMESG-WARN][28] ([i915#180]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-kbl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4645/shard-kbl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_plane_cursor@pipe-b-overlay-size-128:
    - shard-tglb:         [PASS][29] -> [DMESG-WARN][30] ([i915#402])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-tglb8/igt@kms_plane_cursor@pipe-b-overlay-size-128.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4645/shard-tglb7/igt@kms_plane_cursor@pipe-b-overlay-size-128.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-tglb:         [PASS][31] -> [SKIP][32] ([i915#1911])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-tglb8/igt@kms_psr2_su@frontbuffer.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4645/shard-tglb8/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [PASS][33] -> [FAIL][34] ([i915#173])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-iclb4/igt@kms_psr@no_drrs.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4645/shard-iclb1/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [PASS][35] -> [SKIP][36] ([fdo#109441]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4645/shard-iclb4/igt@kms_psr@psr2_primary_page_flip.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][37] -> [FAIL][38] ([i915#31])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-apl6/igt@kms_setmode@basic.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4645/shard-apl8/igt@kms_setmode@basic.html

  
#### Possible fixes ####

  * {igt@gem_ctx_isolation@preservation-s3@bcs0}:
    - shard-kbl:          [FAIL][39] ([fdo#103375]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-kbl6/igt@gem_ctx_isolation@preservation-s3@bcs0.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4645/shard-kbl6/igt@gem_ctx_isolation@preservation-s3@bcs0.html

  * {igt@gem_ctx_isolation@preservation-s3@vcs0}:
    - shard-kbl:          [INCOMPLETE][41] -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-kbl6/igt@gem_ctx_isolation@preservation-s3@vcs0.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4645/shard-kbl6/igt@gem_ctx_isolation@preservation-s3@vcs0.html

  * {igt@gem_exec_fence@syncobj-channel}:
    - shard-hsw:          [DMESG-WARN][43] ([i915#1927]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-hsw4/igt@gem_exec_fence@syncobj-channel.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4645/shard-hsw1/igt@gem_exec_fence@syncobj-channel.html

  * {igt@gem_exec_schedule@implicit-write-read@rcs0}:
    - shard-snb:          [INCOMPLETE][45] ([i915#82]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-snb5/igt@gem_exec_schedule@implicit-write-read@rcs0.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4645/shard-snb4/igt@gem_exec_schedule@implicit-write-read@rcs0.html

  * igt@gem_exec_whisper@basic-contexts-forked-all:
    - shard-glk:          [DMESG-WARN][47] ([i915#118] / [i915#95]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-glk7/igt@gem_exec_whisper@basic-contexts-forked-all.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4645/shard-glk1/igt@gem_exec_whisper@basic-contexts-forked-all.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-apl:          [DMESG-WARN][49] ([i915#180]) -> [PASS][50] +2 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-apl6/igt@gem_workarounds@suspend-resume-context.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4645/shard-apl4/igt@gem_workarounds@suspend-resume-context.html

  * igt@i915_suspend@sysfs-reader:
    - shard-apl:          [TIMEOUT][51] ([i915#1635]) -> [PASS][52] +3 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-apl4/igt@i915_suspend@sysfs-reader.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4645/shard-apl8/igt@i915_suspend@sysfs-reader.html
    - shard-glk:          [TIMEOUT][53] ([i915#1958]) -> [PASS][54] +2 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-glk5/igt@i915_suspend@sysfs-reader.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4645/shard-glk7/igt@i915_suspend@sysfs-reader.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-0:
    - shard-apl:          [DMESG-WARN][55] ([i915#1982]) -> [PASS][56] +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-apl2/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4645/shard-apl3/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen:
    - shard-tglb:         [DMESG-WARN][57] ([i915#402]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-tglb2/igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4645/shard-tglb3/igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen:
    - shard-kbl:          [DMESG-FAIL][59] ([i915#54] / [i915#95]) -> [PASS][60] +2 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4645/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen.html

  * igt@kms_cursor_edge_walk@pipe-a-64x64-top-edge:
    - shard-apl:          [DMESG-WARN][61] ([i915#95]) -> [PASS][62] +31 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-apl1/igt@kms_cursor_edge_walk@pipe-a-64x64-top-edge.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4645/shard-apl2/igt@kms_cursor_edge_walk@pipe-a-64x64-top-edge.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [FAIL][63] ([i915#72]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-glk7/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4645/shard-glk8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@pipe-a-torture-move:
    - shard-hsw:          [INCOMPLETE][65] ([i915#61]) -> [PASS][66] +1 similar issue
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-hsw4/igt@kms_cursor_legacy@pipe-a-torture-move.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4645/shard-hsw1/igt@kms_cursor_legacy@pipe-a-torture-move.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled:
    - shard-apl:          [DMESG-FAIL][67] ([i915#54] / [i915#95]) -> [PASS][68] +1 similar issue
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-apl6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4645/shard-apl2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html

  * {igt@kms_flip@plain-flip-fb-recreate-interruptible@a-dp1}:
    - shard-kbl:          [DMESG-WARN][69] ([i915#1982]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-kbl1/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-dp1.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4645/shard-kbl1/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc:
    - shard-tglb:         [DMESG-WARN][71] ([i915#1982]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4645/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-kbl:          [FAIL][73] ([i915#49]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4645/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
    - shard-glk:          [FAIL][75] ([i915#49]) -> [PASS][76] +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-glk6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4645/shard-glk8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
    - shard-apl:          [DMESG-FAIL][77] ([i915#49] / [i915#95]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-apl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4645/shard-apl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping:
    - shard-iclb:         [DMESG-WARN][79] ([i915#1982]) -> [PASS][80] +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-iclb3/igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4645/shard-iclb8/igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [SKIP][81] ([fdo#109441]) -> [PASS][82] +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-iclb3/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4645/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [DMESG-WARN][83] ([i915#180]) -> [PASS][84] +5 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-kbl3/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4645/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@kms_vblank@pipe-c-ts-continuation-modeset-hang:
    - shard-glk:          [INCOMPLETE][85] ([i915#1927] / [i915#58] / [k.org#198133]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-glk9/igt@kms_vblank@pipe-c-ts-continuation-modeset-hang.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4645/shard-glk6/igt@kms_vblank@pipe-c-ts-continuation-modeset-hang.html

  * {igt@perf@blocking-parameterized}:
    - shard-tglb:         [FAIL][87] ([i915#1542]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-tglb7/igt@perf@blocking-parameterized.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4645/shard-tglb1/igt@perf@blocking-parameterized.html

  * igt@syncobj_wait@invalid-wait-zero-handles:
    - shard-kbl:          [DMESG-WARN][89] ([i915#93] / [i915#95]) -> [PASS][90] +44 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-kbl1/igt@syncobj_wait@invalid-wait-zero-handles.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4645/shard-kbl6/igt@syncobj_wait@invalid-wait-zero-handles.html

  
#### Warnings ####

  * igt@kms_content_protection@lic:
    - shard-apl:          [TIMEOUT][91] ([i915#1319] / [i915#1635]) -> [FAIL][92] ([fdo#110321])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-apl6/igt@kms_content_protection@lic.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4645/shard-apl8/igt@kms_content_protection@lic.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt:
    - shard-glk:          [SKIP][93] ([fdo#109271]) -> [TIMEOUT][94] ([i915#1958]) +1 similar issue
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-glk1/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4645/shard-glk2/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt.html

  * igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:
    - shard-kbl:          [FAIL][95] ([fdo#108145] / [i915#265]) -> [DMESG-FAIL][96] ([fdo#108145] / [i915#95])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-kbl7/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4645/shard-kbl3/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb:
    - shard-apl:          [FAIL][97] ([fdo#108145] / [i915#265]) -> [DMESG-FAIL][98] ([fdo#108145] / [i915#95])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-apl6/igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4645/shard-apl1/igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb.html

  * igt@kms_vblank@pipe-d-query-idle-hang:
    - shard-apl:          [TIMEOUT][99] ([i915#1635] / [i915#1640]) -> [SKIP][100] ([fdo#109271])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-apl4/igt@kms_vblank@pipe-d-query-idle-hang.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4645/shard-apl4/igt@kms_vblank@pipe-d-query-idle-hang.html
    - shard-glk:          [TIMEOUT][101] ([i915#1640] / [i915#1958]) -> [SKIP][102] ([fdo#109271])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-glk5/igt@kms_vblank@pipe-d-query-idle-hang.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4645/shard-glk8/igt@kms_vblank@pipe-d-query-idle-hang.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1525]: https://gitlab.freedesktop.org/drm/intel/issues/1525
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1640]: https://gitlab.freedesktop.org/drm/intel/issues/1640
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1911]: https://gitlab.freedesktop.org/drm/intel/issues/1911
  [i915#1925]: https://gitlab.freedesktop.org/drm/intel/issues/1925
  [i915#1926]: https://gitlab.freedesktop.org/drm/intel/issues/1926
  [i915#1927]: https://gitlab.freedesktop.org/drm/intel/issues/1927
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#407]: https://gitlab.freedesktop.org/drm/intel/issues/407
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
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
  * IGT: IGT_5694 -> IGTPW_4645
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8579: 289eb12c88c49a4ac8d325dc457d8878c7f5bdc0 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4645: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4645/index.html
  IGT_5694: a9b6c4c74bfddf7d3d2da3be08804fe315945cea @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4645/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
