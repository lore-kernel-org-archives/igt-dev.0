Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 09 Apr 2020 04:51:27 -0000
Message-ID: <158640788769.11552.9698481415078252455@emeril.freedesktop.org>
References: <20200408171344.9643-1-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20200408171344.9643-1-janusz.krzysztofik@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHM6?=
 =?utf-8?q?_Add_a_test_for_device_hot_unplug?=
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

Series: tests: Add a test for device hot unplug
URL   : https://patchwork.freedesktop.org/series/75692/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8277_full -> IGTPW_4434_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4434_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4434_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4434/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4434_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@core_hotunplug@hotunplug-lateclose} (NEW):
    - shard-tglb:         NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4434/shard-tglb8/igt@core_hotunplug@hotunplug-lateclose.html
    - shard-apl:          NOTRUN -> [INCOMPLETE][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4434/shard-apl3/igt@core_hotunplug@hotunplug-lateclose.html
    - shard-iclb:         NOTRUN -> [INCOMPLETE][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4434/shard-iclb7/igt@core_hotunplug@hotunplug-lateclose.html
    - shard-kbl:          NOTRUN -> [INCOMPLETE][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4434/shard-kbl6/igt@core_hotunplug@hotunplug-lateclose.html

  * igt@gem_ctx_persistence@legacy-engines-hostile-preempt:
    - shard-iclb:         NOTRUN -> [SKIP][5] +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4434/shard-iclb6/igt@gem_ctx_persistence@legacy-engines-hostile-preempt.html

  * igt@gem_eio@in-flight-contexts-1us:
    - shard-iclb:         [PASS][6] -> [SKIP][7] +7 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8277/shard-iclb1/igt@gem_eio@in-flight-contexts-1us.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4434/shard-iclb6/igt@gem_eio@in-flight-contexts-1us.html

  * igt@gem_exec_whisper@basic-queues-forked:
    - shard-glk:          [PASS][8] -> [DMESG-FAIL][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8277/shard-glk5/igt@gem_exec_whisper@basic-queues-forked.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4434/shard-glk5/igt@gem_exec_whisper@basic-queues-forked.html

  * igt@gem_mmap_gtt@big-copy:
    - shard-iclb:         [PASS][10] -> [FAIL][11] +3 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8277/shard-iclb3/igt@gem_mmap_gtt@big-copy.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4434/shard-iclb6/igt@gem_mmap_gtt@big-copy.html

  * igt@kms_cursor_crc@pipe-b-cursor-128x128-onscreen:
    - shard-iclb:         [PASS][12] -> [INCOMPLETE][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8277/shard-iclb3/igt@kms_cursor_crc@pipe-b-cursor-128x128-onscreen.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4434/shard-iclb6/igt@kms_cursor_crc@pipe-b-cursor-128x128-onscreen.html

  * igt@runner@aborted:
    - shard-hsw:          NOTRUN -> ([FAIL][14], [FAIL][15], [FAIL][16])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4434/shard-hsw5/igt@runner@aborted.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4434/shard-hsw7/igt@runner@aborted.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4434/shard-hsw7/igt@runner@aborted.html
    - shard-tglb:         NOTRUN -> [FAIL][17]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4434/shard-tglb8/igt@runner@aborted.html
    - shard-snb:          NOTRUN -> [FAIL][18]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4434/shard-snb4/igt@runner@aborted.html

  
#### Warnings ####

  * igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs:
    - shard-iclb:         [SKIP][19] ([i915#768]) -> [SKIP][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8277/shard-iclb4/igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4434/shard-iclb6/igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs.html

  * igt@gen7_exec_parse@bitmasks:
    - shard-iclb:         [SKIP][21] ([fdo#109289]) -> [SKIP][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8277/shard-iclb6/igt@gen7_exec_parse@bitmasks.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4434/shard-iclb6/igt@gen7_exec_parse@bitmasks.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@kms_frontbuffer_tracking@fbc-tiling-y}:
    - shard-iclb:         [PASS][23] -> [FAIL][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8277/shard-iclb7/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4434/shard-iclb6/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * {igt@perf@blocking-parameterized}:
    - shard-iclb:         [FAIL][25] ([i915#1542]) -> [SKIP][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8277/shard-iclb7/igt@perf@blocking-parameterized.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4434/shard-iclb6/igt@perf@blocking-parameterized.html

  * {igt@perf_pmu@init-sema}:
    - shard-iclb:         NOTRUN -> [SKIP][27] +2 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4434/shard-iclb6/igt@perf_pmu@init-sema.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8277_full and IGTPW_4434_full:

### New IGT tests (4) ###

  * igt@core_hotunplug@hotunbind-lateclose:
    - Statuses : 1 incomplete(s) 5 pass(s)
    - Exec time: [0.0, 1.84] s

  * igt@core_hotunplug@hotunplug-lateclose:
    - Statuses : 7 incomplete(s)
    - Exec time: [0.0] s

  * igt@core_hotunplug@unbind-rebind:
    - Statuses : 1 incomplete(s) 6 pass(s)
    - Exec time: [0.0, 1.94] s

  * igt@core_hotunplug@unplug-rescan:
    - Statuses : 2 incomplete(s) 4 pass(s)
    - Exec time: [0.0, 3.89] s

  

Known issues
------------

  Here are the changes found in IGTPW_4434_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_params@invalid-bsd-ring:
    - shard-iclb:         [PASS][28] -> [SKIP][29] ([fdo#109276])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8277/shard-iclb2/igt@gem_exec_params@invalid-bsd-ring.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4434/shard-iclb8/igt@gem_exec_params@invalid-bsd-ring.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-kbl:          [PASS][30] -> [INCOMPLETE][31] ([i915#155])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8277/shard-kbl4/igt@gem_workarounds@suspend-resume-fd.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4434/shard-kbl2/igt@gem_workarounds@suspend-resume-fd.html

  * igt@i915_pm_rpm@system-suspend-modeset:
    - shard-glk:          [PASS][32] -> [SKIP][33] ([fdo#109271]) +1 similar issue
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8277/shard-glk6/igt@i915_pm_rpm@system-suspend-modeset.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4434/shard-glk1/igt@i915_pm_rpm@system-suspend-modeset.html
    - shard-iclb:         [PASS][34] -> [SKIP][35] ([i915#1316] / [i915#579])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8277/shard-iclb2/igt@i915_pm_rpm@system-suspend-modeset.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4434/shard-iclb7/igt@i915_pm_rpm@system-suspend-modeset.html
    - shard-hsw:          [PASS][36] -> [SKIP][37] ([fdo#109271]) +1 similar issue
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8277/shard-hsw5/igt@i915_pm_rpm@system-suspend-modeset.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4434/shard-hsw1/igt@i915_pm_rpm@system-suspend-modeset.html
    - shard-tglb:         [PASS][38] -> [SKIP][39] ([i915#1316] / [i915#579])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8277/shard-tglb6/igt@i915_pm_rpm@system-suspend-modeset.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4434/shard-tglb5/igt@i915_pm_rpm@system-suspend-modeset.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen:
    - shard-kbl:          [PASS][40] -> [FAIL][41] ([i915#54] / [i915#93] / [i915#95])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8277/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4434/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen.html

  * igt@kms_draw_crc@draw-method-rgb565-blt-xtiled:
    - shard-iclb:         [PASS][42] -> [FAIL][43] ([i915#1564]) +11 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8277/shard-iclb8/igt@kms_draw_crc@draw-method-rgb565-blt-xtiled.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4434/shard-iclb6/igt@kms_draw_crc@draw-method-rgb565-blt-xtiled.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled:
    - shard-glk:          [PASS][44] -> [FAIL][45] ([i915#52] / [i915#54]) +2 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8277/shard-glk8/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4434/shard-glk5/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled:
    - shard-glk:          [PASS][46] -> [FAIL][47] ([i915#177] / [i915#52] / [i915#54])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8277/shard-glk8/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4434/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-glk:          [PASS][48] -> [FAIL][49] ([i915#34])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8277/shard-glk3/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4434/shard-glk4/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-apl:          [PASS][50] -> [DMESG-WARN][51] ([i915#180])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8277/shard-apl2/igt@kms_flip@flip-vs-suspend-interruptible.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4434/shard-apl6/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:
    - shard-kbl:          [PASS][52] -> [FAIL][53] ([i915#49])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8277/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4434/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html
    - shard-apl:          [PASS][54] -> [FAIL][55] ([i915#49])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8277/shard-apl8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4434/shard-apl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [PASS][56] -> [SKIP][57] ([i915#433])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8277/shard-tglb8/igt@kms_hdmi_inject@inject-audio.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4434/shard-tglb2/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_mmap_write_crc@main:
    - shard-kbl:          [PASS][58] -> [FAIL][59] ([i915#93] / [i915#95])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8277/shard-kbl1/igt@kms_mmap_write_crc@main.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4434/shard-kbl2/igt@kms_mmap_write_crc@main.html

  * igt@kms_pipe_crc_basic@hang-read-crc-pipe-a:
    - shard-kbl:          [PASS][60] -> [FAIL][61] ([i915#53] / [i915#93] / [i915#95])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8277/shard-kbl3/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4434/shard-kbl4/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
    - shard-apl:          [PASS][62] -> [FAIL][63] ([i915#53] / [i915#95])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8277/shard-apl1/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4434/shard-apl6/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [PASS][64] -> [DMESG-WARN][65] ([i915#180]) +5 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8277/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4434/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [PASS][66] -> [SKIP][67] ([fdo#109441]) +3 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8277/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4434/shard-iclb5/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][68] -> [FAIL][69] ([i915#31])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8277/shard-apl3/igt@kms_setmode@basic.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4434/shard-apl4/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-b-ts-continuation-modeset-rpm:
    - shard-tglb:         [PASS][70] -> [SKIP][71] ([fdo#112015])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8277/shard-tglb7/igt@kms_vblank@pipe-b-ts-continuation-modeset-rpm.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4434/shard-tglb5/igt@kms_vblank@pipe-b-ts-continuation-modeset-rpm.html
    - shard-iclb:         [PASS][72] -> [SKIP][73] ([fdo#109278])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8277/shard-iclb5/igt@kms_vblank@pipe-b-ts-continuation-modeset-rpm.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4434/shard-iclb7/igt@kms_vblank@pipe-b-ts-continuation-modeset-rpm.html

  
#### Possible fixes ####

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-snb:          [FAIL][74] ([i915#1066]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8277/shard-snb5/igt@i915_pm_rc6_residency@rc6-idle.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4434/shard-snb1/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@kms_busy@basic-flip-pipe-a:
    - shard-kbl:          [INCOMPLETE][76] -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8277/shard-kbl7/igt@kms_busy@basic-flip-pipe-a.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4434/shard-kbl1/igt@kms_busy@basic-flip-pipe-a.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen:
    - shard-kbl:          [FAIL][78] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8277/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4434/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - shard-kbl:          [FAIL][80] ([i915#54]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8277/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4434/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
    - shard-apl:          [FAIL][82] ([i915#54]) -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8277/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4434/shard-apl1/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding:
    - shard-apl:          [FAIL][84] ([i915#54] / [i915#95]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8277/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4434/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding.html

  * igt@kms_draw_crc@draw-method-rgb565-blt-ytiled:
    - shard-glk:          [FAIL][86] ([i915#52] / [i915#54]) -> [PASS][87] +3 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8277/shard-glk5/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4434/shard-glk7/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-ytiled:
    - shard-apl:          [FAIL][88] ([i915#52] / [i915#54] / [i915#95]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8277/shard-apl1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-ytiled.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4434/shard-apl2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-ytiled.html

  * igt@kms_flip_tiling@flip-changes-tiling-y:
    - shard-apl:          [FAIL][90] ([i915#95]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8277/shard-apl6/igt@kms_flip_tiling@flip-changes-tiling-y.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4434/shard-apl1/igt@kms_flip_tiling@flip-changes-tiling-y.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-kbl:          [DMESG-WARN][92] ([i915#180]) -> [PASS][93] +2 similar issues
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8277/shard-kbl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4434/shard-kbl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-apl:          [DMESG-WARN][94] ([i915#180]) -> [PASS][95] +1 similar issue
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8277/shard-apl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4434/shard-apl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][96] ([fdo#109441]) -> [PASS][97] +1 similar issue
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8277/shard-iclb4/igt@kms_psr@psr2_sprite_plane_move.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4434/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  
#### Warnings ####

  * igt@i915_pm_rpm@modeset-lpsp:
    - shard-snb:          [SKIP][98] ([fdo#109271]) -> [INCOMPLETE][99] ([i915#82])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8277/shard-snb2/igt@i915_pm_rpm@modeset-lpsp.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4434/shard-snb1/igt@i915_pm_rpm@modeset-lpsp.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:
    - shard-apl:          [FAIL][100] ([fdo#108145] / [i915#265]) -> [FAIL][101] ([fdo#108145] / [i915#265] / [i915#95])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8277/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4434/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-basic:
    - shard-kbl:          [FAIL][102] ([fdo#108145] / [i915#265]) -> [FAIL][103] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95]) +1 similar issue
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8277/shard-kbl7/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4434/shard-kbl6/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb:
    - shard-kbl:          [FAIL][104] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95]) -> [FAIL][105] ([fdo#108145] / [i915#265])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8277/shard-kbl1/igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4434/shard-kbl1/igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb.html
    - shard-apl:          [FAIL][106] ([fdo#108145] / [i915#265] / [i915#95]) -> [FAIL][107] ([fdo#108145] / [i915#265])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8277/shard-apl7/igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4434/shard-apl8/igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [FAIL][108] ([i915#608]) -> [SKIP][109] ([fdo#109642] / [fdo#111068])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8277/shard-iclb2/igt@kms_psr2_su@page_flip.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4434/shard-iclb4/igt@kms_psr2_su@page_flip.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#112015]: https://bugs.freedesktop.org/show_bug.cgi?id=112015
  [i915#1066]: https://gitlab.freedesktop.org/drm/intel/issues/1066
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1564]: https://gitlab.freedesktop.org/drm/intel/issues/1564
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#34]: https://gitlab.freedesktop.org/drm/intel/issues/34
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#53]: https://gitlab.freedesktop.org/drm/intel/issues/53
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#608]: https://gitlab.freedesktop.org/drm/intel/issues/608
  [i915#768]: https://gitlab.freedesktop.org/drm/intel/issues/768
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5581 -> IGTPW_4434
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8277: f7d56913e1668f3a269db391189a7888a4b22570 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4434: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4434/index.html
  IGT_5581: ab0620e555119ec55f12ba9ab9e6e9246d407648 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4434/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
