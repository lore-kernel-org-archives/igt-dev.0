Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 27 Dec 2019 17:46:56 -0000
Message-ID: <157746881669.27190.16633043393841516932@emeril.freedesktop.org>
References: <20191220154030.25684-1-krishnaiah.bommu@intel.com>
In-Reply-To: <20191220154030.25684-1-krishnaiah.bommu@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fctx=5Fpersistence=3A_pre-emption?=
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
To: "Bommu, Krishnaiah" <krishnaiah.bommu@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/i915/gem_ctx_persistence: pre-emption
URL   : https://patchwork.freedesktop.org/series/71411/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7641_full -> IGTPW_3887_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_3887_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_3887_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3887/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_3887_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_mmap_gtt@cpuset-big-copy-odd:
    - shard-snb:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7641/shard-snb1/igt@gem_mmap_gtt@cpuset-big-copy-odd.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3887/shard-snb4/igt@gem_mmap_gtt@cpuset-big-copy-odd.html

  
Known issues
------------

  Here are the changes found in IGTPW_3887_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@vcs1-none:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#109276] / [fdo#112080]) +3 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7641/shard-iclb2/igt@gem_ctx_isolation@vcs1-none.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3887/shard-iclb6/igt@gem_ctx_isolation@vcs1-none.html

  * igt@gem_ctx_persistence@bcs0-mixed-process:
    - shard-iclb:         [PASS][5] -> [FAIL][6] ([i915#679])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7641/shard-iclb7/igt@gem_ctx_persistence@bcs0-mixed-process.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3887/shard-iclb1/igt@gem_ctx_persistence@bcs0-mixed-process.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#110841])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7641/shard-iclb6/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3887/shard-iclb1/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_basic@basic-vcs1:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#112080]) +9 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7641/shard-iclb2/igt@gem_exec_basic@basic-vcs1.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3887/shard-iclb6/igt@gem_exec_basic@basic-vcs1.html

  * igt@gem_exec_schedule@independent-bsd2:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([fdo#109276]) +18 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7641/shard-iclb4/igt@gem_exec_schedule@independent-bsd2.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3887/shard-iclb8/igt@gem_exec_schedule@independent-bsd2.html

  * igt@gem_exec_schedule@preempt-queue-bsd:
    - shard-iclb:         [PASS][13] -> [SKIP][14] ([fdo#112146]) +3 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7641/shard-iclb6/igt@gem_exec_schedule@preempt-queue-bsd.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3887/shard-iclb1/igt@gem_exec_schedule@preempt-queue-bsd.html

  * igt@gem_softpin@noreloc-s3:
    - shard-apl:          [PASS][15] -> [DMESG-WARN][16] ([i915#180])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7641/shard-apl3/igt@gem_softpin@noreloc-s3.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3887/shard-apl3/igt@gem_softpin@noreloc-s3.html

  * igt@kms_color@pipe-c-legacy-gamma:
    - shard-kbl:          [PASS][17] -> [FAIL][18] ([i915#71])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7641/shard-kbl1/igt@kms_color@pipe-c-legacy-gamma.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3887/shard-kbl6/igt@kms_color@pipe-c-legacy-gamma.html
    - shard-apl:          [PASS][19] -> [FAIL][20] ([i915#71])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7641/shard-apl1/igt@kms_color@pipe-c-legacy-gamma.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3887/shard-apl4/igt@kms_color@pipe-c-legacy-gamma.html
    - shard-glk:          [PASS][21] -> [FAIL][22] ([i915#71])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7641/shard-glk4/igt@kms_color@pipe-c-legacy-gamma.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3887/shard-glk2/igt@kms_color@pipe-c-legacy-gamma.html

  * igt@kms_cursor_crc@pipe-c-cursor-64x64-random:
    - shard-apl:          [PASS][23] -> [DMESG-WARN][24] ([IGT#6])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7641/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-64x64-random.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3887/shard-apl8/igt@kms_cursor_crc@pipe-c-cursor-64x64-random.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-kbl:          [PASS][25] -> [DMESG-WARN][26] ([i915#180]) +4 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7641/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3887/shard-kbl6/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][27] -> [SKIP][28] ([fdo#109441]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7641/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3887/shard-iclb4/igt@kms_psr@psr2_sprite_plane_move.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@vcs1-dirty-create:
    - shard-iclb:         [SKIP][29] ([fdo#109276] / [fdo#112080]) -> [PASS][30] +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7641/shard-iclb7/igt@gem_ctx_isolation@vcs1-dirty-create.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3887/shard-iclb4/igt@gem_ctx_isolation@vcs1-dirty-create.html

  * igt@gem_eio@in-flight-contexts-1us:
    - shard-snb:          [FAIL][31] ([i915#490]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7641/shard-snb1/igt@gem_eio@in-flight-contexts-1us.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3887/shard-snb7/igt@gem_eio@in-flight-contexts-1us.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [SKIP][33] ([fdo#110854]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7641/shard-iclb8/igt@gem_exec_balancer@smoke.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3887/shard-iclb2/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [SKIP][35] ([fdo#112146]) -> [PASS][36] +8 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7641/shard-iclb2/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3887/shard-iclb7/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing:
    - shard-kbl:          [TIMEOUT][37] ([i915#530]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7641/shard-kbl7/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3887/shard-kbl7/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html

  * igt@gem_persistent_relocs@forked-interruptible-thrash-inactive:
    - shard-hsw:          [FAIL][39] ([i915#520]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7641/shard-hsw5/igt@gem_persistent_relocs@forked-interruptible-thrash-inactive.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3887/shard-hsw7/igt@gem_persistent_relocs@forked-interruptible-thrash-inactive.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [FAIL][41] ([i915#644]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7641/shard-glk3/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3887/shard-glk6/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
    - shard-snb:          [DMESG-WARN][43] ([fdo#111870]) -> [PASS][44] +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7641/shard-snb2/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3887/shard-snb4/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html

  * {igt@gen9_exec_parse@allowed-all}:
    - shard-kbl:          [DMESG-WARN][45] ([i915#716]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7641/shard-kbl4/igt@gen9_exec_parse@allowed-all.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3887/shard-kbl2/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][47] ([i915#454]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7641/shard-iclb6/igt@i915_pm_dc@dc6-psr.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3887/shard-iclb7/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen:
    - shard-kbl:          [FAIL][49] ([i915#54]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7641/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3887/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen.html
    - shard-apl:          [FAIL][51] ([i915#54]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7641/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3887/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][53] ([i915#180]) -> [PASS][54] +3 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7641/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3887/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:
    - shard-glk:          [FAIL][55] ([i915#49]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7641/shard-glk3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3887/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [SKIP][57] ([fdo#109441]) -> [PASS][58] +2 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7641/shard-iclb8/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3887/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-apl:          [DMESG-WARN][59] ([i915#180]) -> [PASS][60] +3 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7641/shard-apl6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3887/shard-apl8/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@perf_pmu@busy-check-all-vcs1:
    - shard-iclb:         [SKIP][61] ([fdo#112080]) -> [PASS][62] +8 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7641/shard-iclb7/igt@perf_pmu@busy-check-all-vcs1.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3887/shard-iclb2/igt@perf_pmu@busy-check-all-vcs1.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [SKIP][63] ([fdo#109276]) -> [PASS][64] +17 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7641/shard-iclb5/igt@prime_vgem@fence-wait-bsd2.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3887/shard-iclb4/igt@prime_vgem@fence-wait-bsd2.html

  
#### Warnings ####

  * igt@gem_eio@kms:
    - shard-snb:          [INCOMPLETE][65] ([i915#82]) -> [DMESG-WARN][66] ([i915#443] / [i915#444])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7641/shard-snb6/igt@gem_eio@kms.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3887/shard-snb7/igt@gem_eio@kms.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#6]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/6
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#443]: https://gitlab.freedesktop.org/drm/intel/issues/443
  [i915#444]: https://gitlab.freedesktop.org/drm/intel/issues/444
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#490]: https://gitlab.freedesktop.org/drm/intel/issues/490
  [i915#520]: https://gitlab.freedesktop.org/drm/intel/issues/520
  [i915#530]: https://gitlab.freedesktop.org/drm/intel/issues/530
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#679]: https://gitlab.freedesktop.org/drm/intel/issues/679
  [i915#71]: https://gitlab.freedesktop.org/drm/intel/issues/71
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-hsw-4770r 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5352 -> IGTPW_3887
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7641: c040b352eb9c72e9a6a8dc830245b2ae8089a54e @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3887: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3887/index.html
  IGT_5352: 0586d205f651674e575351c2d5a7d0760716c9f1 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3887/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
