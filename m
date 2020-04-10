Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 10 Apr 2020 06:59:48 -0000
Message-ID: <158650198811.10045.14315274844059482328@emeril.freedesktop.org>
References: <20200409135224.24509-1-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20200409135224.24509-1-janusz.krzysztofik@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?gem=5Fuserptr=5Fblits=3A_Refresh_still_MMAP=5FGTT_dependent_sub?=
 =?utf-8?q?tests_=28rev2=29?=
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
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/gem_userptr_blits: Refresh still MMAP_GTT dependent subtests (rev2)
URL   : https://patchwork.freedesktop.org/series/75557/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8284_full -> IGTPW_4442_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4442/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4442_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_userptr_blits@process-exit-mmap-busy@gtt} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][1] +11 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4442/shard-iclb2/igt@gem_userptr_blits@process-exit-mmap-busy@gtt.html

  * {igt@gem_userptr_blits@process-exit-mmap-busy@uc} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][2] +11 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4442/shard-tglb1/igt@gem_userptr_blits@process-exit-mmap-busy@uc.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8284_full and IGTPW_4442_full:

### New IGT tests (14) ###

  * igt@gem_userptr_blits@process-exit-mmap:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_userptr_blits@process-exit-mmap-busy:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_userptr_blits@process-exit-mmap-busy@gtt:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@gem_userptr_blits@process-exit-mmap-busy@uc:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@gem_userptr_blits@process-exit-mmap-busy@wb:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@gem_userptr_blits@process-exit-mmap-busy@wc:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@gem_userptr_blits@process-exit-mmap@gtt:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@gem_userptr_blits@process-exit-mmap@uc:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@gem_userptr_blits@process-exit-mmap@wb:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@gem_userptr_blits@process-exit-mmap@wc:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@gem_userptr_blits@readonly-mmap-unsync@gtt:
    - Statuses : 3 pass(s) 4 skip(s)
    - Exec time: [0.01] s

  * igt@gem_userptr_blits@readonly-mmap-unsync@uc:
    - Statuses : 3 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@gem_userptr_blits@readonly-mmap-unsync@wb:
    - Statuses : 3 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@gem_userptr_blits@readonly-mmap-unsync@wc:
    - Statuses : 3 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.00] s

  

Known issues
------------

  Here are the changes found in IGTPW_4442_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@engines-hostile@rcs0:
    - shard-iclb:         [PASS][3] -> [FAIL][4] ([i915#1622])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8284/shard-iclb1/igt@gem_ctx_persistence@engines-hostile@rcs0.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4442/shard-iclb6/igt@gem_ctx_persistence@engines-hostile@rcs0.html

  * igt@gem_exec_params@invalid-bsd-ring:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#109276])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8284/shard-iclb2/igt@gem_exec_params@invalid-bsd-ring.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4442/shard-iclb3/igt@gem_exec_params@invalid-bsd-ring.html

  * igt@gem_softpin@noreloc-s3:
    - shard-apl:          [PASS][7] -> [DMESG-WARN][8] ([i915#180]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8284/shard-apl4/igt@gem_softpin@noreloc-s3.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4442/shard-apl4/igt@gem_softpin@noreloc-s3.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-0:
    - shard-glk:          [PASS][9] -> [FAIL][10] ([i915#1119])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8284/shard-glk5/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4442/shard-glk6/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen:
    - shard-apl:          [PASS][11] -> [FAIL][12] ([i915#54] / [i915#95]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8284/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4442/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-random:
    - shard-kbl:          [PASS][13] -> [FAIL][14] ([i915#54] / [i915#93] / [i915#95]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8284/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4442/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [PASS][15] -> [FAIL][16] ([i915#72])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8284/shard-glk8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4442/shard-glk4/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_draw_crc@draw-method-rgb565-render-untiled:
    - shard-glk:          [PASS][17] -> [FAIL][18] ([i915#52] / [i915#54]) +2 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8284/shard-glk2/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4442/shard-glk5/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-glk:          [PASS][19] -> [FAIL][20] ([i915#79])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8284/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4442/shard-glk1/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render:
    - shard-kbl:          [PASS][21] -> [FAIL][22] ([i915#49])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8284/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4442/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
    - shard-apl:          [PASS][23] -> [FAIL][24] ([i915#49])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8284/shard-apl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4442/shard-apl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
    - shard-glk:          [PASS][25] -> [FAIL][26] ([i915#49])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8284/shard-glk1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4442/shard-glk5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-kbl:          [PASS][27] -> [DMESG-WARN][28] ([i915#180]) +3 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8284/shard-kbl3/igt@kms_hdr@bpc-switch-suspend.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4442/shard-kbl3/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_pipe_crc_basic@hang-read-crc-pipe-a:
    - shard-kbl:          [PASS][29] -> [FAIL][30] ([i915#53] / [i915#93] / [i915#95])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8284/shard-kbl7/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4442/shard-kbl2/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence:
    - shard-apl:          [PASS][31] -> [FAIL][32] ([i915#53] / [i915#95]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8284/shard-apl8/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4442/shard-apl8/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-128:
    - shard-kbl:          [PASS][33] -> [FAIL][34] ([i915#1559] / [i915#93] / [i915#95])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8284/shard-kbl7/igt@kms_plane_cursor@pipe-a-overlay-size-128.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4442/shard-kbl6/igt@kms_plane_cursor@pipe-a-overlay-size-128.html
    - shard-apl:          [PASS][35] -> [FAIL][36] ([i915#1559] / [i915#95])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8284/shard-apl2/igt@kms_plane_cursor@pipe-a-overlay-size-128.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4442/shard-apl7/igt@kms_plane_cursor@pipe-a-overlay-size-128.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [PASS][37] -> [FAIL][38] ([i915#899])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8284/shard-glk6/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4442/shard-glk3/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][39] -> [SKIP][40] ([fdo#109441]) +2 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8284/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4442/shard-iclb6/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm:
    - shard-hsw:          [PASS][41] -> [SKIP][42] ([fdo#109271])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8284/shard-hsw4/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4442/shard-hsw7/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html
    - shard-glk:          [PASS][43] -> [SKIP][44] ([fdo#109271])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8284/shard-glk7/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4442/shard-glk4/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html
    - shard-iclb:         [PASS][45] -> [SKIP][46] ([fdo#109278])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8284/shard-iclb5/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4442/shard-iclb8/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html
    - shard-tglb:         [PASS][47] -> [SKIP][48] ([fdo#112015])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8284/shard-tglb5/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4442/shard-tglb5/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@engines-hang@rcs0:
    - shard-iclb:         [FAIL][49] ([i915#1622]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8284/shard-iclb2/igt@gem_ctx_persistence@engines-hang@rcs0.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4442/shard-iclb6/igt@gem_ctx_persistence@engines-hang@rcs0.html

  * igt@gem_ctx_persistence@engines-mixed-process@vcs0:
    - shard-iclb:         [FAIL][51] ([i915#1528]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8284/shard-iclb1/igt@gem_ctx_persistence@engines-mixed-process@vcs0.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4442/shard-iclb7/igt@gem_ctx_persistence@engines-mixed-process@vcs0.html

  * igt@i915_pm_rpm@cursor:
    - shard-tglb:         [SKIP][53] ([i915#1316] / [i915#579]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8284/shard-tglb8/igt@i915_pm_rpm@cursor.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4442/shard-tglb8/igt@i915_pm_rpm@cursor.html
    - shard-hsw:          [SKIP][55] ([fdo#109271]) -> [PASS][56] +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8284/shard-hsw6/igt@i915_pm_rpm@cursor.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4442/shard-hsw7/igt@i915_pm_rpm@cursor.html
    - shard-iclb:         [SKIP][57] ([i915#1316] / [i915#579]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8284/shard-iclb1/igt@i915_pm_rpm@cursor.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4442/shard-iclb6/igt@i915_pm_rpm@cursor.html

  * igt@kms_big_fb@linear-32bpp-rotate-0:
    - shard-kbl:          [FAIL][59] ([i915#1119] / [i915#93] / [i915#95]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8284/shard-kbl3/igt@kms_big_fb@linear-32bpp-rotate-0.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4442/shard-kbl7/igt@kms_big_fb@linear-32bpp-rotate-0.html
    - shard-apl:          [FAIL][61] ([i915#1119] / [i915#95]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8284/shard-apl2/igt@kms_big_fb@linear-32bpp-rotate-0.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4442/shard-apl7/igt@kms_big_fb@linear-32bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-sliding:
    - shard-apl:          [FAIL][63] ([i915#54] / [i915#95]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8284/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-256x256-sliding.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4442/shard-apl1/igt@kms_cursor_crc@pipe-a-cursor-256x256-sliding.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-random:
    - shard-kbl:          [FAIL][65] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8284/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4442/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][67] ([i915#180]) -> [PASS][68] +5 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8284/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4442/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_draw_crc@draw-method-rgb565-render-ytiled:
    - shard-glk:          [FAIL][69] ([i915#52] / [i915#54]) -> [PASS][70] +7 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8284/shard-glk7/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4442/shard-glk4/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-glk:          [FAIL][71] ([i915#34]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8284/shard-glk8/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4442/shard-glk7/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-apl:          [DMESG-WARN][73] ([i915#180]) -> [PASS][74] +3 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8284/shard-apl3/igt@kms_flip@flip-vs-suspend-interruptible.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4442/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff:
    - shard-snb:          [SKIP][75] ([fdo#109271]) -> [PASS][76] +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8284/shard-snb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4442/shard-snb5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_mmap_write_crc@main:
    - shard-kbl:          [FAIL][77] ([i915#93] / [i915#95]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8284/shard-kbl7/igt@kms_mmap_write_crc@main.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4442/shard-kbl4/igt@kms_mmap_write_crc@main.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-a:
    - shard-apl:          [FAIL][79] ([i915#53] / [i915#95]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8284/shard-apl2/igt@kms_pipe_crc_basic@read-crc-pipe-a.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4442/shard-apl1/igt@kms_pipe_crc_basic@read-crc-pipe-a.html
    - shard-kbl:          [FAIL][81] ([i915#53] / [i915#93] / [i915#95]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8284/shard-kbl7/igt@kms_pipe_crc_basic@read-crc-pipe-a.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4442/shard-kbl1/igt@kms_pipe_crc_basic@read-crc-pipe-a.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-256:
    - shard-apl:          [FAIL][83] ([i915#1559] / [i915#95]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8284/shard-apl7/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4442/shard-apl8/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
    - shard-kbl:          [FAIL][85] ([i915#1559] / [i915#93] / [i915#95]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8284/shard-kbl4/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4442/shard-kbl4/igt@kms_plane_cursor@pipe-a-viewport-size-256.html

  * igt@kms_psr@psr2_sprite_mmap_cpu:
    - shard-iclb:         [SKIP][87] ([fdo#109441]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8284/shard-iclb1/igt@kms_psr@psr2_sprite_mmap_cpu.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4442/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_cpu.html

  * {igt@perf@blocking-parameterized}:
    - shard-hsw:          [FAIL][89] ([i915#1542]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8284/shard-hsw6/igt@perf@blocking-parameterized.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4442/shard-hsw4/igt@perf@blocking-parameterized.html

  * igt@perf@oa-formats:
    - shard-iclb:         [SKIP][91] ([i915#405]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8284/shard-iclb4/igt@perf@oa-formats.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4442/shard-iclb3/igt@perf@oa-formats.html
    - shard-glk:          [SKIP][93] ([fdo#109271]) -> [PASS][94] +1 similar issue
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8284/shard-glk1/igt@perf@oa-formats.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4442/shard-glk5/igt@perf@oa-formats.html
    - shard-apl:          [SKIP][95] ([fdo#109271]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8284/shard-apl4/igt@perf@oa-formats.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4442/shard-apl4/igt@perf@oa-formats.html
    - shard-kbl:          [SKIP][97] ([fdo#109271]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8284/shard-kbl6/igt@perf@oa-formats.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4442/shard-kbl7/igt@perf@oa-formats.html
    - shard-tglb:         [SKIP][99] ([i915#405]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8284/shard-tglb5/igt@perf@oa-formats.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4442/shard-tglb5/igt@perf@oa-formats.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [FAIL][101] ([i915#454]) -> [SKIP][102] ([i915#468])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8284/shard-tglb1/igt@i915_pm_dc@dc6-dpms.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4442/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [SKIP][103] ([i915#468]) -> [FAIL][104] ([i915#454])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8284/shard-tglb2/igt@i915_pm_dc@dc6-psr.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4442/shard-tglb5/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_suspend@sysfs-reader:
    - shard-kbl:          [INCOMPLETE][105] ([CI#80] / [i915#155]) -> [DMESG-WARN][106] ([i915#180])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8284/shard-kbl4/igt@i915_suspend@sysfs-reader.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4442/shard-kbl4/igt@i915_suspend@sysfs-reader.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-kbl:          [FAIL][107] ([i915#93] / [i915#95]) -> [DMESG-FAIL][108] ([i915#180] / [i915#95])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8284/shard-kbl2/igt@kms_fbcon_fbt@fbc-suspend.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4442/shard-kbl3/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-kbl:          [DMESG-WARN][109] ([i915#180] / [i915#93] / [i915#95]) -> [DMESG-WARN][110] ([i915#180])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8284/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4442/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
    - shard-apl:          [FAIL][111] ([fdo#108145] / [i915#265]) -> [FAIL][112] ([fdo#108145] / [i915#265] / [i915#95])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8284/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4442/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [SKIP][113] ([fdo#109642] / [fdo#111068]) -> [FAIL][114] ([i915#608])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8284/shard-iclb7/igt@kms_psr2_su@page_flip.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4442/shard-iclb2/igt@kms_psr2_su@page_flip.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#112015]: https://bugs.freedesktop.org/show_bug.cgi?id=112015
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1528]: https://gitlab.freedesktop.org/drm/intel/issues/1528
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#1622]: https://gitlab.freedesktop.org/drm/intel/issues/1622
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#34]: https://gitlab.freedesktop.org/drm/intel/issues/34
  [i915#405]: https://gitlab.freedesktop.org/drm/intel/issues/405
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#53]: https://gitlab.freedesktop.org/drm/intel/issues/53
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#608]: https://gitlab.freedesktop.org/drm/intel/issues/608
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5586 -> IGTPW_4442
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8284: 307cf5040adae84648708ec34c64402dddff0171 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4442: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4442/index.html
  IGT_5586: 29fad328e6a1b105c8d688cafe19b1b5c19ad0c8 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4442/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
