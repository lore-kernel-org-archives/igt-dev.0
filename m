Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 27 Jan 2020 13:49:25 -0000
Message-ID: <158013296515.9685.15271400826003180632@emeril.freedesktop.org>
References: <20200124211819.1796-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20200124211819.1796-1-vinay.belgaumkar@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fmmap=5Fwc=3A_Skip_gtt_test_if_aperture_is_missing?=
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

Series: tests/i915/gem_mmap_wc: Skip gtt test if aperture is missing
URL   : https://patchwork.freedesktop.org/series/72553/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7811_full -> IGTPW_3994_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_3994_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_3994_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3994/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_3994_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_ctx_exec@basic-nohangcheck:
    - shard-iclb:         [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7811/shard-iclb7/igt@gem_ctx_exec@basic-nohangcheck.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3994/shard-iclb2/igt@gem_ctx_exec@basic-nohangcheck.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-display:
    - shard-hsw:          [PASS][3] -> [FAIL][4] +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7811/shard-hsw6/igt@gem_partial_pwrite_pread@writes-after-reads-display.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3994/shard-hsw6/igt@gem_partial_pwrite_pread@writes-after-reads-display.html

  
Known issues
------------

  Here are the changes found in IGTPW_3994_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@vcs1-queued:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#109276] / [fdo#112080]) +4 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7811/shard-iclb4/igt@gem_ctx_persistence@vcs1-queued.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3994/shard-iclb3/igt@gem_ctx_persistence@vcs1-queued.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#110854])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7811/shard-iclb4/igt@gem_exec_balancer@smoke.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3994/shard-iclb6/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_schedule@independent-bsd2:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#109276]) +13 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7811/shard-iclb2/igt@gem_exec_schedule@independent-bsd2.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3994/shard-iclb7/igt@gem_exec_schedule@independent-bsd2.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([fdo#112146]) +5 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7811/shard-iclb8/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3994/shard-iclb1/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gen7_exec_parse@basic-offset:
    - shard-hsw:          [PASS][13] -> [FAIL][14] ([i915#694])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7811/shard-hsw1/igt@gen7_exec_parse@basic-offset.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3994/shard-hsw5/igt@gen7_exec_parse@basic-offset.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions:
    - shard-snb:          [PASS][15] -> [SKIP][16] ([fdo#109271]) +2 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7811/shard-snb5/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3994/shard-snb2/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [PASS][17] -> [SKIP][18] ([fdo#109441]) +3 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7811/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3994/shard-iclb6/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][19] -> [FAIL][20] ([i915#31])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7811/shard-apl3/igt@kms_setmode@basic.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3994/shard-apl6/igt@kms_setmode@basic.html
    - shard-kbl:          [PASS][21] -> [FAIL][22] ([i915#31])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7811/shard-kbl2/igt@kms_setmode@basic.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3994/shard-kbl2/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-b-ts-continuation-suspend:
    - shard-apl:          [PASS][23] -> [DMESG-WARN][24] ([i915#180])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7811/shard-apl1/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3994/shard-apl4/igt@kms_vblank@pipe-b-ts-continuation-suspend.html

  * igt@kms_vblank@pipe-c-ts-continuation-suspend:
    - shard-kbl:          [PASS][25] -> [DMESG-WARN][26] ([i915#180])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7811/shard-kbl2/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3994/shard-kbl3/igt@kms_vblank@pipe-c-ts-continuation-suspend.html

  * igt@perf@short-reads:
    - shard-apl:          [PASS][27] -> [TIMEOUT][28] ([fdo#112271] / [i915#51])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7811/shard-apl2/igt@perf@short-reads.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3994/shard-apl3/igt@perf@short-reads.html

  * igt@perf_pmu@busy-no-semaphores-vcs1:
    - shard-iclb:         [PASS][29] -> [SKIP][30] ([fdo#112080]) +8 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7811/shard-iclb4/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3994/shard-iclb7/igt@perf_pmu@busy-no-semaphores-vcs1.html

  * igt@prime_mmap_coherency@ioctl-errors:
    - shard-hsw:          [PASS][31] -> [FAIL][32] ([i915#831])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7811/shard-hsw2/igt@prime_mmap_coherency@ioctl-errors.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3994/shard-hsw2/igt@prime_mmap_coherency@ioctl-errors.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@vcs1-mixed-process:
    - shard-iclb:         [SKIP][33] ([fdo#109276] / [fdo#112080]) -> [PASS][34] +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7811/shard-iclb3/igt@gem_ctx_persistence@vcs1-mixed-process.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3994/shard-iclb4/igt@gem_ctx_persistence@vcs1-mixed-process.html

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [SKIP][35] ([fdo#112080]) -> [PASS][36] +11 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7811/shard-iclb6/igt@gem_exec_parallel@vcs1-fds.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3994/shard-iclb1/igt@gem_exec_parallel@vcs1-fds.html

  * igt@gem_exec_schedule@preempt-contexts-bsd2:
    - shard-iclb:         [SKIP][37] ([fdo#109276]) -> [PASS][38] +16 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7811/shard-iclb7/igt@gem_exec_schedule@preempt-contexts-bsd2.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3994/shard-iclb2/igt@gem_exec_schedule@preempt-contexts-bsd2.html

  * igt@gem_exec_schedule@preempt-queue-bsd:
    - shard-iclb:         [SKIP][39] ([fdo#112146]) -> [PASS][40] +3 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7811/shard-iclb1/igt@gem_exec_schedule@preempt-queue-bsd.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3994/shard-iclb8/igt@gem_exec_schedule@preempt-queue-bsd.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-snb:          [DMESG-WARN][41] ([fdo#111870] / [i915#478]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7811/shard-snb5/igt@gem_userptr_blits@dmabuf-unsync.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3994/shard-snb2/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][43] ([i915#454]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7811/shard-iclb4/igt@i915_pm_dc@dc6-psr.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3994/shard-iclb4/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_selftest@live_blt:
    - shard-hsw:          [DMESG-FAIL][45] ([i915#553] / [i915#725]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7811/shard-hsw1/igt@i915_selftest@live_blt.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3994/shard-hsw5/igt@i915_selftest@live_blt.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][47] ([i915#180]) -> [PASS][48] +3 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7811/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3994/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-b-cursor-128x42-onscreen:
    - shard-kbl:          [FAIL][49] ([i915#54]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7811/shard-kbl6/igt@kms_cursor_crc@pipe-b-cursor-128x42-onscreen.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3994/shard-kbl1/igt@kms_cursor_crc@pipe-b-cursor-128x42-onscreen.html
    - shard-apl:          [FAIL][51] ([i915#54]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7811/shard-apl8/igt@kms_cursor_crc@pipe-b-cursor-128x42-onscreen.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3994/shard-apl1/igt@kms_cursor_crc@pipe-b-cursor-128x42-onscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-apl:          [DMESG-WARN][53] ([i915#180]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7811/shard-apl4/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3994/shard-apl7/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-hsw:          [INCOMPLETE][55] ([i915#61]) -> [PASS][56] +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7811/shard-hsw7/igt@kms_flip@flip-vs-suspend-interruptible.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3994/shard-hsw6/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-iclb:         [INCOMPLETE][57] ([i915#140] / [i915#250]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7811/shard-iclb8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3994/shard-iclb7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [FAIL][59] ([i915#173]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7811/shard-iclb1/igt@kms_psr@no_drrs.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3994/shard-iclb8/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][61] ([fdo#109441]) -> [PASS][62] +2 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7811/shard-iclb4/igt@kms_psr@psr2_sprite_plane_move.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3994/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv-switch:
    - shard-iclb:         [SKIP][63] ([fdo#109276] / [fdo#112080]) -> [FAIL][64] ([IGT#28])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7811/shard-iclb3/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3994/shard-iclb4/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html

  * igt@gem_tiled_blits@interruptible:
    - shard-hsw:          [FAIL][65] ([i915#694]) -> [FAIL][66] ([i915#818])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7811/shard-hsw1/igt@gem_tiled_blits@interruptible.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3994/shard-hsw2/igt@gem_tiled_blits@interruptible.html

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-snb:          [DMESG-WARN][67] ([fdo#110789] / [fdo#111870] / [i915#478]) -> [DMESG-WARN][68] ([fdo#111870] / [i915#478])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7811/shard-snb1/igt@gem_userptr_blits@sync-unmap-cycles.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3994/shard-snb4/igt@gem_userptr_blits@sync-unmap-cycles.html

  * igt@i915_pm_rpm@universal-planes-dpms:
    - shard-snb:          [SKIP][69] ([fdo#109271]) -> [INCOMPLETE][70] ([i915#82])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7811/shard-snb5/igt@i915_pm_rpm@universal-planes-dpms.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3994/shard-snb5/igt@i915_pm_rpm@universal-planes-dpms.html

  
  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#250]: https://gitlab.freedesktop.org/drm/intel/issues/250
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#51]: https://gitlab.freedesktop.org/drm/intel/issues/51
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#553]: https://gitlab.freedesktop.org/drm/intel/issues/553
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#831]: https://gitlab.freedesktop.org/drm/intel/issues/831


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5384 -> IGTPW_3994
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7811: f528982f5c837f075e82ca544df010ca5183064a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3994: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3994/index.html
  IGT_5384: fd6896567f7d612c76207970376d4f1e634ded55 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3994/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
