Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 01 Apr 2020 18:25:39 -0000
Message-ID: <158576553905.25627.7972796944445963684@emeril.freedesktop.org>
References: <20200331162320.968537-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200331162320.968537-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_i915/gem=5Fexec=5Freloc=3A_Dyn?=
 =?utf-8?q?amic_active_engine_tests_=28rev2=29?=
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

Series: series starting with [i-g-t,1/2] i915/gem_exec_reloc: Dynamic active engine tests (rev2)
URL   : https://patchwork.freedesktop.org/series/75332/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8230_full -> IGTPW_4385_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4385/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4385_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_exec_reloc@basic-spin@vcs0} (NEW):
    - shard-snb:          NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4385/shard-snb6/igt@gem_exec_reloc@basic-spin@vcs0.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8230_full and IGTPW_4385_full:

### New IGT tests (14) ###

  * igt@gem_exec_capture@capture:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_reloc@basic-active@all:
    - Statuses : 7 pass(s)
    - Exec time: [0.08, 0.42] s

  * igt@gem_exec_reloc@basic-active@bcs0:
    - Statuses : 7 pass(s)
    - Exec time: [0.07, 0.54] s

  * igt@gem_exec_reloc@basic-active@rcs0:
    - Statuses : 7 pass(s)
    - Exec time: [0.08, 0.27] s

  * igt@gem_exec_reloc@basic-active@vcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.06, 0.24] s

  * igt@gem_exec_reloc@basic-active@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.06, 0.08] s

  * igt@gem_exec_reloc@basic-active@vecs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.06, 0.24] s

  * igt@gem_exec_reloc@basic-parallel:
    - Statuses : 7 pass(s)
    - Exec time: [2.02, 2.09] s

  * igt@gem_exec_reloc@basic-spin:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_reloc@basic-spin@bcs0:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@gem_exec_reloc@basic-spin@rcs0:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@gem_exec_reloc@basic-spin@vcs0:
    - Statuses : 1 fail(s) 6 pass(s)
    - Exec time: [0.00, 5.65] s

  * igt@gem_exec_reloc@basic-spin@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@gem_exec_reloc@basic-spin@vecs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.00] s

  

Known issues
------------

  Here are the changes found in IGTPW_4385_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_schedule@implicit-read-write-bsd2:
    - shard-iclb:         [PASS][2] -> [SKIP][3] ([fdo#109276] / [i915#677])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-iclb2/igt@gem_exec_schedule@implicit-read-write-bsd2.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4385/shard-iclb6/igt@gem_exec_schedule@implicit-read-write-bsd2.html

  * igt@gem_exec_schedule@in-order-bsd:
    - shard-iclb:         [PASS][4] -> [SKIP][5] ([fdo#112146]) +4 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-iclb5/igt@gem_exec_schedule@in-order-bsd.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4385/shard-iclb2/igt@gem_exec_schedule@in-order-bsd.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [PASS][6] -> [SKIP][7] ([i915#677])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-iclb6/igt@gem_exec_schedule@pi-common-bsd.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4385/shard-iclb4/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd1:
    - shard-iclb:         [PASS][8] -> [SKIP][9] ([fdo#109276]) +13 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-iclb1/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4385/shard-iclb8/igt@gem_exec_schedule@preempt-queue-bsd1.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-kbl:          [PASS][10] -> [DMESG-WARN][11] ([i915#180] / [i915#93] / [i915#95])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-kbl6/igt@gem_workarounds@suspend-resume-context.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4385/shard-kbl7/igt@gem_workarounds@suspend-resume-context.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-kbl:          [PASS][12] -> [FAIL][13] ([i915#1593])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-kbl4/igt@i915_pm_rc6_residency@rc6-idle.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4385/shard-kbl2/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-apl:          [PASS][14] -> [DMESG-WARN][15] ([i915#180]) +1 similar issue
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-apl4/igt@i915_suspend@fence-restore-tiled2untiled.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4385/shard-apl6/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-random:
    - shard-kbl:          [PASS][16] -> [FAIL][17] ([i915#54] / [i915#93] / [i915#95])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4385/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html
    - shard-apl:          [PASS][18] -> [FAIL][19] ([i915#54] / [i915#95])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4385/shard-apl1/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [PASS][20] -> [DMESG-WARN][21] ([i915#180]) +1 similar issue
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4385/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic:
    - shard-kbl:          [PASS][22] -> [FAIL][23] ([i915#93] / [i915#95])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-kbl4/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4385/shard-kbl6/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled:
    - shard-glk:          [PASS][24] -> [FAIL][25] ([i915#52] / [i915#54]) +4 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-glk2/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4385/shard-glk1/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled:
    - shard-glk:          [PASS][26] -> [FAIL][27] ([i915#177] / [i915#52] / [i915#54])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-glk5/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4385/shard-glk7/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-glk:          [PASS][28] -> [FAIL][29] ([i915#79])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-glk7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4385/shard-glk5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip_tiling@flip-changes-tiling-y:
    - shard-apl:          [PASS][30] -> [FAIL][31] ([i915#95])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-apl2/igt@kms_flip_tiling@flip-changes-tiling-y.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4385/shard-apl6/igt@kms_flip_tiling@flip-changes-tiling-y.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [PASS][32] -> [SKIP][33] ([i915#433])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-tglb1/igt@kms_hdmi_inject@inject-audio.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4385/shard-tglb1/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant:
    - shard-kbl:          [PASS][34] -> [FAIL][35] ([fdo#108145] / [i915#93] / [i915#95])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-kbl7/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4385/shard-kbl7/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
    - shard-apl:          [PASS][36] -> [FAIL][37] ([fdo#108145] / [i915#95])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4385/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [PASS][38] -> [SKIP][39] ([fdo#109441]) +2 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4385/shard-iclb3/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@perf@blocking:
    - shard-hsw:          [PASS][40] -> [SKIP][41] ([fdo#109271])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-hsw1/igt@perf@blocking.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4385/shard-hsw1/igt@perf@blocking.html
    - shard-glk:          [PASS][42] -> [SKIP][43] ([fdo#109271])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-glk3/igt@perf@blocking.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4385/shard-glk9/igt@perf@blocking.html
    - shard-tglb:         [PASS][44] -> [SKIP][45] ([i915#405])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-tglb5/igt@perf@blocking.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4385/shard-tglb5/igt@perf@blocking.html
    - shard-iclb:         [PASS][46] -> [SKIP][47] ([i915#405])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-iclb4/igt@perf@blocking.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4385/shard-iclb7/igt@perf@blocking.html

  * igt@perf_pmu@busy-vcs1:
    - shard-iclb:         [PASS][48] -> [SKIP][49] ([fdo#112080]) +7 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-iclb1/igt@perf_pmu@busy-vcs1.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4385/shard-iclb5/igt@perf_pmu@busy-vcs1.html

  
#### Possible fixes ####

  * igt@gem_exec_schedule@independent-bsd2:
    - shard-iclb:         [SKIP][50] ([fdo#109276]) -> [PASS][51] +13 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-iclb7/igt@gem_exec_schedule@independent-bsd2.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4385/shard-iclb2/igt@gem_exec_schedule@independent-bsd2.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [SKIP][52] ([fdo#112146]) -> [PASS][53] +5 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-iclb4/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4385/shard-iclb7/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_softpin@noreloc-s3:
    - shard-kbl:          [DMESG-WARN][54] ([i915#180] / [i915#93] / [i915#95]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-kbl7/igt@gem_softpin@noreloc-s3.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4385/shard-kbl1/igt@gem_softpin@noreloc-s3.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [FAIL][56] ([i915#454]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-iclb4/igt@i915_pm_dc@dc6-dpms.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4385/shard-iclb6/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-apl:          [FAIL][58] -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-apl1/igt@i915_pm_rc6_residency@rc6-idle.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4385/shard-apl1/igt@i915_pm_rc6_residency@rc6-idle.html
    - shard-glk:          [FAIL][60] ([i915#1527]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-glk5/igt@i915_pm_rc6_residency@rc6-idle.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4385/shard-glk4/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding:
    - shard-apl:          [FAIL][62] ([i915#54]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4385/shard-apl1/igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding.html
    - shard-kbl:          [FAIL][64] ([i915#54]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4385/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding.html
    - shard-glk:          [FAIL][66] ([i915#54]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-glk7/igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4385/shard-glk4/igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-random:
    - shard-kbl:          [FAIL][68] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][69] +1 similar issue
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4385/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html

  * igt@kms_draw_crc@draw-method-rgb565-blt-ytiled:
    - shard-glk:          [FAIL][70] ([i915#52] / [i915#54]) -> [PASS][71] +2 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-glk4/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4385/shard-glk3/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled:
    - shard-kbl:          [FAIL][72] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95]) -> [PASS][73] +1 similar issue
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-kbl4/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4385/shard-kbl2/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled:
    - shard-apl:          [FAIL][74] ([i915#52] / [i915#54] / [i915#95]) -> [PASS][75] +1 similar issue
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-apl6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4385/shard-apl4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-glk:          [FAIL][76] ([i915#79]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-glk9/igt@kms_flip@flip-vs-expired-vblank.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4385/shard-glk2/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-rmfb-interruptible:
    - shard-kbl:          [DMESG-WARN][78] ([i915#1297]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-kbl3/igt@kms_flip@flip-vs-rmfb-interruptible.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4385/shard-kbl6/igt@kms_flip@flip-vs-rmfb-interruptible.html
    - shard-apl:          [DMESG-WARN][80] ([i915#1297]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-apl6/igt@kms_flip@flip-vs-rmfb-interruptible.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4385/shard-apl8/igt@kms_flip@flip-vs-rmfb-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-kbl:          [DMESG-WARN][82] ([i915#180]) -> [PASS][83] +1 similar issue
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4385/shard-kbl6/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@plain-flip-fb-recreate:
    - shard-glk:          [FAIL][84] -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-glk4/igt@kms_flip@plain-flip-fb-recreate.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4385/shard-glk5/igt@kms_flip@plain-flip-fb-recreate.html

  * igt@kms_flip_tiling@flip-changes-tiling:
    - shard-apl:          [FAIL][86] ([i915#95]) -> [PASS][87] +1 similar issue
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-apl3/igt@kms_flip_tiling@flip-changes-tiling.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4385/shard-apl4/igt@kms_flip_tiling@flip-changes-tiling.html
    - shard-kbl:          [FAIL][88] ([i915#699] / [i915#93] / [i915#95]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-kbl2/igt@kms_flip_tiling@flip-changes-tiling.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4385/shard-kbl2/igt@kms_flip_tiling@flip-changes-tiling.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-apl:          [DMESG-WARN][90] ([i915#180] / [i915#95]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-apl4/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4385/shard-apl4/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_mmap_write_crc@main:
    - shard-kbl:          [FAIL][92] ([i915#93] / [i915#95]) -> [PASS][93] +1 similar issue
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-kbl2/igt@kms_mmap_write_crc@main.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4385/shard-kbl1/igt@kms_mmap_write_crc@main.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-apl:          [DMESG-WARN][94] ([i915#180]) -> [PASS][95] +2 similar issues
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-apl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4385/shard-apl8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_psr@psr2_sprite_blt:
    - shard-iclb:         [SKIP][96] ([fdo#109441]) -> [PASS][97] +1 similar issue
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-iclb4/igt@kms_psr@psr2_sprite_blt.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4385/shard-iclb2/igt@kms_psr@psr2_sprite_blt.html

  * igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm:
    - shard-tglb:         [SKIP][98] ([fdo#112015]) -> [PASS][99]
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-tglb3/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4385/shard-tglb7/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html
    - shard-hsw:          [SKIP][100] ([fdo#109271]) -> [PASS][101]
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-hsw7/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4385/shard-hsw4/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html
    - shard-iclb:         [SKIP][102] ([fdo#109278]) -> [PASS][103]
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-iclb7/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4385/shard-iclb5/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html
    - shard-glk:          [SKIP][104] ([fdo#109271]) -> [PASS][105] +1 similar issue
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-glk3/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4385/shard-glk5/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html

  * {igt@perf@blocking-parameterized}:
    - shard-iclb:         [FAIL][106] ([i915#1542]) -> [PASS][107]
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-iclb7/igt@perf@blocking-parameterized.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4385/shard-iclb8/igt@perf@blocking-parameterized.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-apl:          [SKIP][108] ([fdo#109271]) -> [PASS][109]
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-apl4/igt@perf@gen8-unprivileged-single-ctx-counters.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4385/shard-apl2/igt@perf@gen8-unprivileged-single-ctx-counters.html
    - shard-iclb:         [SKIP][110] -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-iclb4/igt@perf@gen8-unprivileged-single-ctx-counters.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4385/shard-iclb7/igt@perf@gen8-unprivileged-single-ctx-counters.html
    - shard-kbl:          [SKIP][112] ([fdo#109271]) -> [PASS][113]
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-kbl6/igt@perf@gen8-unprivileged-single-ctx-counters.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4385/shard-kbl4/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@perf_pmu@busy-no-semaphores-vcs1:
    - shard-iclb:         [SKIP][114] ([fdo#112080]) -> [PASS][115] +8 similar issues
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-iclb7/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4385/shard-iclb1/igt@perf_pmu@busy-no-semaphores-vcs1.html

  
#### Warnings ####

  * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
    - shard-apl:          [FAIL][116] ([fdo#108145] / [i915#95]) -> [FAIL][117] ([fdo#108145])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4385/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-tglb:         [SKIP][118] -> [SKIP][119] ([fdo#109289])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-tglb8/igt@perf@gen8-unprivileged-single-ctx-counters.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4385/shard-tglb2/igt@perf@gen8-unprivileged-single-ctx-counters.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#112015]: https://bugs.freedesktop.org/show_bug.cgi?id=112015
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1297]: https://gitlab.freedesktop.org/drm/intel/issues/1297
  [i915#1527]: https://gitlab.freedesktop.org/drm/intel/issues/1527
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1593]: https://gitlab.freedesktop.org/drm/intel/issues/1593
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#405]: https://gitlab.freedesktop.org/drm/intel/issues/405
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#699]: https://gitlab.freedesktop.org/drm/intel/issues/699
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5550 -> IGTPW_4385
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8230: fa9f8453ffb88a4fc4e36d68b84a7ff9bf90f769 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4385: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4385/index.html
  IGT_5550: 98927dfde17aecaecfe67bb9853ceca326ca2b23 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4385/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
