Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 26 Mar 2020 02:58:12 -0000
Message-ID: <158519149294.23002.3563749757779949055@emeril.freedesktop.org>
References: <20200325215005.5489-1-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20200325215005.5489-1-umesh.nerlige.ramappa@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgVGVzdCBj?=
 =?utf-8?q?onfigurable_poll_delay_in_perf_OA_=28rev4=29?=
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
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Test configurable poll delay in perf OA (rev4)
URL   : https://patchwork.freedesktop.org/series/74655/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8190_full -> IGTPW_4353_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4353_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4353_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4353/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4353_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-apl8/igt@kms_fbcon_fbt@fbc-suspend.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4353/shard-apl2/igt@kms_fbcon_fbt@fbc-suspend.html

  * {igt@perf@blocking-parameterized} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][3] +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4353/shard-iclb8/igt@perf@blocking-parameterized.html

  * {igt@perf@polling-parameterized} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][4] +1 similar issue
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4353/shard-tglb2/igt@perf@polling-parameterized.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8190_full and IGTPW_4353_full:

### New IGT tests (2) ###

  * igt@perf@blocking-parameterized:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@perf@polling-parameterized:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_4353_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@bcs0-s3:
    - shard-kbl:          [PASS][5] -> [DMESG-WARN][6] ([i915#180]) +4 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-kbl4/igt@gem_ctx_isolation@bcs0-s3.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4353/shard-kbl1/igt@gem_ctx_isolation@bcs0-s3.html

  * igt@gem_exec_balancer@hang:
    - shard-tglb:         [PASS][7] -> [FAIL][8] ([i915#1277])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-tglb7/igt@gem_exec_balancer@hang.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4353/shard-tglb5/igt@gem_exec_balancer@hang.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#110854])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-iclb1/igt@gem_exec_balancer@smoke.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4353/shard-iclb5/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_schedule@implicit-write-read-bsd1:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([fdo#109276] / [i915#677]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-iclb2/igt@gem_exec_schedule@implicit-write-read-bsd1.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4353/shard-iclb5/igt@gem_exec_schedule@implicit-write-read-bsd1.html

  * igt@gem_exec_schedule@in-order-bsd:
    - shard-iclb:         [PASS][13] -> [SKIP][14] ([fdo#112146]) +4 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-iclb3/igt@gem_exec_schedule@in-order-bsd.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4353/shard-iclb2/igt@gem_exec_schedule@in-order-bsd.html

  * igt@gem_exec_schedule@preempt-contexts-bsd2:
    - shard-iclb:         [PASS][15] -> [SKIP][16] ([fdo#109276]) +22 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-iclb1/igt@gem_exec_schedule@preempt-contexts-bsd2.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4353/shard-iclb3/igt@gem_exec_schedule@preempt-contexts-bsd2.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-apl:          [PASS][17] -> [FAIL][18] ([i915#1119] / [i915#95]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-apl3/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4353/shard-apl7/igt@kms_big_fb@linear-32bpp-rotate-180.html
    - shard-kbl:          [PASS][19] -> [FAIL][20] ([i915#1119] / [i915#93] / [i915#95]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-kbl3/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4353/shard-kbl3/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen:
    - shard-kbl:          [PASS][21] -> [FAIL][22] ([i915#54] / [i915#93] / [i915#95]) +3 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4353/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled:
    - shard-glk:          [PASS][23] -> [FAIL][24] ([i915#52] / [i915#54]) +4 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-glk5/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4353/shard-glk4/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-render-untiled:
    - shard-kbl:          [PASS][25] -> [FAIL][26] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-kbl3/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4353/shard-kbl1/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html
    - shard-apl:          [PASS][27] -> [FAIL][28] ([i915#52] / [i915#54] / [i915#95])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-apl4/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4353/shard-apl3/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-kbl:          [PASS][29] -> [FAIL][30] ([i915#64])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-kbl6/igt@kms_fbcon_fbt@fbc-suspend.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4353/shard-kbl3/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-kbl:          [PASS][31] -> [FAIL][32] ([i915#79])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-kbl3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4353/shard-kbl6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-256:
    - shard-apl:          [PASS][33] -> [FAIL][34] ([i915#95])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-apl3/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4353/shard-apl8/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
    - shard-kbl:          [PASS][35] -> [FAIL][36] ([i915#93] / [i915#95])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-kbl7/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4353/shard-kbl6/igt@kms_plane_cursor@pipe-a-viewport-size-256.html

  * igt@kms_psr@psr2_cursor_blt:
    - shard-iclb:         [PASS][37] -> [SKIP][38] ([fdo#109441]) +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4353/shard-iclb6/igt@kms_psr@psr2_cursor_blt.html

  * igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm:
    - shard-tglb:         [PASS][39] -> [SKIP][40] ([fdo#112015])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-tglb3/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4353/shard-tglb1/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html
    - shard-iclb:         [PASS][41] -> [SKIP][42] ([fdo#109278])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-iclb5/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4353/shard-iclb8/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html
    - shard-glk:          [PASS][43] -> [SKIP][44] ([fdo#109271])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-glk1/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4353/shard-glk9/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [PASS][45] -> [FAIL][46] ([i915#1085])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-tglb2/igt@perf@gen12-mi-rpc.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4353/shard-tglb7/igt@perf@gen12-mi-rpc.html

  * igt@perf_pmu@init-busy-vcs1:
    - shard-iclb:         [PASS][47] -> [SKIP][48] ([fdo#112080]) +12 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-iclb4/igt@perf_pmu@init-busy-vcs1.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4353/shard-iclb7/igt@perf_pmu@init-busy-vcs1.html

  
#### Possible fixes ####

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [SKIP][49] ([fdo#110841]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-iclb1/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4353/shard-iclb8/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [SKIP][51] ([fdo#112080]) -> [PASS][52] +14 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-iclb5/igt@gem_exec_parallel@vcs1-fds.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4353/shard-iclb2/igt@gem_exec_parallel@vcs1-fds.html

  * igt@gem_exec_schedule@independent-bsd2:
    - shard-iclb:         [SKIP][53] ([fdo#109276]) -> [PASS][54] +16 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-iclb6/igt@gem_exec_schedule@independent-bsd2.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4353/shard-iclb4/igt@gem_exec_schedule@independent-bsd2.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [SKIP][55] ([i915#677]) -> [PASS][56] +2 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-iclb2/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4353/shard-iclb3/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [SKIP][57] ([fdo#112146]) -> [PASS][58] +5 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-iclb4/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4353/shard-iclb6/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_softpin@noreloc-s3:
    - shard-apl:          [DMESG-WARN][59] ([i915#180]) -> [PASS][60] +2 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-apl7/igt@gem_softpin@noreloc-s3.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4353/shard-apl8/igt@gem_softpin@noreloc-s3.html

  * igt@gem_userptr_blits@sync-unmap:
    - shard-snb:          [DMESG-WARN][61] ([fdo#111870] / [i915#478]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-snb6/igt@gem_userptr_blits@sync-unmap.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4353/shard-snb1/igt@gem_userptr_blits@sync-unmap.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-apl:          [DMESG-WARN][63] ([i915#716]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-apl7/igt@gen9_exec_parse@allowed-all.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4353/shard-apl6/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_rpm@i2c:
    - shard-tglb:         [SKIP][65] ([i915#1316]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-tglb2/igt@i915_pm_rpm@i2c.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4353/shard-tglb6/igt@i915_pm_rpm@i2c.html
    - shard-glk:          [SKIP][67] ([fdo#109271]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-glk3/igt@i915_pm_rpm@i2c.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4353/shard-glk2/igt@i915_pm_rpm@i2c.html
    - shard-iclb:         [SKIP][69] ([i915#1316]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-iclb7/igt@i915_pm_rpm@i2c.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4353/shard-iclb5/igt@i915_pm_rpm@i2c.html

  * igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen:
    - shard-kbl:          [FAIL][71] ([i915#54]) -> [PASS][72] +1 similar issue
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-kbl6/igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4353/shard-kbl7/igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen.html
    - shard-apl:          [FAIL][73] ([i915#54]) -> [PASS][74] +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-apl1/igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4353/shard-apl8/igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen.html
    - shard-glk:          [FAIL][75] ([i915#54]) -> [PASS][76] +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-glk7/igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4353/shard-glk9/igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled:
    - shard-glk:          [FAIL][77] ([i915#52] / [i915#54]) -> [PASS][78] +1 similar issue
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-glk1/igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4353/shard-glk1/igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled:
    - shard-kbl:          [FAIL][79] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-kbl7/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4353/shard-kbl4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
    - shard-apl:          [FAIL][81] ([i915#52] / [i915#54] / [i915#95]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-apl2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4353/shard-apl6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html

  * igt@kms_flip@basic-flip-vs-modeset:
    - shard-apl:          [DMESG-WARN][83] ([i915#1297]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-apl2/igt@kms_flip@basic-flip-vs-modeset.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4353/shard-apl7/igt@kms_flip@basic-flip-vs-modeset.html
    - shard-kbl:          [DMESG-WARN][85] ([i915#1297]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-kbl7/igt@kms_flip@basic-flip-vs-modeset.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4353/shard-kbl7/igt@kms_flip@basic-flip-vs-modeset.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-kbl:          [DMESG-WARN][87] ([i915#180]) -> [PASS][88] +1 similar issue
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-kbl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4353/shard-kbl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid:
    - shard-kbl:          [FAIL][89] ([fdo#108145] / [i915#93] / [i915#95]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-kbl2/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4353/shard-kbl3/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-128:
    - shard-apl:          [FAIL][91] ([i915#95]) -> [PASS][92] +1 similar issue
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-apl8/igt@kms_plane_cursor@pipe-a-viewport-size-128.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4353/shard-apl1/igt@kms_plane_cursor@pipe-a-viewport-size-128.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-64:
    - shard-kbl:          [FAIL][93] ([i915#93] / [i915#95]) -> [PASS][94] +1 similar issue
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-kbl4/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4353/shard-kbl2/igt@kms_plane_cursor@pipe-a-viewport-size-64.html

  * igt@kms_plane_lowres@pipe-a-tiling-y:
    - shard-glk:          [FAIL][95] ([i915#899]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-glk8/igt@kms_plane_lowres@pipe-a-tiling-y.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4353/shard-glk5/igt@kms_plane_lowres@pipe-a-tiling-y.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [SKIP][97] ([fdo#109642] / [fdo#111068]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-iclb3/igt@kms_psr2_su@frontbuffer.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4353/shard-iclb2/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [FAIL][99] ([i915#173]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-iclb1/igt@kms_psr@no_drrs.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4353/shard-iclb8/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_sprite_render:
    - shard-iclb:         [SKIP][101] ([fdo#109441]) -> [PASS][102] +1 similar issue
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-iclb8/igt@kms_psr@psr2_sprite_render.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4353/shard-iclb2/igt@kms_psr@psr2_sprite_render.html

  
#### Warnings ####

  * igt@i915_pm_rpm@modeset-pc8-residency-stress:
    - shard-tglb:         [SKIP][103] ([i915#1316]) -> [SKIP][104] ([fdo#109506])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-tglb2/igt@i915_pm_rpm@modeset-pc8-residency-stress.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4353/shard-tglb5/igt@i915_pm_rpm@modeset-pc8-residency-stress.html
    - shard-iclb:         [SKIP][105] ([i915#1316]) -> [SKIP][106] ([fdo#109293] / [fdo#109506])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-iclb7/igt@i915_pm_rpm@modeset-pc8-residency-stress.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4353/shard-iclb7/igt@i915_pm_rpm@modeset-pc8-residency-stress.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][107] ([i915#180]) -> [INCOMPLETE][108] ([i915#155])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4353/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-basic:
    - shard-kbl:          [FAIL][109] ([fdo#108145] / [i915#93] / [i915#95]) -> [FAIL][110] ([fdo#108145])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-kbl3/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4353/shard-kbl2/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [FAIL][111] ([i915#608]) -> [SKIP][112] ([fdo#109642] / [fdo#111068])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-iclb2/igt@kms_psr2_su@page_flip.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4353/shard-iclb1/igt@kms_psr2_su@page_flip.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [FAIL][113] ([i915#31]) -> [FAIL][114] ([i915#31] / [i915#93] / [i915#95])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-kbl6/igt@kms_setmode@basic.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4353/shard-kbl2/igt@kms_setmode@basic.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][115], [FAIL][116]) ([fdo#103927] / [i915#716]) -> [FAIL][117] ([fdo#103927])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-apl7/igt@runner@aborted.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8190/shard-apl8/igt@runner@aborted.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4353/shard-apl6/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109293]: https://bugs.freedesktop.org/show_bug.cgi?id=109293
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112015]: https://bugs.freedesktop.org/show_bug.cgi?id=112015
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#1277]: https://gitlab.freedesktop.org/drm/intel/issues/1277
  [i915#1297]: https://gitlab.freedesktop.org/drm/intel/issues/1297
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#608]: https://gitlab.freedesktop.org/drm/intel/issues/608
  [i915#64]: https://gitlab.freedesktop.org/drm/intel/issues/64
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
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
  * IGT: IGT_5538 -> IGTPW_4353
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8190: 73f711b364bc85c8a7189487c09431eb1f515ed0 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4353: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4353/index.html
  IGT_5538: 47becbc9cd1fc7b1b78692f90fd3dcd5a9066965 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4353/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
