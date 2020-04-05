Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sun, 05 Apr 2020 02:16:38 -0000
Message-ID: <158605299848.21319.13371567985848928730@emeril.freedesktop.org>
References: <20200404104140.1242766-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200404104140.1242766-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3Iga21zX2Zs?=
 =?utf-8?q?ip=3A_Skip_interruptible_testing_for_negative_and_hangs_tests?=
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

Series: kms_flip: Skip interruptible testing for negative and hangs tests
URL   : https://patchwork.freedesktop.org/series/75493/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8253_full -> IGTPW_4406_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4406/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4406_full:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@gem_exec_schedule@pi-shared-iova@rcs0}:
    - shard-tglb:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8253/shard-tglb5/igt@gem_exec_schedule@pi-shared-iova@rcs0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4406/shard-tglb6/igt@gem_exec_schedule@pi-shared-iova@rcs0.html

  
Known issues
------------

  Here are the changes found in IGTPW_4406_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#110854])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8253/shard-iclb1/igt@gem_exec_balancer@smoke.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4406/shard-iclb3/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_params@invalid-bsd-ring:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#109276])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8253/shard-iclb1/igt@gem_exec_params@invalid-bsd-ring.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4406/shard-iclb7/igt@gem_exec_params@invalid-bsd-ring.html

  * igt@gem_softpin@noreloc-s3:
    - shard-apl:          [PASS][7] -> [DMESG-WARN][8] ([i915#180])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8253/shard-apl8/igt@gem_softpin@noreloc-s3.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4406/shard-apl1/igt@gem_softpin@noreloc-s3.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-glk:          [PASS][9] -> [INCOMPLETE][10] ([i915#58] / [k.org#198133])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8253/shard-glk3/igt@gem_workarounds@suspend-resume-fd.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4406/shard-glk6/igt@gem_workarounds@suspend-resume-fd.html

  * igt@kms_big_fb@linear-32bpp-rotate-0:
    - shard-kbl:          [PASS][11] -> [FAIL][12] ([i915#1119] / [i915#93] / [i915#95])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8253/shard-kbl3/igt@kms_big_fb@linear-32bpp-rotate-0.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4406/shard-kbl3/igt@kms_big_fb@linear-32bpp-rotate-0.html
    - shard-apl:          [PASS][13] -> [FAIL][14] ([i915#1119] / [i915#95])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8253/shard-apl7/igt@kms_big_fb@linear-32bpp-rotate-0.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4406/shard-apl6/igt@kms_big_fb@linear-32bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding:
    - shard-apl:          [PASS][15] -> [FAIL][16] ([i915#54] / [i915#95])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8253/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4406/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-random:
    - shard-kbl:          [PASS][17] -> [FAIL][18] ([i915#54] / [i915#93] / [i915#95])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8253/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4406/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [PASS][19] -> [DMESG-WARN][20] ([i915#180] / [i915#93] / [i915#95])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8253/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4406/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-glk:          [PASS][21] -> [FAIL][22] ([i915#117] / [i915#133])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8253/shard-glk2/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4406/shard-glk6/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@all-pipes-torture-bo:
    - shard-glk:          [PASS][23] -> [DMESG-WARN][24] ([i915#128])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8253/shard-glk1/igt@kms_cursor_legacy@all-pipes-torture-bo.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4406/shard-glk1/igt@kms_cursor_legacy@all-pipes-torture-bo.html

  * igt@kms_draw_crc@draw-method-rgb565-blt-ytiled:
    - shard-glk:          [PASS][25] -> [FAIL][26] ([i915#52] / [i915#54]) +2 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8253/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4406/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled:
    - shard-glk:          [PASS][27] -> [FAIL][28] ([i915#177] / [i915#52] / [i915#54])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8253/shard-glk7/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4406/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled:
    - shard-kbl:          [PASS][29] -> [FAIL][30] ([fdo#108145] / [i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8253/shard-kbl2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4406/shard-kbl2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
    - shard-apl:          [PASS][31] -> [FAIL][32] ([fdo#108145] / [i915#52] / [i915#54] / [i915#95])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8253/shard-apl8/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4406/shard-apl7/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [PASS][33] -> [FAIL][34] ([i915#53] / [i915#93] / [i915#95])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8253/shard-kbl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4406/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
    - shard-apl:          [PASS][35] -> [FAIL][36] ([i915#53] / [i915#95])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8253/shard-apl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4406/shard-apl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-kbl:          [PASS][37] -> [DMESG-WARN][38] ([i915#180]) +4 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8253/shard-kbl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4406/shard-kbl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [PASS][39] -> [SKIP][40] ([fdo#109441]) +2 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8253/shard-iclb2/igt@kms_psr@psr2_no_drrs.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4406/shard-iclb8/igt@kms_psr@psr2_no_drrs.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s0:
    - shard-tglb:         [INCOMPLETE][41] ([i915#456]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8253/shard-tglb2/igt@gem_exec_suspend@basic-s0.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4406/shard-tglb3/igt@gem_exec_suspend@basic-s0.html

  * igt@i915_selftest@live@gt_heartbeat:
    - shard-hsw:          [INCOMPLETE][43] ([i915#61]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8253/shard-hsw1/igt@i915_selftest@live@gt_heartbeat.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4406/shard-hsw4/igt@i915_selftest@live@gt_heartbeat.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen:
    - shard-kbl:          [FAIL][45] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8253/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4406/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-64x64-random:
    - shard-kbl:          [FAIL][47] ([i915#54]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8253/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-64x64-random.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4406/shard-kbl6/igt@kms_cursor_crc@pipe-c-cursor-64x64-random.html
    - shard-apl:          [FAIL][49] ([i915#54]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8253/shard-apl3/igt@kms_cursor_crc@pipe-c-cursor-64x64-random.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4406/shard-apl3/igt@kms_cursor_crc@pipe-c-cursor-64x64-random.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][51] ([i915#180]) -> [PASS][52] +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8253/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4406/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_cursor_edge_walk@pipe-a-128x128-bottom-edge:
    - shard-apl:          [FAIL][53] ([i915#70] / [i915#95]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8253/shard-apl8/igt@kms_cursor_edge_walk@pipe-a-128x128-bottom-edge.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4406/shard-apl8/igt@kms_cursor_edge_walk@pipe-a-128x128-bottom-edge.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic:
    - shard-kbl:          [FAIL][55] ([i915#93] / [i915#95]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8253/shard-kbl6/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4406/shard-kbl4/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-xtiled:
    - shard-glk:          [FAIL][57] ([i915#52] / [i915#54]) -> [PASS][58] +4 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8253/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-xtiled.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4406/shard-glk3/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-xtiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled:
    - shard-apl:          [FAIL][59] ([i915#52] / [i915#54] / [i915#95]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8253/shard-apl7/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4406/shard-apl1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
    - shard-kbl:          [FAIL][61] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8253/shard-kbl3/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4406/shard-kbl4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-hsw:          [FAIL][63] ([i915#46]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8253/shard-hsw1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4406/shard-hsw2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-apl:          [DMESG-WARN][65] ([i915#180]) -> [PASS][66] +2 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8253/shard-apl3/igt@kms_flip@flip-vs-suspend-interruptible.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4406/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-cpu:
    - shard-glk:          [FAIL][67] ([i915#49]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8253/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-cpu.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4406/shard-glk7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][69] ([fdo#109441]) -> [PASS][70] +3 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8253/shard-iclb8/igt@kms_psr@psr2_sprite_plane_move.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4406/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  * {igt@perf@polling-parameterized}:
    - shard-tglb:         [FAIL][71] ([i915#1542]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8253/shard-tglb3/igt@perf@polling-parameterized.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4406/shard-tglb8/igt@perf@polling-parameterized.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [FAIL][73] ([i915#454]) -> [SKIP][74] ([i915#468])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8253/shard-tglb7/igt@i915_pm_dc@dc6-dpms.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4406/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-kbl:          [FAIL][75] ([i915#64] / [i915#93] / [i915#95]) -> [FAIL][76] ([i915#64])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8253/shard-kbl4/igt@kms_fbcon_fbt@fbc-suspend.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4406/shard-kbl4/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:
    - shard-kbl:          [FAIL][77] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95]) -> [FAIL][78] ([fdo#108145] / [i915#265])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8253/shard-kbl4/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4406/shard-kbl1/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-basic:
    - shard-apl:          [FAIL][79] ([fdo#108145] / [i915#265] / [i915#95]) -> [FAIL][80] ([fdo#108145] / [i915#265]) +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8253/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4406/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
    - shard-apl:          [FAIL][81] ([fdo#108145] / [i915#265]) -> [FAIL][82] ([fdo#108145] / [i915#265] / [i915#95])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8253/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4406/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
    - shard-kbl:          [FAIL][83] ([fdo#108145] / [i915#265]) -> [FAIL][84] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8253/shard-kbl2/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4406/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#117]: https://gitlab.freedesktop.org/drm/intel/issues/117
  [i915#128]: https://gitlab.freedesktop.org/drm/intel/issues/128
  [i915#133]: https://gitlab.freedesktop.org/drm/intel/issues/133
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1604]: https://gitlab.freedesktop.org/drm/intel/issues/1604
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#46]: https://gitlab.freedesktop.org/drm/intel/issues/46
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#53]: https://gitlab.freedesktop.org/drm/intel/issues/53
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#64]: https://gitlab.freedesktop.org/drm/intel/issues/64
  [i915#70]: https://gitlab.freedesktop.org/drm/intel/issues/70
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5563 -> IGTPW_4406
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8253: 8bbc7715c48433ba115be5c3066d029891819547 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4406: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4406/index.html
  IGT_5563: 7ab7807727262b7ed7e12197b78e867287a17ef6 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4406/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
