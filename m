Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sat, 01 Feb 2020 09:04:48 -0000
Message-ID: <158054788862.32694.8257182260335819939@emeril.freedesktop.org>
References: <20200129222456.1503424-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200129222456.1503424-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fexec=5Freloc=3A_Add_SIGINT_injection?=
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: i915/gem_exec_reloc: Add SIGINT injection
URL   : https://patchwork.freedesktop.org/series/72745/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5405_full -> IGTPW_4036_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4036_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4036_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4036/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4036_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_flush@basic-uc-prw-default:
    - shard-snb:          NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4036/shard-snb6/igt@gem_exec_flush@basic-uc-prw-default.html

  * igt@gem_ringfill@basic-default-hang:
    - shard-iclb:         [PASS][2] -> [INCOMPLETE][3]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/shard-iclb5/igt@gem_ringfill@basic-default-hang.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4036/shard-iclb8/igt@gem_ringfill@basic-default-hang.html

  * igt@kms_vblank@pipe-b-ts-continuation-suspend:
    - shard-iclb:         [PASS][4] -> [TIMEOUT][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/shard-iclb4/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4036/shard-iclb3/igt@kms_vblank@pipe-b-ts-continuation-suspend.html

  
Known issues
------------

  Here are the changes found in IGTPW_4036_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_caching@reads:
    - shard-hsw:          [PASS][6] -> [FAIL][7] ([i915#694])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/shard-hsw1/igt@gem_caching@reads.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4036/shard-hsw2/igt@gem_caching@reads.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [PASS][8] -> [SKIP][9] ([fdo#110854])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/shard-iclb1/igt@gem_exec_balancer@smoke.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4036/shard-iclb7/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [PASS][10] -> [SKIP][11] ([fdo#112146]) +3 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/shard-iclb7/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4036/shard-iclb4/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd1:
    - shard-iclb:         [PASS][12] -> [SKIP][13] ([fdo#109276]) +24 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/shard-iclb4/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4036/shard-iclb7/igt@gem_exec_schedule@preempt-queue-bsd1.html

  * igt@gem_tiled_blits@normal:
    - shard-hsw:          [PASS][14] -> [FAIL][15] ([i915#818])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/shard-hsw4/igt@gem_tiled_blits@normal.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4036/shard-hsw8/igt@gem_tiled_blits@normal.html

  * igt@i915_selftest@live_execlists:
    - shard-iclb:         [PASS][16] -> [INCOMPLETE][17] ([i915#140])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/shard-iclb7/igt@i915_selftest@live_execlists.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4036/shard-iclb4/igt@i915_selftest@live_execlists.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang-interruptible:
    - shard-glk:          [PASS][18] -> [INCOMPLETE][19] ([CI#80] / [i915#58] / [k.org#198133])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/shard-glk9/igt@kms_flip@2x-flip-vs-panning-vs-hang-interruptible.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4036/shard-glk7/igt@kms_flip@2x-flip-vs-panning-vs-hang-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-apl:          [PASS][20] -> [FAIL][21] ([i915#79])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/shard-apl1/igt@kms_flip@flip-vs-expired-vblank.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4036/shard-apl8/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-apl:          [PASS][22] -> [DMESG-WARN][23] ([i915#180]) +2 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/shard-apl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4036/shard-apl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-kbl:          [PASS][24] -> [DMESG-WARN][25] ([i915#180]) +4 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/shard-kbl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4036/shard-kbl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [PASS][26] -> [SKIP][27] ([fdo#109441]) +2 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4036/shard-iclb6/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][28] -> [FAIL][29] ([i915#31])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/shard-apl4/igt@kms_setmode@basic.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4036/shard-apl2/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend:
    - shard-kbl:          [PASS][30] -> [INCOMPLETE][31] ([fdo#103665])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/shard-kbl2/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4036/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html

  * igt@perf@disabled-read-error:
    - shard-iclb:         [PASS][32] -> [DMESG-WARN][33] ([i915#645])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/shard-iclb1/igt@perf@disabled-read-error.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4036/shard-iclb3/igt@perf@disabled-read-error.html

  * igt@perf_pmu@busy-no-semaphores-vcs1:
    - shard-iclb:         [PASS][34] -> [SKIP][35] ([fdo#112080]) +16 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/shard-iclb1/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4036/shard-iclb8/igt@perf_pmu@busy-no-semaphores-vcs1.html

  * igt@prime_mmap_coherency@ioctl-errors:
    - shard-hsw:          [PASS][36] -> [FAIL][37] ([i915#831])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/shard-hsw5/igt@prime_mmap_coherency@ioctl-errors.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4036/shard-hsw6/igt@prime_mmap_coherency@ioctl-errors.html

  
#### Possible fixes ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [SKIP][38] ([fdo#112080]) -> [PASS][39] +11 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/shard-iclb7/igt@gem_busy@busy-vcs1.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4036/shard-iclb2/igt@gem_busy@busy-vcs1.html

  * igt@gem_busy@close-race:
    - shard-hsw:          [TIMEOUT][40] ([fdo#112271] / [i915#1084]) -> [PASS][41]
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/shard-hsw1/igt@gem_busy@close-race.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4036/shard-hsw1/igt@gem_busy@close-race.html

  * igt@gem_exec_schedule@pi-shared-iova-bsd2:
    - shard-iclb:         [SKIP][42] ([fdo#109276]) -> [PASS][43] +11 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/shard-iclb8/igt@gem_exec_schedule@pi-shared-iova-bsd2.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4036/shard-iclb1/igt@gem_exec_schedule@pi-shared-iova-bsd2.html

  * igt@gem_exec_schedule@pi-userfault-bsd:
    - shard-iclb:         [SKIP][44] ([i915#677]) -> [PASS][45]
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/shard-iclb2/igt@gem_exec_schedule@pi-userfault-bsd.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4036/shard-iclb7/igt@gem_exec_schedule@pi-userfault-bsd.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [SKIP][46] ([fdo#112146]) -> [PASS][47] +7 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/shard-iclb1/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4036/shard-iclb3/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@i915_selftest@live_blt:
    - shard-hsw:          [DMESG-FAIL][48] ([i915#563]) -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/shard-hsw5/igt@i915_selftest@live_blt.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4036/shard-hsw6/igt@i915_selftest@live_blt.html

  * igt@kms_atomic_transition@1x-modeset-transitions:
    - shard-hsw:          [DMESG-WARN][50] ([i915#44]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/shard-hsw5/igt@kms_atomic_transition@1x-modeset-transitions.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4036/shard-hsw2/igt@kms_atomic_transition@1x-modeset-transitions.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-apl:          [DMESG-WARN][52] ([i915#180]) -> [PASS][53] +3 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/shard-apl1/igt@kms_flip@flip-vs-suspend-interruptible.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4036/shard-apl7/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
    - shard-tglb:         [SKIP][54] ([i915#668]) -> [PASS][55] +2 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4036/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [DMESG-WARN][56] ([i915#180]) -> [PASS][57] +1 similar issue
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4036/shard-kbl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][58] ([fdo#109441]) -> [PASS][59] +2 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/shard-iclb1/igt@kms_psr@psr2_sprite_plane_move.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4036/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [TIMEOUT][60] ([fdo#112271] / [i915#1085] / [i915#472]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/shard-tglb2/igt@perf@gen12-mi-rpc.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4036/shard-tglb3/igt@perf@gen12-mi-rpc.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [SKIP][62] ([fdo#112080]) -> [FAIL][63] ([IGT#28])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/shard-iclb5/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4036/shard-iclb1/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@gem_eio@in-flight-contexts-immediate:
    - shard-kbl:          [INCOMPLETE][64] ([CI#80] / [fdo#103665]) -> [TIMEOUT][65] ([fdo#112271])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/shard-kbl4/igt@gem_eio@in-flight-contexts-immediate.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4036/shard-kbl6/igt@gem_eio@in-flight-contexts-immediate.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [SKIP][66] ([i915#468]) -> [FAIL][67] ([i915#454])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4036/shard-tglb5/igt@i915_pm_dc@dc6-dpms.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [SKIP][68] ([fdo#109349]) -> [DMESG-WARN][69] ([fdo#107724])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/shard-iclb6/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4036/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#107724]: https://bugs.freedesktop.org/show_bug.cgi?id=107724
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1084]: https://gitlab.freedesktop.org/drm/intel/issues/1084
  [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#44]: https://gitlab.freedesktop.org/drm/intel/issues/44
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
  [i915#563]: https://gitlab.freedesktop.org/drm/intel/issues/563
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#645]: https://gitlab.freedesktop.org/drm/intel/issues/645
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#831]: https://gitlab.freedesktop.org/drm/intel/issues/831
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5405 -> IGTPW_4036

  CI-20190529: 20190529
  CI_DRM_7838: d3d96beea538c8de906a1c4d7e6793a47d17a471 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4036: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4036/index.html
  IGT_5405: add505d102f5d27e38cb4d926524664e161c2a1a @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4036/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
