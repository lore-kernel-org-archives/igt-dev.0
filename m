Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 06 Apr 2020 16:13:10 -0000
Message-ID: <158618959063.4191.8110295409407792631@emeril.freedesktop.org>
References: <20200406093726.1640834-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200406093726.1640834-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Ftiled=5Ffence=5Fblits=3A_Trim_workload?=
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

Series: i915/gem_tiled_fence_blits: Trim workload
URL   : https://patchwork.freedesktop.org/series/75540/
State : success

== Summary ==

CI Bug Log - changes from IGT_5572_full -> IGTPW_4410_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4410/index.html

Known issues
------------

  Here are the changes found in IGTPW_4410_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gen9_exec_parse@allowed-all:
    - shard-apl:          [PASS][1] -> [DMESG-WARN][2] ([i915#716])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-apl6/igt@gen9_exec_parse@allowed-all.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4410/shard-apl8/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_rpm@debugfs-forcewake-user:
    - shard-hsw:          [PASS][3] -> [SKIP][4] ([fdo#109271])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-hsw6/igt@i915_pm_rpm@debugfs-forcewake-user.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4410/shard-hsw1/igt@i915_pm_rpm@debugfs-forcewake-user.html
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([i915#1316] / [i915#579])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-iclb6/igt@i915_pm_rpm@debugfs-forcewake-user.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4410/shard-iclb8/igt@i915_pm_rpm@debugfs-forcewake-user.html
    - shard-tglb:         [PASS][7] -> [SKIP][8] ([i915#1316] / [i915#579])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-tglb6/igt@i915_pm_rpm@debugfs-forcewake-user.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4410/shard-tglb5/igt@i915_pm_rpm@debugfs-forcewake-user.html
    - shard-glk:          [PASS][9] -> [SKIP][10] ([fdo#109271])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-glk7/igt@i915_pm_rpm@debugfs-forcewake-user.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4410/shard-glk2/igt@i915_pm_rpm@debugfs-forcewake-user.html

  * igt@i915_suspend@sysfs-reader:
    - shard-apl:          [PASS][11] -> [DMESG-WARN][12] ([i915#180]) +2 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-apl3/igt@i915_suspend@sysfs-reader.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4410/shard-apl4/igt@i915_suspend@sysfs-reader.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding:
    - shard-kbl:          [PASS][13] -> [FAIL][14] ([i915#54] / [i915#93] / [i915#95]) +2 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4410/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [PASS][15] -> [INCOMPLETE][16] ([i915#155])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4410/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_legacy@cursor-vs-flip-legacy:
    - shard-hsw:          [PASS][17] -> [FAIL][18] ([i915#57])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-hsw7/igt@kms_cursor_legacy@cursor-vs-flip-legacy.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4410/shard-hsw8/igt@kms_cursor_legacy@cursor-vs-flip-legacy.html

  * igt@kms_draw_crc@draw-method-rgb565-render-untiled:
    - shard-glk:          [PASS][19] -> [FAIL][20] ([i915#52] / [i915#54]) +3 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-glk5/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4410/shard-glk3/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-pwrite-ytiled:
    - shard-apl:          [PASS][21] -> [FAIL][22] ([i915#52] / [i915#54] / [i915#95]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-apl6/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-ytiled.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4410/shard-apl1/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-ytiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-render-untiled:
    - shard-kbl:          [PASS][23] -> [FAIL][24] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-kbl7/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4410/shard-kbl1/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence:
    - shard-apl:          [PASS][25] -> [FAIL][26] ([i915#53] / [i915#95])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-apl6/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4410/shard-apl7/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html
    - shard-kbl:          [PASS][27] -> [FAIL][28] ([i915#53] / [i915#93] / [i915#95])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-kbl2/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4410/shard-kbl1/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-kbl:          [PASS][29] -> [DMESG-WARN][30] ([i915#180] / [i915#93] / [i915#95])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-kbl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4410/shard-kbl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-kbl:          [PASS][31] -> [DMESG-WARN][32] ([i915#180]) +4 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-kbl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4410/shard-kbl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-64:
    - shard-kbl:          [PASS][33] -> [FAIL][34] ([i915#1559] / [i915#93] / [i915#95]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-kbl3/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4410/shard-kbl1/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
    - shard-apl:          [PASS][35] -> [FAIL][36] ([i915#1559] / [i915#95]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-apl6/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4410/shard-apl4/igt@kms_plane_cursor@pipe-a-viewport-size-64.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][37] -> [SKIP][38] ([fdo#109441]) +3 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4410/shard-iclb7/igt@kms_psr@psr2_sprite_plane_move.html

  
#### Possible fixes ####

  * {igt@gem_ctx_isolation@preservation-s3@vcs0}:
    - shard-kbl:          [DMESG-WARN][39] ([i915#180]) -> [PASS][40] +2 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@vcs0.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4410/shard-kbl2/igt@gem_ctx_isolation@preservation-s3@vcs0.html

  * igt@i915_pm_rpm@cursor:
    - shard-tglb:         [SKIP][41] ([i915#1316] / [i915#579]) -> [PASS][42] +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-tglb1/igt@i915_pm_rpm@cursor.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4410/shard-tglb3/igt@i915_pm_rpm@cursor.html
    - shard-hsw:          [SKIP][43] ([fdo#109271]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-hsw7/igt@i915_pm_rpm@cursor.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4410/shard-hsw1/igt@i915_pm_rpm@cursor.html
    - shard-glk:          [SKIP][45] ([fdo#109271]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-glk9/igt@i915_pm_rpm@cursor.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4410/shard-glk7/igt@i915_pm_rpm@cursor.html

  * igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-iclb:         [SKIP][47] ([i915#1316] / [i915#579]) -> [PASS][48] +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-iclb6/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4410/shard-iclb7/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_busy@basic@flip:
    - shard-hsw:          [INCOMPLETE][49] ([i915#61]) -> [PASS][50] +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-hsw1/igt@kms_busy@basic@flip.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4410/shard-hsw4/igt@kms_busy@basic@flip.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding:
    - shard-apl:          [FAIL][51] ([i915#54] / [i915#95]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4410/shard-apl1/igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen:
    - shard-kbl:          [FAIL][53] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4410/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-apl:          [DMESG-WARN][55] ([i915#180]) -> [PASS][56] +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-apl1/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4410/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-c-cursor-128x128-sliding:
    - shard-kbl:          [FAIL][57] ([i915#54]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-128x128-sliding.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4410/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-128x128-sliding.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy:
    - shard-kbl:          [FAIL][59] ([i915#1566] / [i915#93] / [i915#95]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-kbl7/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4410/shard-kbl6/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled:
    - shard-glk:          [FAIL][61] ([i915#177] / [i915#52] / [i915#54]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-glk4/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4410/shard-glk5/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html

  * igt@kms_draw_crc@draw-method-rgb565-render-ytiled:
    - shard-glk:          [FAIL][63] ([i915#52] / [i915#54]) -> [PASS][64] +5 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4410/shard-glk5/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled:
    - shard-apl:          [FAIL][65] ([i915#52] / [i915#54] / [i915#95]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-apl3/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4410/shard-apl4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
    - shard-kbl:          [FAIL][67] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-kbl1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4410/shard-kbl6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-kbl:          [DMESG-WARN][69] ([i915#180] / [i915#93] / [i915#95]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-kbl7/igt@kms_fbcon_fbt@fbc-suspend.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4410/shard-kbl7/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-glk:          [FAIL][71] ([i915#79]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-glk2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4410/shard-glk6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-snb:          [INCOMPLETE][73] ([i915#82]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-snb1/igt@kms_flip@flip-vs-suspend-interruptible.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4410/shard-snb2/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render:
    - shard-glk:          [FAIL][75] ([i915#49]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-glk3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4410/shard-glk2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [FAIL][77] ([i915#899]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-glk4/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4410/shard-glk1/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [SKIP][79] ([fdo#109642] / [fdo#111068]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-iclb3/igt@kms_psr2_su@frontbuffer.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4410/shard-iclb2/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [SKIP][81] ([fdo#109441]) -> [PASS][82] +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-iclb4/igt@kms_psr@psr2_cursor_render.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4410/shard-iclb2/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_setmode@basic:
    - shard-hsw:          [FAIL][83] ([i915#31]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-hsw7/igt@kms_setmode@basic.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4410/shard-hsw6/igt@kms_setmode@basic.html

  * {igt@perf@blocking-parameterized}:
    - shard-kbl:          [FAIL][85] ([i915#1542]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-kbl4/igt@perf@blocking-parameterized.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4410/shard-kbl4/igt@perf@blocking-parameterized.html
    - shard-hsw:          [FAIL][87] ([i915#1542]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-hsw6/igt@perf@blocking-parameterized.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4410/shard-hsw7/igt@perf@blocking-parameterized.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [SKIP][89] ([i915#468]) -> [FAIL][90] ([i915#454])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4410/shard-tglb8/igt@i915_pm_dc@dc6-dpms.html

  * igt@kms_content_protection@uevent:
    - shard-kbl:          [FAIL][91] ([i915#357] / [i915#93] / [i915#95]) -> [FAIL][92] ([i915#357])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-kbl6/igt@kms_content_protection@uevent.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4410/shard-kbl3/igt@kms_content_protection@uevent.html
    - shard-apl:          [FAIL][93] ([i915#357] / [i915#95]) -> [FAIL][94] ([i915#357])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-apl8/igt@kms_content_protection@uevent.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4410/shard-apl8/igt@kms_content_protection@uevent.html

  * igt@kms_sysfs_edid_timing:
    - shard-apl:          [FAIL][95] ([IGT#2]) -> [FAIL][96] ([IGT#2] / [i915#95])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-apl2/igt@kms_sysfs_edid_timing.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4410/shard-apl7/igt@kms_sysfs_edid_timing.html
    - shard-kbl:          [FAIL][97] ([IGT#2]) -> [FAIL][98] ([IGT#2] / [i915#93] / [i915#95])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-kbl7/igt@kms_sysfs_edid_timing.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4410/shard-kbl1/igt@kms_sysfs_edid_timing.html

  * igt@runner@aborted:
    - shard-apl:          [FAIL][99] ([i915#1423]) -> ([FAIL][100], [FAIL][101]) ([i915#1423] / [i915#716])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-apl3/igt@runner@aborted.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4410/shard-apl7/igt@runner@aborted.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4410/shard-apl8/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1423]: https://gitlab.freedesktop.org/drm/intel/issues/1423
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#1566]: https://gitlab.freedesktop.org/drm/intel/issues/1566
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#357]: https://gitlab.freedesktop.org/drm/intel/issues/357
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#53]: https://gitlab.freedesktop.org/drm/intel/issues/53
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#57]: https://gitlab.freedesktop.org/drm/intel/issues/57
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5572 -> IGTPW_4410

  CI-20190529: 20190529
  CI_DRM_8259: 450fc86b62651336f9b5fde79c068df7b4c95aa4 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4410: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4410/index.html
  IGT_5572: 6c124b5c8501d900966c033ac86c3dc55c16a2da @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4410/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
