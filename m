Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 20 Jan 2020 16:51:43 -0000
Message-ID: <157953910396.680.1339258999064322137@emeril.freedesktop.org>
References: <20200117181418.18755-1-jose.souza@intel.com>
In-Reply-To: <20200117181418.18755-1-jose.souza@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_lib=3A_Add_support_to_connecto?=
 =?utf-8?q?r_path_property?=
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
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,1/2] lib: Add support to connector path property
URL   : https://patchwork.freedesktop.org/series/72211/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7767_full -> IGTPW_3936_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3936/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_3936_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_mst@fullmodeset_master} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][1] +3 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3936/shard-iclb2/igt@kms_mst@fullmodeset_master.html

  
New tests
---------

  New tests have been introduced between CI_DRM_7767_full and IGTPW_3936_full:

### New IGT tests (4) ###

  * igt@kms_mst@all_enabled:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_mst@change_master:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_mst@change_resolution:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_mst@fullmodeset_master:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_3936_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@vcs0-mixed-process:
    - shard-glk:          [PASS][2] -> [FAIL][3] ([i915#679]) +1 similar issue
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7767/shard-glk7/igt@gem_ctx_persistence@vcs0-mixed-process.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3936/shard-glk5/igt@gem_ctx_persistence@vcs0-mixed-process.html

  * igt@gem_ctx_persistence@vcs1-mixed-process:
    - shard-iclb:         [PASS][4] -> [SKIP][5] ([fdo#109276] / [fdo#112080]) +6 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7767/shard-iclb1/igt@gem_ctx_persistence@vcs1-mixed-process.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3936/shard-iclb8/igt@gem_ctx_persistence@vcs1-mixed-process.html

  * igt@gem_eio@in-flight-contexts-10ms:
    - shard-snb:          [PASS][6] -> [FAIL][7] ([i915#490])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7767/shard-snb6/igt@gem_eio@in-flight-contexts-10ms.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3936/shard-snb5/igt@gem_eio@in-flight-contexts-10ms.html

  * igt@gem_exec_balancer@hang:
    - shard-iclb:         [PASS][8] -> [INCOMPLETE][9] ([i915#140])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7767/shard-iclb6/igt@gem_exec_balancer@hang.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3936/shard-iclb4/igt@gem_exec_balancer@hang.html

  * igt@gem_exec_schedule@preempt-bsd:
    - shard-iclb:         [PASS][10] -> [SKIP][11] ([fdo#112146]) +2 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7767/shard-iclb8/igt@gem_exec_schedule@preempt-bsd.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3936/shard-iclb4/igt@gem_exec_schedule@preempt-bsd.html

  * igt@gem_persistent_relocs@forked-faulting-reloc-thrashing:
    - shard-kbl:          [PASS][12] -> [INCOMPLETE][13] ([fdo#103665] / [i915#530])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7767/shard-kbl4/igt@gem_persistent_relocs@forked-faulting-reloc-thrashing.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3936/shard-kbl4/igt@gem_persistent_relocs@forked-faulting-reloc-thrashing.html

  * igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing:
    - shard-apl:          [PASS][14] -> [TIMEOUT][15] ([fdo#112271] / [i915#530]) +1 similar issue
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7767/shard-apl1/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3936/shard-apl4/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html

  * igt@gem_persistent_relocs@forked-interruptible-thrash-inactive:
    - shard-kbl:          [PASS][16] -> [TIMEOUT][17] ([fdo#112271] / [i915#530]) +1 similar issue
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7767/shard-kbl2/igt@gem_persistent_relocs@forked-interruptible-thrash-inactive.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3936/shard-kbl3/igt@gem_persistent_relocs@forked-interruptible-thrash-inactive.html

  * igt@i915_pm_rps@waitboost:
    - shard-iclb:         [PASS][18] -> [FAIL][19] ([i915#413])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7767/shard-iclb2/igt@i915_pm_rps@waitboost.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3936/shard-iclb2/igt@i915_pm_rps@waitboost.html

  * igt@i915_suspend@forcewake:
    - shard-kbl:          [PASS][20] -> [DMESG-WARN][21] ([i915#180]) +4 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7767/shard-kbl3/igt@i915_suspend@forcewake.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3936/shard-kbl6/igt@i915_suspend@forcewake.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-gtt:
    - shard-snb:          [PASS][22] -> [DMESG-WARN][23] ([i915#478])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7767/shard-snb4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-gtt.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3936/shard-snb2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-apl:          [PASS][24] -> [DMESG-WARN][25] ([i915#180]) +2 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7767/shard-apl2/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3936/shard-apl1/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [PASS][26] -> [SKIP][27] ([fdo#109441]) +3 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7767/shard-iclb2/igt@kms_psr@psr2_no_drrs.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3936/shard-iclb1/igt@kms_psr@psr2_no_drrs.html

  * igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend:
    - shard-kbl:          [PASS][28] -> [DMESG-WARN][29] ([i915#56])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7767/shard-kbl2/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3936/shard-kbl2/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html

  * igt@perf_pmu@busy-no-semaphores-vcs1:
    - shard-iclb:         [PASS][30] -> [SKIP][31] ([fdo#112080]) +11 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7767/shard-iclb1/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3936/shard-iclb6/igt@perf_pmu@busy-no-semaphores-vcs1.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [PASS][32] -> [SKIP][33] ([fdo#109276]) +15 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7767/shard-iclb2/igt@prime_vgem@fence-wait-bsd2.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3936/shard-iclb6/igt@prime_vgem@fence-wait-bsd2.html

  
#### Possible fixes ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [SKIP][34] ([fdo#112080]) -> [PASS][35] +6 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7767/shard-iclb6/igt@gem_busy@busy-vcs1.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3936/shard-iclb4/igt@gem_busy@busy-vcs1.html

  * igt@gem_ctx_persistence@vcs1-queued:
    - shard-iclb:         [SKIP][36] ([fdo#109276] / [fdo#112080]) -> [PASS][37] +1 similar issue
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7767/shard-iclb5/igt@gem_ctx_persistence@vcs1-queued.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3936/shard-iclb4/igt@gem_ctx_persistence@vcs1-queued.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [SKIP][38] ([fdo#110854]) -> [PASS][39]
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7767/shard-iclb5/igt@gem_exec_balancer@smoke.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3936/shard-iclb2/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_schedule@pi-userfault-bsd:
    - shard-iclb:         [SKIP][40] ([i915#677]) -> [PASS][41]
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7767/shard-iclb4/igt@gem_exec_schedule@pi-userfault-bsd.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3936/shard-iclb6/igt@gem_exec_schedule@pi-userfault-bsd.html

  * igt@gem_exec_schedule@preempt-contexts-bsd2:
    - shard-iclb:         [SKIP][42] ([fdo#109276]) -> [PASS][43] +16 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7767/shard-iclb5/igt@gem_exec_schedule@preempt-contexts-bsd2.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3936/shard-iclb1/igt@gem_exec_schedule@preempt-contexts-bsd2.html

  * igt@gem_exec_schedule@wide-bsd:
    - shard-iclb:         [SKIP][44] ([fdo#112146]) -> [PASS][45] +6 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7767/shard-iclb1/igt@gem_exec_schedule@wide-bsd.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3936/shard-iclb5/igt@gem_exec_schedule@wide-bsd.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-kbl:          [DMESG-WARN][46] ([i915#180]) -> [PASS][47] +2 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7767/shard-kbl2/igt@gem_exec_suspend@basic-s3.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3936/shard-kbl2/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_persistent_relocs@forked-interruptible-thrashing:
    - shard-kbl:          [TIMEOUT][48] ([fdo#112271] / [i915#530]) -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7767/shard-kbl1/igt@gem_persistent_relocs@forked-interruptible-thrashing.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3936/shard-kbl2/igt@gem_persistent_relocs@forked-interruptible-thrashing.html

  * igt@gem_persistent_relocs@forked-thrashing:
    - shard-hsw:          [INCOMPLETE][50] ([i915#530] / [i915#61]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7767/shard-hsw5/igt@gem_persistent_relocs@forked-thrashing.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3936/shard-hsw2/igt@gem_persistent_relocs@forked-thrashing.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [FAIL][52] ([i915#644]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7767/shard-glk9/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3936/shard-glk4/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-snb:          [DMESG-WARN][54] ([fdo#111870] / [i915#478]) -> [PASS][55] +1 similar issue
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7767/shard-snb6/igt@gem_userptr_blits@sync-unmap-cycles.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3936/shard-snb4/igt@gem_userptr_blits@sync-unmap-cycles.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [DMESG-WARN][56] ([i915#716]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7767/shard-glk4/igt@gen9_exec_parse@allowed-all.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3936/shard-glk2/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][58] ([i915#454]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7767/shard-iclb4/igt@i915_pm_dc@dc6-psr.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3936/shard-iclb1/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:
    - shard-glk:          [FAIL][60] ([i915#49]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7767/shard-glk1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3936/shard-glk4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-apl:          [DMESG-WARN][62] ([i915#180]) -> [PASS][63] +1 similar issue
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7767/shard-apl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3936/shard-apl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [SKIP][64] ([fdo#109642] / [fdo#111068]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7767/shard-iclb5/igt@kms_psr2_su@page_flip.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3936/shard-iclb2/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_cursor_blt:
    - shard-iclb:         [SKIP][66] ([fdo#109441]) -> [PASS][67] +1 similar issue
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7767/shard-iclb4/igt@kms_psr@psr2_cursor_blt.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3936/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html

  
#### Warnings ####

  * igt@gem_eio@kms:
    - shard-snb:          [INCOMPLETE][68] ([i915#82]) -> [DMESG-WARN][69] ([i915#443] / [i915#444])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7767/shard-snb1/igt@gem_eio@kms.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3936/shard-snb1/igt@gem_eio@kms.html

  * igt@gem_userptr_blits@sync-unmap:
    - shard-snb:          [DMESG-WARN][70] ([fdo#111870] / [i915#478]) -> [DMESG-WARN][71] ([fdo#110789] / [fdo#111870] / [i915#478])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7767/shard-snb4/igt@gem_userptr_blits@sync-unmap.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3936/shard-snb6/igt@gem_userptr_blits@sync-unmap.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#443]: https://gitlab.freedesktop.org/drm/intel/issues/443
  [i915#444]: https://gitlab.freedesktop.org/drm/intel/issues/444
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#490]: https://gitlab.freedesktop.org/drm/intel/issues/490
  [i915#530]: https://gitlab.freedesktop.org/drm/intel/issues/530
  [i915#56]: https://gitlab.freedesktop.org/drm/intel/issues/56
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#679]: https://gitlab.freedesktop.org/drm/intel/issues/679
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5371 -> IGTPW_3936
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7767: dc447e46590410adce9a6fc6b19dbf02f1ba4ab4 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3936: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3936/index.html
  IGT_5371: 1b2816124ec3dbd53b81725d39292f45d41d895b @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3936/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
