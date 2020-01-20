Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 20 Jan 2020 17:00:33 -0000
Message-ID: <157953963347.682.18423697153467198195@emeril.freedesktop.org>
References: <20200117181925.3249942-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200117181925.3249942-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/5=5D_lib/intel=5Fbufops=3A_Introduc?=
 =?utf-8?q?e_buffer_operations?=
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

Series: series starting with [i-g-t,1/5] lib/intel_bufops: Introduce buffer operations
URL   : https://patchwork.freedesktop.org/series/72212/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7767_full -> IGTPW_3937_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3937/index.html

Known issues
------------

  Here are the changes found in IGTPW_3937_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@vcs1-reset:
    - shard-iclb:         [PASS][1] -> [SKIP][2] ([fdo#109276] / [fdo#112080]) +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7767/shard-iclb4/igt@gem_ctx_isolation@vcs1-reset.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3937/shard-iclb6/igt@gem_ctx_isolation@vcs1-reset.html

  * igt@gem_ctx_persistence@vecs0-mixed-process:
    - shard-apl:          [PASS][3] -> [FAIL][4] ([i915#679])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7767/shard-apl2/igt@gem_ctx_persistence@vecs0-mixed-process.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3937/shard-apl8/igt@gem_ctx_persistence@vecs0-mixed-process.html

  * igt@gem_exec_async@concurrent-writes-bsd:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#112146]) +5 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7767/shard-iclb6/igt@gem_exec_async@concurrent-writes-bsd.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3937/shard-iclb1/igt@gem_exec_async@concurrent-writes-bsd.html

  * igt@gem_exec_balancer@hang:
    - shard-iclb:         [PASS][7] -> [INCOMPLETE][8] ([i915#140])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7767/shard-iclb6/igt@gem_exec_balancer@hang.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3937/shard-iclb4/igt@gem_exec_balancer@hang.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([i915#677]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7767/shard-iclb5/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3937/shard-iclb1/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_persistent_relocs@forked-thrashing:
    - shard-iclb:         [PASS][11] -> [TIMEOUT][12] ([fdo#112271] / [i915#530])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7767/shard-iclb4/igt@gem_persistent_relocs@forked-thrashing.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3937/shard-iclb6/igt@gem_persistent_relocs@forked-thrashing.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-apl:          [PASS][13] -> [DMESG-WARN][14] ([i915#180])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7767/shard-apl4/igt@gem_workarounds@suspend-resume-context.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3937/shard-apl4/igt@gem_workarounds@suspend-resume-context.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-kbl:          [PASS][15] -> [DMESG-WARN][16] ([i915#180]) +2 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7767/shard-kbl1/igt@gem_workarounds@suspend-resume-fd.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3937/shard-kbl3/igt@gem_workarounds@suspend-resume-fd.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-kbl:          [PASS][17] -> [FAIL][18] ([i915#49])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7767/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3937/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
    - shard-apl:          [PASS][19] -> [FAIL][20] ([i915#49])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7767/shard-apl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3937/shard-apl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [PASS][21] -> [SKIP][22] ([fdo#109441]) +2 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7767/shard-iclb2/igt@kms_psr@psr2_no_drrs.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3937/shard-iclb6/igt@kms_psr@psr2_no_drrs.html

  * igt@perf_pmu@busy-vcs1:
    - shard-iclb:         [PASS][23] -> [SKIP][24] ([fdo#112080]) +11 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7767/shard-iclb1/igt@perf_pmu@busy-vcs1.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3937/shard-iclb8/igt@perf_pmu@busy-vcs1.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [PASS][25] -> [SKIP][26] ([fdo#109276]) +17 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7767/shard-iclb1/igt@prime_busy@hang-bsd2.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3937/shard-iclb8/igt@prime_busy@hang-bsd2.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@vcs1-clean:
    - shard-iclb:         [SKIP][27] ([fdo#109276] / [fdo#112080]) -> [PASS][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7767/shard-iclb8/igt@gem_ctx_isolation@vcs1-clean.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3937/shard-iclb1/igt@gem_ctx_isolation@vcs1-clean.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [SKIP][29] ([fdo#110841]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7767/shard-iclb4/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3937/shard-iclb5/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_schedule@out-order-bsd2:
    - shard-iclb:         [SKIP][31] ([fdo#109276]) -> [PASS][32] +18 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7767/shard-iclb8/igt@gem_exec_schedule@out-order-bsd2.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3937/shard-iclb1/igt@gem_exec_schedule@out-order-bsd2.html

  * igt@gem_exec_schedule@pi-userfault-bsd:
    - shard-iclb:         [SKIP][33] ([i915#677]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7767/shard-iclb4/igt@gem_exec_schedule@pi-userfault-bsd.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3937/shard-iclb6/igt@gem_exec_schedule@pi-userfault-bsd.html

  * igt@gem_exec_schedule@reorder-wide-bsd:
    - shard-iclb:         [SKIP][35] ([fdo#112146]) -> [PASS][36] +7 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7767/shard-iclb2/igt@gem_exec_schedule@reorder-wide-bsd.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3937/shard-iclb6/igt@gem_exec_schedule@reorder-wide-bsd.html

  * igt@gem_persistent_relocs@forked-interruptible-thrashing:
    - shard-apl:          [TIMEOUT][37] ([fdo#112271] / [i915#530]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7767/shard-apl8/igt@gem_persistent_relocs@forked-interruptible-thrashing.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3937/shard-apl4/igt@gem_persistent_relocs@forked-interruptible-thrashing.html
    - shard-kbl:          [TIMEOUT][39] ([fdo#112271] / [i915#530]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7767/shard-kbl1/igt@gem_persistent_relocs@forked-interruptible-thrashing.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3937/shard-kbl1/igt@gem_persistent_relocs@forked-interruptible-thrashing.html

  * igt@gem_persistent_relocs@forked-thrashing:
    - shard-kbl:          [INCOMPLETE][41] ([fdo#103665] / [i915#530]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7767/shard-kbl6/igt@gem_persistent_relocs@forked-thrashing.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3937/shard-kbl7/igt@gem_persistent_relocs@forked-thrashing.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [FAIL][43] ([i915#644]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7767/shard-glk9/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3937/shard-glk7/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-snb:          [DMESG-WARN][45] ([fdo#111870] / [i915#478]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7767/shard-snb6/igt@gem_userptr_blits@sync-unmap-cycles.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3937/shard-snb5/igt@gem_userptr_blits@sync-unmap-cycles.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [DMESG-WARN][47] ([i915#716]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7767/shard-glk4/igt@gen9_exec_parse@allowed-all.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3937/shard-glk4/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][49] ([i915#454]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7767/shard-iclb4/igt@i915_pm_dc@dc6-psr.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3937/shard-iclb2/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][51] ([i915#180]) -> [PASS][52] +3 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7767/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3937/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-apl:          [DMESG-WARN][53] ([i915#180]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7767/shard-apl6/igt@kms_flip@flip-vs-suspend-interruptible.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3937/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:
    - shard-glk:          [FAIL][55] ([i915#49]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7767/shard-glk1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3937/shard-glk1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [SKIP][57] ([fdo#109642] / [fdo#111068]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7767/shard-iclb5/igt@kms_psr2_su@page_flip.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3937/shard-iclb2/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_suspend:
    - shard-iclb:         [SKIP][59] ([fdo#109441]) -> [PASS][60] +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7767/shard-iclb5/igt@kms_psr@psr2_suspend.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3937/shard-iclb2/igt@kms_psr@psr2_suspend.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][61] ([i915#31]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7767/shard-apl8/igt@kms_setmode@basic.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3937/shard-apl4/igt@kms_setmode@basic.html

  * igt@perf_pmu@busy-accuracy-2-vcs1:
    - shard-iclb:         [SKIP][63] ([fdo#112080]) -> [PASS][64] +5 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7767/shard-iclb6/igt@perf_pmu@busy-accuracy-2-vcs1.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3937/shard-iclb4/igt@perf_pmu@busy-accuracy-2-vcs1.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [FAIL][65] ([IGT#28]) -> [SKIP][66] ([fdo#109276] / [fdo#112080]) +1 similar issue
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7767/shard-iclb4/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3937/shard-iclb5/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@i915_pm_rpm@modeset-non-lpsp:
    - shard-snb:          [SKIP][67] ([fdo#109271]) -> [INCOMPLETE][68] ([i915#82])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7767/shard-snb2/igt@i915_pm_rpm@modeset-non-lpsp.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3937/shard-snb5/igt@i915_pm_rpm@modeset-non-lpsp.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [DMESG-WARN][69] ([i915#180]) -> [INCOMPLETE][70] ([fdo#103665])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7767/shard-kbl7/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3937/shard-kbl2/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  
  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#530]: https://gitlab.freedesktop.org/drm/intel/issues/530
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
  * IGT: IGT_5371 -> IGTPW_3937
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7767: dc447e46590410adce9a6fc6b19dbf02f1ba4ab4 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3937: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3937/index.html
  IGT_5371: 1b2816124ec3dbd53b81725d39292f45d41d895b @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3937/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
