Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 25 Mar 2020 15:38:18 -0000
Message-ID: <158515069865.29634.2310946555861986774@emeril.freedesktop.org>
References: <20200325123318.240545-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200325123318.240545-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgcnVubmVy?=
 =?utf-8?q?=3A_Only_show_the_kmsg_underflow/overflow_message_once_=28rev2?=
 =?utf-8?q?=29?=
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

Series: runner: Only show the kmsg underflow/overflow message once (rev2)
URL   : https://patchwork.freedesktop.org/series/75072/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8186_full -> IGTPW_4350_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4350_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4350_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4350/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4350_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_eio@in-flight-suspend:
    - shard-glk:          [PASS][1] -> [CRASH][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-glk1/igt@gem_eio@in-flight-suspend.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4350/shard-glk9/igt@gem_eio@in-flight-suspend.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-snb:          [PASS][3] -> [TIMEOUT][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-snb5/igt@i915_pm_rc6_residency@rc6-idle.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4350/shard-snb6/igt@i915_pm_rc6_residency@rc6-idle.html

  
Known issues
------------

  Here are the changes found in IGTPW_4350_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@extended-parallel-vcs1:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#112080]) +8 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-iclb1/igt@gem_busy@extended-parallel-vcs1.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4350/shard-iclb6/igt@gem_busy@extended-parallel-vcs1.html

  * igt@gem_ctx_isolation@bcs0-s3:
    - shard-kbl:          [PASS][7] -> [DMESG-WARN][8] ([i915#180]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-kbl4/igt@gem_ctx_isolation@bcs0-s3.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4350/shard-kbl7/igt@gem_ctx_isolation@bcs0-s3.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#110841])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-iclb6/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4350/shard-iclb1/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_schedule@implicit-read-write-bsd1:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([fdo#109276] / [i915#677])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-iclb2/igt@gem_exec_schedule@implicit-read-write-bsd1.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4350/shard-iclb8/igt@gem_exec_schedule@implicit-read-write-bsd1.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [PASS][13] -> [SKIP][14] ([i915#677]) +2 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-iclb3/igt@gem_exec_schedule@pi-common-bsd.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4350/shard-iclb1/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd:
    - shard-iclb:         [PASS][15] -> [SKIP][16] ([fdo#112146]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-iclb6/igt@gem_exec_schedule@preempt-queue-bsd.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4350/shard-iclb2/igt@gem_exec_schedule@preempt-queue-bsd.html

  * igt@gem_userptr_blits@sync-unmap-after-close:
    - shard-hsw:          [PASS][17] -> [DMESG-WARN][18] ([fdo#111870])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-hsw7/igt@gem_userptr_blits@sync-unmap-after-close.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4350/shard-hsw6/igt@gem_userptr_blits@sync-unmap-after-close.html
    - shard-snb:          [PASS][19] -> [DMESG-WARN][20] ([fdo#111870] / [i915#478])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-snb2/igt@gem_userptr_blits@sync-unmap-after-close.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4350/shard-snb6/igt@gem_userptr_blits@sync-unmap-after-close.html

  * igt@i915_pm_rpm@pm-tiling:
    - shard-hsw:          [PASS][21] -> [SKIP][22] ([fdo#109271])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-hsw2/igt@i915_pm_rpm@pm-tiling.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4350/shard-hsw4/igt@i915_pm_rpm@pm-tiling.html
    - shard-tglb:         [PASS][23] -> [SKIP][24] ([i915#1316])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-tglb1/igt@i915_pm_rpm@pm-tiling.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4350/shard-tglb2/igt@i915_pm_rpm@pm-tiling.html
    - shard-glk:          [PASS][25] -> [SKIP][26] ([fdo#109271])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-glk2/igt@i915_pm_rpm@pm-tiling.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4350/shard-glk5/igt@i915_pm_rpm@pm-tiling.html
    - shard-iclb:         [PASS][27] -> [SKIP][28] ([i915#1316])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-iclb1/igt@i915_pm_rpm@pm-tiling.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4350/shard-iclb5/igt@i915_pm_rpm@pm-tiling.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen:
    - shard-kbl:          [PASS][29] -> [FAIL][30] ([i915#54] / [i915#93] / [i915#95])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4350/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-size-change:
    - shard-apl:          [PASS][31] -> [FAIL][32] ([i915#54])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-apl4/igt@kms_cursor_crc@pipe-c-cursor-size-change.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4350/shard-apl8/igt@kms_cursor_crc@pipe-c-cursor-size-change.html
    - shard-kbl:          [PASS][33] -> [FAIL][34] ([i915#54])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-size-change.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4350/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-size-change.html

  * igt@kms_draw_crc@draw-method-rgb565-blt-ytiled:
    - shard-glk:          [PASS][35] -> [FAIL][36] ([i915#52] / [i915#54]) +2 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-glk5/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4350/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled:
    - shard-glk:          [PASS][37] -> [FAIL][38] ([i915#177] / [i915#52] / [i915#54])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-glk1/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4350/shard-glk7/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled:
    - shard-kbl:          [PASS][39] -> [FAIL][40] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-kbl1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4350/shard-kbl3/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-pwrite-xtiled:
    - shard-apl:          [PASS][41] -> [FAIL][42] ([i915#52] / [i915#54] / [i915#95]) +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-apl7/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-xtiled.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4350/shard-apl3/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-xtiled.html

  * igt@kms_draw_crc@fill-fb:
    - shard-apl:          [PASS][43] -> [FAIL][44] ([i915#95])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-apl6/igt@kms_draw_crc@fill-fb.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4350/shard-apl4/igt@kms_draw_crc@fill-fb.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-apl:          [PASS][45] -> [DMESG-WARN][46] ([i915#180])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-apl7/igt@kms_flip@flip-vs-suspend.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4350/shard-apl8/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b:
    - shard-hsw:          [PASS][47] -> [INCOMPLETE][48] ([i915#61])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-hsw5/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4350/shard-hsw4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html

  * igt@kms_prime@basic-crc:
    - shard-apl:          [PASS][49] -> [FAIL][50] ([i915#1031] / [i915#95])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-apl7/igt@kms_prime@basic-crc.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4350/shard-apl7/igt@kms_prime@basic-crc.html
    - shard-kbl:          [PASS][51] -> [FAIL][52] ([i915#1031] / [i915#93] / [i915#95])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-kbl3/igt@kms_prime@basic-crc.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4350/shard-kbl6/igt@kms_prime@basic-crc.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [PASS][53] -> [SKIP][54] ([fdo#109441]) +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-iclb2/igt@kms_psr@psr2_cursor_render.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4350/shard-iclb1/igt@kms_psr@psr2_cursor_render.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [PASS][55] -> [SKIP][56] ([fdo#109276]) +14 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-iclb1/igt@prime_busy@hang-bsd2.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4350/shard-iclb7/igt@prime_busy@hang-bsd2.html

  
#### Possible fixes ####

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [SKIP][57] ([fdo#110854]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-iclb5/igt@gem_exec_balancer@smoke.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4350/shard-iclb2/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_create@madvise:
    - shard-hsw:          [INCOMPLETE][59] ([i915#61]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-hsw2/igt@gem_exec_create@madvise.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4350/shard-hsw4/igt@gem_exec_create@madvise.html

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [SKIP][61] ([fdo#112080]) -> [PASS][62] +10 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-iclb5/igt@gem_exec_parallel@vcs1-fds.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4350/shard-iclb2/igt@gem_exec_parallel@vcs1-fds.html

  * igt@gem_exec_schedule@implicit-write-read-bsd2:
    - shard-iclb:         [SKIP][63] ([fdo#109276] / [i915#677]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-iclb5/igt@gem_exec_schedule@implicit-write-read-bsd2.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4350/shard-iclb4/igt@gem_exec_schedule@implicit-write-read-bsd2.html

  * igt@gem_exec_schedule@independent-bsd2:
    - shard-iclb:         [SKIP][65] ([fdo#109276]) -> [PASS][66] +19 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-iclb8/igt@gem_exec_schedule@independent-bsd2.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4350/shard-iclb4/igt@gem_exec_schedule@independent-bsd2.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [SKIP][67] ([fdo#112146]) -> [PASS][68] +6 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-iclb2/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4350/shard-iclb3/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_linear_blits@interruptible:
    - shard-hsw:          [FAIL][69] -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-hsw7/igt@gem_linear_blits@interruptible.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4350/shard-hsw7/igt@gem_linear_blits@interruptible.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][71] ([i915#454]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-iclb4/igt@i915_pm_dc@dc6-psr.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4350/shard-iclb6/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-random:
    - shard-kbl:          [FAIL][73] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][74] +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4350/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html
    - shard-apl:          [FAIL][75] ([i915#54] / [i915#95]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4350/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding:
    - shard-apl:          [FAIL][77] ([i915#54]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4350/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding.html
    - shard-glk:          [FAIL][79] ([i915#54]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-glk1/igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4350/shard-glk6/igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding.html
    - shard-kbl:          [FAIL][81] ([i915#54]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4350/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding.html

  * igt@kms_cursor_edge_walk@pipe-a-64x64-top-edge:
    - shard-kbl:          [FAIL][83] ([i915#70] / [i915#93] / [i915#95]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-kbl6/igt@kms_cursor_edge_walk@pipe-a-64x64-top-edge.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4350/shard-kbl4/igt@kms_cursor_edge_walk@pipe-a-64x64-top-edge.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size:
    - shard-snb:          [SKIP][85] ([fdo#109271]) -> [PASS][86] +2 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-snb2/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4350/shard-snb5/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-xtiled:
    - shard-glk:          [FAIL][87] ([i915#52] / [i915#54]) -> [PASS][88] +3 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-glk6/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-xtiled.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4350/shard-glk6/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-xtiled.html

  * igt@kms_flip@blocking-wf_vblank:
    - shard-glk:          [FAIL][89] ([i915#34]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-glk3/igt@kms_flip@blocking-wf_vblank.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4350/shard-glk1/igt@kms_flip@blocking-wf_vblank.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-gtt:
    - shard-snb:          [DMESG-WARN][91] ([i915#478]) -> [PASS][92] +1 similar issue
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-snb2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-gtt.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4350/shard-snb5/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [DMESG-WARN][93] ([i915#180] / [i915#93] / [i915#95]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4350/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_pipe_crc_basic@hang-read-crc-pipe-a:
    - shard-kbl:          [FAIL][95] ([i915#53] / [i915#93] / [i915#95]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-kbl7/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4350/shard-kbl6/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
    - shard-apl:          [FAIL][97] ([i915#53] / [i915#95]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-apl1/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4350/shard-apl3/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-kbl:          [DMESG-WARN][99] ([i915#180]) -> [PASS][100] +2 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-kbl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4350/shard-kbl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-apl:          [DMESG-WARN][101] ([i915#180] / [i915#95]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-apl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4350/shard-apl8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [FAIL][103] ([i915#173]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-iclb1/igt@kms_psr@no_drrs.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4350/shard-iclb5/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [SKIP][105] ([fdo#109441]) -> [PASS][106] +1 similar issue
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-iclb3/igt@kms_psr@psr2_primary_mmap_cpu.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4350/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][107] ([i915#31]) -> [PASS][108]
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-apl8/igt@kms_setmode@basic.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4350/shard-apl2/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [INCOMPLETE][109] ([i915#155]) -> [PASS][110] +1 similar issue
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-kbl1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4350/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  
#### Warnings ####

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup@gtt:
    - shard-hsw:          [DMESG-WARN][111] ([i915#478]) -> [DMESG-WARN][112] ([fdo#110789] / [i915#478])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-hsw5/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup@gtt.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4350/shard-hsw1/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup@gtt.html

  * igt@gem_userptr_blits@sync-unmap:
    - shard-snb:          [DMESG-WARN][113] ([fdo#110789] / [fdo#111870] / [i915#478]) -> [DMESG-WARN][114] ([fdo#111870] / [i915#478])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-snb4/igt@gem_userptr_blits@sync-unmap.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4350/shard-snb4/igt@gem_userptr_blits@sync-unmap.html

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-hsw:          [DMESG-WARN][115] ([fdo#111870]) -> [DMESG-WARN][116] ([fdo#110789] / [fdo#111870])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-hsw4/igt@gem_userptr_blits@sync-unmap-cycles.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4350/shard-hsw8/igt@gem_userptr_blits@sync-unmap-cycles.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-transparant-fb:
    - shard-kbl:          [FAIL][117] ([fdo#108145]) -> [FAIL][118] ([fdo#108145] / [i915#93] / [i915#95])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-kbl1/igt@kms_plane_alpha_blend@pipe-a-alpha-transparant-fb.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4350/shard-kbl1/igt@kms_plane_alpha_blend@pipe-a-alpha-transparant-fb.html

  * igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:
    - shard-apl:          [FAIL][119] ([fdo#108145]) -> [FAIL][120] ([fdo#108145] / [i915#95]) +1 similar issue
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-apl2/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4350/shard-apl8/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:
    - shard-kbl:          [FAIL][121] ([fdo#108145] / [i915#93] / [i915#95]) -> [FAIL][122] ([fdo#108145])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-kbl1/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4350/shard-kbl7/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html
    - shard-apl:          [FAIL][123] ([fdo#108145] / [i915#95]) -> [FAIL][124] ([fdo#108145])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-apl7/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4350/shard-apl8/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html

  * igt@runner@aborted:
    - shard-hsw:          ([FAIL][125], [FAIL][126], [FAIL][127], [FAIL][128], [FAIL][129], [FAIL][130], [FAIL][131], [FAIL][132]) ([fdo#109271] / [fdo#111870] / [i915#1485]) -> ([FAIL][133], [FAIL][134], [FAIL][135], [FAIL][136], [FAIL][137], [FAIL][138], [FAIL][139], [FAIL][140]) ([fdo#111870] / [i915#1485])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-hsw2/igt@runner@aborted.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-hsw1/igt@runner@aborted.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-hsw6/igt@runner@aborted.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-hsw7/igt@runner@aborted.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-hsw7/igt@runner@aborted.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-hsw6/igt@runner@aborted.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-hsw5/igt@runner@aborted.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-hsw4/igt@runner@aborted.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4350/shard-hsw6/igt@runner@aborted.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4350/shard-hsw1/igt@runner@aborted.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4350/shard-hsw6/igt@runner@aborted.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4350/shard-hsw1/igt@runner@aborted.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4350/shard-hsw8/igt@runner@aborted.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4350/shard-hsw6/igt@runner@aborted.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4350/shard-hsw1/igt@runner@aborted.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4350/shard-hsw7/igt@runner@aborted.html
    - shard-snb:          ([FAIL][141], [FAIL][142], [FAIL][143], [FAIL][144], [FAIL][145], [FAIL][146], [FAIL][147], [FAIL][148]) ([fdo#111870] / [i915#1077] / [i915#1485] / [i915#698]) -> ([FAIL][149], [FAIL][150], [FAIL][151], [FAIL][152], [FAIL][153], [FAIL][154], [FAIL][155], [FAIL][156]) ([fdo#111870] / [i915#1077] / [i915#1485])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-snb2/igt@runner@aborted.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-snb6/igt@runner@aborted.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-snb4/igt@runner@aborted.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-snb4/igt@runner@aborted.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-snb1/igt@runner@aborted.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-snb2/igt@runner@aborted.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-snb6/igt@runner@aborted.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8186/shard-snb1/igt@runner@aborted.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4350/shard-snb2/igt@runner@aborted.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4350/shard-snb4/igt@runner@aborted.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4350/shard-snb6/igt@runner@aborted.html
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4350/shard-snb1/igt@runner@aborted.html
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4350/shard-snb2/igt@runner@aborted.html
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4350/shard-snb6/igt@runner@aborted.html
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4350/shard-snb2/igt@runner@aborted.html
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4350/shard-snb5/igt@runner@aborted.html

  
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1031]: https://gitlab.freedesktop.org/drm/intel/issues/1031
  [i915#1077]: https://gitlab.freedesktop.org/drm/intel/issues/1077
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1485]: https://gitlab.freedesktop.org/drm/intel/issues/1485
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#34]: https://gitlab.freedesktop.org/drm/intel/issues/34
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#53]: https://gitlab.freedesktop.org/drm/intel/issues/53
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#698]: https://gitlab.freedesktop.org/drm/intel/issues/698
  [i915#70]: https://gitlab.freedesktop.org/drm/intel/issues/70
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5537 -> IGTPW_4350
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8186: 1abdd8c4027177dd054471cf58a5e9ec3f2df46d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4350: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4350/index.html
  IGT_5537: 190245120758e754813d76b2c6c613413a0dba29 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4350/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
