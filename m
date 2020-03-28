Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sat, 28 Mar 2020 14:21:58 -0000
Message-ID: <158540531835.10054.16913772619670748532@emeril.freedesktop.org>
References: <20200327140844.11430-1-mika.kahola@intel.com>
In-Reply-To: <20200327140844.11430-1-mika.kahola@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fconcurrent=3A_Move_bandwidth_calculation_to_igt=5Ffixture?=
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

Series: tests/kms_concurrent: Move bandwidth calculation to igt_fixture
URL   : https://patchwork.freedesktop.org/series/75174/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8202_full -> IGTPW_4367_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4367_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4367_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4367/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4367_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_concurrent@pipe-c:
    - shard-hsw:          NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4367/shard-hsw5/igt@kms_concurrent@pipe-c.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@perf@polling-parameterized}:
    - shard-iclb:         [PASS][2] -> [FAIL][3]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-iclb7/igt@perf@polling-parameterized.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4367/shard-iclb7/igt@perf@polling-parameterized.html

  
Known issues
------------

  Here are the changes found in IGTPW_4367_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_create@create-clear:
    - shard-hsw:          [PASS][4] -> [TIMEOUT][5] ([i915#1358])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-hsw6/igt@gem_create@create-clear.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4367/shard-hsw5/igt@gem_create@create-clear.html

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-iclb:         [PASS][6] -> [INCOMPLETE][7] ([i915#1492])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-iclb2/igt@gem_ctx_persistence@close-replace-race.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4367/shard-iclb5/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_exec_schedule@implicit-read-write-bsd1:
    - shard-iclb:         [PASS][8] -> [SKIP][9] ([fdo#109276] / [i915#677])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-iclb4/igt@gem_exec_schedule@implicit-read-write-bsd1.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4367/shard-iclb8/igt@gem_exec_schedule@implicit-read-write-bsd1.html

  * igt@gem_exec_schedule@pi-shared-iova-bsd:
    - shard-iclb:         [PASS][10] -> [SKIP][11] ([i915#677]) +2 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-iclb3/igt@gem_exec_schedule@pi-shared-iova-bsd.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4367/shard-iclb1/igt@gem_exec_schedule@pi-shared-iova-bsd.html

  * igt@gem_exec_schedule@pi-userfault-bsd2:
    - shard-iclb:         [PASS][12] -> [SKIP][13] ([fdo#109276]) +14 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-iclb2/igt@gem_exec_schedule@pi-userfault-bsd2.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4367/shard-iclb5/igt@gem_exec_schedule@pi-userfault-bsd2.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [PASS][14] -> [SKIP][15] ([fdo#112146]) +6 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-iclb7/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4367/shard-iclb4/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-apl:          [PASS][16] -> [DMESG-WARN][17] ([i915#180]) +2 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-apl7/igt@gem_workarounds@suspend-resume-context.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4367/shard-apl6/igt@gem_workarounds@suspend-resume-context.html

  * igt@i915_pm_rpm@gem-evict-pwrite:
    - shard-hsw:          [PASS][18] -> [SKIP][19] ([fdo#109271])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-hsw2/igt@i915_pm_rpm@gem-evict-pwrite.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4367/shard-hsw7/igt@i915_pm_rpm@gem-evict-pwrite.html
    - shard-tglb:         [PASS][20] -> [SKIP][21] ([i915#1316])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-tglb1/igt@i915_pm_rpm@gem-evict-pwrite.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4367/shard-tglb8/igt@i915_pm_rpm@gem-evict-pwrite.html
    - shard-iclb:         [PASS][22] -> [SKIP][23] ([i915#1316])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-iclb3/igt@i915_pm_rpm@gem-evict-pwrite.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4367/shard-iclb4/igt@i915_pm_rpm@gem-evict-pwrite.html
    - shard-glk:          [PASS][24] -> [SKIP][25] ([fdo#109271])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-glk6/igt@i915_pm_rpm@gem-evict-pwrite.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4367/shard-glk5/igt@i915_pm_rpm@gem-evict-pwrite.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x85-random:
    - shard-kbl:          [PASS][26] -> [FAIL][27] ([i915#54] / [i915#93] / [i915#95])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-256x85-random.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4367/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-256x85-random.html

  * igt@kms_cursor_crc@pipe-c-cursor-alpha-opaque:
    - shard-glk:          [PASS][28] -> [FAIL][29] ([i915#54])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-glk5/igt@kms_cursor_crc@pipe-c-cursor-alpha-opaque.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4367/shard-glk1/igt@kms_cursor_crc@pipe-c-cursor-alpha-opaque.html
    - shard-apl:          [PASS][30] -> [FAIL][31] ([i915#54])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-apl4/igt@kms_cursor_crc@pipe-c-cursor-alpha-opaque.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4367/shard-apl3/igt@kms_cursor_crc@pipe-c-cursor-alpha-opaque.html
    - shard-kbl:          [PASS][32] -> [FAIL][33] ([i915#54])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-alpha-opaque.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4367/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-alpha-opaque.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled:
    - shard-glk:          [PASS][34] -> [FAIL][35] ([i915#177] / [i915#52] / [i915#54])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4367/shard-glk5/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html

  * igt@kms_draw_crc@draw-method-rgb565-render-untiled:
    - shard-glk:          [PASS][36] -> [FAIL][37] ([i915#52] / [i915#54]) +2 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-glk7/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4367/shard-glk2/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html

  * igt@kms_flip@flip-vs-panning-interruptible:
    - shard-apl:          [PASS][38] -> [DMESG-WARN][39] ([i915#1297])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-apl4/igt@kms_flip@flip-vs-panning-interruptible.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4367/shard-apl8/igt@kms_flip@flip-vs-panning-interruptible.html
    - shard-kbl:          [PASS][40] -> [DMESG-WARN][41] ([i915#1297])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-kbl3/igt@kms_flip@flip-vs-panning-interruptible.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4367/shard-kbl1/igt@kms_flip@flip-vs-panning-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-kbl:          [PASS][42] -> [DMESG-WARN][43] ([i915#180]) +4 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4367/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_tiling@flip-changes-tiling:
    - shard-apl:          [PASS][44] -> [FAIL][45] ([i915#95]) +2 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-apl3/igt@kms_flip_tiling@flip-changes-tiling.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4367/shard-apl8/igt@kms_flip_tiling@flip-changes-tiling.html
    - shard-kbl:          [PASS][46] -> [FAIL][47] ([i915#699] / [i915#93] / [i915#95])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-kbl7/igt@kms_flip_tiling@flip-changes-tiling.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4367/shard-kbl4/igt@kms_flip_tiling@flip-changes-tiling.html

  * igt@kms_flip_tiling@flip-changes-tiling-y:
    - shard-kbl:          [PASS][48] -> [FAIL][49] ([fdo#107931] / [i915#699] / [i915#93] / [i915#95])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-kbl7/igt@kms_flip_tiling@flip-changes-tiling-y.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4367/shard-kbl1/igt@kms_flip_tiling@flip-changes-tiling-y.html

  * igt@kms_mmap_write_crc@main:
    - shard-kbl:          [PASS][50] -> [FAIL][51] ([i915#93] / [i915#95])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-kbl6/igt@kms_mmap_write_crc@main.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4367/shard-kbl3/igt@kms_mmap_write_crc@main.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-7efc:
    - shard-apl:          [PASS][52] -> [FAIL][53] ([fdo#108145] / [i915#95])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4367/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [PASS][54] -> [SKIP][55] ([fdo#109642] / [fdo#111068])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4367/shard-iclb1/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [PASS][56] -> [SKIP][57] ([fdo#109441]) +1 similar issue
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-iclb2/igt@kms_psr@psr2_no_drrs.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4367/shard-iclb8/igt@kms_psr@psr2_no_drrs.html

  * igt@perf_pmu@busy-no-semaphores-vcs1:
    - shard-iclb:         [PASS][58] -> [SKIP][59] ([fdo#112080]) +8 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-iclb2/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4367/shard-iclb3/igt@perf_pmu@busy-no-semaphores-vcs1.html

  
#### Possible fixes ####

  * igt@gem_eio@in-flight-suspend:
    - shard-kbl:          [DMESG-WARN][60] ([i915#180] / [i915#93] / [i915#95]) -> [PASS][61] +1 similar issue
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-kbl2/igt@gem_eio@in-flight-suspend.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4367/shard-kbl6/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_balancer@hang:
    - shard-tglb:         [FAIL][62] ([i915#1277]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-tglb5/igt@gem_exec_balancer@hang.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4367/shard-tglb3/igt@gem_exec_balancer@hang.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [SKIP][64] ([fdo#110854]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-iclb8/igt@gem_exec_balancer@smoke.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4367/shard-iclb1/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_schedule@implicit-both-bsd:
    - shard-iclb:         [SKIP][66] ([i915#677]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-iclb4/igt@gem_exec_schedule@implicit-both-bsd.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4367/shard-iclb7/igt@gem_exec_schedule@implicit-both-bsd.html

  * igt@gem_exec_schedule@implicit-both-bsd1:
    - shard-iclb:         [SKIP][68] ([fdo#109276] / [i915#677]) -> [PASS][69] +2 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-iclb8/igt@gem_exec_schedule@implicit-both-bsd1.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4367/shard-iclb4/igt@gem_exec_schedule@implicit-both-bsd1.html

  * igt@gem_exec_schedule@reorder-wide-bsd:
    - shard-iclb:         [SKIP][70] ([fdo#112146]) -> [PASS][71] +4 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-iclb1/igt@gem_exec_schedule@reorder-wide-bsd.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4367/shard-iclb7/igt@gem_exec_schedule@reorder-wide-bsd.html

  * igt@i915_pm_rpm@dpms-mode-unset-lpsp:
    - shard-tglb:         [SKIP][72] ([i915#1316]) -> [PASS][73] +1 similar issue
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-tglb2/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4367/shard-tglb5/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@i915_pm_rpm@pm-tiling:
    - shard-hsw:          [SKIP][74] ([fdo#109271]) -> [PASS][75] +1 similar issue
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-hsw7/igt@i915_pm_rpm@pm-tiling.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4367/shard-hsw8/igt@i915_pm_rpm@pm-tiling.html
    - shard-iclb:         [SKIP][76] ([i915#1316]) -> [PASS][77] +1 similar issue
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-iclb4/igt@i915_pm_rpm@pm-tiling.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4367/shard-iclb2/igt@i915_pm_rpm@pm-tiling.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-offscreen:
    - shard-kbl:          [FAIL][78] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][79] +1 similar issue
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-64x64-offscreen.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4367/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x64-offscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][80] ([i915#180]) -> [PASS][81] +3 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4367/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-untiled:
    - shard-glk:          [FAIL][82] ([i915#52] / [i915#54]) -> [PASS][83] +2 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-glk7/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-untiled.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4367/shard-glk3/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled:
    - shard-kbl:          [FAIL][84] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95]) -> [PASS][85] +1 similar issue
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-kbl7/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4367/shard-kbl6/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
    - shard-apl:          [FAIL][86] ([i915#52] / [i915#54] / [i915#95]) -> [PASS][87] +1 similar issue
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-apl8/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4367/shard-apl2/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [DMESG-WARN][88] ([i915#180] / [i915#95]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-apl1/igt@kms_fbcon_fbt@fbc-suspend.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4367/shard-apl6/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-hsw:          [INCOMPLETE][90] ([i915#61]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-hsw4/igt@kms_flip@flip-vs-suspend-interruptible.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4367/shard-hsw7/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-kbl:          [FAIL][92] ([i915#49]) -> [PASS][93]
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4367/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc.html
    - shard-apl:          [FAIL][94] ([i915#49]) -> [PASS][95]
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-apl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4367/shard-apl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-64:
    - shard-apl:          [FAIL][96] ([i915#95]) -> [PASS][97]
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-apl2/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4367/shard-apl2/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
    - shard-kbl:          [FAIL][98] ([i915#93] / [i915#95]) -> [PASS][99]
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-kbl2/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4367/shard-kbl4/igt@kms_plane_cursor@pipe-a-overlay-size-64.html

  * igt@kms_psr@psr2_suspend:
    - shard-iclb:         [SKIP][100] ([fdo#109441]) -> [PASS][101] +2 similar issues
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-iclb4/igt@kms_psr@psr2_suspend.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4367/shard-iclb2/igt@kms_psr@psr2_suspend.html

  * igt@kms_vblank@pipe-a-wait-forked-busy:
    - shard-snb:          [SKIP][102] ([fdo#109271]) -> [PASS][103]
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-snb4/igt@kms_vblank@pipe-a-wait-forked-busy.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4367/shard-snb1/igt@kms_vblank@pipe-a-wait-forked-busy.html

  * igt@kms_vblank@pipe-c-ts-continuation-suspend:
    - shard-apl:          [DMESG-WARN][104] ([i915#180]) -> [PASS][105] +2 similar issues
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-apl6/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4367/shard-apl7/igt@kms_vblank@pipe-c-ts-continuation-suspend.html

  * {igt@perf@blocking-parameterized}:
    - shard-iclb:         [FAIL][106] -> [PASS][107]
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-iclb1/igt@perf@blocking-parameterized.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4367/shard-iclb7/igt@perf@blocking-parameterized.html

  * {igt@perf@polling-parameterized}:
    - shard-hsw:          [FAIL][108] -> [PASS][109]
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-hsw5/igt@perf@polling-parameterized.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4367/shard-hsw2/igt@perf@polling-parameterized.html

  * igt@perf_pmu@init-busy-vcs1:
    - shard-iclb:         [SKIP][110] ([fdo#112080]) -> [PASS][111] +8 similar issues
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-iclb3/igt@perf_pmu@init-busy-vcs1.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4367/shard-iclb1/igt@perf_pmu@init-busy-vcs1.html

  * igt@perf_pmu@rc6-runtime-pm:
    - shard-glk:          [SKIP][112] ([fdo#109271]) -> [PASS][113] +1 similar issue
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-glk5/igt@perf_pmu@rc6-runtime-pm.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4367/shard-glk6/igt@perf_pmu@rc6-runtime-pm.html
    - shard-tglb:         [SKIP][114] ([fdo#111719]) -> [PASS][115]
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-tglb2/igt@perf_pmu@rc6-runtime-pm.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4367/shard-tglb7/igt@perf_pmu@rc6-runtime-pm.html
    - shard-iclb:         [SKIP][116] ([i915#293]) -> [PASS][117]
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-iclb4/igt@perf_pmu@rc6-runtime-pm.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4367/shard-iclb5/igt@perf_pmu@rc6-runtime-pm.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [SKIP][118] ([fdo#109276]) -> [PASS][119] +15 similar issues
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8202/shard-iclb5/igt@prime_busy@hang-bsd2.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4367/shard-iclb2/igt@prime_busy@hang-bsd2.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#107931]: https://bugs.freedesktop.org/show_bug.cgi?id=107931
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111719]: https://bugs.freedesktop.org/show_bug.cgi?id=111719
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1277]: https://gitlab.freedesktop.org/drm/intel/issues/1277
  [i915#1297]: https://gitlab.freedesktop.org/drm/intel/issues/1297
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1358]: https://gitlab.freedesktop.org/drm/intel/issues/1358
  [i915#1492]: https://gitlab.freedesktop.org/drm/intel/issues/1492
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#293]: https://gitlab.freedesktop.org/drm/intel/issues/293
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#699]: https://gitlab.freedesktop.org/drm/intel/issues/699
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5542 -> IGTPW_4367
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8202: 3d926ba12446374635f2fc299233742ffc1ba69a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4367: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4367/index.html
  IGT_5542: 633ae927e4924006040f075841ef8d98751ce3b4 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4367/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
