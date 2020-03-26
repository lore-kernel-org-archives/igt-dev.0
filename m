Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 26 Mar 2020 01:18:29 -0000
Message-ID: <158518550943.23003.14773571324134152854@emeril.freedesktop.org>
References: <20200325191819.10196-1-jose.souza@intel.com>
In-Reply-To: <20200325191819.10196-1-jose.souza@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2Cv6=2Cwithout-hack-patches=2C1/5=5D_te?=
 =?utf-8?q?sts/kms=5Ffrontbuffer=5Ftracking=3A_Add_tiling_to_test=5Fmode?=
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
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,v6,without-hack-patches,1/5] tests/kms_frontbuffer_tracking: Add tiling to test_mode
URL   : https://patchwork.freedesktop.org/series/75086/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8189_full -> IGTPW_4352_full
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with IGTPW_4352_full need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4352_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4352/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4352_full:

### IGT changes ###

#### Warnings ####

  * igt@perf@gen12-unprivileged-single-ctx-counters:
    - shard-iclb:         [SKIP][1] ([fdo#109289]) -> [SKIP][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8189/shard-iclb2/igt@perf@gen12-unprivileged-single-ctx-counters.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4352/shard-iclb4/igt@perf@gen12-unprivileged-single-ctx-counters.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8189_full and IGTPW_4352_full:

### New IGT tests (4) ###

  * igt@kms_frontbuffer_tracking@fbc-tiling-linear:
    - Statuses : 6 pass(s)
    - Exec time: [1.74, 7.74] s

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.41] s

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 4.79] s

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - Statuses : 2 pass(s) 4 skip(s)
    - Exec time: [0.0, 4.94] s

  

Known issues
------------

  Here are the changes found in IGTPW_4352_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-apl:          [PASS][3] -> [DMESG-WARN][4] ([i915#180]) +3 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8189/shard-apl8/igt@gem_ctx_isolation@rcs0-s3.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4352/shard-apl1/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_exec_schedule@preempt-queue-bsd1:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#109276]) +19 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8189/shard-iclb2/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4352/shard-iclb7/igt@gem_exec_schedule@preempt-queue-bsd1.html

  * igt@gem_exec_schedule@preempt-queue-contexts-chain-bsd:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#112146]) +2 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8189/shard-iclb8/igt@gem_exec_schedule@preempt-queue-contexts-chain-bsd.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4352/shard-iclb1/igt@gem_exec_schedule@preempt-queue-contexts-chain-bsd.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-snb:          [PASS][9] -> [DMESG-WARN][10] ([fdo#111870] / [i915#478])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8189/shard-snb5/igt@gem_userptr_blits@dmabuf-unsync.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4352/shard-snb6/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@i915_pm_rpm@modeset-non-lpsp:
    - shard-glk:          [PASS][11] -> [SKIP][12] ([fdo#109271]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8189/shard-glk4/igt@i915_pm_rpm@modeset-non-lpsp.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4352/shard-glk2/igt@i915_pm_rpm@modeset-non-lpsp.html

  * igt@i915_suspend@forcewake:
    - shard-kbl:          [PASS][13] -> [DMESG-WARN][14] ([i915#180]) +2 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8189/shard-kbl6/igt@i915_suspend@forcewake.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4352/shard-kbl1/igt@i915_suspend@forcewake.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-apl:          [PASS][15] -> [FAIL][16] ([i915#1119] / [i915#95])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8189/shard-apl2/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4352/shard-apl1/igt@kms_big_fb@linear-32bpp-rotate-180.html
    - shard-kbl:          [PASS][17] -> [FAIL][18] ([i915#1119] / [i915#93] / [i915#95])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8189/shard-kbl4/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4352/shard-kbl7/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen:
    - shard-kbl:          [PASS][19] -> [FAIL][20] ([i915#54] / [i915#93] / [i915#95]) +3 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8189/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4352/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [PASS][21] -> [SKIP][22] ([fdo#109349])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8189/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4352/shard-iclb5/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-untiled:
    - shard-glk:          [PASS][23] -> [FAIL][24] ([i915#52] / [i915#54]) +3 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8189/shard-glk4/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-untiled.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4352/shard-glk5/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-untiled.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled:
    - shard-glk:          [PASS][25] -> [FAIL][26] ([i915#177] / [i915#52] / [i915#54])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8189/shard-glk7/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4352/shard-glk6/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled:
    - shard-kbl:          [PASS][27] -> [FAIL][28] ([fdo#108145] / [i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8189/shard-kbl1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4352/shard-kbl1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
    - shard-apl:          [PASS][29] -> [FAIL][30] ([fdo#108145] / [i915#52] / [i915#54] / [i915#95])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8189/shard-apl3/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4352/shard-apl2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html

  * igt@kms_flip@blocking-absolute-wf_vblank-interruptible:
    - shard-kbl:          [PASS][31] -> [DMESG-WARN][32] ([i915#1297])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8189/shard-kbl6/igt@kms_flip@blocking-absolute-wf_vblank-interruptible.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4352/shard-kbl2/igt@kms_flip@blocking-absolute-wf_vblank-interruptible.html
    - shard-apl:          [PASS][33] -> [DMESG-WARN][34] ([i915#1297])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8189/shard-apl4/igt@kms_flip@blocking-absolute-wf_vblank-interruptible.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4352/shard-apl3/igt@kms_flip@blocking-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-glk:          [PASS][35] -> [FAIL][36] ([i915#79])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8189/shard-glk9/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4352/shard-glk9/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-glk:          [PASS][37] -> [FAIL][38] ([i915#49])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8189/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4352/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-a:
    - shard-apl:          [PASS][39] -> [FAIL][40] ([i915#53] / [i915#95])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8189/shard-apl8/igt@kms_pipe_crc_basic@read-crc-pipe-a.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4352/shard-apl7/igt@kms_pipe_crc_basic@read-crc-pipe-a.html
    - shard-kbl:          [PASS][41] -> [FAIL][42] ([i915#53] / [i915#93] / [i915#95])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8189/shard-kbl7/igt@kms_pipe_crc_basic@read-crc-pipe-a.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4352/shard-kbl1/igt@kms_pipe_crc_basic@read-crc-pipe-a.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-128:
    - shard-kbl:          [PASS][43] -> [FAIL][44] ([i915#93] / [i915#95]) +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8189/shard-kbl7/igt@kms_plane_cursor@pipe-a-overlay-size-128.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4352/shard-kbl7/igt@kms_plane_cursor@pipe-a-overlay-size-128.html
    - shard-apl:          [PASS][45] -> [FAIL][46] ([i915#95]) +2 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8189/shard-apl3/igt@kms_plane_cursor@pipe-a-overlay-size-128.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4352/shard-apl6/igt@kms_plane_cursor@pipe-a-overlay-size-128.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-iclb:         [PASS][47] -> [SKIP][48] ([fdo#109441]) +2 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8189/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4352/shard-iclb3/igt@kms_psr@psr2_cursor_plane_move.html

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [PASS][49] -> [FAIL][50] ([i915#1085])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8189/shard-tglb1/igt@perf@gen12-mi-rpc.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4352/shard-tglb3/igt@perf@gen12-mi-rpc.html

  * igt@perf@oa-formats:
    - shard-iclb:         [PASS][51] -> [SKIP][52] ([i915#405])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8189/shard-iclb3/igt@perf@oa-formats.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4352/shard-iclb4/igt@perf@oa-formats.html
    - shard-apl:          [PASS][53] -> [SKIP][54] ([fdo#109271])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8189/shard-apl6/igt@perf@oa-formats.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4352/shard-apl4/igt@perf@oa-formats.html
    - shard-kbl:          [PASS][55] -> [SKIP][56] ([fdo#109271])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8189/shard-kbl3/igt@perf@oa-formats.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4352/shard-kbl7/igt@perf@oa-formats.html

  * igt@perf_pmu@busy-no-semaphores-vcs1:
    - shard-iclb:         [PASS][57] -> [SKIP][58] ([fdo#112080]) +12 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8189/shard-iclb4/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4352/shard-iclb7/igt@perf_pmu@busy-no-semaphores-vcs1.html

  
#### Possible fixes ####

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [SKIP][59] ([fdo#110854]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8189/shard-iclb6/igt@gem_exec_balancer@smoke.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4352/shard-iclb2/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_schedule@implicit-both-bsd:
    - shard-iclb:         [SKIP][61] ([i915#677]) -> [PASS][62] +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8189/shard-iclb2/igt@gem_exec_schedule@implicit-both-bsd.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4352/shard-iclb3/igt@gem_exec_schedule@implicit-both-bsd.html

  * igt@gem_exec_schedule@implicit-read-write-bsd1:
    - shard-iclb:         [SKIP][63] ([fdo#109276] / [i915#677]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8189/shard-iclb6/igt@gem_exec_schedule@implicit-read-write-bsd1.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4352/shard-iclb1/igt@gem_exec_schedule@implicit-read-write-bsd1.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [SKIP][65] ([fdo#112146]) -> [PASS][66] +4 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8189/shard-iclb2/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4352/shard-iclb7/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_exec_schedule@promotion-bsd1:
    - shard-iclb:         [SKIP][67] ([fdo#109276]) -> [PASS][68] +17 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8189/shard-iclb8/igt@gem_exec_schedule@promotion-bsd1.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4352/shard-iclb2/igt@gem_exec_schedule@promotion-bsd1.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-apl:          [DMESG-WARN][69] ([i915#180] / [i915#95]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8189/shard-apl1/igt@gem_exec_suspend@basic-s3.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4352/shard-apl1/igt@gem_exec_suspend@basic-s3.html

  * igt@i915_pm_rpm@i2c:
    - shard-tglb:         [SKIP][71] ([i915#1316]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8189/shard-tglb5/igt@i915_pm_rpm@i2c.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4352/shard-tglb6/igt@i915_pm_rpm@i2c.html
    - shard-glk:          [SKIP][73] ([fdo#109271]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8189/shard-glk1/igt@i915_pm_rpm@i2c.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4352/shard-glk6/igt@i915_pm_rpm@i2c.html
    - shard-iclb:         [SKIP][75] ([i915#1316]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8189/shard-iclb1/igt@i915_pm_rpm@i2c.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4352/shard-iclb5/igt@i915_pm_rpm@i2c.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-random:
    - shard-kbl:          [FAIL][77] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8189/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4352/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html

  * igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen:
    - shard-kbl:          [FAIL][79] ([i915#54]) -> [PASS][80] +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8189/shard-kbl6/igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4352/shard-kbl1/igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen.html
    - shard-apl:          [FAIL][81] ([i915#54]) -> [PASS][82] +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8189/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4352/shard-apl2/igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen.html
    - shard-glk:          [FAIL][83] ([i915#54]) -> [PASS][84] +1 similar issue
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8189/shard-glk4/igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4352/shard-glk7/igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen.html

  * igt@kms_draw_crc@draw-method-rgb565-render-untiled:
    - shard-glk:          [FAIL][85] ([i915#52] / [i915#54]) -> [PASS][86] +3 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8189/shard-glk6/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4352/shard-glk4/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-glk:          [FAIL][87] ([i915#1121] / [i915#64]) -> [PASS][88] +1 similar issue
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8189/shard-glk8/igt@kms_fbcon_fbt@fbc.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4352/shard-glk6/igt@kms_fbcon_fbt@fbc.html
    - shard-iclb:         [FAIL][89] ([i915#1121]) -> [PASS][90] +1 similar issue
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8189/shard-iclb2/igt@kms_fbcon_fbt@fbc.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4352/shard-iclb2/igt@kms_fbcon_fbt@fbc.html
    - shard-tglb:         [FAIL][91] ([i915#64]) -> [PASS][92] +1 similar issue
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8189/shard-tglb1/igt@kms_fbcon_fbt@fbc.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4352/shard-tglb8/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_flip@basic-flip-vs-modeset:
    - shard-apl:          [DMESG-WARN][93] ([i915#1297]) -> [PASS][94] +1 similar issue
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8189/shard-apl1/igt@kms_flip@basic-flip-vs-modeset.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4352/shard-apl1/igt@kms_flip@basic-flip-vs-modeset.html

  * igt@kms_flip@flip-vs-fences:
    - shard-kbl:          [DMESG-WARN][95] ([i915#1297]) -> [PASS][96] +1 similar issue
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8189/shard-kbl6/igt@kms_flip@flip-vs-fences.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4352/shard-kbl3/igt@kms_flip@flip-vs-fences.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move:
    - shard-tglb:         [SKIP][97] ([i915#668]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8189/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4352/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid:
    - shard-kbl:          [FAIL][99] ([fdo#108145] / [i915#93] / [i915#95]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8189/shard-kbl3/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4352/shard-kbl1/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
    - shard-apl:          [FAIL][101] ([fdo#108145] / [i915#95]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8189/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4352/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-128:
    - shard-apl:          [FAIL][103] ([i915#95]) -> [PASS][104] +1 similar issue
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8189/shard-apl6/igt@kms_plane_cursor@pipe-a-viewport-size-128.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4352/shard-apl1/igt@kms_plane_cursor@pipe-a-viewport-size-128.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-64:
    - shard-kbl:          [FAIL][105] ([i915#93] / [i915#95]) -> [PASS][106] +1 similar issue
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8189/shard-kbl1/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4352/shard-kbl3/igt@kms_plane_cursor@pipe-a-viewport-size-64.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [FAIL][107] ([i915#899]) -> [PASS][108]
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8189/shard-glk4/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4352/shard-glk4/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [SKIP][109] ([fdo#109642] / [fdo#111068]) -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8189/shard-iclb4/igt@kms_psr2_su@frontbuffer.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4352/shard-iclb2/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_primary_mmap_gtt:
    - shard-iclb:         [SKIP][111] ([fdo#109441]) -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8189/shard-iclb7/igt@kms_psr@psr2_primary_mmap_gtt.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4352/shard-iclb2/igt@kms_psr@psr2_primary_mmap_gtt.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][113] ([i915#31]) -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8189/shard-apl4/igt@kms_setmode@basic.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4352/shard-apl7/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [DMESG-WARN][115] ([i915#180]) -> [PASS][116] +3 similar issues
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8189/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4352/shard-kbl6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@kms_vblank@pipe-c-ts-continuation-suspend:
    - shard-apl:          [DMESG-WARN][117] ([i915#180]) -> [PASS][118]
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8189/shard-apl4/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4352/shard-apl6/igt@kms_vblank@pipe-c-ts-continuation-suspend.html

  * igt@perf_pmu@busy-vcs1:
    - shard-iclb:         [SKIP][119] ([fdo#112080]) -> [PASS][120] +10 similar issues
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8189/shard-iclb8/igt@perf_pmu@busy-vcs1.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4352/shard-iclb4/igt@perf_pmu@busy-vcs1.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [SKIP][121] ([i915#468]) -> [FAIL][122] ([i915#454])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8189/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4352/shard-tglb6/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rpm@cursor-dpms:
    - shard-snb:          [SKIP][123] ([fdo#109271]) -> [INCOMPLETE][124] ([i915#82])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8189/shard-snb5/igt@i915_pm_rpm@cursor-dpms.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4352/shard-snb2/igt@i915_pm_rpm@cursor-dpms.html

  * igt@i915_pm_rpm@dpms-non-lpsp:
    - shard-snb:          [INCOMPLETE][125] ([i915#82]) -> [SKIP][126] ([fdo#109271])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8189/shard-snb6/igt@i915_pm_rpm@dpms-non-lpsp.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4352/shard-snb6/igt@i915_pm_rpm@dpms-non-lpsp.html

  * igt@i915_pm_rpm@modeset-non-lpsp:
    - shard-iclb:         [SKIP][127] ([fdo#110892]) -> [SKIP][128] ([i915#1316])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8189/shard-iclb6/igt@i915_pm_rpm@modeset-non-lpsp.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4352/shard-iclb8/igt@i915_pm_rpm@modeset-non-lpsp.html
    - shard-tglb:         [SKIP][129] ([fdo#111644] / [i915#1397]) -> [SKIP][130] ([IGT#35] / [i915#1316])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8189/shard-tglb6/igt@i915_pm_rpm@modeset-non-lpsp.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4352/shard-tglb8/igt@i915_pm_rpm@modeset-non-lpsp.html

  * igt@i915_pm_rpm@modeset-pc8-residency-stress:
    - shard-tglb:         [SKIP][131] ([i915#1316]) -> [SKIP][132] ([fdo#109506])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8189/shard-tglb5/igt@i915_pm_rpm@modeset-pc8-residency-stress.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4352/shard-tglb7/igt@i915_pm_rpm@modeset-pc8-residency-stress.html
    - shard-iclb:         [SKIP][133] ([i915#1316]) -> [SKIP][134] ([fdo#109293] / [fdo#109506])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8189/shard-iclb1/igt@i915_pm_rpm@modeset-pc8-residency-stress.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4352/shard-iclb6/igt@i915_pm_rpm@modeset-pc8-residency-stress.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-kbl:          [DMESG-WARN][135] ([i915#180] / [i915#93] / [i915#95]) -> [FAIL][136] ([i915#93] / [i915#95])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8189/shard-kbl1/igt@kms_fbcon_fbt@fbc-suspend.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4352/shard-kbl7/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:
    - shard-apl:          [FAIL][137] ([fdo#108145]) -> [FAIL][138] ([fdo#108145] / [i915#95]) +1 similar issue
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8189/shard-apl1/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4352/shard-apl4/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html
    - shard-kbl:          [FAIL][139] ([fdo#108145]) -> [FAIL][140] ([fdo#108145] / [i915#93] / [i915#95]) +1 similar issue
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8189/shard-kbl2/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4352/shard-kbl1/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-basic:
    - shard-kbl:          [FAIL][141] ([fdo#108145] / [i915#93] / [i915#95]) -> [FAIL][142] ([fdo#108145])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8189/shard-kbl4/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4352/shard-kbl4/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html

  
  [IGT#35]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/35
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109293]: https://bugs.freedesktop.org/show_bug.cgi?id=109293
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#110892]: https://bugs.freedesktop.org/show_bug.cgi?id=110892
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#1121]: https://gitlab.freedesktop.org/drm/intel/issues/1121
  [i915#1297]: https://gitlab.freedesktop.org/drm/intel/issues/1297
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#405]: https://gitlab.freedesktop.org/drm/intel/issues/405
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#53]: https://gitlab.freedesktop.org/drm/intel/issues/53
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#64]: https://gitlab.freedesktop.org/drm/intel/issues/64
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5538 -> IGTPW_4352
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8189: b851880963f76b6dd67d6abdcd2f365b268c23d4 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4352: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4352/index.html
  IGT_5538: 47becbc9cd1fc7b1b78692f90fd3dcd5a9066965 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4352/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
