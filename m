Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 01 Apr 2020 19:05:15 -0000
Message-ID: <158576791529.25627.9401674108511244532@emeril.freedesktop.org>
References: <20200401065423.29345-1-mika.kahola@intel.com>
In-Reply-To: <20200401065423.29345-1-mika.kahola@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fconcurrent=3A_Calculate_maximum_number_of_planes_to_meet_?=
 =?utf-8?q?bandwidth_requirement_=28rev3=29?=
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
To: Mika Kahola <mika.kahola@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_concurrent: Calculate maximum number of planes to meet bandwidth requirement (rev3)
URL   : https://patchwork.freedesktop.org/series/75323/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8230_full -> IGTPW_4388_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4388/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4388_full:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@gem_exec_capture@capture@bcs0}:
    - shard-snb:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-snb2/igt@gem_exec_capture@capture@bcs0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4388/shard-snb6/igt@gem_exec_capture@capture@bcs0.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8230_full and IGTPW_4388_full:

### New IGT tests (1) ###

  * igt@gem_exec_capture@capture:
    - Statuses :
    - Exec time: [None] s

  

Known issues
------------

  Here are the changes found in IGTPW_4388_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#110854])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-iclb4/igt@gem_exec_balancer@smoke.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4388/shard-iclb5/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_schedule@implicit-read-write-bsd2:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#109276] / [i915#677])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-iclb2/igt@gem_exec_schedule@implicit-read-write-bsd2.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4388/shard-iclb5/igt@gem_exec_schedule@implicit-read-write-bsd2.html

  * igt@gem_exec_schedule@out-order-bsd2:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#109276]) +11 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-iclb4/igt@gem_exec_schedule@out-order-bsd2.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4388/shard-iclb7/igt@gem_exec_schedule@out-order-bsd2.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([i915#677]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-iclb6/igt@gem_exec_schedule@pi-common-bsd.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4388/shard-iclb2/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_schedule@preempt-self-bsd:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([fdo#112146])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-iclb3/igt@gem_exec_schedule@preempt-self-bsd.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4388/shard-iclb2/igt@gem_exec_schedule@preempt-self-bsd.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-hsw:          [PASS][13] -> [FAIL][14] ([i915#1066])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-hsw2/igt@i915_pm_rc6_residency@rc6-idle.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4388/shard-hsw4/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_selftest@live@execlists:
    - shard-apl:          [PASS][15] -> [INCOMPLETE][16] ([i915#656])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-apl8/igt@i915_selftest@live@execlists.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4388/shard-apl4/igt@i915_selftest@live@execlists.html

  * igt@kms_color@pipe-c-legacy-gamma:
    - shard-kbl:          [PASS][17] -> [FAIL][18] ([i915#71])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-kbl1/igt@kms_color@pipe-c-legacy-gamma.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4388/shard-kbl2/igt@kms_color@pipe-c-legacy-gamma.html
    - shard-apl:          [PASS][19] -> [FAIL][20] ([i915#71])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-apl2/igt@kms_color@pipe-c-legacy-gamma.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4388/shard-apl1/igt@kms_color@pipe-c-legacy-gamma.html
    - shard-glk:          [PASS][21] -> [FAIL][22] ([i915#71])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-glk6/igt@kms_color@pipe-c-legacy-gamma.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4388/shard-glk1/igt@kms_color@pipe-c-legacy-gamma.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-onscreen:
    - shard-kbl:          [PASS][23] -> [FAIL][24] ([i915#54] / [i915#93] / [i915#95])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-128x128-onscreen.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4388/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-128x128-onscreen.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-untiled:
    - shard-glk:          [PASS][25] -> [FAIL][26] ([i915#52] / [i915#54]) +4 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-glk1/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-untiled.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4388/shard-glk6/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-untiled.html

  * igt@kms_flip_tiling@flip-changes-tiling-y:
    - shard-apl:          [PASS][27] -> [FAIL][28] ([i915#95])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-apl2/igt@kms_flip_tiling@flip-changes-tiling-y.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4388/shard-apl3/igt@kms_flip_tiling@flip-changes-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:
    - shard-apl:          [PASS][29] -> [FAIL][30] ([i915#49] / [i915#95])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-apl8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4388/shard-apl8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html
    - shard-kbl:          [PASS][31] -> [FAIL][32] ([i915#49])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4388/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [PASS][33] -> [FAIL][34] ([i915#173])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-iclb3/igt@kms_psr@no_drrs.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4388/shard-iclb1/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [PASS][35] -> [SKIP][36] ([fdo#109441]) +2 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4388/shard-iclb4/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][37] -> [FAIL][38] ([i915#31])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-apl2/igt@kms_setmode@basic.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4388/shard-apl8/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [PASS][39] -> [DMESG-WARN][40] ([i915#180]) +6 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4388/shard-kbl7/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@perf_pmu@idle-vcs1:
    - shard-iclb:         [PASS][41] -> [SKIP][42] ([fdo#112080]) +6 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-iclb2/igt@perf_pmu@idle-vcs1.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4388/shard-iclb8/igt@perf_pmu@idle-vcs1.html

  
#### Possible fixes ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [SKIP][43] ([fdo#112080]) -> [PASS][44] +10 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-iclb8/igt@gem_busy@busy-vcs1.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4388/shard-iclb1/igt@gem_busy@busy-vcs1.html

  * igt@gem_exec_schedule@implicit-both-bsd1:
    - shard-iclb:         [SKIP][45] ([fdo#109276] / [i915#677]) -> [PASS][46] +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-iclb5/igt@gem_exec_schedule@implicit-both-bsd1.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4388/shard-iclb1/igt@gem_exec_schedule@implicit-both-bsd1.html

  * igt@gem_exec_schedule@preempt-contexts-bsd2:
    - shard-iclb:         [SKIP][47] ([fdo#109276]) -> [PASS][48] +15 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-iclb6/igt@gem_exec_schedule@preempt-contexts-bsd2.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4388/shard-iclb1/igt@gem_exec_schedule@preempt-contexts-bsd2.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [SKIP][49] ([fdo#112146]) -> [PASS][50] +3 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-iclb4/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4388/shard-iclb6/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [FAIL][51] ([i915#454]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-iclb4/igt@i915_pm_dc@dc6-dpms.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4388/shard-iclb8/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-apl:          [FAIL][53] -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-apl1/igt@i915_pm_rc6_residency@rc6-idle.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4388/shard-apl4/igt@i915_pm_rc6_residency@rc6-idle.html
    - shard-glk:          [FAIL][55] ([i915#1527]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-glk5/igt@i915_pm_rc6_residency@rc6-idle.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4388/shard-glk7/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-kbl:          [DMESG-WARN][57] ([i915#180]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-kbl3/igt@i915_suspend@fence-restore-tiled2untiled.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4388/shard-kbl3/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_concurrent@pipe-b:
    - shard-hsw:          [FAIL][59] ([i915#1539]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-hsw2/igt@kms_concurrent@pipe-b.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4388/shard-hsw7/igt@kms_concurrent@pipe-b.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding:
    - shard-apl:          [FAIL][61] ([i915#54]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4388/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding.html
    - shard-kbl:          [FAIL][63] ([i915#54]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4388/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding.html
    - shard-glk:          [FAIL][65] ([i915#54]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-glk7/igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4388/shard-glk4/igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding.html

  * igt@kms_draw_crc@draw-method-rgb565-render-ytiled:
    - shard-glk:          [FAIL][67] ([i915#52] / [i915#54]) -> [PASS][68] +3 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-glk3/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4388/shard-glk2/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled:
    - shard-kbl:          [FAIL][69] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95]) -> [PASS][70] +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-kbl4/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4388/shard-kbl7/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled:
    - shard-apl:          [FAIL][71] ([i915#52] / [i915#54] / [i915#95]) -> [PASS][72] +1 similar issue
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-apl6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4388/shard-apl3/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html

  * igt@kms_draw_crc@fill-fb:
    - shard-apl:          [FAIL][73] ([i915#95]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-apl7/igt@kms_draw_crc@fill-fb.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4388/shard-apl8/igt@kms_draw_crc@fill-fb.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-glk:          [FAIL][75] ([i915#79]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-glk9/igt@kms_flip@flip-vs-expired-vblank.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4388/shard-glk8/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-rmfb-interruptible:
    - shard-kbl:          [DMESG-WARN][77] ([i915#1297]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-kbl3/igt@kms_flip@flip-vs-rmfb-interruptible.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4388/shard-kbl6/igt@kms_flip@flip-vs-rmfb-interruptible.html
    - shard-apl:          [DMESG-WARN][79] ([i915#1297]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-apl6/igt@kms_flip@flip-vs-rmfb-interruptible.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4388/shard-apl2/igt@kms_flip@flip-vs-rmfb-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-apl:          [DMESG-WARN][81] ([i915#180]) -> [PASS][82] +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-apl6/igt@kms_flip@flip-vs-suspend-interruptible.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4388/shard-apl1/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@plain-flip-fb-recreate:
    - shard-glk:          [FAIL][83] -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-glk4/igt@kms_flip@plain-flip-fb-recreate.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4388/shard-glk4/igt@kms_flip@plain-flip-fb-recreate.html

  * igt@kms_flip_tiling@flip-changes-tiling:
    - shard-kbl:          [FAIL][85] ([i915#699] / [i915#93] / [i915#95]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-kbl2/igt@kms_flip_tiling@flip-changes-tiling.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4388/shard-kbl3/igt@kms_flip_tiling@flip-changes-tiling.html

  * igt@kms_mmap_write_crc@main:
    - shard-kbl:          [FAIL][87] ([i915#93] / [i915#95]) -> [PASS][88] +1 similar issue
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-kbl2/igt@kms_mmap_write_crc@main.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4388/shard-kbl6/igt@kms_mmap_write_crc@main.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [SKIP][89] ([fdo#109642] / [fdo#111068]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-iclb3/igt@kms_psr2_su@frontbuffer.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4388/shard-iclb2/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_basic:
    - shard-iclb:         [SKIP][91] ([fdo#109441]) -> [PASS][92] +2 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-iclb8/igt@kms_psr@psr2_basic.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4388/shard-iclb2/igt@kms_psr@psr2_basic.html

  * igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm:
    - shard-tglb:         [SKIP][93] ([fdo#112015]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-tglb3/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4388/shard-tglb2/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html
    - shard-hsw:          [SKIP][95] ([fdo#109271]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-hsw7/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4388/shard-hsw2/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html
    - shard-iclb:         [SKIP][97] ([fdo#109278]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-iclb7/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4388/shard-iclb5/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html
    - shard-glk:          [SKIP][99] ([fdo#109271]) -> [PASS][100] +1 similar issue
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-glk3/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4388/shard-glk9/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [FAIL][101] ([i915#1085]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-tglb6/igt@perf@gen12-mi-rpc.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4388/shard-tglb7/igt@perf@gen12-mi-rpc.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-apl:          [SKIP][103] ([fdo#109271]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-apl4/igt@perf@gen8-unprivileged-single-ctx-counters.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4388/shard-apl4/igt@perf@gen8-unprivileged-single-ctx-counters.html
    - shard-iclb:         [SKIP][105] -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-iclb4/igt@perf@gen8-unprivileged-single-ctx-counters.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4388/shard-iclb6/igt@perf@gen8-unprivileged-single-ctx-counters.html
    - shard-kbl:          [SKIP][107] ([fdo#109271]) -> [PASS][108]
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-kbl6/igt@perf@gen8-unprivileged-single-ctx-counters.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4388/shard-kbl7/igt@perf@gen8-unprivileged-single-ctx-counters.html

  
#### Warnings ####

  * igt@gem_softpin@noreloc-s3:
    - shard-kbl:          [DMESG-WARN][109] ([i915#180] / [i915#93] / [i915#95]) -> [DMESG-WARN][110] ([i915#180])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-kbl7/igt@gem_softpin@noreloc-s3.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4388/shard-kbl1/igt@gem_softpin@noreloc-s3.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
    - shard-apl:          [FAIL][111] ([fdo#108145] / [i915#95]) -> [FAIL][112] ([fdo#108145])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4388/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-tglb:         [SKIP][113] -> [SKIP][114] ([fdo#109289])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-tglb8/igt@perf@gen8-unprivileged-single-ctx-counters.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4388/shard-tglb6/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@runner@aborted:
    - shard-apl:          [FAIL][115] ([i915#1423]) -> ([FAIL][116], [FAIL][117]) ([i915#1423] / [i915#529])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8230/shard-apl8/igt@runner@aborted.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4388/shard-apl6/igt@runner@aborted.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4388/shard-apl4/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#112015]: https://bugs.freedesktop.org/show_bug.cgi?id=112015
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1066]: https://gitlab.freedesktop.org/drm/intel/issues/1066
  [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
  [i915#1297]: https://gitlab.freedesktop.org/drm/intel/issues/1297
  [i915#1423]: https://gitlab.freedesktop.org/drm/intel/issues/1423
  [i915#1527]: https://gitlab.freedesktop.org/drm/intel/issues/1527
  [i915#1539]: https://gitlab.freedesktop.org/drm/intel/issues/1539
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#529]: https://gitlab.freedesktop.org/drm/intel/issues/529
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#656]: https://gitlab.freedesktop.org/drm/intel/issues/656
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#699]: https://gitlab.freedesktop.org/drm/intel/issues/699
  [i915#71]: https://gitlab.freedesktop.org/drm/intel/issues/71
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5550 -> IGTPW_4388
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8230: fa9f8453ffb88a4fc4e36d68b84a7ff9bf90f769 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4388: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4388/index.html
  IGT_5550: 98927dfde17aecaecfe67bb9853ceca326ca2b23 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4388/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
