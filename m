Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sat, 01 Feb 2020 08:25:40 -0000
Message-ID: <158054554069.32691.13237724161351973366@emeril.freedesktop.org>
References: <20200129221409.30388-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20200129221409.30388-1-vinay.belgaumkar@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Flargeobject=3A_Remove_test?=
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
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/i915/gem_largeobject: Remove test
URL   : https://patchwork.freedesktop.org/series/72744/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5405_full -> IGTPW_4035_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4035_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4035_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4035/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4035_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_flush@basic-uc-prw-default:
    - shard-snb:          NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4035/shard-snb1/igt@gem_exec_flush@basic-uc-prw-default.html

  * igt@kms_dp_aux_dev:
    - shard-iclb:         [PASS][2] -> [TIMEOUT][3] +2 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/shard-iclb3/igt@kms_dp_aux_dev.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4035/shard-iclb7/igt@kms_dp_aux_dev.html

  
#### Warnings ####

  * igt@gem_exec_balancer@hang:
    - shard-kbl:          [TIMEOUT][4] ([fdo#112271]) -> [FAIL][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/shard-kbl4/igt@gem_exec_balancer@hang.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4035/shard-kbl4/igt@gem_exec_balancer@hang.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@gem_ctx_persistence@vcs1-hang}:
    - shard-iclb:         [PASS][6] -> [SKIP][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/shard-iclb1/igt@gem_ctx_persistence@vcs1-hang.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4035/shard-iclb5/igt@gem_ctx_persistence@vcs1-hang.html

  
Known issues
------------

  Here are the changes found in IGTPW_4035_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-kbl:          [PASS][8] -> [DMESG-WARN][9] ([i915#56])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/shard-kbl7/igt@gem_ctx_isolation@rcs0-s3.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4035/shard-kbl1/igt@gem_ctx_isolation@rcs0-s3.html
    - shard-apl:          [PASS][10] -> [DMESG-WARN][11] ([i915#180]) +3 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/shard-apl2/igt@gem_ctx_isolation@rcs0-s3.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4035/shard-apl1/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [PASS][12] -> [SKIP][13] ([fdo#110841])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/shard-iclb6/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4035/shard-iclb4/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd1:
    - shard-iclb:         [PASS][14] -> [SKIP][15] ([fdo#109276]) +19 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/shard-iclb4/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4035/shard-iclb5/igt@gem_exec_schedule@preempt-queue-bsd1.html

  * igt@gem_exec_schedule@wide-bsd:
    - shard-iclb:         [PASS][16] -> [SKIP][17] ([fdo#112146]) +1 similar issue
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/shard-iclb7/igt@gem_exec_schedule@wide-bsd.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4035/shard-iclb2/igt@gem_exec_schedule@wide-bsd.html

  * igt@gem_exec_store@cachelines-vcs1:
    - shard-iclb:         [PASS][18] -> [SKIP][19] ([fdo#112080]) +11 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/shard-iclb2/igt@gem_exec_store@cachelines-vcs1.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4035/shard-iclb5/igt@gem_exec_store@cachelines-vcs1.html

  * igt@gem_partial_pwrite_pread@write-display:
    - shard-hsw:          [PASS][20] -> [FAIL][21] ([i915#694])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/shard-hsw8/igt@gem_partial_pwrite_pread@write-display.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4035/shard-hsw2/igt@gem_partial_pwrite_pread@write-display.html

  * igt@gem_tiled_blits@normal:
    - shard-hsw:          [PASS][22] -> [FAIL][23] ([i915#818])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/shard-hsw4/igt@gem_tiled_blits@normal.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4035/shard-hsw1/igt@gem_tiled_blits@normal.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-kbl:          [PASS][24] -> [INCOMPLETE][25] ([fdo#103665])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/shard-kbl1/igt@gem_workarounds@suspend-resume-context.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4035/shard-kbl3/igt@gem_workarounds@suspend-resume-context.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-glk:          [PASS][26] -> [INCOMPLETE][27] ([i915#58] / [k.org#198133])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/shard-glk3/igt@gem_workarounds@suspend-resume-fd.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4035/shard-glk1/igt@gem_workarounds@suspend-resume-fd.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [PASS][28] -> [FAIL][29] ([i915#454])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/shard-iclb5/igt@i915_pm_dc@dc6-dpms.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4035/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-kbl:          [PASS][30] -> [FAIL][31] ([i915#49])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4035/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
    - shard-glk:          [PASS][32] -> [FAIL][33] ([i915#49])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/shard-glk4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4035/shard-glk6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
    - shard-apl:          [PASS][34] -> [FAIL][35] ([i915#49])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/shard-apl8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4035/shard-apl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [PASS][36] -> [SKIP][37] ([fdo#109441]) +2 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4035/shard-iclb5/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [PASS][38] -> [DMESG-WARN][39] ([i915#180]) +8 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/shard-kbl3/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4035/shard-kbl6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  
#### Possible fixes ####

  * igt@gem_busy@close-race:
    - shard-hsw:          [TIMEOUT][40] ([fdo#112271] / [i915#1084]) -> [PASS][41]
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/shard-hsw1/igt@gem_busy@close-race.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4035/shard-hsw1/igt@gem_busy@close-race.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [SKIP][42] ([fdo#112146]) -> [PASS][43] +10 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/shard-iclb1/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4035/shard-iclb8/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [FAIL][44] ([i915#644]) -> [PASS][45]
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/shard-glk7/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4035/shard-glk6/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_tiled_blits@interruptible:
    - shard-hsw:          [FAIL][46] ([i915#818]) -> [PASS][47]
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/shard-hsw8/igt@gem_tiled_blits@interruptible.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4035/shard-hsw6/igt@gem_tiled_blits@interruptible.html

  * igt@kms_atomic_transition@1x-modeset-transitions:
    - shard-hsw:          [DMESG-WARN][48] ([i915#44]) -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/shard-hsw5/igt@kms_atomic_transition@1x-modeset-transitions.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4035/shard-hsw6/igt@kms_atomic_transition@1x-modeset-transitions.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
    - shard-tglb:         [SKIP][50] ([i915#668]) -> [PASS][51] +2 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4035/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [DMESG-WARN][52] ([i915#180]) -> [PASS][53] +1 similar issue
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4035/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-apl:          [DMESG-WARN][54] ([i915#180]) -> [PASS][55] +2 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/shard-apl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4035/shard-apl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [SKIP][56] ([fdo#109441]) -> [PASS][57] +1 similar issue
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/shard-iclb5/igt@kms_psr@psr2_no_drrs.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4035/shard-iclb2/igt@kms_psr@psr2_no_drrs.html

  * igt@perf_pmu@init-busy-vcs1:
    - shard-iclb:         [SKIP][58] ([fdo#112080]) -> [PASS][59] +12 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/shard-iclb7/igt@perf_pmu@init-busy-vcs1.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4035/shard-iclb2/igt@perf_pmu@init-busy-vcs1.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [SKIP][60] ([fdo#109276]) -> [PASS][61] +14 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/shard-iclb7/igt@prime_vgem@fence-wait-bsd2.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4035/shard-iclb1/igt@prime_vgem@fence-wait-bsd2.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [SKIP][62] ([fdo#112080]) -> [FAIL][63] ([IGT#28])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/shard-iclb5/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4035/shard-iclb4/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@gem_eio@in-flight-contexts-immediate:
    - shard-kbl:          [INCOMPLETE][64] ([CI#80] / [fdo#103665]) -> [TIMEOUT][65] ([fdo#112271])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/shard-kbl4/igt@gem_eio@in-flight-contexts-immediate.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4035/shard-kbl4/igt@gem_eio@in-flight-contexts-immediate.html

  * igt@gem_eio@in-flight-immediate:
    - shard-apl:          [TIMEOUT][66] ([fdo#112271]) -> [INCOMPLETE][67] ([CI#80] / [fdo#103927])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/shard-apl7/igt@gem_eio@in-flight-immediate.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4035/shard-apl1/igt@gem_eio@in-flight-immediate.html

  * igt@gem_eio@reset-stress:
    - shard-glk:          [TIMEOUT][68] ([fdo#112271]) -> [INCOMPLETE][69] ([CI#80] / [i915#58] / [k.org#198133])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/shard-glk5/igt@gem_eio@reset-stress.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4035/shard-glk7/igt@gem_eio@reset-stress.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy-gup:
    - shard-snb:          [DMESG-WARN][70] ([fdo#111870] / [i915#478]) -> [DMESG-WARN][71] ([fdo#110789] / [fdo#111870] / [i915#478])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/shard-snb4/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4035/shard-snb5/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [SKIP][72] ([i915#468]) -> [FAIL][73] ([i915#454])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4035/shard-tglb5/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_selftest@live_blt:
    - shard-hsw:          [DMESG-FAIL][74] ([i915#563]) -> [DMESG-FAIL][75] ([i915#553] / [i915#725])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/shard-hsw5/igt@i915_selftest@live_blt.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4035/shard-hsw2/igt@i915_selftest@live_blt.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1084]: https://gitlab.freedesktop.org/drm/intel/issues/1084
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#44]: https://gitlab.freedesktop.org/drm/intel/issues/44
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#553]: https://gitlab.freedesktop.org/drm/intel/issues/553
  [i915#56]: https://gitlab.freedesktop.org/drm/intel/issues/56
  [i915#563]: https://gitlab.freedesktop.org/drm/intel/issues/563
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5405 -> IGTPW_4035

  CI-20190529: 20190529
  CI_DRM_7838: d3d96beea538c8de906a1c4d7e6793a47d17a471 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4035: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4035/index.html
  IGT_5405: add505d102f5d27e38cb4d926524664e161c2a1a @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4035/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
