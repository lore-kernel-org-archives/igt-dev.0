Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 19 Feb 2020 09:07:45 -0000
Message-ID: <158210326551.21062.1216294667772478209@emeril.freedesktop.org>
References: <20200217145910.510225-1-lionel.g.landwerlin@intel.com>
In-Reply-To: <20200217145910.510225-1-lionel.g.landwerlin@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHM6?=
 =?utf-8?q?_add_i915-query_perf_tests_=28rev5=29?=
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
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests: add i915-query perf tests (rev5)
URL   : https://patchwork.freedesktop.org/series/72235/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7956_full -> IGTPW_4167_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4167_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4167_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4167/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4167_full:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_query@query-perf-configs (NEW):
    - shard-tglb:         NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4167/shard-tglb3/igt@i915_query@query-perf-configs.html

  
New tests
---------

  New tests have been introduced between CI_DRM_7956_full and IGTPW_4167_full:

### New IGT tests (3) ###

  * igt@i915_query@query-perf-config-data-invalid:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_query@query-perf-config-list-invalid:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@i915_query@query-perf-configs:
    - Statuses : 1 fail(s) 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  

Known issues
------------

  Here are the changes found in IGTPW_4167_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [PASS][2] -> [SKIP][3] ([fdo#112080]) +15 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7956/shard-iclb4/igt@gem_busy@busy-vcs1.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4167/shard-iclb8/igt@gem_busy@busy-vcs1.html

  * igt@gem_busy@close-race:
    - shard-tglb:         [PASS][4] -> [INCOMPLETE][5] ([i915#977])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7956/shard-tglb5/igt@gem_busy@close-race.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4167/shard-tglb6/igt@gem_busy@close-race.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [PASS][6] -> [SKIP][7] ([i915#677])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7956/shard-iclb8/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4167/shard-iclb2/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd1:
    - shard-iclb:         [PASS][8] -> [SKIP][9] ([fdo#109276]) +18 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7956/shard-iclb2/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4167/shard-iclb6/igt@gem_exec_schedule@preempt-queue-bsd1.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [PASS][10] -> [SKIP][11] ([fdo#112146]) +1 similar issue
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7956/shard-iclb8/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4167/shard-iclb4/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-kbl:          [PASS][12] -> [DMESG-WARN][13] ([i915#180]) +2 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7956/shard-kbl7/igt@gem_workarounds@suspend-resume-fd.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4167/shard-kbl3/igt@gem_workarounds@suspend-resume-fd.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-kbl:          [PASS][14] -> [DMESG-WARN][15] ([i915#716])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7956/shard-kbl7/igt@gen9_exec_parse@allowed-all.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4167/shard-kbl3/igt@gen9_exec_parse@allowed-all.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-untiled:
    - shard-snb:          [PASS][16] -> [DMESG-WARN][17] ([i915#478])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7956/shard-snb5/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-untiled.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4167/shard-snb7/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-untiled.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu:
    - shard-tglb:         [PASS][18] -> [SKIP][19] ([i915#668]) +4 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7956/shard-tglb2/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4167/shard-tglb2/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [PASS][20] -> [SKIP][21] ([i915#433])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7956/shard-tglb1/igt@kms_hdmi_inject@inject-audio.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4167/shard-tglb1/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-apl:          [PASS][22] -> [DMESG-WARN][23] ([i915#180]) +1 similar issue
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7956/shard-apl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4167/shard-apl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][24] -> [SKIP][25] ([fdo#109441]) +1 similar issue
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7956/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4167/shard-iclb4/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [PASS][26] -> [TIMEOUT][27] ([fdo#112271] / [i915#1085])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7956/shard-tglb2/igt@perf@gen12-mi-rpc.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4167/shard-tglb6/igt@perf@gen12-mi-rpc.html

  * igt@prime_mmap_coherency@read:
    - shard-hsw:          [PASS][28] -> [FAIL][29] ([i915#914])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7956/shard-hsw5/igt@prime_mmap_coherency@read.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4167/shard-hsw2/igt@prime_mmap_coherency@read.html

  
#### Possible fixes ####

  * igt@gem_caching@reads:
    - shard-hsw:          [FAIL][30] ([i915#694]) -> [PASS][31] +1 similar issue
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7956/shard-hsw8/igt@gem_caching@reads.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4167/shard-hsw8/igt@gem_caching@reads.html

  * {igt@gem_ctx_persistence@hostile}:
    - shard-apl:          [FAIL][32] ([i915#1081]) -> [PASS][33]
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7956/shard-apl3/igt@gem_ctx_persistence@hostile.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4167/shard-apl8/igt@gem_ctx_persistence@hostile.html

  * igt@gem_exec_balancer@hang:
    - shard-tglb:         [TIMEOUT][34] ([fdo#112271]) -> [PASS][35]
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7956/shard-tglb7/igt@gem_exec_balancer@hang.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4167/shard-tglb2/igt@gem_exec_balancer@hang.html

  * igt@gem_exec_schedule@out-order-blt:
    - shard-apl:          [FAIL][36] -> [PASS][37] +1 similar issue
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7956/shard-apl3/igt@gem_exec_schedule@out-order-blt.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4167/shard-apl6/igt@gem_exec_schedule@out-order-blt.html

  * igt@gem_exec_schedule@pi-userfault-bsd:
    - shard-iclb:         [SKIP][38] ([i915#677]) -> [PASS][39]
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7956/shard-iclb2/igt@gem_exec_schedule@pi-userfault-bsd.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4167/shard-iclb7/igt@gem_exec_schedule@pi-userfault-bsd.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [SKIP][40] ([fdo#112146]) -> [PASS][41] +3 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7956/shard-iclb2/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4167/shard-iclb3/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-snb:          [DMESG-WARN][42] ([fdo#110789] / [fdo#111870] / [i915#478]) -> [PASS][43]
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7956/shard-snb1/igt@gem_userptr_blits@dmabuf-unsync.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4167/shard-snb7/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@i915_pm_rps@waitboost:
    - shard-iclb:         [FAIL][44] ([i915#413]) -> [PASS][45]
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7956/shard-iclb4/igt@i915_pm_rps@waitboost.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4167/shard-iclb7/igt@i915_pm_rps@waitboost.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-apl:          [DMESG-WARN][46] ([i915#180]) -> [PASS][47] +5 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7956/shard-apl1/igt@i915_suspend@fence-restore-tiled2untiled.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4167/shard-apl1/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_busy@extended-modeset-hang-newfb-render-pipe-a:
    - shard-apl:          [SKIP][48] ([fdo#109271]) -> [PASS][49] +1 similar issue
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7956/shard-apl3/igt@kms_busy@extended-modeset-hang-newfb-render-pipe-a.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4167/shard-apl4/igt@kms_busy@extended-modeset-hang-newfb-render-pipe-a.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][50] ([i915#180]) -> [PASS][51] +4 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7956/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4167/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:
    - shard-glk:          [FAIL][52] ([i915#49]) -> [PASS][53] +1 similar issue
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7956/shard-glk1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4167/shard-glk5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_plane_lowres@pipe-a-tiling-y:
    - shard-glk:          [FAIL][54] ([i915#899]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7956/shard-glk1/igt@kms_plane_lowres@pipe-a-tiling-y.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4167/shard-glk7/igt@kms_plane_lowres@pipe-a-tiling-y.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [SKIP][56] ([fdo#109441]) -> [PASS][57] +1 similar issue
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7956/shard-iclb5/igt@kms_psr@psr2_primary_mmap_cpu.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4167/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][58] ([i915#31]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7956/shard-apl8/igt@kms_setmode@basic.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4167/shard-apl7/igt@kms_setmode@basic.html
    - shard-hsw:          [FAIL][60] ([i915#31]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7956/shard-hsw1/igt@kms_setmode@basic.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4167/shard-hsw2/igt@kms_setmode@basic.html

  * igt@perf_pmu@busy-no-semaphores-vcs1:
    - shard-iclb:         [SKIP][62] ([fdo#112080]) -> [PASS][63] +10 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7956/shard-iclb6/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4167/shard-iclb2/igt@perf_pmu@busy-no-semaphores-vcs1.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [SKIP][64] ([fdo#109276]) -> [PASS][65] +13 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7956/shard-iclb3/igt@prime_busy@hang-bsd2.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4167/shard-iclb2/igt@prime_busy@hang-bsd2.html

  * igt@prime_mmap_coherency@ioctl-errors:
    - shard-hsw:          [FAIL][66] ([i915#831]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7956/shard-hsw5/igt@prime_mmap_coherency@ioctl-errors.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4167/shard-hsw1/igt@prime_mmap_coherency@ioctl-errors.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [SKIP][68] ([fdo#112080]) -> [FAIL][69] ([IGT#28])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7956/shard-iclb7/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4167/shard-iclb1/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@gem_tiled_blits@normal:
    - shard-hsw:          [FAIL][70] ([i915#694]) -> [INCOMPLETE][71] ([i915#61])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7956/shard-hsw5/igt@gem_tiled_blits@normal.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4167/shard-hsw7/igt@gem_tiled_blits@normal.html

  * igt@i915_pm_rpm@system-suspend-modeset:
    - shard-snb:          [SKIP][72] ([fdo#109271]) -> [INCOMPLETE][73] ([i915#82])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7956/shard-snb6/igt@i915_pm_rpm@system-suspend-modeset.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4167/shard-snb6/igt@i915_pm_rpm@system-suspend-modeset.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [SKIP][74] ([fdo#109349]) -> [DMESG-WARN][75] ([i915#1226])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7956/shard-iclb7/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4167/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@runner@aborted:
    - shard-kbl:          [FAIL][76] ([i915#974]) -> ([FAIL][77], [FAIL][78]) ([i915#716] / [i915#974])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7956/shard-kbl7/igt@runner@aborted.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4167/shard-kbl3/igt@runner@aborted.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4167/shard-kbl3/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1081]: https://gitlab.freedesktop.org/drm/intel/issues/1081
  [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
  [i915#1226]: https://gitlab.freedesktop.org/drm/intel/issues/1226
  [i915#1241]: https://gitlab.freedesktop.org/drm/intel/issues/1241
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#831]: https://gitlab.freedesktop.org/drm/intel/issues/831
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [i915#914]: https://gitlab.freedesktop.org/drm/intel/issues/914
  [i915#974]: https://gitlab.freedesktop.org/drm/intel/issues/974
  [i915#977]: https://gitlab.freedesktop.org/drm/intel/issues/977


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5445 -> IGTPW_4167
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7956: 7f05176cd4ad1b2e95832eb46da34eb0ee296370 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4167: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4167/index.html
  IGT_5445: 21e523814d692978d6d04ba85eadd67fcbd88b7e @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4167/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
