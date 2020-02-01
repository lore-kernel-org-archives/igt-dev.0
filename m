Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sat, 01 Feb 2020 02:15:36 -0000
Message-ID: <158052333615.32694.8282967284740328675@emeril.freedesktop.org>
References: <20200129135520.20336-1-swati2.sharma@intel.com>
In-Reply-To: <20200129135520.20336-1-swati2.sharma@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgQWRkIHRl?=
 =?utf-8?q?sts_for_HDR_metadata_interfaces_and_bpc_switch_=28rev4=29?=
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
To: Swati Sharma <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Add tests for HDR metadata interfaces and bpc switch (rev4)
URL   : https://patchwork.freedesktop.org/series/71524/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7838_full -> IGTPW_4029_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4029_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4029_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4029/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4029_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_hdr@bpc-switch-dpms} (NEW):
    - shard-hsw:          NOTRUN -> [FAIL][1] +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4029/shard-hsw6/igt@kms_hdr@bpc-switch-dpms.html

  * {igt@kms_hdr@static-toggle} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][2] +3 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4029/shard-iclb8/igt@kms_hdr@static-toggle.html

  * {igt@kms_hdr@static-toggle-dpms} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][3] +3 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4029/shard-tglb3/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-iclb:         [PASS][4] -> [INCOMPLETE][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-iclb1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4029/shard-iclb3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  
New tests
---------

  New tests have been introduced between CI_DRM_7838_full and IGTPW_4029_full:

### New IGT tests (7) ###

  * igt@kms_hdr@bpc-switch:
    - Statuses : 1 fail(s) 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 3.68] s

  * igt@kms_hdr@bpc-switch-dpms:
    - Statuses : 1 fail(s) 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 4.84] s

  * igt@kms_hdr@bpc-switch-suspend:
    - Statuses : 1 fail(s) 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 6.26] s

  * igt@kms_hdr@static-swap:
    - Statuses : 7 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_hdr@static-toggle:
    - Statuses : 7 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_hdr@static-toggle-dpms:
    - Statuses : 7 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_hdr@static-toggle-suspend:
    - Statuses : 7 skip(s)
    - Exec time: [0.0, 0.00] s

  

Known issues
------------

  Here are the changes found in IGTPW_4029_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_schedule@fifo-bsd1:
    - shard-iclb:         [PASS][6] -> [SKIP][7] ([fdo#109276]) +17 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-iclb4/igt@gem_exec_schedule@fifo-bsd1.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4029/shard-iclb3/igt@gem_exec_schedule@fifo-bsd1.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [PASS][8] -> [SKIP][9] ([i915#677]) +1 similar issue
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-iclb5/igt@gem_exec_schedule@pi-common-bsd.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4029/shard-iclb4/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd:
    - shard-iclb:         [PASS][10] -> [SKIP][11] ([fdo#112146]) +1 similar issue
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-iclb5/igt@gem_exec_schedule@preempt-queue-bsd.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4029/shard-iclb4/igt@gem_exec_schedule@preempt-queue-bsd.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-apl:          [PASS][12] -> [DMESG-WARN][13] ([i915#180]) +2 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-apl7/igt@gem_workarounds@suspend-resume-context.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4029/shard-apl4/igt@gem_workarounds@suspend-resume-context.html

  * igt@i915_selftest@live_execlists:
    - shard-iclb:         [PASS][14] -> [INCOMPLETE][15] ([i915#140])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-iclb3/igt@i915_selftest@live_execlists.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4029/shard-iclb6/igt@i915_selftest@live_execlists.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render:
    - shard-kbl:          [PASS][16] -> [FAIL][17] ([i915#49])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4029/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html
    - shard-apl:          [PASS][18] -> [FAIL][19] ([i915#49])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-apl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4029/shard-apl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:
    - shard-kbl:          [PASS][20] -> [DMESG-WARN][21] ([i915#180])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4029/shard-kbl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][22] -> [SKIP][23] ([fdo#109441]) +2 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4029/shard-iclb4/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@perf_pmu@busy-vcs1:
    - shard-iclb:         [PASS][24] -> [SKIP][25] ([fdo#112080]) +9 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-iclb4/igt@perf_pmu@busy-vcs1.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4029/shard-iclb6/igt@perf_pmu@busy-vcs1.html

  * igt@prime_mmap_coherency@ioctl-errors:
    - shard-hsw:          [PASS][26] -> [FAIL][27] ([i915#831])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-hsw2/igt@prime_mmap_coherency@ioctl-errors.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4029/shard-hsw4/igt@prime_mmap_coherency@ioctl-errors.html

  * igt@prime_mmap_coherency@read:
    - shard-hsw:          [PASS][28] -> [INCOMPLETE][29] ([i915#61]) +1 similar issue
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-hsw8/igt@prime_mmap_coherency@read.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4029/shard-hsw5/igt@prime_mmap_coherency@read.html

  
#### Possible fixes ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [SKIP][30] ([fdo#112080]) -> [PASS][31] +9 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-iclb7/igt@gem_busy@busy-vcs1.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4029/shard-iclb1/igt@gem_busy@busy-vcs1.html

  * {igt@gem_ctx_persistence@vcs1-hang}:
    - shard-iclb:         [SKIP][32] ([fdo#109276]) -> [PASS][33] +21 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-iclb6/igt@gem_ctx_persistence@vcs1-hang.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4029/shard-iclb2/igt@gem_ctx_persistence@vcs1-hang.html

  * igt@gem_ctx_persistence@vcs1-hostile-preempt:
    - shard-iclb:         [SKIP][34] ([fdo#109276] / [fdo#112080]) -> [PASS][35] +2 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-iclb7/igt@gem_ctx_persistence@vcs1-hostile-preempt.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4029/shard-iclb4/igt@gem_ctx_persistence@vcs1-hostile-preempt.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [SKIP][36] ([fdo#110841]) -> [PASS][37]
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-iclb2/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4029/shard-iclb3/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_balancer@hang:
    - shard-iclb:         [TIMEOUT][38] ([fdo#112271]) -> [PASS][39]
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-iclb2/igt@gem_exec_balancer@hang.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4029/shard-iclb3/igt@gem_exec_balancer@hang.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [SKIP][40] ([fdo#112146]) -> [PASS][41] +8 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-iclb2/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4029/shard-iclb3/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_partial_pwrite_pread@writes-after-reads:
    - shard-hsw:          [FAIL][42] ([i915#694]) -> [PASS][43] +1 similar issue
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-hsw5/igt@gem_partial_pwrite_pread@writes-after-reads.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4029/shard-hsw1/igt@gem_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_persistent_relocs@forked-interruptible-thrash-inactive:
    - shard-hsw:          [FAIL][44] ([i915#520]) -> [PASS][45]
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-hsw6/igt@gem_persistent_relocs@forked-interruptible-thrash-inactive.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4029/shard-hsw1/igt@gem_persistent_relocs@forked-interruptible-thrash-inactive.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [FAIL][46] ([i915#644]) -> [PASS][47]
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-glk4/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4029/shard-glk5/igt@gem_ppgtt@flink-and-close-vma-leak.html
    - shard-kbl:          [FAIL][48] ([i915#644]) -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-kbl3/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4029/shard-kbl7/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@i915_pm_rps@reset:
    - shard-iclb:         [FAIL][50] ([i915#413]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-iclb1/igt@i915_pm_rps@reset.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4029/shard-iclb4/igt@i915_pm_rps@reset.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-apl:          [DMESG-WARN][52] ([i915#180]) -> [PASS][53] +3 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-apl6/igt@i915_suspend@fence-restore-tiled2untiled.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4029/shard-apl4/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-hsw:          [DMESG-WARN][54] ([i915#44]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-hsw5/igt@kms_atomic_transition@plane-all-modeset-transition.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4029/shard-hsw2/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][56] ([i915#180]) -> [PASS][57] +3 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4029/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-iclb:         [TIMEOUT][58] -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-iclb8/igt@kms_fbcon_fbt@psr-suspend.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4029/shard-iclb6/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [SKIP][60] ([fdo#109441]) -> [PASS][61] +2 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-iclb6/igt@kms_psr@psr2_no_drrs.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4029/shard-iclb2/igt@kms_psr@psr2_no_drrs.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [FAIL][62] ([i915#31]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-kbl4/igt@kms_setmode@basic.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4029/shard-kbl7/igt@kms_setmode@basic.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [FAIL][64] ([IGT#28]) -> [SKIP][65] ([fdo#112080]) +1 similar issue
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-iclb2/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4029/shard-iclb7/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@gem_tiled_blits@normal:
    - shard-hsw:          [FAIL][66] ([i915#818]) -> [FAIL][67] ([i915#694])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-hsw5/igt@gem_tiled_blits@normal.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4029/shard-hsw5/igt@gem_tiled_blits@normal.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy-gup:
    - shard-snb:          [DMESG-WARN][68] ([fdo#111870] / [i915#478]) -> [DMESG-WARN][69] ([fdo#110789] / [fdo#111870] / [i915#478]) +1 similar issue
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-snb4/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4029/shard-snb6/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#44]: https://gitlab.freedesktop.org/drm/intel/issues/44
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#520]: https://gitlab.freedesktop.org/drm/intel/issues/520
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#831]: https://gitlab.freedesktop.org/drm/intel/issues/831


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5404 -> IGTPW_4029
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7838: d3d96beea538c8de906a1c4d7e6793a47d17a471 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4029: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4029/index.html
  IGT_5404: 4147bab8e3dcaf11bd657b5fb4c109708e94e60c @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4029/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
