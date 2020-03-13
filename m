Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 13 Mar 2020 23:10:24 -0000
Message-ID: <158414102467.30351.4922811239805740708@emeril.freedesktop.org>
References: <20200313161133.2012-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20200313161133.2012-1-ville.syrjala@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/5=5D_tests/kms=5Ftiled=5Fdisplay=3A?=
 =?utf-8?q?_Get_rid_of_DP_stuff?=
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
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,1/5] tests/kms_tiled_display: Get rid of DP stuff
URL   : https://patchwork.freedesktop.org/series/74687/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8135_full -> IGTPW_4303_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4303_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4303_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4303/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4303_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_set_tiling_vs_gtt:
    - shard-hsw:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8135/shard-hsw4/igt@gem_set_tiling_vs_gtt.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4303/shard-hsw6/igt@gem_set_tiling_vs_gtt.html

  * igt@kms_flip@modeset-vs-vblank-race-interruptible:
    - shard-kbl:          [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8135/shard-kbl6/igt@kms_flip@modeset-vs-vblank-race-interruptible.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4303/shard-kbl3/igt@kms_flip@modeset-vs-vblank-race-interruptible.html

  * {igt@kms_tiled_display@basic-test-pattern} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4303/shard-tglb2/igt@kms_tiled_display@basic-test-pattern.html
    - shard-iclb:         NOTRUN -> [SKIP][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4303/shard-iclb8/igt@kms_tiled_display@basic-test-pattern.html

  
#### Warnings ####

  * igt@runner@aborted:
    - shard-hsw:          ([FAIL][7], [FAIL][8], [FAIL][9], [FAIL][10], [FAIL][11], [FAIL][12], [FAIL][13]) ([fdo#111870]) -> ([FAIL][14], [FAIL][15], [FAIL][16], [FAIL][17], [FAIL][18], [FAIL][19], [FAIL][20], [FAIL][21]) ([fdo#111870] / [i915#478])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8135/shard-hsw6/igt@runner@aborted.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8135/shard-hsw5/igt@runner@aborted.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8135/shard-hsw6/igt@runner@aborted.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8135/shard-hsw1/igt@runner@aborted.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8135/shard-hsw7/igt@runner@aborted.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8135/shard-hsw2/igt@runner@aborted.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8135/shard-hsw5/igt@runner@aborted.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4303/shard-hsw1/igt@runner@aborted.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4303/shard-hsw5/igt@runner@aborted.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4303/shard-hsw6/igt@runner@aborted.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4303/shard-hsw7/igt@runner@aborted.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4303/shard-hsw7/igt@runner@aborted.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4303/shard-hsw4/igt@runner@aborted.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4303/shard-hsw4/igt@runner@aborted.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4303/shard-hsw4/igt@runner@aborted.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8135_full and IGTPW_4303_full:

### New IGT tests (1) ###

  * igt@kms_tiled_display@basic-test-pattern:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_4303_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@vecs0-s3:
    - shard-apl:          [PASS][22] -> [DMESG-WARN][23] ([i915#180]) +1 similar issue
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8135/shard-apl1/igt@gem_ctx_isolation@vecs0-s3.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4303/shard-apl1/igt@gem_ctx_isolation@vecs0-s3.html

  * igt@gem_exec_parallel@fds:
    - shard-glk:          [PASS][24] -> [INCOMPLETE][25] ([i915#58] / [k.org#198133])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8135/shard-glk1/igt@gem_exec_parallel@fds.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4303/shard-glk9/igt@gem_exec_parallel@fds.html

  * igt@gem_exec_reloc@basic-gtt-noreloc:
    - shard-hsw:          [PASS][26] -> [DMESG-WARN][27] ([i915#478])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8135/shard-hsw1/igt@gem_exec_reloc@basic-gtt-noreloc.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4303/shard-hsw7/igt@gem_exec_reloc@basic-gtt-noreloc.html

  * igt@gem_exec_schedule@implicit-read-write-bsd1:
    - shard-iclb:         [PASS][28] -> [SKIP][29] ([fdo#109276] / [i915#677]) +2 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8135/shard-iclb1/igt@gem_exec_schedule@implicit-read-write-bsd1.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4303/shard-iclb8/igt@gem_exec_schedule@implicit-read-write-bsd1.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [PASS][30] -> [SKIP][31] ([fdo#112146]) +5 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8135/shard-iclb5/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4303/shard-iclb2/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_exec_whisper@basic-fds-all:
    - shard-tglb:         [PASS][32] -> [INCOMPLETE][33] ([i915#1401])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8135/shard-tglb3/igt@gem_exec_whisper@basic-fds-all.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4303/shard-tglb5/igt@gem_exec_whisper@basic-fds-all.html

  * igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-iclb:         [PASS][34] -> [SKIP][35] ([i915#1316])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8135/shard-iclb4/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4303/shard-iclb1/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html
    - shard-tglb:         [PASS][36] -> [SKIP][37] ([i915#1316])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8135/shard-tglb3/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4303/shard-tglb1/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@i915_pm_rps@waitboost:
    - shard-iclb:         [PASS][38] -> [FAIL][39] ([i915#413])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8135/shard-iclb1/igt@i915_pm_rps@waitboost.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4303/shard-iclb4/igt@i915_pm_rps@waitboost.html

  * igt@i915_selftest@live@execlists:
    - shard-glk:          [PASS][40] -> [INCOMPLETE][41] ([i915#58] / [i915#656] / [k.org#198133])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8135/shard-glk4/igt@i915_selftest@live@execlists.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4303/shard-glk7/igt@i915_selftest@live@execlists.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen:
    - shard-apl:          [PASS][42] -> [FAIL][43] ([i915#54])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8135/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4303/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html
    - shard-kbl:          [PASS][44] -> [FAIL][45] ([i915#54])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8135/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4303/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html

  * igt@kms_flip@dpms-off-confusion-interruptible:
    - shard-kbl:          [PASS][46] -> [DMESG-WARN][47] ([i915#1297])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8135/shard-kbl3/igt@kms_flip@dpms-off-confusion-interruptible.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4303/shard-kbl6/igt@kms_flip@dpms-off-confusion-interruptible.html
    - shard-apl:          [PASS][48] -> [DMESG-WARN][49] ([i915#1297])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8135/shard-apl4/igt@kms_flip@dpms-off-confusion-interruptible.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4303/shard-apl3/igt@kms_flip@dpms-off-confusion-interruptible.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-snb:          [PASS][50] -> [DMESG-WARN][51] ([i915#42])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8135/shard-snb6/igt@kms_flip@flip-vs-suspend.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4303/shard-snb4/igt@kms_flip@flip-vs-suspend.html
    - shard-kbl:          [PASS][52] -> [DMESG-WARN][53] ([i915#180])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8135/shard-kbl7/igt@kms_flip@flip-vs-suspend.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4303/shard-kbl7/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@modeset-vs-vblank-race-interruptible:
    - shard-apl:          [PASS][54] -> [INCOMPLETE][55] ([fdo#103927])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8135/shard-apl7/igt@kms_flip@modeset-vs-vblank-race-interruptible.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4303/shard-apl4/igt@kms_flip@modeset-vs-vblank-race-interruptible.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-iclb:         [PASS][56] -> [SKIP][57] ([fdo#109441])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8135/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4303/shard-iclb3/igt@kms_psr@psr2_cursor_plane_move.html

  * igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm:
    - shard-tglb:         [PASS][58] -> [SKIP][59] ([fdo#112015])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8135/shard-tglb6/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4303/shard-tglb1/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html
    - shard-hsw:          [PASS][60] -> [SKIP][61] ([fdo#109271])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8135/shard-hsw7/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4303/shard-hsw1/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html
    - shard-iclb:         [PASS][62] -> [SKIP][63] ([fdo#109278])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8135/shard-iclb8/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4303/shard-iclb1/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html
    - shard-glk:          [PASS][64] -> [SKIP][65] ([fdo#109271])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8135/shard-glk4/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4303/shard-glk6/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html

  * igt@kms_vblank@pipe-c-ts-continuation-suspend:
    - shard-kbl:          [PASS][66] -> [INCOMPLETE][67] ([i915#794])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8135/shard-kbl2/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4303/shard-kbl3/igt@kms_vblank@pipe-c-ts-continuation-suspend.html

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [PASS][68] -> [FAIL][69] ([i915#1085])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8135/shard-tglb2/igt@perf@gen12-mi-rpc.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4303/shard-tglb1/igt@perf@gen12-mi-rpc.html

  * igt@perf_pmu@busy-check-all-vcs1:
    - shard-iclb:         [PASS][70] -> [SKIP][71] ([fdo#112080]) +9 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8135/shard-iclb1/igt@perf_pmu@busy-check-all-vcs1.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4303/shard-iclb3/igt@perf_pmu@busy-check-all-vcs1.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [PASS][72] -> [SKIP][73] ([fdo#109276]) +19 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8135/shard-iclb2/igt@prime_vgem@fence-wait-bsd2.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4303/shard-iclb8/igt@prime_vgem@fence-wait-bsd2.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-iclb:         [INCOMPLETE][74] ([i915#1402]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8135/shard-iclb2/igt@gem_ctx_persistence@close-replace-race.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4303/shard-iclb3/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [SKIP][76] ([fdo#110854]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8135/shard-iclb7/igt@gem_exec_balancer@smoke.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4303/shard-iclb4/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_schedule@implicit-both-bsd1:
    - shard-iclb:         [SKIP][78] ([fdo#109276] / [i915#677]) -> [PASS][79] +2 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8135/shard-iclb8/igt@gem_exec_schedule@implicit-both-bsd1.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4303/shard-iclb1/igt@gem_exec_schedule@implicit-both-bsd1.html

  * igt@gem_exec_schedule@implicit-read-write-bsd:
    - shard-iclb:         [SKIP][80] ([i915#677]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8135/shard-iclb2/igt@gem_exec_schedule@implicit-read-write-bsd.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4303/shard-iclb3/igt@gem_exec_schedule@implicit-read-write-bsd.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [SKIP][82] ([fdo#112146]) -> [PASS][83] +4 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8135/shard-iclb1/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4303/shard-iclb5/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_userptr_blits@sync-unmap-after-close:
    - shard-hsw:          [DMESG-WARN][84] ([fdo#111870]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8135/shard-hsw5/igt@gem_userptr_blits@sync-unmap-after-close.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4303/shard-hsw6/igt@gem_userptr_blits@sync-unmap-after-close.html

  * igt@i915_hangman@error-state-capture-vcs1:
    - shard-iclb:         [SKIP][86] ([fdo#112080]) -> [PASS][87] +6 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8135/shard-iclb7/igt@i915_hangman@error-state-capture-vcs1.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4303/shard-iclb2/igt@i915_hangman@error-state-capture-vcs1.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [FAIL][88] ([i915#454]) -> [PASS][89] +1 similar issue
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8135/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4303/shard-iclb6/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rps@reset:
    - shard-iclb:         [FAIL][90] ([i915#413]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8135/shard-iclb2/igt@i915_pm_rps@reset.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4303/shard-iclb1/igt@i915_pm_rps@reset.html

  * igt@kms_color@pipe-b-degamma:
    - shard-kbl:          [FAIL][92] ([i915#71]) -> [PASS][93]
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8135/shard-kbl4/igt@kms_color@pipe-b-degamma.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4303/shard-kbl2/igt@kms_color@pipe-b-degamma.html
    - shard-apl:          [FAIL][94] ([i915#71]) -> [PASS][95]
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8135/shard-apl2/igt@kms_color@pipe-b-degamma.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4303/shard-apl3/igt@kms_color@pipe-b-degamma.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-iclb:         [FAIL][96] ([IGT#5]) -> [PASS][97]
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8135/shard-iclb8/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4303/shard-iclb8/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-apl:          [DMESG-WARN][98] ([i915#180]) -> [PASS][99] +1 similar issue
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8135/shard-apl6/igt@kms_flip@flip-vs-suspend-interruptible.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4303/shard-apl2/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [FAIL][100] ([i915#899]) -> [PASS][101]
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8135/shard-glk4/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4303/shard-glk6/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr@psr2_basic:
    - shard-iclb:         [SKIP][102] ([fdo#109441]) -> [PASS][103] +1 similar issue
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8135/shard-iclb8/igt@kms_psr@psr2_basic.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4303/shard-iclb2/igt@kms_psr@psr2_basic.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][104] ([i915#31]) -> [PASS][105]
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8135/shard-apl3/igt@kms_setmode@basic.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4303/shard-apl6/igt@kms_setmode@basic.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [SKIP][106] ([fdo#109276]) -> [PASS][107] +19 similar issues
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8135/shard-iclb6/igt@prime_busy@hang-bsd2.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4303/shard-iclb4/igt@prime_busy@hang-bsd2.html

  
#### Warnings ####

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-snb:          [DMESG-WARN][108] ([fdo#110789] / [fdo#111870] / [i915#478]) -> [DMESG-WARN][109] ([fdo#111870] / [i915#478])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8135/shard-snb2/igt@gem_userptr_blits@dmabuf-sync.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4303/shard-snb2/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-hsw:          [DMESG-WARN][110] ([fdo#110789] / [fdo#111870]) -> [DMESG-WARN][111] ([fdo#111870])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8135/shard-hsw5/igt@gem_userptr_blits@dmabuf-sync.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4303/shard-hsw5/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [SKIP][112] ([i915#468]) -> [FAIL][113] ([i915#454])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8135/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4303/shard-tglb5/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [FAIL][114] ([i915#454]) -> [SKIP][115] ([i915#468])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8135/shard-tglb3/igt@i915_pm_dc@dc6-psr.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4303/shard-tglb2/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@modeset-pc8-residency-stress:
    - shard-tglb:         [SKIP][116] ([i915#1316]) -> [SKIP][117] ([fdo#109506])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8135/shard-tglb1/igt@i915_pm_rpm@modeset-pc8-residency-stress.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4303/shard-tglb6/igt@i915_pm_rpm@modeset-pc8-residency-stress.html
    - shard-iclb:         [SKIP][118] ([i915#1316]) -> [SKIP][119] ([fdo#109293] / [fdo#109506])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8135/shard-iclb3/igt@i915_pm_rpm@modeset-pc8-residency-stress.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4303/shard-iclb4/igt@i915_pm_rpm@modeset-pc8-residency-stress.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-glk:          [FAIL][120] ([i915#133]) -> [FAIL][121] ([i915#117] / [i915#133])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8135/shard-glk9/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4303/shard-glk6/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][122], [FAIL][123]) ([i915#1389] / [i915#1402] / [i915#92]) -> [FAIL][124] ([i915#1389] / [i915#1402])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8135/shard-kbl6/igt@runner@aborted.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8135/shard-kbl1/igt@runner@aborted.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4303/shard-kbl4/igt@runner@aborted.html
    - shard-apl:          ([FAIL][125], [FAIL][126]) ([fdo#103927] / [i915#1402]) -> [FAIL][127] ([i915#1402])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8135/shard-apl7/igt@runner@aborted.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8135/shard-apl8/igt@runner@aborted.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4303/shard-apl6/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#5]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/5
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109293]: https://bugs.freedesktop.org/show_bug.cgi?id=109293
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112015]: https://bugs.freedesktop.org/show_bug.cgi?id=112015
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
  [i915#117]: https://gitlab.freedesktop.org/drm/intel/issues/117
  [i915#1297]: https://gitlab.freedesktop.org/drm/intel/issues/1297
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#133]: https://gitlab.freedesktop.org/drm/intel/issues/133
  [i915#1389]: https://gitlab.freedesktop.org/drm/intel/issues/1389
  [i915#1401]: https://gitlab.freedesktop.org/drm/intel/issues/1401
  [i915#1402]: https://gitlab.freedesktop.org/drm/intel/issues/1402
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#42]: https://gitlab.freedesktop.org/drm/intel/issues/42
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#656]: https://gitlab.freedesktop.org/drm/intel/issues/656
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#71]: https://gitlab.freedesktop.org/drm/intel/issues/71
  [i915#794]: https://gitlab.freedesktop.org/drm/intel/issues/794
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5508 -> IGTPW_4303
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8135: 17c19ee50a6cbb514b59f9f2d8d7d4f088a56300 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4303: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4303/index.html
  IGT_5508: 89d644600a1a9f08794cc7106b63758df40ce1d8 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4303/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
