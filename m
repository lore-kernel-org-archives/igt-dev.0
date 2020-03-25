Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 25 Mar 2020 14:56:04 -0000
Message-ID: <158514816409.29634.13246343238322395294@emeril.freedesktop.org>
References: <20200325123318.240545-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200325123318.240545-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgcnVubmVy?=
 =?utf-8?q?=3A_Only_show_the_kmsg_underflow/overflow_message_once?=
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

Series: runner: Only show the kmsg underflow/overflow message once
URL   : https://patchwork.freedesktop.org/series/75072/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8186_full -> IGTPW_4349_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4349/index.html

Known issues
------------

  Here are the changes found in IGTPW_4349_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [PASS][1] -> [SKIP][2] ([fdo#112080]) +15 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-iclb4/igt@gem_busy@busy-vcs1.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4349/shard-iclb5/igt@gem_busy@busy-vcs1.html

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-kbl:          [PASS][3] -> [DMESG-WARN][4] ([i915#180]) +3 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-kbl4/igt@gem_ctx_isolation@rcs0-s3.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4349/shard-kbl4/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#110841])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-iclb6/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4349/shard-iclb4/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_schedule@implicit-read-write-bsd1:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#109276] / [i915#677])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-iclb2/igt@gem_exec_schedule@implicit-read-write-bsd1.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4349/shard-iclb6/igt@gem_exec_schedule@implicit-read-write-bsd1.html

  * igt@gem_exec_schedule@in-order-bsd:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#112146]) +2 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-iclb5/igt@gem_exec_schedule@in-order-bsd.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4349/shard-iclb2/igt@gem_exec_schedule@in-order-bsd.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([i915#677]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-iclb3/igt@gem_exec_schedule@pi-common-bsd.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4349/shard-iclb2/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_linear_blits@interruptible:
    - shard-apl:          [PASS][13] -> [FAIL][14] ([i915#1263])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-apl8/igt@gem_linear_blits@interruptible.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4349/shard-apl2/igt@gem_linear_blits@interruptible.html

  * igt@gem_userptr_blits@sync-unmap-after-close:
    - shard-hsw:          [PASS][15] -> [DMESG-WARN][16] ([fdo#111870]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-hsw7/igt@gem_userptr_blits@sync-unmap-after-close.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4349/shard-hsw4/igt@gem_userptr_blits@sync-unmap-after-close.html
    - shard-snb:          [PASS][17] -> [DMESG-WARN][18] ([fdo#111870] / [i915#478]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-snb2/igt@gem_userptr_blits@sync-unmap-after-close.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4349/shard-snb6/igt@gem_userptr_blits@sync-unmap-after-close.html

  * igt@i915_pm_rpm@system-suspend:
    - shard-tglb:         [PASS][19] -> [SKIP][20] ([i915#1316])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-tglb7/igt@i915_pm_rpm@system-suspend.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4349/shard-tglb3/igt@i915_pm_rpm@system-suspend.html
    - shard-iclb:         [PASS][21] -> [SKIP][22] ([i915#1316])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-iclb4/igt@i915_pm_rpm@system-suspend.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4349/shard-iclb4/igt@i915_pm_rpm@system-suspend.html
    - shard-glk:          [PASS][23] -> [SKIP][24] ([fdo#109271])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-glk1/igt@i915_pm_rpm@system-suspend.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4349/shard-glk5/igt@i915_pm_rpm@system-suspend.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-apl:          [PASS][25] -> [FAIL][26] ([i915#1119] / [i915#95])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-apl4/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4349/shard-apl7/igt@kms_big_fb@linear-32bpp-rotate-180.html
    - shard-kbl:          [PASS][27] -> [FAIL][28] ([i915#1119] / [i915#93] / [i915#95]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-kbl6/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4349/shard-kbl7/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen:
    - shard-kbl:          [PASS][29] -> [FAIL][30] ([i915#54] / [i915#93] / [i915#95]) +3 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4349/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-apl:          [PASS][31] -> [DMESG-WARN][32] ([i915#180]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-apl3/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4349/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_draw_crc@draw-method-rgb565-blt-ytiled:
    - shard-glk:          [PASS][33] -> [FAIL][34] ([i915#52] / [i915#54]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-glk5/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4349/shard-glk2/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled:
    - shard-glk:          [PASS][35] -> [FAIL][36] ([i915#177] / [i915#52] / [i915#54])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-glk1/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4349/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-kbl:          [PASS][37] -> [DMESG-WARN][38] ([i915#180] / [i915#93] / [i915#95])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-kbl4/igt@kms_fbcon_fbt@fbc-suspend.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4349/shard-kbl4/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-glk:          [PASS][39] -> [FAIL][40] ([i915#79])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-glk8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4349/shard-glk3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant:
    - shard-kbl:          [PASS][41] -> [FAIL][42] ([fdo#108145] / [i915#93] / [i915#95])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-kbl1/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4349/shard-kbl3/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
    - shard-apl:          [PASS][43] -> [FAIL][44] ([fdo#108145] / [i915#95])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4349/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [PASS][45] -> [SKIP][46] ([fdo#109441]) +2 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-iclb2/igt@kms_psr@psr2_cursor_render.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4349/shard-iclb1/igt@kms_psr@psr2_cursor_render.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [PASS][47] -> [SKIP][48] ([fdo#109276]) +19 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-iclb1/igt@prime_busy@hang-bsd2.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4349/shard-iclb3/igt@prime_busy@hang-bsd2.html

  
#### Possible fixes ####

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [SKIP][49] ([fdo#110854]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-iclb5/igt@gem_exec_balancer@smoke.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4349/shard-iclb1/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [SKIP][51] ([fdo#112146]) -> [PASS][52] +8 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-iclb2/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4349/shard-iclb7/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_exec_schedule@promotion-bsd1:
    - shard-iclb:         [SKIP][53] ([fdo#109276]) -> [PASS][54] +14 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-iclb8/igt@gem_exec_schedule@promotion-bsd1.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4349/shard-iclb4/igt@gem_exec_schedule@promotion-bsd1.html

  * igt@gem_linear_blits@interruptible:
    - shard-hsw:          [FAIL][55] -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-hsw7/igt@gem_linear_blits@interruptible.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4349/shard-hsw4/igt@gem_linear_blits@interruptible.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-random:
    - shard-kbl:          [FAIL][57] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][58] +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4349/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html
    - shard-apl:          [FAIL][59] ([i915#54] / [i915#95]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4349/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding:
    - shard-apl:          [FAIL][61] ([i915#54]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4349/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding.html
    - shard-glk:          [FAIL][63] ([i915#54]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-glk1/igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4349/shard-glk5/igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding.html
    - shard-kbl:          [FAIL][65] ([i915#54]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4349/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding.html

  * igt@kms_cursor_edge_walk@pipe-a-64x64-top-edge:
    - shard-kbl:          [FAIL][67] ([i915#70] / [i915#93] / [i915#95]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-kbl6/igt@kms_cursor_edge_walk@pipe-a-64x64-top-edge.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4349/shard-kbl3/igt@kms_cursor_edge_walk@pipe-a-64x64-top-edge.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size:
    - shard-snb:          [SKIP][69] ([fdo#109271]) -> [PASS][70] +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-snb2/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4349/shard-snb6/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-untiled:
    - shard-glk:          [FAIL][71] ([i915#52] / [i915#54]) -> [PASS][72] +5 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-glk7/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-untiled.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4349/shard-glk3/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-untiled.html

  * igt@kms_flip@blocking-wf_vblank:
    - shard-glk:          [FAIL][73] ([i915#34]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-glk3/igt@kms_flip@blocking-wf_vblank.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4349/shard-glk3/igt@kms_flip@blocking-wf_vblank.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-gtt:
    - shard-snb:          [DMESG-WARN][75] ([i915#478]) -> [PASS][76] +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-snb2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-gtt.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4349/shard-snb5/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [DMESG-WARN][77] ([i915#180] / [i915#93] / [i915#95]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4349/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_pipe_crc_basic@hang-read-crc-pipe-a:
    - shard-kbl:          [FAIL][79] ([i915#53] / [i915#93] / [i915#95]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-kbl7/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4349/shard-kbl1/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
    - shard-apl:          [FAIL][81] ([i915#53] / [i915#95]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-apl1/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4349/shard-apl7/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-kbl:          [DMESG-WARN][83] ([i915#180]) -> [PASS][84] +1 similar issue
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-kbl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4349/shard-kbl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-apl:          [DMESG-WARN][85] ([i915#180] / [i915#95]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-apl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4349/shard-apl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [FAIL][87] ([i915#173]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-iclb1/igt@kms_psr@no_drrs.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4349/shard-iclb7/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [SKIP][89] ([fdo#109441]) -> [PASS][90] +2 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-iclb8/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4349/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [INCOMPLETE][91] ([i915#155]) -> [PASS][92] +1 similar issue
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-kbl1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4349/shard-kbl1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [FAIL][93] ([i915#1085]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-tglb8/igt@perf@gen12-mi-rpc.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4349/shard-tglb1/igt@perf@gen12-mi-rpc.html

  * igt@perf_pmu@busy-vcs1:
    - shard-iclb:         [SKIP][95] ([fdo#112080]) -> [PASS][96] +9 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-iclb5/igt@perf_pmu@busy-vcs1.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4349/shard-iclb1/igt@perf_pmu@busy-vcs1.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][97] ([i915#658]) -> [SKIP][98] ([i915#588])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-iclb1/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4349/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:
    - shard-kbl:          [FAIL][99] ([fdo#108145] / [i915#93] / [i915#95]) -> [FAIL][100] ([fdo#108145])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-kbl1/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4349/shard-kbl1/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html
    - shard-apl:          [FAIL][101] ([fdo#108145] / [i915#95]) -> [FAIL][102] ([fdo#108145])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-apl7/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4349/shard-apl4/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html

  * igt@runner@aborted:
    - shard-hsw:          ([FAIL][103], [FAIL][104], [FAIL][105], [FAIL][106], [FAIL][107], [FAIL][108], [FAIL][109], [FAIL][110]) ([fdo#109271] / [fdo#111870] / [i915#1485]) -> ([FAIL][111], [FAIL][112], [FAIL][113], [FAIL][114], [FAIL][115], [FAIL][116], [FAIL][117], [FAIL][118]) ([fdo#111870] / [i915#1485])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-hsw2/igt@runner@aborted.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-hsw1/igt@runner@aborted.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-hsw6/igt@runner@aborted.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-hsw7/igt@runner@aborted.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-hsw7/igt@runner@aborted.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-hsw6/igt@runner@aborted.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-hsw5/igt@runner@aborted.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-hsw4/igt@runner@aborted.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4349/shard-hsw6/igt@runner@aborted.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4349/shard-hsw4/igt@runner@aborted.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4349/shard-hsw7/igt@runner@aborted.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4349/shard-hsw1/igt@runner@aborted.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4349/shard-hsw2/igt@runner@aborted.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4349/shard-hsw7/igt@runner@aborted.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4349/shard-hsw7/igt@runner@aborted.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4349/shard-hsw5/igt@runner@aborted.html
    - shard-snb:          ([FAIL][119], [FAIL][120], [FAIL][121], [FAIL][122], [FAIL][123], [FAIL][124], [FAIL][125], [FAIL][126]) ([fdo#111870] / [i915#1077] / [i915#1485] / [i915#698]) -> ([FAIL][127], [FAIL][128], [FAIL][129], [FAIL][130], [FAIL][131], [FAIL][132], [FAIL][133], [FAIL][134]) ([fdo#111870] / [i915#1077] / [i915#1485])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-snb2/igt@runner@aborted.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-snb6/igt@runner@aborted.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-snb4/igt@runner@aborted.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-snb4/igt@runner@aborted.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-snb1/igt@runner@aborted.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-snb2/igt@runner@aborted.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-snb6/igt@runner@aborted.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-snb1/igt@runner@aborted.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4349/shard-snb2/igt@runner@aborted.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4349/shard-snb5/igt@runner@aborted.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4349/shard-snb6/igt@runner@aborted.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4349/shard-snb1/igt@runner@aborted.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4349/shard-snb2/igt@runner@aborted.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4349/shard-snb2/igt@runner@aborted.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4349/shard-snb6/igt@runner@aborted.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4349/shard-snb1/igt@runner@aborted.html

  
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1077]: https://gitlab.freedesktop.org/drm/intel/issues/1077
  [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#1263]: https://gitlab.freedesktop.org/drm/intel/issues/1263
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1485]: https://gitlab.freedesktop.org/drm/intel/issues/1485
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#34]: https://gitlab.freedesktop.org/drm/intel/issues/34
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#53]: https://gitlab.freedesktop.org/drm/intel/issues/53
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#698]: https://gitlab.freedesktop.org/drm/intel/issues/698
  [i915#70]: https://gitlab.freedesktop.org/drm/intel/issues/70
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5537 -> IGTPW_4349
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8186: 1abdd8c4027177dd054471cf58a5e9ec3f2df46d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4349: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4349/index.html
  IGT_5537: 190245120758e754813d76b2c6c613413a0dba29 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4349/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
