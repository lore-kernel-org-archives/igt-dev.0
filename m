Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sat, 14 Dec 2019 11:06:02 -0000
Message-ID: <157632156274.13802.17249992152552050729@emeril.freedesktop.org>
References: <1576251706-32439-1-git-send-email-juhapekka.heikkila@gmail.com>
In-Reply-To: <1576251706-32439-1-git-send-email-juhapekka.heikkila@gmail.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Ffrontbuffer=5Ftracking=3A_optimize_test_execution_time_?=
 =?utf-8?b?KHJldjMp?=
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
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_frontbuffer_tracking: optimize test execution time (rev3)
URL   : https://patchwork.freedesktop.org/series/70126/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7559_full -> IGTPW_3862_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_3862_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_3862_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3862/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_3862_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_ctx_persistence@bcs0-mixed-process:
    - shard-iclb:         [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7559/shard-iclb2/igt@gem_ctx_persistence@bcs0-mixed-process.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3862/shard-iclb2/igt@gem_ctx_persistence@bcs0-mixed-process.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-cpu:
    - shard-tglb:         [PASS][3] -> [DMESG-WARN][4] +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7559/shard-tglb9/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-cpu.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3862/shard-tglb1/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-tilingchange:
    - shard-iclb:         [PASS][5] -> [DMESG-WARN][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7559/shard-iclb4/igt@kms_frontbuffer_tracking@fbc-tilingchange.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3862/shard-iclb2/igt@kms_frontbuffer_tracking@fbc-tilingchange.html
    - shard-tglb:         NOTRUN -> [DMESG-WARN][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3862/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-tilingchange.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@gen9_exec_parse@allowed-all}:
    - shard-iclb:         NOTRUN -> [SKIP][8] +8 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3862/shard-iclb3/igt@gen9_exec_parse@allowed-all.html

  * {igt@gen9_exec_parse@allowed-single}:
    - shard-tglb:         NOTRUN -> [SKIP][9] +6 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3862/shard-tglb1/igt@gen9_exec_parse@allowed-single.html

  
Known issues
------------

  Here are the changes found in IGTPW_3862_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-kbl:          [PASS][10] -> [DMESG-WARN][11] ([i915#180]) +8 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7559/shard-kbl3/igt@gem_ctx_isolation@rcs0-s3.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3862/shard-kbl2/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_ctx_persistence@vcs1-mixed-process:
    - shard-iclb:         [PASS][12] -> [SKIP][13] ([fdo#109276] / [fdo#112080]) +2 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7559/shard-iclb4/igt@gem_ctx_persistence@vcs1-mixed-process.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3862/shard-iclb3/igt@gem_ctx_persistence@vcs1-mixed-process.html

  * igt@gem_exec_parallel@vcs0:
    - shard-tglb:         [PASS][14] -> [INCOMPLETE][15] ([fdo#111593])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7559/shard-tglb2/igt@gem_exec_parallel@vcs0.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3862/shard-tglb1/igt@gem_exec_parallel@vcs0.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [PASS][16] -> [SKIP][17] ([fdo#112146]) +3 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7559/shard-iclb8/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3862/shard-iclb2/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [PASS][18] -> [FAIL][19] ([i915#644])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7559/shard-glk8/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3862/shard-glk9/igt@gem_ppgtt@flink-and-close-vma-leak.html
    - shard-kbl:          [PASS][20] -> [FAIL][21] ([i915#644])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7559/shard-kbl3/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3862/shard-kbl1/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_softpin@noreloc-s3:
    - shard-apl:          [PASS][22] -> [DMESG-WARN][23] ([i915#180]) +1 similar issue
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7559/shard-apl8/igt@gem_softpin@noreloc-s3.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3862/shard-apl6/igt@gem_softpin@noreloc-s3.html

  * igt@gem_sync@basic-store-each:
    - shard-tglb:         [PASS][24] -> [INCOMPLETE][25] ([i915#435] / [i915#472])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7559/shard-tglb9/igt@gem_sync@basic-store-each.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3862/shard-tglb8/igt@gem_sync@basic-store-each.html

  * igt@gem_tiled_blits@interruptible:
    - shard-hsw:          [PASS][26] -> [FAIL][27] ([i915#818])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7559/shard-hsw4/igt@gem_tiled_blits@interruptible.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3862/shard-hsw4/igt@gem_tiled_blits@interruptible.html

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-snb:          [PASS][28] -> [DMESG-WARN][29] ([fdo#111870]) +1 similar issue
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7559/shard-snb6/igt@gem_userptr_blits@sync-unmap-cycles.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3862/shard-snb2/igt@gem_userptr_blits@sync-unmap-cycles.html

  * igt@i915_hangman@error-state-capture-vcs1:
    - shard-iclb:         [PASS][30] -> [SKIP][31] ([fdo#112080]) +4 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7559/shard-iclb1/igt@i915_hangman@error-state-capture-vcs1.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3862/shard-iclb6/igt@i915_hangman@error-state-capture-vcs1.html

  * igt@i915_pm_rpm@system-suspend-devices:
    - shard-tglb:         [PASS][32] -> [INCOMPLETE][33] ([i915#456] / [i915#460])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7559/shard-tglb1/igt@i915_pm_rpm@system-suspend-devices.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3862/shard-tglb8/igt@i915_pm_rpm@system-suspend-devices.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-iclb:         [PASS][34] -> [INCOMPLETE][35] ([i915#140])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7559/shard-iclb2/igt@kms_fbcon_fbt@fbc-suspend.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3862/shard-iclb3/igt@kms_fbcon_fbt@fbc-suspend.html
    - shard-tglb:         [PASS][36] -> [INCOMPLETE][37] ([i915#435] / [i915#456] / [i915#460])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7559/shard-tglb1/igt@kms_fbcon_fbt@fbc-suspend.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3862/shard-tglb2/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-glk:          [PASS][38] -> [FAIL][39] ([i915#79])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7559/shard-glk5/igt@kms_flip@flip-vs-expired-vblank.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3862/shard-glk2/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-modeset-vs-hang-interruptible:
    - shard-kbl:          [PASS][40] -> [INCOMPLETE][41] ([fdo#103665] / [i915#600])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7559/shard-kbl2/igt@kms_flip@flip-vs-modeset-vs-hang-interruptible.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3862/shard-kbl6/igt@kms_flip@flip-vs-modeset-vs-hang-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
    - shard-kbl:          [PASS][42] -> [INCOMPLETE][43] ([fdo#103665] / [i915#667])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7559/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3862/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-cpu:
    - shard-glk:          [PASS][44] -> [FAIL][45] ([i915#49])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7559/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-cpu.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3862/shard-glk4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b:
    - shard-iclb:         [PASS][46] -> [DMESG-WARN][47] ([fdo#111764])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7559/shard-iclb2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3862/shard-iclb6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html

  * igt@kms_psr@psr2_sprite_blt:
    - shard-iclb:         [PASS][48] -> [SKIP][49] ([fdo#109441]) +1 similar issue
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7559/shard-iclb2/igt@kms_psr@psr2_sprite_blt.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3862/shard-iclb4/igt@kms_psr@psr2_sprite_blt.html

  * igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend:
    - shard-tglb:         [PASS][50] -> [INCOMPLETE][51] ([i915#460])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7559/shard-tglb4/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3862/shard-tglb8/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [PASS][52] -> [SKIP][53] ([fdo#109276]) +9 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7559/shard-iclb4/igt@prime_vgem@fence-wait-bsd2.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3862/shard-iclb6/igt@prime_vgem@fence-wait-bsd2.html

  
#### Possible fixes ####

  * igt@gem_busy@close-race:
    - shard-tglb:         [INCOMPLETE][54] ([i915#435]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7559/shard-tglb6/igt@gem_busy@close-race.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3862/shard-tglb5/igt@gem_busy@close-race.html

  * igt@gem_ctx_isolation@vcs1-dirty-switch:
    - shard-iclb:         [SKIP][56] ([fdo#109276] / [fdo#112080]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7559/shard-iclb8/igt@gem_ctx_isolation@vcs1-dirty-switch.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3862/shard-iclb1/igt@gem_ctx_isolation@vcs1-dirty-switch.html

  * igt@gem_ctx_persistence@vcs0-mixed-process:
    - shard-apl:          [FAIL][58] ([i915#679]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7559/shard-apl7/igt@gem_ctx_persistence@vcs0-mixed-process.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3862/shard-apl6/igt@gem_ctx_persistence@vcs0-mixed-process.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [SKIP][60] ([fdo#110854]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7559/shard-iclb8/igt@gem_exec_balancer@smoke.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3862/shard-iclb2/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_capture@capture-bsd:
    - shard-iclb:         [SKIP][62] ([fdo#112146]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7559/shard-iclb4/igt@gem_exec_capture@capture-bsd.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3862/shard-iclb3/igt@gem_exec_capture@capture-bsd.html

  * igt@gem_exec_capture@capture-bsd2:
    - shard-iclb:         [SKIP][64] ([fdo#109276]) -> [PASS][65] +8 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7559/shard-iclb8/igt@gem_exec_capture@capture-bsd2.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3862/shard-iclb1/igt@gem_exec_capture@capture-bsd2.html

  * igt@gem_exec_gttfill@basic:
    - shard-tglb:         [INCOMPLETE][66] ([fdo#111593]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7559/shard-tglb4/igt@gem_exec_gttfill@basic.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3862/shard-tglb3/igt@gem_exec_gttfill@basic.html

  * igt@gem_exec_schedule@smoketest-bsd2:
    - shard-tglb:         [INCOMPLETE][68] ([i915#707]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7559/shard-tglb3/igt@gem_exec_schedule@smoketest-bsd2.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3862/shard-tglb2/igt@gem_exec_schedule@smoketest-bsd2.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-apl:          [FAIL][70] ([i915#644]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7559/shard-apl3/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3862/shard-apl7/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy:
    - shard-snb:          [DMESG-WARN][72] ([fdo#111870]) -> [PASS][73] +2 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7559/shard-snb6/igt@gem_userptr_blits@map-fixed-invalidate-busy.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3862/shard-snb1/igt@gem_userptr_blits@map-fixed-invalidate-busy.html

  * {igt@gen9_exec_parse@allowed-single}:
    - shard-kbl:          [DMESG-WARN][74] -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7559/shard-kbl3/igt@gen9_exec_parse@allowed-single.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3862/shard-kbl2/igt@gen9_exec_parse@allowed-single.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-tglb:         [INCOMPLETE][76] ([i915#456] / [i915#460]) -> [PASS][77] +1 similar issue
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7559/shard-tglb1/igt@i915_suspend@fence-restore-untiled.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3862/shard-tglb2/igt@i915_suspend@fence-restore-untiled.html

  * igt@i915_suspend@forcewake:
    - shard-kbl:          [DMESG-WARN][78] ([i915#180]) -> [PASS][79] +6 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7559/shard-kbl2/igt@i915_suspend@forcewake.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3862/shard-kbl6/igt@i915_suspend@forcewake.html

  * igt@kms_cursor_crc@pipe-c-cursor-128x128-onscreen:
    - shard-hsw:          [DMESG-WARN][80] ([IGT#6]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7559/shard-hsw6/igt@kms_cursor_crc@pipe-c-cursor-128x128-onscreen.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3862/shard-hsw5/igt@kms_cursor_crc@pipe-c-cursor-128x128-onscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-128x42-offscreen:
    - shard-iclb:         [DMESG-WARN][82] ([IGT#6]) -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7559/shard-iclb3/igt@kms_cursor_crc@pipe-c-cursor-128x42-offscreen.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3862/shard-iclb8/igt@kms_cursor_crc@pipe-c-cursor-128x42-offscreen.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-apl:          [FAIL][84] ([i915#79]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7559/shard-apl3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3862/shard-apl7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-glk:          [FAIL][86] ([i915#49]) -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7559/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3862/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
    - shard-tglb:         [FAIL][88] ([i915#49]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7559/shard-tglb4/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3862/shard-tglb9/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt:
    - shard-tglb:         [INCOMPLETE][90] ([i915#474] / [i915#667]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7559/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3862/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-suspend:
    - shard-tglb:         [INCOMPLETE][92] ([i915#456] / [i915#460] / [i915#474]) -> [PASS][93]
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7559/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3862/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html

  * igt@kms_plane@pixel-format-pipe-a-planes-source-clamping:
    - shard-kbl:          [INCOMPLETE][94] ([fdo#103665] / [i915#648] / [i915#667]) -> [PASS][95]
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7559/shard-kbl7/igt@kms_plane@pixel-format-pipe-a-planes-source-clamping.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3862/shard-kbl4/igt@kms_plane@pixel-format-pipe-a-planes-source-clamping.html

  * igt@kms_plane@pixel-format-pipe-b-planes-source-clamping:
    - shard-kbl:          [INCOMPLETE][96] ([fdo#103665] / [i915#435] / [i915#648] / [i915#667]) -> [PASS][97]
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7559/shard-kbl3/igt@kms_plane@pixel-format-pipe-b-planes-source-clamping.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3862/shard-kbl1/igt@kms_plane@pixel-format-pipe-b-planes-source-clamping.html

  * igt@perf@oa-exponents:
    - shard-glk:          [FAIL][98] ([i915#84]) -> [PASS][99]
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7559/shard-glk8/igt@perf@oa-exponents.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3862/shard-glk1/igt@perf@oa-exponents.html

  * igt@perf_pmu@idle-vcs1:
    - shard-iclb:         [SKIP][100] ([fdo#112080]) -> [PASS][101] +3 similar issues
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7559/shard-iclb8/igt@perf_pmu@idle-vcs1.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3862/shard-iclb1/igt@perf_pmu@idle-vcs1.html

  
#### Warnings ####

  * igt@gem_eio@kms:
    - shard-snb:          [DMESG-WARN][102] ([i915#444]) -> [INCOMPLETE][103] ([i915#82])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7559/shard-snb1/igt@gem_eio@kms.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3862/shard-snb6/igt@gem_eio@kms.html

  * igt@kms_atomic_transition@6x-modeset-transitions-nonblocking-fencing:
    - shard-tglb:         [SKIP][104] ([fdo#112016] / [fdo#112021]) -> [SKIP][105] ([fdo#112021])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7559/shard-tglb7/igt@kms_atomic_transition@6x-modeset-transitions-nonblocking-fencing.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3862/shard-tglb9/igt@kms_atomic_transition@6x-modeset-transitions-nonblocking-fencing.html

  * igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary:
    - shard-tglb:         [DMESG-WARN][106] ([i915#402]) -> [DMESG-FAIL][107] ([i915#402])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7559/shard-tglb4/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3862/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
    - shard-iclb:         [DMESG-WARN][108] ([fdo#107724]) -> [DMESG-FAIL][109] ([fdo#107724])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7559/shard-iclb2/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3862/shard-iclb4/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html

  * igt@runner@aborted:
    - shard-snb:          ([FAIL][110], [FAIL][111]) ([fdo#111249] / [i915#436] / [k.org#204565]) -> [FAIL][112] ([fdo#111249] / [k.org#204565])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7559/shard-snb1/igt@runner@aborted.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7559/shard-snb6/igt@runner@aborted.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3862/shard-snb5/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#6]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/6
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#107724]: https://bugs.freedesktop.org/show_bug.cgi?id=107724
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111249]: https://bugs.freedesktop.org/show_bug.cgi?id=111249
  [fdo#111593]: https://bugs.freedesktop.org/show_bug.cgi?id=111593
  [fdo#111764]: https://bugs.freedesktop.org/show_bug.cgi?id=111764
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112016]: https://bugs.freedesktop.org/show_bug.cgi?id=112016
  [fdo#112021]: https://bugs.freedesktop.org/show_bug.cgi?id=112021
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#435]: https://gitlab.freedesktop.org/drm/intel/issues/435
  [i915#436]: https://gitlab.freedesktop.org/drm/intel/issues/436
  [i915#444]: https://gitlab.freedesktop.org/drm/intel/issues/444
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#460]: https://gitlab.freedesktop.org/drm/intel/issues/460
  [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
  [i915#474]: https://gitlab.freedesktop.org/drm/intel/issues/474
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#600]: https://gitlab.freedesktop.org/drm/intel/issues/600
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#648]: https://gitlab.freedesktop.org/drm/intel/issues/648
  [i915#667]: https://gitlab.freedesktop.org/drm/intel/issues/667
  [i915#679]: https://gitlab.freedesktop.org/drm/intel/issues/679
  [i915#707]: https://gitlab.freedesktop.org/drm/intel/issues/707
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#84]: https://gitlab.freedesktop.org/drm/intel/issues/84
  [k.org#204565]: https://bugzilla.kernel.org/show_bug.cgi?id=204565


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5349 -> IGTPW_3862
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7559: 20e59a24767007b53544c05d51ebeb874dbf194d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3862: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3862/index.html
  IGT_5349: 048f58513d8b8ec6bb307a939f0ac959bc0f0e10 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3862/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
