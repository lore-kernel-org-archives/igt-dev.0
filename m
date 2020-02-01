Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sat, 01 Feb 2020 02:26:34 -0000
Message-ID: <158052399441.32692.5400844542953450570@emeril.freedesktop.org>
References: <20200129152427.8833-1-krishnaiah.bommu@intel.com>
In-Reply-To: <20200129152427.8833-1-krishnaiah.bommu@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fctx=5Fpersistence=3A_Set_context_with_supported_engi?=
 =?utf-8?q?nes_=28rev6=29?=
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
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/i915/gem_ctx_persistence: Set context with supported engines (rev6)
URL   : https://patchwork.freedesktop.org/series/71810/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7838_full -> IGTPW_4030_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4030_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4030_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4030/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4030_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_ctx_persistence@bcs0-mixed-process:
    - shard-apl:          [PASS][1] -> [FAIL][2] +3 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-apl8/igt@gem_ctx_persistence@bcs0-mixed-process.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4030/shard-apl1/igt@gem_ctx_persistence@bcs0-mixed-process.html
    - shard-iclb:         [PASS][3] -> [FAIL][4] +3 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-iclb8/igt@gem_ctx_persistence@bcs0-mixed-process.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4030/shard-iclb4/igt@gem_ctx_persistence@bcs0-mixed-process.html
    - shard-kbl:          [PASS][5] -> [FAIL][6] +4 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-kbl6/igt@gem_ctx_persistence@bcs0-mixed-process.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4030/shard-kbl7/igt@gem_ctx_persistence@bcs0-mixed-process.html

  * igt@gem_ctx_persistence@rcs0-mixed-process:
    - shard-glk:          [PASS][7] -> [FAIL][8] +2 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-glk6/igt@gem_ctx_persistence@rcs0-mixed-process.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4030/shard-glk2/igt@gem_ctx_persistence@rcs0-mixed-process.html

  * igt@gem_ctx_persistence@vcs0-mixed-process:
    - shard-tglb:         [PASS][9] -> [FAIL][10] +4 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-tglb6/igt@gem_ctx_persistence@vcs0-mixed-process.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4030/shard-tglb2/igt@gem_ctx_persistence@vcs0-mixed-process.html
    - shard-glk:          NOTRUN -> [FAIL][11]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4030/shard-glk3/igt@gem_ctx_persistence@vcs0-mixed-process.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-apl:          [PASS][12] -> [TIMEOUT][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-apl2/igt@gen9_exec_parse@allowed-single.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4030/shard-apl2/igt@gen9_exec_parse@allowed-single.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@gem_ctx_persistence@vcs1-hang}:
    - shard-iclb:         [SKIP][14] ([fdo#109276]) -> [SKIP][15] +1 similar issue
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-iclb6/igt@gem_ctx_persistence@vcs1-hang.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4030/shard-iclb7/igt@gem_ctx_persistence@vcs1-hang.html

  
Known issues
------------

  Here are the changes found in IGTPW_4030_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@vcs1-queued:
    - shard-iclb:         [PASS][16] -> [SKIP][17] ([fdo#112080]) +16 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-iclb4/igt@gem_ctx_persistence@vcs1-queued.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4030/shard-iclb8/igt@gem_ctx_persistence@vcs1-queued.html

  * igt@gem_eio@in-flight-contexts-10ms:
    - shard-hsw:          [PASS][18] -> [TIMEOUT][19] ([fdo#112271] / [i915#1084] / [i915#775])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-hsw8/igt@gem_eio@in-flight-contexts-10ms.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4030/shard-hsw2/igt@gem_eio@in-flight-contexts-10ms.html

  * igt@gem_exec_schedule@fifo-bsd1:
    - shard-iclb:         [PASS][20] -> [SKIP][21] ([fdo#109276]) +16 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-iclb4/igt@gem_exec_schedule@fifo-bsd1.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4030/shard-iclb5/igt@gem_exec_schedule@fifo-bsd1.html

  * igt@gem_exec_schedule@preempt-queue-bsd:
    - shard-iclb:         [PASS][22] -> [SKIP][23] ([fdo#112146]) +1 similar issue
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-iclb5/igt@gem_exec_schedule@preempt-queue-bsd.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4030/shard-iclb2/igt@gem_exec_schedule@preempt-queue-bsd.html

  * igt@i915_pm_rps@waitboost:
    - shard-iclb:         [PASS][24] -> [FAIL][25] ([i915#413])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-iclb2/igt@i915_pm_rps@waitboost.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4030/shard-iclb2/igt@i915_pm_rps@waitboost.html

  * igt@i915_selftest@live_execlists:
    - shard-iclb:         [PASS][26] -> [INCOMPLETE][27] ([i915#140])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-iclb3/igt@i915_selftest@live_execlists.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4030/shard-iclb3/igt@i915_selftest@live_execlists.html

  * igt@i915_suspend@forcewake:
    - shard-kbl:          [PASS][28] -> [INCOMPLETE][29] ([fdo#103665] / [fdo#112219])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-kbl3/igt@i915_suspend@forcewake.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4030/shard-kbl4/igt@i915_suspend@forcewake.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-kbl:          [PASS][30] -> [INCOMPLETE][31] ([CI#80] / [fdo#103665] / [i915#600])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-kbl7/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4030/shard-kbl1/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move:
    - shard-glk:          [PASS][32] -> [FAIL][33] ([i915#49])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-glk5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4030/shard-glk4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b:
    - shard-apl:          [PASS][34] -> [DMESG-WARN][35] ([i915#180]) +1 similar issue
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-apl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4030/shard-apl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][36] -> [SKIP][37] ([fdo#109441]) +2 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4030/shard-iclb1/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [PASS][38] -> [DMESG-WARN][39] ([i915#180]) +3 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-kbl2/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4030/shard-kbl7/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@prime_mmap_coherency@ioctl-errors:
    - shard-hsw:          [PASS][40] -> [FAIL][41] ([i915#831])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-hsw2/igt@prime_mmap_coherency@ioctl-errors.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4030/shard-hsw8/igt@prime_mmap_coherency@ioctl-errors.html

  
#### Possible fixes ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [SKIP][42] ([fdo#112080]) -> [PASS][43] +7 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-iclb7/igt@gem_busy@busy-vcs1.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4030/shard-iclb1/igt@gem_busy@busy-vcs1.html

  * igt@gem_ctx_persistence@vcs1-cleanup:
    - shard-iclb:         [SKIP][44] ([fdo#109276] / [fdo#112080]) -> [PASS][45]
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-iclb7/igt@gem_ctx_persistence@vcs1-cleanup.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4030/shard-iclb2/igt@gem_ctx_persistence@vcs1-cleanup.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [SKIP][46] ([fdo#110841]) -> [PASS][47]
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-iclb2/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4030/shard-iclb5/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_balancer@hang:
    - shard-iclb:         [TIMEOUT][48] ([fdo#112271]) -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-iclb2/igt@gem_exec_balancer@hang.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4030/shard-iclb8/igt@gem_exec_balancer@hang.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [SKIP][50] ([fdo#112146]) -> [PASS][51] +7 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-iclb2/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4030/shard-iclb6/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd1:
    - shard-iclb:         [SKIP][52] ([fdo#109276]) -> [PASS][53] +16 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-iclb8/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4030/shard-iclb4/igt@gem_exec_schedule@preempt-queue-bsd1.html

  * igt@gem_partial_pwrite_pread@writes-after-reads:
    - shard-hsw:          [FAIL][54] ([i915#694]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-hsw5/igt@gem_partial_pwrite_pread@writes-after-reads.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4030/shard-hsw1/igt@gem_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-kbl:          [FAIL][56] ([i915#644]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-kbl3/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4030/shard-kbl2/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@i915_pm_rps@reset:
    - shard-tglb:         [FAIL][58] ([i915#413]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-tglb8/igt@i915_pm_rps@reset.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4030/shard-tglb1/igt@i915_pm_rps@reset.html
    - shard-iclb:         [FAIL][60] ([i915#413]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-iclb1/igt@i915_pm_rps@reset.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4030/shard-iclb8/igt@i915_pm_rps@reset.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-apl:          [DMESG-WARN][62] ([i915#180]) -> [PASS][63] +1 similar issue
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-apl6/igt@i915_suspend@fence-restore-tiled2untiled.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4030/shard-apl7/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-hsw:          [DMESG-WARN][64] ([i915#44]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-hsw5/igt@kms_atomic_transition@plane-all-modeset-transition.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4030/shard-hsw2/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][66] ([i915#180]) -> [PASS][67] +3 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4030/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-iclb:         [TIMEOUT][68] -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-iclb8/igt@kms_fbcon_fbt@psr-suspend.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4030/shard-iclb7/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [SKIP][70] ([fdo#109642] / [fdo#111068]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-iclb1/igt@kms_psr2_su@frontbuffer.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4030/shard-iclb2/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [SKIP][72] ([fdo#109441]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-iclb7/igt@kms_psr@psr2_primary_mmap_cpu.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4030/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [TIMEOUT][74] ([fdo#112271] / [i915#1085] / [i915#472]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-tglb5/igt@perf@gen12-mi-rpc.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4030/shard-tglb7/igt@perf@gen12-mi-rpc.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [FAIL][76] ([IGT#28]) -> [SKIP][77] ([fdo#112080]) +1 similar issue
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-iclb2/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4030/shard-iclb7/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@gem_ctx_persistence@vcs1-mixed-process:
    - shard-iclb:         [SKIP][78] ([fdo#109276] / [fdo#112080]) -> [SKIP][79] ([fdo#112080]) +10 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-iclb3/igt@gem_ctx_persistence@vcs1-mixed-process.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4030/shard-iclb8/igt@gem_ctx_persistence@vcs1-mixed-process.html

  * igt@gem_eio@in-flight-1us:
    - shard-apl:          [TIMEOUT][80] ([fdo#112271]) -> [INCOMPLETE][81] ([CI#80] / [fdo#103927])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-apl6/igt@gem_eio@in-flight-1us.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4030/shard-apl1/igt@gem_eio@in-flight-1us.html

  * igt@gem_tiled_blits@interruptible:
    - shard-hsw:          [FAIL][82] ([i915#694]) -> [FAIL][83] ([i915#818])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-hsw1/igt@gem_tiled_blits@interruptible.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4030/shard-hsw1/igt@gem_tiled_blits@interruptible.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [FAIL][84] ([i915#454]) -> [SKIP][85] ([i915#468])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-tglb5/igt@i915_pm_dc@dc6-psr.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4030/shard-tglb2/igt@i915_pm_dc@dc6-psr.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112219]: https://bugs.freedesktop.org/show_bug.cgi?id=112219
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1084]: https://gitlab.freedesktop.org/drm/intel/issues/1084
  [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#44]: https://gitlab.freedesktop.org/drm/intel/issues/44
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#600]: https://gitlab.freedesktop.org/drm/intel/issues/600
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#775]: https://gitlab.freedesktop.org/drm/intel/issues/775
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#831]: https://gitlab.freedesktop.org/drm/intel/issues/831


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5404 -> IGTPW_4030
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7838: d3d96beea538c8de906a1c4d7e6793a47d17a471 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4030: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4030/index.html
  IGT_5404: 4147bab8e3dcaf11bd657b5fb4c109708e94e60c @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4030/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
