Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sat, 01 Feb 2020 03:18:37 -0000
Message-ID: <158052711759.32694.6317228789899003455@emeril.freedesktop.org>
References: <20200129181002.9405-1-krishnaiah.bommu@intel.com>
In-Reply-To: <20200129181002.9405-1-krishnaiah.bommu@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fctx=5Fpersistence=3A_Set_context_with_supported_engi?=
 =?utf-8?q?nes_=28rev7=29?=
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

Series: tests/i915/gem_ctx_persistence: Set context with supported engines (rev7)
URL   : https://patchwork.freedesktop.org/series/71810/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7838_full -> IGTPW_4032_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4032/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4032_full:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@gem_ctx_persistence@vcs2-hang}:
    - shard-iclb:         [SKIP][1] ([fdo#109276]) -> [SKIP][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-iclb2/igt@gem_ctx_persistence@vcs2-hang.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4032/shard-iclb4/igt@gem_ctx_persistence@vcs2-hang.html

  
Known issues
------------

  Here are the changes found in IGTPW_4032_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_balancer@hang:
    - shard-tglb:         [PASS][3] -> [TIMEOUT][4] ([fdo#112271])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-tglb3/igt@gem_exec_balancer@hang.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4032/shard-tglb6/igt@gem_exec_balancer@hang.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([i915#677])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-iclb5/igt@gem_exec_schedule@pi-common-bsd.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4032/shard-iclb1/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_schedule@pi-shared-iova-bsd2:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#109276]) +14 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-iclb4/igt@gem_exec_schedule@pi-shared-iova-bsd2.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4032/shard-iclb3/igt@gem_exec_schedule@pi-shared-iova-bsd2.html

  * igt@gem_exec_schedule@preempt-queue-bsd:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#112146]) +2 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-iclb5/igt@gem_exec_schedule@preempt-queue-bsd.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4032/shard-iclb4/igt@gem_exec_schedule@preempt-queue-bsd.html

  * igt@i915_selftest@live_blt:
    - shard-hsw:          [PASS][11] -> [DMESG-FAIL][12] ([i915#725])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-hsw1/igt@i915_selftest@live_blt.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4032/shard-hsw8/igt@i915_selftest@live_blt.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic:
    - shard-hsw:          [PASS][13] -> [FAIL][14] ([i915#57])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-hsw6/igt@kms_cursor_legacy@cursor-vs-flip-atomic.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4032/shard-hsw8/igt@kms_cursor_legacy@cursor-vs-flip-atomic.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-hsw:          [PASS][15] -> [INCOMPLETE][16] ([i915#61])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-hsw2/igt@kms_flip@flip-vs-suspend.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4032/shard-hsw8/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-pwrite:
    - shard-tglb:         [PASS][17] -> [SKIP][18] ([i915#668])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-tglb8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-pwrite.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4032/shard-tglb3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-apl:          [PASS][19] -> [DMESG-WARN][20] ([i915#180]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-apl8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4032/shard-apl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_plane@plane-position-covered-pipe-b-planes:
    - shard-kbl:          [PASS][21] -> [FAIL][22] ([i915#247])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-kbl1/igt@kms_plane@plane-position-covered-pipe-b-planes.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4032/shard-kbl1/igt@kms_plane@plane-position-covered-pipe-b-planes.html
    - shard-apl:          [PASS][23] -> [FAIL][24] ([i915#247])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-apl2/igt@kms_plane@plane-position-covered-pipe-b-planes.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4032/shard-apl1/igt@kms_plane@plane-position-covered-pipe-b-planes.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [PASS][25] -> [FAIL][26] ([i915#173])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-iclb4/igt@kms_psr@no_drrs.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4032/shard-iclb1/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][27] -> [SKIP][28] ([fdo#109441]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4032/shard-iclb6/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][29] -> [FAIL][30] ([i915#31])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-apl1/igt@kms_setmode@basic.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4032/shard-apl1/igt@kms_setmode@basic.html

  * igt@perf_pmu@busy-accuracy-2-vcs1:
    - shard-iclb:         [PASS][31] -> [SKIP][32] ([fdo#112080]) +11 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-iclb2/igt@perf_pmu@busy-accuracy-2-vcs1.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4032/shard-iclb8/igt@perf_pmu@busy-accuracy-2-vcs1.html

  * igt@prime_mmap_coherency@ioctl-errors:
    - shard-hsw:          [PASS][33] -> [FAIL][34] ([i915#831])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-hsw2/igt@prime_mmap_coherency@ioctl-errors.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4032/shard-hsw6/igt@prime_mmap_coherency@ioctl-errors.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@vcs1-mixed-process:
    - shard-iclb:         [SKIP][35] ([fdo#109276] / [fdo#112080]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-iclb3/igt@gem_ctx_persistence@vcs1-mixed-process.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4032/shard-iclb2/igt@gem_ctx_persistence@vcs1-mixed-process.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [SKIP][37] ([fdo#110841]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-iclb2/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4032/shard-iclb7/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_balancer@hang:
    - shard-iclb:         [TIMEOUT][39] ([fdo#112271]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-iclb2/igt@gem_exec_balancer@hang.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4032/shard-iclb5/igt@gem_exec_balancer@hang.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [SKIP][41] ([fdo#112146]) -> [PASS][42] +9 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-iclb2/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4032/shard-iclb6/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_partial_pwrite_pread@writes-after-reads:
    - shard-hsw:          [FAIL][43] ([i915#694]) -> [PASS][44] +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-hsw5/igt@gem_partial_pwrite_pread@writes-after-reads.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4032/shard-hsw2/igt@gem_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_persistent_relocs@forked-interruptible-thrash-inactive:
    - shard-hsw:          [FAIL][45] ([i915#520]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-hsw6/igt@gem_persistent_relocs@forked-interruptible-thrash-inactive.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4032/shard-hsw2/igt@gem_persistent_relocs@forked-interruptible-thrash-inactive.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [FAIL][47] ([i915#644]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-glk4/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4032/shard-glk1/igt@gem_ppgtt@flink-and-close-vma-leak.html
    - shard-kbl:          [FAIL][49] ([i915#644]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-kbl3/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4032/shard-kbl7/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_tiled_blits@normal:
    - shard-hsw:          [FAIL][51] ([i915#818]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-hsw5/igt@gem_tiled_blits@normal.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4032/shard-hsw4/igt@gem_tiled_blits@normal.html

  * igt@i915_hangman@error-state-capture-vcs1:
    - shard-iclb:         [SKIP][53] ([fdo#112080]) -> [PASS][54] +8 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-iclb8/igt@i915_hangman@error-state-capture-vcs1.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4032/shard-iclb4/igt@i915_hangman@error-state-capture-vcs1.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-apl:          [DMESG-WARN][55] ([i915#180]) -> [PASS][56] +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-apl6/igt@i915_suspend@fence-restore-tiled2untiled.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4032/shard-apl2/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-hsw:          [DMESG-WARN][57] ([i915#44]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-hsw5/igt@kms_atomic_transition@plane-all-modeset-transition.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4032/shard-hsw2/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][59] ([i915#180]) -> [PASS][60] +3 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4032/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-iclb:         [TIMEOUT][61] -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-iclb8/igt@kms_fbcon_fbt@psr-suspend.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4032/shard-iclb7/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [SKIP][63] ([fdo#109642] / [fdo#111068]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-iclb6/igt@kms_psr2_su@page_flip.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4032/shard-iclb2/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_primary_blt:
    - shard-iclb:         [SKIP][65] ([fdo#109441]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-iclb5/igt@kms_psr@psr2_primary_blt.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4032/shard-iclb2/igt@kms_psr@psr2_primary_blt.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [SKIP][67] ([fdo#109276]) -> [PASS][68] +10 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-iclb7/igt@prime_vgem@fence-wait-bsd2.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4032/shard-iclb1/igt@prime_vgem@fence-wait-bsd2.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv-switch:
    - shard-iclb:         [FAIL][69] ([IGT#28]) -> [SKIP][70] ([fdo#112080])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-iclb4/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4032/shard-iclb7/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html

  * igt@gem_ctx_persistence@vcs2-mixed:
    - shard-iclb:         [SKIP][71] ([fdo#109276] / [fdo#112080]) -> [SKIP][72] ([fdo#112080]) +10 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-iclb7/igt@gem_ctx_persistence@vcs2-mixed.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4032/shard-iclb4/igt@gem_ctx_persistence@vcs2-mixed.html

  * igt@gem_eio@in-flight-1us:
    - shard-apl:          [TIMEOUT][73] ([fdo#112271]) -> [INCOMPLETE][74] ([CI#80] / [fdo#103927])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-apl6/igt@gem_eio@in-flight-1us.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4032/shard-apl3/igt@gem_eio@in-flight-1us.html

  * igt@gem_tiled_blits@interruptible:
    - shard-hsw:          [FAIL][75] ([i915#694]) -> [FAIL][76] ([i915#818])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7838/shard-hsw1/igt@gem_tiled_blits@interruptible.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4032/shard-hsw2/igt@gem_tiled_blits@interruptible.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#247]: https://gitlab.freedesktop.org/drm/intel/issues/247
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#44]: https://gitlab.freedesktop.org/drm/intel/issues/44
  [i915#520]: https://gitlab.freedesktop.org/drm/intel/issues/520
  [i915#57]: https://gitlab.freedesktop.org/drm/intel/issues/57
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#831]: https://gitlab.freedesktop.org/drm/intel/issues/831


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5404 -> IGTPW_4032
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7838: d3d96beea538c8de906a1c4d7e6793a47d17a471 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4032: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4032/index.html
  IGT_5404: 4147bab8e3dcaf11bd657b5fb4c109708e94e60c @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4032/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
