Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 04 Feb 2020 12:30:45 -0000
Message-ID: <158081944540.25088.10176603106909720017@emeril.freedesktop.org>
References: <20200131173109.12527-1-ramalingam.c@intel.com>
In-Reply-To: <20200131173109.12527-1-ramalingam.c@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgSGFuZGxp?=
 =?utf-8?q?ng_mmap=5Fgtt?=
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
To: Ramalingam C <ramalingam.c@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Handling mmap_gtt
URL   : https://patchwork.freedesktop.org/series/72837/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7853_full -> IGTPW_4065_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4065_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4065_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4065/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4065_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_big_fb@x-tiled-64bpp-rotate-0:
    - shard-iclb:         [PASS][1] -> [SKIP][2] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-iclb1/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4065/shard-iclb7/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html

  
Known issues
------------

  Here are the changes found in IGTPW_4065_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@idempotent:
    - shard-tglb:         [PASS][3] -> [SKIP][4] ([fdo#112179] / [i915#1099])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-tglb3/igt@gem_ctx_persistence@idempotent.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4065/shard-tglb7/igt@gem_ctx_persistence@idempotent.html
    - shard-apl:          [PASS][5] -> [SKIP][6] ([fdo#109271] / [i915#1099])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-apl1/igt@gem_ctx_persistence@idempotent.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4065/shard-apl3/igt@gem_ctx_persistence@idempotent.html
    - shard-glk:          [PASS][7] -> [SKIP][8] ([fdo#109271] / [i915#1099])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-glk9/igt@gem_ctx_persistence@idempotent.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4065/shard-glk7/igt@gem_ctx_persistence@idempotent.html
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#112179] / [i915#1099])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-iclb5/igt@gem_ctx_persistence@idempotent.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4065/shard-iclb1/igt@gem_ctx_persistence@idempotent.html

  * igt@gem_exec_schedule@preempt-queue-chain-bsd2:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([fdo#109276]) +8 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-iclb4/igt@gem_exec_schedule@preempt-queue-chain-bsd2.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4065/shard-iclb8/igt@gem_exec_schedule@preempt-queue-chain-bsd2.html

  * igt@gem_exec_schedule@wide-bsd:
    - shard-iclb:         [PASS][13] -> [SKIP][14] ([fdo#112146]) +4 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-iclb6/igt@gem_exec_schedule@wide-bsd.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4065/shard-iclb2/igt@gem_exec_schedule@wide-bsd.html

  * igt@gem_partial_pwrite_pread@reads-snoop:
    - shard-snb:          [PASS][15] -> [DMESG-WARN][16] ([fdo#110789] / [i915#478])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-snb5/igt@gem_partial_pwrite_pread@reads-snoop.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4065/shard-snb5/igt@gem_partial_pwrite_pread@reads-snoop.html

  * igt@i915_pm_rps@reset:
    - shard-iclb:         [PASS][17] -> [FAIL][18] ([i915#413]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-iclb8/igt@i915_pm_rps@reset.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4065/shard-iclb5/igt@i915_pm_rps@reset.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-hsw:          [PASS][19] -> [INCOMPLETE][20] ([i915#61]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-hsw7/igt@kms_flip@flip-vs-suspend-interruptible.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4065/shard-hsw5/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-apl:          [PASS][21] -> [DMESG-WARN][22] ([i915#180]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-apl8/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4065/shard-apl4/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@psr-slowdraw:
    - shard-tglb:         [PASS][23] -> [SKIP][24] ([i915#668]) +5 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-tglb8/igt@kms_frontbuffer_tracking@psr-slowdraw.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4065/shard-tglb2/igt@kms_frontbuffer_tracking@psr-slowdraw.html

  * igt@kms_psr@psr2_cursor_mmap_gtt:
    - shard-iclb:         [PASS][25] -> [SKIP][26] ([fdo#109441])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_gtt.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4065/shard-iclb6/igt@kms_psr@psr2_cursor_mmap_gtt.html

  * igt@perf_pmu@busy-no-semaphores-vcs1:
    - shard-iclb:         [PASS][27] -> [SKIP][28] ([fdo#112080]) +10 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-iclb2/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4065/shard-iclb7/igt@perf_pmu@busy-no-semaphores-vcs1.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-apl:          [DMESG-WARN][29] ([i915#180]) -> [PASS][30] +2 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-apl6/igt@gem_ctx_isolation@rcs0-s3.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4065/shard-apl8/igt@gem_ctx_isolation@rcs0-s3.html

  * {igt@gem_ctx_persistence@hang}:
    - shard-tglb:         [SKIP][31] ([i915#1099]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-tglb3/igt@gem_ctx_persistence@hang.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4065/shard-tglb6/igt@gem_ctx_persistence@hang.html
    - shard-iclb:         [SKIP][33] ([i915#1099]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-iclb2/igt@gem_ctx_persistence@hang.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4065/shard-iclb7/igt@gem_ctx_persistence@hang.html

  * igt@gem_ctx_persistence@processes:
    - shard-apl:          [SKIP][35] ([fdo#109271] / [i915#1099]) -> [PASS][36] +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-apl7/igt@gem_ctx_persistence@processes.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4065/shard-apl2/igt@gem_ctx_persistence@processes.html
    - shard-iclb:         [SKIP][37] ([fdo#112179] / [i915#1099]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-iclb3/igt@gem_ctx_persistence@processes.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4065/shard-iclb5/igt@gem_ctx_persistence@processes.html
    - shard-glk:          [SKIP][39] ([fdo#109271] / [i915#1099]) -> [PASS][40] +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-glk1/igt@gem_ctx_persistence@processes.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4065/shard-glk4/igt@gem_ctx_persistence@processes.html
    - shard-tglb:         [SKIP][41] ([fdo#112179] / [i915#1099]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-tglb3/igt@gem_ctx_persistence@processes.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4065/shard-tglb5/igt@gem_ctx_persistence@processes.html

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [SKIP][43] ([fdo#112080]) -> [PASS][44] +12 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-iclb6/igt@gem_exec_parallel@vcs1-fds.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4065/shard-iclb2/igt@gem_exec_parallel@vcs1-fds.html

  * igt@gem_exec_schedule@independent-bsd2:
    - shard-iclb:         [SKIP][45] ([fdo#109276]) -> [PASS][46] +23 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-iclb6/igt@gem_exec_schedule@independent-bsd2.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4065/shard-iclb2/igt@gem_exec_schedule@independent-bsd2.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [SKIP][47] ([i915#677]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-iclb4/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4065/shard-iclb3/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [SKIP][49] ([fdo#112146]) -> [PASS][50] +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-iclb1/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4065/shard-iclb3/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][51] ([i915#454]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-iclb6/igt@i915_pm_dc@dc6-psr.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4065/shard-iclb7/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_busy@basic-flip-pipe-a:
    - shard-tglb:         [DMESG-WARN][53] ([i915#402]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-tglb3/igt@kms_busy@basic-flip-pipe-a.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4065/shard-tglb7/igt@kms_busy@basic-flip-pipe-a.html

  * igt@kms_busy@extended-pageflip-modeset-hang-oldfb-render-pipe-b:
    - shard-glk:          [INCOMPLETE][55] ([CI#80] / [i915#58] / [k.org#198133]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-glk5/igt@kms_busy@extended-pageflip-modeset-hang-oldfb-render-pipe-b.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4065/shard-glk3/igt@kms_busy@extended-pageflip-modeset-hang-oldfb-render-pipe-b.html

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-xtiled:
    - shard-glk:          [FAIL][57] ([i915#52] / [i915#54]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-glk4/igt@kms_draw_crc@draw-method-xrgb8888-blt-xtiled.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4065/shard-glk5/igt@kms_draw_crc@draw-method-xrgb8888-blt-xtiled.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt:
    - shard-snb:          [DMESG-WARN][59] ([i915#478]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-snb6/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4065/shard-snb4/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [DMESG-WARN][61] ([i915#180]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4065/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu:
    - shard-tglb:         [SKIP][63] ([i915#668]) -> [PASS][64] +14 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4065/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu.html

  * igt@kms_psr@psr2_sprite_plane_onoff:
    - shard-iclb:         [SKIP][65] ([fdo#109441]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-iclb1/igt@kms_psr@psr2_sprite_plane_onoff.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4065/shard-iclb2/igt@kms_psr@psr2_sprite_plane_onoff.html

  
#### Warnings ####

  * igt@runner@aborted:
    - shard-snb:          ([FAIL][67], [FAIL][68], [FAIL][69], [FAIL][70], [FAIL][71], [FAIL][72], [FAIL][73], [FAIL][74]) ([fdo#111870] / [i915#1077] / [i915#698]) -> ([FAIL][75], [FAIL][76], [FAIL][77], [FAIL][78], [FAIL][79], [FAIL][80], [FAIL][81], [FAIL][82]) ([fdo#111870] / [i915#1077])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-snb5/igt@runner@aborted.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-snb4/igt@runner@aborted.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-snb6/igt@runner@aborted.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-snb2/igt@runner@aborted.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-snb5/igt@runner@aborted.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-snb6/igt@runner@aborted.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-snb2/igt@runner@aborted.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7853/shard-snb2/igt@runner@aborted.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4065/shard-snb6/igt@runner@aborted.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4065/shard-snb5/igt@runner@aborted.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4065/shard-snb1/igt@runner@aborted.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4065/shard-snb6/igt@runner@aborted.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4065/shard-snb5/igt@runner@aborted.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4065/shard-snb1/igt@runner@aborted.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4065/shard-snb5/igt@runner@aborted.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4065/shard-snb2/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112179]: https://bugs.freedesktop.org/show_bug.cgi?id=112179
  [i915#1077]: https://gitlab.freedesktop.org/drm/intel/issues/1077
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#698]: https://gitlab.freedesktop.org/drm/intel/issues/698
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5409 -> IGTPW_4065
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7853: 1df04205c16923e525efe9c26d6e98612d38c9b3 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4065: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4065/index.html
  IGT_5409: 93aefe6baa3fabf8c0cabe83e185f7b8f8d8753d @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4065/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
