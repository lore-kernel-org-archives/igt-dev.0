Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 09 Apr 2020 01:45:14 -0000
Message-ID: <158639671491.11550.13765877382903267652@emeril.freedesktop.org>
References: <20200408141921.2057263-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200408141921.2057263-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgaW50ZWwt?=
 =?utf-8?q?ci=3A_Drop_gem=5Fexec=5Fsuspend=40basic-S4-device_from_BAT?=
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

Series: intel-ci: Drop gem_exec_suspend@basic-S4-device from BAT
URL   : https://patchwork.freedesktop.org/series/75677/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8276_full -> IGTPW_4432_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4432/index.html

Known issues
------------

  Here are the changes found in IGTPW_4432_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_params@invalid-bsd-ring:
    - shard-iclb:         [PASS][1] -> [SKIP][2] ([fdo#109276])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8276/shard-iclb2/igt@gem_exec_params@invalid-bsd-ring.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4432/shard-iclb3/igt@gem_exec_params@invalid-bsd-ring.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [PASS][3] -> [INCOMPLETE][4] ([i915#58] / [k.org#198133])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8276/shard-glk3/igt@gen9_exec_parse@allowed-all.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4432/shard-glk2/igt@gen9_exec_parse@allowed-all.html
    - shard-kbl:          [PASS][5] -> [DMESG-WARN][6] ([i915#716])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8276/shard-kbl7/igt@gen9_exec_parse@allowed-all.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4432/shard-kbl6/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_rpm@cursor-dpms:
    - shard-glk:          [PASS][7] -> [SKIP][8] ([fdo#109271]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8276/shard-glk5/igt@i915_pm_rpm@cursor-dpms.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4432/shard-glk6/igt@i915_pm_rpm@cursor-dpms.html
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([i915#1316] / [i915#579]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8276/shard-iclb4/igt@i915_pm_rpm@cursor-dpms.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4432/shard-iclb2/igt@i915_pm_rpm@cursor-dpms.html

  * igt@i915_pm_rpm@system-suspend:
    - shard-hsw:          [PASS][11] -> [SKIP][12] ([fdo#109271]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8276/shard-hsw1/igt@i915_pm_rpm@system-suspend.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4432/shard-hsw5/igt@i915_pm_rpm@system-suspend.html
    - shard-tglb:         [PASS][13] -> [SKIP][14] ([i915#1316] / [i915#579])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8276/shard-tglb3/igt@i915_pm_rpm@system-suspend.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4432/shard-tglb3/igt@i915_pm_rpm@system-suspend.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen:
    - shard-kbl:          [PASS][15] -> [FAIL][16] ([i915#54] / [i915#93] / [i915#95]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8276/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4432/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen:
    - shard-apl:          [PASS][17] -> [FAIL][18] ([i915#54] / [i915#95])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8276/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4432/shard-apl1/igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-128x128-random:
    - shard-apl:          [PASS][19] -> [FAIL][20] ([i915#54])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8276/shard-apl7/igt@kms_cursor_crc@pipe-c-cursor-128x128-random.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4432/shard-apl2/igt@kms_cursor_crc@pipe-c-cursor-128x128-random.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-xtiled:
    - shard-glk:          [PASS][21] -> [FAIL][22] ([i915#52] / [i915#54]) +2 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8276/shard-glk1/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-xtiled.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4432/shard-glk6/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-xtiled.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled:
    - shard-glk:          [PASS][23] -> [FAIL][24] ([i915#177] / [i915#52] / [i915#54])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8276/shard-glk2/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4432/shard-glk7/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-kbl:          [PASS][25] -> [DMESG-WARN][26] ([i915#180]) +2 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8276/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4432/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [PASS][27] -> [FAIL][28] ([i915#53] / [i915#93] / [i915#95])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8276/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4432/shard-kbl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
    - shard-apl:          [PASS][29] -> [FAIL][30] ([i915#53] / [i915#95])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8276/shard-apl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4432/shard-apl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-apl:          [PASS][31] -> [DMESG-WARN][32] ([i915#180]) +2 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8276/shard-apl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4432/shard-apl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
    - shard-kbl:          [PASS][33] -> [INCOMPLETE][34] ([i915#155] / [i915#648])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8276/shard-kbl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4432/shard-kbl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-256:
    - shard-apl:          [PASS][35] -> [FAIL][36] ([i915#1559] / [i915#95])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8276/shard-apl2/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4432/shard-apl1/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
    - shard-kbl:          [PASS][37] -> [FAIL][38] ([i915#1559] / [i915#93] / [i915#95])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8276/shard-kbl6/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4432/shard-kbl4/igt@kms_plane_cursor@pipe-a-viewport-size-256.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [PASS][39] -> [FAIL][40] ([i915#899])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8276/shard-glk5/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4432/shard-glk8/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [PASS][41] -> [SKIP][42] ([fdo#109441]) +2 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8276/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4432/shard-iclb1/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][43] -> [FAIL][44] ([i915#31])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8276/shard-apl3/igt@kms_setmode@basic.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4432/shard-apl2/igt@kms_setmode@basic.html
    - shard-hsw:          [PASS][45] -> [FAIL][46] ([i915#31])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8276/shard-hsw1/igt@kms_setmode@basic.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4432/shard-hsw1/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend:
    - shard-hsw:          [PASS][47] -> [INCOMPLETE][48] ([i915#61]) +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8276/shard-hsw4/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4432/shard-hsw1/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html

  
#### Possible fixes ####

  * {igt@gem_ctx_isolation@preservation-s3@bcs0}:
    - shard-apl:          [DMESG-WARN][49] ([i915#180]) -> [PASS][50] +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8276/shard-apl1/igt@gem_ctx_isolation@preservation-s3@bcs0.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4432/shard-apl3/igt@gem_ctx_isolation@preservation-s3@bcs0.html

  * igt@i915_selftest@live@requests:
    - shard-tglb:         [INCOMPLETE][51] ([i915#1531] / [i915#1658]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8276/shard-tglb3/igt@i915_selftest@live@requests.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4432/shard-tglb5/igt@i915_selftest@live@requests.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen:
    - shard-kbl:          [FAIL][53] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8276/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4432/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - shard-kbl:          [FAIL][55] ([i915#54]) -> [PASS][56] +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8276/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4432/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
    - shard-apl:          [FAIL][57] ([i915#54]) -> [PASS][58] +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8276/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4432/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding:
    - shard-apl:          [FAIL][59] ([i915#54] / [i915#95]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8276/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4432/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding.html

  * igt@kms_cursor_crc@pipe-b-cursor-256x256-sliding:
    - shard-glk:          [FAIL][61] ([i915#54]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8276/shard-glk2/igt@kms_cursor_crc@pipe-b-cursor-256x256-sliding.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4432/shard-glk7/igt@kms_cursor_crc@pipe-b-cursor-256x256-sliding.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled:
    - shard-glk:          [FAIL][63] ([i915#52] / [i915#54]) -> [PASS][64] +5 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8276/shard-glk3/igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4432/shard-glk3/igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-ytiled:
    - shard-apl:          [FAIL][65] ([i915#52] / [i915#54] / [i915#95]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8276/shard-apl7/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-ytiled.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4432/shard-apl4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-ytiled.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-glk:          [FAIL][67] ([i915#34]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8276/shard-glk5/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4432/shard-glk6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-glk:          [FAIL][69] ([i915#79]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8276/shard-glk4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4432/shard-glk9/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip_tiling@flip-changes-tiling-y:
    - shard-apl:          [FAIL][71] ([i915#95]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8276/shard-apl2/igt@kms_flip_tiling@flip-changes-tiling-y.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4432/shard-apl4/igt@kms_flip_tiling@flip-changes-tiling-y.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [SKIP][73] ([fdo#109441]) -> [PASS][74] +3 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8276/shard-iclb8/igt@kms_psr@psr2_cursor_render.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4432/shard-iclb2/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_vblank@pipe-c-ts-continuation-suspend:
    - shard-kbl:          [DMESG-WARN][75] ([i915#180]) -> [PASS][76] +3 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8276/shard-kbl7/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4432/shard-kbl7/igt@kms_vblank@pipe-c-ts-continuation-suspend.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [FAIL][77] ([i915#454]) -> [SKIP][78] ([i915#468])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8276/shard-tglb7/igt@i915_pm_dc@dc6-dpms.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4432/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-kbl:          [FAIL][79] ([i915#64]) -> [FAIL][80] ([i915#93] / [i915#95])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8276/shard-kbl4/igt@kms_fbcon_fbt@fbc.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4432/shard-kbl1/igt@kms_fbcon_fbt@fbc.html
    - shard-apl:          [FAIL][81] ([i915#1525]) -> [FAIL][82] ([i915#95])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8276/shard-apl7/igt@kms_fbcon_fbt@fbc.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4432/shard-apl6/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [DMESG-FAIL][83] ([i915#180] / [i915#95]) -> [FAIL][84] ([i915#95])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8276/shard-apl4/igt@kms_fbcon_fbt@fbc-suspend.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4432/shard-apl8/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-apl:          [DMESG-WARN][85] ([i915#180]) -> [INCOMPLETE][86] ([i915#1297])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8276/shard-apl1/igt@kms_flip@flip-vs-suspend.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4432/shard-apl6/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb:
    - shard-kbl:          [FAIL][87] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95]) -> [FAIL][88] ([fdo#108145] / [i915#265])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8276/shard-kbl2/igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4432/shard-kbl1/igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb.html
    - shard-apl:          [FAIL][89] ([fdo#108145] / [i915#265] / [i915#95]) -> [FAIL][90] ([fdo#108145] / [i915#265])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8276/shard-apl7/igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4432/shard-apl4/igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb.html

  * igt@kms_sysfs_edid_timing:
    - shard-kbl:          [FAIL][91] ([IGT#2]) -> [FAIL][92] ([IGT#2] / [i915#93] / [i915#95])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8276/shard-kbl1/igt@kms_sysfs_edid_timing.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4432/shard-kbl7/igt@kms_sysfs_edid_timing.html

  * igt@runner@aborted:
    - shard-kbl:          [FAIL][93] ([i915#1423] / [i915#92]) -> ([FAIL][94], [FAIL][95]) ([i915#1423] / [i915#716] / [i915#92])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8276/shard-kbl2/igt@runner@aborted.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4432/shard-kbl6/igt@runner@aborted.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4432/shard-kbl7/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [i915#1297]: https://gitlab.freedesktop.org/drm/intel/issues/1297
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1423]: https://gitlab.freedesktop.org/drm/intel/issues/1423
  [i915#1525]: https://gitlab.freedesktop.org/drm/intel/issues/1525
  [i915#1531]: https://gitlab.freedesktop.org/drm/intel/issues/1531
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#1658]: https://gitlab.freedesktop.org/drm/intel/issues/1658
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#34]: https://gitlab.freedesktop.org/drm/intel/issues/34
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#53]: https://gitlab.freedesktop.org/drm/intel/issues/53
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#64]: https://gitlab.freedesktop.org/drm/intel/issues/64
  [i915#648]: https://gitlab.freedesktop.org/drm/intel/issues/648
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5581 -> IGTPW_4432
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8276: 73411a955ff8d5a50f8cffd321be6a896aa11bf2 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4432: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4432/index.html
  IGT_5581: ab0620e555119ec55f12ba9ab9e6e9246d407648 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4432/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
